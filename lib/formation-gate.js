// ============ CONTRÔLE D'ACCÈS À LA FORMATION ============
// Reprend exactement le test d'abonnement de compte/compte.js : un seul endroit
// où la règle est écrite, et une seule à faire évoluer le jour où elle change.
//
// IMPORTANT — ce fichier ne protège rien à lui seul. Il pilote l'affichage.
// La protection réelle est côté Supabase (RLS) : le texte des chapitres ne doit
// jamais être présent dans une page servie à un non-abonné, sinon il suffit
// d'ouvrir l'inspecteur pour le lire. Voir supabase/sql/ à créer.

(function () {
    // États possibles, dans l'ordre où on les rencontre :
    //   'anonyme'        — personne n'est connecté
    //   'sans-abonnement'— connecté, mais pas d'abonnement actif
    //   'actif'          — abonnement actif, en essai, ou en délai de grâce
    var ETAT = 'anonyme';
    var abonnement = null;

    function diffuser() {
        window.ttFormationEtat = ETAT;
        window.ttFormationAbonnement = abonnement;
        window.dispatchEvent(new CustomEvent('tt:formationaccess', {
            detail: { etat: ETAT, abonnement: abonnement }
        }));
    }

    if (typeof supabaseClient === 'undefined') {
        // La page doit rester lisible même si Supabase ne répond pas.
        diffuser();
        return;
    }

    supabaseClient.auth.getSession().then(async function (res) {
        var session = res.data && res.data.session;
        if (!session) { diffuser(); return; }

        var r = await supabaseClient
            .from('subscriptions')
            .select('status, plan, support_grace_until')
            .eq('user_id', session.user.id)
            .maybeSingle();

        var sub = r.data;
        abonnement = sub || null;

        // Règle identique à compte/compte.js, à la virgule près.
        var actif = sub && (
            sub.status === 'active' ||
            sub.status === 'trialing' ||
            (sub.support_grace_until && new Date(sub.support_grace_until) > new Date())
        );

        ETAT = actif ? 'actif' : 'sans-abonnement';
        diffuser();
    }).catch(function () {
        // Une erreur réseau ne doit pas donner l'accès par accident.
        ETAT = 'anonyme';
        diffuser();
    });
})();
