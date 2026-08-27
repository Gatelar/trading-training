-- ============ TRIGGERS DE JOURNALISATION ============
-- Pourquoi des triggers plutot que d'inserer la ligne de log depuis le JS
-- admin : un trigger se declenche systematiquement des que la mutation a
-- vraiment lieu, quelle que soit la maniere dont elle a ete invoquee (y
-- compris via la console devtools). Compter sur le code client pour ne pas
-- oublier de logger laisserait des trous dans l'audit.

create or replace function public.log_role_change()
returns trigger
language plpgsql security definer set search_path = public
as $$
begin
  if new.role is distinct from old.role then
    insert into public.admin_activity_log (actor_user_id, action, target_user_id, details)
    values (coalesce(auth.uid(), new.id), 'role_change', new.id,
            jsonb_build_object('old_role', old.role, 'new_role', new.role));
  end if;
  return new;
end;
$$;
create trigger trg_log_role_change after update on public.profiles
  for each row execute function public.log_role_change();

create or replace function public.log_promo_change()
returns trigger
language plpgsql security definer set search_path = public
as $$
begin
  insert into public.admin_activity_log (actor_user_id, action, target_user_id, details)
  values (auth.uid(), case when tg_op = 'INSERT' then 'promo_code_create' else 'promo_code_update' end,
          null, jsonb_build_object('promo_code_id', new.id, 'code', new.code, 'is_active', new.is_active));
  return new;
end;
$$;
create trigger trg_log_promo_change after insert or update on public.promo_codes
  for each row execute function public.log_promo_change();

create or replace function public.log_grace_period_change()
returns trigger
language plpgsql security definer set search_path = public
as $$
begin
  if new.support_grace_until is distinct from old.support_grace_until then
    insert into public.admin_activity_log (actor_user_id, action, target_user_id, details)
    values (auth.uid(), 'subscription_grace_extend', new.user_id,
            jsonb_build_object('support_grace_until', new.support_grace_until));
  end if;
  return new;
end;
$$;
create trigger trg_log_grace_period_change after update on public.subscriptions
  for each row execute function public.log_grace_period_change();
