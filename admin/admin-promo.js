// ============ CODES PROMO ============
(function () {
    function tt(key) {
        const lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
        return (typeof I18N_DICT !== 'undefined' && I18N_DICT[key]) ? (I18N_DICT[key][lang] || I18N_DICT[key].fr) : key;
    }

    const tbody = document.getElementById('promoTableBody');
    const createBtn = document.getElementById('promoCreateBtn');

    function discountLabel(row) {
        return row.discount_type === 'percent' ? `${row.discount_value}%` : `${row.discount_value} €`;
    }

    async function loadPromoCodes() {
        const { data, error } = await supabaseClient
            .from('promo_codes')
            .select('*')
            .order('created_at', { ascending: false });

        if (error || !data || data.length === 0) {
            tbody.innerHTML = `<tr><td colspan="6" class="admin-table-empty">—</td></tr>`;
            return;
        }

        tbody.innerHTML = data.map((row) => {
            const usage = `${row.redemption_count} / ${row.max_redemptions ?? tt('admin.promo.unlimited')}`;
            const expires = row.expires_at ? new Date(row.expires_at).toLocaleDateString() : tt('admin.promo.noExpiry');
            const statusCls = row.is_active ? 'admin-tag-accent' : 'admin-tag-muted';
            const statusLabel = row.is_active ? tt('admin.promo.active') : tt('admin.promo.disabled');
            const toggleLabel = row.is_active ? tt('admin.promo.disable') : tt('admin.promo.enable');
            return `
                <tr>
                    <td>${row.code}</td>
                    <td>${discountLabel(row)}</td>
                    <td>${usage}</td>
                    <td>${expires}</td>
                    <td><span class="admin-tag ${statusCls}">${statusLabel}</span></td>
                    <td><button class="admin-btn-link" data-toggle-id="${row.id}" data-toggle-active="${row.is_active}">${toggleLabel}</button></td>
                </tr>
            `;
        }).join('');

        tbody.querySelectorAll('[data-toggle-id]').forEach((btn) => {
            btn.addEventListener('click', async () => {
                const id = btn.getAttribute('data-toggle-id');
                const current = btn.getAttribute('data-toggle-active') === 'true';
                await supabaseClient.from('promo_codes').update({ is_active: !current }).eq('id', id);
                loadPromoCodes();
            });
        });
    }

    createBtn.addEventListener('click', () => {
        window.adminOpenModal(`
            <h3>${tt('admin.promo.createButton')}</h3>
            <div class="admin-modal-field">
                <label>${tt('admin.promo.codeLabel')}</label>
                <input type="text" id="promoCodeInput" class="admin-input" style="text-transform:uppercase;">
            </div>
            <div class="admin-modal-field">
                <label>${tt('admin.promo.valueLabel')}</label>
                <select id="promoTypeInput" class="admin-select" style="margin-bottom:8px;">
                    <option value="percent">${tt('admin.promo.typePercent')}</option>
                    <option value="fixed">${tt('admin.promo.typeFixed')}</option>
                </select>
                <input type="number" id="promoValueInput" class="admin-input" min="0" step="0.01">
            </div>
            <div class="admin-modal-field">
                <label>${tt('admin.promo.expiresLabel')}</label>
                <input type="date" id="promoExpiresInput" class="admin-input">
            </div>
            <div class="admin-modal-field">
                <label>${tt('admin.promo.maxRedemptionsLabel')}</label>
                <input type="number" id="promoMaxInput" class="admin-input" min="1" step="1">
            </div>
            <p class="admin-feedback" id="promoFeedback"></p>
            <div class="admin-modal-actions">
                <button class="btn-secondary admin-btn-sm" id="promoCancelBtn">${tt('admin.cancelModal')}</button>
                <button class="btn-primary admin-btn-sm" id="promoConfirmBtn">${tt('admin.subscriptions.confirmExtend')}</button>
            </div>
        `);

        document.getElementById('promoCancelBtn').addEventListener('click', window.adminCloseModal);
        document.getElementById('promoConfirmBtn').addEventListener('click', async () => {
            const fb = document.getElementById('promoFeedback');
            const code = document.getElementById('promoCodeInput').value.trim().toUpperCase();
            const discountType = document.getElementById('promoTypeInput').value;
            const discountValue = parseFloat(document.getElementById('promoValueInput').value);
            const expiresVal = document.getElementById('promoExpiresInput').value;
            const maxVal = document.getElementById('promoMaxInput').value;

            if (!code || !discountValue) {
                fb.textContent = tt('admin.subscriptions.actionError');
                fb.className = 'admin-feedback is-error';
                return;
            }

            const { error } = await supabaseClient.from('promo_codes').insert({
                code,
                discount_type: discountType,
                discount_value: discountValue,
                expires_at: expiresVal ? new Date(expiresVal + 'T23:59:59').toISOString() : null,
                max_redemptions: maxVal ? parseInt(maxVal, 10) : null,
                created_by: window.__ttAdminSession.user.id,
            });

            if (error) {
                fb.textContent = error.message;
                fb.className = 'admin-feedback is-error';
                return;
            }

            window.adminCloseModal();
            loadPromoCodes();
        });
    });

    window.addEventListener('admin:ready', loadPromoCodes);
})();
