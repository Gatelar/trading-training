-- ============ JOURNAL D'ACTIVITE ADMIN ============
create table public.admin_activity_log (
  id uuid primary key default gen_random_uuid(),
  actor_user_id uuid not null references public.profiles(id),
  action text not null,
  target_user_id uuid references public.profiles(id),
  details jsonb,
  created_at timestamptz not null default now()
);

create index admin_activity_log_created_idx on public.admin_activity_log (created_at desc);
alter table public.admin_activity_log enable row level security;

-- SUPER_ADMIN voit tout ; MANAGER ne voit que ses propres actions.
create policy "admin_activity_log_select" on public.admin_activity_log for select
  using (
    public.current_user_role() = 'SUPER_ADMIN'
    or (public.current_user_role() = 'MANAGER' and actor_user_id = auth.uid())
  );
-- Pas de policy insert cote client : les lignes viennent uniquement des
-- triggers (voir 005) et du client service_role de l'edge function d'override.
