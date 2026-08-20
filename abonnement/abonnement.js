// ============ CONFIG STRIPE (mode test) ============
const STRIPE_PRICE_IDS = {
    monthly: 'price_1U6WVHAj7CBPiaM2rFrmVrSE',
    annual: 'price_1U6WVMAj7CBPiaM2i3sVd2YK',
};

const SUPABASE_FUNCTIONS_URL = 'https://pzycamkdwvpkyacvkzrs.supabase.co/functions/v1';

let selectedPlan = 'monthly';

// Affiche "Ton offre actuelle" uniquement si l'utilisateur est connecté.
(function () {
    const tag = document.getElementById('currentPlanTag');
    if (typeof supabaseClient === 'undefined') return;
    supabaseClient.auth.getSession().then(({ data }) => {
        if (!data.session) tag.style.display = 'none';
    });
})();

// ============ TOGGLE MENSUEL / ANNUEL ============
const priceEl = document.getElementById('planPrice');
const btnMonthly = document.getElementById('toggleMonthly');
const btnAnnual = document.getElementById('toggleAnnual');

function setPlan(plan) {
    selectedPlan = plan;
    btnMonthly.classList.toggle('active', plan === 'monthly');
    btnAnnual.classList.toggle('active', plan === 'annual');
    priceEl.innerHTML = plan === 'monthly'
        ? '9,99 €<span>/mois</span>'
        : '99 €<span>/an</span>';
}

btnMonthly.addEventListener('click', () => setPlan('monthly'));
btnAnnual.addEventListener('click', () => setPlan('annual'));

// ============ ABONNEMENT (Stripe Checkout) ============
const subscribeBtn = document.getElementById('subscribeBtn');
const errorEl = document.getElementById('planError');

subscribeBtn.addEventListener('click', async () => {
    errorEl.textContent = '';

    const { data } = await supabaseClient.auth.getSession();
    if (!data.session) {
        window.location.href = '../authentification/authentification.html';
        return;
    }

    subscribeBtn.disabled = true;
    subscribeBtn.textContent = 'Redirection...';

    try {
        const res = await fetch(`${SUPABASE_FUNCTIONS_URL}/create-checkout-session`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                Authorization: `Bearer ${data.session.access_token}`,
            },
            body: JSON.stringify({
                priceId: STRIPE_PRICE_IDS[selectedPlan],
                successUrl: window.location.origin + window.location.pathname.replace('abonnement.html', '') + '../compte/compte.html?checkout=success',
                cancelUrl: window.location.href,
            }),
        });

        const json = await res.json();

        if (!res.ok || json.error) {
            throw new Error(json.error || 'Erreur lors de la création de la session de paiement.');
        }

        window.location.href = json.url;
    } catch (err) {
        errorEl.textContent = err.message;
        subscribeBtn.disabled = false;
        subscribeBtn.textContent = "S'abonner (mode test)";
    }
});
