// ============ RÉGLAGES SUPER ADMIN (rôles, stats, journal d'activité) ============
(function () {
    // Doit correspondre à STRIPE_PRICE_IDS.annual dans abonnement/abonnement.js —
    // sert à ramener le montant d'un abonnement annuel à un équivalent mensuel pour le MRR.
    const ANNUAL_PRICE_ID = 'price_1U6WVMAj7CBPiaM2i3sVd2YK';

    function tt(key) {
        const lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
        return (typeof I18N_DICT !== 'undefined' && I18N_DICT[key]) ? (I18N_DICT[key][lang] || I18N_DICT[key].fr) : key;
    }

    const statsGrid = document.getElementById('settingsStatsGrid');
    const rolesBody = document.getElementById('rolesTableBody');
    const activityBody = document.getElementById('activityTableBody');

    // Convention du projet : les données venant de la base (e-mails saisis à
    // l'inscription, libellés d'action) sont posées en textContent, jamais
    // interpolées dans du HTML.
    function td(text, className) {
        const cell = document.createElement('td');
        cell.textContent = text;
        if (className) cell.className = className;
        return cell;
    }

    function emptyRow(colspan) {
        const tr = document.createElement('tr');
        const cell = td('—', 'admin-table-empty');
        cell.colSpan = colspan;
        tr.appendChild(cell);
        return tr;
    }

    function statCard(labelKey, value) {
        return `
            <div class="admin-stat-card">
                <span class="admin-stat-label">${tt(labelKey)}</span>
                <span class="admin-stat-value">${value}</span>
            </div>
        `;
    }

    async function loadStats() {
        const { data: directory } = await supabaseClient.from('admin_customer_directory').select('*');
        const rows = directory || [];

        const totalUsers = rows.length;
        const activeSubs = rows.filter((r) => r.subscription_status === 'active').length;
        const trialSubs = rows.filter((r) => r.subscription_status === 'trialing').length;

        const mrrCents = rows.reduce((sum, r) => {
            if (r.subscription_status !== 'active' && r.subscription_status !== 'trialing') return sum;
            if (!r.amount_cents) return sum;
            // Un plan annuel est ramené à son équivalent mensuel pour le calcul du MRR.
            const monthly = r.stripe_price_id === ANNUAL_PRICE_ID ? r.amount_cents / 12 : r.amount_cents;
            return sum + monthly;
        }, 0);

        statsGrid.innerHTML = [
            statCard('admin.settings.statTotalUsers', totalUsers),
            statCard('admin.settings.statActiveSubs', activeSubs),
            statCard('admin.settings.statTrialSubs', trialSubs),
            statCard('admin.settings.statMrr', `${(mrrCents / 100).toFixed(2)} €`),
        ].join('');
    }

    function roleSelect(row) {
        const select = document.createElement('select');
        select.className = 'admin-select';
        select.setAttribute('data-role-id', row.id);
        ['USER', 'MANAGER', 'SUPER_ADMIN'].forEach((r) => {
            const option = document.createElement('option');
            option.value = r;
            option.textContent = r;
            option.selected = r === row.role;
            select.appendChild(option);
        });
        return select;
    }

    function roleRow(row) {
        const tr = document.createElement('tr');
        tr.appendChild(td(row.email));
        const roleCell = document.createElement('td');
        roleCell.appendChild(roleSelect(row));
        tr.appendChild(roleCell);
        return tr;
    }

    async function loadRoles() {
        const { data } = await supabaseClient.from('profiles').select('id, email, role').order('email');
        const rows = data || [];

        if (rows.length === 0) {
            rolesBody.replaceChildren(emptyRow(2));
            return;
        }

        rolesBody.replaceChildren(...rows.map(roleRow));

        rolesBody.querySelectorAll('[data-role-id]').forEach((select) => {
            select.addEventListener('change', async () => {
                const id = select.getAttribute('data-role-id');
                const newRole = select.value;
                // La vraie protection est le trigger DB (seul un SUPER_ADMIN peut
                // passer ce point) : si l'appelant n'en est pas un, ceci échouera.
                const { error } = await supabaseClient.from('profiles').update({ role: newRole }).eq('id', id);
                if (error) {
                    alert(error.message);
                    loadRoles();
                }
            });
        });
    }

    async function loadActivity() {
        const { data } = await supabaseClient
            .from('admin_activity_log')
            .select('*, actor:actor_user_id(email), target:target_user_id(email)')
            .order('created_at', { ascending: false })
            .limit(100);

        const rows = data || [];
        if (rows.length === 0) {
            activityBody.replaceChildren(emptyRow(4));
            return;
        }

        activityBody.replaceChildren(...rows.map((row) => {
            const tr = document.createElement('tr');
            tr.appendChild(td(row.actor ? row.actor.email : '—'));
            tr.appendChild(td(row.action));
            tr.appendChild(td(row.target ? row.target.email : '—'));
            tr.appendChild(td(new Date(row.created_at).toLocaleString()));
            return tr;
        }));
    }

    window.addEventListener('admin:ready', (e) => {
        if (e.detail.role !== 'SUPER_ADMIN') return;
        document.getElementById('panel-settings').style.display = '';
        loadStats();
        loadRoles();
        loadActivity();
    });
})();
