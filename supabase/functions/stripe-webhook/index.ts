// ============ stripe-webhook ============
// Reçoit les événements Stripe (paiement réussi, abonnement mis à jour/annulé)
// et met à jour la table "subscriptions" dans Supabase en conséquence.
//
// Déploiement : supabase functions deploy stripe-webhook --no-verify-jwt
// (--no-verify-jwt est nécessaire car Stripe appelle cette fonction sans token Supabase)
//
// Secrets requis : STRIPE_SECRET_KEY, STRIPE_WEBHOOK_SECRET, SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY

import Stripe from "https://esm.sh/stripe@17?target=deno";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY")!, {
  apiVersion: "2024-06-20",
});

const supabaseAdmin = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
);

const webhookSecret = Deno.env.get("STRIPE_WEBHOOK_SECRET")!;

async function upsertSubscription(userId: string, data: Record<string, unknown>) {
  await supabaseAdmin.from("subscriptions").upsert(
    { user_id: userId, updated_at: new Date().toISOString(), ...data },
    { onConflict: "user_id" }
  );
}

Deno.serve(async (req) => {
  const signature = req.headers.get("stripe-signature");
  const body = await req.text();

  let event: Stripe.Event;
  try {
    event = await stripe.webhooks.constructEventAsync(body, signature!, webhookSecret);
  } catch (err) {
    console.error("Signature webhook invalide :", err.message);
    return new Response(`Webhook Error: ${err.message}`, { status: 400 });
  }

  try {
    switch (event.type) {
      case "checkout.session.completed": {
        const session = event.data.object as Stripe.Checkout.Session;
        const userId = session.metadata?.supabase_user_id;
        if (userId) {
          const subscription = await stripe.subscriptions.retrieve(session.subscription as string);
          await upsertSubscription(userId, {
            stripe_customer_id: session.customer as string,
            stripe_subscription_id: subscription.id,
            status: subscription.status,
            plan: subscription.items.data[0]?.price?.nickname || null,
            current_period_end: new Date(subscription.current_period_end * 1000).toISOString(),
          });
        }
        break;
      }

      case "customer.subscription.updated":
      case "customer.subscription.deleted": {
        const subscription = event.data.object as Stripe.Subscription;
        const userId = subscription.metadata?.supabase_user_id;
        if (userId) {
          await upsertSubscription(userId, {
            stripe_subscription_id: subscription.id,
            status: subscription.status,
            plan: subscription.items.data[0]?.price?.nickname || null,
            current_period_end: new Date(subscription.current_period_end * 1000).toISOString(),
          });
        }
        break;
      }

      default:
        // Événement non géré, on l'ignore silencieusement.
        break;
    }

    return new Response(JSON.stringify({ received: true }), {
      headers: { "Content-Type": "application/json" },
    });
  } catch (err) {
    console.error("Erreur de traitement du webhook :", err);
    return new Response(JSON.stringify({ error: err.message }), { status: 500 });
  }
});
