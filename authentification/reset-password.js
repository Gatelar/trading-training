// ============ RÉINITIALISATION DU MOT DE PASSE ============
// Cette page est ouverte depuis le lien envoyé par email (resetPasswordForEmail).
// Le SDK Supabase détecte automatiquement le jeton de récupération dans l'URL,
// crée une session temporaire, puis émet l'événement PASSWORD_RECOVERY.

const resetForm = document.getElementById('resetPasswordForm');
const invalidState = document.getElementById('resetInvalidState');
let recoveryReady = false;

function showResetMessage(text, isError) {
    const el = document.getElementById('resetMessage');
    el.textContent = text;
    el.classList.toggle('is-error', isError);
    el.classList.toggle('is-success', !isError);
}

supabaseClient.auth.onAuthStateChange((event) => {
    if (event === 'PASSWORD_RECOVERY') {
        recoveryReady = true;
    }
});

// Si aucune session de récupération n'a été établie après un court délai,
// le lien est absent, invalide ou expiré : on affiche l'état d'erreur.
setTimeout(async () => {
    if (recoveryReady) return;
    const { data } = await supabaseClient.auth.getSession();
    if (!data.session) {
        resetForm.style.display = 'none';
        invalidState.style.display = 'block';
    }
}, 1500);

resetForm.addEventListener('submit', async function (event) {
    event.preventDefault();

    const pw1 = document.getElementById('newPassword').value;
    const pw2 = document.getElementById('confirmPassword').value;
    const submitBtn = event.target.querySelector('.btn-submit');

    if (pw1.length < 8) {
        showResetMessage('Le mot de passe doit contenir au moins 8 caractères.', true);
        return;
    }

    if (pw1 !== pw2) {
        showResetMessage('Les mots de passe ne correspondent pas.', true);
        return;
    }

    submitBtn.disabled = true;
    showResetMessage('Mise à jour...', false);

    const { error } = await supabaseClient.auth.updateUser({ password: pw1 });

    submitBtn.disabled = false;

    if (error) {
        showResetMessage(error.message, true);
        return;
    }

    showResetMessage('Mot de passe mis à jour ! Redirection...', false);
    setTimeout(() => { window.location.href = '../index.html'; }, 1800);
});
