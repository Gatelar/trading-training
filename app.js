// Animations de la page d'accueil

// --- Reveal au scroll ---
// Chaque élément avec la classe "reveal" apparaît en fondu/translation
// dès qu'il entre dans la zone visible de l'écran.
const revealElements = document.querySelectorAll('.reveal');

const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            revealObserver.unobserve(entry.target);
        }
    });
}, {
    threshold: 0.15
});

revealElements.forEach((el) => revealObserver.observe(el));

// --- Effet de décalage progressif pour les cartes de niveaux ---
// Les 3 cartes apparaissent l'une après l'autre plutôt que toutes en même temps.
document.querySelectorAll('.level-grid .level-card').forEach((card, index) => {
    card.style.transitionDelay = `${index * 0.12}s`;
});
