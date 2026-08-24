// ============ GLOSSAIRE PAR NIVEAU (quiz de définitions) ============
// Chaque terme a une définition de référence (affichée après coup, côte à côte
// avec la réponse de l'utilisateur) et une liste de CONCEPTS attendus.
// Chaque concept est un groupe de variantes (racines/synonymes) — un concept est
// considéré "trouvé" si UNE SEULE de ses variantes apparaît dans la réponse.
// Ça évite qu'un simple accord grammatical (ex: "acheteur" vs "acheteuse") fasse
// rater une réponse par ailleurs correcte.
// Chaque définition de référence a été vérifiée pour bien valider son propre quiz.

const GLOSSARY_PASS_THRESHOLD = 0.6; // 60% des concepts minimum pour valider un terme

const GLOSSARY_TERMS = {
  debutant: [
    {
      id: "support",
      term: { fr: "Support", en: "Support" },
      definition: {
        fr: "Un niveau de prix où la pression acheteuse a tendance à stopper une baisse.",
        en: "A price level where buying pressure tends to stop a decline.",
      },
      keywords: {
        fr: [["niveau"], ["prix"], ["achet", "achat"], ["stop", "arret", "bloque"], ["baisse", "chute", "recul"]],
        en: [["level"], ["price"], ["buy"], ["stop", "halt"], ["decline", "drop", "fall"]],
      },
    },
    {
      id: "resistance",
      term: { fr: "Résistance", en: "Resistance" },
      definition: {
        fr: "Un niveau de prix où la pression vendeuse a tendance à stopper une hausse.",
        en: "A price level where selling pressure tends to stop a rise.",
      },
      keywords: {
        fr: [["niveau"], ["prix"], ["vend", "vente"], ["stop", "arret", "bloque"], ["hausse", "monte", "augment"]],
        en: [["level"], ["price"], ["sell"], ["stop", "halt"], ["rise", "rising", "increase"]],
      },
    },
    {
      id: "tendance",
      term: { fr: "Tendance", en: "Trend" },
      definition: {
        fr: "La direction générale que suit le prix d'un actif sur une période donnée.",
        en: "The general direction an asset's price follows over a given period.",
      },
      keywords: {
        fr: [["direction"], ["prix"], ["actif", "marche"], ["periode", "duree"]],
        en: [["direction"], ["price"], ["asset", "market"], ["period", "time"]],
      },
    },
    {
      id: "chandelier",
      term: { fr: "Chandelier japonais", en: "Candlestick" },
      definition: {
        fr: "Une représentation graphique montrant le prix d'ouverture, de clôture, le plus haut et le plus bas sur une période.",
        en: "A chart representation showing the opening price, closing price, high, and low over a period.",
      },
      keywords: {
        fr: [["ouvert"], ["clotur"], ["haut"], ["bas"], ["prix"], ["periode"]],
        en: [["open"], ["clos"], ["high"], ["low"], ["price"], ["period"]],
      },
    },
  ],
  intermediaire: [
    {
      id: "pullback",
      term: { fr: "Pullback", en: "Pullback" },
      definition: {
        fr: "Un retour temporaire du prix contre la tendance principale, avant que celle-ci ne reprenne.",
        en: "A temporary price move against the main trend, before the trend resumes.",
      },
      keywords: {
        fr: [["retour"], ["temporaire", "court"], ["tendance"], ["contre", "oppose"], ["repren", "continu"]],
        en: [["temporary", "short"], ["against", "opposite"], ["trend"], ["resum", "continu"]],
      },
    },
    {
      id: "volatilite",
      term: { fr: "Volatilité", en: "Volatility" },
      definition: {
        fr: "L'amplitude des variations de prix d'un actif sur une période donnée.",
        en: "The magnitude of an asset's price fluctuations over a given period.",
      },
      keywords: {
        fr: [["amplitude", "ampleur"], ["variation", "mouvement"], ["prix"], ["periode"], ["actif"]],
        en: [["magnitude", "size"], ["fluctuat", "movement"], ["price"], ["period"], ["asset"]],
      },
    },
    {
      id: "biais_confirmation",
      term: { fr: "Biais de confirmation", en: "Confirmation bias" },
      definition: {
        fr: "La tendance à chercher, interpréter ou privilégier les informations qui confirment ce qu'on pense déjà.",
        en: "The tendency to seek, interpret, or favor information that confirms what one already believes.",
      },
      keywords: {
        fr: [["cherch", "recherch"], ["confirm"], ["deja", "avance"], ["pense", "croi", "crois"]],
        en: [["seek", "search"], ["confirm"], ["already"], ["believ", "think"]],
      },
    },
    {
      id: "ratio_risque",
      term: { fr: "Ratio risque/récompense", en: "Risk/reward ratio" },
      definition: {
        fr: "La comparaison entre ce qu'on risque de perdre sur un trade et ce qu'on espère gagner.",
        en: "The comparison between what you risk losing on a trade and what you hope to gain.",
      },
      keywords: {
        fr: [["compar", "rapport"], ["risque"], ["perd", "perte"], ["trade", "position"], ["gagn", "gain"]],
        en: [["compar", "ratio"], ["risk"], ["los", "loss"], ["trade", "position"], ["gain", "win"]],
      },
    },
  ],
  experimente: [
    {
      id: "range",
      term: { fr: "Range", en: "Range" },
      definition: {
        fr: "Une phase où le marché évolue entre deux niveaux de prix, sans tendance claire.",
        en: "A phase where the market moves between two price levels, without a clear trend.",
      },
      keywords: {
        fr: [["entre"], ["niveau"], ["sans", "aucune"], ["tendance"], ["marche"]],
        en: [["between"], ["level"], ["without", "no clear"], ["trend"], ["market"]],
      },
    },
    {
      id: "fausse_cassure",
      term: { fr: "Fausse cassure", en: "False breakout" },
      definition: {
        fr: "Un mouvement de prix qui dépasse un niveau clé puis repart dans l'autre sens, piégeant les traders.",
        en: "A price move that breaks a key level then reverses direction, trapping traders.",
      },
      keywords: {
        fr: [["depass", "casse", "franchi"], ["niveau"], ["repart", "retourn", "revient"], ["piege", "trompe"], ["sens", "direction"]],
        en: [["break", "cross"], ["level"], ["revers", "return"], ["trap", "fool"], ["direction"]],
      },
    },
    {
      id: "sur_analyse",
      term: { fr: "Sur-analyse", en: "Overanalysis" },
      definition: {
        fr: "Le fait de trop réfléchir à une décision, au point de fausser son jugement ou de ne plus agir.",
        en: "Thinking too much about a decision, to the point of clouding judgment or being unable to act.",
      },
      keywords: {
        fr: [["trop", "excessi"], ["reflech", "analys", "pense"], ["decision"], ["juge", "jugement"], ["agir", "action"]],
        en: [["too much", "excess", "overthink"], ["think", "analy"], ["decision"], ["judgment", "judgement"], ["act", "action"]],
      },
    },
    {
      id: "drawdown",
      term: { fr: "Drawdown", en: "Drawdown" },
      definition: {
        fr: "La baisse du capital d'un portefeuille depuis son plus haut niveau atteint.",
        en: "The decline of a portfolio's capital from its highest previously reached level.",
      },
      keywords: {
        fr: [["baisse", "perte", "chute"], ["capital"], ["portefeuille", "compte"], ["haut", "sommet"], ["niveau"]],
        en: [["decline", "loss", "drop"], ["capital"], ["portfolio", "account"], ["high", "peak"], ["level"]],
      },
    },
  ],
};

// ============ CORRECTION PAR CONCEPTS (groupes de mots-clés) ============
function normalizeText(str) {
  return str
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, ""); // retire les accents
}

function checkGlossaryAnswer(userAnswer, conceptGroups) {
  const normalized = normalizeText(userAnswer || "");
  const foundConcepts = conceptGroups.filter((group) =>
    group.some((variant) => normalized.includes(normalizeText(variant)))
  );
  const ratio = conceptGroups.length > 0 ? foundConcepts.length / conceptGroups.length : 0;
  return {
    passed: ratio >= GLOSSARY_PASS_THRESHOLD,
    foundCount: foundConcepts.length,
    totalCount: conceptGroups.length,
    ratio,
  };
}
