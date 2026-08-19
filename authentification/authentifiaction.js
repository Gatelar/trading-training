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

// ============ INSCRIPTION ============
document.getElementById('signUpForm').addEventListener('submit', async function (event) {
    event.preventDefault();

    const name = document.getElementById('signUpName').value;
    const email = document.getElementById('signUpEmail').value;
    const password = document.getElementById('signUpPassword').value;
    const submitBtn = event.target.querySelector('.btn-submit');

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

    const email = document.getElementById('signInEmail').value;
    const password = document.getElementById('signInPassword').value;
    const submitBtn = event.target.querySelector('.btn-submit');

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
