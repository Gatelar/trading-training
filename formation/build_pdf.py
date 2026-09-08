# -*- coding: utf-8 -*-
"""
Produit les six PDF des parcours, dans les deux langues.

  python formation/build_pdf.py                 # les six
  python formation/build_pdf.py debutant        # un seul
  python formation/build_pdf.py fr              # les trois francais

Chaque entree ci-dessous fixe la source, le nom du fichier, le pied de page
et le colophon. Le reste de la mise en page est identique pour les six, et
vit dans render_formation.py.
"""
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
RENDU = os.path.join(HERE, "render_formation.py")

GENERIQUE_FR = ("Contenu pédagogique · Aucun conseil en investissement<br/>"
                "Intégralité du parcours en simulation, sans capital réel")
GENERIQUE_EN = ("Educational content · No investment advice<br/>"
                "Whole track in simulation, no real capital")

# Le parcours Experimente traite de l'argent reel : le colophon generique le
# contredirait des la couverture.
EXPERIMENTE_FR = ("Contenu pédagogique · Aucun conseil en investissement<br/>"
                  "Exercices en simulation · Aucun prestataire nommé<br/>"
                  "N'encourage pas le passage en argent réel · Capital à risque")
EXPERIMENTE_EN = ("Educational content · No investment advice<br/>"
                  "Exercises in simulation · No provider named<br/>"
                  "Does not encourage going live · Capital at risk")

PARCOURS = [
    ("debutant", "fr", "contenu", "TapeSense_Parcours_Debutant.pdf",
     "TapeSense — Parcours Débutant", GENERIQUE_FR),
    ("intermediaire", "fr", "contenu-inter", "TapeSense_Parcours_Intermediaire.pdf",
     "TapeSense — Parcours Intermédiaire", GENERIQUE_FR),
    ("experimente", "fr", "contenu-experimente", "TapeSense_Parcours_Experimente.pdf",
     "TapeSense — Parcours Expérimenté", EXPERIMENTE_FR),
    ("debutant", "en", "contenu-en", "TapeSense_Track_Beginner.pdf",
     "TapeSense — Beginner Track", GENERIQUE_EN),
    ("intermediaire", "en", "contenu-inter-en", "TapeSense_Track_Intermediate.pdf",
     "TapeSense — Intermediate Track", GENERIQUE_EN),
    ("experimente", "en", "contenu-experimente-en", "TapeSense_Track_Experienced.pdf",
     "TapeSense — Experienced Track", EXPERIMENTE_EN),
]


def choisis(filtres):
    if not filtres:
        return PARCOURS
    retenus = [p for p in PARCOURS
               if p[0] in filtres or p[1] in filtres or "%s_%s" % (p[0], p[1]) in filtres]
    if not retenus:
        raise SystemExit("Rien ne correspond a %s. Parcours : debutant, "
                         "intermediaire, experimente. Langues : fr, en." % ", ".join(filtres))
    return retenus


def main():
    for slug, langue, src, sortie, pied, colophon in choisis(sys.argv[1:]):
        subprocess.check_call([sys.executable, RENDU,
                               "--src", os.path.join(HERE, src),
                               "--out", os.path.join(HERE, sortie),
                               "--pied", pied,
                               "--colophon", colophon,
                               "--langue", langue])


if __name__ == "__main__":
    main()
