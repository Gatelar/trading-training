# -*- coding: utf-8 -*-
"""
Rendu PDF du parcours de formation TapeSense.

Lit les fichiers de contenu balises (contenu/*.txt) et produit un PDF mis en page.
Usage : python render_formation.py
"""

import glob
import os
import re

from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_JUSTIFY, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.units import cm, mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    BaseDocTemplate,
    Frame,
    KeepTogether,
    PageBreak,
    PageTemplate,
    Paragraph,
    Spacer,
    Table,
    TableStyle,
)
from reportlab.platypus.tableofcontents import TableOfContents

HERE = os.path.dirname(os.path.abspath(__file__))

# Valeurs par defaut : parcours Debutant. Surchargeables en ligne de commande
# (--src / --out / --pied) pour produire un autre parcours avec EXACTEMENT la
# meme mise en page. Aucun style ci-dessous ne depend de ces valeurs.
CONTENU = os.path.join(HERE, "contenu")
SORTIE = os.path.join(HERE, "TapeSense_Parcours_Debutant.pdf")
PIED = "TapeSense — Parcours Débutant"
COLOPHON = ("Contenu pédagogique · Aucun conseil en investissement<br/>"
            "Intégralité du parcours en simulation, sans capital réel")

# --------------------------------------------------------------------------
# Polices
# --------------------------------------------------------------------------

FONTS = "C:/Windows/Fonts"


def _register():
    paires = [
        ("Body", "georgia.ttf", "georgiab.ttf", "georgiai.ttf", "georgiaz.ttf"),
        ("Sans", "segoeui.ttf", "segoeuib.ttf", "segoeuii.ttf", "segoeuiz.ttf"),
    ]
    for nom, reg, gras, ital, gras_ital in paires:
        pdfmetrics.registerFont(TTFont(nom, os.path.join(FONTS, reg)))
        pdfmetrics.registerFont(TTFont(nom + "-B", os.path.join(FONTS, gras)))
        pdfmetrics.registerFont(TTFont(nom + "-I", os.path.join(FONTS, ital)))
        pdfmetrics.registerFont(TTFont(nom + "-BI", os.path.join(FONTS, gras_ital)))
        pdfmetrics.registerFontFamily(
            nom, normal=nom, bold=nom + "-B", italic=nom + "-I", boldItalic=nom + "-BI"
        )


_register()

# --------------------------------------------------------------------------
# Palette
# --------------------------------------------------------------------------

ENCRE = colors.HexColor("#16202B")
TEXTE = colors.HexColor("#22303F")
GRIS = colors.HexColor("#6B7A89")
GRIS_CLAIR = colors.HexColor("#D9E0E6")

BLEU = colors.HexColor("#2C5D8F")
BLEU_FOND = colors.HexColor("#F2F6FA")
ROUGE = colors.HexColor("#A63A2B")
ROUGE_FOND = colors.HexColor("#FCF4F2")
VERT = colors.HexColor("#2E6B4F")
VERT_FOND = colors.HexColor("#F1F7F3")
OCRE = colors.HexColor("#8A6A2F")
OCRE_FOND = colors.HexColor("#FAF6EE")

PAGE_W, PAGE_H = A4
MARGE_G = 2.4 * cm
MARGE_D = 2.2 * cm
MARGE_H = 2.2 * cm
MARGE_B = 2.2 * cm
LARGEUR = PAGE_W - MARGE_G - MARGE_D

# --------------------------------------------------------------------------
# Styles
# --------------------------------------------------------------------------

S = {}

