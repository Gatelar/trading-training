// ============ GARDE DE RÔLE + INITIALISATION DE LA PAGE ADMIN ============
// Important : cette vérification est un confort d'UX (redirige un client
// non-admin loin de la page), ce n'est PAS la vraie barrière de sécurité —
// celle-ci vit dans les policies RLS de Postgres sur chaque table. Même si
// quelqu'un contournait cette redirection (devtools, etc.), toutes les
// requêtes Supabase de ce panel resteraient bloquées/vides pour un non-admin.
(async function () {
    function tt(key) {
        const lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
        return (typeof I18N_DICT !== 'undefined' && I18N_DICT[key]) ? (I18N_DICT[key][lang] || I18N_DICT[key].fr) : key;
    }

    const { data } = await supabaseClient.auth.getSession();
    const session = data.session;

    if (!session) {
        window.location.href = '../authentification/authentification.html';
        return;
    }

    const { data: profile } = await supabaseClient
        .from('profiles')
        .select('role')
        .eq('id', session.user.id)
        .maybeSingle();

    const role = profile ? profile.role : null;

    if (role !== 'MANAGER' && role !== 'SUPER_ADMIN') {
        window.location.href = '../index.html';
        return;
    }

    // Cache le rôle pour que auth-state.js (chargé plus bas sur cette même
    // page) n'ait pas à refaire la même requête.
    window.__ttCachedRole = { userId: session.user.id, role };
    window.__ttAdminSession = session;

    document.getElementById('adminLoading').style.display = 'none';
    document.getElementById('adminRoot').style.display = 'block';

    if (role === 'SUPER_ADMIN') {
        const tabsNav = document.getElementById('adminTabs');
        const settingsTab = document.createElement('button');
        settingsTab.className = 'admin-tab';
        settingsTab.dataset.tab = 'settings';
        settingsTab.setAttribute('data-i18n', 'admin.tabs.settings');
        settingsTab.textContent = tt('admin.tabs.settings');
        tabsNav.appendChild(settingsTab);
        bindTab(settingsTab);
    }

    // ============ NAVIGATION PAR ONGLETS ============
    function bindTab(btn) {
        btn.addEventListener('click', () => {
            document.querySelectorAll('.admin-tab').forEach((b) => b.classList.remove('is-active'));
            document.querySelectorAll('.admin-panel').forEach((p) => {
                p.classList.remove('is-active');
                p.style.display = 'none';
            });
            btn.classList.add('is-active');
            const panel = document.getElementById(`panel-${btn.dataset.tab}`);
            if (panel) {
                panel.classList.add('is-active');
                panel.style.display = 'block';
            }
        });
    }

    document.querySelectorAll('.admin-tab').forEach(bindTab);

    window.dispatchEvent(new CustomEvent('admin:ready', { detail: { role, session } }));
})();
