-- ============ LECTURE ADMIN SUR exercise_logs ============
create policy "exercise_logs_select_admin_all" on public.exercise_logs for select
  using (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));

-- ============ VUE : ANNUAIRE CLIENTS ============
-- security_invoker = true : la vue applique le RLS de l'utilisateur qui
-- l'interroge. Un admin voit donc tout le monde (ses policies SELECT
-- admin s'appliquent), un simple USER qui interrogerait la vue directement
-- ne verrait que sa propre ligne. Pas besoin de grants/policies separes
-- sur la vue elle-meme.
create view public.admin_customer_directory with (security_invoker = true) as
select p.id, p.email, p.created_at as registered_at, p.role,
       s.status as subscription_status, s.plan, s.current_period_end,
       s.support_grace_until, s.amount_cents, s.is_paused, s.stripe_price_id
from public.profiles p
left join public.subscriptions s on s.user_id = p.id;

grant select on public.admin_customer_directory to authenticated;

-- ============ VUE : ACTIVITE (VERSION LIGHT DE LA PROGRESSION) ============
create view public.admin_exercise_activity with (security_invoker = true) as
select user_id, count(*) as exercise_count, max(created_at) as last_activity_at
from public.exercise_logs group by user_id;

grant select on public.admin_exercise_activity to authenticated;