S["corps"] = ParagraphStyle(
    "corps", fontName="Body", fontSize=10.2, leading=16.4, textColor=TEXTE,
    alignment=TA_JUSTIFY, spaceAfter=7,
)
S["corps_boite"] = ParagraphStyle(
    "corps_boite", parent=S["corps"], fontSize=9.7, leading=15.2, spaceAfter=5,
    alignment=TA_LEFT,
)
S["accroche"] = ParagraphStyle(
    "accroche", fontName="Body-I", fontSize=11.2, leading=18, textColor=ENCRE,
    alignment=TA_LEFT, spaceAfter=4,
)
S["module_kicker"] = ParagraphStyle(
    "module_kicker", fontName="Sans-B", fontSize=9, leading=12, textColor=BLEU,
    spaceAfter=6,
)
S["module_titre"] = ParagraphStyle(
    "module_titre", fontName="Sans-B", fontSize=23, leading=27, textColor=ENCRE,
    spaceAfter=5,
)
S["titre_hors_toc"] = ParagraphStyle(
    "titre_hors_toc", fontName="Sans-B", fontSize=23, leading=27, textColor=ENCRE,
    spaceAfter=5,
)
S["module_meta"] = ParagraphStyle(
    "module_meta", fontName="Sans", fontSize=9.5, leading=14, textColor=GRIS,
    spaceAfter=2,
)
S["module_objectif"] = ParagraphStyle(
    "module_objectif", fontName="Body-I", fontSize=11, leading=17, textColor=BLEU,
    spaceBefore=10, spaceAfter=2,
)
S["chapitre"] = ParagraphStyle(
    "chapitre", fontName="Sans-B", fontSize=13.4, leading=18, textColor=ENCRE,
    spaceBefore=20, spaceAfter=8, keepWithNext=1,
)
S["sous_titre"] = ParagraphStyle(
    "sous_titre", fontName="Sans-B", fontSize=10.4, leading=15, textColor=BLEU,
    spaceBefore=12, spaceAfter=5, keepWithNext=1,
)
S["etiquette"] = ParagraphStyle(
    "etiquette", fontName="Sans-B", fontSize=8.2, leading=11, spaceAfter=5,
)
S["liste"] = ParagraphStyle(
    "liste", parent=S["corps"], leftIndent=13, bulletIndent=2, spaceAfter=4,
    alignment=TA_LEFT,
)
S["liste_boite"] = ParagraphStyle(
    "liste_boite", parent=S["corps_boite"], leftIndent=13, bulletIndent=2, spaceAfter=3,
)
S["cellule"] = ParagraphStyle(
    "cellule", fontName="Body", fontSize=9.3, leading=13.4, textColor=TEXTE,
)
S["cellule_tete"] = ParagraphStyle(
    "cellule_tete", fontName="Sans-B", fontSize=8.8, leading=12.6, textColor=ENCRE,
)
S["note"] = ParagraphStyle(
    "note", fontName="Sans", fontSize=8.8, leading=13.6, textColor=GRIS,
    spaceBefore=4, spaceAfter=8,
)
S["titre_doc"] = ParagraphStyle(
    "titre_doc", fontName="Sans-B", fontSize=34, leading=39, textColor=ENCRE,
    alignment=TA_LEFT, spaceAfter=10,
)
S["sous_titre_doc"] = ParagraphStyle(
    "sous_titre_doc", fontName="Body-I", fontSize=14.5, leading=22, textColor=BLEU,
    spaceAfter=6,
)
S["colophon"] = ParagraphStyle(
    "colophon", fontName="Sans", fontSize=9, leading=15, textColor=GRIS,
)
S["glossaire"] = ParagraphStyle(
    "glossaire", parent=S["corps"], alignment=TA_LEFT, spaceAfter=6, leftIndent=0,
)

S["toc0"] = ParagraphStyle(
    "toc0", fontName="Sans-B", fontSize=10.6, leading=16, textColor=ENCRE,
    spaceBefore=11,
)
S["toc1"] = ParagraphStyle(
    "toc1", fontName="Body", fontSize=9.6, leading=14.4, textColor=TEXTE,
    leftIndent=16,
)

# --------------------------------------------------------------------------
# Mise en forme en ligne
# --------------------------------------------------------------------------


NBSP = " "


def typo_fr(txt):
    """Espaces insecables : guillemets, ponctuation double, milliers, devises."""
    txt = txt.replace("« ", "«" + NBSP).replace(" »", NBSP + "»")
    txt = re.sub(r" ([:;?!%‰])", NBSP + r"\1", txt)
    txt = re.sub(r"(\d) (\d{3})", r"\1" + NBSP + r"\2", txt)
    txt = re.sub(r"(\d) ([€$])", r"\1" + NBSP + r"\2", txt)
    return txt


def inline(txt):
    txt = typo_fr(txt)
    txt = txt.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    txt = re.sub(r"\*\*(.+?)\*\*", r"<b>\1</b>", txt)
    txt = re.sub(r"(?<!\*)\*([^*]+?)\*(?!\*)", r"<i>\1</i>", txt)
    txt = re.sub(r"__(.+?)__", r'<font color="#2C5D8F"><b>\1</b></font>', txt)
    return txt


