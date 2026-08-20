import React, { useState, useMemo, useEffect, useRef } from "react";
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
const C_BG = "#050605";
const C_BG_SOFT = "#0c0f0c";
const C_ACCENT = "#CDFC8A";
const C_ACCENT_DIM = "#8fbf5a";
const C_TEXT = "#f4f6f2";
const C_TEXT_MUTED = "#9aa39a";
const C_TEXT_DIM = "#5c655c";
const C_BORDER = "#1c211c";
const C_UP = "#10b981";
const C_DOWN = "#ef4444";
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

function formatAxisDate(dateStr) {
  if (!dateStr) return "";
  const d = new Date(dateStr + "T00:00:00");
  return d.toLocaleDateString("fr-FR", { day: "2-digit", month: "short" });
}

const LEVELS = [
  {
    id: "debutant",
    code: "LVL.01",
    label: "Débutant",
    tagline: "Tendances nettes, peu de bruit",
    detail: "Une direction claire, idéale pour apprendre à lire un graphique.",
  },
  {
    id: "intermediaire",
    code: "LVL.02",
    label: "Intermédiaire",
    tagline: "Retournements et pullbacks",
    detail: "La tendance change en cours de route, il faut ajuster sa lecture.",
  },
  {
    id: "experimente",
    code: "LVL.03",
    label: "Expérimenté",
    tagline: "Range, faux signaux, forte volatilité",
    detail: "Peu de structure évidente, avec de fausses cassures.",
  },
];

const DOMAINS = [
  {
    id: "or",
    label: "Or et métaux précieux",
    code: "XAU",
    base: 2380,
    Icon: Gem,
    format: (v) => `$${v.toLocaleString("fr-FR", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`,
    real: true,
    timeframe: "1D",
    fetchSeries: () => fetchAlphaVantageStockDaily("GLD", "tt_gld_daily_cache_v1"),
    realNote: "Cours réel de l'ETF SPDR Gold Shares (GLD), un proxy coté qui suit le prix de l'or physique (Alpha Vantage) — pas le prix spot exact de l'once.",
  },
  {
    id: "forex",
    label: "Forex — EUR/USD",
    code: "FX",
    base: 1.085,
    Icon: ArrowLeftRight,
    format: (v) => v.toLocaleString("fr-FR", { minimumFractionDigits: 4, maximumFractionDigits: 4 }),
    real: true,
    timeframe: "1D",
    fetchSeries: () => fetchAlphaVantageFxDaily("tt_eurusd_daily_cache_v1"),
    constrainToMacroRange: true,
    hasRealNews: true,
    realNote: "Cotations EUR/USD réelles (Alpha Vantage) et décisions de politique monétaire BCE réelles et datées.",
  },
  {
    id: "actions",
    label: "Actions et indices",
    code: "IDX",
    base: 6200,
    Icon: BarChart3,
    format: (v) => `$${v.toLocaleString("fr-FR", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`,
    real: true,
    timeframe: "1D",
    fetchSeries: () => fetchAlphaVantageStockDaily("SPY", "tt_spy_daily_cache_v1"),
    realNote: "Cours réel du S&P 500 via l'ETF SPY (Alpha Vantage).",
  },
  {
    id: "crypto",
    label: "Crypto — BTC",
    code: "BTC",
    base: 68000,
    Icon: Coins,
    format: (v) => `$${v.toLocaleString("fr-FR", { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`,
    real: true,
    timeframe: "4D",
    fetchSeries: () => fetchCoinGeckoOhlc("tt_btc_4d_cache_v1"),
    realNote: "Cours réel du Bitcoin en bougies de 4 jours (CoinGecko) — pas de granularité journalière disponible gratuitement sur un historique long.",
  },
];

const NEWS = {
  or: {
    body: "Contexte type : l'or réagit souvent aux anticipations de taux de la Fed, à la vigueur du dollar et aux tensions géopolitiques qui renforcent son rôle de valeur refuge.",
    bullets: ["Taux réels et discours de la Fed", "Force du dollar (indice DXY)", "Tensions géopolitiques et demande refuge"],
  },
  forex: {
    body: "L'EUR/USD réagit aux écarts de politique monétaire entre BCE et Fed, ainsi qu'aux publications macro des deux zones.",
    bullets: ["Décisions de taux BCE et Fed", "Chiffres d'inflation", "Données d'emploi américaines"],
  },
  actions: {
    body: "Contexte type : les indices actions réagissent aux résultats d'entreprises, aux anticipations de taux et à l'appétit pour le risque des marchés.",
    bullets: ["Saison des résultats d'entreprises", "Anticipations de taux directeurs", "Sentiment de marché (risk-on / risk-off)"],
  },
  crypto: {
    body: "Contexte type : le bitcoin est sensible au sentiment de risque global, aux flux vers les ETF spot et à l'actualité réglementaire.",
    bullets: ["Flux vers les ETF spot", "Annonces réglementaires", "Corrélation aux actifs risqués"],
  },
};

