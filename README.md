# Trading Training

**Trading Training** est un site permettant de s'entraîner à l'analyse de graphiques financiers (chandeliers japonais) sur des scénarios de marché, avec un niveau de difficulté progressif, une formation écrite réservée aux abonnés et un vrai système de comptes.

Site statique en vanilla (HTML/CSS/JS), sans build step ni dépendance npm, hébergé sur GitHub Pages. Toute la partie serveur (comptes, abonnements, contenu payant, administration) vit dans Supabase.

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

## Comptes, quotas et abonnement

Authentification réelle via **Supabase Auth**, avec quatre chemins d'entrée : email + mot de passe, **Google** (OAuth), **téléphone** (code SMS à usage unique), et réinitialisation de mot de passe par email (`authentification/reset-password.js`).

| Profil | Accès aux exercices |
|---|---|
| Visiteur non connecté | **1 exercice/jour** (marqueur `localStorage`, remis à zéro chaque jour) |
| Inscrit gratuit | **3 exercices/jour** (comptés dans la table Supabase `exercise_logs`) |
| Abonné actif, en essai, ou en délai de grâce | **Illimité** |

Le contrôle est fait dans l'en-tête de `trading-trainer.html`, avant l'affichage du simulateur. Une liste d'e-mails admin y est codée en dur pour contourner le quota en développement.

L'abonnement passe par **Stripe, en mode test** : 9,99 €/mois ou 99 €/an (−17 %). Aucune carte réelle n'est débitée et le prix définitif n'est pas fixé. Trois fonctions edge Supabase portent la partie serveur :

| Fonction | Rôle |
|---|---|
| `create-checkout-session` | Ouvre la session de paiement Stripe depuis la page Abonnement |
| `stripe-webhook` | Reçoit les événements Stripe et met à jour la table `subscriptions` |
| `admin-subscription-override` | Pause / reprise / annulation / octroi de jours gratuits, déclenché depuis le panel admin |

La page **Mon compte** affiche les infos utilisateur et le quota du jour restant.

## Formation (réservée aux abonnés)

Trois parcours écrits — Débutant, Intermédiaire, Expérimenté — de 6 modules chacun, soit 18 modules et 83 chapitres (29 / 28 / 26), entièrement bilingues FR/EN.

Le **sommaire** (titres, durées, nombre de chapitres) est public : il est servi en statique depuis `data/formation-index.js` et sert d'argument commercial. Le **corps des chapitres** vient exclusivement de la table Supabase `formation_chapitres`, sous RLS (migration `008_formation_rls.sql`) : un non-abonné ne reçoit aucune ligne, quoi qu'il fasse dans son navigateur.

- `apprendre/apprendre.html` — le sommaire des trois parcours
- `apprendre/module.html?p=<parcours>&m=<numéro>` — la lecture d'un module
- `lib/formation-gate.js` — pilote **l'affichage** (mur d'abonnement ou contenu). Il ne protège rien à lui seul : la barrière réelle est la RLS. Il reprend à la virgule près la règle d'abonnement de `compte/compte.js`, et ouvre aussi l'accès aux comptes MANAGER et SUPER_ADMIN, comme la migration 008 le prévoit côté base.

La chaîne de production du contenu part des fichiers texte balisés de `formation/contenu*/` et alimente trois sorties, qui ne peuvent donc pas diverger :

```bash
python formation/build_index.py
```

```bash
python formation/push_chapitres.py
```

```bash
python formation/build_pdf.py
```

Respectivement : `data/formation-index.js` (le sommaire public), `supabase/sql/009_formation_contenu.sql` (à jouer dans Supabase) et les six PDF (3 parcours × 2 langues, non versionnés).

`_config.yml` exclut `formation/` et `supabase/` de la publication GitHub Pages : sans lui, les sources `.txt`, les PDF et les migrations 009 rendraient tout le contenu payant téléchargeable en clair. **Ne pas ajouter de `.nojekyll` à la racine** — il désactiverait Jekyll, donc ces exclusions.

## Panel d'administration

`admin/admin.html`, avec un contrôle d'accès par rôle (`USER` / `MANAGER` / `SUPER_ADMIN`, migration `001_rbac_profiles.sql`) :

| Onglet | Contenu | Ouvert à |
|---|---|---|
| **Clients** | Annuaire (email, inscription, rôle, statut, activité), recherche et filtres | MANAGER, SUPER_ADMIN |
| **Abonnements** | Overrides support : pause, reprise, annulation, octroi de jours gratuits | MANAGER, SUPER_ADMIN |
| **Codes promo** | Création et activation/désactivation de codes | MANAGER, SUPER_ADMIN |
| **Réglages** | Statistiques (clients, abonnés, essais, MRR), gestion des rôles, journal d'activité | SUPER_ADMIN seulement |

Deux points structurants :

