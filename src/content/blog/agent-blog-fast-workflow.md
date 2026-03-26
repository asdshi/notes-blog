
## 1. 原型生成与代码同步（The Start）

博客这类小型项目,耦合度较低,我们直接生成原型,根据原型迭代就行
我们选择google stitch进行页面原型的生成,google stitch作为免费的ai原型工具真是太好用了,生成的原型没有一点ai味
在 Google Stitch 中描述博客风格与页面结构，生成 Astro 原型代码,选择aistudio进行导出,大致直接就能得到一个可运行的 Astro 项目.然后通过github直接导出到仓库.


## 2. Agent 接入与 Supabase 自动化配置（The Core）
数据库选用了supbase这种云数据库,以免我们在大费周章的购买服务器,部署数据库,配置安全等一系列麻烦的事情,而且supabase提供了非常友好的界面和API,可以让我们快速上手,登录supbase的时候看见了官方的mcp,索性直接连table的创建也交给agent.

工具：使用接入 Supabase MCP 的编辑器（VS Code + GitHub Copilot、Cursor、Claude 等都可以）。

建议给 Agent 的指令模板：

请分析当前项目并接入 Supabase。
1. 用 MCP 创建博客所需表结构（如 posts、tags、users），并补齐字段约束。
2. 配置 RLS：anon 仅可读，authenticated 可按业务规则写入。
3. 在本地环境文件中写入必要变量：PUBLIC_SUPABASE_URL、PUBLIC_SUPABASE_ANON_KEY。
4. 服务端密钥仅用于服务端，不允许注入客户端。

重点：先打通“表结构 + 权限 + 查询链路”，这是数据库驱动博客的核心。

## 3. 构建 GUI 发布后台（The Tool）

操作：让 Agent 在前端生成 `/admin` 路由。

功能建议：

- 集成 Supabase Auth 登录
- 提供文章创建/编辑页面
- 支持草稿与发布状态切换
- 支持标签与摘要维护

效果：后续只需访问 `yourblog.com/admin` 登录，即可通过 GUI 管理内容，数据实时写入 Supabase。

## 4. 自动化部署与触发（The Bridge）

Vercel 部署：导入 GitHub 仓库，并在 Environment Variables 中配置 Supabase 参数。

触发策略：

- 日常推荐：Git push 触发自动部署（最稳）
- 可选增强：Deploy Hook 手动触发发布

如果要做数据库事件联动：

1. 在 Vercel 创建 Deploy Hook。
2. 在 Supabase Webhooks 中配置触发事件（如 posts 的 INSERT/UPDATE）。
3. 确保触发频率可控，避免频繁重建。

结果：每次发布新内容后，站点可自动完成重新部署并对外更新。

## 5. 一句话总结

先用 Agent 快速搭建 Astro 前端，再用 Supabase 承载内容与权限，最后通过 GitHub + Vercel 完成自动化发布，这就是高效、可持续的个人博客开发路径。