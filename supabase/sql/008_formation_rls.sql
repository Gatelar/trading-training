-- ============ FORMATION : CONTENU RESERVE AUX ABONNES ============
-- Le sommaire (titres, durees, nombre de chapitres) reste public : il est deja
-- dans data/formation-index.js, servi en statique, et il sert d'argument
-- commercial. Ce qui est protege ici est le CORPS des chapitres.
--
-- Regle de verite unique : la fonction has_active_subscription() reproduit
-- exactement le test de compte/compte.js et de lib/formation-gate.js.
-- Si la regle d'abonnement change un jour, elle change ici et a ces deux
-- endroits, nulle part ailleurs.

-- ============ 1. LA REGLE D'ABONNEMENT, COTE BASE ============
create or replace function public.has_active_subscription(uid uuid default auth.uid())
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.subscriptions s
    where s.user_id = uid
      and (
        s.status = 'active'
        or s.status = 'trialing'
        or (s.support_grace_until is not null and s.support_grace_until > now())
      )
  );
$$;

comment on function public.has_active_subscription(uuid) is
  'Abonnement actif, en essai, ou dans son delai de grace. Doit rester identique au test de compte/compte.js.';

revoke all on function public.has_active_subscription(uuid) from public, anon;
grant execute on function public.has_active_subscription(uuid) to authenticated;


-- ============ 2. LE CONTENU DES CHAPITRES ============
create table public.formation_chapitres (
  id           bigint generated always as identity primary key,
  parcours     text    not null check (parcours in ('debutant', 'intermediaire', 'experimente')),
  module       integer not null check (module between 1 and 6),
  numero       text    not null,              -- '1.1', '2.3'... ou 'EX' pour l'exercice
  titre        text    not null,
  corps        text    not null,              -- le texte balise, tel que dans formation/contenu*/
  ordre        integer not null,              -- position dans le parcours, pour le tri
  mis_a_jour   timestamptz not null default now(),
  unique (parcours, module, numero)
);

comment on table public.formation_chapitres is
  'Corps des chapitres. Alimente par formation/push_chapitres.py depuis les memes sources que les PDF.';

create index formation_chapitres_parcours_ordre_idx
  on public.formation_chapitres (parcours, ordre);

alter table public.formation_chapitres enable row level security;

-- Lecture : uniquement un abonne actif. Aucune politique pour anon, donc
-- aucune lecture possible sans etre connecte ET abonne.
create policy "formation_chapitres_select_abonnes"
  on public.formation_chapitres for select
  to authenticated
  using (public.has_active_subscription());

-- Le staff lit tout, pour verifier le contenu depuis le panel admin.
create policy "formation_chapitres_select_staff"
  on public.formation_chapitres for select
  to authenticated
  using (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));

-- Ecriture : personne via l'API cliente. Le contenu est pousse par le script
-- d'alimentation, qui utilise la cle service_role et passe outre la RLS.
-- Aucune politique insert/update/delete n'est donc creee, volontairement.

grant select on public.formation_chapitres to authenticated;


-- ============ 3. RECHERCHE ============
-- La recherche porte sur le contenu, elle est donc soumise a la meme RLS que
-- la table : un non-abonne n'obtient aucune ligne, sans traitement particulier
-- cote client. C'est la propriete qu'on veut — le filtrage ne repose pas sur
-- la bonne volonte du navigateur.

alter table public.formation_chapitres
  add column recherche tsvector
  generated always as (
    to_tsvector('french', coalesce(titre, '') || ' ' || coalesce(corps, ''))
  ) stored;

create index formation_chapitres_recherche_idx
  on public.formation_chapitres using gin (recherche);

create or replace function public.chercher_formation(termes text)
returns table (
  parcours text, module integer, numero text, titre text, extrait text, rang real
)
language sql
stable
security invoker          -- volontaire : la RLS de l'appelant s'applique
set search_path = public
as $$
  select c.parcours, c.module, c.numero, c.titre,
         ts_headline('french', c.corps, plainto_tsquery('french', termes),
                     'MaxWords=28, MinWords=12, ShortWord=3, MaxFragments=1'),
         ts_rank(c.recherche, plainto_tsquery('french', termes))
  from public.formation_chapitres c
  where c.recherche @@ plainto_tsquery('french', termes)
  order by 6 desc
  limit 40;
$$;

comment on function public.chercher_formation(text) is
  'Recherche plein texte. En security invoker : un non-abonne ne recoit rien, la RLS filtre avant.';

revoke all on function public.chercher_formation(text) from public, anon;
grant execute on function public.chercher_formation(text) to authenticated;
