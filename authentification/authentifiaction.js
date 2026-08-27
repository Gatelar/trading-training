// ============ TOGGLE CONNEXION / INSCRIPTION ============
const authCard = document.getElementById('authCard');
const toggleToSignUp = document.getElementById('toggleToSignUp');
const toggleToSignIn = document.getElementById('toggleToSignIn');

toggleToSignUp.addEventListener('click', () => {
    authCard.classList.add('right-panel-active');
});

toggleToSignIn.addEventListener('click', () => {
    authCard.classList.remove('right-panel-active');
});

// ============ AFFICHAGE DES MESSAGES ============
function showMessage(elementId, text, isError) {
    const el = document.getElementById(elementId);
    el.textContent = text;
    el.classList.toggle('is-error', isError);
    el.classList.toggle('is-success', !isError);
}

// ============ CONNEXION GOOGLE ============
document.querySelectorAll('[data-oauth-for]').forEach((btn) => {
    btn.addEventListener('click', async () => {
        const formKey = btn.getAttribute('data-oauth-for');
        const messageId = formKey === 'signIn' ? 'signInMessage' : 'signUpMessage';
        btn.disabled = true;
        showMessage(messageId, 'Redirection vers Google...', false);

        const { error } = await supabaseClient.auth.signInWithOAuth({
            provider: 'google',
            options: { redirectTo: new URL('../index.html', window.location.href).href }
        });

        if (error) {
            btn.disabled = false;
            showMessage(messageId, error.message, true);
        }
        // En cas de succès, le navigateur est redirigé vers Google : rien d'autre à faire ici.
    });
});

// ============ ONGLETS EMAIL / TÉLÉPHONE + MOT DE PASSE OUBLIÉ ============
// Piste glissante Email <-> Téléphone : même principe que le panneau Connexion <-> Inscription
// (panneaux superposés en absolute, translateX + opacity). La hauteur du conteneur est
// recalculée en JS à chaque changement pour que le glissement reste fluide malgré des
// panneaux de hauteurs différentes (ex: apparition du champ code OTP).
function syncTrackHeight(formKey) {
    const track = document.querySelector(`[data-track-for="${formKey}"]`);
    const activeMode = track.classList.contains('mode-phone') ? 'phone' : 'password';
    const activePanel = track.querySelector(`[data-mode-panel="${activeMode}"]`);
    track.style.height = activePanel.offsetHeight + 'px';
}

function setMode(formKey, mode) {
    const track = document.querySelector(`[data-track-for="${formKey}"]`);
    const forgotPanel = document.querySelector(`[data-panel-for="${formKey}"][data-mode-panel="forgot"]`);

    if (mode === 'forgot') {
        track.style.display = 'none';
        forgotPanel.style.display = 'block';
    } else {
        track.style.display = 'block';
        forgotPanel.style.display = 'none';
        track.classList.toggle('mode-phone', mode === 'phone');
        syncTrackHeight(formKey);
    }

    document.querySelectorAll(`[data-tabs-for="${formKey}"] .mode-tab`).forEach((tab) => {
        tab.classList.toggle('active', tab.getAttribute('data-mode') === mode);
    });
    const tabsEl = document.querySelector(`[data-tabs-for="${formKey}"]`);
    tabsEl.style.display = mode === 'forgot' ? 'none' : 'flex';

    const submitBtn = document.getElementById(formKey === 'signIn' ? 'signInSubmitBtn' : 'signUpSubmitBtn');
    const googleBtn = document.querySelector(`[data-oauth-for="${formKey}"]`);
    const messageId = formKey === 'signIn' ? 'signInMessage' : 'signUpMessage';
    showMessage(messageId, '', false);

    if (mode === 'password') {
        submitBtn.textContent = t2(formKey === 'signIn' ? 'auth.signInButton' : 'auth.signUpButton');
        submitBtn.style.display = 'block';
        googleBtn.style.display = 'flex';
    } else if (mode === 'phone') {
        submitBtn.textContent = t2('auth.sendCode');
        submitBtn.style.display = 'block';
        googleBtn.style.display = 'flex';
        resetOtpStep(formKey);
    } else if (mode === 'forgot') {
        submitBtn.textContent = t2('auth.sendResetLink');
        submitBtn.style.display = 'block';
        googleBtn.style.display = 'none';
    }

    formState[formKey].mode = mode;
}

