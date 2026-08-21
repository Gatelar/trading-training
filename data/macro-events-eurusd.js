// ============ ÉVÉNEMENTS MACRO RÉELS — EUR/USD ============
// Décisions de politique monétaire de la BCE, avec dates, résultats et niveau de taux de dépôt réels.
// Sources : communiqués officiels BCE (ecb.europa.eu/press), presse financière (CNBC, Seeking Alpha, Statista).
// rateAfter = taux de dépôt BCE en vigueur après la décision (en %).
// title/detail en FR et EN pour le site bilingue.

const MACRO_EVENTS_EURUSD = [
    {
        date: '2023-05-04',
        title: 'BCE : hausse de taux de 25 points de base',
        title_en: 'ECB: 25bp rate hike',
        detail: "La BCE relève son taux de dépôt à 3,25%, poursuivant sa lutte contre une inflation à 7% sur un an en zone euro.",
        detail_en: "The ECB raises its deposit rate to 3.25%, continuing its fight against 7% year-on-year inflation in the eurozone.",
        rateAfter: 3.25
    },
    {
        date: '2023-09-14',
        title: 'BCE : 10e hausse consécutive, taux à 4,00%',
        title_en: 'ECB: 10th consecutive hike, rate at 4.00%',
        detail: "Le taux de dépôt atteint 4,00%, son plus haut niveau depuis la création de l'euro. La BCE signale que ce pourrait être la dernière hausse du cycle.",
        detail_en: "The deposit rate reaches 4.00%, its highest level since the euro was created. The ECB signals this could be the last hike of the cycle.",
        rateAfter: 4.00
    },
    {
        date: '2023-10-26',
        title: 'BCE : taux inchangés',
        title_en: 'ECB: rates held',
        detail: "Après 10 hausses consécutives, la BCE marque une pause et laisse ses taux directeurs inchangés.",
        detail_en: "After 10 consecutive hikes, the ECB pauses and leaves its key rates unchanged.",
        rateAfter: 4.00
    },
    {
        date: '2023-12-14',
        title: 'BCE : taux inchangés, inflation attendue en baisse',
        title_en: 'ECB: rates held, inflation expected to fall',
        detail: "La BCE maintient ses taux et projette un retour progressif de l'inflation vers 2% d'ici 2025.",
        detail_en: "The ECB holds rates and projects a gradual return of inflation to 2% by 2025.",
        rateAfter: 4.00
    },
    {
        date: '2024-06-06',
        title: 'BCE : première baisse de taux depuis 2019',
        title_en: 'ECB: first rate cut since 2019',
        detail: "La BCE amorce son cycle de baisses avec une réduction de 25 points de base, un tournant après deux ans de resserrement monétaire.",
        detail_en: "The ECB begins its cutting cycle with a 25bp reduction, a turning point after two years of monetary tightening.",
        rateAfter: 3.75
    },
    {
        date: '2024-09-12',
        title: 'BCE : baisse de taux de 25 points de base',
        title_en: 'ECB: 25bp rate cut',
        detail: "Deuxième baisse du cycle, la BCE poursuit son assouplissement monétaire.",
        detail_en: "Second cut of the cycle, the ECB continues its monetary easing.",
        rateAfter: 3.50
    },
    {
        date: '2024-10-17',
        title: 'BCE : baisse de taux de 25 points de base',
        title_en: 'ECB: 25bp rate cut',
        detail: "Baisse surprise plus rapide qu'anticipé, l'inflation ralentissant plus vite que prévu.",
        detail_en: "A surprise cut faster than anticipated, as inflation slows more quickly than expected.",
        rateAfter: 3.25
    },
    {
        date: '2024-12-12',
        title: 'BCE : baisse de taux de 25 points de base',
        title_en: 'ECB: 25bp rate cut',
        detail: "Quatrième baisse de l'année, la BCE clôture 2024 avec un taux de dépôt à 3,00%.",
        detail_en: "Fourth cut of the year, the ECB closes 2024 with a deposit rate of 3.00%.",
        rateAfter: 3.00
    },
    {
        date: '2025-01-30',
        title: 'BCE : baisse de taux de 25 points de base',
        title_en: 'ECB: 25bp rate cut',
        detail: "Poursuite du cycle d'assouplissement monétaire entamé mi-2024.",
        detail_en: "Continuation of the monetary easing cycle started in mid-2024.",
        rateAfter: 2.75
    },
    {
        date: '2025-03-06',
        title: 'BCE : baisse de taux de 25 points de base',
        title_en: 'ECB: 25bp rate cut',
        detail: "Nouvelle baisse dans la continuité du cycle d'assouplissement.",
        detail_en: "Another cut in line with the ongoing easing cycle.",
        rateAfter: 2.50
    },
    {
        date: '2025-04-17',
        title: 'BCE : baisse de taux de 25 points de base',
        title_en: 'ECB: 25bp rate cut',
        detail: "Quatrième baisse consécutive depuis janvier 2025.",
        detail_en: "Fourth consecutive cut since January 2025.",
        rateAfter: 2.25
    },
    {
        date: '2025-06-05',
        title: 'BCE : baisse de taux de 25 points de base, taux de dépôt à 2,00%',
        title_en: 'ECB: 25bp rate cut, deposit rate at 2.00%',
        detail: "Le taux de dépôt atteint 2,00%, la BCE estimant sa politique proche de la neutralité.",
        detail_en: "The deposit rate reaches 2.00%, with the ECB considering its policy close to neutral.",
        rateAfter: 2.00
    },
    {
        date: '2025-07-24',
        title: 'BCE : taux inchangés',
        title_en: 'ECB: rates held',
        detail: "Pause dans le cycle de baisses, la BCE juge sa politique monétaire proche du niveau neutre.",
        detail_en: "A pause in the cutting cycle, as the ECB judges its monetary policy close to neutral.",
        rateAfter: 2.00
    },
    {
        date: '2025-09-11',
        title: 'BCE : taux inchangés',
        title_en: 'ECB: rates held',
        detail: "La BCE maintient ses taux directeurs pour le deuxième mois consécutif.",
        detail_en: "The ECB holds its key rates for the second consecutive meeting.",
        rateAfter: 2.00
    },
    {
        date: '2025-10-30',
        title: 'BCE : taux inchangés',
        title_en: 'ECB: rates held',
        detail: "Statu quo monétaire confirmé, la BCE reste en mode attentiste.",
        detail_en: "Monetary status quo confirmed, the ECB remains in wait-and-see mode.",
        rateAfter: 2.00
    },
    {
        date: '2025-12-18',
        title: 'BCE : taux inchangés',
        title_en: 'ECB: rates held',
        detail: "Fin d'année sans changement de taux, la BCE conserve une politique jugée neutre.",
        detail_en: "Year-end with no rate change, the ECB keeps a policy considered neutral.",
        rateAfter: 2.00
    },
    {
        date: '2026-02-05',
        title: 'BCE : taux inchangés',
        title_en: 'ECB: rates held',
        detail: "La BCE prolonge sa pause monétaire en ce début d'année.",
        detail_en: "The ECB extends its monetary pause at the start of the year.",
        rateAfter: 2.00
    },
    {
        date: '2026-06-11',
        title: 'BCE : hausse de taux de 25 points de base, taux de dépôt à 2,25%',
        title_en: 'ECB: 25bp rate hike, deposit rate at 2.25%',
        detail: "Première hausse depuis 2023, la BCE réagit à des pressions inflationnistes liées à la hausse des prix de l'énergie.",
        detail_en: "First hike since 2023, the ECB responds to inflationary pressures linked to rising energy prices.",
        rateAfter: 2.25
    },
    {
        date: '2026-07-23',
        title: 'BCE : taux inchangés, taux de dépôt à 2,25%',
        title_en: 'ECB: rates held, deposit rate at 2.25%',
        detail: "La BCE marque une pause après la hausse de juin, dans un contexte de tensions au Moyen-Orient affectant les prix de l'énergie.",
        detail_en: "The ECB pauses after June's hike, amid Middle East tensions affecting energy prices.",
        rateAfter: 2.25
    }
];
