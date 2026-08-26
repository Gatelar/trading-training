import React, { useState, useMemo, useEffect, useRef } from "react";
import ReactDOM from "react-dom/client";
import { createChart, CandlestickSeries, ColorType, CrosshairMode, LineStyle } from "lightweight-charts";
import {
  TrendingUp,
  TrendingDown,
  RefreshCw,
  ChevronLeft,
  ChevronRight,
  Sparkles,
  Target,
  Eye,
  Check,
  X,
  Gem,
  ArrowLeftRight,
  BarChart3,
  Coins,
  Minus,
  Layers,
  Trash2,
} from "lucide-react";

// ============ PALETTE (identique au reste du site) ============
const C_BG = "#10140f";
const C_BG_SOFT = "#0c0f0c";
const C_ACCENT = "#CDFC8A";
const C_ACCENT_DIM = "#8fbf5a";
const C_TEXT = "#f4f6f2";
const C_TEXT_MUTED = "#8A938B";
const C_TEXT_DIM = "#5c655c";
const C_BORDER = "#1c211c";
const C_GRID = "rgba(205, 252, 138, 0.05)";
const C_SCALE_BORDER = "rgba(205, 252, 138, 0.15)";

// ============ TRADUCTION (FR/EN) ============
// Partage la même clé localStorage que le reste du site (i18n.js) pour rester synchronisé.
const TT_LANG_KEY = "tt_lang";

function getStoredLang() {
  try {
    return localStorage.getItem(TT_LANG_KEY) || "fr";
  } catch (e) {
    return "fr";
  }
}

function setStoredLang(lang) {
  try {
    localStorage.setItem(TT_LANG_KEY, lang);
  } catch (e) {}
}

const T = {
  prototypeLabel: { fr: "TRADE TRAINER — PROTOTYPE", en: "TRADE TRAINER — PROTOTYPE" },
  backHome: { fr: "← Accueil", en: "← Home" },
  step1: { fr: "ÉTAPE 1 / 2", en: "STEP 1 / 2" },
  chooseLevelTitle: { fr: "Choisis ton niveau", en: "Choose your level" },
  chooseLevelSubtitle: { fr: "La difficulté des configurations s'ajuste en fonction.", en: "The difficulty of the setups adjusts accordingly." },
  step2: { fr: "ÉTAPE 2 / 2 ·", en: "STEP 2 / 2 ·" },
  changeLevelLink: { fr: "Changer de niveau", en: "Change level" },
  chooseMarketTitle: { fr: "Sur quel marché ?", en: "Which market?" },
  chooseMarketSubtitle: { fr: "Les exercices porteront sur l'actif choisi.", en: "Exercises will be based on the chosen asset." },
  realDataBadge: { fr: "données réelles", en: "real data" },
  session: { fr: "SESSION", en: "SESSION" },
  newExercise: { fr: "Nouvel exercice", en: "New exercise" },
  loadingReal: { fr: "Chargement des données réelles de", en: "Loading real data for" },
  contextTitle: { fr: "Contexte marché", en: "Market context" },
  example: { fr: "exemple", en: "example" },
  keyIndicators: { fr: "INDICATEURS CLÉS", en: "KEY INDICATORS" },
  bceRateAt: { fr: "Taux BCE (au", en: "ECB rate (as of" },
  trendUp: { fr: "hausse", en: "up" },
  trendDown: { fr: "baisse", en: "down" },
  trendStable: { fr: "stable", en: "stable" },
  highLowPeriod: { fr: "Plus haut / plus bas période", en: "Period high / low" },
  totalRange: { fr: "Amplitude totale", en: "Total range" },
  avgDailyMove: { fr: "Mouvement quotidien moyen", en: "Average daily move" },
  upDownCandles: { fr: "Bougies hausse / baisse", en: "Up / down candles" },
  recentVolatility: { fr: "Volatilité récente", en: "Recent volatility" },
  perDay: { fr: "/ jour", en: "/ day" },
  trendYourTurn: { fr: "Selon toi, la tendance va plutôt...", en: "In your view, the trend is more likely to..." },
  goUp: { fr: "Monter", en: "Go up" },
  goDown: { fr: "Descendre", en: "Go down" },
  openPosition: { fr: "Tu ouvres une position...", en: "You open a position..." },
  buy: { fr: "Acheter", en: "Buy" },
  sell: { fr: "Vendre", en: "Sell" },
  yourAnalysis: { fr: "Ton analyse", en: "Your analysis" },
  optional: { fr: "(facultatif)", en: "(optional)" },
  analysisPlaceholder: { fr: "Structure, niveaux clés, ce que tu observes...", en: "Structure, key levels, what you observe..." },
  seeMore: { fr: "Voir la suite", en: "See what happened" },
  goodCall: { fr: "Bien vu", en: "Good call" },
  missed: { fr: "Raté", en: "Missed" },
  marketDid: { fr: "le marché a fait", en: "the market did" },
  longPosition: { fr: "longue", en: "long" },
  shortPosition: { fr: "courte", en: "short" },
  positionResult: { fr: "Position", en: "Position" },
  result: { fr: "résultat", en: "result" },
  compareAnalysis: { fr: "compare avec ton analyse.", en: "compare with your analysis." },
  nextExercise: { fr: "Exercice suivant", en: "Next exercise" },
  drawInstructions: { fr: "Clique et fais glisser sur le graphique pour tracer", en: "Click and drag on the chart to draw" },
  chartAriaLabel: { fr: "Graphique en chandeliers", en: "Candlestick chart" },
  lineTool: { fr: "Ligne", en: "Line" },
  fibTool: { fr: "Fibonacci", en: "Fibonacci" },
  clear: { fr: "Effacer", en: "Clear" },
  now: { fr: "MAINTENANT", en: "NOW" },
  debriefLabel: { fr: "DEBRIEF", en: "DEBRIEF" },
  smaCompareTitle: { fr: "Comparaison à une règle systématique (SMA", en: "Comparison to a systematic rule (SMA" },
  ruleWouldSuggest: { fr: "La règle aurait suggéré :", en: "The rule would have suggested:" },
  realResult: { fr: "Résultat réel :", en: "Actual result:" },
  ruleAligned: { fr: "règle alignée", en: "rule aligned" },
  ruleDisagreed: { fr: "règle en désaccord", en: "rule disagreed" },
  biasQuestion: { fr: "Est-ce que l'un de ces biais s'est glissé dans ta décision ?", en: "Did any of these biases creep into your decision?" },
  optionalPlaceholder: { fr: "Facultatif...", en: "Optional..." },
  loadErrorPrefix: { fr: "Impossible de charger les données réelles de", en: "Unable to load real data for" },
  loadErrorSuffix: { fr: "pour le moment.", en: "at the moment." },
  exampleDisclaimer: { fr: "Contexte illustratif pour ce prototype — données et dates simulées en attendant leur intégration réelle.", en: "Illustrative context for this prototype — simulated data and dates until real integration is complete." },

  // ---- Gestion du risque (stop-loss / take-profit) ----
  riskStepTitle: { fr: "Place ton stop-loss et ton take-profit", en: "Place your stop-loss and take-profit" },
  riskStepSubtitle: { fr: "Clique un outil, puis clique sur le graphique pour placer le niveau de prix.", en: "Click a tool, then click on the chart to place the price level." },
  stopLossTool: { fr: "Stop-loss", en: "Stop-loss" },
  takeProfitTool: { fr: "Take-profit", en: "Take-profit" },
  riskNotSet: { fr: "non placé", en: "not set" },
  riskInvalidStop: { fr: "Le stop-loss doit être du côté perdant de ta position.", en: "The stop-loss must be on the losing side of your position." },
  riskInvalidTp: { fr: "Le take-profit doit être du côté gagnant de ta position.", en: "The take-profit must be on the winning side of your position." },
  confirmTrade: { fr: "Valider mon trade", en: "Confirm my trade" },
  riskRewardLabel: { fr: "Ratio risque/récompense", en: "Risk/reward ratio" },
  stopHit: { fr: "Stop-loss touché", en: "Stop-loss hit" },
  tpHit: { fr: "Take-profit touché", en: "Take-profit hit" },
  neitherHit: { fr: "Ni l'un ni l'autre touché — position close à la fin de la période", en: "Neither hit — position closed at the end of the period" },
  resultInR: { fr: "Résultat", en: "Result" },

  // ---- Séance complète ----
  sessionProgress: { fr: "Exercice", en: "Exercise" },
  seeSessionSummary: { fr: "Voir le résumé de séance", en: "See session summary" },
  sessionSummaryTitle: { fr: "Résumé de séance", en: "Session summary" },
  sessionSummarySubtitle: { fr: "5 exercices enchaînés — la régularité compte plus qu'un coup de chance isolé.", en: "5 exercises in a row — consistency matters more than a single lucky call." },
  sessionExercisesCount: { fr: "Exercices réalisés", en: "Exercises completed" },
  sessionWinRate: { fr: "Taux de réussite", en: "Win rate" },
  sessionCumulativeR: { fr: "R cumulé", en: "Cumulative R" },
  sessionAvgR: { fr: "R moyen par trade", en: "Average R per trade" },
  sessionBestTrade: { fr: "Meilleur trade", en: "Best trade" },
  sessionWorstTrade: { fr: "Pire trade", en: "Worst trade" },
  sessionDetailTitle: { fr: "Détail des exercices", en: "Exercise breakdown" },
  newSession: { fr: "Nouvelle séance", en: "New session" },
  changeMarket: { fr: "Changer de marché", en: "Change market" },

  // ---- Identification de structure (support/résistance) ----
  structureStepTitle: { fr: "Identifie la structure du marché", en: "Identify the market structure" },
  structureStepSubtitle: { fr: "Avant de te positionner, place un support et une résistance sur le graphique.", en: "Before taking a position, place a support and a resistance on the chart." },
  supportTool: { fr: "Support", en: "Support" },
  resistanceTool: { fr: "Résistance", en: "Resistance" },
  confirmStructure: { fr: "Valider la structure", en: "Confirm structure" },
  structureResultTitle: { fr: "Lecture de structure", en: "Structure reading" },
  structurePrecise: { fr: "Précis", en: "Precise" },
  structureClose: { fr: "Proche", en: "Close" },
  structureFar: { fr: "Loin", en: "Off" },
  structureNoPivot: { fr: "Pas de point de référence clair sur cette période", en: "No clear reference point over this period" },

  // ---- Quiz d'actualité réelle (EUR/USD) ----
  newsQuizTitle: { fr: "D'après toi, quel événement explique ce mouvement ?", en: "Which event do you think explains this move?" },
  newsQuizCorrect: { fr: "✓ Exact —", en: "✓ Correct —" },
  newsQuizIncorrect: { fr: "✗ En réalité —", en: "✗ Actually —" },

  // ---- Progression entre niveaux ----
  progressionUnlockedTitle: { fr: "🔓 Niveau suivant débloqué !", en: "🔓 Next level unlocked!" },
  progressionUnlockedBody: { fr: "Ta performance ouvre l'accès au niveau suivant.", en: "Your performance unlocks the next level." },
};

function t(key, lang) {
  const entry = T[key];
  if (!entry) return key;
  return entry[lang] || entry.fr;
}
const C_UP = "#CDFC8A";
const C_DOWN = "#EF4444";
const C_FIB = "#a78bfa";

