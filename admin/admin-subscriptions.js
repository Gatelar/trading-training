// ============ OVERRIDES SUPPORT SUR LES ABONNEMENTS ============
(function () {
    const SUPABASE_FUNCTIONS_URL = 'https://pzycamkdwvpkyacvkzrs.supabase.co/functions/v1';

    function tt(key) {
        const lang = typeof ttGetLang === 'function' ? ttGetLang() : 'fr';
        return (typeof I18N_DICT !== 'undefined' && I18N_DICT[key]) ? (I18N_DICT[key][lang] || I18N_DICT[key].fr) : key;
    }

    const userSelect = document.getElementById('subUserSelect');
    const statusEl = document.getElementById('subUserStatus');
    const feedbackEl = document.getElementById('subFeedback');
    const pauseBtn = document.getElementById('subPauseBtn');
    const resumeBtn = document.getElementById('subResumeBtn');
    const cancelBtn = document.getElementById('subCancelBtn');
    const extendBtn = document.getElementById('subExtendBtn');

    let directory = [];

    function populateSelect() {
        userSelect.innerHTML = directory.map((row) => `<option value="${row.id}">${row.email}</option>`).join('');
        updateStatusLine();
    }

    function updateStatusLine() {
        const row = directory.find((r) => r.id === userSelect.value);
        if (!row) { statusEl.textContent = ''; return; }
        if (!row.subscription_status) {
            statusEl.textContent = tt('admin.subscriptions.noSubscription');
            return;
        }
        const bits = [row.subscription_status];
        if (row.is_paused) bits.push(tt('admin.status.paused'));
        if (row.support_grace_until) bits.push(`${tt('admin.subscriptions.extendUntilLabel')}: ${new Date(row.support_grace_until).toLocaleDateString()}`);
        statusEl.textContent = bits.join(' · ');
    }

    function setFeedback(message, isError) {
        feedbackEl.textContent = message;
        feedbackEl.className = 'admin-feedback ' + (isError ? 'is-error' : 'is-success');
    }

    async function callOverride(action) {
        const targetUserId = userSelect.value;
        if (!targetUserId) return;

        const session = window.__ttAdminSession;
        setFeedback('', false);
        [pauseBtn, resumeBtn, cancelBtn, extendBtn].forEach((b) => { b.disabled = true; });

        try {
            const res = await fetch(`${SUPABASE_FUNCTIONS_URL}/admin-subscription-override`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    Authorization: `Bearer ${session.access_token}`,
                },
                body: JSON.stringify({ action, targetUserId }),
            });
            const json = await res.json();
            if (!res.ok || json.error) throw new Error(json.error || tt('admin.subscriptions.actionError'));
            setFeedback(tt('admin.subscriptions.actionSuccess'), false);
        } catch (err) {
            setFeedback(err.message, true);
        } finally {
            [pauseBtn, resumeBtn, cancelBtn, extendBtn].forEach((b) => { b.disabled = false; });
        }
    }

    pauseBtn.addEventListener('click', () => callOverride('pause'));
    resumeBtn.addEventListener('click', () => callOverride('resume'));
    cancelBtn.addEventListener('click', () => callOverride('cancel'));

    extendBtn.addEventListener('click', () => {
        window.adminOpenModal(`
            <h3>${tt('admin.subscriptions.extendModalTitle')}</h3>
            <div class="admin-modal-field">
                <label>${tt('admin.subscriptions.extendDaysLabel')}</label>
                <input type="number" id="extendDaysInput" class="admin-input" min="1" step="1" value="7">
            </div>
            <p class="admin-feedback" id="extendFeedback"></p>
            <div class="admin-modal-actions">
                <button class="btn-secondary admin-btn-sm" id="extendCancelBtn">${tt('admin.cancelModal')}</button>
                <button class="btn-primary admin-btn-sm" id="extendConfirmBtn">${tt('admin.subscriptions.confirmExtend')}</button>
            </div>
        `);

        document.getElementById('extendCancelBtn').addEventListener('click', window.adminCloseModal);
        document.getElementById('extendConfirmBtn').addEventListener('click', async () => {
            const days = parseInt(document.getElementById('extendDaysInput').value, 10);
            const fb = document.getElementById('extendFeedback');
            if (!Number.isFinite(days) || days <= 0) return;

            const targetUserId = userSelect.value;
            const session = window.__ttAdminSession;
            const confirmBtn = document.getElementById('extendConfirmBtn');
            confirmBtn.disabled = true;

            try {
                const res = await fetch(`${SUPABASE_FUNCTIONS_URL}/admin-subscription-override`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        Authorization: `Bearer ${session.access_token}`,
                    },
                    body: JSON.stringify({ action: 'grant_time', targetUserId, days }),
                });
                const json = await res.json();
                if (!res.ok || json.error) throw new Error(json.error || tt('admin.subscriptions.actionError'));

                const row = directory.find((r) => r.id === targetUserId);
                if (row) row.support_grace_until = json.supportGraceUntil;

                window.adminCloseModal();
                setFeedback(tt('admin.subscriptions.actionSuccess'), false);
                updateStatusLine();
            } catch (err) {
                fb.textContent = err.message;
                fb.className = 'admin-feedback is-error';
            } finally {
                confirmBtn.disabled = false;
            }
        });
    });

    userSelect.addEventListener('change', updateStatusLine);

    window.addEventListener('admin:directory-loaded', (e) => {
        directory = e.detail.directory;
        populateSelect();
    });
})();
