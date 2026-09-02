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
    //   'actif'          — abonnement actif, en essai, en délai de grâce,
    //                      ou compte MANAGER / SUPER_ADMIN
    var ETAT = 'anonyme';
    var abonnement = null;
    var motif = null;          // 'abonnement' ou 'role' — pour l'affichage

    function diffuser() {
        window.ttFormationEtat = ETAT;
        window.ttFormationAbonnement = abonnement;
        window.ttFormationMotif = motif;
        window.dispatchEvent(new CustomEvent('tt:formationaccess', {
            detail: { etat: ETAT, abonnement: abonnement, motif: motif }
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

        // Le rôle d'abord : la migration 008 accorde la lecture au staff par
        // une politique dédiée. Si le front ne le faisait pas aussi, un
        // MANAGER verrait le mur alors que la base lui ouvre la table.
        // Réutilise le rôle déjà résolu par admin-init.js quand il existe.
        var role = null;
        if (window.__ttCachedRole && window.__ttCachedRole.userId === session.user.id) {
            role = window.__ttCachedRole.role;
        } else {
            var pr = await supabaseClient
                .from('profiles')
                .select('role')
                .eq('id', session.user.id)
                .maybeSingle();
            role = pr.data ? pr.data.role : null;
        }
        window.ttFormationRole = role;

        if (role === 'MANAGER' || role === 'SUPER_ADMIN') {
            ETAT = 'actif';
            motif = 'role';
            diffuser();
            return;
        }

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
        motif = actif ? 'abonnement' : null;
        diffuser();
    }).catch(function () {
        // Une erreur réseau ne doit pas donner l'accès par accident.
        ETAT = 'anonyme';
        diffuser();
    });
})();
