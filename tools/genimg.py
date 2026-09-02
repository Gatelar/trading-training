# -*- coding: utf-8 -*-
"""
Generation d'images via l'API Gemini, pour les fonds de TapeSense.

La cle n'est jamais ecrite ici ni passee en argument : elle est lue depuis
.env (ignore par git) ou depuis la variable d'environnement GEMINI_API_KEY.

  python tools/genimg.py --list
  python tools/genimg.py --prompt "..." --out fond-a --n 3 --ratio 21:9

Aucune dependance : uniquement la bibliotheque standard.
"""
import argparse, base64, json, os, re, sys, urllib.request, urllib.error

RACINE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SORTIE = os.path.join(RACINE, "assets", "genere")
BASE = "https://generativelanguage.googleapis.com/v1beta"


def cle():
    """Cherche la cle dans .env puis dans l'environnement. Ne l'affiche jamais.

    Tolerant a l'encodage : PowerShell ecrit en UTF-16 avec '>', Git Bash en
    UTF-8, un editeur peut poser un BOM. On accepte les trois.
    """
    # Windows refuse parfois de creer un fichier commencant par un point :
    # on accepte aussi un nom ordinaire. Les deux sont ignores par git.
    chemin = next((p for p in (os.path.join(RACINE, "cle-api.txt"),
                               os.path.join(RACINE, ".env"))
                   if os.path.exists(p)), None)
    if chemin:
        brut = open(chemin, "rb").read()
        texte = None
        for enc in ("utf-8-sig", "utf-16", "utf-8", "latin-1"):
            try:
                t = brut.decode(enc)
            except (UnicodeDecodeError, UnicodeError):
                continue
            # on retient le premier decodage qui donne du texte imprimable
            if t.strip() and all(c.isprintable() or c in "\r\n\t" for c in t):
                texte = t
                break
        for ligne in (texte or "").splitlines():
            ligne = ligne.strip()
            if not ligne or ligne.startswith("#"):
                continue
            # Forme "GEMINI_API_KEY=..." ou "NOM=..." quelconque
            m = re.match(r"[A-Za-z_][A-Za-z0-9_]*\s*=\s*(.+?)\s*$", ligne)
            if m:
                return m.group(1).strip().strip('"').strip("'")
            # Forme la plus courante : la cle seule, sur une ligne
            return ligne.strip('"').strip("'")
    k = os.environ.get("GEMINI_API_KEY")
    if k:
        return k
    sys.exit("Aucune cle trouvee.\n"
             "Cree a la racine du depot un fichier cle-api.txt (ou .env)\n"
             "contenant une seule ligne :\n"
             "  GEMINI_API_KEY=ta_cle\n"
             "Les deux noms sont deja ignores par git.")


def appel(chemin, corps=None):
    url = "%s/%s" % (BASE, chemin)
    req = urllib.request.Request(
        url,
        data=json.dumps(corps).encode("utf-8") if corps else None,
        headers={"x-goog-api-key": cle(), "Content-Type": "application/json"},
        method="POST" if corps else "GET")
    try:
        with urllib.request.urlopen(req, timeout=180) as r:
            return json.loads(r.read().decode("utf-8"))
    except urllib.error.HTTPError as e:
        detail = e.read().decode("utf-8", "replace")
        sys.exit("HTTP %s sur %s\n%s" % (e.code, chemin, detail[:1200]))


def lister():
    """Affiche les modeles capables de produire une image."""
    d = appel("models")
    lignes = []
    for m in d.get("models", []):
        nom = m.get("name", "").replace("models/", "")
        if "image" in nom.lower() or "image" in " ".join(
                m.get("supportedGenerationMethods", [])).lower():
            lignes.append("  %-42s %s" % (nom, m.get("displayName", "")))
    print("Modeles susceptibles de generer des images :")
    print("\n".join(sorted(set(lignes))) or "  (aucun trouve — voir la liste complete ci-dessous)")
    print("\nTous les modeles disponibles :")
    for m in d.get("models", []):
        print("  " + m.get("name", "").replace("models/", ""))


def generer(modele, prompt, base_nom, n, ratio):
    os.makedirs(SORTIE, exist_ok=True)
    produits = []
    for i in range(1, n + 1):
        corps = {"contents": [{"parts": [{"text": prompt}]}],
                 "generationConfig": {"responseModalities": ["IMAGE"]}}
        if ratio:
            corps["generationConfig"]["imageConfig"] = {"aspectRatio": ratio}

        d = appel("models/%s:generateContent" % modele, corps)

        trouve = False
        for cand in d.get("candidates", []):
            for part in cand.get("content", {}).get("parts", []):
                inline = part.get("inlineData") or part.get("inline_data")
                if not inline:
                    continue
                mime = inline.get("mimeType", "image/png")
                ext = ".jpg" if "jpeg" in mime else ".png"
                chemin = os.path.join(SORTIE, "%s-%02d%s" % (base_nom, i, ext))
                with open(chemin, "wb") as f:
                    f.write(base64.b64decode(inline["data"]))
                produits.append(chemin)
                trouve = True
        if not trouve:
            print("Variante %d : aucune image renvoyee. Reponse brute :" % i)
            print(json.dumps(d, ensure_ascii=False)[:900])

    for p in produits:
        print("%s  (%.0f Ko)" % (p, os.path.getsize(p) / 1024))
    return produits


def main():
    ap = argparse.ArgumentParser(description="Generation d'images Gemini pour TapeSense.")
    ap.add_argument("--list", action="store_true", help="lister les modeles disponibles")
    ap.add_argument("--model", default="gemini-3.1-flash-image",
                    help="identifiant du modele (voir --list)")
    ap.add_argument("--prompt", help="le prompt, en anglais de preference")
    ap.add_argument("--prompt-file", help="fichier texte contenant le prompt")
    ap.add_argument("--out", default="fond", help="prefixe des fichiers produits")
    ap.add_argument("--n", type=int, default=1, help="nombre de variantes")
    ap.add_argument("--ratio", default=None, help="ex : 21:9, 16:9, 9:16")
    a = ap.parse_args()

    if a.list:
        lister()
        return
    prompt = a.prompt
    if a.prompt_file:
        prompt = open(a.prompt_file, encoding="utf-8").read().strip()
    if not prompt:
        sys.exit("Donne --prompt ou --prompt-file.")
    generer(a.model, prompt, a.out, a.n, a.ratio)


if __name__ == "__main__":
    main()
