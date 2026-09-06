# -*- coding: utf-8 -*-
"""
Genere data/formation-index.js a partir des sources des trois parcours.

Le site ne recopie jamais un titre ni une duree a la main : tout vient d'ici,
donc les pages ne peuvent pas diverger des PDF. A relancer apres toute
modification de formation/contenu*/.

  python formation/build_index.py
"""
import glob, io, json, os, re

RACINE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SORTIE = os.path.join(RACINE, "data", "formation-index.js")

PARCOURS = [
    {"slug": "debutant",     "src": "contenu",             "code": "LVL.01",
     "titre": "Debutant",     "page": "niveaux/debutant.html"},
    {"slug": "intermediaire", "src": "contenu-inter",      "code": "LVL.02",
     "titre": "Intermediaire", "page": "niveaux/intermediaire.html"},
    {"slug": "experimente",  "src": "contenu-experimente", "code": "LVL.03",
     "titre": "Experimente",  "page": "niveaux/experimente.html"},
]


def blocs(chemin):
    """Meme decoupage que render_formation.py : un bloc par paragraphe."""
    brut = io.open(chemin, encoding="utf-8").read()
    for morceau in re.split(r"\n\s*\n", brut):
        lignes = [l.rstrip() for l in morceau.strip("\n").split("\n") if l.strip()]
        if not lignes:
            continue
        m = re.match(r"^([A-Z0-9_]+):\s?(.*)$", lignes[0])
        if m:
            yield m.group(1), m.group(2), lignes[1:]
        else:
            yield "P", "", lignes


def lire_module(chemin):
    mod, objectif, chapitres, exercice = None, "", [], None
    for tag, tete, corps in blocs(chemin):
        if tag == "MOD":
            num, titre, meta, court = [x.strip() for x in tete.split("|")]
            mod = {"numero": int(num), "titre": titre, "meta": meta,
                   "minutes": int(re.search(r"\d+", court).group())}
            if corps:
                # 'Objectif :' en francais, 'Goal:' en anglais.
                objectif = re.sub(r"^(Objectif|Goal)\s*:\s*", "", corps[0]).strip()
        elif tag == "H2":
            m = re.match(r"^(\d+\.\d+)\s+(.*)$", tete.strip())
            if m:
                chapitres.append({"numero": m.group(1), "titre": m.group(2)})
        elif tag == "EX":
            exercice = tete.strip()
    if not mod:
        return None
    mod.update({"objectif": objectif, "chapitres": chapitres, "exercice": exercice})
    return mod


def lire_accroche(dossier):
    """Sous-titre de couverture, repris du bloc COUV de l'ouverture."""
    ouverture = os.path.join(dossier, "00_ouverture.txt")
    if os.path.exists(ouverture):
        for tag, tete, corps in blocs(ouverture):
            if tag == "COUV":
                return " ".join(corps).strip()
    return ""


def greffer_anglais(modules, dossier_en):
    """Ajoute les champs _en, depuis l'arbre anglais du parcours s'il existe.

    Les champs manquants restent absents : le site retombe alors sur le
    francais, plutot que d'afficher un trou.
    """
    if not os.path.isdir(dossier_en):
        return False
    par_numero = {}
    for f in sorted(glob.glob(os.path.join(dossier_en, "0[1-6]_*.txt"))):
        m = lire_module(f)
        if m:
            par_numero[m["numero"]] = m

    for mod in modules:
        en = par_numero.get(mod["numero"])
        if not en:
            continue
        mod["titre_en"] = en["titre"]
        mod["objectif_en"] = en["objectif"]
        if en["exercice"]:
            mod["exercice_en"] = en["exercice"]
        titres = dict((c["numero"], c["titre"]) for c in en["chapitres"])
        for c in mod["chapitres"]:
            if c["numero"] in titres:
                c["titre_en"] = titres[c["numero"]]
    return bool(par_numero)


def lire_parcours(p):
    dossier = os.path.join(RACINE, "formation", p["src"])
    modules = []
    for f in sorted(glob.glob(os.path.join(dossier, "0[1-6]_*.txt"))):
        m = lire_module(f)
        if m:
            modules.append(m)

    dossier_en = dossier + "-en"
    anglais = greffer_anglais(modules, dossier_en)

    data = {
        "slug": p["slug"], "code": p["code"], "page": p["page"],
        "accroche": lire_accroche(dossier),
        "modules": modules,
        "totalModules": len(modules),
        "totalChapitres": sum(len(m["chapitres"]) for m in modules),
        "totalExercices": sum(1 for m in modules if m["exercice"]),
        "minutes": sum(m["minutes"] for m in modules),
        "pdf": "formation/TapeSense_Parcours_%s.pdf" % {
            "debutant": "Debutant", "intermediaire": "Intermediaire",
            "experimente": "Experimente"}[p["slug"]],
    }

    if anglais:
        data["accroche_en"] = lire_accroche(dossier_en)
        data["langues"] = ["fr", "en"]

    return data


def main():
    data = [lire_parcours(p) for p in PARCOURS]
    os.makedirs(os.path.dirname(SORTIE), exist_ok=True)
    corps = json.dumps(data, ensure_ascii=False, indent=2)
    io.open(SORTIE, "w", encoding="utf-8").write(
        "// ============ INDEX DE LA FORMATION ============\n"
        "// GENERE AUTOMATIQUEMENT — ne pas modifier a la main.\n"
        "// Source : formation/contenu*/ · Regenerer : python formation/build_index.py\n"
        "// Les titres, durees et nombres de chapitres viennent des memes fichiers\n"
        "// que les PDF : les deux ne peuvent pas diverger.\n\n"
        "const FORMATION_INDEX = " + corps + ";\n")

    for p in data:
        print("%-14s %d modules · %2d chapitres · %d exercices · %d min · %s"
              % (p["slug"], p["totalModules"], p["totalChapitres"],
                 p["totalExercices"], p["minutes"],
                 " ".join(p.get("langues", ["fr"]))))
    print("\n%s  (%.1f Ko)" % (SORTIE, os.path.getsize(SORTIE) / 1024))


if __name__ == "__main__":
    main()
