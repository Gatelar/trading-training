-- ============ UNE SEULE LIGNE DE JOURNAL PAR OCTROI DE JOURS ============
-- Un octroi passe par la fonction edge admin-subscription-override, qui
-- journalise elle-meme 'subscription_grant_time' avec l'admin appelant.
-- Le trigger pose par la migration 005 ajoutait par-dessus un
-- 'subscription_grace_extend' :
--   - en double, sur un abonne qui avait deja une ligne (chemin UPDATE) ;
--   - avec actor_user_id NULL, parce que auth.uid() ne vaut rien sous
--     service_role.
-- Deux entrees pour un seul geste, dont une sans auteur : l'audit devient
-- moins lisible que s'il n'y en avait qu'une.
--
-- On ne supprime pas le trigger pour autant. L'en-tete de la migration 005
-- dit pourquoi : un trigger couvre TOUTES les mutations, y compris celles
-- lancees a la main depuis la console devtools par un MANAGER — la politique
-- subscriptions_update_admin_grace de la migration 002 l'autorise, et rien
-- ne l'utilise aujourd'hui cote client, ce qui rend ce chemin d'autant plus
-- discret le jour ou quelqu'un l'emprunte. Le supprimer ouvrirait ce trou.
--
-- On l'aveugle donc uniquement sur les appels service_role : ceux qui
-- journalisent deja. C'est exactement le test que fait deja
-- restrict_subscription_client_updates dans la migration 002.
--
-- Le trigger trg_log_grace_period_change n'est pas recree : "create or
-- replace function" suffit, il reste attache a la nouvelle definition.

create or replace function public.log_grace_period_change()
returns trigger
language plpgsql security definer set search_path = public
as $$
begin
  -- Le webhook Stripe et la fonction edge d'override ecrivent en service_role
  -- et tiennent leur propre journal, avec l'identite de l'admin appelant.
  if auth.role() = 'service_role' then
    return new;
  end if;
  if new.support_grace_until is distinct from old.support_grace_until then
    insert into public.admin_activity_log (actor_user_id, action, target_user_id, details)
    values (auth.uid(), 'subscription_grace_extend', new.user_id,
            jsonb_build_object('support_grace_until', new.support_grace_until));
  end if;
  return new;
end;
$$;
