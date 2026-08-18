import React, { useState, useMemo } from "react";
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
} from "lucide-react";

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
  return candles;
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
    format: (v) => `$${v.toLocaleString("fr-FR", { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`,
  },
  {
    id: "forex",
    label: "Forex — EUR/USD",
    code: "FX",
    base: 1.085,
    Icon: ArrowLeftRight,
    format: (v) => v.toLocaleString("fr-FR", { minimumFractionDigits: 4, maximumFractionDigits: 4 }),
  },
  {
    id: "actions",
    label: "Actions et indices",
    code: "IDX",
    base: 6200,
    Icon: BarChart3,
    format: (v) => `${v.toLocaleString("fr-FR", { minimumFractionDigits: 0, maximumFractionDigits: 0 })} pts`,
  },
  {
    id: "crypto",
    label: "Crypto — BTC",
    code: "BTC",
    base: 68000,
    Icon: Coins,
    format: (v) => `$${v.toLocaleString("fr-FR", { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`,
  },
];

const NEWS = {
  or: {
    body: "Contexte type : l'or réagit souvent aux anticipations de taux de la Fed, à la vigueur du dollar et aux tensions géopolitiques qui renforcent son rôle de valeur refuge.",
    bullets: ["Taux réels et discours de la Fed", "Force du dollar (indice DXY)", "Tensions géopolitiques et demande refuge"],
  },
  forex: {
    body: "Contexte type : l'EUR/USD réagit aux écarts de politique monétaire entre BCE et Fed, ainsi qu'aux publications macro des deux zones.",
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

function CandlestickChart({ candles, visibleCount, revealed, format = (v) => v.toFixed(2) }) {
  const W = 800;
  const H = 360;
  const padTop = 18;
  const padBottom = 18;
  const padRight = 66;

  const shownCount = revealed ? candles.length : visibleCount;
  const shown = candles.slice(0, shownCount);
  if (shown.length === 0) return null;

  const lo = Math.min(...shown.map((c) => c.low));
  const hi = Math.max(...shown.map((c) => c.high));
  const pad = (hi - lo) * 0.12 || hi * 0.01 || 1;
  const yMin = lo - pad;
  const yMax = hi + pad;

  const innerW = W - padRight;
  const slot = innerW / candles.length;
  const bodyW = Math.max(slot * 0.55, 1.5);

  const yScale = (p) => padTop + (1 - (p - yMin) / (yMax - yMin)) * (H - padTop - padBottom);
  const xScale = (i) => i * slot + slot / 2;

  const tickCount = 5;
  const gridValues = Array.from({ length: tickCount + 1 }, (_, k) => yMin + (k / tickCount) * (yMax - yMin));

  const cutoffX = visibleCount * slot;
  const entryCandle = candles[visibleCount - 1];
  const lastCandle = candles[candles.length - 1];
  const lastUp = entryCandle && lastCandle ? lastCandle.close >= entryCandle.close : true;

  return (
    <svg viewBox={`0 0 ${W} ${H}`} className="w-full h-auto select-none" role="img" aria-label="Graphique en chandeliers">
      {gridValues.map((gv, k) => (
        <g key={k}>
          <line x1={0} x2={innerW} y1={yScale(gv)} y2={yScale(gv)} stroke="#27272a" strokeWidth="1" />
          <text x={innerW + 8} y={yScale(gv) + 4} fontSize="11" fill="#71717a" className="font-data">
            {format(gv)}
          </text>
        </g>
      ))}

      <line
        x1={cutoffX}
        x2={cutoffX}
        y1={padTop}
        y2={H - padBottom}
        stroke="#f59e0b"
        strokeWidth="1"
        strokeDasharray="3 4"
        opacity={revealed ? 0.35 : 0.75}
      />
      {!revealed && (
        <text x={cutoffX} y={padTop - 6} fontSize="10" fill="#f59e0b" textAnchor="middle" className="font-data">
          MAINTENANT
        </text>
      )}

      {shown.map((c, i) => {
        const up = c.close >= c.open;
        const color = up ? "#10b981" : "#ef4444";
        const isNew = i >= visibleCount;
        return (
          <g
            key={c.i}
            className={isNew ? "candle-reveal" : ""}
            style={isNew ? { animationDelay: `${(i - visibleCount) * 22}ms` } : undefined}
          >
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

      {entryCandle && (
        <g>
          <line
            x1={0}
            x2={innerW}
            y1={yScale(entryCandle.close)}
            y2={yScale(entryCandle.close)}
            stroke="#f59e0b"
            strokeWidth="1"
            strokeDasharray="2 3"
            opacity="0.5"
          />
          <rect x={innerW + 2} y={yScale(entryCandle.close) - 9} width={padRight - 4} height={18} fill="#f59e0b" rx="2" />
          <text
            x={innerW + padRight / 2}
            y={yScale(entryCandle.close) + 4}
            fontSize="10.5"
            fill="#09090b"
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
          <rect
            x={innerW + 2}
            y={yScale(lastCandle.close) - 9}
            width={padRight - 4}
            height={18}
            fill={lastUp ? "#10b981" : "#ef4444"}
            rx="2"
          />
          <text
            x={innerW + padRight / 2}
            y={yScale(lastCandle.close) + 4}
            fontSize="10.5"
            fill="#09090b"
            textAnchor="middle"
            fontWeight="700"
            className="font-data"
          >
            {format(lastCandle.close)}
          </text>
        </g>
      )}
    </svg>
  );
}

function LevelScreen({ onSelect }) {
  return (
    <div className="max-w-2xl mx-auto">
      <p className="font-data text-amber-400 text-xs tracking-widest mb-2">ÉTAPE 1 / 2</p>
      <h1 className="font-display text-3xl md:text-4xl font-semibold text-zinc-100">Choisis ton niveau</h1>
      <p className="text-zinc-400 mt-2 mb-8">La difficulté des configurations s'ajuste en fonction.</p>
      <div className="grid gap-3">
        {LEVELS.map((lv) => (
          <button
            key={lv.id}
            onClick={() => onSelect(lv.id)}
            className="group text-left bg-zinc-900 border border-zinc-800 rounded-xl p-5 hover:border-amber-500 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-400 transition-colors"
          >
            <div className="flex items-center justify-between">
              <span className="font-data text-xs text-amber-400 tracking-widest">{lv.code}</span>
              <ChevronRight className="w-4 h-4 text-zinc-600 group-hover:text-amber-400 transition-colors" />
            </div>
            <h3 className="font-display text-xl text-zinc-100 mt-2">{lv.label}</h3>
            <p className="text-zinc-400 text-sm mt-1">{lv.tagline}</p>
            <p className="text-zinc-500 text-sm mt-2">{lv.detail}</p>
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
        className="flex items-center gap-1 text-zinc-500 hover:text-amber-400 text-sm mb-6 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-400 rounded"
      >
        <ChevronLeft className="w-4 h-4" /> Changer de niveau
      </button>
      <p className="font-data text-amber-400 text-xs tracking-widest mb-2">ÉTAPE 2 / 2 · {lv.code}</p>
      <h1 className="font-display text-3xl md:text-4xl font-semibold text-zinc-100">Sur quel marché ?</h1>
      <p className="text-zinc-400 mt-2 mb-8">Les exercices porteront sur l'actif choisi.</p>
      <div className="grid grid-cols-2 gap-3">
        {DOMAINS.map((d) => {
          const Icon = d.Icon;
          return (
            <button
              key={d.id}
              onClick={() => onSelect(d.id)}
              className="group text-left bg-zinc-900 border border-zinc-800 rounded-xl p-5 hover:border-amber-500 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-400 transition-colors"
            >
              <Icon className="w-5 h-5 text-amber-400 mb-3" />
              <h3 className="font-display text-base text-zinc-100">{d.label}</h3>
              <p className="font-data text-xs text-zinc-500 mt-1">{d.code}</p>
            </button>
          );
        })}
      </div>
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

  const entryCandle = candles[visibleCount - 1];
  const lastCandle = candles[candles.length - 1];
  const actualUp = lastCandle && entryCandle ? lastCandle.close > entryCandle.close : null;
  const movePct = lastCandle && entryCandle ? ((lastCandle.close - entryCandle.close) / entryCandle.close) * 100 : 0;
  const pnl = position ? movePct * (position === "achat" ? 1 : -1) : 0;
  const predictionWin = prediction ? (prediction === "hausse") === actualUp : null;
  const orderWin = pnl > 0;

  return (
    <div className="max-w-5xl mx-auto">
      <div className="flex flex-wrap items-center justify-between gap-3 mb-5">
        <div className="flex items-center gap-2 flex-wrap">
          <span className="flex items-center gap-1.5 font-data text-xs text-zinc-500">
            <span className="w-1.5 h-1.5 rounded-full bg-amber-400 live-dot" /> SESSION
          </span>
          <button
            onClick={onChangeLevel}
            className="font-data text-xs px-2 py-1 rounded bg-zinc-900 border border-zinc-800 text-zinc-300 hover:border-amber-500 transition-colors"
          >
            {lv.label}
          </button>
          <button
            onClick={onChangeDomain}
            className="font-data text-xs px-2 py-1 rounded bg-zinc-900 border border-zinc-800 text-zinc-300 hover:border-amber-500 transition-colors"
          >
            {d.label}
          </button>
        </div>
        <button onClick={onNew} className="flex items-center gap-1.5 font-data text-xs text-zinc-400 hover:text-amber-400 transition-colors">
          <RefreshCw className="w-3.5 h-3.5" /> Nouvel exercice
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="md:col-span-2 bg-zinc-900 border border-zinc-800 rounded-xl p-4">
          <CandlestickChart candles={candles} visibleCount={visibleCount} revealed={revealed} format={d.format} />
        </div>

        <div className="bg-zinc-900 border border-zinc-800 rounded-xl p-4 flex flex-col">
          <div className="flex items-center gap-2 mb-3">
            <Sparkles className="w-4 h-4 text-amber-400" />
            <h3 className="font-display text-sm text-zinc-100">
              Contexte marché <span className="text-zinc-500 font-normal">· exemple</span>
            </h3>
          </div>
          <p className="text-zinc-400 text-sm leading-relaxed">{news.body}</p>
          <ul className="mt-3 space-y-1.5">
            {news.bullets.map((b, i) => (
              <li key={i} className="flex items-start gap-2 text-xs text-zinc-500">
                <span className="w-1 h-1 rounded-full bg-amber-400 mt-1.5 shrink-0" />
                {b}
              </li>
            ))}
          </ul>
          <p className="text-zinc-600 text-xs mt-4 pt-3 border-t border-zinc-800">
            Contexte illustratif pour ce prototype — la version finale s'appuiera sur de vraies données et actus historiques.
          </p>
        </div>
      </div>

      <div className="mt-4 bg-zinc-900 border border-zinc-800 rounded-xl p-5">
        {!revealed ? (
          <>
            {level === "debutant" && (
              <>
                <p className="text-zinc-300 text-sm mb-3">Selon toi, la tendance va plutôt...</p>
                <div className="flex gap-3">
                  <button
                    onClick={() => onPredict("hausse")}
                    className="flex-1 flex items-center justify-center gap-2 py-3 rounded-lg bg-zinc-950 border border-zinc-700 text-emerald-400 hover:border-emerald-500 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-400 transition-colors font-medium"
                  >
                    <TrendingUp className="w-4 h-4" /> Monter
                  </button>
                  <button
                    onClick={() => onPredict("baisse")}
                    className="flex-1 flex items-center justify-center gap-2 py-3 rounded-lg bg-zinc-950 border border-zinc-700 text-red-400 hover:border-red-500 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-400 transition-colors font-medium"
                  >
                    <TrendingDown className="w-4 h-4" /> Descendre
                  </button>
                </div>
              </>
            )}
            {level === "intermediaire" && (
              <>
                <p className="text-zinc-300 text-sm mb-3">Tu ouvres une position...</p>
                <div className="flex gap-3">
                  <button
                    onClick={() => onOrder("achat")}
                    className="flex-1 py-3 rounded-lg bg-zinc-950 border border-zinc-700 text-emerald-400 hover:border-emerald-500 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-400 transition-colors font-medium"
                  >
                    Acheter
                  </button>
                  <button
                    onClick={() => onOrder("vente")}
                    className="flex-1 py-3 rounded-lg bg-zinc-950 border border-zinc-700 text-red-400 hover:border-red-500 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-400 transition-colors font-medium"
                  >
                    Vendre
                  </button>
                </div>
              </>
            )}
            {level === "experimente" && (
              <>
                <p className="text-zinc-300 text-sm mb-2">
                  Ton analyse <span className="text-zinc-500">(facultatif)</span>
                </p>
                <textarea
                  value={analysis}
                  onChange={(e) => setAnalysis(e.target.value)}
                  placeholder="Structure, niveaux clés, ce que tu observes..."
                  rows={3}
                  className="w-full bg-zinc-950 border border-zinc-800 rounded-lg p-3 text-sm text-zinc-200 placeholder-zinc-600 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-400 resize-none"
                />
                <button
                  onClick={onRevealAnalysis}
                  className="mt-3 flex items-center gap-2 px-4 py-2.5 rounded-lg bg-amber-500 text-zinc-950 font-medium text-sm hover:bg-amber-400 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-300 transition-colors"
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
              <div className="flex items-center gap-2 font-medium text-amber-400">
                <Target className="w-5 h-5" /> Le marché a fait {actualUp ? "+" : ""}
                {movePct.toFixed(2)}% — compare avec ton analyse.
              </div>
            )}
            <button
              onClick={onNew}
              className="mt-4 flex items-center gap-2 px-4 py-2.5 rounded-lg bg-amber-500 text-zinc-950 font-medium text-sm hover:bg-amber-400 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-amber-300 transition-colors"
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

  const { candles, visibleCount } = useMemo(() => {
    if (!domain || !level) return { candles: [], visibleCount: 0 };
    const d = DOMAINS.find((x) => x.id === domain);
    const rng = mulberry32(seed);
    const dir = rng() > 0.5 ? 1 : -1;
    const phases = buildPhases(level, dir);
    const c = generateScenario(rng, d.base, phases);
    const vc = Math.max(6, Math.round(c.length * 0.72));
    return { candles: c, visibleCount: vc };
  }, [seed, domain, level]);

  const resetExercise = () => {
    setRevealed(false);
    setPrediction(null);
    setPosition(null);
    setAnalysis("");
  };

  const handleSelectLevel = (id) => {
    setLevel(id);
    setDomain(null);
    resetExercise();
  };
  const handleSelectDomain = (id) => {
    setDomain(id);
    setSeed(Math.floor(Math.random() * 1e9));
    resetExercise();
  };
  const handleNew = () => {
    setSeed(Math.floor(Math.random() * 1e9));
    resetExercise();
  };
  const handleChangeLevel = () => {
    setLevel(null);
    setDomain(null);
    resetExercise();
  };
  const handleChangeDomain = () => {
    setDomain(null);
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
    <div className="min-h-screen bg-black text-zinc-100 font-sans">
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap');
        .font-display { font-family: 'Space Grotesk', system-ui, sans-serif; }
        .font-data { font-family: 'IBM Plex Mono', ui-monospace, monospace; }
        @keyframes blink { 0%, 100% { opacity: 1; } 50% { opacity: 0.2; } }
        .live-dot { animation: blink 1.6s ease-in-out infinite; }
        @keyframes candleIn { from { opacity: 0; transform: translateY(3px); } to { opacity: 1; transform: translateY(0); } }
        .candle-reveal { animation: candleIn 0.45s ease-out forwards; }
        @media (prefers-reduced-motion: reduce) {
          .live-dot, .candle-reveal { animation: none !important; }
        }
      `}</style>

      <div className="max-w-6xl mx-auto px-4 py-8 md:py-12">
        <header className="flex items-center gap-2 mb-10">
          <span className="w-2 h-2 rounded-full bg-amber-400 live-dot" />
          <span className="font-data text-xs tracking-widest text-zinc-500">TRADE TRAINER — PROTOTYPE</span>
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
            onPredict={handlePredict}
            onOrder={handleOrder}
            onRevealAnalysis={handleRevealAnalysis}
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
