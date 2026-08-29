-- ============ DIAGNOSTIC + BACKFILL : PROFILS MANQUANTS ============
-- A executer dans l'editeur SQL Supabase si le panel admin n'affiche pas
-- des comptes visibles dans Authentication > Users.
-- Cause : le panel admin lit uniquement public.profiles (via la vue
-- admin_customer_directory), jamais auth.users directement. Une ligne
-- manquante dans profiles = utilisateur invisible dans le panel.

-- 1) Verifier que le trigger d'auto-provision existe toujours -----------
select tgname, tgenabled
from pg_trigger
where tgname = 'on_auth_user_created';
-- Si aucune ligne ne revient : le trigger a disparu, il faut relancer les
-- blocs "create or replace function handle_new_user" + "create trigger"
-- de 001_rbac_profiles.sql.

-- 2) Lister les comptes auth.users sans ligne profiles correspondante ---
select u.id, u.email, u.phone, u.created_at
from auth.users u
left join public.profiles p on p.id = u.id
where p.id is null
order by u.created_at desc;

-- 3) Backfill idempotent des profils manquants ---------------------------
-- Ne touche pas aux lignes existantes (on conflict do nothing), et gere
-- le cas des comptes teléphone (email null en base auth -> on retombe sur
-- le téléphone pour respecter la contrainte "email not null" de profiles).
insert into public.profiles (id, email, created_at, role)
select
  u.id,
  coalesce(u.email, u.phone, u.id::text) as email,
  u.created_at,
  case when lower(u.email) = lower('Bidiyacine59@gmail.com')
       then 'SUPER_ADMIN'::public.app_role else 'USER'::public.app_role end
from auth.users u
left join public.profiles p on p.id = u.id
where p.id is null
on conflict (id) do nothing;

-- 4) Revérifier : la requête du (2) doit maintenant renvoyer 0 ligne -----
