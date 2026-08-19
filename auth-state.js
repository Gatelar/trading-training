// ============ ÉTAT DE CONNEXION DANS LA TOP-BAR ============
// Ce script attend un élément #topBarActions dans la page.
// authPathPrefix permet d'ajuster les liens relatifs selon la profondeur de la page
// (ex: '' à la racine, '../' depuis un sous-dossier).

(function () {
    const container = document.getElementById('topBarActions');
    if (!container || typeof supabaseClient === 'undefined') return;

    const prefix = container.dataset.prefix || '';

    supabaseClient.auth.getSession().then(({ data }) => {
        const session = data.session;
        if (!session) return;

        const email = session.user.email;
        const firstName = (session.user.user_metadata && session.user.user_metadata.full_name) || email.split('@')[0];

        container.innerHTML = `
            <a href="${prefix}abonnement/abonnement.html" class="btn-secondary top-bar-plan">Abonnement</a>
            <div class="account-menu">
                <button class="btn-login" id="accountBtn">${firstName} <span class="menu-caret">▾</span></button>
                <div class="account-dropdown" id="accountDropdown">
                    <a href="${prefix}compte/compte.html">Mon compte</a>
                    <a href="${prefix}abonnement/abonnement.html">Abonnement</a>
                    <button id="logoutMenuBtn">Se déconnecter</button>
                </div>
            </div>
        `;

        const accountBtn = document.getElementById('accountBtn');
        const dropdown = document.getElementById('accountDropdown');

        accountBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            dropdown.classList.toggle('is-open');
        });

        document.addEventListener('click', () => {
            dropdown.classList.remove('is-open');
        });

        document.getElementById('logoutMenuBtn').addEventListener('click', async () => {
            await supabaseClient.auth.signOut();
            window.location.href = prefix + 'index.html';
        });
    });
})();
