# Authentification

Page de connexion / inscription du site Trading Training.

## Fichiers

- `authentification.html` — structure de la page (formulaire de connexion, bouton "Login with Google")
- `authentification.css` — styles de la page
- `authentifiaction.js` — logique de soumission du formulaire

## Statut

- [x] Visuel de la page en place (carte de connexion avec colonne illustration + formulaire)
- [ ] Bouton "Login with Google" non fonctionnel (visuel uniquement)
- [ ] Le formulaire dans `authentification.html` n'a pas d'attribut `id="authForm"` et les champs n'ont pas d'`id` (`email`, `phone`, `password`) — `authentifiaction.js` ne peut donc pas les récupérer pour l'instant
- [ ] `authentifiaction.js` utilise `.Value` (avec majuscule) au lieu de `.value` sur les champs — à corriger
- [ ] Aucune vraie logique d'authentification (pas de backend, pas de vérification) — le formulaire affiche juste une alerte de confirmation

## À faire

Relier le HTML et le JS (ajouter les `id` correspondants), corriger la casse de `.value`, puis brancher une vraie logique d'authentification (backend ou service tiers).
