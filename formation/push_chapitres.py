# -*- coding: utf-8 -*-
"""
Produit supabase/sql/009_formation_contenu.sql a partir des sources des parcours.

On genere du SQL plutot que d'appeler l'API : pas de cle service_role a manipuler,
et la migration se rejoue comme les autres. A relancer apres toute modification
de formation/contenu*/, puis executer le fichier dans Supabase.

  python formation/push_chapitres.py
"""
import glob, io, os, re

RACINE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SORTIE = os.path.join(RACINE, "supabase", "sql", "009_formation_contenu.sql")

PARCOURS = [("debutant", "contenu"), ("intermediaire", "contenu-inter"),
            ("experimente", "contenu-experimente")]


def blocs(chemin):
    brut = io.open(chemin, encoding="utf-8").read()
    for morceau in re.split(r"\n\s*\n", brut):
        lignes = [l.rstrip() for l in morceau.strip("\n").split("\n") if l.strip()]
        if not lignes:
            continue
        m = re.match(r"^([A-Z0-9_]+):\s?(.*)$", lignes[0])
        yield (m.group(1), m.group(2), lignes[1:]) if m else ("P", "", lignes)


def echapper(t):
    return t.replace("'", "''")


def chapitres_du_module(chemin):
    """Decoupe un fichier module en chapitres, corps balise conserve tel quel."""
    numero_module, courant, sortie = None, None, []

    def fermer():
        if courant and courant["corps"]:
            sortie.append({"numero": courant["numero"], "titre": courant["titre"],
                           "corps": "\n\n".join(courant["corps"]).strip()})

    for tag, tete, corps in blocs(chemin):
        if tag == "MOD":
            numero_module = int(tete.split("|")[0].strip())
            continue
        if tag == "H2":
            fermer()
            m = re.match(r"^(\d+\.\d+)\s+(.*)$", tete.strip())
            courant = {"numero": m.group(1), "titre": m.group(2), "corps": []} if m else None
            continue
        if tag == "EX":
            fermer()
            courant = {"numero": "EX", "titre": tete.strip(), "corps": []}
            continue
        if courant is not None:
            ligne = "%s: %s" % (tag, tete) if tete else tag + ":"
            courant["corps"].append("\n".join([ligne] + corps) if corps else ligne)
    fermer()
    return numero_module, sortie


def main():
    lignes = [
        "-- ============ CONTENU DES CHAPITRES ============",
        "-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.",
        "-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py",
        "-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.",
        "",
        "begin;",
        "delete from public.formation_chapitres;",
        "",
    ]
    total = 0
    for slug, dossier in PARCOURS:
        ordre = 0
        for f in sorted(glob.glob(os.path.join(RACINE, "formation", dossier, "0[1-6]_*.txt"))):
            num_mod, chaps = chapitres_du_module(f)
            for c in chaps:
                ordre += 1
                total += 1
                lignes.append(
                    "insert into public.formation_chapitres "
                    "(parcours, module, numero, titre, corps, ordre) values\n"
                    "  ('%s', %d, '%s', '%s', '%s', %d);"
                    % (slug, num_mod, echapper(c["numero"]), echapper(c["titre"]),
                       echapper(c["corps"]), ordre))
        lignes.append("")
    lignes += ["commit;", ""]

    os.makedirs(os.path.dirname(SORTIE), exist_ok=True)
    io.open(SORTIE, "w", encoding="utf-8").write("\n".join(lignes))
    print("%d chapitres ecrits" % total)
    print("%s  (%.0f Ko)" % (SORTIE, os.path.getsize(SORTIE) / 1024))


if __name__ == "__main__":
    main()