- **La redirection côté client n'est pas la sécurité.** `admin/admin-init.js` renvoie un non-admin vers l'accueil, mais c'est du confort d'UX. La vraie barrière est la RLS Postgres sur chaque table : même en contournant la redirection, toutes les requêtes du panel restent vides ou refusées.
- **Le journal d'activité est alimenté par des triggers**, pas par le JS (`005_activity_log_triggers.sql`). Un trigger se déclenche dès que la mutation a lieu, quelle que soit la façon dont elle a été invoquée — compter sur le code client laisserait des trous dans l'audit.

Les codes promo sont créés et activables dans le panel, mais **pas encore appliqués au paiement** : `create-checkout-session` ne les lit pas.

## Conventions de code

- **Vanilla, aucun build step, aucune dépendance npm.** Les pages chargent leurs scripts directement. Les bibliothèques tierces viennent d'un CDN.
- **Cache-busting par `?v=N`** sur les scripts et feuilles de style. À incrémenter quand on modifie un fichier déjà en ligne, sinon les visiteurs récurrents gardent l'ancienne version.
- **Données utilisateur en `textContent`, jamais en `innerHTML`.** Les e-mails, les codes promo et tout ce qui vient de la base sont posés sur des nœuds construits par `document.createElement`. Les gabarits `innerHTML` sont réservés au balisage dont on écrit soi-même le contenu (libellés du dictionnaire i18n, nombres calculés). Là où du texte balisé doit devenir du HTML — le rendu des chapitres dans `apprendre/module.js` — il est échappé d'abord, et seules nos propres balises sont réinjectées ensuite.
- **Une règle, un endroit.** Le test d'abonnement est écrit dans `compte/compte.js` et repris à l'identique par `lib/formation-gate.js` ; les titres et durées de la formation viennent tous de `data/formation-index.js`, généré.

## Structure du projet

```
trading-training/
├── index.html                      # Page d'accueil (hero, ticker live, niveaux, CTA)
├── style.css / app.js              # Styles et animations de la page d'accueil
├── i18n.js / lang-toggle.js        # Dictionnaire bilingue + sélecteur FR/EN
├── auth-state.js                   # Affiche l'état de connexion dans la top-bar (partout)
├── supabase-client.js              # Config Supabase partagée (URL + clé publique)
├── _config.yml                     # Exclusions GitHub Pages (protège le contenu payant)
├── trading-trainer.html            # Simulateur : gate de quota + chargement du .jsx
├── trading-trainer-prototype.jsx   # Le simulateur lui-même (malgré son nom, pas un prototype)
├── niveaux/                        # Pages des 3 niveaux + quiz de vocabulaire
├── exercices/                      # Exercice bonus "Gestion de trade en cours de route"
├── apprendre/                      # Formation : sommaire et lecture des modules
├── formation/                      # Sources .txt des parcours + scripts Python de génération
├── admin/                          # Panel d'administration (RBAC)
├── abonnement/                     # Page abonnement (Stripe mode test)
├── authentification/               # Connexion / inscription (email, Google, téléphone)
├── compte/                         # Page "Mon compte"
├── legal/                          # Mentions légales, CGU, confidentialité
├── lib/formation-gate.js           # Contrôle d'accès (affichage) à la formation
├── supabase/
│   ├── sql/                        # Migrations, à jouer dans l'ordre
│   └── functions/                  # Fonctions edge (Stripe, overrides admin)
├── data/                           # Événements BCE, glossaire, index de la formation
├── tools/                          # Génération d'images et prompts (développement)
└── images/                         # Visuels des cartes de niveaux
```

`components/` et `lib/utils.ts` sont des composants React/TS qu'aucune page ne charge — ils sont exclus de la publication.

## Où en est le projet

