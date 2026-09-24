# 文献综述 Skill 套件（Codex 版）

学术文献综述全流程的 Codex Skills 套件：从文献检索、全文获取、论文精读，到综述写作和学位论文 Literature Review 章节。

本仓库基于 YANZHANLIN/literature-review-skill fork，并针对 Codex 的 Skill 发现和工具能力边界进行了适配。MIT License。

## 包含的 5 个 Skill

- `literature-search` — 文献检索
- `literature-acquisition` — 文献获取
- `literature-reading` — 文献精读
- `literature-writing` — 文献综述写作
- `literature-review-chapter` — 文献综述章节

每个 Skill 都包含自己的 `SKILL.md`，并保留所需的 `assets/` 与 `references/`。

仓库根目录的 `SKILL.md` 是整套工作流的导航说明，不需要单独安装。

## 安装到 Codex

不要把整个仓库直接作为一个 Skill 放进 Skill 根目录。Codex 应看到 5 个直接子 Skill。

### Windows

在仓库根目录打开 PowerShell：

```powershell
.\scripts\install-codex.ps1
```

默认安装到：

```text
$HOME\.codex\skills\
```

也可以指定目录：

```powershell
.\scripts\install-codex.ps1 -TargetRoot "$HOME\.codex\skills"
```

### macOS / Linux

```bash
bash ./scripts/install-codex.sh
```

默认安装到：

```text
~/.codex/skills/
```

安装后结构应类似：

```text
~/.codex/skills/
├── literature-search/
│   ├── SKILL.md
│   ├── assets/
│   └── references/
├── literature-acquisition/
│   ├── SKILL.md
│   ├── assets/
│   └── references/
├── literature-reading/
│   ├── SKILL.md
│   ├── assets/
│   └── references/
├── literature-writing/
│   ├── SKILL.md
│   ├── assets/
│   └── references/
└── literature-review-chapter/
    ├── SKILL.md
    ├── assets/
    └── references/
```

如果只希望项目内使用，可将上述 5 个目录复制到项目的 `.agents/skills/`。

## 怎么使用

安装后直接使用自然语言即可。例如：

- “帮我针对浮托安装技术做系统性文献检索”
- “这篇论文帮我做 Keshav 三遍法精读”
- “我有 30 篇论文，帮我按主题建立 synthesis matrix”
- “帮我写硕士论文 Chapter 2 的 Literature Review”

也可以明确指定：

```text
使用 literature-search skill 帮我设计检索策略。
使用 literature-reading skill 分析这个 PDF。
```

5 个 Skill 可以单独使用，不要求每次从第一步开始。

## Codex 适配内容

本 fork 保留原项目的方法论、模板和参考资料，主要做了以下适配：

1. 5 个子 Skill 使用独立的英文 machine-readable `name`，中文名称保留在正文中。
2. 去除对 Claude Code 安装目录、命令、插件和 Hook 的依赖。
3. 明确网页访问、数据库订阅、PDF 下载、邮件等外部能力不能被 Skill 自动假定存在。
4. 强化证据纪律：没有从论文全文或可靠出版记录核对的信息，不得写成论文事实。
5. 系统综述数据库数量、Boote & Beile 评分等经验规则改为参考建议，而不是硬性门槛。
6. 提供安装脚本，将嵌套的 5 个子 Skill 安装成 Codex 可直接发现的结构。

## 设计原则

文献检索 Skill 区分“设计检索策略”和“实际执行数据库搜索”。没有 Web/MCP 或数据库访问权限时，只生成可复制的检索式，不虚构命中数。

文献获取 Skill 只提供合法、可验证的全文获取路径，不绕过付费墙、验证码、登录或访问控制。

文献精读、综述写作和综述章节 Skill 都要求区分论文原文事实、基于证据的分析和模型推断；关键结论应尽量绑定论文中的页码、章节、表/图等证据位置。

## 与原 Claude Code 版本的主要区别

原项目采用：

```text
literature-review-skill/
└── skills/
    ├── 文献检索/
    ├── 文献获取/
    ├── 文献精读/
    ├── 文献综述写作/
    └── 文献综述章节/
```

Codex 安装后采用：

```text
~/.codex/skills/
├── literature-search/
├── literature-acquisition/
├── literature-reading/
├── literature-writing/
└── literature-review-chapter/
```

这样每个 Skill 都是 Skill 根目录的直接子目录，不依赖一个额外的“总路由 Skill”。

## License

MIT
