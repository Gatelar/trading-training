// ============ ÉVÉNEMENTS MACRO RÉELS — EUR/USD ============
// Décisions de politique monétaire de la BCE, avec dates et résultats réels.
// Sources : communiqués officiels BCE (ecb.europa.eu/press), presse financière (CNBC, Seeking Alpha).
// Utilisé pour afficher un contexte factuel quand la période d'exercice tirée au sort contient un de ces événements.

const MACRO_EVENTS_EURUSD = [
    {
        date: '2023-05-04',
        title: 'BCE : hausse de taux de 25 points de base',
        detail: "La BCE relève son taux de dépôt à 3,25%, poursuivant sa lutte contre une inflation à 7% sur un an en zone euro."
    },
    {
        date: '2023-09-14',
        title: 'BCE : 10e hausse consécutive, taux à 4,00%',
        detail: "Le taux de dépôt atteint 4,00%, son plus haut niveau depuis la création de l'euro. La BCE signale que ce pourrait être la dernière hausse du cycle."
    },
    {
        date: '2023-10-26',
        title: 'BCE : taux inchangés',
        detail: "Après 10 hausses consécutives, la BCE marque une pause et laisse ses taux directeurs inchangés."
    },
    {
        date: '2023-12-14',
        title: 'BCE : taux inchangés, inflation attendue en baisse',
        detail: "La BCE maintient ses taux et projette un retour progressif de l'inflation vers 2% d'ici 2025."
    },
    {
        date: '2024-06-06',
        title: 'BCE : première baisse de taux depuis 2019',
        detail: "La BCE amorce son cycle de baisses avec une réduction de 25 points de base, un tournant après deux ans de resserrement monétaire."
    },
    {
        date: '2025-01-30',
        title: 'BCE : baisse de taux de 25 points de base',
        detail: "Poursuite du cycle d'assouplissement monétaire entamé mi-2024."
    },
    {
        date: '2025-03-06',
        title: 'BCE : baisse de taux de 25 points de base',
        detail: "Nouvelle baisse dans la continuité du cycle d'assouplissement."
    },
    {
        date: '2025-04-17',
        title: 'BCE : baisse de taux de 25 points de base',
        detail: "Quatrième baisse consécutive depuis janvier 2025."
    },
    {
        date: '2025-06-05',
        title: 'BCE : baisse de taux de 25 points de base, taux de dépôt à 2,00%',
        detail: "Le taux de dépôt atteint 2,00%, son plus bas niveau depuis juin 2025, la BCE estimant sa politique proche de la neutralité."
    },
    {
        date: '2025-07-24',
        title: 'BCE : taux inchangés',
        detail: "Pause dans le cycle de baisses, la BCE juge sa politique monétaire proche du niveau neutre."
    },
    {
        date: '2025-09-11',
        title: 'BCE : taux inchangés',
        detail: "La BCE maintient ses taux directeurs pour le deuxième mois consécutif."
    },
    {
        date: '2025-10-30',
        title: 'BCE : taux inchangés',
        detail: "Statu quo monétaire confirmé, la BCE reste en mode attentiste."
    },
    {
        date: '2025-12-18',
        title: 'BCE : taux inchangés',
        detail: "Fin d'année sans changement de taux, la BCE conserve une politique jugée neutre."
    },
    {
        date: '2026-02-05',
        title: 'BCE : taux inchangés',
        detail: "La BCE prolonge sa pause monétaire en ce début d'année."
    },
    {
        date: '2026-06-11',
        title: 'BCE : hausse de taux de 25 points de base, taux de dépôt à 2,25%',
        detail: "Première hausse depuis 2023, la BCE réagit à des pressions inflationnistes liées à la hausse des prix de l'énergie."
    },
    {
        date: '2026-07-23',
        title: 'BCE : taux inchangés, taux de dépôt à 2,25%',
        detail: "La BCE marque une pause après la hausse de juin, dans un contexte de tensions au Moyen-Orient affectant les prix de l'énergie."
    }
];
