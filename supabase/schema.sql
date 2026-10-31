-- Kalkulator prowizji: baza w Supabase
-- Wklej całość w Supabase: SQL Editor -> New query -> Run.
-- Każdy handlowiec widzi i zmienia tylko swoje dane (Row Level Security).

-- Ustawienia handlowca: imię i nazwisko, stawka, podstawa, domyślny VAT
create table if not exists public.settings (
  user_id    uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  person     text    not null default '',
  rate       numeric not null default 20,
  base       text    not null default 'net-cost',
  vat        numeric not null default 23,
  updated_at timestamptz not null default now()
);

-- Faktury (klienci). Szczegóły faktury i koszty są w kolumnie data (JSON).
create table if not exists public.invoices (
  id           uuid primary key,
  user_id      uuid not null default auth.uid() references auth.users(id) on delete cascade,
  invoice_date date,
  in_report    boolean not null default true,
  data         jsonb   not null,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);
create index if not exists invoices_user_date on public.invoices (user_id, invoice_date desc);

alter table public.settings enable row level security;
alter table public.invoices enable row level security;

drop policy if exists "wlasne ustawienia" on public.settings;
create policy "wlasne ustawienia" on public.settings
  for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "wlasne faktury" on public.invoices;
create policy "wlasne faktury" on public.invoices
  for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

grant select, insert, update, delete on public.settings, public.invoices to authenticated;
revoke all on public.settings, public.invoices from anon;