def boite(label, lignes, bordure, fond, couleur_label, style_txt=None,
          style_liste=None):
    """Encadre a filet lateral, capable de se couper entre deux pages."""
    style_txt = style_txt or S["corps_boite"]
    style_liste = style_liste or S["liste_boite"]
    lignes_table = []
    if label:
        st = ParagraphStyle("lbl", parent=S["etiquette"], textColor=couleur_label)
        lignes_table.append([Paragraph(inline(label.upper()), st)])
    for ligne in lignes:
        if ligne.startswith("- "):
            lignes_table.append(
                [Paragraph(inline(ligne[2:]), style_liste, bulletText="\u2022")]
            )
        else:
            lignes_table.append([Paragraph(inline(ligne), style_txt)])
    t = Table(lignes_table, colWidths=[LARGEUR])
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), fond),
        ("LINEBEFORE", (0, 0), (0, -1), 2.4, bordure),
        ("LEFTPADDING", (0, 0), (-1, -1), 11),
        ("RIGHTPADDING", (0, 0), (-1, -1), 11),
        ("TOPPADDING", (0, 0), (-1, -1), 1),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 1),
        ("TOPPADDING", (0, 0), (0, 0), 9),
        ("BOTTOMPADDING", (0, -1), (-1, -1), 9),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
    ]))
    return t


def tableau(entetes, lignes, parts=None):
    data = [[Paragraph(inline(c), S["cellule_tete"]) for c in entetes]]
    for l in lignes:
        data.append([Paragraph(inline(c), S["cellule"]) for c in l])
    n = len(entetes)
    if parts:
        total = float(sum(parts))
        widths = [LARGEUR * p / total for p in parts]
    elif n == 2:
        widths = [LARGEUR * 0.5, LARGEUR * 0.5]
    elif n == 3:
        widths = [LARGEUR * 0.34, LARGEUR * 0.33, LARGEUR * 0.33]
    else:
        widths = [LARGEUR / n] * n
    t = Table(data, colWidths=widths, repeatRows=1)
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#EDF1F5")),
        ("LINEBELOW", (0, 0), (-1, 0), 0.9, BLEU),
        ("LINEBELOW", (0, 1), (-1, -2), 0.4, GRIS_CLAIR),
        ("LEFTPADDING", (0, 0), (-1, -1), 8),
        ("RIGHTPADDING", (0, 0), (-1, -1), 8),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
    ]))
    return t


class Filet(Table):
    pass


def filet(couleur=GRIS_CLAIR, epaisseur=0.8, avant=6, apres=10, largeur=None):
    t = Table([[""]], colWidths=[largeur or LARGEUR], rowHeights=[0.1],
              hAlign="LEFT")
    t.setStyle(TableStyle([
        ("LINEABOVE", (0, 0), (-1, 0), epaisseur, couleur),
        ("TOPPADDING", (0, 0), (-1, -1), avant),
        ("BOTTOMPADDING", (0, 0), (-1, -1), apres),
    ]))
    return t


# --------------------------------------------------------------------------
# Analyse du contenu balise
# --------------------------------------------------------------------------


def lire_blocs(chemin):
    with open(chemin, encoding="utf-8") as f:
        brut = f.read()
    blocs = []
    for morceau in re.split(r"\n\s*\n", brut):
        morceau = morceau.strip("\n")
        if not morceau.strip():
            continue
        lignes = [l.rstrip() for l in morceau.split("\n")]
        m = re.match(r"^([A-Z0-9_]+):\s?(.*)$", lignes[0])
        if not m:
            blocs.append(("P", "", lignes))
            continue
        tag, reste = m.group(1), m.group(2)
        # Pour ces balises, la fin de la premiere ligne est un titre / une
        # etiquette : elle ne doit pas etre reprise dans le corps du bloc.
        entete = {"MOD", "SEC", "SECX", "H2", "H3", "EX", "EXF", "COUV",
                  "CASE", "ERR", "KEY", "WARN", "CARD", "TABLE"}
        corps = lignes[1:] if tag in entete else (
            ([reste] if reste.strip() else []) + lignes[1:])
        blocs.append((tag, reste, [l for l in corps if l.strip()]))
    return blocs