// Petit helper de traduction avec repli si i18n.js n'a pas encore chargé la clé.
function t2(key) {
    if (typeof ttGetLang === 'function' && typeof I18N_DICT !== 'undefined' && I18N_DICT[key]) {
        const lang = ttGetLang();
        return I18N_DICT[key][lang] || I18N_DICT[key].fr;
    }
    const FALLBACK = {
        'auth.signInButton': 'Se connecter',
        'auth.signUpButton': "S'inscrire",
        'auth.sendCode': 'Envoyer le code',
        'auth.verifyCode': 'Valider le code',
        'auth.sendResetLink': 'Envoyer le lien',
    };
    return FALLBACK[key] || key;
}

const formState = {
    signIn: { mode: 'password', otpSent: false },
    signUp: { mode: 'password', otpSent: false },
};

function resetOtpStep(formKey) {
    formState[formKey].otpSent = false;
    const otpGroup = document.getElementById(formKey === 'signIn' ? 'signInOtpGroup' : 'signUpOtpGroup');
    const resendBtn = document.getElementById(formKey === 'signIn' ? 'signInResendOtp' : 'signUpResendOtp');
    otpGroup.style.display = 'none';
    resendBtn.style.display = 'none';
    document.getElementById(formKey === 'signIn' ? 'signInOtpCode' : 'signUpOtpCode').value = '';
    syncTrackHeight(formKey);
}

['signIn', 'signUp'].forEach((formKey) => {
    document.querySelectorAll(`[data-tabs-for="${formKey}"] .mode-tab`).forEach((tab) => {
        tab.addEventListener('click', () => setMode(formKey, tab.getAttribute('data-mode')));
    });
    // Fixe la hauteur initiale de la piste (panneau "password" actif par défaut au chargement).
    syncTrackHeight(formKey);
});

// Recalcule la hauteur de la piste active si le contenu change de taille une fois affiché
// (ex: le texte traduit change de longueur au changement de langue, cf. lang-toggle.js).
function resyncAllTracks() {
    ['signIn', 'signUp'].forEach((formKey) => {
        if (formState[formKey].mode !== 'forgot') syncTrackHeight(formKey);
    });
}
window.addEventListener('resize', resyncAllTracks);
window.addEventListener('tt:langchange', resyncAllTracks);

document.getElementById('forgotPasswordLink').addEventListener('click', (e) => {
    e.preventDefault();
    setMode('signIn', 'forgot');
});

document.getElementById('backToSignInLink').addEventListener('click', (e) => {
    e.preventDefault();
    setMode('signIn', 'password');
});

// ============ ENVOI / VALIDATION DU CODE SMS ============
async function requestOtp(formKey) {
    const phoneInput = document.getElementById(formKey === 'signIn' ? 'signInPhone' : 'signUpPhone');
    const messageId = formKey === 'signIn' ? 'signInMessage' : 'signUpMessage';
    const phone = phoneInput.value.trim();

    if (!phone) {
        showMessage(messageId, 'Merci de renseigner un numéro de téléphone.', true);
        return false;
    }

    showMessage(messageId, 'Envoi du code par SMS...', false);

    const { error } = await supabaseClient.auth.signInWithOtp({ phone });

    if (error) {
        showMessage(messageId, error.message, true);
        return false;
    }

    formState[formKey].otpSent = true;
    document.getElementById(formKey === 'signIn' ? 'signInOtpGroup' : 'signUpOtpGroup').style.display = 'block';
    document.getElementById(formKey === 'signIn' ? 'signInResendOtp' : 'signUpResendOtp').style.display = 'inline-block';
    syncTrackHeight(formKey);
    document.getElementById(formKey === 'signIn' ? 'signInSubmitBtn' : 'signUpSubmitBtn').textContent = t2('auth.verifyCode');
    showMessage(messageId, 'Code envoyé ! Vérifie tes SMS.', false);
    return true;
}

