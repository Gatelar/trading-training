// ============ ANNUAIRE CLIENTS + ACTIVITÉ (VERSION LIGHT) ============
(function () {
    function tt(key) {
        const lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
        return (typeof I18N_DICT !== 'undefined' && I18N_DICT[key]) ? (I18N_DICT[key][lang] || I18N_DICT[key].fr) : key;
    }

    const tbody = document.getElementById('usersTableBody');
    const searchInput = document.getElementById('usersSearch');
    const roleFilter = document.getElementById('usersRoleFilter');
    const statusFilter = document.getElementById('usersStatusFilter');

    let directory = [];
    let activityByUser = {};
    let searchTimer = null;

    // Convention du projet : les données venant de la base (e-mails saisis à
    // l'inscription) sont posées en textContent, jamais interpolées dans du HTML.
    function td(text, className) {
        const cell = document.createElement('td');
        cell.textContent = text;
        if (className) cell.className = className;
        return cell;
    }

    function tagCell(cls, text) {
        const cell = document.createElement('td');
        const tag = document.createElement('span');
        tag.className = `admin-tag ${cls}`;
        tag.textContent = text;
        cell.appendChild(tag);
        return cell;
    }

    function emptyRow(colspan) {
        const tr = document.createElement('tr');
        const cell = td('—', 'admin-table-empty');
        cell.colSpan = colspan;
        tr.appendChild(cell);
        return tr;
    }

    function roleBadgeCell(role) {
        const cls = role === 'SUPER_ADMIN' ? 'admin-tag-solid' : role === 'MANAGER' ? 'admin-tag-accent' : 'admin-tag-muted';
        const key = role === 'SUPER_ADMIN' ? 'admin.role.super' : role === 'MANAGER' ? 'admin.role.manager' : 'admin.role.user';
        return tagCell(cls, tt(key));
    }

    // Dérive un statut d'affichage à partir des colonnes brutes, en tenant
    // compte du flag is_paused (Stripe laisse status="active" en pause) et
    // du délai de grâce support (qui peut couvrir un abonnement annulé).
    function statusInfo(row) {
        const now = new Date();
        const inGrace = row.support_grace_until && new Date(row.support_grace_until) > now;
        if (row.is_paused) return { key: 'admin.status.paused', cls: 'admin-tag-muted' };
        if (row.subscription_status === 'active' || row.subscription_status === 'trialing') {
            return { key: row.subscription_status === 'active' ? 'admin.status.active' : 'admin.status.trialing', cls: 'admin-tag-accent' };
        }
        if (inGrace) return { key: 'admin.status.grace', cls: 'admin-tag-accent' };
        if (row.subscription_status === 'canceled') return { key: 'admin.status.canceled', cls: 'admin-tag-down' };
        return { key: 'admin.status.free', cls: 'admin-tag-muted' };
    }

    function statusFilterValue(row) {
        const info = statusInfo(row);
        if (info.key === 'admin.status.active') return 'active';
        if (info.key === 'admin.status.trialing') return 'trialing';
        if (info.key === 'admin.status.grace') return 'grace';
        return 'free';
    }

    function render() {
        const term = searchInput.value.trim().toLowerCase();
        const roleVal = roleFilter.value;
        const statusVal = statusFilter.value;

        const rows = directory.filter((row) => {
            if (term && !row.email.toLowerCase().includes(term)) return false;
            if (roleVal && row.role !== roleVal) return false;
            if (statusVal && statusFilterValue(row) !== statusVal) return false;
            return true;
        });

        if (rows.length === 0) {
            tbody.replaceChildren(emptyRow(5));
            return;
        }

        tbody.replaceChildren(...rows.map((row) => {
            const info = statusInfo(row);
            const activity = activityByUser[row.id];
            const activityLabel = activity
                ? `${activity.exercise_count} ${tt('admin.users.exercisesCount')}`
                : tt('admin.users.noActivity');
            const registered = new Date(row.registered_at).toLocaleDateString(ttGetLang() === 'en' ? 'en-US' : 'fr-FR');

            const tr = document.createElement('tr');
            tr.appendChild(td(row.email));
            tr.appendChild(td(registered));
            tr.appendChild(roleBadgeCell(row.role));
            tr.appendChild(tagCell(info.cls, tt(info.key)));
            tr.appendChild(td(activityLabel));
            return tr;
        }));
    }

    async function load() {
        const [{ data: dirData }, { data: activityData }] = await Promise.all([
            supabaseClient.from('admin_customer_directory').select('*').order('registered_at', { ascending: false }),
            supabaseClient.from('admin_exercise_activity').select('*'),
        ]);

        directory = dirData || [];
        activityByUser = {};
        (activityData || []).forEach((row) => { activityByUser[row.user_id] = row; });

        render();
        // Expose pour les autres onglets (sélecteur d'abonnements, gestion des rôles).
        window.__ttAdminDirectory = directory;
        window.dispatchEvent(new CustomEvent('admin:directory-loaded', { detail: { directory } }));
    }

    searchInput.addEventListener('input', () => {
        clearTimeout(searchTimer);
        searchTimer = setTimeout(render, 200);
    });
    roleFilter.addEventListener('change', render);
    statusFilter.addEventListener('change', render);

    window.addEventListener('admin:ready', load);
    // Demandé par l'onglet Abonnements après un octroi de jours : la base est la
    // seule source de vérité pour le statut et le délai de grâce.
    window.addEventListener('admin:directory-refresh', load);
})();
