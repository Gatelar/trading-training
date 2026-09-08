# -*- coding: utf-8 -*-
"""
Produit les trois PDF anglais a partir de formation/contenu*-en/.

  python formation/build_pdf_en.py

Appelle render_formation.py avec la meme mise en page que les PDF francais :
seuls changent la source, le nom du fichier, le pied de page et le colophon.
Les PDF francais, eux, ont ete produits a la main avant ce script et ne sont
pas regeneres ici — leurs parametres exacts n'ont pas ete conserves.
"""
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
RENDU = os.path.join(HERE, "render_formation.py")

GENERIQUE = ("Educational content · No investment advice<br/>"
             "Whole track in simulation, no real capital")

# Le parcours Experimente traite de l'argent reel : le colophon generique le
# contredirait des la couverture.
EXPERIMENTE = ("Educational content · No investment advice<br/>"
               "Exercises in simulation · No provider named, no capital recommended")

PARCOURS = [
    ("contenu-en", "TapeSense_Track_Beginner.pdf",
     "TapeSense — Beginner Track", GENERIQUE),
    ("contenu-inter-en", "TapeSense_Track_Intermediate.pdf",
     "TapeSense — Intermediate Track", GENERIQUE),
    ("contenu-experimente-en", "TapeSense_Track_Experienced.pdf",
     "TapeSense — Experienced Track", EXPERIMENTE),
]


def main():
    for src, sortie, pied, colophon in PARCOURS:
        cmd = [sys.executable, RENDU,
               "--src", os.path.join(HERE, src),
               "--out", os.path.join(HERE, sortie),
               "--pied", pied,
               "--colophon", colophon,
               "--langue", "en"]
        subprocess.check_call(cmd)


if __name__ == "__main__":
    main()
