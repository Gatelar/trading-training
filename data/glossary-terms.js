// ============ GLOSSAIRE PAR NIVEAU (quiz de définitions) ============
// Chaque terme a une définition de référence (affichée après coup, côte à côte
// avec la réponse de l'utilisateur) et une liste de mots-clés attendus.
// La correction n'exige jamais la formulation exacte — juste un nombre minimum
// de mots-clés retrouvés dans la réponse de l'utilisateur (voir GLOSSARY_PASS_THRESHOLD).

const GLOSSARY_PASS_THRESHOLD = 0.6; // 60% des mots-clés minimum pour valider un terme

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
        fr: ["niveau", "prix", "achat", "acheteur", "stop", "arrête", "baisse"],
        en: ["level", "price", "buy", "buyer", "stop", "halt", "decline"],
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
        fr: ["niveau", "prix", "vente", "vendeur", "stop", "arrête", "hausse"],
        en: ["level", "price", "sell", "seller", "stop", "halt", "rise"],
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
        fr: ["direction", "prix", "période", "hausse", "baisse", "mouvement"],
        en: ["direction", "price", "period", "up", "down", "movement"],
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
        fr: ["ouverture", "clôture", "haut", "bas", "prix", "période"],
        en: ["open", "close", "high", "low", "price", "period"],
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
        fr: ["retour", "temporaire", "tendance", "contre", "reprend"],
        en: ["temporary", "against", "trend", "resumes", "pullback"],
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
        fr: ["amplitude", "variation", "prix", "mouvement", "ampleur"],
        en: ["magnitude", "fluctuation", "price", "movement", "swing"],
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
        fr: ["chercher", "confirme", "croyance", "idée", "déjà", "ignore"],
        en: ["seek", "confirm", "belief", "already", "ignore", "favor"],
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
        fr: ["risque", "perte", "gain", "compare", "rapport", "trade"],
        en: ["risk", "loss", "gain", "compare", "ratio", "trade"],
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
        fr: ["entre", "niveaux", "sans", "tendance", "horizontal"],
        en: ["between", "levels", "without", "trend", "sideways"],
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
        fr: ["dépasse", "niveau", "repart", "retourne", "piège", "sens"],
        en: ["breaks", "level", "reverses", "direction", "trap"],
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
        fr: ["trop", "réfléchir", "décision", "bloque", "excès", "juge"],
        en: ["overthink", "decision", "clouding", "judgment", "unable"],
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
        fr: ["baisse", "capital", "haut", "perte", "portefeuille"],
        en: ["decline", "capital", "high", "loss", "portfolio"],
      },
    },
  ],
};

// ============ CORRECTION PAR MOTS-CLÉS ============
function normalizeText(str) {
  return str
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, ""); // retire les accents
}

function checkGlossaryAnswer(userAnswer, keywordList) {
  const normalized = normalizeText(userAnswer || "");
  const found = keywordList.filter((kw) => normalized.includes(normalizeText(kw)));
  const ratio = keywordList.length > 0 ? found.length / keywordList.length : 0;
  return {
    passed: ratio >= GLOSSARY_PASS_THRESHOLD,
    foundCount: found.length,
    totalCount: keywordList.length,
    ratio,
  };
}
