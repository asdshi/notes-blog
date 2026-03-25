-- Run in Supabase SQL Editor
create table if not exists public.posts (
  id bigint generated always as identity primary key,
  slug text not null unique,
  title text not null,
  content text not null,
  tags text[] not null default '{}',
  excerpt text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_posts_updated_at on public.posts;
create trigger trg_posts_updated_at
before update on public.posts
for each row execute function public.set_updated_at();

alter table public.posts enable row level security;

drop policy if exists "public can read posts" on public.posts;
drop policy if exists "public can insert posts" on public.posts;
