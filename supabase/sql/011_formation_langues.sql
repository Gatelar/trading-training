-- ============ LE CONTENU DES CHAPITRES EN PLUSIEURS LANGUES ============
-- Ajoute une langue aux chapitres. Le francais reste le defaut : les lignes
-- deja en place deviennent 'fr' sans intervention.
--
-- A executer AVANT les fichiers 009_*, qui inserent desormais la colonne.
--
-- La RLS ne bouge pas : elle filtre sur l'abonnement, jamais sur la langue.
-- Un non-abonne ne recoit aucune ligne, dans aucune langue.

begin;

alter table public.formation_chapitres
  add column langue text not null default 'fr'
  check (langue in ('fr', 'en'));

comment on column public.formation_chapitres.langue is
  'Langue du chapitre. Un meme (parcours, module, numero) existe une fois par langue.';

-- Le meme chapitre existe maintenant une fois par langue.
alter table public.formation_chapitres
  drop constraint if exists formation_chapitres_parcours_module_numero_key;

alter table public.formation_chapitres
  add constraint formation_chapitres_parcours_langue_module_numero_key
  unique (parcours, langue, module, numero);

drop index if exists formation_chapitres_parcours_ordre_idx;

create index formation_chapitres_parcours_langue_ordre_idx
  on public.formation_chapitres (parcours, langue, ordre);


-- ============ RECHERCHE : UN DICTIONNAIRE PAR LANGUE ============
-- Indexer de l'anglais avec le dictionnaire francais donnerait des racines
-- fausses. L'expression d'une colonne generee ne se modifie pas : on la
-- reconstruit, avec son index.

drop index if exists formation_chapitres_recherche_idx;

alter table public.formation_chapitres drop column recherche;

alter table public.formation_chapitres
  add column recherche tsvector
  generated always as (
    case when langue = 'en'
      then to_tsvector('english', coalesce(titre, '') || ' ' || coalesce(corps, ''))
      else to_tsvector('french',  coalesce(titre, '') || ' ' || coalesce(corps, ''))
    end
  ) stored;

create index formation_chapitres_recherche_idx
  on public.formation_chapitres using gin (recherche);

-- La fonction prend la langue en argument, avec le francais par defaut :
-- un appel a un seul argument se comporte comme avant la migration.
drop function if exists public.chercher_formation(text);

create or replace function public.chercher_formation(termes text, lang text default 'fr')
returns table (
  parcours text, module integer, numero text, titre text, extrait text, rang real
)
language sql
stable
security invoker          -- volontaire : la RLS de l'appelant s'applique
set search_path = public
as $$
  with conf as (
    select (case when lang = 'en' then 'english' else 'french' end)::regconfig as reg
  )
  select c.parcours, c.module, c.numero, c.titre,
         ts_headline((select reg from conf), c.corps,
                     plainto_tsquery((select reg from conf), termes),
                     'MaxWords=28, MinWords=12, ShortWord=3, MaxFragments=1'),
         ts_rank(c.recherche, plainto_tsquery((select reg from conf), termes))
  from public.formation_chapitres c
  where c.langue = lang
    and c.recherche @@ plainto_tsquery((select reg from conf), termes)
  order by 6 desc
  limit 40;
$$;

comment on function public.chercher_formation(text, text) is
  'Recherche plein texte dans une langue. En security invoker : un non-abonne ne recoit rien, la RLS filtre avant.';

revoke all on function public.chercher_formation(text, text) from public, anon;
grant execute on function public.chercher_formation(text, text) to authenticated;

commit;
