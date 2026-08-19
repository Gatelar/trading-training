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
