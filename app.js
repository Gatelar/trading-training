// ============ ANIMATIONS ET LOGIQUE DE TRADING TRAINING ============

// --- 1. Reveal au scroll avec IntersectionObserver ---
const revealElements = document.querySelectorAll('.reveal');

const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            revealObserver.unobserve(entry.target);
        }
    });
}, {
    threshold: 0.12
});

revealElements.forEach((el) => revealObserver.observe(el));

// Décalage progressif des cartes
document.querySelectorAll('.level-grid .level-card, .concept-steps-grid .concept-step-card').forEach((card, index) => {
    card.style.transitionDelay = `${(index % 3) * 0.12}s`;
});

// --- 2. Ticker en direct avec flashs néon ---
function updateTickerItem(selector, formattedValue, isUp) {
    document.querySelectorAll(selector).forEach((el) => {
        const em = el.querySelector('em');
        if (!em) return;
        
        em.textContent = `${isUp ? '▲' : '▼'} ${formattedValue}`;
        em.classList.toggle('up', isUp);
        em.classList.toggle('down', !isUp);

        // Flash néon TradingView
        const flashClass = isUp ? 'ticker-flash-up' : 'ticker-flash-down';
        el.classList.remove('ticker-flash-up', 'ticker-flash-down');
        void el.offsetWidth;
        el.classList.add(flashClass);
    });
}

async function fetchBtcUsd() {
    try {
        const res = await fetch('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd&include_24hr_change=true');
        const data = await res.json();
        const price = data.bitcoin.usd;
        const change = data.bitcoin.usd_24h_change;
        const formatted = Math.round(price).toLocaleString('fr-FR');
        updateTickerItem('.ticker-btcusd', formatted, change >= 0);
    } catch (err) {
        console.log('Ticker BTC/USD indisponible.');
    }
}

let lastEurUsd = null;

async function fetchEurUsd() {
    try {
        const res = await fetch('https://api.frankfurter.app/latest?from=EUR&to=USD');
        const data = await res.json();
        const rate = data.rates.USD;
        const isUp = lastEurUsd === null ? true : rate >= lastEurUsd;
        lastEurUsd = rate;
        updateTickerItem('.ticker-eurusd', rate.toFixed(4), isUp);
    } catch (err) {
        console.log('Ticker EUR/USD indisponible.');
    }
}

fetchBtcUsd();
fetchEurUsd();
setInterval(fetchBtcUsd, 60000);
setInterval(fetchEurUsd, 60000);

