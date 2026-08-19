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

// ============ SOUMISSION - CONNEXION ============
document.getElementById('signInForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const email = document.getElementById('signInEmail').value;
    const password = document.getElementById('signInPassword').value;

    console.log('Connexion :');
    console.log('Email :', email);
    console.log('Mot de passe :', password);

    alert('Connexion soumise pour : ' + email);
});

// ============ SOUMISSION - INSCRIPTION ============
document.getElementById('signUpForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const name = document.getElementById('signUpName').value;
    const email = document.getElementById('signUpEmail').value;
    const password = document.getElementById('signUpPassword').value;

    console.log('Inscription :');
    console.log('Nom :', name);
    console.log('Email :', email);
    console.log('Mot de passe :', password);

    alert('Inscription soumise pour : ' + email);
});
