# Trading Training

**Trading Training** est un site permettant de s'entraîner à l'analyse de graphiques financiers (chandeliers japonais) sur des scénarios de marché, avec un niveau de difficulté progressif et un vrai système de comptes.

## Concept

L'utilisateur choisit un niveau de compétence puis un marché (or, forex, actions/indices, crypto). Un scénario de graphique est généré ou tiré de données réelles selon le marché :

| Niveau | Description | Exercice |
|---|---|---|
| **Débutant** | Tendance nette, peu de bruit | Prédire hausse/baisse |
| **Intermédiaire** | Retournements et pullbacks | Ordre virtuel achat/vente avec P&L |
| **Expérimenté** | Range, faux signaux, forte volatilité | Analyse libre (facultative), sans note |

Deux outils de tracé sont disponibles sur le graphique : ligne de tendance et Fibonacci (retracements calculés automatiquement entre deux points cliqués).

## Marché avec données réelles : EUR/USD

Le marché **Forex — EUR/USD** utilise de vraies cotations historiques (open/high/low/close quotidien, via l'API gratuite Alpha Vantage) plutôt qu'un scénario simulé. Les vraies décisions de politique monétaire de la BCE (dates, résultats, niveau de taux, voir `data/macro-events-eurusd.js`) alimentent le contexte et les indicateurs.

Les autres marchés (or, actions, crypto) restent en scénario généré aléatoirement pour l'instant — même principe à étendre plus tard.

## Accompagnement dégressif selon le niveau

Le panneau "Contexte marché" ne donne pas la même quantité d'aide selon le niveau choisi — l'idée est d'accompagner un débutant à construire une logique, puis de le pousser progressivement à aller chercher l'information lui-même, comme un vrai trader :

| Niveau | Contexte affiché |
|---|---|
| **Débutant** | Contexte complet : événements réels (EUR/USD) ou exemple générique, + indicateurs calculés (taux BCE actuel et tendance, volatilité récente de la période) |
| **Intermédiaire** | Une piste textuelle (sur quoi chercher) + un vrai lien externe pour approfondir soi-même |
| **Expérimenté** | Un lien brut vers une ressource externe généraliste, sans aucune explication |

Les liens/pistes par marché sont dans `DOMAIN_LINKS` (`trading-trainer-prototype.jsx`).

## Debrief après le reveal, adapté au niveau

Symétriquement à l'accompagnement en amont, la profondeur du debrief **après** le reveal augmente avec le niveau — l'idée étant que plus on avance, moins on a d'aide avant de décider, mais plus on est poussé à analyser sa propre décision après coup :

| Niveau | Debrief affiché |
|---|---|
| **Débutant** | 1 question simple de recul |
| **Intermédiaire** | 2 questions de recul + checklist de 3 biais courants |
| **Expérimenté** | 3 questions de recul + checklist de 5 biais + comparaison à une règle technique systématique (croisement de moyennes mobiles SMA5/SMA20, calculée uniquement sur les données visibles avant le reveal) |

Les questions/biais par niveau sont dans `DEBRIEF_QUESTIONS` et `BIAS_ITEMS` (`trading-trainer-prototype.jsx`). Les réponses ne sont pas encore sauvegardées entre les sessions (juste en mémoire le temps de l'exercice) — une vraie sauvegarde (table Supabase) serait l'étape suivante si on veut un historique de progression.

## Comptes utilisateurs et quotas

- Authentification réelle via **Supabase Auth** (inscription/connexion par email + mot de passe)
- Visiteurs non connectés : **1 exercice/jour**
- Inscrits gratuits : **3 exercices/jour** (suivi dans la table Supabase `exercise_logs`)
- Page **Abonnement** avec prix encore en `???` (pas de paiement réel branché)
- Page **Mon compte** : infos utilisateur + quota du jour restant

## Structure du projet

```
trading-training/
├── index.html                      # Page d'accueil (hero, ticker live, niveaux, CTA)
├── style.css / app.js               # Styles et animations de la page d'accueil
├── auth-state.js                    # Affiche l'état de connexion dans la top-bar (partout)
├── supabase-client.js               # Config Supabase partagée (URL + clé publique)
├── trading-trainer.html             # Prototype jouable (bundle React compilé)
├── trading-trainer-prototype.jsx    # Code source React du simulateur (à recompiler avec esbuild)
├── data/
│   └── macro-events-eurusd.js       # Vraies dates de décisions BCE pour le contexte EUR/USD
├── authentification/                # Connexion / inscription (panneau coulissant, Supabase Auth)
├── abonnement/                      # Page abonnement (prix en attente)
├── compte/                          # Page "Mon compte"
└── images/                          # Visuels des cartes de niveaux
```

## Où en est le projet

- [x] Page d'accueil avec ticker BTC/USD + EUR/USD en direct
- [x] Authentification réelle (Supabase Auth), page Mon compte, menu déroulant
- [x] Quotas d'exercices (1/jour visiteurs, 3/jour inscrits) avec page Abonnement
- [x] Simulateur avec outils de tracé (ligne de tendance, Fibonacci)
- [x] EUR/USD sur données réelles (prix + contexte BCE daté)
- [ ] Étendre les données réelles aux autres marchés (or, actions, crypto)
- [ ] Vrai système de paiement pour l'abonnement
- [ ] Revue de sécurité complète du site

## Recompiler trading-trainer.html après une modification du .jsx

Le fichier jouable est un bundle React autonome. Pour le régénérer après avoir modifié `trading-trainer-prototype.jsx` :

```
npm install esbuild react react-dom lucide-react
npx esbuild entry.jsx --bundle --minify --outfile=bundle.js --loader:.jsx=jsx
```

(`entry.jsx` importe `trading-trainer-prototype.jsx` et fait le `createRoot(...).render(...)`). Le HTML final = en-tête avec le gate d'accès + `bundle.js` + fermeture des balises.

## Notes

Ce README est mis à jour au fur et à mesure de l'avancement du projet.
