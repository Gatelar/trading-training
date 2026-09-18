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

# Les rares libelles que la mise en page fournit elle-meme, quand la source
# ne les porte pas. Tout le reste vient des fichiers .txt : c'est pourquoi
# cette table est si courte. Choix par --langue.
LIBELLES = {
    "fr": {"exercice": "EXERCICE", "couv": "Parcours|Débutant",
           "case": "Cas chiffré", "err": "L'erreur classique",
           "key": "À retenir", "warn": "Avertissement",
           "reponses": "Réponses", "vrai": "Vrai", "faux": "Faux",
           "milliers": " ", "decimal": ",",
           "deux_points": " : ", "devise_avant": False,
           "correles": "Corr\u00e9lations", "classement": "Classement",
           "actif": "Actif", "sens": "Sens", "risque": "Risque",
           "avec": "avec", "autres": "toutes les autres paires",
           "passe": "passe \u00e0", "tes_groupes": "Tes groupes",
           "groupes": "Groupes"},
    "en": {"exercice": "EXERCISE", "couv": "Track|Beginner",
           "case": "Worked example", "err": "The classic mistake",
           "key": "Key points", "warn": "Warning",
           "reponses": "Answers", "vrai": "True", "faux": "False",
           "milliers": ",", "decimal": ".",
           "deux_points": ": ", "devise_avant": True,
           "correles": "Correlations", "classement": "Ranking",
           "actif": "Asset", "sens": "Side", "risque": "Risk",
           "avec": "with", "autres": "every other pair",
           "passe": "moves to", "tes_groupes": "Your groups",
           "groupes": "Groups"},
}
L = LIBELLES["fr"]

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


# --------------------------------------------------------------------------
# Exercices
# --------------------------------------------------------------------------
# Le meme balisage sert au site, qui en fait un exercice interactif, et au PDF,
# qui en fait un exercice de papier : enonce d'abord, reponses ensuite, jamais
# la correction collee sous la question. Voir apprendre/exercice.js.


def chiffre(t):
    """Une valeur canonique de source — chiffres nus, point decimal, pas de
    separateur de milliers — remise dans la typographie de la langue."""
    if not re.match(r"^-?\d+(\.\d+)?$", t):
        return t
    entier, _, decimales = t.partition(".")
    signe, entier = ("-", entier[1:]) if entier.startswith("-") else ("", entier)
    paquets = []
    while len(entier) > 3:
        paquets.insert(0, entier[-3:])
        entier = entier[:-3]
    paquets.insert(0, entier)
    sortie = signe + L["milliers"].join(paquets)
    return sortie + L["decimal"] + decimales if decimales else sortie


def unite(valeur, suffixe):
    """Colle une unite a un nombre selon l'usage de la langue : « 50 € » et
    « 5 % » en francais, "$50" et "5%" en anglais."""
    if not suffixe:
        return valeur
    if L["devise_avant"]:
        return suffixe + valeur if suffixe in "€$£" else valeur + suffixe
    return valeur + " " + suffixe


def lire_exo(tete, corps):
    champs = lambda l: [c.strip() for c in l.split("|")]
    t = champs(tete)
    ex = {"type": (t[0] or "vraifaux").lower(),
          "titre": t[1] if len(t) > 1 else "",
          "consigne": "", "questions": [], "fixe": None,
          "colonnes": [], "rangs": [], "actifs": [], "blocs": [], "croises": [],
          "legendes": [], "positions": [], "lots": [], "items": [],
          "defaut": "", "apres": [], "bascule": None, "etat": "", "groupes": []}
    for ligne in corps:
        # Une option de QCM appartient au dernier item declare. « > » marque la
        # bonne : meme convention que le balisage lu par apprendre/exercice.js.
        if ligne.startswith("- ") and ex["items"] and ex["items"][-1]["type"] == "qcm":
            o = champs(ligne[2:])
            juste = o[0].startswith(">")
            ex["items"][-1]["options"].append(
                {"texte": (o[0][1:] if juste else o[0]).strip(), "juste": juste,
                 "note": " | ".join(o[1:])})
            continue
        m = re.match(r"^([A-Z]+):\s?(.*)$", ligne)
        if not m:
            continue
        c = champs(m.group(2))
        if m.group(1) == "CONSIGNE":
            ex["consigne"] = m.group(2)
        elif m.group(1) == "Q":
            ex["questions"].append({"texte": c[0],
                                    "vrai": c[1].lower() == "vrai" if len(c) > 1 else False,
                                    "note": " | ".join(c[2:])})
        elif m.group(1) == "FIXE":
            ex["fixe"] = c
        elif m.group(1) == "COL":
            ex["colonnes"].append({"label": c[0],
                                   "suffixe": c[2] if len(c) > 2 else ""})
        elif m.group(1) == "ROW":
            ex["rangs"].append(c)
        elif m.group(1) == "ACTIFS":
            ex["actifs"] = c
        elif m.group(1) == "BLOC":
            ex["blocs"].append({"categorie": c[0], "actifs": c[1:]})
        elif m.group(1) == "CROISE":
            ex["croises"].append({"categorie": c[0], "actif": c[1], "avec": c[2:]})
        elif m.group(1) == "LEGENDE":
            ex["legendes"].append({"categorie": c[0], "seuil": c[1] if len(c) > 1 else "",
                                   "effet": c[2] if len(c) > 2 else ""})
        elif m.group(1) == "POS":
            ex["positions"].append(c)
        elif m.group(1) == "LOT":
            ex["lots"].append(c)
        elif m.group(1) == "CHAMP":
            ex["items"].append({"type": "champ", "label": c[0],
                                "vise": c[1] if len(c) > 1 else "",
                                "suffixe": c[3] if len(c) > 3 else "",
                                "note": " | ".join(c[4:])})
        elif m.group(1) == "QCM":
            ex["items"].append({"type": "qcm", "question": m.group(2), "options": []})
        elif m.group(1) == "DEFAUT":
            ex["defaut"] = c[0]
        elif m.group(1) == "APRES":
            ex["apres"].append({"categorie": c[0], "a": c[1], "b": c[2]})
        elif m.group(1) == "BASCULE":
            ex["bascule"] = c
        elif m.group(1) == "ETAT":
            ex["etat"] = c[0]
        elif m.group(1) == "GROUPE":
            ex["groupes"].append({"nom": c[0], "actifs": c[1:]})
    return ex


