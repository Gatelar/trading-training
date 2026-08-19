# Authentification

Page de connexion / inscription du site Trading Training, avec panneau coulissant entre les deux formulaires, branchée sur **Supabase Auth** pour de vrais comptes utilisateurs.

## Fichiers

- `authentification.html` — structure de la page (formulaires connexion + inscription, panneau coulissant)
- `authentification.css` — styles et animation du panneau
- `supabase-client.js` — configuration du client Supabase (URL + clé publique du projet)
- `authentifiaction.js` — logique de bascule connexion/inscription + appels à Supabase Auth (signUp / signInWithPassword)

## Statut

- [x] Design en panneau coulissant fonctionnel (connexion ↔ inscription)
- [x] Inscription et connexion branchées sur Supabase Auth (vrais comptes, vrai mot de passe vérifié côté serveur)
- [x] Messages d'erreur/succès affichés dans le formulaire (email déjà utilisé, mot de passe trop court, etc.)
- [x] Redirection vers la page d'accueil après connexion réussie
- [ ] Bouton "Continuer avec Google" non fonctionnel (visuel uniquement — nécessiterait de configurer le provider Google dans Supabase)
- [ ] Pas encore de gestion de session affichée sur le site (ex: remplacer "Se connecter" par le nom de l'utilisateur une fois connecté)
- [ ] Pas de page "mot de passe oublié" fonctionnelle

## Configuration Supabase

Le projet Supabase associé est identifié par son URL (`pzycamkdwvpkyacvkzrs.supabase.co`) et sa clé publique dans `supabase-client.js`. Cette clé est faite pour être visible côté client — seule la clé secrète (jamais mise dans le code) donne un accès complet à la base.

Selon la configuration du projet Supabase, la confirmation par email peut être activée ou désactivée (à vérifier dans Authentication → Settings sur le tableau de bord Supabase).

## À faire

- Afficher l'état de connexion sur le reste du site (top-bar)
- Implémenter "mot de passe oublié"
- Éventuellement activer la connexion Google
