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


ENTETE = [
    "-- ============ CONTENU DES CHAPITRES ============",
    "-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.",
    "-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py",
    "-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.",
]


def inserts(slug, dossier):
    out, ordre = [], 0
    for f in sorted(glob.glob(os.path.join(RACINE, "formation", dossier, "0[1-6]_*.txt"))):
        num_mod, chaps = chapitres_du_module(f)
        for c in chaps:
            ordre += 1
            out.append(
                "insert into public.formation_chapitres "
                "(parcours, module, numero, titre, corps, ordre) values\n"
                "  ('%s', %d, '%s', '%s', '%s', %d);"
                % (slug, num_mod, echapper(c["numero"]), echapper(c["titre"]),
                   echapper(c["corps"]), ordre))
    return out


def ecrire(chemin, lignes):
    os.makedirs(os.path.dirname(chemin), exist_ok=True)
    io.open(chemin, "w", encoding="utf-8").write("\n".join(lignes))
    return os.path.getsize(chemin) / 1024


def main():
    total, complet = 0, list(ENTETE) + ["", "begin;",
                                        "delete from public.formation_chapitres;", ""]
    dossier_sql = os.path.join(RACINE, "supabase", "sql")

    for i, (slug, dossier) in enumerate(PARCOURS, 1):
        lot = inserts(slug, dossier)
        total += len(lot)
        complet += lot + [""]

        # Un fichier par parcours : l'editeur SQL du tableau de bord Supabase
        # digere mal un collage de 250 Ko. Le premier vide la table, les
        # suivants completent — donc a executer dans l'ordre.
        part = list(ENTETE) + [
            "-- Partie %d sur %d : parcours %s." % (i, len(PARCOURS), slug),
            "-- A executer dans l'ordre : la partie 1 vide la table.",
            "", "begin;"]
        if i == 1:
            part.append("delete from public.formation_chapitres;")
        part += [""] + lot + ["", "commit;", ""]
        ko = ecrire(os.path.join(dossier_sql, "009_%d_contenu_%s.sql" % (i, slug)), part)
        print("  009_%d_contenu_%-14s %3d chapitres  %5.0f Ko" % (i, slug + ".sql", len(lot), ko))

    complet += ["commit;", ""]
    ko = ecrire(SORTIE, complet)
    print("\n  009_formation_contenu.sql (complet) %d chapitres  %.0f Ko" % (total, ko))


if __name__ == "__main__":
    main()
