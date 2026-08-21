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

function tt(key) {
    const lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
    return (typeof I18N_DICT !== 'undefined' && I18N_DICT[key]) ? (I18N_DICT[key][lang] || I18N_DICT[key].fr) : key;
}

function setPlan(plan) {
    selectedPlan = plan;
    btnMonthly.classList.toggle('active', plan === 'monthly');
    btnAnnual.classList.toggle('active', plan === 'annual');
    const unit = plan === 'monthly' ? tt('plan.perMonth') : tt('plan.perYear');
    const amount = plan === 'monthly' ? '9,99 €' : '99 €';
    priceEl.innerHTML = `${amount}<span>${unit}</span>`;
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
    subscribeBtn.textContent = tt('plan.redirecting');

    try {
        const res = await fetch(`${SUPABASE_FUNCTIONS_URL}/create-checkout-session`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                Authorization: `Bearer ${data.session.access_token}`,
            },
            body: JSON.stringify({
                priceId: STRIPE_PRICE_IDS[selectedPlan],
                successUrl: new URL('../compte/compte.html?checkout=success', window.location.href).href,
                cancelUrl: window.location.href,
            }),
        });

        const json = await res.json();

        if (!res.ok || json.error) {
            throw new Error(json.error || tt('plan.genericError'));
        }

        window.location.href = json.url;
    } catch (err) {
        errorEl.textContent = err.message;
        subscribeBtn.disabled = false;
        subscribeBtn.textContent = tt('plan.subscribeButton');
    }
});
