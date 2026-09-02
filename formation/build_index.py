# -*- coding: utf-8 -*-
"""Genere data/formation-index.js a partir des dossiers formation/contenu*/.

L'index ne contient que des metadonnees publiques : titres de modules et de
chapitres, durees, objectifs, intitules d'exercices. Le TEXTE des chapitres
n'y figure pas — il vient de Supabase sous RLS, apres verification de
l'abonnement. Rien ici ne doit etre recopie a la main : la seule source de
verite reste les fichiers .txt des parcours.

Usage : python build_index.py [--check]
  --check : ne reecrit rien, signale seulement les incoherences.
"""

import io
import json
import os
import re
import sys
from datetime import date

HERE = os.path.dirname(os.path.abspath(__file__))
RACINE = os.path.dirname(HERE)
SORTIE = os.path.join(RACINE, "data", "formation-index.js")

# id | nom affiche | dossier source | page du niveau | pdf
PARCOURS = [
    ("debutant", "Débutant", "contenu",
     "niveaux/debutant.html", "formation/TapeSense_Parcours_Debutant.pdf"),
    ("intermediaire", "Intermédiaire", "contenu-inter",
     "niveaux/intermediaire.html", "formation/TapeSense_Parcours_Intermediaire.pdf"),
    ("experimente", "Expérimenté", "contenu-experimente",
     "niveaux/experimente.html", "formation/TapeSense_Parcours_Experimente.pdf"),
]

alertes = []


def signaler(msg):
    alertes.append(msg)
    sys.stderr.write("  ! %s\n" % msg)


def lire(chemin):
    with io.open(chemin, encoding="utf-8") as f:
        return f.read()


def nettoyer(txt):
    """Retire le balisage inline du format source (gras, italique)."""
    txt = re.sub(r"\*\*(.+?)\*\*", r"\1", txt)
    txt = re.sub(r"\*(.+?)\*", r"\1", txt)
    return txt.strip()


def accroche(dossier):
    """Les lignes de la couverture, dans 00_ouverture.txt."""
    brut = lire(os.path.join(HERE, dossier, "00_ouverture.txt"))
    bloc = re.search(r"^COUV:.*$\n((?:.+\n?)*)", brut, re.M)
    if not bloc:
        signaler("%s : pas de bloc COUV dans 00_ouverture.txt" % dossier)
        return ""
    lignes = [l.strip() for l in bloc.group(1).split("\n") if l.strip()]
    return nettoyer(" ".join(lignes))


def lire_module(chemin, dossier):
    brut = lire(chemin)
    fichier = os.path.basename(chemin)

    m = re.search(r"^MOD:\s*(.*)$", brut, re.M)
    if not m:
        signaler("%s/%s : pas de ligne MOD" % (dossier, fichier))
        return None
    champs = [c.strip() for c in m.group(1).split("|")]
    if len(champs) != 4:
        signaler("%s/%s : ligne MOD a %d champs au lieu de 4"
                 % (dossier, fichier, len(champs)))
        return None
    numero, titre, resume, duree = champs

    md = re.match(r"^(\d+)", duree)
    if not md:
        signaler("%s/%s : duree illisible (%r)" % (dossier, fichier, duree))
        return None
    minutes = int(md.group(1))

    # L'objectif est la premiere ligne du corps du bloc MOD.
    objectif = ""
    apres = brut[m.end():].lstrip("\n")
    premiere = apres.split("\n", 1)[0].strip()
    if premiere and not re.match(r"^[A-Z0-9_]+:", premiere):
        objectif = nettoyer(re.sub(r"^Objectif\s*:\s*", "", premiere))
    else:
        signaler("%s/%s : pas de ligne d'objectif sous MOD" % (dossier, fichier))

    chapitres = []
    for titre_h2 in re.findall(r"^H2:\s*(.+)$", brut, re.M):
        titre_h2 = nettoyer(titre_h2)
        mc = re.match(r"^(\d+\.\d+)\s+(.*)$", titre_h2)
        if mc:
            chapitres.append({"num": mc.group(1), "titre": mc.group(2).strip()})
        else:
            signaler("%s/%s : chapitre sans numerotation (%r)"
                     % (dossier, fichier, titre_h2))
            chapitres.append({"num": "", "titre": titre_h2})

    # Le sous-titre annonce un nombre de chapitres : il doit coller au reel.
    ma = re.search(r"(\d+)\s+chapitres?", resume)
    if ma and int(ma.group(1)) != len(chapitres):
        signaler("%s/%s : le sous-titre annonce %s chapitres, %d trouves"
                 % (dossier, fichier, ma.group(1), len(chapitres)))

    exercices = re.findall(r"^EX:\s*(.+)$", brut, re.M)
    if len(exercices) != 1:
        signaler("%s/%s : %d bloc(s) EX au lieu de 1"
                 % (dossier, fichier, len(exercices)))

    return {
        "n": int(numero),
        "titre": nettoyer(titre),
        "minutes": minutes,
        "objectif": objectif,
        "exercice": nettoyer(exercices[0]) if exercices else "",
        "chapitres": chapitres,
    }


