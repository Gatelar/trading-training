-- ============ RBAC : ROLES & PROFILS ============
-- A executer dans l'editeur SQL Supabase, dans l'ordre (001 -> 006).
-- Avant d'executer quoi que ce soit dans ce dossier, verifier qu'il n'existe
-- pas deja de policy permissive sur "subscriptions" / "exercise_logs" qui
-- entrerait en conflit avec les nouvelles (les policies RLS sont combinees en OR) :
--   select * from pg_policies where schemaname = 'public';

create type public.app_role as enum ('SUPER_ADMIN', 'MANAGER', 'USER');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null,
  role public.app_role not null default 'USER',
  created_at timestamptz not null default now()
);

create index profiles_email_idx on public.profiles (lower(email));
create index profiles_role_idx on public.profiles (role);

alter table public.profiles enable row level security;

-- ============ FONCTION SECURITY DEFINER (evite la recursion RLS) ============
-- Une policy sur "profiles" qui ferait un simple "select role from profiles
-- where id = auth.uid()" re-declencherait sa propre RLS a l'infini. En passant
-- par une fonction SECURITY DEFINER (qui s'execute avec les droits du
-- proprietaire, donc bypass RLS), on casse cette recursion proprement.
create or replace function public.current_user_role()
returns public.app_role
language sql security definer set search_path = public stable
as $$
  select role from public.profiles where id = auth.uid();
$$;

grant execute on function public.current_user_role() to authenticated;

-- ============ RLS : PROFILES ============
create policy "profiles_select_own_or_admin"
  on public.profiles for select
  using (id = auth.uid() or public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));

create policy "profiles_update_own_or_admin"
  on public.profiles for update
  using (id = auth.uid() or public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'))
  with check (id = auth.uid() or public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));
-- Pas de policy insert/delete : les lignes sont creees exclusivement par le
-- trigger on_auth_user_created ci-dessous (deny par defaut sinon).

-- ============ TRIGGER : BLOQUE LES CHANGEMENTS DE ROLE NON AUTORISES ============
-- RLS est au niveau de la ligne, pas de la colonne : sans ce trigger, la policy
-- update ci-dessus permettrait a un MANAGER de modifier son propre role.
-- auth.uid() IS NULL (editeur SQL / dashboard, pas de JWT) est volontairement
-- laisse passer, pour que le backfill plus bas et la promotion manuelle d'un
-- compte de test MANAGER restent possibles.
create or replace function public.prevent_unauthorized_role_change()
returns trigger
language plpgsql security definer set search_path = public
as $$
begin
  if new.role is distinct from old.role
     and auth.uid() is not null
     and public.current_user_role() is distinct from 'SUPER_ADMIN'::public.app_role then
    raise exception 'Seul un SUPER_ADMIN peut modifier le role.';
  end if;
  return new;
end;
$$;

create trigger trg_prevent_unauthorized_role_change
  before update on public.profiles
  for each row execute function public.prevent_unauthorized_role_change();

-- ============ AUTO-PROVISION A L'INSCRIPTION ============
create or replace function public.handle_new_user()
returns trigger
language plpgsql security definer set search_path = public
as $$
begin
  insert into public.profiles (id, email, created_at, role)
  values (
    new.id, new.email, new.created_at,
    case when lower(new.email) = lower('Bidiyacine59@gmail.com')
         then 'SUPER_ADMIN'::public.app_role else 'USER'::public.app_role end
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ============ BACKFILL DES COMPTES EXISTANTS (idempotent) ============
insert into public.profiles (id, email, created_at, role)
select u.id, u.email, u.created_at,
  case when lower(u.email) = lower('Bidiyacine59@gmail.com')
       then 'SUPER_ADMIN'::public.app_role else 'USER'::public.app_role end
from auth.users u
on conflict (id) do update set
  role = case when lower(excluded.email) = lower('Bidiyacine59@gmail.com')
              then 'SUPER_ADMIN'::public.app_role else public.profiles.role end;