// --- 3. Animation du Canvas TradingView en arrière-plan du Hero ---
(function initHeroChartCanvas() {
    const canvas = document.getElementById('heroChartCanvas');
    if (!canvas) return;

    const ctx = canvas.getContext('2d');
    let width, height;
    let animationFrameId;

    function resize() {
        width = canvas.width = canvas.offsetWidth;
        height = canvas.height = canvas.offsetHeight;
    }

    window.addEventListener('resize', resize);
    resize();

    // Génération de bougies réalistes
    const candleCount = 45;
    const candles = [];
    let currentPrice = 100;

    for (let i = 0; i < candleCount; i++) {
        const delta = (Math.random() - 0.47) * 4.5;
        const open = currentPrice;
        const close = open + delta;
        const high = Math.max(open, close) + Math.random() * 2;
        const low = Math.min(open, close) - Math.random() * 2;
        candles.push({ open, close, high, low });
        currentPrice = close;
    }

    let offset = 0;
    let mouseX = 0;
    let mouseY = 0;

    window.addEventListener('mousemove', (e) => {
        const rect = canvas.getBoundingClientRect();
        mouseX = e.clientX - rect.left;
        mouseY = e.clientY - rect.top;
    });

    function draw() {
        if (!width || !height) {
            animationFrameId = requestAnimationFrame(draw);
            return;
        }

        ctx.clearRect(0, 0, width, height);

        // Dégradé radial subtil
        const bgGrad = ctx.createRadialGradient(
            width / 2 + (mouseX - width / 2) * 0.05,
            height / 2 + (mouseY - height / 2) * 0.05,
            10,
            width / 2,
            height / 2,
            width * 0.7
        );
        bgGrad.addColorStop(0, 'rgba(205, 252, 138, 0.06)');
        bgGrad.addColorStop(1, 'transparent');
        ctx.fillStyle = bgGrad;
        ctx.fillRect(0, 0, width, height);

        // Grille financière
        const gridSpacingX = 80;
        const gridSpacingY = 45;
        ctx.strokeStyle = 'rgba(205, 252, 138, 0.025)';
        ctx.lineWidth = 1;

        ctx.beginPath();
        for (let x = 0; x < width; x += gridSpacingX) {
            ctx.moveTo(x, 0);
            ctx.lineTo(x, height);
        }
        for (let y = 0; y < height; y += gridSpacingY) {
            ctx.moveTo(0, y);
            ctx.lineTo(width, y);
        }
        ctx.stroke();

        // Calcul échelle verticale
        const allPrices = candles.flatMap(c => [c.high, c.low]);
        const minPrice = Math.min(...allPrices) - 5;
        const maxPrice = Math.max(...allPrices) + 5;
        const priceRange = maxPrice - minPrice;

        const getY = (price) => height - ((price - minPrice) / priceRange) * (height * 0.65) - height * 0.15;
        const candleWidth = Math.max(6, width / (candleCount * 1.35));
        const spacing = candleWidth * 1.5;

        // Mise à jour de la dernière bougie avec pulsation
        offset += 0.025;
        const lastCandle = candles[candles.length - 1];
        lastCandle.close = lastCandle.open + Math.sin(offset) * 1.8;
        lastCandle.high = Math.max(lastCandle.high, lastCandle.close + 0.5);
        lastCandle.low = Math.min(lastCandle.low, lastCandle.close - 0.5);

        // Tracé EMA / Tendance
        ctx.beginPath();
        ctx.strokeStyle = 'rgba(205, 252, 138, 0.35)';
        ctx.lineWidth = 2;
        ctx.shadowColor = 'rgba(205, 252, 138, 0.5)';
        ctx.shadowBlur = 10;

        for (let i = 0; i < candles.length; i++) {
            const x = width - (candles.length - i) * spacing;
            const avg = (candles[i].open + candles[i].close) / 2;
            const y = getY(avg);
            if (i === 0) ctx.moveTo(x, y);
            else ctx.lineTo(x, y);
        }
        ctx.stroke();
        ctx.shadowBlur = 0;

        // Chandeliers
        for (let i = 0; i < candles.length; i++) {
            const c = candles[i];
            const x = width - (candles.length - i) * spacing;
            if (x < -candleWidth || x > width + candleWidth) continue;

            const isBull = c.close >= c.open;
            const color = isBull ? '#CDFC8A' : '#FF5C5C';
            const bodyTop = getY(Math.max(c.open, c.close));
            const bodyBottom = getY(Math.min(c.open, c.close));
            const bodyHeight = Math.max(3, bodyBottom - bodyTop);

            ctx.strokeStyle = color;
            ctx.lineWidth = 1.2;
            ctx.beginPath();
            ctx.moveTo(x + candleWidth / 2, getY(c.high));
            ctx.lineTo(x + candleWidth / 2, getY(c.low));
            ctx.stroke();

            ctx.fillStyle = color;
            ctx.fillRect(x, bodyTop, candleWidth, bodyHeight);
        }

        // Ligne de prix en direct
        const currentY = getY(lastCandle.close);
        const isUp = lastCandle.close >= lastCandle.open;
        const pulseColor = isUp ? 'rgba(205, 252, 138, 0.8)' : 'rgba(255, 92, 92, 0.8)';

        ctx.strokeStyle = isUp ? 'rgba(205, 252, 138, 0.25)' : 'rgba(255, 92, 92, 0.25)';
        ctx.setLineDash([4, 4]);
        ctx.beginPath();
        ctx.moveTo(0, currentY);
        ctx.lineTo(width, currentY);
        ctx.stroke();
        ctx.setLineDash([]);

        ctx.fillStyle = pulseColor;
        ctx.beginPath();
        ctx.arc(width - 15, currentY, 4 + Math.sin(offset * 2) * 1.5, 0, Math.PI * 2);
        ctx.fill();

        animationFrameId = requestAnimationFrame(draw);
    }

    draw();
})();

