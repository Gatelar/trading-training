// ============ ÉTAT DE CONNEXION DANS LA TOP-BAR ============
// Ce script attend un élément #topBarActions dans la page.
// authPathPrefix permet d'ajuster les liens relatifs selon la profondeur de la page
// (ex: '' à la racine, '../' depuis un sous-dossier).

(function () {
    const container = document.getElementById('topBarActions');
    if (!container || typeof supabaseClient === 'undefined') return;

    const prefix = container.dataset.prefix || '';

    function tt(key) {
        const lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
        return (typeof I18N_DICT !== 'undefined' && I18N_DICT[key]) ? (I18N_DICT[key][lang] || I18N_DICT[key].fr) : key;
    }

    function renderMenu(firstName, role) {
        const isStaff = role === 'MANAGER' || role === 'SUPER_ADMIN';
        const adminLink = isStaff ? `<a href="${prefix}admin/admin.html">${tt('nav.admin')}</a>` : '';
        container.innerHTML = `
            <a href="${prefix}apprendre/apprendre.html" class="btn-secondary top-bar-plan">${tt('nav.formation')}</a>
            <a href="${prefix}abonnement/abonnement.html" class="btn-secondary top-bar-plan">${tt('nav.subscription')}</a>
            <div class="account-menu">
                <button class="btn-login" id="accountBtn"><span id="accountBtnName"></span> <span class="menu-caret">▾</span></button>
                <div class="account-dropdown" id="accountDropdown">
                    <a href="${prefix}apprendre/apprendre.html">${tt('nav.formation')}</a>
                    <a href="${prefix}compte/compte.html">${tt('nav.account')}</a>
                    <a href="${prefix}abonnement/abonnement.html">${tt('nav.subscription')}</a>
                    ${adminLink}
                    <button id="logoutMenuBtn">${tt('nav.logout')}</button>
                </div>
            </div>
        `;
        // Le nom vient d'un champ saisi par l'utilisateur à l'inscription — on l'insère
        // via textContent (jamais innerHTML) pour empêcher toute injection de code (XSS).
        document.getElementById('accountBtnName').textContent = firstName;

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
    }

    supabaseClient.auth.getSession().then(async ({ data }) => {
        const session = data.session;
        if (!session) return;

        const email = session.user.email;
        const firstName = (session.user.user_metadata && session.user.user_metadata.full_name) || email.split('@')[0];

        // Réutilise le rôle déjà résolu par admin-init.js sur les pages admin
        // (évite une seconde requête pour le même chargement de page).
        let role = null;
        if (window.__ttCachedRole && window.__ttCachedRole.userId === session.user.id) {
            role = window.__ttCachedRole.role;
        } else {
            const { data: profile } = await supabaseClient
                .from('profiles')
                .select('role')
                .eq('id', session.user.id)
                .maybeSingle();
            role = profile ? profile.role : null;
        }

        renderMenu(firstName, role);
        window.addEventListener('tt:langchange', () => renderMenu(firstName, role));
    });
})();
