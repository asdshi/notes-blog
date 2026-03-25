-- Allow authenticated users to insert into public.posts
-- Run this in the Supabase SQL editor if you want to avoid using a service role key.

alter table public.posts enable row level security;

create policy "posts_insert_authenticated" on public.posts
for insert
to authenticated
with check (auth.role() = 'authenticated');