def etiquette_cat(ex, categorie):
    """Le mot-cle du balisage rendu lisible par la legende de la source."""
    for lg in ex["legendes"]:
        if lg["categorie"] == categorie:
            return lg["seuil"] or categorie
    return categorie


def exercice_papier(tete, corps):
    """Un bloc EXO en flowables : enonce a faire, puis reponses encadrees."""
    ex = lire_exo(tete, corps)
    out = [Spacer(1, 10)]
    if ex["titre"]:
        out.append(Paragraph(inline(ex["titre"].upper()), ParagraphStyle(
            "exotitre", parent=S["sous_titre"], textColor=ENCRE, fontSize=9.6,
            spaceBefore=0, spaceAfter=4)))
    if ex["consigne"]:
        out.append(Paragraph(inline(ex["consigne"]), S["corps"]))

    reponses = []

    # La matrice de correlation se lit en grille a l'ecran, en groupes sur le
    # papier : c'est sous cette forme que la source la declare, et une grille de
    # symboles en noir et blanc ne dit rien de plus qu'une phrase.
    if ex["actifs"]:
        lignes = []
        for bl in ex["blocs"]:
            lignes.append("- **%s**%s%s" % (etiquette_cat(ex, bl["categorie"]),
                                            L["deux_points"], ", ".join(bl["actifs"])))
        for cr in ex["croises"]:
            lignes.append("- **%s**%s%s %s %s" % (
                etiquette_cat(ex, cr["categorie"]), L["deux_points"],
                cr["actif"], L["avec"], ", ".join(cr["avec"])))
        # Tout couple non declare est de la categorie par defaut. Le dire en
        # une ligne, plutot que de lister des actifs « avec tout le reste » :
        # c'etait faux des qu'il y avait deux blocs.
        defaut = ex["defaut"] or "faible"
        effet = [lg["effet"] for lg in ex["legendes"] if lg["categorie"] == defaut and lg["effet"]]
        lignes.append("- **%s**%s%s%s" % (
            etiquette_cat(ex, defaut), " (%s)" % effet[0] if effet else "",
            L["deux_points"], L["autres"]))
        # Le second etat de la matrice : sur papier, pas de bouton — on ecrit
        # ce qui a change, couple par couple.
        if ex["apres"]:
            titre = ex["bascule"][1] if ex["bascule"] and len(ex["bascule"]) > 1 else ""
            for ap in ex["apres"]:
                lignes.append("**%s**%s%s – %s %s **%s**" % (
                    titre, L["deux_points"], ap["a"], ap["b"], L["passe"],
                    etiquette_cat(ex, ap["categorie"])))
        out += [Spacer(1, 4), boite(L["correles"], lignes, BLEU, BLEU_FOND, BLEU),
                Spacer(1, 10)]

    if ex["positions"]:
        entetes = [L["actif"], L["sens"], L["risque"]]
        lignes = [[p[0] + (" (%s)" % p[3] if len(p) > 3 and p[3] else ""),
                   p[1] if len(p) > 1 else "",
                   unite(chiffre(p[2]), "%") if len(p) > 2 else ""]
                  for p in ex["positions"]]
        out += [Spacer(1, 4), tableau(entetes, lignes, [40, 30, 30]), Spacer(1, 10)]

    if ex["groupes"]:
        out.append(Paragraph(inline("%s%s%s" % (
            L["tes_groupes"], L["deux_points"], "\u2026" * 12)), S["corps"]))
        reponses.append("**%s**" % L["groupes"])
        for gr in ex["groupes"]:
            reponses.append("- **%s**%s%s" % (gr["nom"], L["deux_points"],
                                             ", ".join(gr["actifs"])))

    if ex["lots"]:
        for lot in ex["lots"]:
            out.append(Paragraph(inline("**%s** — %s" % (lot[0], lot[1])), S["liste"],
                                 bulletText="\u2022"))
        classement = sorted(ex["lots"], key=lambda l: -float(l[2] or 0))
        reponses.append("**%s**%s%s" % (
            L["classement"], L["deux_points"],
            "  >  ".join("%s (%s)" % (l[0], unite(chiffre(l[2]), "%")) for l in classement)))
        for lot in classement:
            if len(lot) > 3 and lot[3]:
                reponses.append("- %s — %s" % (lot[0], lot[3]))

    for it in ex["items"]:
        if it["type"] == "qcm":
            out.append(Paragraph(inline(it["question"]), S["corps"]))
            for i, o in enumerate(it["options"]):
                out.append(Paragraph(inline(o["texte"]), S["liste"],
                                     bulletText="%s." % chr(97 + i)))
            juste = [(i, o) for i, o in enumerate(it["options"]) if o["juste"]]
            for i, o in juste:
                reponses.append("**%s.** %s — %s" % (chr(97 + i), o["texte"], o["note"]))
        else:
            out.append(Paragraph(
                inline("%s%s%s" % (it["label"], L["deux_points"], "\u2026\u2026\u2026\u2026")),
                S["corps"]))
            reponses.append("**%s**%s%s" % (
                it["label"], L["deux_points"],
                unite(chiffre(it["vise"]), it["suffixe"])
                + ((" — " + it["note"]) if it["note"] else "")))

    if ex["questions"]:
        for i, q in enumerate(ex["questions"], 1):
            out.append(Paragraph(inline(q["texte"]), S["liste"],
                                 bulletText="%d." % i))
            mot = L["vrai"] if q["vrai"] else L["faux"]
            reponses.append("%d. **%s** — %s" % (i, mot, q["note"]))
    elif ex["rangs"]:
        if ex["fixe"]:
            out.append(Paragraph(inline("**%s%s%s**%s" % (
                ex["fixe"][0], L["deux_points"], ex["fixe"][1],
                " (%s)" % ex["fixe"][2] if len(ex["fixe"]) > 2 else "")), S["corps"]))
        entetes = [c["label"] for c in ex["colonnes"]]
        vides = [[r[0]] + [""] * (len(entetes) - 1) for r in ex["rangs"]]
        out += [Spacer(1, 4), tableau(entetes, vides), Spacer(1, 8)]
        for r in ex["rangs"]:
            valeurs = [unite(chiffre(v), ex["colonnes"][j + 1]["suffixe"])
                       for j, v in enumerate(r[1:])]
            reponses.append("**%s** — %s" % (r[0], ", ".join(valeurs)))

    if reponses:
        out += [Spacer(1, 6),
                boite(L["reponses"], reponses, VERT, VERT_FOND, VERT),
                Spacer(1, 12)]
    return out


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
        entete = {"MOD", "SEC", "SECX", "H2", "H3", "EX", "EXF", "EXO", "COUV",
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
            titre = (tete or L["couv"]).replace("|", "<br/>")
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
            story.append(boite(tete or L["case"], corps, BLEU, BLEU_FOND, BLEU))
            story.append(Spacer(1, 10))

        elif tag == "ERR":
            story.append(Spacer(1, 2))
            story.append(boite(tete or L["err"], corps, ROUGE,
                               ROUGE_FOND, ROUGE))
            story.append(Spacer(1, 10))

        elif tag == "KEY":
            story.append(Spacer(1, 2))
            story.append(KeepTogether(
                boite(tete or L["key"], corps, VERT, VERT_FOND, VERT)))
            story.append(Spacer(1, 12))

        elif tag == "WARN":
            story.append(Spacer(1, 2))
            story.append(boite(tete or L["warn"], corps, ROUGE, ROUGE_FOND,
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
            story.append(Paragraph(L["exercice"], S["module_kicker"]))
            story.append(Paragraph(inline(tete), ParagraphStyle(
                "extitre", parent=S["chapitre"], spaceBefore=0, fontSize=15,
                leading=20)))

        elif tag == "EXO":
            story.extend(exercice_papier(tete, corps))

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
    global PIED, COLOPHON, L
    import argparse
    ap = argparse.ArgumentParser(description="Rendu PDF d'un parcours TapeSense.")
    ap.add_argument("--src", default=CONTENU, help="dossier des fichiers .txt")
    ap.add_argument("--out", default=SORTIE, help="chemin du PDF produit")
    ap.add_argument("--pied", default=PIED, help="texte du pied de page")
    ap.add_argument("--colophon", default=None,
                    help="colophon de couverture ; <br/> pour un retour a la ligne")
    ap.add_argument("--langue", default="fr", choices=sorted(LIBELLES),
                    help="langue des rares libelles fournis par la mise en page")
    a = ap.parse_args()
    L = LIBELLES[a.langue]
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
              author="TapeSense", subject=PIED)
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
