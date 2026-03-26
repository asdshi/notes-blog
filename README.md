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

- 首页: `src/pages/index.astro`
- 文章页: `src/pages/posts/[...slug].astro`
- 文章数据: Supabase 数据库中的 `posts` 表

## Supabase 云端发布

1. 在 Supabase SQL Editor 执行 `supabase/schema.sql`
2. 复制 `.env.example` 为 `.env` 并填写:

```bash
PUBLIC_SUPABASE_URL=...
PUBLIC_SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
```

3. 线上站点默认仅展示公开博客页面，不暴露发布后台。
4. 私有写作入口为 `/writer/`（不在公开导航中），需使用 Supabase 账号登录后发布。
5. 也可继续通过 Supabase 控制台 Table Editor 进行内容发布与维护。

## Vercel 部署（SSR）

本项目使用 **Astro SSR（服务端渲染）** 模式，配合 `@astrojs/vercel` 适配器部署到 Vercel。

**为什么使用 SSR？**

在 SSG（静态生成）模式下，页面在构建时从数据库读取一次，之后不再更新。这意味着数据库中新增的文章需要重新触发部署才能显示。

切换到 SSR 模式后，每次访问页面都会从 Supabase 实时读取最新数据，**在数据库中新增文章后无需重新部署即可立即显示**。

**Vercel 环境变量配置：**

在 Vercel 项目设置 → Environment Variables 中添加以下三个变量：

| 变量名 | 说明 |
|---|---|
| `PUBLIC_SUPABASE_URL` | Supabase 项目 URL |
| `PUBLIC_SUPABASE_ANON_KEY` | Supabase 匿名公钥（客户端） |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase 服务端密钥（服务端读取文章用） |

配置完成后推送代码到 GitHub，Vercel 会自动触发部署。
