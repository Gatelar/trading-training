-- ============ REPARATION DE L'ENCODAGE DES CHAPITRES ============
-- Les 009_*.sql etaient ecrits en UTF-8 sans BOM. Ouverts par un editeur
-- Windows qui les devinait en CP1252, chaque octet devenait une lettre :
-- un 'e' accent aigu se changeait en deux caracteres, un tiret cadratin en
-- trois. C'est ce texte-la qui est parti dans la base par copier-coller, et
-- c'est lui que le site affiche.
--
-- On refait le chemin en sens inverse : re-encoder le texte en CP1252 rend
-- les octets d'origine, les relire en UTF-8 rend les lettres. Verifie en
-- local sur les 44 fichiers sources concernes : l'aller-retour restitue le
-- texte au caractere pres.
--
-- Ce fichier est en pur ASCII, a dessein : il doit survivre au copier-coller
-- qui a casse le contenu.
--
-- Se rejoue sans risque, et ne touche pas un chapitre deja sain : ses
-- accents, relus comme de l'UTF-8, ne forment rien de valide, donc la
-- conversion echoue et on garde le texte tel quel.
--
-- La cause est traitee a la source : push_chapitres.py ecrit desormais un
-- BOM en tete des .sql, que les editeurs Windows lisent comme la marque d'un
-- fichier UTF-8. Regenerer avec : python formation/push_chapitres.py

begin;

-- Rend le texte d'origine, ou NULL si le texte n'est pas du mojibake CP1252
-- (deja sain, ou abime au point d'avoir perdu un caractere en route).
-- Vit dans pg_temp : elle disparait a la fin de la session, sans rien laisser.
create or replace function pg_temp.desabime(t text) returns text
language plpgsql immutable as $$
begin
  return convert_from(convert_to(t, 'WIN1252'), 'UTF8');
exception when others then
  return null;
end $$;

update public.formation_chapitres
   set titre = coalesce(pg_temp.desabime(titre), titre),
       corps = coalesce(pg_temp.desabime(corps), corps)
 where pg_temp.desabime(corps) is not null
   and pg_temp.desabime(corps) <> corps;

commit;

-- Controle. 'encore_abimes' doit valoir 0 partout : il compte les chapitres
-- qui portent encore la tete des lettres accentuees cassees. S'il en reste,
-- ces chapitres-la ont perdu un caractere a l'insertion et se reparent en
-- rejouant leur 009_*.sql, BOM compris.
select parcours,
       langue,
       count(*)                                                as chapitres,
       count(*) filter (where position(chr(195) in corps) > 0) as encore_abimes
  from public.formation_chapitres
 group by parcours, langue
 order by parcours, langue;
