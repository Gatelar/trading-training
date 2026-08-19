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
    alert("Merci ! On te préviendra dès que l'abonnement sera disponible.");
});
