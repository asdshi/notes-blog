# notes-blog

轻量 Astro 博客骨架。

## 开发

```bash
npm install
npm run dev
```

## 构建

```bash
npm run build
npm run preview
```

## 内容目录

- 文章: `src/content/blog/*.md`
- 首页: `src/pages/index.astro`
- 文章页: `src/pages/posts/[...slug].astro`

## Supabase 云端发布

1. 在 Supabase SQL Editor 执行 `supabase/schema.sql`
2. 复制 `.env.example` 为 `.env` 并填写:

```bash
PUBLIC_SUPABASE_URL=...
PUBLIC_SUPABASE_ANON_KEY=...
```

3. 线上站点默认仅展示公开博客页面，不暴露发布后台。
4. 私有写作入口为 `/writer/`（不在公开导航中），需使用 Supabase 账号登录后发布。
5. 也可继续通过 Supabase 控制台 Table Editor 进行内容发布与维护。
