(async function () {
    const { data } = await supabaseClient.auth.getSession();
    const session = data.session;

    if (!session) {
        window.location.href = '../authentification/authentification.html';
        return;
    }

    const email = session.user.email;
    const firstName = (session.user.user_metadata && session.user.user_metadata.full_name) || email.split('@')[0];

    document.getElementById('accountName').textContent = firstName;
    document.getElementById('accountEmail').textContent = email;

    // ============ STATUT ABONNEMENT ============
    const { data: sub } = await supabaseClient
        .from('subscriptions')
        .select('status, plan, support_grace_until')
        .eq('user_id', session.user.id)
        .maybeSingle();

    const isActive = sub && (
        sub.status === 'active' ||
        sub.status === 'trialing' ||
        (sub.support_grace_until && new Date(sub.support_grace_until) > new Date())
    );
    const planLabel = document.getElementById('planLabel');
    const planTag = document.getElementById('planTag');
    const quotaCard = document.getElementById('quotaCard');

    if (isActive) {
        planLabel.textContent = 'Trader actif';
        planTag.textContent = sub.plan || 'illimité';
        planTag.classList.add('tag-pro');
        if (quotaCard) quotaCard.style.display = 'none';
        const params = new URLSearchParams(window.location.search);
        if (params.get('checkout') === 'success') {
            document.getElementById('checkoutSuccess').style.display = 'block';
        }
    }

    const startOfDay = new Date();
    startOfDay.setHours(0, 0, 0, 0);

    const { count, error } = await supabaseClient
        .from('exercise_logs')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', session.user.id)
        .gte('created_at', startOfDay.toISOString());

    if (!error) {
        document.getElementById('quotaValue').textContent = `${count} / 3`;
    }

    document.getElementById('logoutBtn').addEventListener('click', async () => {
        await supabaseClient.auth.signOut();
        window.location.href = '../index.html';
    });
})();