// ============ RESSOURCES EXTERNES PAR MARCHÉ ============
// Pour l'accompagnement dégressif : intermédiaire = piste + lien, expérimenté = lien seul.
const DOMAIN_LINKS = {
  or: {
    hint: "Regarde du côté des taux réels américains et de la force du dollar (indice DXY) sur cette période.",
    links: [
      { url: "https://www.investing.com/economic-calendar/", label: "Calendrier économique — Investing.com" },
      { url: "https://www.kitco.com/news/", label: "Actualités marché de l'or — Kitco" },
      { url: "https://www.gold.org/goldhub", label: "Données et analyses — World Gold Council" },
    ],
  },
  forex: {
    hint: "Regarde du côté des décisions de taux de la BCE et de la Fed sur cette période.",
    links: [
      { url: "https://www.ecb.europa.eu/press/pr/date/html/index.en.html", label: "Communiqués de politique monétaire — BCE" },
      { url: "https://www.federalreserve.gov/newsevents/calendar.htm", label: "Calendrier — Réserve fédérale (Fed)" },
      { url: "https://www.investing.com/economic-calendar/", label: "Calendrier économique — Investing.com" },
    ],
  },
  actions: {
    hint: "Regarde du côté des résultats d'entreprises et du sentiment de marché (risk-on / risk-off) sur cette période.",
    links: [
      { url: "https://www.investing.com/economic-calendar/", label: "Calendrier économique — Investing.com" },
      { url: "https://www.investing.com/earnings-calendar/", label: "Calendrier des résultats — Investing.com" },
    ],
  },
  crypto: {
    hint: "Regarde du côté des flux vers les ETF spot et du sentiment général du marché crypto sur cette période.",
    links: [
      { url: "https://alternative.me/crypto/fear-and-greed-index/", label: "Indice Fear & Greed — Crypto" },
      { url: "https://www.coindesk.com/", label: "Actualités crypto — CoinDesk" },
      { url: "https://www.coingecko.com/en/categories", label: "Vue d'ensemble du marché — CoinGecko" },
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

// ============ DEBRIEF POST-RÉVÉLATION, ADAPTÉ AU NIVEAU ============
const DEBRIEF_QUESTIONS = {
  debutant: ["Qu'est-ce qui t'a fait choisir cette direction ?"],
  intermediaire: [
    "Ton entrée était-elle basée sur une règle précise ou plutôt une impression ?",
    "Qu'est-ce que tu ferais différemment la prochaine fois ?",
  ],
  experimente: [
    "Quel était ton raisonnement complet avant le reveal ?",
    "Qu'est-ce qui, avec le recul, aurait dû t'alerter (ou te rassurer) ?",
    "Qu'est-ce que tu ferais différemment la prochaine fois ?",
  ],
};

const BIAS_ITEMS = {
  intermediaire: ["J'ai peut-être sur-analysé la situation", "J'ai suivi mon impression plus que mes règles", "J'ai ignoré le risque"],
  experimente: [
    "J'ai peut-être sur-analysé la situation",
    "J'ai suivi mon impression plus que mes règles",
    "J'ai ignoré le risque",
    "Biais de confirmation : j'ai cherché ce qui confirmait mon idée de départ",
    "J'ai changé d'avis en cours de route sans raison claire",
  ],
};


function isDrawingTooSmall(p1, p2) {
  return Math.abs(p1.index - p2.index) < 1 && Math.abs(p1.price - p2.price) < 1e-9;
}

function CandlestickChart({ candles, visibleCount, revealed, format = (v) => v.toFixed(2) }) {
  const W = 1400;
  const H = 640;
  const padTop = 24;
  const padBottom = 34;
  const padRight = 84;
  const innerW = W - padRight;
  const innerH = H - padTop - padBottom;

  const shownCount = revealed ? candles.length : visibleCount;
  const shown = candles.slice(0, shownCount);

  const svgRef = useRef(null);
  const [activeTool, setActiveTool] = useState(null);
  const [drawings, setDrawings] = useState([]);
  const [dragStart, setDragStart] = useState(null);
  const [dragCurrent, setDragCurrent] = useState(null);
  const [hover, setHover] = useState(null);
  const isDragging = dragStart !== null;

  if (shown.length === 0) return null;

  const lo = Math.min(...shown.map((c) => c.low));
  const hi = Math.max(...shown.map((c) => c.high));
  const pad = (hi - lo) * 0.12 || hi * 0.01 || 1;
  const yMin = lo - pad;
  const yMax = hi + pad;

  const slot = innerW / candles.length;
  const bodyW = Math.max(slot * 0.55, 1.5);

  const yScale = (p) => padTop + (1 - (p - yMin) / (yMax - yMin)) * innerH;
  const xScale = (i) => i * slot + slot / 2;

  const tickCount = 6;
  const gridValues = Array.from({ length: tickCount + 1 }, (_, k) => yMin + (k / tickCount) * (yMax - yMin));

  const cutoffX = visibleCount * slot;
  const entryCandle = candles[visibleCount - 1];
  const lastCandle = candles[candles.length - 1];
  const lastUp = entryCandle && lastCandle ? lastCandle.close >= entryCandle.close : true;

  // Étiquettes de dates sur l'axe X (réparties uniformément)
  const axisLabelCount = 7;
  const axisIndices = Array.from({ length: axisLabelCount }, (_, k) =>
    Math.round((k / (axisLabelCount - 1)) * (candles.length - 1))
  );

  function pointFromEvent(e) {
    const rect = svgRef.current.getBoundingClientRect();
    const fracX = (e.clientX - rect.left) / rect.width;
    const fracY = (e.clientY - rect.top) / rect.height;
    const vx = fracX * W;
    const vy = fracY * H;
    const maxIndex = (revealed ? candles.length : visibleCount) - 1;
    const clickedIndex = Math.max(0, Math.min(maxIndex, Math.round(vx / slot - 0.5)));
    const clickedPrice = yMin + (1 - (vy - padTop) / innerH) * (yMax - yMin);
    return { index: clickedIndex, price: clickedPrice };
  }

  function toggleTool(tool) {
    setDragStart(null);
    setDragCurrent(null);
    setActiveTool((cur) => (cur === tool ? null : tool));
  }

  function handlePointerDown(e) {
    if (!activeTool || !svgRef.current) return;
    svgRef.current.setPointerCapture(e.pointerId);
    const point = pointFromEvent(e);
    setDragStart(point);
    setDragCurrent(point);
  }

  function handlePointerMove(e) {
    if (!svgRef.current) return;
    const point = pointFromEvent(e);
    setHover(point);
    if (isDragging) setDragCurrent(point);
  }

  function handlePointerLeave() {
    setHover(null);
  }

  function handlePointerUp() {
    if (!isDragging) return;
    if (dragCurrent && !isDrawingTooSmall(dragStart, dragCurrent)) {
      setDrawings((prev) => [...prev, { type: activeTool, p1: dragStart, p2: dragCurrent, id: `${Date.now()}-${Math.random()}` }]);
      setActiveTool(null);
    }
    setDragStart(null);
    setDragCurrent(null);
  }

  function renderTrendLine(p1, p2, key, opacity = 1) {
    const x1 = xScale(p1.index);
    const y1 = yScale(p1.price);
    const x2 = xScale(p2.index);
    const y2 = yScale(p2.price);
    return (
      <g key={key} opacity={opacity}>
        <line x1={x1} y1={y1} x2={x2} y2={y2} stroke={C_ACCENT} strokeWidth="1.5" />
        <circle cx={x1} cy={y1} r="3" fill={C_ACCENT} />
        <circle cx={x2} cy={y2} r="3" fill={C_ACCENT} />
      </g>
    );
  }

  function renderFib(p1, p2, key, opacity = 1) {
    const x1 = xScale(p1.index);
    const x2 = xScale(p2.index);
    const leftX = Math.min(x1, x2);
    const levels = [0, 0.236, 0.382, 0.5, 0.618, 0.786, 1];
    return (
      <g key={key} opacity={opacity}>
        {levels.map((lvl) => {
          const price = p1.price + (p2.price - p1.price) * lvl;
          const y = yScale(price);
          return (
            <g key={lvl}>
              <line
                x1={leftX}
                x2={innerW}
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

  const showCrosshair = hover && !isDragging;
  const hoverCandle = hover ? candles[hover.index] : null;

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
          <Minus className="w-3.5 h-3.5" /> Ligne
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
          <Layers className="w-3.5 h-3.5" /> Fibonacci
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
            <Trash2 className="w-3.5 h-3.5" /> Effacer
          </button>
        )}
      </div>

      <div className="flex-1 min-h-0">
        <svg
          ref={svgRef}
          onPointerDown={handlePointerDown}
          onPointerMove={handlePointerMove}
          onPointerUp={handlePointerUp}
          onPointerLeave={handlePointerLeave}
          viewBox={`0 0 ${W} ${H}`}
          preserveAspectRatio="none"
          className={`w-full h-full select-none touch-none ${activeTool ? "cursor-crosshair" : ""}`}
          role="img"
          aria-label="Graphique en chandeliers"
        >
          {gridValues.map((gv, k) => (
            <g key={k}>
              <line x1={0} x2={innerW} y1={yScale(gv)} y2={yScale(gv)} stroke={C_BORDER} strokeWidth="1" />
              <text x={innerW + 8} y={yScale(gv) + 4} fontSize="13" fill={C_TEXT_MUTED} className="font-data">
                {format(gv)}
              </text>
            </g>
          ))}

          {axisIndices.map((idx, k) => {
            const c = candles[idx];
            if (!c) return null;
            return (
              <text key={k} x={xScale(idx)} y={H - 12} fontSize="12" fill={C_TEXT_MUTED} textAnchor="middle" className="font-data">
                {formatAxisDate(c.date)}
              </text>
            );
          })}

          <line
            x1={cutoffX}
            x2={cutoffX}
            y1={padTop}
            y2={padTop + innerH}
            stroke={C_ACCENT}
            strokeWidth="1"
            strokeDasharray="3 4"
            opacity={revealed ? 0.35 : 0.75}
          />
          {!revealed && (
            <text x={cutoffX} y={padTop - 8} fontSize="11" fill={C_ACCENT} textAnchor="middle" className="font-data">
              MAINTENANT
            </text>
          )}

          {shown.map((c, i) => {
            const up = c.close >= c.open;
            const color = up ? C_UP : C_DOWN;
            const isNew = i >= visibleCount;
            return (
              <g key={c.i} className={isNew ? "candle-reveal" : ""} style={isNew ? { animationDelay: `${(i - visibleCount) * 22}ms` } : undefined}>
                <line x1={xScale(i)} x2={xScale(i)} y1={yScale(c.high)} y2={yScale(c.low)} stroke={color} strokeWidth="1" />
                <rect
                  x={xScale(i) - bodyW / 2}
                  y={Math.min(yScale(c.open), yScale(c.close))}
                  width={bodyW}
                  height={Math.max(Math.abs(yScale(c.close) - yScale(c.open)), 1)}
                  fill={color}
                />
              </g>
            );
          })}

          {drawings.map((d) => (d.type === "trend" ? renderTrendLine(d.p1, d.p2, d.id) : renderFib(d.p1, d.p2, d.id)))}

          {isDragging &&
            dragCurrent &&
            (activeTool === "trend" ? renderTrendLine(dragStart, dragCurrent, "preview", 0.55) : renderFib(dragStart, dragCurrent, "preview", 0.55))}

          {entryCandle && (
            <g>
              <line
                x1={0}
                x2={innerW}
                y1={yScale(entryCandle.close)}
                y2={yScale(entryCandle.close)}
                stroke={C_ACCENT}
                strokeWidth="1"
                strokeDasharray="2 3"
                opacity="0.5"
              />
              <rect x={innerW + 2} y={yScale(entryCandle.close) - 10} width={padRight - 4} height={20} fill={C_ACCENT} rx="2" />
              <text
                x={innerW + padRight / 2}
                y={yScale(entryCandle.close) + 4.5}
                fontSize="11.5"
                fill={C_BG}
                textAnchor="middle"
                fontWeight="700"
                className="font-data"
              >
                {format(entryCandle.close)}
              </text>
            </g>
          )}

          {revealed && lastCandle && lastCandle !== entryCandle && (
            <g>
              <rect x={innerW + 2} y={yScale(lastCandle.close) - 10} width={padRight - 4} height={20} fill={lastUp ? C_UP : C_DOWN} rx="2" />
              <text
                x={innerW + padRight / 2}
                y={yScale(lastCandle.close) + 4.5}
                fontSize="11.5"
                fill={C_BG}
                textAnchor="middle"
                fontWeight="700"
                className="font-data"
              >
                {format(lastCandle.close)}
              </text>
            </g>
          )}

          {/* ============ CURSEUR CROISÉ (CROSSHAIR) ============ */}
          {showCrosshair && hoverCandle && (
            <g pointerEvents="none">
              <line x1={xScale(hover.index)} x2={xScale(hover.index)} y1={padTop} y2={padTop + innerH} stroke="#4a534a" strokeWidth="1" strokeDasharray="2 3" />
              <line x1={0} x2={innerW} y1={yScale(hover.price)} y2={yScale(hover.price)} stroke="#4a534a" strokeWidth="1" strokeDasharray="2 3" />

              <rect x={innerW + 2} y={yScale(hover.price) - 10} width={padRight - 4} height={20} fill="#2a3228" stroke={C_BORDER} rx="2" />
              <text x={innerW + padRight / 2} y={yScale(hover.price) + 4.5} fontSize="11.5" fill={C_TEXT} textAnchor="middle" fontWeight="600" className="font-data">
                {format(hover.price)}
              </text>

              <rect x={xScale(hover.index) - 40} y={H - 24} width={80} height={18} fill="#2a3228" stroke={C_BORDER} rx="2" />
              <text x={xScale(hover.index)} y={H - 11.5} fontSize="11" fill={C_TEXT} textAnchor="middle" className="font-data">
                {formatAxisDate(hoverCandle.date)}
              </text>
            </g>
          )}
        </svg>
      </div>

      {activeTool && !isDragging && (
        <p className="text-xs mt-2 font-data shrink-0" style={{ color: C_TEXT_DIM }}>
          Clique et fais glisser sur le graphique pour tracer
        </p>
      )}
    </div>
  );
}

function LevelScreen({ onSelect }) {
  return (
    <div className="max-w-2xl mx-auto">
      <p className="font-data text-xs tracking-widest mb-2" style={{ color: C_ACCENT }}>
        ÉTAPE 1 / 2
      </p>
      <h1 className="font-display text-3xl md:text-4xl font-semibold" style={{ color: C_TEXT }}>
        Choisis ton niveau
      </h1>
      <p className="mt-2 mb-8" style={{ color: C_TEXT_MUTED }}>
        La difficulté des configurations s'ajuste en fonction.
      </p>
      <div className="grid gap-3">
        {LEVELS.map((lv) => (
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
              <ChevronRight className="w-4 h-4 transition-colors" style={{ color: C_TEXT_DIM }} />
            </div>
            <h3 className="font-display text-xl mt-2" style={{ color: C_TEXT }}>
              {lv.label}
            </h3>
            <p className="text-sm mt-1" style={{ color: C_TEXT_MUTED }}>
              {lv.tagline}
            </p>
            <p className="text-sm mt-2" style={{ color: "#7d8579" }}>
              {lv.detail}
            </p>
          </button>
        ))}
      </div>
    </div>
  );
}

function DomainScreen({ level, onSelect, onBack }) {
  const lv = LEVELS.find((l) => l.id === level);
  return (
    <div className="max-w-2xl mx-auto">
      <button
        onClick={onBack}
        className="flex items-center gap-1 text-sm mb-6 transition-colors focus-visible:outline-none rounded"
        style={{ color: C_TEXT_MUTED }}
      >
        <ChevronLeft className="w-4 h-4" /> Changer de niveau
      </button>
      <p className="font-data text-xs tracking-widest mb-2" style={{ color: C_ACCENT }}>
        ÉTAPE 2 / 2 · {lv.code}
      </p>
      <h1 className="font-display text-3xl md:text-4xl font-semibold" style={{ color: C_TEXT }}>
        Sur quel marché ?
      </h1>
      <p className="mt-2 mb-8" style={{ color: C_TEXT_MUTED }}>
        Les exercices porteront sur l'actif choisi.
      </p>
      <div className="grid grid-cols-2 gap-3">
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
                    données réelles
                  </span>
                )}
              </div>
              <h3 className="font-display text-base" style={{ color: C_TEXT }}>
                {d.label}
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

function Debrief({ level, candles, visibleCount, actualUp, debriefAnswers, onAnswerChange, biasChecked, onToggleBias }) {
  const questions = DEBRIEF_QUESTIONS[level] || [];
  const biasItems = BIAS_ITEMS[level] || [];
  const smaResult = level === "experimente" ? computeSmaSignal(candles, visibleCount) : null;

  const inputStyle = {
    backgroundColor: C_BG,
    borderColor: C_BORDER,
    color: C_TEXT,
  };

  return (
    <div className="mt-5 pt-4 border-t" style={{ borderColor: C_BORDER }}>
      <p className="text-[10px] font-data tracking-widest mb-3" style={{ color: C_TEXT_DIM }}>
        DEBRIEF
      </p>

      {smaResult && (
        <div className="mb-4 p-3 rounded-lg border" style={{ borderColor: C_BORDER, backgroundColor: C_BG }}>
          <p className="text-xs font-medium mb-1" style={{ color: C_TEXT }}>
            Comparaison à une règle systématique (SMA{smaResult.fast}/SMA{smaResult.slow})
          </p>
          <p className="text-xs" style={{ color: C_TEXT_MUTED }}>
            La règle aurait suggéré :{" "}
            <span className="font-data font-medium" style={{ color: C_TEXT }}>
              {smaResult.signal}
            </span>{" "}
            · Résultat réel :{" "}
            <span className="font-data font-medium" style={{ color: C_TEXT }}>
              {actualUp ? "hausse" : "baisse"}
            </span>{" "}
            ·{" "}
            <span style={{ color: smaResult.signal === (actualUp ? "hausse" : "baisse") ? C_UP : C_DOWN }}>
              {smaResult.signal === (actualUp ? "hausse" : "baisse") ? "règle alignée" : "règle en désaccord"}
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
                placeholder="Facultatif..."
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
            Est-ce que l'un de ces biais s'est glissé dans ta décision ?
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
            <span className="w-1.5 h-1.5 rounded-full live-dot" style={{ backgroundColor: C_ACCENT }} /> SESSION
          </span>
          <button
            onClick={onChangeLevel}
            className="font-data text-xs px-2 py-1 rounded border transition-colors"
            style={{ backgroundColor: C_BG_SOFT, borderColor: C_BORDER, color: C_TEXT_MUTED }}
          >
            {lv.label}
          </button>
          <button
            onClick={onChangeDomain}
            className="font-data text-xs px-2 py-1 rounded border transition-colors"
            style={{ backgroundColor: C_BG_SOFT, borderColor: C_BORDER, color: C_TEXT_MUTED }}
          >
            {d.label}
          </button>
        </div>
        <button onClick={onNew} className="flex items-center gap-1.5 font-data text-xs transition-colors" style={{ color: C_TEXT_MUTED }}>
          <RefreshCw className="w-3.5 h-3.5" /> Nouvel exercice
        </button>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-[1fr_320px] gap-4">
        <div className="rounded-xl p-4 border flex flex-col" style={{ ...cardStyle, height: chartHeight }}>
          <div className="flex items-center gap-2 mb-2 shrink-0">
            <span className="font-data text-xs font-medium" style={{ color: C_TEXT }}>
              {d.label}
            </span>
            <span className="font-data text-[10px] px-1.5 py-0.5 rounded border" style={{ borderColor: C_BORDER, color: C_TEXT_MUTED }}>
              {d.timeframe || "1D"}
            </span>
          </div>
          {loading ? (
            <div className="flex-1 flex items-center justify-center">
              <p className="text-sm font-data" style={{ color: C_TEXT_MUTED }}>
                Chargement des données réelles de {d.label}...
              </p>
            </div>
          ) : loadError ? (
            <div className="flex-1 flex items-center justify-center">
              <p className="text-red-400 text-sm font-data text-center px-4">{loadError}</p>
            </div>
          ) : (
            <div className="flex-1 min-h-0">
              <CandlestickChart candles={candles} visibleCount={visibleCount} revealed={revealed} format={d.format} />
            </div>
          )}
        </div>

        <div className="rounded-xl p-4 border flex flex-col" style={{ ...cardStyle, height: chartHeight, overflowY: "auto" }}>
          <div className="flex items-center gap-2 mb-3">
            <Sparkles className="w-4 h-4" style={{ color: C_ACCENT }} />
            <h3 className="font-display text-sm" style={{ color: C_TEXT }}>
              Contexte marché{" "}
              <span className="font-normal" style={{ color: isReal ? C_UP : C_TEXT_MUTED }}>
                · {isReal ? "données réelles" : "exemple"}
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
                        {ev.title}
                      </p>
                      <p className="text-xs mt-1 leading-relaxed" style={{ color: C_TEXT_MUTED }}>
                        {ev.detail}
                      </p>
                    </li>
                  ))}
                </ul>
              ) : (
                <>
                  <p className="text-sm leading-relaxed" style={{ color: C_TEXT_MUTED }}>
                    {news.body}
                  </p>
                  <ul className="mt-3 space-y-1.5">
                    {news.bullets.map((b, i) => (
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
                    INDICATEURS CLÉS
                  </p>
                  {rateContext && (
                    <div className="flex items-center justify-between text-xs">
                      <span style={{ color: C_TEXT_MUTED }}>Taux BCE (au {rateContext.asOf})</span>
                      <span className="font-data font-medium" style={{ color: C_TEXT }}>
                        {rateContext.rate.toFixed(2)}%{" "}
                        <span style={{ color: rateContext.trend === "hausse" ? C_UP : rateContext.trend === "baisse" ? C_DOWN : C_TEXT_MUTED }}>
                          ({rateContext.trend})
                        </span>
                      </span>
                    </div>
                  )}
                  {rangeStats && (
                    <>
                      <div className="flex items-center justify-between text-xs">
                        <span style={{ color: C_TEXT_MUTED }}>Plus haut / plus bas période</span>
                        <span className="font-data font-medium" style={{ color: C_TEXT }}>
                          {rangeStats.high} / {rangeStats.low}
                        </span>
                      </div>
                      <div className="flex items-center justify-between text-xs">
                        <span style={{ color: C_TEXT_MUTED }}>Amplitude totale</span>
                        <span className="font-data font-medium" style={{ color: C_TEXT }}>
                          {rangeStats.rangePct.toFixed(2)}%
                        </span>
                      </div>
                      <div className="flex items-center justify-between text-xs">
                        <span style={{ color: C_TEXT_MUTED }}>Mouvement quotidien moyen</span>
                        <span className="font-data font-medium" style={{ color: C_TEXT }}>
                          {rangeStats.avgDailyRangePct.toFixed(2)}%
                        </span>
                      </div>
                      <div className="flex items-center justify-between text-xs">
                        <span style={{ color: C_TEXT_MUTED }}>Bougies hausse / baisse</span>
                        <span className="font-data font-medium" style={{ color: C_TEXT }}>
                          <span style={{ color: C_UP }}>{rangeStats.upCount}</span> /{" "}
                          <span style={{ color: C_DOWN }}>{rangeStats.downCount}</span>
                        </span>
                      </div>
                    </>
                  )}
                  {volatility !== null && (
                    <div className="flex items-center justify-between text-xs">
                      <span style={{ color: C_TEXT_MUTED }}>Volatilité récente</span>
                      <span className="font-data font-medium" style={{ color: C_TEXT }}>
                        {volatility.toFixed(2)}% / jour
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
                {links.hint}
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
                    {l.label} →
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
              {links.links[0].label} →
            </a>
          )}

          <p className="text-xs mt-4 pt-3 border-t" style={{ color: C_TEXT_DIM, borderColor: C_BORDER }}>
            {isReal ? d.realNote : "Contexte illustratif pour ce prototype — données et dates simulées en attendant leur intégration réelle."}
          </p>
        </div>
      </div>

      <div className="mt-4 rounded-xl p-5 border" style={cardStyle}>
        {!revealed ? (
          <>
            {level === "debutant" && (
              <>
                <p className="text-sm mb-3" style={{ color: C_TEXT }}>
                  Selon toi, la tendance va plutôt...
                </p>
                <div className="flex gap-3">
                  <button
                    onClick={() => onPredict("hausse")}
                    className="flex-1 flex items-center justify-center gap-2 py-3 rounded-lg border text-emerald-400 hover:border-emerald-500 transition-colors font-medium"
                    style={{ backgroundColor: C_BG, borderColor: C_BORDER }}
                  >
                    <TrendingUp className="w-4 h-4" /> Monter
                  </button>
                  <button
                    onClick={() => onPredict("baisse")}
                    className="flex-1 flex items-center justify-center gap-2 py-3 rounded-lg border text-red-400 hover:border-red-500 transition-colors font-medium"
                    style={{ backgroundColor: C_BG, borderColor: C_BORDER }}
                  >
                    <TrendingDown className="w-4 h-4" /> Descendre
                  </button>
                </div>
              </>
            )}
            {level === "intermediaire" && (
              <>
                <p className="text-sm mb-3" style={{ color: C_TEXT }}>
                  Tu ouvres une position...
                </p>
                <div className="flex gap-3">
                  <button
                    onClick={() => onOrder("achat")}
                    className="flex-1 py-3 rounded-lg border text-emerald-400 hover:border-emerald-500 transition-colors font-medium"
                    style={{ backgroundColor: C_BG, borderColor: C_BORDER }}
                  >
                    Acheter
                  </button>
                  <button
                    onClick={() => onOrder("vente")}
                    className="flex-1 py-3 rounded-lg border text-red-400 hover:border-red-500 transition-colors font-medium"
                    style={{ backgroundColor: C_BG, borderColor: C_BORDER }}
                  >
                    Vendre
                  </button>
                </div>
              </>
            )}
            {level === "experimente" && (
              <>
                <p className="text-sm mb-2" style={{ color: C_TEXT }}>
                  Ton analyse <span style={{ color: C_TEXT_MUTED }}>(facultatif)</span>
                </p>
                <textarea
                  value={analysis}
                  onChange={(e) => setAnalysis(e.target.value)}
                  placeholder="Structure, niveaux clés, ce que tu observes..."
                  rows={3}
                  className="w-full rounded-lg p-3 text-sm resize-none border focus-visible:outline-none"
                  style={{ backgroundColor: C_BG, borderColor: C_BORDER, color: C_TEXT }}
                />
                <button
                  onClick={onRevealAnalysis}
                  className="mt-3 flex items-center gap-2 px-4 py-2.5 rounded-lg font-medium text-sm transition-colors"
                  style={{ backgroundColor: C_ACCENT, color: C_BG }}
                >
                  <Eye className="w-4 h-4" /> Voir la suite
                </button>
              </>
            )}
          </>
        ) : (
          <div>
            {level === "debutant" && prediction && (
              <div className={`flex items-center gap-2 font-medium ${predictionWin ? "text-emerald-400" : "text-red-400"}`}>
                {predictionWin ? <Check className="w-5 h-5" /> : <X className="w-5 h-5" />}
                {predictionWin ? "Bien vu" : "Raté"} — le marché a fait {actualUp ? "+" : ""}
                {movePct.toFixed(2)}%
              </div>
            )}
            {level === "intermediaire" && position && (
              <div className={`flex items-center gap-2 font-medium ${orderWin ? "text-emerald-400" : "text-red-400"}`}>
                {orderWin ? <Check className="w-5 h-5" /> : <X className="w-5 h-5" />}
                Position {position === "achat" ? "longue" : "courte"} — résultat {orderWin ? "+" : ""}
                {pnl.toFixed(2)}%
              </div>
            )}
            {level === "experimente" && (
              <div className="flex items-center gap-2 font-medium" style={{ color: C_ACCENT }}>
                <Target className="w-5 h-5" /> Le marché a fait {actualUp ? "+" : ""}
                {movePct.toFixed(2)}% — compare avec ton analyse.
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
            />

            <button
              onClick={onNew}
              className="mt-4 flex items-center gap-2 px-4 py-2.5 rounded-lg font-medium text-sm transition-colors"
              style={{ backgroundColor: C_ACCENT, color: C_BG }}
            >
              <RefreshCw className="w-4 h-4" /> Exercice suivant
            </button>
          </div>
        )}
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
          setRealError(`Impossible de charger les données réelles de ${activeDomainCfg.label} pour le moment.`);
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

  const resetExercise = () => {
    setRevealed(false);
    setPrediction(null);
    setPosition(null);
    setAnalysis("");
    setDebriefAnswers({});
    setBiasChecked({});
  };

  const handleDebriefAnswerChange = (i, value) => {
    setDebriefAnswers((prev) => ({ ...prev, [i]: value }));
  };

  const handleToggleBias = (i) => {
    setBiasChecked((prev) => ({ ...prev, [i]: !prev[i] }));
  };

  const handleSelectLevel = (id) => {
    setLevel(id);
    setDomain(null);
    resetExercise();
  };
  const handleSelectDomain = (id) => {
    setDomain(id);
    setSeed(Math.floor(Math.random() * 1e9));
    setRealSeries(null);
    setRealError(null);
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
    resetExercise();
  };
  const handleChangeDomain = () => {
    setDomain(null);
    setRealSeries(null);
    setRealError(null);
    resetExercise();
  };
  const handlePredict = (p) => {
    setPrediction(p);
    setRevealed(true);
  };
  const handleOrder = (p) => {
    setPosition(p);
    setRevealed(true);
  };
  const handleRevealAnalysis = () => setRevealed(true);

  const screen = !level ? "level" : !domain ? "domain" : "exercise";

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
        <header className="flex items-center justify-between gap-2 mb-6">
          <div className="flex items-center gap-2">
            <span className="w-2 h-2 rounded-full live-dot" style={{ backgroundColor: C_ACCENT }} />
            <span className="font-data text-xs tracking-widest" style={{ color: C_TEXT_MUTED }}>
              TRADE TRAINER — PROTOTYPE
            </span>
          </div>
          <a
            href="index.html"
            className="font-data text-xs px-3 py-1.5 rounded border transition-colors"
            style={{ borderColor: C_BORDER, color: C_TEXT_MUTED, textDecoration: "none" }}
          >
            ← Accueil
          </a>
        </header>

        {screen === "level" && <LevelScreen onSelect={handleSelectLevel} />}
        {screen === "domain" && <DomainScreen level={level} onSelect={handleSelectDomain} onBack={handleChangeLevel} />}
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
          />
        )}
      </div>
    </div>
  );
}
