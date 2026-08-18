# Trading Training

**Trading Training** est un site permettant de s'entraîner à l'analyse de graphiques financiers (chandeliers japonais) sur des scénarios générés, avec un niveau de difficulté progressif.

> ⚠️ Statut : **prototype / travail en cours**. Certaines pages ne sont pas encore reliées entre elles et plusieurs fonctionnalités restent à finaliser.

## Concept

L'utilisateur choisit un domaine (or et métaux précieux, forex, actions/indices...) et un niveau de compétence. Un algorithme génère alors un scénario de graphique adapté :

| Niveau | Description |
|---|---|
| **Débutant** | Tendance nette avec peu de bruit, idéal pour apprendre à lire un graphique |
| **Intermédiaire** | Retournements et pullbacks, la tendance change en cours de route |
| **Expérimenté** | Range, faux signaux et forte volatilité, peu de structure évidente |

L'exercice proposé varie selon le niveau (prédiction hausse/baisse, ordre virtuel achat/vente avec calcul de P&L, ou analyse libre).

## Structure du projet

```
trading-training/
├── index.html                    # Page d'accueil
├── style.css                     # Styles de la page d'accueil
├── app.js                        # Script JS de la page d'accueil (actuellement vide)
├── trading-trainer.html          # Prototype jouable (export du composant React)
├── trading-trainer-prototype.jsx # Code source React du simulateur de trading
├── authentification/             # Page de connexion / inscription
│   ├── authentification.html
│   ├── authentification.css
│   └── authentifiaction.js
└── (images : logos, visuels de fond, etc.)
```

## Où en est le projet

- [x] Page d'accueil basique (`index.html`)
- [x] Prototype interactif du simulateur de trading validé (`trading-trainer.html` / `.jsx`)
- [x] Page d'authentification (visuel en place, logique de soumission non fonctionnelle)
- [ ] Lien entre la page d'accueil et le reste du site à finaliser
- [ ] Système de compte utilisateur / connexion réelle
- [ ] Outils de tracé sur le graphique (lignes de tendance, Fibonacci)
- [ ] Contexte actualité/géopolitique lié à la période affichée sur le graphique

## Lancer le projet

Pas encore de méthode de lancement officielle définie (pas de serveur local ni de build configuré pour l'instant). En attendant, les fichiers `.html` peuvent être ouverts directement dans un navigateur pour prévisualiser les pages.

## Notes

Ce README sera mis à jour au fur et à mesure de l'avancement du projet.