// --- 4. Interactive Animated Progress UI Controller ---
(function initProgressWidget() {
    const tabContainer = document.getElementById('progressTabs');
    if (!tabContainer) return;

    const goals = {
        portfolio: {
            title: 'Portfolio Challenge Target',
            valueFormatted: '$7,420',
            targetFormatted: 'Goal: $10,000',
            percent: 74,
            remaining: '$2,580 REMAINING TO PHASE 2'
        },
        curriculum: {
            title: 'Price Action & Candlestick Mastery',
            valueFormatted: '18 / 24 Modules',
            targetFormatted: 'Goal: 24 Modules',
            percent: 75,
            remaining: '6 MODULES TO CERTIFICATION'
        },
        winrate: {
            title: 'Monthly Win Rate & Edge Target',
            valueFormatted: '68%',
            targetFormatted: 'Target Edge: >60%',
            percent: 68,
            remaining: 'EDGE CONFIRMED (PROFITABLE)'
        }
    };

    let currentPercent = 0;
    let animationInterval = null;

    function animatePercentCounter(from, to) {
        const label = document.getElementById('progressPercentLabel');
        const indicator = document.getElementById('progressIndicator');
        if (!label || !indicator) return;

        if (animationInterval) clearInterval(animationInterval);

        const duration = 500;
        const startTime = performance.now();

        function step(now) {
            const elapsed = now - startTime;
            const progress = Math.min(1, elapsed / duration);
            // Ease out cubic
            const ease = 1 - Math.pow(1 - progress, 3);
            const current = Math.round(from + (to - from) * ease);

            label.textContent = `${current}%`;
            indicator.style.transform = `translateX(-${100 - (from + (to - from) * ease)}%)`;

            if (progress < 1) {
                requestAnimationFrame(step);
            } else {
                label.textContent = `${to}%`;
                indicator.style.transform = `translateX(-${100 - to}%)`;
                currentPercent = to;
            }
        }

        requestAnimationFrame(step);
    }

    function setGoal(goalKey) {
        const goal = goals[goalKey];
        if (!goal) return;

        const titleEl = document.getElementById('progressGoalTitle');
        const valueEl = document.getElementById('progressMetricValue');
        const targetEl = document.getElementById('progressMetricTarget');
        const remainingEl = document.getElementById('progressRemainingLabel');

        if (titleEl) titleEl.textContent = goal.title;
        if (valueEl) valueEl.textContent = goal.valueFormatted;
        if (targetEl) targetEl.textContent = goal.targetFormatted;
        if (remainingEl) remainingEl.textContent = goal.remaining;

        animatePercentCounter(currentPercent, goal.percent);
    }

    tabContainer.querySelectorAll('.progress-tab-btn').forEach((btn) => {
        btn.addEventListener('click', () => {
            tabContainer.querySelectorAll('.progress-tab-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            const goalKey = btn.getAttribute('data-goal');
            setGoal(goalKey);
        });
    });

    // Observer pour démarrer l'animation de jauge dès son apparition à l'écran
    const widgetCard = document.querySelector('.progress-widget-card');
    if (widgetCard) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    setGoal('portfolio');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.2 });

        observer.observe(widgetCard);
    }
})();
