# Authentification

Page de connexion / inscription du site Trading Training. Un seul panneau bascule entre les deux formulaires (inspiré du pattern "sliding panel" de https://github.com/shivamchhapola/Login-Page-with-Framer-Motion, recréé en CSS/JS vanilla dans le thème du site).

## Fichiers

- `authentification.html` — structure de la page (formulaire connexion + inscription superposés, panneau coulissant)
- `authentification.css` — styles et animation du panneau
- `authentifiaction.js` — logique de bascule connexion/inscription + soumission des formulaires

## Statut

- [x] Design en panneau coulissant fonctionnel (connexion ↔ inscription)
- [x] Formulaires reliés au JS (`id` sur les champs, `.value` correct)
- [x] Version mobile (le panneau passe au-dessus des formulaires, pas de glissement horizontal)
- [ ] Bouton "Continuer avec Google" non fonctionnel (visuel uniquement)
- [ ] Aucune vraie logique d'authentification (pas de backend, pas de vérification) — les formulaires affichent juste une alerte de confirmation

## À faire

Brancher une vraie logique d'authentification (backend ou service tiers) à la place des `alert()` actuels.