def construire(blocs, story):
    for tag, tete, corps in blocs:
        if tag == "PB":
            story.append(PageBreak())

        elif tag == "COUV":
            titre = (tete or "Parcours|Débutant").replace("|", "<br/>")
            story.append(Spacer(1, 4.6 * cm))
            story.append(Paragraph("TAPESENSE", S["module_kicker"]))
            story.append(Paragraph(titre, S["titre_doc"]))
            story.append(filet(BLEU, 2.2, 10, 14, LARGEUR * 0.28))
            for l in corps:
                story.append(Paragraph(inline(l), S["sous_titre_doc"]))
            story.append(Spacer(1, 8.2 * cm))
            story.append(filet(GRIS_CLAIR, 0.8, 0, 8))
            story.append(Paragraph(COLOPHON, S["colophon"]))

        elif tag in ("SEC", "SECX"):
            story.append(PageBreak())
            st = S["module_titre"] if tag == "SEC" else S["titre_hors_toc"]
            story.append(Paragraph(inline(tete), st))
            story.append(filet(BLEU, 2.2, 8, 16, LARGEUR * 0.16))

        elif tag == "MOD":
            num, titre, meta, court = [x.strip() for x in tete.split("|")]
            story.append(PageBreak())
            story.append(Spacer(1, 0.5 * cm))
            story.append(Paragraph("MODULE %s" % num, S["module_kicker"]))
            p = Paragraph(inline(titre), S["module_titre"])
            p._toc = "Module %s — %s · %s" % (num, titre, court)
            story.append(p)
            story.append(Paragraph(inline(meta), S["module_meta"]))
            story.append(filet(BLEU, 2.2, 12, 4, LARGEUR * 0.16))
            for l in corps:
                story.append(Paragraph(inline(l), S["module_objectif"]))
            story.append(Spacer(1, 8))

        elif tag == "H2":
            story.append(Paragraph(inline(tete), S["chapitre"]))

        elif tag == "H3":
            story.append(Paragraph(inline(tete), S["sous_titre"]))

        elif tag == "HOOK":
            t = Table([[Paragraph(inline(" ".join(corps)), S["accroche"])]],
                      colWidths=[LARGEUR])
            t.setStyle(TableStyle([
                ("LINEBEFORE", (0, 0), (0, -1), 2.4, GRIS_CLAIR),
                ("LEFTPADDING", (0, 0), (-1, -1), 13),
                ("RIGHTPADDING", (0, 0), (-1, -1), 0),
                ("TOPPADDING", (0, 0), (-1, -1), 2),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 12),
            ]))
            story.append(t)

        elif tag == "P":
            story.append(Paragraph(inline(" ".join(corps)), S["corps"]))

        elif tag == "NOTE":
            story.append(Paragraph(inline(" ".join(corps)), S["note"]))

        elif tag == "UL":
            for l in corps:
                story.append(Paragraph(inline(l.lstrip("- ")), S["liste"],
                                       bulletText="\u2022"))
            story.append(Spacer(1, 5))

        elif tag == "OL":
            for i, l in enumerate(corps, 1):
                story.append(Paragraph(inline(l.lstrip("- ")), S["liste"],
                                       bulletText="%d." % i))
            story.append(Spacer(1, 5))

        elif tag == "GLOSS":
            for l in corps:
                terme, definition = l.split("::", 1)
                story.append(Paragraph(
                    "<b>%s</b> — %s" % (inline(terme.strip()),
                                        inline(definition.strip())),
                    S["glossaire"]))

        elif tag == "CASE":
            story.append(Spacer(1, 4))
            story.append(boite(tete or "Cas chiffré", corps, BLEU, BLEU_FOND, BLEU))
            story.append(Spacer(1, 10))

        elif tag == "ERR":
            story.append(Spacer(1, 2))
            story.append(boite(tete or "L'erreur classique", corps, ROUGE,
                               ROUGE_FOND, ROUGE))
            story.append(Spacer(1, 10))

        elif tag == "KEY":
            story.append(Spacer(1, 2))
            story.append(KeepTogether(
                boite(tete or "À retenir", corps, VERT, VERT_FOND, VERT)))
            story.append(Spacer(1, 12))

        elif tag == "WARN":
            story.append(Spacer(1, 2))
            story.append(boite(tete or "Avertissement", corps, ROUGE, ROUGE_FOND,
                               ROUGE))
            story.append(Spacer(1, 12))

        elif tag == "CARD":
            story.append(Spacer(1, 2))
            story.append(KeepTogether(
                boite(tete, corps, OCRE, OCRE_FOND, OCRE)))
            story.append(Spacer(1, 10))

        elif tag == "EX":
            story.append(Spacer(1, 8))
            story.append(filet(ENCRE, 1.6, 6, 10))
            story.append(Paragraph("EXERCICE", S["module_kicker"]))
            story.append(Paragraph(inline(tete), ParagraphStyle(
                "extitre", parent=S["chapitre"], spaceBefore=0, fontSize=15,
                leading=20)))

        elif tag == "EXF":
            st = ParagraphStyle("exf", parent=S["sous_titre"], textColor=ENCRE,
                                fontSize=9.6, spaceBefore=11, spaceAfter=4)
            story.append(Paragraph(inline(tete.upper()), st))
            for l in corps:
                if l.startswith("- "):
                    story.append(Paragraph(inline(l[2:]), S["liste"],
                                           bulletText="\u2022"))
                else:
                    story.append(Paragraph(inline(l), S["corps"]))

        elif tag == "TABLE":
            parts = None
            if "||" in tete:
                spec, tete = tete.split("||", 1)
                parts = [float(x) for x in spec.split(",")]
            entetes = [c.strip() for c in tete.split("|")]
            lignes = [[c.strip() for c in l.split("|")] for l in corps]
            story.append(Spacer(1, 4))
            story.append(tableau(entetes, lignes, parts))
            story.append(Spacer(1, 12))

        elif tag == "RULE":
            story.append(filet(GRIS_CLAIR, 0.8, 8, 12))

        elif tag == "TOC":
            toc = TableOfContents()
            toc.levelStyles = [S["toc0"], S["toc1"]]
            toc.dotsMinLevel = 0
            story.append(toc)

        else:
            raise ValueError("Balise inconnue : %s" % tag)


