// ============ admin-subscription-override ============
// Permet a un MANAGER/SUPER_ADMIN de mettre en pause, annuler ou reprendre
// l'abonnement Stripe d'un client depuis le panel admin. Appelle l'API
// Stripe reelle (Stripe reste la source de verite) plutot que d'ecrire
// directement le statut dans Supabase — le webhook stripe-webhook existant
// se charge de re-synchroniser "subscriptions" suite a l'evenement Stripe
// declenche par cet appel.
//
// Deploiement : supabase functions deploy admin-subscription-override
// Secrets requis (deja definis pour create-checkout-session) :
//   STRIPE_SECRET_KEY, SUPABASE_URL, SUPABASE_ANON_KEY
// (SUPABASE_SERVICE_ROLE_KEY est injecte automatiquement par Supabase)

import Stripe from "https://esm.sh/stripe@17?target=deno";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY")!, {
  apiVersion: "2024-06-20",
});

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

const ALLOWED_ACTIONS = new Set(["pause", "cancel", "resume", "grant_time"]);

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: CORS_HEADERS });
  }

  try {
    const { action, targetUserId, days } = await req.json();

    if (!ALLOWED_ACTIONS.has(action) || !targetUserId) {
      return new Response(JSON.stringify({ error: "Requête invalide." }), {
        status: 400,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    if (action === "grant_time" && (!Number.isFinite(days) || days <= 0)) {
      return new Response(JSON.stringify({ error: "Nombre de jours invalide." }), {
        status: 400,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    // Authentification : on verifie le token envoye par le client (session Supabase).
    const authHeader = req.headers.get("Authorization");
    if (!authHeader) {
      return new Response(JSON.stringify({ error: "Non authentifié." }), {
        status: 401,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    const supabaseClient = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_ANON_KEY")!,
      { global: { headers: { Authorization: authHeader } } }
    );

    const {
      data: { user },
      error: userError,
    } = await supabaseClient.auth.getUser();

    if (userError || !user) {
      return new Response(JSON.stringify({ error: "Non authentifié." }), {
        status: 401,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    // Service role client : seul moyen fiable de verifier le role de
    // l'appelant et d'agir sur l'abonnement d'un AUTRE utilisateur (RLS
    // n'autoriserait pas ça avec la clé anon).
    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
    );

    const { data: callerProfile } = await supabaseAdmin
      .from("profiles")
      .select("role")
      .eq("id", user.id)
      .maybeSingle();

    if (!callerProfile || !["MANAGER", "SUPER_ADMIN"].includes(callerProfile.role)) {
      return new Response(JSON.stringify({ error: "Accès refusé." }), {
        status: 403,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    if (action === "grant_time") {
      // Acces offert (pas de Stripe implique) : on prolonge support_grace_until
      // a partir de la date de grace existante si elle est encore future,
      // sinon a partir de maintenant, pour que des appels successifs cumulent.
      // upsert (onConflict: user_id) fonctionne meme si l'utilisateur n'a
      // encore aucune ligne "subscriptions".
      const { data: existingSub } = await supabaseAdmin
        .from("subscriptions")
        .select("support_grace_until")
        .eq("user_id", targetUserId)
        .maybeSingle();

      const existingGrace = existingSub?.support_grace_until ? new Date(existingSub.support_grace_until) : null;
      const base = existingGrace && existingGrace > new Date() ? existingGrace : new Date();
      const newGrace = new Date(base.getTime() + days * 24 * 60 * 60 * 1000);

      await supabaseAdmin.from("subscriptions").upsert(
        { user_id: targetUserId, support_grace_until: newGrace.toISOString() },
        { onConflict: "user_id" }
      );

      await supabaseAdmin.from("admin_activity_log").insert({
        actor_user_id: user.id,
        action: "subscription_grant_time",
        target_user_id: targetUserId,
        details: { days, supportGraceUntil: newGrace.toISOString() },
      });

      return new Response(
        JSON.stringify({ supportGraceUntil: newGrace.toISOString() }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const { data: targetSub } = await supabaseAdmin
      .from("subscriptions")
      .select("stripe_subscription_id")
      .eq("user_id", targetUserId)
      .maybeSingle();

    if (!targetSub?.stripe_subscription_id) {
      return new Response(JSON.stringify({ error: "Aucun abonnement Stripe pour cet utilisateur." }), {
        status: 400,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    const subscriptionId = targetSub.stripe_subscription_id;
    let updatedSubscription: Stripe.Subscription;

    if (action === "pause") {
      updatedSubscription = await stripe.subscriptions.update(subscriptionId, {
        pause_collection: { behavior: "void" },
      });
    } else if (action === "cancel") {
      // Annulation "gracieuse" (a la fin de la periode en cours), reversible
      // via "resume" — pas une suppression immediate et irreversible.
      updatedSubscription = await stripe.subscriptions.update(subscriptionId, {
        cancel_at_period_end: true,
      });
    } else {
      // resume : leve la pause et/ou l'annulation programmee, selon ce qui est actif.
      updatedSubscription = await stripe.subscriptions.update(subscriptionId, {
        pause_collection: null,
        cancel_at_period_end: false,
      });
    }

    // Journalisation directe : cette mutation a lieu chez Stripe, hors
    // Postgres, donc aucun trigger DB ne peut la capter.
    await supabaseAdmin.from("admin_activity_log").insert({
      actor_user_id: user.id,
      action: `subscription_${action}`,
      target_user_id: targetUserId,
      details: { stripeSubscriptionId: subscriptionId },
    });

    return new Response(
      JSON.stringify({
        status: updatedSubscription.status,
        pauseCollection: updatedSubscription.pause_collection,
        cancelAtPeriodEnd: updatedSubscription.cancel_at_period_end,
      }),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error(err);
    return new Response(JSON.stringify({ error: err.message || "Erreur serveur." }), {
      status: 500,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }
});
