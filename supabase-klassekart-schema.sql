create table if not exists public.klassekart_restrictions (
  profile_id text primary key,
  encrypted_data text not null,
  salt text not null,
  iv text not null,
  updated_at timestamptz not null default now()
);

alter table public.klassekart_restrictions enable row level security;

create policy "Klassekart cloud profile can be read"
  on public.klassekart_restrictions for select
  using (profile_id = 'main-classroom');

create policy "Klassekart cloud profile can be written"
  on public.klassekart_restrictions for insert
  with check (profile_id = 'main-classroom');

create policy "Klassekart cloud profile can be updated"
  on public.klassekart_restrictions for update
  using (profile_id = 'main-classroom')
  with check (profile_id = 'main-classroom');
