// Bouton "Être prévenu du lancement" — pour l'instant, confirmation simple.
// TODO: brancher sur une vraie liste d'attente (table Supabase "waitlist") une fois le prix fixé.
// Affiche "Ton offre actuelle" uniquement si l'utilisateur est connecté.
(function () {
    const tag = document.getElementById('currentPlanTag');
    if (typeof supabaseClient === 'undefined') return;
    supabaseClient.auth.getSession().then(({ data }) => {
        if (!data.session) tag.style.display = 'none';
    });
})();

document.getElementById('notifyBtn').addEventListener('click', () => {
    spawnCrashToast();
});

// ============ TOAST "PAS LE MOMENT" — graphique qui s'effondre, synchronisé au compteur ============
function spawnCrashToast() {
    let wrap = document.getElementById('crashToastWrap');
    if (!wrap) {
        wrap = document.createElement('div');
        wrap.id = 'crashToastWrap';
        wrap.className = 'crash-toast-wrap';
        document.body.appendChild(wrap);
    }
    wrap.innerHTML = '';

    const t = document.createElement('div');
    t.className = 'crash-toast';

    const heights = [20, 26, 22, 30, 25, 28];
    let candlesHtml = '';
    heights.forEach((h) => {
        candlesHtml += `<div class="ct-candle" style="height:${h}px;"><div class="ct-wick" style="height:${h + 8}px;"></div></div>`;
    });
    candlesHtml += `<div class="ct-candle ct-crash" style="height:80px;"><div class="ct-wick" style="height:90px;top:-8px;"></div></div>`;

    t.innerHTML = `
        <div class="ct-chart-zone">
            <span class="ct-crack-label" id="ctCrackLabel">PAS LE MOMENT</span>
            <div class="ct-candles" id="ctCandlesRow">${candlesHtml}</div>
        </div>
        <div class="ct-body">
            <div class="ct-title">Patience, trader.</div>
            <div class="ct-text">L'abonnement n'est pas encore disponible — le prix arrive bientôt. On te préviendra.</div>
        </div>
        <div class="ct-progress" id="ctProgress"></div>
    `;
    wrap.appendChild(t);

    const candleEls = t.querySelectorAll('.ct-candle');
    const totalDuration = 4200;
    const step = totalDuration / candleEls.length;

    const bar = t.querySelector('#ctProgress');
    bar.style.transition = `width ${totalDuration}ms linear`;
    requestAnimationFrame(() => { bar.style.width = '0%'; });

    candleEls.forEach((c, i) => {
        setTimeout(() => {
            c.style.transform = 'scaleY(1)';
            if (c.classList.contains('ct-crash')) {
                document.getElementById('ctCrackLabel').classList.add('show');
            }
        }, i * step + 150);
    });

    setTimeout(() => {
        t.style.transition = 'opacity .4s ease, transform .4s ease';
        t.style.opacity = '0';
        t.style.transform = 'translateY(20px) scale(0.96)';
    }, totalDuration + 300);
    setTimeout(() => t.remove(), totalDuration + 750);
}
