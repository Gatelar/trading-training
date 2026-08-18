// Animations de la page d'accueil

// --- Reveal au scroll ---
// Chaque élément avec la classe "reveal" apparaît en fondu/translation
// dès qu'il entre dans la zone visible de l'écran.
const revealElements = document.querySelectorAll('.reveal');

const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            revealObserver.unobserve(entry.target);
        }
    });
}, {
    threshold: 0.15
});

revealElements.forEach((el) => revealObserver.observe(el));

// --- Effet de décalage progressif pour les cartes de niveaux ---
// Les 3 cartes apparaissent l'une après l'autre plutôt que toutes en même temps.
document.querySelectorAll('.level-grid .level-card').forEach((card, index) => {
    card.style.transitionDelay = `${index * 0.12}s`;
});

// --- Ticker en direct (crypto + forex) ---
// BTC/USD via CoinGecko, EUR/USD via Frankfurter. Les deux API sont gratuites
// et ne nécessitent pas de clé. Le reste du ticker (or, indices, pétrole)
// reste statique pour l'instant.

function updateTickerItem(selector, formattedValue, isUp) {
    document.querySelectorAll(selector).forEach((el) => {
        const em = el.querySelector('em');
        if (!em) return;
        em.textContent = `${isUp ? '▲' : '▼'} ${formattedValue}`;
        em.classList.toggle('up', isUp);
        em.classList.toggle('down', !isUp);
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
        console.log('Ticker BTC/USD indisponible pour le moment.');
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
        console.log('Ticker EUR/USD indisponible pour le moment.');
    }
}

fetchBtcUsd();
fetchEurUsd();
setInterval(fetchBtcUsd, 60000);
setInterval(fetchEurUsd, 60000);
