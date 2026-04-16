-- Allow authenticated users to insert/update/delete public.posts
-- Run this in the Supabase SQL editor if you want to avoid using a service role key.

alter table public.posts enable row level security;

drop policy if exists "posts_insert_authenticated" on public.posts;
create policy "posts_insert_authenticated" on public.posts
for insert
to authenticated
with check (auth.role() = 'authenticated');

drop policy if exists "posts_update_authenticated" on public.posts;
create policy "posts_update_authenticated" on public.posts
for update
to authenticated
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');

drop policy if exists "posts_delete_authenticated" on public.posts;
create policy "posts_delete_authenticated" on public.posts
for delete
to authenticated
using (auth.role() = 'authenticated');
