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
SUPABASE_SERVICE_ROLE_KEY=...  # 可选，服务端读写时使用
```

3. 线上站点默认仅展示公开博客页面，不暴露发布后台。
4. 私有写作入口为 `/writer/`（不在公开导航中），需使用 Supabase 账号登录后发布。
5. 也可继续通过 Supabase 控制台 Table Editor 进行内容发布与维护。

## 部署到 Vercel

本项目使用 **SSR（服务端渲染）** 模式，通过 `@astrojs/vercel` 适配器部署。

每次请求页面时，服务端会实时从 Supabase 拉取最新数据，因此在 Supabase 中新增文章后**无需重新部署**，刷新页面即可看到更新。

### Vercel 环境变量配置

在 Vercel 项目的 **Settings → Environment Variables** 中添加以下变量：

| 变量名 | 说明 |
| --- | --- |
| `PUBLIC_SUPABASE_URL` | Supabase 项目 URL |
| `PUBLIC_SUPABASE_ANON_KEY` | Supabase 匿名公钥（anon key） |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase 服务角色密钥（可选，用于服务端查询） |

> **注意：** 本地 `.env` 文件中的数据库指向的是**本地或开发环境** Supabase 项目，与 Vercel 线上使用的是**同一个 Supabase 项目**才会同步数据。请确保 Vercel 中配置的环境变量与您实际使用的 Supabase 云端项目对应。