function mulberry32(a) {
  return function () {
    a |= 0;
    a = (a + 0x6d2b79f5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

function buildPhases(levelId, dir) {
  if (levelId === "debutant") {
    return [{ drift: dir * 0.011, vol: 0.006, len: 46 }];
  }
  if (levelId === "intermediaire") {
    return [
      { drift: dir * 0.009, vol: 0.009, len: 22 },
      { drift: -dir * 0.006, vol: 0.01, len: 14 },
      { drift: dir * 0.008, vol: 0.009, len: 14 },
    ];
  }
  return [
    { drift: dir * 0.003, vol: 0.014, len: 16 },
    { drift: -dir * 0.01, vol: 0.02, len: 6 },
    { drift: dir * 0.002, vol: 0.016, len: 16 },
    { drift: dir * 0.006, vol: 0.014, len: 16 },
  ];
}

function generateScenario(rng, basePrice, phases) {
  let price = basePrice;
  const candles = [];
  let idx = 0;
  phases.forEach((phase) => {
    for (let k = 0; k < phase.len; k++) {
      const open = price;
      const noise = ((rng() + rng() + rng()) / 3 - 0.5) * 2;
      const change = phase.drift + noise * phase.vol;
      let close = open * (1 + change);
      if (close < open * 0.5) close = open * 0.5;
      const extra = Math.abs(close - open) * 0.5 + open * phase.vol * 0.3;
      const high = Math.max(open, close) + extra * rng();
      const low = Math.max(Math.min(open, close) - extra * rng(), 0.0001);
      candles.push({ i: idx, open, high, low, close });
      price = close;
      idx++;
    }
  });

  // Dates fabriquées (jours ouvrés consécutifs) uniquement pour l'affichage de l'axe temporel.
  // Ces scénarios ne sont pas des données réelles — voir le badge "exemple" dans l'interface.
  const total = candles.length;
  const today = new Date();
  let cursor = new Date(today);
  const businessDays = [];
  while (businessDays.length < total) {
    cursor = new Date(cursor.getTime() - 24 * 60 * 60 * 1000);
    const day = cursor.getDay();
    if (day !== 0 && day !== 6) businessDays.push(new Date(cursor));
  }
  businessDays.reverse();
  candles.forEach((c, i) => {
    c.date = businessDays[i].toISOString().slice(0, 10);
  });

  return candles;
}

// ============ DONNÉES RÉELLES (Alpha Vantage + CoinGecko) ============
const ALPHA_VANTAGE_KEY = "5CL73VJ2EJMEBVF2";
const CACHE_TTL_MS = 24 * 60 * 60 * 1000; // 1 jour

function readCache(key) {
  try {
    const cached = localStorage.getItem(key);
    if (!cached) return null;
    const parsed = JSON.parse(cached);
    if (Date.now() - parsed.fetchedAt < CACHE_TTL_MS && parsed.series.length > 20) return parsed.series;
  } catch (e) {}
  return null;
}

function writeCache(key, series) {
  try {
    localStorage.setItem(key, JSON.stringify({ fetchedAt: Date.now(), series }));
  } catch (e) {}
}

async function fetchAlphaVantageFxDaily(cacheKey) {
  const cached = readCache(cacheKey);
  if (cached) return cached;
  const url = `https://www.alphavantage.co/query?function=FX_DAILY&from_symbol=EUR&to_symbol=USD&outputsize=full&apikey=${ALPHA_VANTAGE_KEY}`;
  const res = await fetch(url);
  const data = await res.json();
  const raw = data["Time Series FX (Daily)"];
  if (!raw) throw new Error(data["Note"] || data["Information"] || "Données EUR/USD indisponibles");
  const series = Object.entries(raw)
    .map(([date, v]) => ({ date, open: parseFloat(v["1. open"]), high: parseFloat(v["2. high"]), low: parseFloat(v["3. low"]), close: parseFloat(v["4. close"]) }))
    .sort((a, b) => (a.date < b.date ? -1 : 1));
  writeCache(cacheKey, series);
  return series;
}

async function fetchAlphaVantageStockDaily(symbol, cacheKey) {
  const cached = readCache(cacheKey);
  if (cached) return cached;
  const url = `https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=${symbol}&outputsize=full&apikey=${ALPHA_VANTAGE_KEY}`;
  const res = await fetch(url);
  const data = await res.json();
  const raw = data["Time Series (Daily)"];
  if (!raw) throw new Error(data["Note"] || data["Information"] || `Données ${symbol} indisponibles`);
  const series = Object.entries(raw)
    .map(([date, v]) => ({ date, open: parseFloat(v["1. open"]), high: parseFloat(v["2. high"]), low: parseFloat(v["3. low"]), close: parseFloat(v["4. close"]) }))
    .sort((a, b) => (a.date < b.date ? -1 : 1));
  writeCache(cacheKey, series);
  return series;
}

async function fetchCoinGeckoOhlc(cacheKey) {
  const cached = readCache(cacheKey);
  if (cached) return cached;
  const url = `https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=usd&days=365`;
  const res = await fetch(url);
  const data = await res.json();
  if (!Array.isArray(data) || data.length === 0) throw new Error("Données BTC/USD indisponibles");
  const series = data.map(([ts, open, high, low, close]) => ({
    date: new Date(ts).toISOString().slice(0, 10),
    open,
    high,
    low,
    close,
  }));
  writeCache(cacheKey, series);
  return series;
}

function pickRealWindow(fullSeries, rng, windowLen, constrainToMacroRange) {
  let pool = fullSeries;
  if (constrainToMacroRange && typeof MACRO_EVENTS_EURUSD !== "undefined" && MACRO_EVENTS_EURUSD.length > 0) {
    const minDate = MACRO_EVENTS_EURUSD[0].date;
    const filtered = fullSeries.filter((c) => c.date >= minDate);
    if (filtered.length >= windowLen) pool = filtered;
  }
  const maxStart = pool.length - windowLen;
  if (maxStart <= 0) return pool.map((c, i) => ({ ...c, i }));
  const start = Math.floor(rng() * maxStart);
  return pool.slice(start, start + windowLen).map((c, i) => ({ ...c, i }));
}

function windowLenForLevel(levelId) {
  if (levelId === "debutant") return 40;
  if (levelId === "intermediaire") return 46;
  return 52;
}

function getMacroEventsInWindow(windowCandles, visibleCount) {
  if (!windowCandles.length || typeof MACRO_EVENTS_EURUSD === "undefined") return [];
  const visible = windowCandles.slice(0, visibleCount);
  const startDate = visible[0].date;
  const endDate = visible[visible.length - 1].date;
  return MACRO_EVENTS_EURUSD.filter((ev) => ev.date >= startDate && ev.date <= endDate);
}

// ============ QUIZ "QUEL ÉVÉNEMENT EXPLIQUE CE MOUVEMENT ?" (EUR/USD, post-reveal) ============
// Cherche un vrai événement BCE tombé pendant la période qui vient d'être révélée
// (entre le point d'entrée et la fin du graphique) — pas avant, pour ne rien spoiler.
function getMacroEventsInRevealedPeriod(candles, visibleCount) {
  if (!candles.length || typeof MACRO_EVENTS_EURUSD === "undefined") return [];
  const cutoffDate = candles[visibleCount - 1].date;
  const endDate = candles[candles.length - 1].date;
  return MACRO_EVENTS_EURUSD.filter((ev) => ev.date > cutoffDate && ev.date <= endDate).sort((a, b) => (a.date < b.date ? -1 : 1));
}

function shuffleWithRng(arr, rng) {
  const copy = [...arr];
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(rng() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
}

function buildNewsQuiz(rng, candles, visibleCount) {
  const actualEvents = getMacroEventsInRevealedPeriod(candles, visibleCount);
  if (actualEvents.length === 0 || typeof MACRO_EVENTS_EURUSD === "undefined") return null;
  const correct = actualEvents[0];
  const pool = MACRO_EVENTS_EURUSD.filter((ev) => ev.date !== correct.date);
  if (pool.length < 2) return null;
  const distractors = shuffleWithRng(pool, rng).slice(0, 2);
  const options = shuffleWithRng([correct, ...distractors], rng);
  return { correct, options };
}

function formatAxisDate(dateStr, lang) {
  if (!dateStr) return "";
  const d = new Date(dateStr + "T00:00:00");
  return d.toLocaleDateString(lang === "en" ? "en-US" : "fr-FR", { day: "2-digit", month: "short" });
}

const LEVELS = [
  {
    id: "debutant",
    code: "LVL.01",
    label: { fr: "Débutant", en: "Beginner" },
    tagline: { fr: "Tendances nettes, peu de bruit", en: "Clean trends, little noise" },
    detail: { fr: "Une direction claire, idéale pour apprendre à lire un graphique.", en: "A clear direction, ideal for learning to read a chart." },
  },
  {
    id: "intermediaire",
    code: "LVL.02",
    label: { fr: "Intermédiaire", en: "Intermediate" },
    tagline: { fr: "Retournements et pullbacks", en: "Reversals and pullbacks" },
    detail: { fr: "La tendance change en cours de route, il faut ajuster sa lecture.", en: "The trend shifts along the way, forcing you to adjust." },
  },
  {
    id: "experimente",
    code: "LVL.03",
    label: { fr: "Expérimenté", en: "Experienced" },
    tagline: { fr: "Range, faux signaux, forte volatilité", en: "Ranges, false signals, high volatility" },
    detail: { fr: "Peu de structure évidente, avec de fausses cassures.", en: "Little obvious structure, with fake breakouts." },
  },
];

const DOMAINS = [
  {
    id: "or",
    label: { fr: "Or et métaux précieux", en: "Gold & precious metals" },
    code: "XAU",
    base: 2380,
    Icon: Gem,
    format: (v) => `$${v.toLocaleString("en-US", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`,
    real: true,
    timeframe: "1D",
    fetchSeries: () => fetchAlphaVantageStockDaily("GLD", "tt_gld_daily_cache_v1"),
    realNote: {
      fr: "Cours réel de l'ETF SPDR Gold Shares (GLD), un proxy coté qui suit le prix de l'or physique (Alpha Vantage) — pas le prix spot exact de l'once.",
      en: "Real price of the SPDR Gold Shares ETF (GLD), a listed proxy tracking physical gold (Alpha Vantage) — not the exact spot price per ounce.",
    },
  },
  {
    id: "forex",
    label: { fr: "Forex — EUR/USD", en: "Forex — EUR/USD" },
    code: "FX",
    base: 1.085,
    Icon: ArrowLeftRight,
    format: (v) => v.toLocaleString("en-US", { minimumFractionDigits: 4, maximumFractionDigits: 4 }),
    real: true,
    timeframe: "1D",
    fetchSeries: () => fetchAlphaVantageFxDaily("tt_eurusd_daily_cache_v1"),
    constrainToMacroRange: true,
    hasRealNews: true,
    realNote: {
      fr: "Cotations EUR/USD réelles (Alpha Vantage) et décisions de politique monétaire BCE réelles et datées.",
      en: "Real EUR/USD quotes (Alpha Vantage) and real, dated ECB monetary policy decisions.",
    },
  },
  {
    id: "actions",
    label: { fr: "Actions et indices", en: "Stocks & indices" },
    code: "IDX",
    base: 6200,
    Icon: BarChart3,
    format: (v) => `$${v.toLocaleString("en-US", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`,
    real: true,
    timeframe: "1D",
    fetchSeries: () => fetchAlphaVantageStockDaily("SPY", "tt_spy_daily_cache_v1"),
    realNote: {
      fr: "Cours réel du S&P 500 via l'ETF SPY (Alpha Vantage).",
      en: "Real S&P 500 price via the SPY ETF (Alpha Vantage).",
    },
  },
  {
    id: "crypto",
    label: { fr: "Crypto — BTC", en: "Crypto — BTC" },
    code: "BTC",
    base: 68000,
    Icon: Coins,
    format: (v) => `$${v.toLocaleString("en-US", { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`,
    real: true,
    timeframe: "4D",
    fetchSeries: () => fetchCoinGeckoOhlc("tt_btc_4d_cache_v1"),
    realNote: {
      fr: "Cours réel du Bitcoin en bougies de 4 jours (CoinGecko) — pas de granularité journalière disponible gratuitement sur un historique long.",
      en: "Real Bitcoin price in 4-day candles (CoinGecko) — no free daily granularity available over a long history.",
    },
  },
];

const NEWS = {
  or: {
    body: {
      fr: "Contexte type : l'or réagit souvent aux anticipations de taux de la Fed, à la vigueur du dollar et aux tensions géopolitiques qui renforcent son rôle de valeur refuge.",
      en: "Typical context: gold often reacts to Fed rate expectations, dollar strength, and geopolitical tensions that reinforce its safe-haven role.",
    },
    bullets: {
      fr: ["Taux réels et discours de la Fed", "Force du dollar (indice DXY)", "Tensions géopolitiques et demande refuge"],
      en: ["Real rates and Fed commentary", "Dollar strength (DXY index)", "Geopolitical tensions and safe-haven demand"],
    },
  },
  forex: {
    body: {
      fr: "L'EUR/USD réagit aux écarts de politique monétaire entre BCE et Fed, ainsi qu'aux publications macro des deux zones.",
      en: "EUR/USD reacts to monetary policy gaps between the ECB and the Fed, as well as macro releases from both regions.",
    },
    bullets: {
      fr: ["Décisions de taux BCE et Fed", "Chiffres d'inflation", "Données d'emploi américaines"],
      en: ["ECB and Fed rate decisions", "Inflation figures", "US employment data"],
    },
  },
  actions: {
    body: {
      fr: "Contexte type : les indices actions réagissent aux résultats d'entreprises, aux anticipations de taux et à l'appétit pour le risque des marchés.",
      en: "Typical context: stock indices react to corporate earnings, rate expectations, and market risk appetite.",
    },
    bullets: {
      fr: ["Saison des résultats d'entreprises", "Anticipations de taux directeurs", "Sentiment de marché (risk-on / risk-off)"],
      en: ["Corporate earnings season", "Policy rate expectations", "Market sentiment (risk-on / risk-off)"],
    },
  },
  crypto: {
    body: {
      fr: "Contexte type : le bitcoin est sensible au sentiment de risque global, aux flux vers les ETF spot et à l'actualité réglementaire.",
      en: "Typical context: bitcoin is sensitive to overall risk sentiment, spot ETF flows, and regulatory news.",
    },
    bullets: {
      fr: ["Flux vers les ETF spot", "Annonces réglementaires", "Corrélation aux actifs risqués"],
      en: ["Spot ETF flows", "Regulatory announcements", "Correlation to risk assets"],
    },
  },
};

// ============ RESSOURCES EXTERNES PAR MARCHÉ ============
// Pour l'accompagnement dégressif : intermédiaire = piste + lien, expérimenté = lien seul.
const DOMAIN_LINKS = {
  or: {
    hint: {
      fr: "Regarde du côté des taux réels américains et de la force du dollar (indice DXY) sur cette période.",
      en: "Look at US real rates and dollar strength (DXY index) over this period.",
    },
    links: [
      { url: "https://www.investing.com/economic-calendar/", label: { fr: "Calendrier économique — Investing.com", en: "Economic calendar — Investing.com" } },
      { url: "https://www.kitco.com/news/", label: { fr: "Actualités marché de l'or — Kitco", en: "Gold market news — Kitco" } },
      { url: "https://www.gold.org/goldhub", label: { fr: "Données et analyses — World Gold Council", en: "Data & insights — World Gold Council" } },
    ],
  },
  forex: {
    hint: {
      fr: "Regarde du côté des décisions de taux de la BCE et de la Fed sur cette période.",
      en: "Look at ECB and Fed rate decisions over this period.",
    },
    links: [
      { url: "https://www.ecb.europa.eu/press/pr/date/html/index.en.html", label: { fr: "Communiqués de politique monétaire — BCE", en: "Monetary policy statements — ECB" } },
      { url: "https://www.federalreserve.gov/newsevents/calendar.htm", label: { fr: "Calendrier — Réserve fédérale (Fed)", en: "Calendar — Federal Reserve (Fed)" } },
      { url: "https://www.investing.com/economic-calendar/", label: { fr: "Calendrier économique — Investing.com", en: "Economic calendar — Investing.com" } },
    ],
  },
  actions: {
    hint: {
      fr: "Regarde du côté des résultats d'entreprises et du sentiment de marché (risk-on / risk-off) sur cette période.",
      en: "Look at corporate earnings and market sentiment (risk-on / risk-off) over this period.",
    },
    links: [
      { url: "https://www.investing.com/economic-calendar/", label: { fr: "Calendrier économique — Investing.com", en: "Economic calendar — Investing.com" } },
      { url: "https://www.investing.com/earnings-calendar/", label: { fr: "Calendrier des résultats — Investing.com", en: "Earnings calendar — Investing.com" } },
    ],
  },
  crypto: {
    hint: {
      fr: "Regarde du côté des flux vers les ETF spot et du sentiment général du marché crypto sur cette période.",
      en: "Look at spot ETF flows and overall crypto market sentiment over this period.",
    },
    links: [
      { url: "https://alternative.me/crypto/fear-and-greed-index/", label: { fr: "Indice Fear & Greed — Crypto", en: "Fear & Greed Index — Crypto" } },
      { url: "https://www.coindesk.com/", label: { fr: "Actualités crypto — CoinDesk", en: "Crypto news — CoinDesk" } },
      { url: "https://www.coingecko.com/en/categories", label: { fr: "Vue d'ensemble du marché — CoinGecko", en: "Market overview — CoinGecko" } },
    ],
  },
};

// ============ INDICATEURS CALCULÉS (pour le niveau débutant) ============
function computeVolatility(candles, visibleCount) {
  const visible = candles.slice(0, visibleCount);
  if (visible.length < 3) return null;
  const returns = [];
  for (let i = 1; i < visible.length; i++) {
    returns.push((visible[i].close - visible[i - 1].close) / visible[i - 1].close);
  }
  const mean = returns.reduce((a, b) => a + b, 0) / returns.length;
  const variance = returns.reduce((a, b) => a + (b - mean) ** 2, 0) / returns.length;
  return Math.sqrt(variance) * 100; // en %
}

function computeRangeStats(candles, visibleCount, format) {
  const visible = candles.slice(0, visibleCount);
  if (visible.length < 2) return null;
  const high = Math.max(...visible.map((c) => c.high));
  const low = Math.min(...visible.map((c) => c.low));
  const rangePct = ((high - low) / low) * 100;
  const avgDailyRangePct =
    (visible.reduce((sum, c) => sum + (c.high - c.low) / c.open, 0) / visible.length) * 100;
  const upCount = visible.filter((c) => c.close >= c.open).length;
  const downCount = visible.length - upCount;
  return {
    high: format(high),
    low: format(low),
    rangePct,
    avgDailyRangePct,
    upCount,
    downCount,
  };
}

function getRateContext(windowCandles, visibleCount) {
  if (typeof MACRO_EVENTS_EURUSD === "undefined" || !windowCandles.length) return null;
  const cutoffDate = windowCandles[visibleCount - 1].date;
  const pastEvents = MACRO_EVENTS_EURUSD.filter((ev) => ev.date <= cutoffDate).sort((a, b) => (a.date < b.date ? 1 : -1));
  if (pastEvents.length === 0) return null;
  const latest = pastEvents[0];
  const previous = pastEvents[1];
  let trend = "stable";
  if (previous) {
    if (latest.rateAfter > previous.rateAfter) trend = "hausse";
    else if (latest.rateAfter < previous.rateAfter) trend = "baisse";
  }
  return { rate: latest.rateAfter, trend, asOf: latest.date };
}

// ============ RÈGLE TECHNIQUE SYSTÉMATIQUE (comparaison, niveau expérimenté) ============
// Croisement de moyennes mobiles (SMA rapide vs SMA lente), calculé uniquement
// sur les données visibles AVANT le reveal — la règle ne triche pas non plus.
function sma(values, period, endIndex) {
  if (endIndex + 1 < period) return null;
  let sum = 0;
  for (let i = endIndex - period + 1; i <= endIndex; i++) sum += values[i];
  return sum / period;
}

function computeSmaSignal(candles, visibleCount, fast = 5, slow = 20) {
  if (visibleCount < slow + 1) return null;
  const closes = candles.map((c) => c.close);
  const idx = visibleCount - 1;
  const fastVal = sma(closes, fast, idx);
  const slowVal = sma(closes, slow, idx);
  if (fastVal === null || slowVal === null) return null;
  return { signal: fastVal > slowVal ? "hausse" : "baisse", fast, slow };
}

// ============ GESTION DU RISQUE : STOP-LOSS / TAKE-PROFIT ============
// Vérifie que le stop est bien du côté perdant et le TP du côté gagnant, selon la position.
// ============ IDENTIFICATION DE STRUCTURE : SUPPORT / RÉSISTANCE ============
// Détecte les points pivots (swing highs/lows) sur la portion visible du graphique
// pour évaluer la précision du support/résistance placés par l'utilisateur.
function findSwingPoints(candles, visibleCount, lookback = 2) {
  const visible = candles.slice(0, visibleCount);
  const swingHighs = [];
  const swingLows = [];
  for (let i = lookback; i < visible.length - lookback; i++) {
    const c = visible[i];
    let isHigh = true;
    let isLow = true;
    for (let j = i - lookback; j <= i + lookback; j++) {
      if (j === i) continue;
      if (visible[j].high >= c.high) isHigh = false;
      if (visible[j].low <= c.low) isLow = false;
    }
    if (isHigh) swingHighs.push(c.high);
    if (isLow) swingLows.push(c.low);
  }
  return { swingHighs, swingLows };
}

function scoreStructurePlacement(userPrice, referencePrices) {
  if (userPrice === null || userPrice === undefined || referencePrices.length === 0) return null;
  let nearest = null;
  let minDistPct = Infinity;
  referencePrices.forEach((p) => {
    const distPct = (Math.abs(userPrice - p) / p) * 100;
    if (distPct < minDistPct) {
      minDistPct = distPct;
      nearest = p;
    }
  });
  let rating;
  if (minDistPct <= 1) rating = "precise";
  else if (minDistPct <= 3) rating = "close";
  else rating = "far";
  return { nearest, distPct: minDistPct, rating };
}

function isValidRiskSetup(position, entryPrice, stopPrice, takeProfitPrice) {
  if (stopPrice === null || takeProfitPrice === null) return { valid: false };
  if (position === "achat") {
    if (stopPrice >= entryPrice) return { valid: false, reason: "stop" };
    if (takeProfitPrice <= entryPrice) return { valid: false, reason: "tp" };
  } else {
    if (stopPrice <= entryPrice) return { valid: false, reason: "stop" };
    if (takeProfitPrice >= entryPrice) return { valid: false, reason: "tp" };
  }
  return { valid: true };
}

// Simule candle par candle (à partir du point d'entrée) pour voir si le stop ou le
// take-profit est touché en premier, et calcule le résultat en multiples de R
// (R = distance entre le prix d'entrée et le stop-loss = "1 unité de risque").
function simulateRiskOutcome(candles, visibleCount, position, entryPrice, stopPrice, takeProfitPrice) {
  const riskDistance = Math.abs(entryPrice - stopPrice);
  if (riskDistance <= 0) return null;

  const future = candles.slice(visibleCount);
  let outcome = "neither";

  for (const c of future) {
    if (position === "achat") {
      const stopTouched = c.low <= stopPrice;
      const tpTouched = c.high >= takeProfitPrice;
      if (stopTouched && tpTouched) {
        // Les deux touchés dans la même bougie : on suppose le pire cas (stop d'abord).
        outcome = "stop";
        break;
      } else if (stopTouched) {
        outcome = "stop";
        break;
      } else if (tpTouched) {
        outcome = "tp";
        break;
      }
    } else {
      const stopTouched = c.high >= stopPrice;
      const tpTouched = c.low <= takeProfitPrice;
      if (stopTouched && tpTouched) {
        outcome = "stop";
        break;
      } else if (stopTouched) {
        outcome = "stop";
        break;
      } else if (tpTouched) {
        outcome = "tp";
        break;
      }
    }
  }

  let rMultiple;
  if (outcome === "stop") {
    rMultiple = -1;
  } else if (outcome === "tp") {
    const rewardDistance = Math.abs(takeProfitPrice - entryPrice);
    rMultiple = rewardDistance / riskDistance;
  } else {
    const lastClose = candles[candles.length - 1].close;
    const move = position === "achat" ? lastClose - entryPrice : entryPrice - lastClose;
    rMultiple = move / riskDistance;
  }

  return { outcome, rMultiple, riskDistance, rewardDistance: Math.abs(takeProfitPrice - entryPrice) };
}

// ============ DEBRIEF POST-RÉVÉLATION, ADAPTÉ AU NIVEAU ============
const DEBRIEF_QUESTIONS = {
  debutant: {
    fr: ["Qu'est-ce qui t'a fait choisir cette direction ?"],
    en: ["What made you choose this direction?"],
  },
  intermediaire: {
    fr: [
      "Ton entrée était-elle basée sur une règle précise ou plutôt une impression ?",
      "Qu'est-ce que tu ferais différemment la prochaine fois ?",
    ],
    en: [
      "Was your entry based on a precise rule, or more on a gut feeling?",
      "What would you do differently next time?",
    ],
  },
  experimente: {
    fr: [
      "Quel était ton raisonnement complet avant le reveal ?",
      "Qu'est-ce qui, avec le recul, aurait dû t'alerter (ou te rassurer) ?",
      "Qu'est-ce que tu ferais différemment la prochaine fois ?",
    ],
    en: [
      "What was your full reasoning before the reveal?",
      "Looking back, what should have alerted (or reassured) you?",
      "What would you do differently next time?",
    ],
  },
};

const BIAS_ITEMS = {
  intermediaire: {
    fr: ["J'ai peut-être sur-analysé la situation", "J'ai suivi mon impression plus que mes règles", "J'ai ignoré le risque"],
    en: ["I may have overanalyzed the situation", "I followed my gut more than my rules", "I ignored risk"],
  },
  experimente: {
    fr: [
      "J'ai peut-être sur-analysé la situation",
      "J'ai suivi mon impression plus que mes règles",
      "J'ai ignoré le risque",
      "Biais de confirmation : j'ai cherché ce qui confirmait mon idée de départ",
      "J'ai changé d'avis en cours de route sans raison claire",
    ],
    en: [
      "I may have overanalyzed the situation",
      "I followed my gut more than my rules",
      "I ignored risk",
      "Confirmation bias: I looked for what confirmed my initial idea",
      "I changed my mind midway without a clear reason",
    ],
  },
};



// Convertit une bougie interne ({ i, date, open, high, low, close }) au format
// attendu par lightweight-charts ({ time, open, high, low, close }).
function toLwcCandle(c) {
  return { time: c.date, open: c.open, high: c.high, low: c.low, close: c.close };
}

function CandlestickChart({
  candles,
  visibleCount,
  revealed,
  format = (v) => v.toFixed(2),
  lang = "fr",
  riskMode = null,
  stopPrice = null,
  takeProfitPrice = null,
  onSetStopPrice,
  onSetTakeProfitPrice,
  structureMode = null,
  supportPrice = null,
  resistancePrice = null,
  onSetSupportPrice,
  onSetResistancePrice,
}) {
  const containerRef = useRef(null);
  const overlayRef = useRef(null);
  const chartRef = useRef(null);
  const seriesRef = useRef(null);
  const priceLinesRef = useRef({});

  const [activeTool, setActiveTool] = useState(null);
  const [drawings, setDrawings] = useState([]); // { type, p1: {time, price}, p2: {time, price}, id }
  const [dragStart, setDragStart] = useState(null);
  const [dragCurrent, setDragCurrent] = useState(null);
  const [, forceRedraw] = useState(0);

  const isDragging = dragStart !== null;
  const interactionMode = activeTool || riskMode || structureMode;

  const entryCandle = candles[visibleCount - 1];
  const lastCandle = candles[candles.length - 1];
  const lastUp = entryCandle && lastCandle ? lastCandle.close >= entryCandle.close : true;

  // ============ CRÉATION DU GRAPHIQUE (une seule fois) ============
  useEffect(() => {
    if (!containerRef.current) return;

    const chart = createChart(containerRef.current, {
      layout: {
        background: { type: ColorType.Solid, color: C_BG },
        textColor: C_TEXT_MUTED,
        fontFamily: "'JetBrains Mono', Inter, sans-serif, monospace",
      },
      grid: {
        vertLines: { color: C_GRID },
        horzLines: { color: C_GRID },
      },
      crosshair: {
        mode: CrosshairMode.Normal,
        vertLine: { color: C_ACCENT, width: 1, style: LineStyle.Dashed, labelBackgroundColor: "#2a3228" },
        horzLine: { color: C_ACCENT, width: 1, style: LineStyle.Dashed, labelBackgroundColor: "#2a3228" },
      },
      rightPriceScale: { borderColor: C_SCALE_BORDER },
      timeScale: { borderColor: C_SCALE_BORDER, timeVisible: true, rightOffset: 3 },
      localization: { priceFormatter: format },
      // Le conteneur peut mesurer 0x0 au tout premier rendu (le layout flex n'est
      // pas encore résolu) : on part d'une taille de repli non nulle, corrigée
      // juste après par resizeToContainer().
      width: containerRef.current.clientWidth || 800,
      height: containerRef.current.clientHeight || 400,
    });

    const series = chart.addSeries(CandlestickSeries, {
      upColor: C_UP,
      downColor: C_DOWN,
      borderVisible: false,
      wickUpColor: C_UP,
      wickDownColor: C_DOWN,
    });

    chartRef.current = chart;
    seriesRef.current = series;

    const redraw = () => forceRedraw((n) => n + 1);
    chart.timeScale().subscribeVisibleTimeRangeChange(redraw);

    function resizeToContainer() {
      if (!containerRef.current) return;
      const w = containerRef.current.clientWidth;
      const h = containerRef.current.clientHeight;
      if (w > 0 && h > 0) chart.resize(w, h);
    }

    // Le ResizeObserver couvre les redimensionnements normaux (fenêtre, mise en
    // page). On y ajoute quelques relances ponctuelles juste après le montage :
    // au tout premier rendu, le conteneur flex peut encore mesurer 0x0 le temps
    // que la mise en page se stabilise, et un observer seul ne suffit pas
    // toujours à rattraper ce cas.
    const resizeObserver = new ResizeObserver(() => {
      resizeToContainer();
      redraw();
    });
    resizeObserver.observe(containerRef.current);

    const settleTimers = [0, 60, 200, 500].map((delay) => setTimeout(resizeToContainer, delay));

    return () => {
      settleTimers.forEach(clearTimeout);
      resizeObserver.disconnect();
      chart.remove();
      chartRef.current = null;
      seriesRef.current = null;
      priceLinesRef.current = {};
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // ============ ALIMENTATION DES BOUGIES (avec révélation animée) ============
  useEffect(() => {
    const series = seriesRef.current;
    if (!series || candles.length === 0) return;

    if (!revealed) {
      series.setData(candles.slice(0, visibleCount).map(toLwcCandle));
      chartRef.current?.timeScale().fitContent();
      return;
    }

    series.setData(candles.slice(0, visibleCount).map(toLwcCandle));
    let cancelled = false;
    let i = visibleCount;
    function step() {
      if (cancelled || i >= candles.length) return;
      series.update(toLwcCandle(candles[i]));
      i++;
      timer = setTimeout(step, 22);
    }
    let timer = setTimeout(step, 22);
    return () => {
      cancelled = true;
      clearTimeout(timer);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [candles, visibleCount, revealed]);

  // ============ LIGNES DE PRIX HORIZONTALES (entrée/sortie, SL/TP, support/résistance) ============
  useEffect(() => {
    const series = seriesRef.current;
    if (!series) return;

    function upsertLine(key, price, options) {
      const lines = priceLinesRef.current;
      if (price === null || price === undefined) {
        if (lines[key]) {
          series.removePriceLine(lines[key]);
          delete lines[key];
        }
        return;
      }
      if (lines[key]) {
        lines[key].applyOptions({ price, ...options });
      } else {
        lines[key] = series.createPriceLine({ price, ...options });
      }
    }

    upsertLine("entry", entryCandle ? entryCandle.close : null, {
      color: C_ACCENT,
      lineWidth: 1,
      lineStyle: LineStyle.Dotted,
      axisLabelVisible: true,
      title: lang === "fr" ? "Entrée" : "Entry",
    });
    upsertLine("exit", revealed && lastCandle && lastCandle !== entryCandle ? lastCandle.close : null, {
      color: lastUp ? C_UP : C_DOWN,
      lineWidth: 1,
      lineStyle: LineStyle.Solid,
      axisLabelVisible: true,
      title: lang === "fr" ? "Sortie" : "Exit",
    });
    upsertLine("stop", stopPrice, {
      color: C_DOWN,
      lineWidth: 2,
      lineStyle: LineStyle.Dashed,
      axisLabelVisible: true,
      title: "SL",
    });
    upsertLine("tp", takeProfitPrice, {
      color: C_UP,
      lineWidth: 2,
      lineStyle: LineStyle.Dashed,
      axisLabelVisible: true,
      title: "TP",
    });
    upsertLine("support", supportPrice, {
      color: "#38bdf8",
      lineWidth: 2,
      lineStyle: LineStyle.Dotted,
      axisLabelVisible: true,
      title: t("supportTool", lang),
    });
    upsertLine("resistance", resistancePrice, {
      color: "#fb923c",
      lineWidth: 2,
      lineStyle: LineStyle.Dotted,
      axisLabelVisible: true,
      title: t("resistanceTool", lang),
    });
  }, [entryCandle, lastCandle, revealed, lastUp, stopPrice, takeProfitPrice, supportPrice, resistancePrice, lang]);

  // ============ DÉSACTIVE LE PAN/ZOOM PENDANT UN OUTIL DE TRACÉ / PLACEMENT ============
  useEffect(() => {
    chartRef.current?.applyOptions({
      handleScroll: !interactionMode,
      handleScale: !interactionMode,
    });
  }, [interactionMode]);

  // ============ CONVERSIONS PIXEL <-> PRIX/TEMPS ============
  function coordsFromEvent(e) {
    const rect = containerRef.current.getBoundingClientRect();
    return { x: e.clientX - rect.left, y: e.clientY - rect.top };
  }
  function priceAtY(y) {
    return seriesRef.current ? seriesRef.current.coordinateToPrice(y) : null;
  }
  function timeAtX(x) {
    return chartRef.current ? chartRef.current.timeScale().coordinateToTime(x) : null;
  }
  function xAtTime(time) {
    if (!chartRef.current || time === null || time === undefined) return null;
    return chartRef.current.timeScale().timeToCoordinate(time);
  }
  function yAtPrice(price) {
    if (!seriesRef.current || price === null || price === undefined) return null;
    return seriesRef.current.priceToCoordinate(price);
  }

  function toggleTool(tool) {
    setDragStart(null);
    setDragCurrent(null);
    setActiveTool((cur) => (cur === tool ? null : tool));
  }

  function handlePointerDown(e) {
    const { x, y } = coordsFromEvent(e);
    if (structureMode) {
      const price = priceAtY(y);
      if (price === null) return;
      if (structureMode === "support" && onSetSupportPrice) onSetSupportPrice(price);
      if (structureMode === "resistance" && onSetResistancePrice) onSetResistancePrice(price);
      return;
    }
    if (riskMode) {
      const price = priceAtY(y);
      if (price === null) return;
      if (riskMode === "stop" && onSetStopPrice) onSetStopPrice(price);
      if (riskMode === "tp" && onSetTakeProfitPrice) onSetTakeProfitPrice(price);
      return;
    }
    if (!activeTool) return;
    const price = priceAtY(y);
    const time = timeAtX(x);
    if (price === null || time === null) return;
    setDragStart({ time, price });
    setDragCurrent({ time, price });
  }

  function handlePointerMove(e) {
    if (!isDragging) return;
    const { x, y } = coordsFromEvent(e);
    const price = priceAtY(y);
    const time = timeAtX(x);
    if (price === null || time === null) return;
    setDragCurrent({ time, price });
  }

  function handlePointerUp() {
    if (!isDragging) return;
    if (dragCurrent) {
      const dx = Math.abs((xAtTime(dragCurrent.time) ?? 0) - (xAtTime(dragStart.time) ?? 0));
      const dy = Math.abs((yAtPrice(dragCurrent.price) ?? 0) - (yAtPrice(dragStart.price) ?? 0));
      if (dx > 6 || dy > 6) {
        setDrawings((prev) => [...prev, { type: activeTool, p1: dragStart, p2: dragCurrent, id: `${Date.now()}-${Math.random()}` }]);
        setActiveTool(null);
      }
    }
    setDragStart(null);
    setDragCurrent(null);
  }

  function renderTrendLine(p1, p2, key, opacity = 1) {
    const x1 = xAtTime(p1.time);
    const y1 = yAtPrice(p1.price);
    const x2 = xAtTime(p2.time);
    const y2 = yAtPrice(p2.price);
    if (x1 === null || y1 === null || x2 === null || y2 === null) return null;
    return (
      <g key={key} opacity={opacity}>
        <line x1={x1} y1={y1} x2={x2} y2={y2} stroke={C_ACCENT} strokeWidth="1.5" />
        <circle cx={x1} cy={y1} r="3" fill={C_ACCENT} />
        <circle cx={x2} cy={y2} r="3" fill={C_ACCENT} />
      </g>
    );
  }

  function renderFib(p1, p2, key, opacity = 1) {
    const x1 = xAtTime(p1.time);
    const x2 = xAtTime(p2.time);
    if (x1 === null || x2 === null) return null;
    const leftX = Math.min(x1, x2);
    const rightX = containerRef.current ? containerRef.current.clientWidth : Math.max(x1, x2) + 100;
    const levels = [0, 0.236, 0.382, 0.5, 0.618, 0.786, 1];
    return (
      <g key={key} opacity={opacity}>
        {levels.map((lvl) => {
          const price = p1.price + (p2.price - p1.price) * lvl;
          const y = yAtPrice(price);
          if (y === null) return null;
          return (
            <g key={lvl}>
              <line
                x1={leftX}
                x2={rightX}
                y1={y}
                y2={y}
                stroke={C_FIB}
                strokeWidth="1"
                strokeDasharray={lvl === 0 || lvl === 1 ? "0" : "3 3"}
                opacity="0.75"
              />
              <text x={leftX + 4} y={y - 3} fontSize="10" fill={C_FIB} className="font-data">
                {(lvl * 100).toFixed(1)}%
              </text>
            </g>
          );
        })}
      </g>
    );
  }

  const nowX = entryCandle ? xAtTime(entryCandle.date) : null;

  return (
    <div className="w-full h-full flex flex-col">
      <div className="flex items-center gap-2 mb-3 shrink-0">
        <button
          onClick={() => toggleTool("trend")}
          className="flex items-center gap-1.5 px-2.5 py-1.5 rounded-md border text-xs font-data transition-colors"
          style={
            activeTool === "trend"
              ? { backgroundColor: C_ACCENT, borderColor: C_ACCENT, color: C_BG }
              : { backgroundColor: C_BG, borderColor: C_BORDER, color: C_TEXT_MUTED }
          }
        >
          <Minus className="w-3.5 h-3.5" /> {t("lineTool", lang)}
        </button>
        <button
          onClick={() => toggleTool("fib")}
          className="flex items-center gap-1.5 px-2.5 py-1.5 rounded-md border text-xs font-data transition-colors"
          style={
            activeTool === "fib"
              ? { backgroundColor: C_FIB, borderColor: C_FIB, color: C_BG }
              : { backgroundColor: C_BG, borderColor: C_BORDER, color: C_TEXT_MUTED }
          }
        >
          <Layers className="w-3.5 h-3.5" /> {t("fibTool", lang)}
        </button>
        {drawings.length > 0 && (
          <button
            onClick={() => {
              setDrawings([]);
              setDragStart(null);
              setDragCurrent(null);
            }}
            className="ml-auto flex items-center gap-1.5 px-2.5 py-1.5 rounded-md border text-xs font-data hover:text-red-400 hover:border-red-500 transition-colors"
            style={{ borderColor: C_BORDER, color: C_TEXT_MUTED }}
          >
            <Trash2 className="w-3.5 h-3.5" /> {t("clear", lang)}
          </button>
        )}
      </div>

      <div className="flex-1 min-h-0 relative">
        <div ref={containerRef} className="w-full h-full" />
        <svg
          ref={overlayRef}
          onPointerDown={handlePointerDown}
          onPointerMove={handlePointerMove}
          onPointerUp={handlePointerUp}
          className={`absolute inset-0 w-full h-full select-none touch-none ${interactionMode ? "cursor-crosshair" : ""}`}
          style={{ pointerEvents: interactionMode ? "auto" : "none" }}
          role="img"
          aria-label={t("chartAriaLabel", lang)}
        >
          {nowX !== null && (
            <g pointerEvents="none">
              <line x1={nowX} x2={nowX} y1={0} y2="100%" stroke={C_ACCENT} strokeWidth="1" strokeDasharray="3 4" opacity={revealed ? 0.35 : 0.75} />
              {!revealed && (
                <text x={nowX} y={14} fontSize="11" fill={C_ACCENT} textAnchor="middle" className="font-data">
                  {t("now", lang)}
                </text>
              )}
            </g>
          )}

          {drawings.map((d) => (d.type === "trend" ? renderTrendLine(d.p1, d.p2, d.id) : renderFib(d.p1, d.p2, d.id)))}

          {isDragging &&
            dragCurrent &&
            (activeTool === "trend" ? renderTrendLine(dragStart, dragCurrent, "preview", 0.55) : renderFib(dragStart, dragCurrent, "preview", 0.55))}
        </svg>
      </div>

      {activeTool && !isDragging && (
        <p className="text-xs mt-2 font-data shrink-0" style={{ color: C_TEXT_DIM }}>
          {t("drawInstructions", lang)}
        </p>
      )}
    </div>
  );
}

// ============ PROGRESSION ENTRE NIVEAUX ============
// Un niveau intermédiaire/expérimenté n'est accessible (même son quiz de vocabulaire)
// qu'après avoir démontré une performance minimale sur le niveau précédent.
const PROGRESSION_THRESHOLDS = {
  intermediaire: { prereqLevel: "debutant", metric: "winRate", min: 60 },
  experimente: { prereqLevel: "intermediaire", metric: "cumulativeR", min: 1 },
};

function isProgressionUnlocked(levelId) {
  const rule = PROGRESSION_THRESHOLDS[levelId];
  if (!rule) return true; // débutant : pas de prérequis
  try {
    return localStorage.getItem(`tt_progression_unlocked_${levelId}`) === "1";
  } catch (e) {
    return false;
  }
}

function markProgressionUnlocked(levelId) {
  try {
    localStorage.setItem(`tt_progression_unlocked_${levelId}`, "1");
  } catch (e) {}
}

// Vérifie si la séance qui vient de se terminer (pour `completedLevel`) débloque
// le niveau suivant, et l'enregistre si c'est le cas.
function checkAndUnlockNextLevel(completedLevel, winRate, cumulativeR) {
  Object.keys(PROGRESSION_THRESHOLDS).forEach((nextLevel) => {
    const rule = PROGRESSION_THRESHOLDS[nextLevel];
    if (rule.prereqLevel !== completedLevel) return;
    const value = rule.metric === "winRate" ? winRate : cumulativeR;
    if (value >= rule.min) markProgressionUnlocked(nextLevel);
  });
}

function isLevelUnlocked(levelId) {
  try {
    const quizPassed = localStorage.getItem(`tt_quiz_passed_${levelId}`) === "1";
    return quizPassed && isProgressionUnlocked(levelId);
  } catch (e) {
    return false;
  }
}

function LevelScreen({ onSelect, lang }) {
  return (
    <div className="max-w-2xl mx-auto">
      <p className="font-data text-xs tracking-widest mb-2" style={{ color: C_ACCENT }}>
        {t("step1", lang)}
      </p>
      <h1 className="font-display text-3xl md:text-4xl font-semibold" style={{ color: C_TEXT }}>
        {t("chooseLevelTitle", lang)}
      </h1>
      <p className="mt-2 mb-8" style={{ color: C_TEXT_MUTED }}>
        {t("chooseLevelSubtitle", lang)}
      </p>
      <div className="grid gap-3">
        {LEVELS.map((lv) => {
          const unlocked = isLevelUnlocked(lv.id);
          return (
            <button
              key={lv.id}
              onClick={() => onSelect(lv.id)}
              className="group text-left rounded-xl p-5 border transition-colors focus-visible:outline-none"
              style={{ backgroundColor: C_BG_SOFT, borderColor: C_BORDER }}
              onMouseEnter={(e) => (e.currentTarget.style.borderColor = C_ACCENT)}
              onMouseLeave={(e) => (e.currentTarget.style.borderColor = C_BORDER)}
            >
              <div className="flex items-center justify-between">
                <span className="font-data text-xs tracking-widest" style={{ color: C_ACCENT }}>
                  {lv.code}
                </span>
                {unlocked ? (
                  <ChevronRight className="w-4 h-4 transition-colors" style={{ color: C_TEXT_DIM }} />
                ) : (
                  <span className="text-xs" style={{ color: C_TEXT_DIM }}>
                    🔒
                  </span>
                )}
              </div>
              <h3 className="font-display text-xl mt-2" style={{ color: C_TEXT }}>
                {lv.label[lang] || lv.label.fr}
              </h3>
              <p className="text-sm mt-1" style={{ color: C_TEXT_MUTED }}>
                {lv.tagline[lang] || lv.tagline.fr}
              </p>
              <p className="text-sm mt-2" style={{ color: "#7d8579" }}>
                {lv.detail[lang] || lv.detail.fr}
              </p>
            </button>
          );
        })}
      </div>
    </div>
  );
}

function DomainScreen({ level, onSelect, onBack, lang }) {
  const lv = LEVELS.find((l) => l.id === level);
  return (
    <div className="max-w-2xl mx-auto">
      <button
        onClick={onBack}
        className="flex items-center gap-1 text-sm mb-6 transition-colors focus-visible:outline-none rounded"
        style={{ color: C_TEXT_MUTED }}
      >
        <ChevronLeft className="w-4 h-4" /> {t("changeLevelLink", lang)}
      </button>
      <p className="font-data text-xs tracking-widest mb-2" style={{ color: C_ACCENT }}>
        {t("step2", lang)} {lv.code}
      </p>
      <h1 className="font-display text-3xl md:text-4xl font-semibold" style={{ color: C_TEXT }}>
        {t("chooseMarketTitle", lang)}
      </h1>
      <p className="mt-2 mb-8" style={{ color: C_TEXT_MUTED }}>
        {t("chooseMarketSubtitle", lang)}
      </p>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        {DOMAINS.map((d) => {
          const Icon = d.Icon;
          return (
            <button
              key={d.id}
              onClick={() => onSelect(d.id)}
              className="group text-left rounded-xl p-5 border transition-colors focus-visible:outline-none"
              style={{ backgroundColor: C_BG_SOFT, borderColor: C_BORDER }}
              onMouseEnter={(e) => (e.currentTarget.style.borderColor = C_ACCENT)}
              onMouseLeave={(e) => (e.currentTarget.style.borderColor = C_BORDER)}
            >
              <div className="flex items-center justify-between">
                <Icon className="w-5 h-5 mb-3" style={{ color: C_ACCENT }} />
                {d.real && (
                  <span
                    className="text-[10px] font-data rounded-full px-2 py-0.5 border"
                    style={{ color: C_UP, borderColor: "#144d33" }}
                  >
                    {t("realDataBadge", lang)}
                  </span>
                )}
              </div>
              <h3 className="font-display text-base" style={{ color: C_TEXT }}>
                {d.label[lang] || d.label.fr}
              </h3>
              <p className="font-data text-xs mt-1" style={{ color: C_TEXT_MUTED }}>
                {d.code}
              </p>
            </button>
          );
        })}
      </div>
    </div>
  );
}

// ============ CHECKBOX ANIMÉE "TERMINAL BLIP" (biais du debrief) ============
function BiasCheckbox({ checked, onToggle, label }) {
  return (
    <label className="flex items-center gap-2.5 text-xs cursor-pointer" style={{ color: C_TEXT }}>
      <span
        className="relative flex items-center justify-center shrink-0"
        style={{ width: 18, height: 18, borderRadius: "50%", border: `2px solid ${checked ? C_ACCENT : "#5c655c"}`, transition: "border-color .2s" }}
      >
        {checked && (
          <span
            key={checked ? "on" : "off"}
            className="absolute rounded-full"
            style={{
              inset: -4,
              border: `2px solid ${C_ACCENT}`,
              animation: "biasBlip .5s ease-out",
            }}
          />
        )}
        <span
          className="rounded-full"
          style={{
            width: 7,
            height: 7,
            backgroundColor: C_ACCENT,
            transform: checked ? "scale(1)" : "scale(0)",
            transition: "transform .2s ease .1s",
          }}
        />
      </span>
      <input type="checkbox" checked={checked} onChange={onToggle} className="sr-only" />
      {label}
    </label>
  );
}

function Debrief({ level, candles, visibleCount, actualUp, debriefAnswers, onAnswerChange, biasChecked, onToggleBias, lang, newsQuiz, newsQuizAnswer, onNewsQuizAnswer }) {
  const questions = (DEBRIEF_QUESTIONS[level] && (DEBRIEF_QUESTIONS[level][lang] || DEBRIEF_QUESTIONS[level].fr)) || [];
  const biasItems = (BIAS_ITEMS[level] && (BIAS_ITEMS[level][lang] || BIAS_ITEMS[level].fr)) || [];
  const smaResult = level === "experimente" ? computeSmaSignal(candles, visibleCount) : null;
  const actualSignal = actualUp ? "hausse" : "baisse";

  const inputStyle = {
    backgroundColor: C_BG,
    borderColor: C_BORDER,
    color: C_TEXT,
  };

  return (
    <div className="mt-5 pt-4 border-t" style={{ borderColor: C_BORDER }}>
      <p className="text-[10px] font-data tracking-widest mb-3" style={{ color: C_TEXT_DIM }}>
        {t("debriefLabel", lang)}
      </p>

      {newsQuiz && (
        <div className="mb-4 p-3 rounded-lg border" style={{ borderColor: C_BORDER, backgroundColor: C_BG }}>
          <p className="text-xs font-medium mb-2" style={{ color: C_TEXT }}>
            {t("newsQuizTitle", lang)}
          </p>
          <div className="flex flex-col gap-2">
            {newsQuiz.options.map((ev, i) => {
              const isCorrectOption = ev.date === newsQuiz.correct.date;
              const isPicked = newsQuizAnswer === i;
              let optStyle = { borderColor: C_BORDER, color: C_TEXT_MUTED, backgroundColor: C_BG_SOFT };
              if (newsQuizAnswer !== null) {
                if (isCorrectOption) optStyle = { borderColor: C_UP, color: C_TEXT, backgroundColor: "rgba(16,185,129,0.08)" };
                else if (isPicked) optStyle = { borderColor: C_DOWN, color: C_TEXT, backgroundColor: "rgba(239,68,68,0.08)" };
              }
              return (
                <button
                  key={i}
                  disabled={newsQuizAnswer !== null}
                  onClick={() => onNewsQuizAnswer(i)}
                  className="text-left text-xs px-3 py-2 rounded-md border transition-colors"
                  style={optStyle}
                >
                  {lang === "en" ? ev.title_en || ev.title : ev.title}
                </button>
              );
            })}
          </div>
          {newsQuizAnswer !== null && (
            <p className="text-xs mt-3 leading-relaxed" style={{ color: C_TEXT_MUTED }}>
              <span style={{ color: newsQuiz.options[newsQuizAnswer].date === newsQuiz.correct.date ? C_UP : C_DOWN }}>
                {newsQuiz.options[newsQuizAnswer].date === newsQuiz.correct.date ? t("newsQuizCorrect", lang) : t("newsQuizIncorrect", lang)}
              </span>{" "}
              <span className="font-data" style={{ color: C_TEXT }}>
                {newsQuiz.correct.date}
              </span>{" "}
              — {lang === "en" ? newsQuiz.correct.detail_en || newsQuiz.correct.detail : newsQuiz.correct.detail}
            </p>
          )}
        </div>
      )}

      {smaResult && (
        <div className="mb-4 p-3 rounded-lg border" style={{ borderColor: C_BORDER, backgroundColor: C_BG }}>
          <p className="text-xs font-medium mb-1" style={{ color: C_TEXT }}>
            {t("smaCompareTitle", lang)}{smaResult.fast}/SMA{smaResult.slow})
          </p>
          <p className="text-xs" style={{ color: C_TEXT_MUTED }}>
            {t("ruleWouldSuggest", lang)}{" "}
            <span className="font-data font-medium" style={{ color: C_TEXT }}>
              {t(smaResult.signal === "hausse" ? "trendUp" : "trendDown", lang)}
            </span>{" "}
            · {t("realResult", lang)}{" "}
            <span className="font-data font-medium" style={{ color: C_TEXT }}>
              {t(actualSignal === "hausse" ? "trendUp" : "trendDown", lang)}
            </span>{" "}
            ·{" "}
            <span style={{ color: smaResult.signal === actualSignal ? C_UP : C_DOWN }}>
              {smaResult.signal === actualSignal ? t("ruleAligned", lang) : t("ruleDisagreed", lang)}
            </span>
          </p>
        </div>
      )}

      {questions.length > 0 && (
        <div className="space-y-3 mb-4">
          {questions.map((q, i) => (
            <div key={i}>
              <p className="text-xs mb-1.5" style={{ color: C_TEXT_MUTED }}>
                {q}
              </p>
              <textarea
                value={(debriefAnswers && debriefAnswers[i]) || ""}
                onChange={(e) => onAnswerChange(i, e.target.value)}
                rows={2}
                placeholder={t("optionalPlaceholder", lang)}
                className="w-full rounded-lg p-2.5 text-xs resize-none border focus-visible:outline-none"
                style={inputStyle}
              />
            </div>
          ))}
        </div>
      )}

      {biasItems.length > 0 && (
        <div>
          <p className="text-xs mb-2" style={{ color: C_TEXT_MUTED }}>
            {t("biasQuestion", lang)}
          </p>
          <div className="flex flex-col gap-2">
            {biasItems.map((b, i) => (
              <BiasCheckbox key={i} checked={!!(biasChecked && biasChecked[i])} onToggle={() => onToggleBias(i)} label={b} />
            ))}
          </div>
        </div>
      )}
    </div>
  );
}

function ExerciseScreen({
  level,
  domain,
  candles,
  visibleCount,
  revealed,
  prediction,
  position,
  analysis,
  loading,
  loadError,
  newsEvents,
  debriefAnswers,
  onDebriefAnswerChange,
  biasChecked,
  onToggleBias,
  onPredict,
  onOrder,
  onRevealAnalysis,
  setAnalysis,
  onNew,
  onChangeLevel,
  onChangeDomain,
  lang,
  stopPrice,
  takeProfitPrice,
  riskMode,
  riskError,
  riskConfirmed,
  onToggleRiskMode,
  onSetStopPrice,
  onSetTakeProfitPrice,
  onConfirmRisk,
  sessionProgress,
  sessionLength,
  onNextExercise,
  structureMode,
  supportPrice,
  resistancePrice,
  structureConfirmed,
  onToggleStructureMode,
  onSetSupportPrice,
  onSetResistancePrice,
  onConfirmStructure,
  seed,
  newsQuizAnswer,
  onNewsQuizAnswer,
}) {
  const lv = LEVELS.find((l) => l.id === level);
  const d = DOMAINS.find((x) => x.id === domain);
  const news = NEWS[domain];
  const links = DOMAIN_LINKS[domain];
  const isReal = d.real && candles.length > 0;
  const hasRealNews = d.hasRealNews && candles.length > 0;

  const entryCandle = candles[visibleCount - 1];
  const lastCandle = candles[candles.length - 1];
  const actualUp = lastCandle && entryCandle ? lastCandle.close > entryCandle.close : null;
  const movePct = lastCandle && entryCandle ? ((lastCandle.close - entryCandle.close) / entryCandle.close) * 100 : 0;
  const pnl = position ? movePct * (position === "achat" ? 1 : -1) : 0;
  const predictionWin = prediction ? (prediction === "hausse") === actualUp : null;
  const orderWin = pnl > 0;

  const riskResult =
    position && stopPrice !== null && takeProfitPrice !== null && entryCandle
      ? simulateRiskOutcome(candles, visibleCount, position, entryCandle.close, stopPrice, takeProfitPrice)
      : null;
  const usesRiskManagement = level === "intermediaire" || level === "experimente";

  const swingPoints = candles.length > 0 ? findSwingPoints(candles, visibleCount) : { swingHighs: [], swingLows: [] };
  const supportScore = structureConfirmed ? scoreStructurePlacement(supportPrice, swingPoints.swingLows) : null;
  const resistanceScore = structureConfirmed ? scoreStructurePlacement(resistancePrice, swingPoints.swingHighs) : null;

  const newsQuiz = revealed && domain === "forex" && hasRealNews && candles.length > 0 ? buildNewsQuiz(mulberry32(seed + 12345), candles, visibleCount) : null;

  const volatility = candles.length > 0 ? computeVolatility(candles, visibleCount) : null;
  const rangeStats = candles.length > 0 ? computeRangeStats(candles, visibleCount, d.format) : null;
  const rateContext = hasRealNews ? getRateContext(candles, visibleCount) : null;

  const cardStyle = { backgroundColor: C_BG_SOFT, borderColor: C_BORDER };
  const chartHeight = "clamp(440px, 68vh, 720px)";

  return (
    <div className="max-w-[1600px] mx-auto">
      <div className="flex flex-wrap items-center justify-between gap-3 mb-4">
        <div className="flex items-center gap-2 flex-wrap">
          <span className="flex items-center gap-1.5 font-data text-xs" style={{ color: C_TEXT_MUTED }}>
            <span className="w-1.5 h-1.5 rounded-full live-dot" style={{ backgroundColor: C_ACCENT }} /> {t("session", lang)}
            {typeof sessionProgress === "number" && typeof sessionLength === "number" && (
              <span style={{ color: C_TEXT_DIM }}>
                {" "}
                · {t("sessionProgress", lang)} {Math.min(sessionProgress + (revealed ? 0 : 1), sessionLength)}/{sessionLength}
              </span>
            )}
          </span>
          <button
            onClick={onChangeLevel}
            className="font-data text-xs px-2 py-1 rounded border transition-colors"
            style={{ backgroundColor: C_BG_SOFT, borderColor: C_BORDER, color: C_TEXT_MUTED }}
          >
            {lv.label[lang] || lv.label.fr}
          </button>
          <button
            onClick={onChangeDomain}
            className="font-data text-xs px-2 py-1 rounded border transition-colors"
            style={{ backgroundColor: C_BG_SOFT, borderColor: C_BORDER, color: C_TEXT_MUTED }}
          >
            {d.label[lang] || d.label.fr}
          </button>
        </div>
        <button onClick={onNew} className="flex items-center gap-1.5 font-data text-xs transition-colors" style={{ color: C_TEXT_MUTED }}>
          <RefreshCw className="w-3.5 h-3.5" /> {t("newExercise", lang)}
        </button>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-[1fr_320px] gap-4">
        <div className="rounded-xl p-4 border flex flex-col" style={{ ...cardStyle, height: chartHeight }}>
          <div className="flex items-center gap-2 mb-2 shrink-0">
            <span className="font-data text-xs font-medium" style={{ color: C_TEXT }}>
              {d.label[lang] || d.label.fr}
            </span>
            <span className="font-data text-[10px] px-1.5 py-0.5 rounded border" style={{ borderColor: C_BORDER, color: C_TEXT_MUTED }}>
              {d.timeframe || "1D"}
            </span>
          </div>
          {loading ? (
            <div className="flex-1 flex items-center justify-center">
              <p className="text-sm font-data" style={{ color: C_TEXT_MUTED }}>
                {t("loadingReal", lang)} {d.label[lang] || d.label.fr}...
              </p>
            </div>
          ) : loadError ? (
            <div className="flex-1 flex items-center justify-center">
              <p className="text-red-400 text-sm font-data text-center px-4">{loadError}</p>
            </div>
          ) : (
            <div className="flex-1 min-h-0">
              <CandlestickChart
                candles={candles}
                visibleCount={visibleCount}
                revealed={revealed}
                format={d.format}
                lang={lang}
                riskMode={usesRiskManagement && position && !riskConfirmed ? riskMode : null}
                stopPrice={usesRiskManagement ? stopPrice : null}
                takeProfitPrice={usesRiskManagement ? takeProfitPrice : null}
                onSetStopPrice={onSetStopPrice}
                onSetTakeProfitPrice={onSetTakeProfitPrice}
                structureMode={usesRiskManagement && !structureConfirmed ? structureMode : null}
                supportPrice={usesRiskManagement ? supportPrice : null}
                resistancePrice={usesRiskManagement ? resistancePrice : null}
                onSetSupportPrice={onSetSupportPrice}
                onSetResistancePrice={onSetResistancePrice}
              />
            </div>
          )}
        </div>

        <div className="rounded-xl p-4 border flex flex-col" style={{ ...cardStyle, height: chartHeight, overflowY: "auto" }}>
          <div className="flex items-center gap-2 mb-3">
            <Sparkles className="w-4 h-4" style={{ color: C_ACCENT }} />
            <h3 className="font-display text-sm" style={{ color: C_TEXT }}>
              {t("contextTitle", lang)}{" "}
              <span className="font-normal" style={{ color: isReal ? C_UP : C_TEXT_MUTED }}>
                · {isReal ? t("realDataBadge", lang) : t("example", lang)}
              </span>
            </h3>
          </div>

          {level === "debutant" && (
            <>
              {hasRealNews && newsEvents && newsEvents.length > 0 ? (
                <ul className="space-y-3">
                  {newsEvents.map((ev, i) => (
                    <li key={i} className="border-l-2 pl-3" style={{ borderColor: C_ACCENT }}>
                      <p className="font-data text-[10px]" style={{ color: C_ACCENT }}>
                        {ev.date}
                      </p>
                      <p className="text-xs font-medium mt-0.5" style={{ color: C_TEXT }}>
                        {lang === "en" ? ev.title_en || ev.title : ev.title}
                      </p>
                      <p className="text-xs mt-1 leading-relaxed" style={{ color: C_TEXT_MUTED }}>
                        {lang === "en" ? ev.detail_en || ev.detail : ev.detail}
                      </p>
                    </li>
                  ))}
                </ul>
              ) : (
                <>
                  <p className="text-sm leading-relaxed" style={{ color: C_TEXT_MUTED }}>
                    {news.body[lang] || news.body.fr}
                  </p>
                  <ul className="mt-3 space-y-1.5">
                    {(news.bullets[lang] || news.bullets.fr).map((b, i) => (
                      <li key={i} className="flex items-start gap-2 text-xs" style={{ color: "#7d8579" }}>
                        <span className="w-1 h-1 rounded-full mt-1.5 shrink-0" style={{ backgroundColor: C_ACCENT }} />
                        {b}
                      </li>
                    ))}
                  </ul>
                </>
              )}

              {(rateContext || volatility !== null || rangeStats) && (
                <div className="mt-4 pt-3 border-t space-y-2" style={{ borderColor: C_BORDER }}>
                  <p className="text-[10px] font-data tracking-widest" style={{ color: C_TEXT_DIM }}>
                    {t("keyIndicators", lang)}
                  </p>
                  {rateContext && (
                    <div className="flex items-center justify-between text-xs">
                      <span style={{ color: C_TEXT_MUTED }}>{t("bceRateAt", lang)} {rateContext.asOf})</span>
                      <span className="font-data font-medium" style={{ color: C_TEXT }}>
                        {rateContext.rate.toFixed(2)}%{" "}
                        <span style={{ color: rateContext.trend === "hausse" ? C_UP : rateContext.trend === "baisse" ? C_DOWN : C_TEXT_MUTED }}>
                          ({t(rateContext.trend === "hausse" ? "trendUp" : rateContext.trend === "baisse" ? "trendDown" : "trendStable", lang)})
                        </span>
                      </span>
                    </div>
                  )}
                  {rangeStats && (
                    <>
                      <div className="flex items-center justify-between text-xs">
                        <span style={{ color: C_TEXT_MUTED }}>{t("highLowPeriod", lang)}</span>
                        <span className="font-data font-medium" style={{ color: C_TEXT }}>
                          {rangeStats.high} / {rangeStats.low}
                        </span>
                      </div>
                      <div className="flex items-center justify-between text-xs">
                        <span style={{ color: C_TEXT_MUTED }}>{t("totalRange", lang)}</span>
                        <span className="font-data font-medium" style={{ color: C_TEXT }}>
                          {rangeStats.rangePct.toFixed(2)}%
                        </span>
                      </div>
                      <div className="flex items-center justify-between text-xs">
                        <span style={{ color: C_TEXT_MUTED }}>{t("avgDailyMove", lang)}</span>
                        <span className="font-data font-medium" style={{ color: C_TEXT }}>
                          {rangeStats.avgDailyRangePct.toFixed(2)}%
                        </span>
                      </div>
                      <div className="flex items-center justify-between text-xs">
                        <span style={{ color: C_TEXT_MUTED }}>{t("upDownCandles", lang)}</span>
                        <span className="font-data font-medium" style={{ color: C_TEXT }}>
                          <span style={{ color: C_UP }}>{rangeStats.upCount}</span> /{" "}
                          <span style={{ color: C_DOWN }}>{rangeStats.downCount}</span>
                        </span>
                      </div>
                    </>
                  )}
                  {volatility !== null && (
                    <div className="flex items-center justify-between text-xs">
                      <span style={{ color: C_TEXT_MUTED }}>{t("recentVolatility", lang)}</span>
                      <span className="font-data font-medium" style={{ color: C_TEXT }}>
                        {volatility.toFixed(2)}% {t("perDay", lang)}
                      </span>
                    </div>
                  )}
                </div>
              )}
            </>
          )}

          {level === "intermediaire" && links && (
            <div className="space-y-4">
              <p className="text-sm leading-relaxed" style={{ color: C_TEXT_MUTED }}>
                {links.hint[lang] || links.hint.fr}
              </p>
              <div className="flex flex-col gap-2">
                {links.links.map((l, i) => (
                  <a
                    key={i}
                    href={l.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-xs font-data px-3 py-2 rounded-md border transition-colors"
                    style={{ borderColor: C_ACCENT, color: C_ACCENT }}
                  >
                    {l.label[lang] || l.label.fr} →
                  </a>
                ))}
              </div>
            </div>
          )}

          {level === "experimente" && links && (
            <a
              href={links.links[0].url}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-block text-xs font-data px-3 py-2 rounded-md border transition-colors"
              style={{ borderColor: C_BORDER, color: C_TEXT_MUTED }}
            >
              {links.links[0].label[lang] || links.links[0].label.fr} →
            </a>
          )}

          <p className="text-xs mt-4 pt-3 border-t" style={{ color: C_TEXT_DIM, borderColor: C_BORDER }}>
            {isReal ? (d.realNote[lang] || d.realNote.fr) : t("exampleDisclaimer", lang)}
          </p>
        </div>
      </div>

      <div className="mt-4 rounded-xl p-5 border" style={cardStyle}>
        {!revealed ? (
          <>
            {level === "debutant" && (
              <>
                <p className="text-sm mb-3" style={{ color: C_TEXT }}>
                  {t("trendYourTurn", lang)}
                </p>
                <div className="flex gap-3">
                  <button
                    onClick={() => onPredict("hausse")}
                    className="flex-1 flex items-center justify-center gap-2 py-3 rounded-lg border text-emerald-400 hover:border-emerald-500 transition-colors font-medium"
                    style={{ backgroundColor: C_BG, borderColor: C_BORDER }}
                  >
                    <TrendingUp className="w-4 h-4" /> {t("goUp", lang)}
                  </button>
                  <button
                    onClick={() => onPredict("baisse")}
                    className="flex-1 flex items-center justify-center gap-2 py-3 rounded-lg border text-red-400 hover:border-red-500 transition-colors font-medium"
                    style={{ backgroundColor: C_BG, borderColor: C_BORDER }}
                  >
                    <TrendingDown className="w-4 h-4" /> {t("goDown", lang)}
                  </button>
                </div>
              </>
            )}

            {usesRiskManagement && !structureConfirmed && (
              <>
                <p className="text-sm mb-1" style={{ color: C_TEXT }}>
                  {t("structureStepTitle", lang)}
                </p>
                <p className="text-xs mb-3" style={{ color: C_TEXT_MUTED }}>
                  {t("structureStepSubtitle", lang)}
                </p>
                <div className="flex gap-3 mb-3">
                  <button
                    onClick={() => onToggleStructureMode("support")}
                    className="flex-1 py-2.5 rounded-lg border text-sm font-medium transition-colors"
                    style={
                      structureMode === "support"
                        ? { backgroundColor: "#38bdf8", borderColor: "#38bdf8", color: "#050605" }
                        : { backgroundColor: C_BG, borderColor: C_BORDER, color: C_TEXT }
                    }
                  >
                    {t("supportTool", lang)} {supportPrice !== null ? `· ${d.format(supportPrice)}` : `(${t("riskNotSet", lang)})`}
                  </button>
                  <button
                    onClick={() => onToggleStructureMode("resistance")}
                    className="flex-1 py-2.5 rounded-lg border text-sm font-medium transition-colors"
                    style={
                      structureMode === "resistance"
                        ? { backgroundColor: "#fb923c", borderColor: "#fb923c", color: "#050605" }
                        : { backgroundColor: C_BG, borderColor: C_BORDER, color: C_TEXT }
                    }
                  >
                    {t("resistanceTool", lang)} {resistancePrice !== null ? `· ${d.format(resistancePrice)}` : `(${t("riskNotSet", lang)})`}
                  </button>
                </div>
                <button
                  onClick={onConfirmStructure}
                  disabled={supportPrice === null || resistancePrice === null}
                  className="px-4 py-2.5 rounded-lg font-medium text-sm transition-colors disabled:opacity-40"
                  style={{ backgroundColor: C_ACCENT, color: C_BG }}
                >
                  {t("confirmStructure", lang)}
                </button>
              </>
            )}

            {usesRiskManagement && structureConfirmed && !position && (
              <>
                <p className="text-sm mb-3" style={{ color: C_TEXT }}>
                  {t("openPosition", lang)}
                </p>
                <div className="flex gap-3">
                  <button
                    onClick={() => onOrder("achat")}
                    className="flex-1 py-3 rounded-lg border text-emerald-400 hover:border-emerald-500 transition-colors font-medium"
                    style={{ backgroundColor: C_BG, borderColor: C_BORDER }}
                  >
                    {t("buy", lang)}
                  </button>
                  <button
                    onClick={() => onOrder("vente")}
                    className="flex-1 py-3 rounded-lg border text-red-400 hover:border-red-500 transition-colors font-medium"
                    style={{ backgroundColor: C_BG, borderColor: C_BORDER }}
                  >
                    {t("sell", lang)}
                  </button>
                </div>
              </>
            )}

            {usesRiskManagement && position && !riskConfirmed && (
              <>
                <p className="text-sm mb-1" style={{ color: C_TEXT }}>
                  {t("riskStepTitle", lang)}
                </p>
                <p className="text-xs mb-3" style={{ color: C_TEXT_MUTED }}>
                  {t("riskStepSubtitle", lang)}
                </p>
                <div className="flex gap-3 mb-3">
                  <button
                    onClick={() => onToggleRiskMode("stop")}
                    className="flex-1 py-2.5 rounded-lg border text-sm font-medium transition-colors"
                    style={
                      riskMode === "stop"
                        ? { backgroundColor: C_DOWN, borderColor: C_DOWN, color: "#fff" }
                        : { backgroundColor: C_BG, borderColor: C_BORDER, color: C_TEXT }
                    }
                  >
                    {t("stopLossTool", lang)} {stopPrice !== null ? `· ${d.format(stopPrice)}` : `(${t("riskNotSet", lang)})`}
                  </button>
                  <button
                    onClick={() => onToggleRiskMode("tp")}
                    className="flex-1 py-2.5 rounded-lg border text-sm font-medium transition-colors"
                    style={
                      riskMode === "tp"
                        ? { backgroundColor: C_UP, borderColor: C_UP, color: "#06170a" }
                        : { backgroundColor: C_BG, borderColor: C_BORDER, color: C_TEXT }
                    }
                  >
                    {t("takeProfitTool", lang)} {takeProfitPrice !== null ? `· ${d.format(takeProfitPrice)}` : `(${t("riskNotSet", lang)})`}
                  </button>
                </div>
                {riskError && (
                  <p className="text-xs mb-3" style={{ color: "#ff8080" }}>
                    {riskError === "stop" ? t("riskInvalidStop", lang) : t("riskInvalidTp", lang)}
                  </p>
                )}
                <button
                  onClick={onConfirmRisk}
                  disabled={stopPrice === null || takeProfitPrice === null}
                  className="px-4 py-2.5 rounded-lg font-medium text-sm transition-colors disabled:opacity-40"
                  style={{ backgroundColor: C_ACCENT, color: C_BG }}
                >
                  {t("confirmTrade", lang)}
                </button>
              </>
            )}

            {level === "experimente" && position && riskConfirmed && (
              <>
                <p className="text-sm mb-2" style={{ color: C_TEXT }}>
                  {t("yourAnalysis", lang)} <span style={{ color: C_TEXT_MUTED }}>{t("optional", lang)}</span>
                </p>
                <textarea
                  value={analysis}
                  onChange={(e) => setAnalysis(e.target.value)}
                  placeholder={t("analysisPlaceholder", lang)}
                  rows={3}
                  className="w-full rounded-lg p-3 text-sm resize-none border focus-visible:outline-none"
                  style={{ backgroundColor: C_BG, borderColor: C_BORDER, color: C_TEXT }}
                />
                <button
                  onClick={onRevealAnalysis}
                  className="mt-3 flex items-center gap-2 px-4 py-2.5 rounded-lg font-medium text-sm transition-colors"
                  style={{ backgroundColor: C_ACCENT, color: C_BG }}
                >
                  <Eye className="w-4 h-4" /> {t("seeMore", lang)}
                </button>
              </>
            )}
          </>
        ) : (
          <div>
            {level === "debutant" && prediction && (
              <div className={`flex items-center gap-2 font-medium ${predictionWin ? "text-emerald-400" : "text-red-400"}`}>
                {predictionWin ? <Check className="w-5 h-5" /> : <X className="w-5 h-5" />}
                {predictionWin ? t("goodCall", lang) : t("missed", lang)} — {t("marketDid", lang)} {actualUp ? "+" : ""}
                {movePct.toFixed(2)}%
              </div>
            )}
            {level === "intermediaire" && position && riskResult && (
              <div className={`flex items-center gap-2 font-medium ${riskResult.rMultiple >= 0 ? "text-emerald-400" : "text-red-400"}`}>
                {riskResult.rMultiple >= 0 ? <Check className="w-5 h-5" /> : <X className="w-5 h-5" />}
                {riskResult.outcome === "stop" ? t("stopHit", lang) : riskResult.outcome === "tp" ? t("tpHit", lang) : t("neitherHit", lang)}
                {" — "}
                {t("resultInR", lang)}: {riskResult.rMultiple >= 0 ? "+" : ""}
                {riskResult.rMultiple.toFixed(2)}R
              </div>
            )}
            {level === "experimente" && riskResult && (
              <div className="flex items-center gap-2 font-medium" style={{ color: C_ACCENT }}>
                <Target className="w-5 h-5" />
                {riskResult.outcome === "stop" ? t("stopHit", lang) : riskResult.outcome === "tp" ? t("tpHit", lang) : t("neitherHit", lang)}
                {" — "}
                {t("resultInR", lang)}: {riskResult.rMultiple >= 0 ? "+" : ""}
                {riskResult.rMultiple.toFixed(2)}R — {t("compareAnalysis", lang)}
              </div>
            )}

            {usesRiskManagement && (supportScore || resistanceScore) && (
              <div className="mt-3 pt-3 border-t" style={{ borderColor: C_BORDER }}>
                <p className="text-xs font-data tracking-widest mb-2" style={{ color: C_TEXT_DIM }}>
                  {t("structureResultTitle", lang)}
                </p>
                <div className="flex flex-col gap-1.5">
                  {supportScore && (
                    <div className="flex items-center justify-between text-xs">
                      <span style={{ color: C_TEXT_MUTED }}>{t("supportTool", lang)}</span>
                      <span
                        className="font-data font-medium"
                        style={{
                          color: supportScore.rating === "precise" ? C_UP : supportScore.rating === "close" ? "#f0b429" : C_DOWN,
                        }}
                      >
                        {supportScore.rating === "precise" ? t("structurePrecise", lang) : supportScore.rating === "close" ? t("structureClose", lang) : t("structureFar", lang)}{" "}
                        ({supportScore.distPct.toFixed(1)}%)
                      </span>
                    </div>
                  )}
                  {resistanceScore && (
                    <div className="flex items-center justify-between text-xs">
                      <span style={{ color: C_TEXT_MUTED }}>{t("resistanceTool", lang)}</span>
                      <span
                        className="font-data font-medium"
                        style={{
                          color: resistanceScore.rating === "precise" ? C_UP : resistanceScore.rating === "close" ? "#f0b429" : C_DOWN,
                        }}
                      >
                        {resistanceScore.rating === "precise" ? t("structurePrecise", lang) : resistanceScore.rating === "close" ? t("structureClose", lang) : t("structureFar", lang)}{" "}
                        ({resistanceScore.distPct.toFixed(1)}%)
                      </span>
                    </div>
                  )}
                </div>
              </div>
            )}

            <Debrief
              level={level}
              candles={candles}
              visibleCount={visibleCount}
              actualUp={actualUp}
              debriefAnswers={debriefAnswers}
              onAnswerChange={onDebriefAnswerChange}
              biasChecked={biasChecked}
              onToggleBias={onToggleBias}
              lang={lang}
              newsQuiz={newsQuiz}
              newsQuizAnswer={newsQuizAnswer}
              onNewsQuizAnswer={onNewsQuizAnswer}
            />

            <button
              onClick={onNextExercise}
              className="mt-4 flex items-center gap-2 px-4 py-2.5 rounded-lg font-medium text-sm transition-colors"
              style={{ backgroundColor: C_ACCENT, color: C_BG }}
            >
              <RefreshCw className="w-4 h-4" />{" "}
              {typeof sessionProgress === "number" && sessionProgress >= sessionLength ? t("seeSessionSummary", lang) : t("nextExercise", lang)}
            </button>
          </div>
        )}
      </div>
    </div>
  );
}

const SESSION_LENGTH = 5;

function SessionSummaryScreen({ sessionResults, level, domain, onNewSession, onChangeMarket, lang }) {
  const d = DOMAINS.find((x) => x.id === domain);
  const isRType = level === "intermediaire" || level === "experimente";

  let winCount = 0;
  let cumulativeR = 0;
  let bestR = null;
  let worstR = null;

  sessionResults.forEach((r) => {
    if (isRType) {
      cumulativeR += r.rMultiple;
      if (bestR === null || r.rMultiple > bestR) bestR = r.rMultiple;
      if (worstR === null || r.rMultiple < worstR) worstR = r.rMultiple;
      if (r.rMultiple > 0) winCount++;
    } else {
      if (r.win) winCount++;
    }
  });

  const winRate = sessionResults.length > 0 ? (winCount / sessionResults.length) * 100 : 0;
  const avgR = sessionResults.length > 0 ? cumulativeR / sessionResults.length : 0;

  const [justUnlocked, setJustUnlocked] = useState(false);

  useEffect(() => {
    if (sessionResults.length === 0) return;
    const alreadyUnlocked = Object.keys(PROGRESSION_THRESHOLDS).some(
      (nextLevel) => PROGRESSION_THRESHOLDS[nextLevel].prereqLevel === level && isProgressionUnlocked(nextLevel)
    );
    checkAndUnlockNextLevel(level, winRate, cumulativeR);
    const nowUnlocked = Object.keys(PROGRESSION_THRESHOLDS).some(
      (nextLevel) => PROGRESSION_THRESHOLDS[nextLevel].prereqLevel === level && isProgressionUnlocked(nextLevel)
    );
    if (!alreadyUnlocked && nowUnlocked) setJustUnlocked(true);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const statCardStyle = { backgroundColor: C_BG_SOFT, borderColor: C_BORDER };

  return (
    <div className="max-w-2xl mx-auto">
      {justUnlocked && (
        <div className="rounded-xl p-4 border mb-6" style={{ backgroundColor: "rgba(205,252,138,0.08)", borderColor: C_ACCENT_DIM }}>
          <p className="font-display text-sm mb-1" style={{ color: C_ACCENT }}>
            {t("progressionUnlockedTitle", lang)}
          </p>
          <p className="text-xs" style={{ color: C_TEXT_MUTED }}>
            {t("progressionUnlockedBody", lang)}
          </p>
        </div>
      )}
      <p className="font-data text-xs tracking-widest mb-2" style={{ color: C_ACCENT }}>
        {t("sessionSummaryTitle", lang).toUpperCase()}
      </p>
      <h1 className="font-display text-3xl md:text-4xl font-semibold mb-2" style={{ color: C_TEXT }}>
        {t("sessionSummaryTitle", lang)}
      </h1>
      <p className="mb-8" style={{ color: C_TEXT_MUTED }}>
        {t("sessionSummarySubtitle", lang)}
      </p>

      <div className="grid grid-cols-2 gap-3 mb-6">
        <div className="rounded-xl p-4 border" style={statCardStyle}>
          <p className="text-xs mb-1" style={{ color: C_TEXT_MUTED }}>
            {t("sessionExercisesCount", lang)}
          </p>
          <p className="font-display text-2xl" style={{ color: C_TEXT }}>
            {sessionResults.length}
          </p>
        </div>
        <div className="rounded-xl p-4 border" style={statCardStyle}>
          <p className="text-xs mb-1" style={{ color: C_TEXT_MUTED }}>
            {t("sessionWinRate", lang)}
          </p>
          <p className="font-display text-2xl" style={{ color: winRate >= 50 ? C_UP : C_DOWN }}>
            {winRate.toFixed(0)}%
          </p>
        </div>
        {isRType && (
          <>
            <div className="rounded-xl p-4 border" style={statCardStyle}>
              <p className="text-xs mb-1" style={{ color: C_TEXT_MUTED }}>
                {t("sessionCumulativeR", lang)}
              </p>
              <p className="font-display text-2xl" style={{ color: cumulativeR >= 0 ? C_UP : C_DOWN }}>
                {cumulativeR >= 0 ? "+" : ""}
                {cumulativeR.toFixed(2)}R
              </p>
            </div>
            <div className="rounded-xl p-4 border" style={statCardStyle}>
              <p className="text-xs mb-1" style={{ color: C_TEXT_MUTED }}>
                {t("sessionAvgR", lang)}
              </p>
              <p className="font-display text-2xl" style={{ color: C_TEXT }}>
                {avgR >= 0 ? "+" : ""}
                {avgR.toFixed(2)}R
              </p>
            </div>
            <div className="rounded-xl p-4 border" style={statCardStyle}>
              <p className="text-xs mb-1" style={{ color: C_TEXT_MUTED }}>
                {t("sessionBestTrade", lang)}
              </p>
              <p className="font-display text-2xl" style={{ color: C_UP }}>
                {bestR !== null ? `+${bestR.toFixed(2)}R` : "—"}
              </p>
            </div>
            <div className="rounded-xl p-4 border" style={statCardStyle}>
              <p className="text-xs mb-1" style={{ color: C_TEXT_MUTED }}>
                {t("sessionWorstTrade", lang)}
              </p>
              <p className="font-display text-2xl" style={{ color: C_DOWN }}>
                {worstR !== null ? `${worstR.toFixed(2)}R` : "—"}
              </p>
            </div>
          </>
        )}
      </div>

      <div className="rounded-xl p-4 border mb-8" style={statCardStyle}>
        <p className="text-xs font-data tracking-widest mb-3" style={{ color: C_TEXT_DIM }}>
          {t("sessionDetailTitle", lang)}
        </p>
        <div className="flex flex-col gap-2">
          {sessionResults.map((r, i) => (
            <div key={i} className="flex items-center justify-between text-sm">
              <span style={{ color: C_TEXT_MUTED }}>#{i + 1}</span>
              {isRType ? (
                <span className="font-data font-medium" style={{ color: r.rMultiple >= 0 ? C_UP : C_DOWN }}>
                  {r.rMultiple >= 0 ? "+" : ""}
                  {r.rMultiple.toFixed(2)}R
                </span>
              ) : (
                <span className="font-data font-medium" style={{ color: r.win ? C_UP : C_DOWN }}>
                  {r.win ? "✓" : "✗"}
                </span>
              )}
            </div>
          ))}
        </div>
      </div>

      <div className="flex gap-3 flex-wrap">
        <button
          onClick={onNewSession}
          className="flex items-center gap-2 px-4 py-2.5 rounded-lg font-medium text-sm transition-colors"
          style={{ backgroundColor: C_ACCENT, color: C_BG }}
        >
          <RefreshCw className="w-4 h-4" /> {t("newSession", lang)}
        </button>
        <button
          onClick={onChangeMarket}
          className="px-4 py-2.5 rounded-lg font-medium text-sm border transition-colors"
          style={{ borderColor: C_BORDER, color: C_TEXT_MUTED }}
        >
          {t("changeMarket", lang)}
        </button>
      </div>
    </div>
  );
}

export default function App() {
  const [level, setLevel] = useState(null);
  const [domain, setDomain] = useState(null);
  const [seed, setSeed] = useState(() => Math.floor(Math.random() * 1e9));
  const [revealed, setRevealed] = useState(false);
  const [prediction, setPrediction] = useState(null);
  const [position, setPosition] = useState(null);
  const [analysis, setAnalysis] = useState("");
  const [debriefAnswers, setDebriefAnswers] = useState({});
  const [biasChecked, setBiasChecked] = useState({});
  const [lang, setLang] = useState(() => getStoredLang());
  const [stopPrice, setStopPrice] = useState(null);
  const [takeProfitPrice, setTakeProfitPrice] = useState(null);
  const [riskMode, setRiskMode] = useState(null);
  const [riskConfirmed, setRiskConfirmed] = useState(false);
  const [riskError, setRiskError] = useState(null);
  const [structureMode, setStructureMode] = useState(null);
  const [supportPrice, setSupportPrice] = useState(null);
  const [resistancePrice, setResistancePrice] = useState(null);
  const [structureConfirmed, setStructureConfirmed] = useState(false);
  const [newsQuizAnswer, setNewsQuizAnswer] = useState(null);
  const [sessionResults, setSessionResults] = useState([]);
  const [showSessionSummary, setShowSessionSummary] = useState(false);

  const handleSetLang = (newLang) => {
    setLang(newLang);
    setStoredLang(newLang);
  };

  // Si on arrive avec ?level=xxx (depuis la page niveau, quiz déjà validé), on saute la sélection.
  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const urlLevel = params.get("level");
    if (urlLevel && LEVELS.some((l) => l.id === urlLevel) && isLevelUnlocked(urlLevel)) {
      setLevel(urlLevel);
    }
  }, []);

  const [realSeries, setRealSeries] = useState(null);
  const [realLoading, setRealLoading] = useState(false);
  const [realError, setRealError] = useState(null);

  const activeDomainCfg = DOMAINS.find((x) => x.id === domain);

  useEffect(() => {
    if (activeDomainCfg && activeDomainCfg.real && !realSeries && !realLoading) {
      setRealLoading(true);
      setRealError(null);
      activeDomainCfg
        .fetchSeries()
        .then((series) => {
          setRealSeries(series);
          setRealLoading(false);
        })
        .catch(() => {
          const label = activeDomainCfg.label[lang] || activeDomainCfg.label.fr;
          setRealError(`${t("loadErrorPrefix", lang)} ${label} ${t("loadErrorSuffix", lang)}`);
          setRealLoading(false);
        });
    }
  }, [domain]);

  const { candles, visibleCount } = useMemo(() => {
    if (!domain || !level) return { candles: [], visibleCount: 0 };
    const d = DOMAINS.find((x) => x.id === domain);

    if (d.real) {
      if (!realSeries) return { candles: [], visibleCount: 0 };
      const rng = mulberry32(seed);
      const windowLen = windowLenForLevel(level);
      const c = pickRealWindow(realSeries, rng, windowLen, !!d.constrainToMacroRange);
      const vc = Math.max(6, Math.round(c.length * 0.72));
      return { candles: c, visibleCount: vc };
    }

    const rng = mulberry32(seed);
    const dir = rng() > 0.5 ? 1 : -1;
    const phases = buildPhases(level, dir);
    const c = generateScenario(rng, d.base, phases);
    const vc = Math.max(6, Math.round(c.length * 0.72));
    return { candles: c, visibleCount: vc };
  }, [seed, domain, level, realSeries]);

  const newsEvents = useMemo(() => {
    if (!activeDomainCfg || !activeDomainCfg.hasRealNews || candles.length === 0) return [];
    return getMacroEventsInWindow(candles, visibleCount);
  }, [domain, candles, visibleCount]);

  // Enregistre le résultat de chaque exercice dans la séance en cours, dès qu'il est révélé.
  useEffect(() => {
    if (!revealed) return;
    const entryCandle = candles[visibleCount - 1];
    const lastCandle = candles[candles.length - 1];
    if (!entryCandle || !lastCandle) return;

    let resultEntry = null;
    if (level === "debutant" && prediction) {
      const actualUp = lastCandle.close > entryCandle.close;
      resultEntry = { type: "winloss", win: (prediction === "hausse") === actualUp };
    } else if ((level === "intermediaire" || level === "experimente") && position && stopPrice !== null && takeProfitPrice !== null) {
      const r = simulateRiskOutcome(candles, visibleCount, position, entryCandle.close, stopPrice, takeProfitPrice);
      if (r) resultEntry = { type: "r", rMultiple: r.rMultiple, outcome: r.outcome };
    }

    if (resultEntry) {
      setSessionResults((prev) => [...prev, resultEntry]);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [revealed]);

  const resetExercise = () => {
    setRevealed(false);
    setPrediction(null);
    setPosition(null);
    setAnalysis("");
    setDebriefAnswers({});
    setBiasChecked({});
    setStopPrice(null);
    setTakeProfitPrice(null);
    setRiskMode(null);
    setRiskConfirmed(false);
    setRiskError(null);
    setStructureMode(null);
    setSupportPrice(null);
    setResistancePrice(null);
    setStructureConfirmed(false);
    setNewsQuizAnswer(null);
  };

  const handleNewsQuizAnswer = (i) => {
    setNewsQuizAnswer((cur) => (cur === null ? i : cur));
  };

  const handleDebriefAnswerChange = (i, value) => {
    setDebriefAnswers((prev) => ({ ...prev, [i]: value }));
  };

  const handleToggleBias = (i) => {
    setBiasChecked((prev) => ({ ...prev, [i]: !prev[i] }));
  };

  const handleSelectLevel = (id) => {
    if (!isLevelUnlocked(id)) {
      window.location.href = `niveaux/${id}.html`;
      return;
    }
    setLevel(id);
    setDomain(null);
    setSessionResults([]);
    setShowSessionSummary(false);
    resetExercise();
  };
  const handleSelectDomain = (id) => {
    setDomain(id);
    setSeed(Math.floor(Math.random() * 1e9));
    setRealSeries(null);
    setRealError(null);
    setSessionResults([]);
    setShowSessionSummary(false);
    resetExercise();
  };
  const handleNew = () => {
    setSeed(Math.floor(Math.random() * 1e9));
    resetExercise();
  };
  const handleChangeLevel = () => {
    setLevel(null);
    setDomain(null);
    setRealSeries(null);
    setRealError(null);
    setSessionResults([]);
    setShowSessionSummary(false);
    resetExercise();
  };
  const handleChangeDomain = () => {
    setDomain(null);
    setRealSeries(null);
    setRealError(null);
    setSessionResults([]);
    setShowSessionSummary(false);
    resetExercise();
  };
  const handleNextOrSummary = () => {
    if (sessionResults.length >= SESSION_LENGTH) {
      setShowSessionSummary(true);
    } else {
      handleNew();
    }
  };
  const handleNewSession = () => {
    setSessionResults([]);
    setShowSessionSummary(false);
    handleNew();
  };
  const handlePredict = (p) => {
    setPrediction(p);
    setRevealed(true);
  };
  const handleOrder = (p) => {
    setPosition(p);
  };

  const handleToggleStructureMode = (mode) => {
    setStructureMode((cur) => (cur === mode ? null : mode));
  };

  const handleSetSupportPrice = (price) => {
    setSupportPrice(price);
    setStructureMode(null);
  };

  const handleSetResistancePrice = (price) => {
    setResistancePrice(price);
    setStructureMode(null);
  };

  const handleConfirmStructure = () => {
    if (supportPrice === null || resistancePrice === null) return;
    setStructureConfirmed(true);
  };

  const handleToggleRiskMode = (mode) => {
    setRiskMode((cur) => (cur === mode ? null : mode));
  };

  const handleSetStopPrice = (price) => {
    setStopPrice(price);
    setRiskMode(null);
    setRiskError(null);
  };

  const handleSetTakeProfitPrice = (price) => {
    setTakeProfitPrice(price);
    setRiskMode(null);
    setRiskError(null);
  };

  const handleConfirmRisk = () => {
    const entryPrice = candles[visibleCount - 1] ? candles[visibleCount - 1].close : null;
    if (entryPrice === null) return;
    const check = isValidRiskSetup(position, entryPrice, stopPrice, takeProfitPrice);
    if (!check.valid) {
      setRiskError(check.reason);
      return;
    }
    setRiskError(null);
    setRiskConfirmed(true);
    if (level !== "experimente") {
      setRevealed(true);
    }
  };

  const handleRevealAnalysis = () => setRevealed(true);

  const screen = !level ? "level" : !domain ? "domain" : showSessionSummary ? "sessionSummary" : "exercise";

  return (
    <div className="min-h-screen font-sans" style={{ backgroundColor: C_BG, color: C_TEXT }}>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap');
        .font-display { font-family: 'Space Grotesk', system-ui, sans-serif; }
        .font-data { font-family: 'IBM Plex Mono', ui-monospace, monospace; }
        @keyframes blink { 0%, 100% { opacity: 1; } 50% { opacity: 0.2; } }
        .live-dot { animation: blink 1.6s ease-in-out infinite; }
        @keyframes candleIn { from { opacity: 0; transform: translateY(3px); } to { opacity: 1; transform: translateY(0); } }
        .candle-reveal { animation: candleIn 0.45s ease-out forwards; }
        @keyframes biasBlip { 0% { opacity: 0.8; transform: scale(0.6); } 100% { opacity: 0; transform: scale(1.6); } }
        @media (prefers-reduced-motion: reduce) {
          .live-dot, .candle-reveal { animation: none !important; }
        }
      `}</style>

      <div className="max-w-[1600px] mx-auto px-4 py-6 md:py-8">
        <header className="flex items-center justify-between gap-2 mb-6 flex-wrap">
          <div className="flex items-center gap-2">
            <span className="w-2 h-2 rounded-full live-dot" style={{ backgroundColor: C_ACCENT }} />
            <span className="font-data text-xs tracking-widest" style={{ color: C_TEXT_MUTED }}>
              {t("prototypeLabel", lang)}
            </span>
          </div>
          <div className="flex items-center gap-2">
            <div
              className="flex gap-1 rounded-lg p-0.5 relative"
              style={{ backgroundColor: C_BG, border: `1px solid ${C_BORDER}` }}
            >
              <div
                className="absolute top-0.5 left-0.5 rounded-md transition-transform"
                style={{
                  width: 30,
                  height: 24,
                  backgroundColor: C_ACCENT,
                  transitionTimingFunction: "cubic-bezier(0.34, 1.56, 0.64, 1)",
                  transform: lang === "en" ? "translateX(30px)" : "translateX(0px)",
                }}
              />
              <button
                onClick={() => handleSetLang("fr")}
                className="relative font-data text-[11px] transition-colors"
                style={{ width: 30, height: 24, color: lang === "fr" ? C_BG : C_TEXT_MUTED }}
              >
                FR
              </button>
              <button
                onClick={() => handleSetLang("en")}
                className="relative font-data text-[11px] transition-colors"
                style={{ width: 30, height: 24, color: lang === "en" ? C_BG : C_TEXT_MUTED }}
              >
                EN
              </button>
            </div>
            <a
              href="index.html"
              className="font-data text-xs px-3 py-1.5 rounded border transition-colors"
              style={{ borderColor: C_BORDER, color: C_TEXT_MUTED, textDecoration: "none" }}
            >
              {t("backHome", lang)}
            </a>
          </div>
        </header>

        {screen === "level" && <LevelScreen onSelect={handleSelectLevel} lang={lang} />}
        {screen === "domain" && <DomainScreen level={level} onSelect={handleSelectDomain} onBack={handleChangeLevel} lang={lang} />}
        {screen === "exercise" && (
          <ExerciseScreen
            level={level}
            domain={domain}
            candles={candles}
            visibleCount={visibleCount}
            revealed={revealed}
            prediction={prediction}
            position={position}
            analysis={analysis}
            loading={realLoading}
            loadError={realError}
            newsEvents={newsEvents}
            onPredict={handlePredict}
            onOrder={handleOrder}
            onRevealAnalysis={handleRevealAnalysis}
            debriefAnswers={debriefAnswers}
            onDebriefAnswerChange={handleDebriefAnswerChange}
            biasChecked={biasChecked}
            onToggleBias={handleToggleBias}
            setAnalysis={setAnalysis}
            onNew={handleNew}
            onChangeLevel={handleChangeLevel}
            onChangeDomain={handleChangeDomain}
            lang={lang}
            stopPrice={stopPrice}
            takeProfitPrice={takeProfitPrice}
            riskMode={riskMode}
            riskError={riskError}
            riskConfirmed={riskConfirmed}
            onToggleRiskMode={handleToggleRiskMode}
            onSetStopPrice={handleSetStopPrice}
            onSetTakeProfitPrice={handleSetTakeProfitPrice}
            onConfirmRisk={handleConfirmRisk}
            sessionProgress={sessionResults.length}
            sessionLength={SESSION_LENGTH}
            onNextExercise={handleNextOrSummary}
            structureMode={structureMode}
            supportPrice={supportPrice}
            resistancePrice={resistancePrice}
            structureConfirmed={structureConfirmed}
            onToggleStructureMode={handleToggleStructureMode}
            onSetSupportPrice={handleSetSupportPrice}
            onSetResistancePrice={handleSetResistancePrice}
            onConfirmStructure={handleConfirmStructure}
            seed={seed}
            newsQuizAnswer={newsQuizAnswer}
            onNewsQuizAnswer={handleNewsQuizAnswer}
          />
        )}
        {screen === "sessionSummary" && (
          <SessionSummaryScreen
            sessionResults={sessionResults}
            level={level}
            domain={domain}
            onNewSession={handleNewSession}
            onChangeMarket={handleChangeDomain}
            lang={lang}
          />
        )}
      </div>
    </div>
  );
}

// ============ MONTAGE (chargé directement en .jsx, sans étape de build) ============
const ttRootEl = document.getElementById("root");
if (ttRootEl) {
  ReactDOM.createRoot(ttRootEl).render(<App />);
}