- [x] Page d'accueil avec ticker BTC/USD + EUR/USD en direct
- [x] Authentification réelle (Supabase Auth) : email, Google, téléphone, réinitialisation de mot de passe
- [x] Quotas d'exercices (1/jour visiteurs, 3/jour inscrits, illimité pour les abonnés)
- [x] Abonnement Stripe en mode test (mensuel/annuel) avec webhook et fonctions edge
- [x] Simulateur avec outils de tracé (ligne de tendance, Fibonacci)
- [x] EUR/USD sur données réelles (prix + contexte BCE daté)
- [x] Quiz de définitions par niveau (correction par mots-clés, débloque l'accès aux exercices)
- [x] Gestion du risque (stop-loss/take-profit, score en multiples de R) sur les niveaux intermédiaire et expérimenté
- [x] Mode séance : 20 exercices enchaînés dans le même niveau/marché, résumé avec P&L cumulé à la fin
- [x] Exercice bonus "Gestion de trade en cours de route" (niveau Expérimenté)
- [x] Identification de structure (support/résistance) sur intermédiaire et expérimenté
- [x] Quiz "quel événement explique ce mouvement" (EUR/USD, tous niveaux) intégré au debrief post-reveal
- [x] Progression entre niveaux : intermédiaire/expérimenté verrouillés tant qu'un seuil de performance n'est pas atteint
- [x] Panel d'administration avec RBAC, overrides d'abonnement et journal d'activité
- [x] Formation : 3 parcours bilingues (18 modules, 83 chapitres) servis sous RLS aux abonnés
- [ ] Appliquer les codes promo au paiement (créés dans le panel, ignorés au checkout)
- [ ] Passer Stripe en mode production et fixer le prix définitif
- [ ] Étendre les données réelles aux autres marchés (or, actions, crypto)
- [ ] Sauvegarder les réponses de debrief pour un historique de progression
- [ ] Revue de sécurité complète du site

## Progression entre niveaux

Le niveau intermédiaire et le niveau expérimenté ne sont plus accessibles librement — même leur quiz de vocabulaire est verrouillé tant qu'un seuil de performance n'est pas atteint sur le niveau précédent :

- **Débutant → Intermédiaire** : terminer une séance complète avec au moins **60% de réussite**
- **Intermédiaire → Expérimenté** : terminer une séance complète avec un **R cumulé ≥ +1R**

Seuils définis dans `PROGRESSION_THRESHOLDS` (`trading-trainer-prototype.jsx`). Le déblocage est vérifié et enregistré (`checkAndUnlockNextLevel`) à la fin de chaque séance, dans `localStorage` (`tt_progression_unlocked_<niveau>`). Les pages `niveaux/intermediaire.html` et `niveaux/experimente.html` vérifient ce même flag avant même d'afficher leur quiz de vocabulaire ; le simulateur React fait de même via `isLevelUnlocked` (qui combine désormais quiz-validé ET progression débloquée).

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

Chaque changement de marché démarre une nouvelle séance de **20 exercices** (`SESSION_LENGTH` dans `trading-trainer-prototype.jsx`). Le badge "SESSION" affiche la progression (ex: "Exercice 3/20"). Le résultat de chaque exercice révélé est enregistré automatiquement (`useEffect` sur `revealed`) : gagné/perdu pour le débutant, multiple de R pour intermédiaire/expérimenté.

Une fois la séance complétée, le bouton devient "Voir le résumé de séance" et affiche : nombre d'exercices, taux de réussite, R cumulé, R moyen par trade, meilleur/pire trade, et le détail exercice par exercice. Boutons "Nouvelle séance" (relance sur le même niveau/marché) ou "Changer de marché".

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

Le site entier (pages statiques, simulateur d'exercice et formation) est traduit en français et anglais, avec un sélecteur en pastille glissante dans la top-bar.

- `i18n.js` — dictionnaire central + fonctions utilitaires, chargé sur toutes les pages statiques. Chaque élément traduisible porte un attribut `data-i18n="clé"` (utiliser `data-i18n-html` pour du HTML, `data-i18n-placeholder` pour un placeholder de champ).
- `lang-toggle.js` — composant du sélecteur FR/EN, attend un élément `#langToggle` dans la page. Il diffuse `tt:langchange`, que les pages qui se rendent dynamiquement (formation, exercice bonus) écoutent pour se re-rendre sans requête.
- Les longues pages légales utilisent un système de blocs (`class="lang-fr"` / `class="lang-en"`, basculés via `html[lang]` en CSS) plutôt que des clés unitaires.
- Le simulateur d'exercice (React) a son propre dictionnaire `T` embarqué dans `trading-trainer-prototype.jsx`, avec un état `lang` propagé à tous les composants. Il partage la même clé `localStorage` (`tt_lang`) que le reste du site pour rester synchronisé.
- Le contenu de la formation est traduit à la source (`formation/contenu*-en/`) et stocké par langue dans la base (migration `011_formation_langues.sql`). Un parcours non traduit retombe sur le français, jamais sur du vide.
- La base d'événements BCE (`data/macro-events-eurusd.js`) a des champs `title_en`/`detail_en` en plus des champs français.

## Modifier le simulateur

Il n'y a **rien à recompiler**. `trading-trainer.html` charge `trading-trainer-prototype.jsx` directement dans le navigateur : Babel Standalone transpile le JSX à la volée, et React, `lucide-react` et `lightweight-charts` arrivent d'esm.sh via un `importmap`.

Après une modification du `.jsx`, il suffit d'incrémenter le cache-buster de la balise `<script type="text/babel">` en bas de `trading-trainer.html`.

Malgré son nom, ce fichier n'est pas un prototype mort : c'est le simulateur en production. Il ne doit pas être ajouté aux exclusions de `_config.yml`, sous peine de casser « Commencer l'entraînement » sur la page d'accueil.

## Notes

Ce README est mis à jour au fur et à mesure de l'avancement du projet.

Les pages de la formation s'affichent sous le nom **TapeSense**, tandis que le reste du site (accueil, pied de page, dictionnaire i18n) porte **Trading Training**. Les deux noms coexistent dans le dépôt ; l'unification reste à trancher.
