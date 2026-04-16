-- Supabase Storage 图片上传配置
-- 在 Supabase SQL Editor 中执行以下语句

-- 1. 创建公开存储桶（用于存放博客文章中的图片）
insert into storage.buckets (id, name, public)
values ('blog-images', 'blog-images', true)
on conflict (id) do nothing;

-- 2. 允许所有人读取图片
-- 注意：bucket_id 为文本比较
begin;
  drop policy if exists "Public read blog-images" on storage.objects;
  create policy "Public read blog-images"
    on storage.objects for select
    to public
    using ( bucket_id = 'blog-images' );
commit;

-- 3. 允许已登录用户上传图片
begin;
  drop policy if exists "Authenticated upload blog-images" on storage.objects;
  create policy "Authenticated upload blog-images"
    on storage.objects for insert
    to authenticated
    with check ( bucket_id = 'blog-images' );
commit;

-- 4. 允许已登录用户删除自己上传的图片（可选）
begin;
  drop policy if exists "Authenticated delete own blog-images" on storage.objects;
  create policy "Authenticated delete own blog-images"
    on storage.objects for delete
    to authenticated
    using ( bucket_id = 'blog-images' );
commit;