async function verifyOtp(formKey) {
    const phoneInput = document.getElementById(formKey === 'signIn' ? 'signInPhone' : 'signUpPhone');
    const codeInput = document.getElementById(formKey === 'signIn' ? 'signInOtpCode' : 'signUpOtpCode');
    const messageId = formKey === 'signIn' ? 'signInMessage' : 'signUpMessage';
    const phone = phoneInput.value.trim();
    const token = codeInput.value.trim();

    if (!token) {
        showMessage(messageId, 'Merci de saisir le code reçu par SMS.', true);
        return;
    }

    showMessage(messageId, 'Vérification du code...', false);

    const { error } = await supabaseClient.auth.verifyOtp({ phone, token, type: 'sms' });

    if (error) {
        showMessage(messageId, error.message, true);
        return;
    }

    if (formKey === 'signUp') {
        const name = document.getElementById('signUpPhoneName').value.trim();
        if (name) {
            await supabaseClient.auth.updateUser({ data: { full_name: name } });
        }
    }

    showMessage(messageId, 'Connecté !', false);
    window.location.href = '../index.html';
}

document.getElementById('signInResendOtp').addEventListener('click', () => requestOtp('signIn'));
document.getElementById('signUpResendOtp').addEventListener('click', () => requestOtp('signUp'));

// ============ INSCRIPTION ============
document.getElementById('signUpForm').addEventListener('submit', async function (event) {
    event.preventDefault();
    const mode = formState.signUp.mode;
    const submitBtn = event.target.querySelector('.btn-submit');

    if (mode === 'phone') {
        submitBtn.disabled = true;
        if (!formState.signUp.otpSent) {
            await requestOtp('signUp');
        } else {
            await verifyOtp('signUp');
        }
        submitBtn.disabled = false;
        return;
    }

    const name = document.getElementById('signUpName').value;
    const email = document.getElementById('signUpEmail').value;
    const password = document.getElementById('signUpPassword').value;

    submitBtn.disabled = true;
    showMessage('signUpMessage', 'Création du compte...', false);

    const { data, error } = await supabaseClient.auth.signUp({
        email: email,
        password: password,
        options: {
            data: { full_name: name }
        }
    });

    submitBtn.disabled = false;

    if (error) {
        showMessage('signUpMessage', error.message, true);
        return;
    }

    showMessage('signUpMessage', 'Compte créé ! Vérifie ta boîte mail pour confirmer.', false);
    event.target.reset();
});

// ============ CONNEXION ============
document.getElementById('signInForm').addEventListener('submit', async function (event) {
    event.preventDefault();
    const mode = formState.signIn.mode;
    const submitBtn = event.target.querySelector('.btn-submit');

    if (mode === 'phone') {
        submitBtn.disabled = true;
        if (!formState.signIn.otpSent) {
            await requestOtp('signIn');
        } else {
            await verifyOtp('signIn');
        }
        submitBtn.disabled = false;
        return;
    }

    if (mode === 'forgot') {
        const email = document.getElementById('forgotEmail').value.trim();
        if (!email) {
            showMessage('signInMessage', 'Merci de renseigner ton email.', true);
            return;
        }

        submitBtn.disabled = true;
        showMessage('signInMessage', 'Envoi du lien de réinitialisation...', false);

        const { error } = await supabaseClient.auth.resetPasswordForEmail(email, {
            redirectTo: new URL('reset-password.html', window.location.href).href
        });

        submitBtn.disabled = false;

        if (error) {
            showMessage('signInMessage', error.message, true);
            return;
        }

        showMessage('signInMessage', 'Email envoyé ! Vérifie ta boîte mail pour réinitialiser ton mot de passe.', false);
        return;
    }

    const email = document.getElementById('signInEmail').value;
    const password = document.getElementById('signInPassword').value;

    submitBtn.disabled = true;
    showMessage('signInMessage', 'Connexion...', false);

    const { data, error } = await supabaseClient.auth.signInWithPassword({
        email: email,
        password: password
    });

    submitBtn.disabled = false;

    if (error) {
        showMessage('signInMessage', error.message, true);
        return;
    }

    showMessage('signInMessage', 'Connecté !', false);
    window.location.href = '../index.html';
});
