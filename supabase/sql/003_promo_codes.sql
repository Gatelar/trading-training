-- ============ CODES PROMO ============
create type public.discount_type as enum ('percent', 'fixed');

create table public.promo_codes (
  id uuid primary key default gen_random_uuid(),
  code text not null,
  discount_type public.discount_type not null,
  discount_value numeric not null check (discount_value > 0),
  expires_at timestamptz,
  max_redemptions integer check (max_redemptions is null or max_redemptions > 0),
  redemption_count integer not null default 0 check (redemption_count >= 0),
  is_active boolean not null default true,
  created_by uuid references public.profiles(id),
  created_at timestamptz not null default now(),
  constraint redemption_count_within_max
    check (max_redemptions is null or redemption_count <= max_redemptions)
);

create unique index promo_codes_code_upper_idx on public.promo_codes (upper(code));
alter table public.promo_codes enable row level security;

create policy "promo_codes_admin_select" on public.promo_codes for select
  using (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));
create policy "promo_codes_admin_insert" on public.promo_codes for insert
  with check (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));
create policy "promo_codes_admin_update" on public.promo_codes for update
  using (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'))
  with check (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));
-- Pas de policy delete : desactiver via is_active plutot que supprimer.

create table public.promo_redemptions (
  id uuid primary key default gen_random_uuid(),
  promo_code_id uuid not null references public.promo_codes(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  redeemed_at timestamptz not null default now(),
  unique (promo_code_id, user_id)
);
alter table public.promo_redemptions enable row level security;
create policy "promo_redemptions_admin_select" on public.promo_redemptions for select
  using (public.current_user_role() in ('MANAGER', 'SUPER_ADMIN'));

-- ============ REDEMPTION ATOMIQUE (protection contre les races) ============
-- SELECT ... FOR UPDATE verrouille la ligne pour rendre l'operation
-- verification-puis-incrementation atomique meme en cas d'appels concurrents.
-- Pas encore branchee a une UI : fournie pour le jour ou un parcours de
-- redemption cote client existera.
create or replace function public.redeem_promo_code(p_code text)
returns public.promo_codes
language plpgsql security definer set search_path = public
as $$
declare v_promo public.promo_codes;
begin
  select * into v_promo from public.promo_codes
  where upper(code) = upper(p_code) and is_active
    and (expires_at is null or expires_at > now())
  for update;

  if not found then raise exception 'Code promo invalide ou expire.'; end if;
  if v_promo.max_redemptions is not null and v_promo.redemption_count >= v_promo.max_redemptions then
    raise exception 'Code promo epuise.';
  end if;

  insert into public.promo_redemptions (promo_code_id, user_id) values (v_promo.id, auth.uid());
  update public.promo_codes set redemption_count = redemption_count + 1
    where id = v_promo.id returning * into v_promo;
  return v_promo;
end;
$$;

grant execute on function public.redeem_promo_code(text) to authenticated;