def lire_parcours(pid, nom, dossier, page, pdf):
    chemin_dossier = os.path.join(HERE, dossier)
    if not os.path.isdir(chemin_dossier):
        signaler("dossier introuvable : %s" % dossier)
        return None

    fichiers = sorted(f for f in os.listdir(chemin_dossier)
                      if re.match(r"^0[1-9]_module\d+\.txt$", f))
    modules = []
    for f in fichiers:
        mod = lire_module(os.path.join(chemin_dossier, f), dossier)
        if mod:
            modules.append(mod)
    modules.sort(key=lambda m: m["n"])

    attendus = list(range(1, len(modules) + 1))
    if [m["n"] for m in modules] != attendus:
        signaler("%s : numerotation des modules non continue (%s)"
                 % (dossier, [m["n"] for m in modules]))

    return {
        "id": pid,
        "nom": nom,
        "accroche": accroche(dossier),
        "page": page,
        "pdf": pdf,
        "minutes": sum(m["minutes"] for m in modules),
        "nbModules": len(modules),
        "nbChapitres": sum(len(m["chapitres"]) for m in modules),
        "modules": modules,
    }


ENTETE = u"""// ============ INDEX DES PARCOURS DE FORMATION ============
// FICHIER GENERE — NE PAS MODIFIER A LA MAIN.
// Source   : formation/contenu/, contenu-inter/, contenu-experimente/
// Generateur : formation/build_index.py
// Regenerer  : python formation/build_index.py
// Genere le : %s
//
// Ce fichier ne contient QUE des metadonnees publiques : titres, durees,
// structure. Le texte des chapitres n'y est pas — il vient de Supabase sous
// RLS, apres verification de l'abonnement cote base.

const FORMATION_INDEX = %s;
"""


def main():
    check = "--check" in sys.argv

    parcours = []
    for args in PARCOURS:
        p = lire_parcours(*args)
        if p:
            parcours.append(p)

    index = {
        "genere": date.today().isoformat(),
        "minutes": sum(p["minutes"] for p in parcours),
        "nbChapitres": sum(p["nbChapitres"] for p in parcours),
        "parcours": parcours,
    }

    for p in parcours:
        print("%-14s %d modules · %2d chapitres · %d min"
              % (p["id"], p["nbModules"], p["nbChapitres"], p["minutes"]))
    print("%-14s %d chapitres · %d min au total"
          % ("TOTAL", index["nbChapitres"], index["minutes"]))

    if alertes:
        print("\n%d incoherence(s) — voir ci-dessus." % len(alertes))

    if check:
        return 1 if alertes else 0

    corps = json.dumps(index, ensure_ascii=False, indent=2)
    with io.open(SORTIE, "w", encoding="utf-8", newline="\n") as f:
        f.write(ENTETE % (index["genere"], corps))
    print("\necrit : %s" % os.path.relpath(SORTIE, RACINE))
    return 1 if alertes else 0


if __name__ == "__main__":
    sys.exit(main())
