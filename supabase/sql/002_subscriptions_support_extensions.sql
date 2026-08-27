-- ============ EXTENSIONS SUPPORT SUR "subscriptions" ============
alter table public.subscriptions
  add column support_grace_until timestamptz,
  add column amount_cents integer,
  add column stripe_price_id text,
  add column is_paused boolean not null default false;
-- is_paused : Stripe's pause_collection laisse subscription.status = 'active',
-- le webhook doit donc positionner ce flag explicitement pour que le badge
-- "En pause" du panel admin soit correct (le statut seul ne le refletera pas).

create policy "subscriptions_select_admin_all"
  on public.subscriptions for select
  using (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));

create policy "subscriptions_update_admin_grace"
  on public.subscriptions for update
  using (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'))
  with check (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));

-- ============ TRIGGER : LE CLIENT NE PEUT TOUCHER QUE support_grace_until ============
-- Les appels service_role (webhook Stripe, edge function d'override) passent
-- au travers sans restriction.
create or replace function public.restrict_subscription_client_updates()
returns trigger
language plpgsql security definer set search_path = public
as $$
begin
  if auth.role() = 'service_role' then
    return new;
  end if;
  if new.status is distinct from old.status
     or new.plan is distinct from old.plan
     or new.stripe_customer_id is distinct from old.stripe_customer_id
     or new.stripe_subscription_id is distinct from old.stripe_subscription_id
     or new.current_period_end is distinct from old.current_period_end
     or new.amount_cents is distinct from old.amount_cents
     or new.stripe_price_id is distinct from old.stripe_price_id
     or new.is_paused is distinct from old.is_paused
     or new.user_id is distinct from old.user_id then
    raise exception 'Seule la colonne support_grace_until peut etre modifiee depuis le client.';
  end if;
  return new;
end;
$$;

create trigger trg_restrict_subscription_client_updates
  before update on public.subscriptions
  for each row execute function public.restrict_subscription_client_updates();