# --------------------------------------------------------------------------
# Gabarit
# --------------------------------------------------------------------------


class Doc(BaseDocTemplate):
    def afterFlowable(self, flowable):
        if not isinstance(flowable, Paragraph):
            return
        nom = flowable.style.name
        txt = flowable.getPlainText()
        if nom == "module_titre" and self.page > 1:
            self.notify("TOCEntry", (0, getattr(flowable, "_toc", txt), self.page))
        elif nom == "chapitre":
            self.notify("TOCEntry", (1, txt, self.page))


def pied(canvas, doc):
    canvas.saveState()
    if doc.page > 1:
        canvas.setStrokeColor(GRIS_CLAIR)
        canvas.setLineWidth(0.6)
        canvas.line(MARGE_G, MARGE_B - 12, PAGE_W - MARGE_D, MARGE_B - 12)
        canvas.setFont("Sans", 8)
        canvas.setFillColor(GRIS)
        canvas.drawString(MARGE_G, MARGE_B - 24, PIED)
        canvas.drawRightString(PAGE_W - MARGE_D, MARGE_B - 24, str(doc.page))
    canvas.restoreState()


def main():
    global PIED, COLOPHON
    import argparse
    ap = argparse.ArgumentParser(description="Rendu PDF d'un parcours TapeSense.")
    ap.add_argument("--src", default=CONTENU, help="dossier des fichiers .txt")
    ap.add_argument("--out", default=SORTIE, help="chemin du PDF produit")
    ap.add_argument("--pied", default=PIED, help="texte du pied de page")
    ap.add_argument("--colophon", default=None,
                    help="colophon de couverture ; <br/> pour un retour a la ligne")
    a = ap.parse_args()
    PIED = a.pied
    if a.colophon:
        COLOPHON = a.colophon
    src, sortie = a.src, a.out

    fichiers = sorted(glob.glob(os.path.join(src, "*.txt")))
    if not fichiers:
        raise SystemExit("Aucun fichier de contenu dans %s" % CONTENU)

    story = []
    for f in fichiers:
        construire(lire_blocs(f), story)

    doc = Doc(sortie, pagesize=A4,
              leftMargin=MARGE_G, rightMargin=MARGE_D,
              topMargin=MARGE_H, bottomMargin=MARGE_B,
              title=PIED,
              author="TapeSense", subject="Formation au trading, niveau débutant")
    frame = Frame(MARGE_G, MARGE_B, LARGEUR, PAGE_H - MARGE_H - MARGE_B,
                  id="corps", leftPadding=0, rightPadding=0,
                  topPadding=0, bottomPadding=0)
    doc.addPageTemplates([PageTemplate(id="std", frames=[frame], onPage=pied)])
    doc.multiBuild(story)

    mots = 0
    for f in fichiers:
        with open(f, encoding="utf-8") as fh:
            mots += len(re.findall(r"[A-Za-zÀ-ÿ'’]+", fh.read()))
    print("PDF : %s" % sortie)
    print("Mots (approx.) : %d" % mots)


if __name__ == "__main__":
    main()
