// Attente du chargement du formulaire
document.getElementById('authForm').addEventListener('submit', function(event) {
    // Empêche la page de se recharger lors du clic sur le bouton
    event.preventDefault();

    //Récupère les valeur saisies dans les champs
    const email = document.getElementById('email').Value;
    const phone = document.getElementById('phone').Value;
    const password = document.getElementById('password').value;

    // Affichage dans la console du navigateur ( pour tester )
    console.log("données saisies :");
    console.log("Email : ", email);
    console.log("Téléphone :", phone);
    console.log("Mot de passe :", password);

    // Message de confirmation temporaire
    alert("Formulaire soumis avec succès pour : " + email);

});