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

## Marchés avec données réelles

| Marché | Source réelle | Granularité | Contexte enrichi (événements datés) |
|---|---|---|---|
| **Forex — EUR/USD** | Alpha Vantage (FX_DAILY) | 1D | Oui — vraies décisions BCE datées |
| **Or et métaux précieux** | Alpha Vantage, ETF **GLD** (proxy de l'or physique, pas le spot exact) | 1D | Non — contexte générique |
| **Actions et indices** | Alpha Vantage, ETF **SPY** (S&P 500) | 1D | Non — contexte générique |
| **Crypto — BTC** | CoinGecko | 4D (pas de journalier gratuit sur un historique long) | Non — contexte générique |

Les 4 marchés utilisent donc de vraies cotations historiques (open/high/low/close). Seul l'EUR/USD bénéficie en plus d'une base d'événements réels et datés (décisions BCE, voir `data/macro-events-eurusd.js`) pour enrichir le contexte marché et le debrief niveau débutant — construire l'équivalent pour les autres marchés (Fed/or, résultats du S&P, flux crypto) reste à faire.

Les indicateurs calculés (volatilité, amplitude, plus haut/plus bas, ratio hausse/baisse) sont eux authentiques sur les 4 marchés, puisque calculés directement à partir des vrais prix.

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
- [x] Quiz de définitions par niveau (correction par mots-clés, débloque l'accès aux exercices)
- [x] Gestion du risque (stop-loss/take-profit, score en multiples de R) sur les niveaux intermédiaire et expérimenté
- [x] Mode séance : 5 exercices enchaînés dans le même niveau/marché, résumé avec P&L cumulé à la fin
- [x] Exercice bonus "Gestion de trade en cours de route" (niveau Expérimenté) : 4 scénarios de décision en cours de trade, notation optimal/défendable/risqué
- [x] Identification de structure (support/résistance) sur intermédiaire et expérimenté, avant le choix achat/vente, avec score de précision contre les vrais points pivots
- [x] Quiz "quel événement explique ce mouvement" (EUR/USD, tous niveaux) intégré au debrief post-reveal
- [ ] Étendre les données réelles aux autres marchés (or, actions, crypto)
- [ ] Vrai système de paiement pour l'abonnement
- [ ] Revue de sécurité complète du site

## Quiz "Quel événement explique ce mouvement ?" (EUR/USD)

Exclusif à l'EUR/USD, intégré dans le debrief post-reveal, pour tous les niveaux. Après le reveal, si un vrai événement de décision BCE est tombé pendant la portion du graphique qui vient d'être dévoilée (`getMacroEventsInRevealedPeriod`), 3 options sont proposées : le vrai événement + 2 distracteurs pris au hasard dans la vraie base de données (`buildNewsQuiz`, mélange déterministe basé sur le seed de l'exercice). L'utilisateur devine lequel a causé le mouvement ; la bonne réponse et sa date/détail réels s'affichent après le choix. N'apparaît que si un événement réel est effectivement tombé dans la période révélée — sinon le bloc ne s'affiche pas.

## Identification de structure (support / résistance)

Sur les niveaux **intermédiaire** et **expérimenté**, avant même de choisir achat/vente, une étape demande de placer un **support** et une **résistance** sur le graphique (clic simple, même mécanique que le stop/take-profit) :

- `findSwingPoints` détecte les vrais points pivots (swing highs/lows) sur la portion visible des bougies, avec une fenêtre de comparaison de 2 bougies de chaque côté
- `scoreStructurePlacement` compare le placement de l'utilisateur au pivot le plus proche et le classe en **Précis** (≤1% d'écart), **Proche** (≤3%) ou **Loin** (au-delà)
- Le résultat s'affiche au reveal, à côté du résultat en R, donnant un vrai usage pédagogique aux outils de tracé plutôt qu'un simple outil décoratif

## Exercice bonus : Gestion de trade en cours de route

Page autonome `exercices/gestion-trade-en-cours.html`, accessible depuis la page niveau Expérimenté une fois le quiz de vocabulaire validé. 4 scénarios de décisions en cours de trade (ajuster un stop, prendre des profits partiels, tenir face à un pullback, gérer un pic de volatilité), chaque option notée sur une échelle qualitative (optimal/défendable/risqué) avec explication, puis bilan de synthèse à la fin. Contenu géré localement dans la page (pas via `i18n.js`), bilingue FR/EN, se re-rend automatiquement au changement de langue via l'événement `tt:langchange` (diffusé par `lang-toggle.js`).

## Mode séance

Chaque changement de marché démarre une nouvelle séance de **5 exercices** (`SESSION_LENGTH` dans `trading-trainer-prototype.jsx`). Le badge "SESSION" affiche la progression (ex: "Exercice 3/5"). Le résultat de chaque exercice révélé est enregistré automatiquement (`useEffect` sur `revealed`) : gagné/perdu pour le débutant, multiple de R pour intermédiaire/expérimenté.

Une fois les 5 exercices complétés, le bouton devient "Voir le résumé de séance" et affiche : nombre d'exercices, taux de réussite, R cumulé, R moyen par trade, meilleur/pire trade, et le détail exercice par exercice. Boutons "Nouvelle séance" (relance sur le même niveau/marché) ou "Changer de marché".

## Gestion du risque (stop-loss / take-profit)

Sur les niveaux **intermédiaire** et **expérimenté**, après avoir choisi achat/vente, une étape supplémentaire s'ajoute avant le reveal :

- L'utilisateur place un **stop-loss** et un **take-profit** directement sur le graphique (clic simple sur le prix voulu, boutons dédiés dans le composant `CandlestickChart`)
- Validation : le stop doit être du côté perdant de la position, le take-profit du côté gagnant (`isValidRiskSetup`)
- Une fois confirmé (`Valider mon trade`), le résultat est simulé bougie par bougie sur la partie non encore révélée du graphique (`simulateRiskOutcome`) : lequel des deux niveaux est touché en premier, et le résultat est exprimé en **multiples de R** (R = distance entre l'entrée et le stop, l'unité de risque) plutôt qu'en simple pourcentage
- Pour le niveau **expérimenté**, cette étape se glisse avant l'analyse libre déjà existante — l'exercice le plus complet cumule position + gestion du risque + réflexion écrite

## Quiz de définitions par niveau

Chaque page `niveaux/<niveau>.html` affiche un quiz de vocabulaire avant de débloquer l'accès aux exercices de ce niveau :

- `data/glossary-terms.js` — 4 termes par niveau (technique + biais psychologiques), bilingue FR/EN, chaque terme a une définition de référence et une liste de mots-clés attendus
- `niveaux/quiz.js` — logique du quiz : correction par mots-clés (60% minimum requis, insensible aux accents/casse via `checkGlossaryAnswer`), affichage côte à côte réponse utilisateur / définition de référence, déblocage stocké dans `localStorage` (`tt_quiz_passed_<niveau>`)
- Le simulateur d'exercice (React) vérifie ce même `localStorage` : un niveau non débloqué redirige vers sa page quiz plutôt que de laisser passer (gate appliqué aussi côté simulateur, pas juste côté page niveau)
- Retries illimités, sans pénalité — l'objectif est pédagogique, pas un examen à note unique

## Site bilingue (FR/EN)

Le site entier (pages statiques + simulateur d'exercice) est traduit en français et anglais, avec un sélecteur en pastille glissante dans la top-bar.

- `i18n.js` — dictionnaire central + fonctions utilitaires, chargé sur toutes les pages statiques. Chaque élément traduisible porte un attribut `data-i18n="clé"` (utiliser `data-i18n-html` pour du HTML, `data-i18n-placeholder` pour un placeholder de champ).
- `lang-toggle.js` — composant du sélecteur FR/EN, attend un élément `#langToggle` dans la page.
- Les longues pages légales utilisent un système de blocs (`class="lang-fr"` / `class="lang-en"`, basculés via `html[lang]` en CSS) plutôt que des clés unitaires.
- Le simulateur d'exercice (React) a son propre dictionnaire `T` embarqué dans `trading-trainer-prototype.jsx`, avec un état `lang` propagé à tous les composants. Il partage la même clé `localStorage` (`tt_lang`) que le reste du site pour rester synchronisé.
- La base d'événements BCE (`data/macro-events-eurusd.js`) a des champs `title_en`/`detail_en` en plus des champs français.

## Recompiler trading-trainer.html après une modification du .jsx

Le fichier jouable est un bundle React autonome. Pour le régénérer après avoir modifié `trading-trainer-prototype.jsx` :

```
npm install esbuild react react-dom lucide-react
npx esbuild entry.jsx --bundle --minify --outfile=bundle.js --loader:.jsx=jsx
```

(`entry.jsx` importe `trading-trainer-prototype.jsx` et fait le `createRoot(...).render(...)`). Le HTML final = en-tête avec le gate d'accès + `bundle.js` + fermeture des balises.

## Notes

Ce README est mis à jour au fur et à mesure de l'avancement du projet.
