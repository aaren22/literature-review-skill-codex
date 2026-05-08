# 文献综述 skill 套件

学术文献综述全流程的 Claude Code Skills 套件——从找文献、拿 PDF、精读做笔记,到写独立综述论文、写学位论文里的 Lit Review 章。

**免费使用,MIT 协议。** 来自 YAN 的科研写作 SOP(33 skill 完整版),文献综述部分单独抽出来开源。

---

## 套件包含

```
文献综述skill/
├── SKILL.md           ← 顶层导航(决定走哪条流程)
├── README.md          ← 你正在看的这个
├── LICENSE            ← MIT
└── skills/
    ├── 文献检索/      ← PICO/SPIDER + PRISMA-S 多库检索
    ├── 文献获取/      ← 六级合规获取(订阅→OA→预印本→作者信→ILL→...)
    ├── 文献精读/      ← Keshav 三遍法 + Cornell/Zettelkasten 笔记
    ├── 文献综述写作/  ← 独立综述论文 / 学位综述章 / 引言 mini 综述
    └── 文献综述章节/  ← 学位论文 Chapter 2(挂 gap、衔接方法章)
```

每个子 skill 都是标准结构: `SKILL.md` + `assets/`(填空模板) + `references/`(方法论详解)。

---

## 安装

### 方式 1: 全局安装(推荐)

把整个 `文献综述skill/` 文件夹放到 `~/.claude/skills/`(或者 Windows 上的 `C:\Users\<你的用户名>\.claude\skills\`)。

```bash
# macOS / Linux
cp -r 文献综述skill ~/.claude/skills/

# Windows (PowerShell)
Copy-Item -Recurse 文献综述skill $env:USERPROFILE\.claude\skills\
```

重启 Claude Code,skill 会自动注册。

### 方式 2: 项目级安装

如果只想在某个项目里用,放到项目根目录的 `.claude/skills/`:

```bash
mkdir -p .claude/skills
cp -r 文献综述skill .claude/skills/
```

---

## 怎么用

skill 是**自动触发**的——你不需要敲 `/<命令>`,直接用自然语言对 Claude Code 说话就行。

### 触发示例

| 你说 | 自动激活 |
|------|---------|
| "我要做文献综述,从头开始" | 顶层导航 SKILL.md(决定走哪条) |
| "帮我搜文献" / "怎么找相关论文" | `文献检索` |
| "我要做系统综述的检索" | `文献检索`(PRISMA-S 严格模式) |
| "这篇 PDF 下载不到" | `文献获取` |
| "怎么给作者发邮件要文章" | `文献获取`(Level 4 + 邮件模板) |
| "这篇论文怎么读" / "建文献笔记系统" | `文献精读` |
| "帮我写文献综述" / "导师说我综述是堆砌" | `文献综述写作` |
| "学位论文 Chapter 2 怎么写" | `文献综述章节` |

### 典型流程

**学位论文综述章(从零)**:
```
"我要做硕士论文综述章,从找文献开始"
  → 文献检索 → 文献获取 → 文献精读 → 文献综述章节
```

**期刊论文引言里的 mini 综述**:
```
"我投 SSCI,引言里要 1-2 页综述"
  → 文献检索 → 文献精读(快读)→ 文献综述写作(CARS 模式)
```

**独立综述论文**:
```
"我要写一篇 Review Article 投综述刊"
  → 文献检索(PRISMA-S 严格)→ 文献获取(全收齐)
  → 文献精读(精读+批判)→ 文献综述写作(Torraco 综合)
```

---

## 适用人群

- **本科**: 毕业论文综述章、课程综述作业
- **硕士/博士**: 学位论文 Chapter 2、开题报告、期刊投稿引言
- **科研工作者**: 写 Review Article、申请基金时的文献铺陈
- **跨学科**: 医学/心理/管理/教育/CS 都能用,数据库选型在 `文献检索/SKILL.md`

中英文双轨设计——既支持英文期刊投稿(APA/PRISMA),也支持中文学位论文(GB/T 7714、CNKI/万方)。

---

## 方法论基础

不是"AI 凭感觉教你写综述",每个子 skill 都基于经典方法论:

| Skill | 方法论 |
|------|-------|
| 文献检索 | PRISMA 2020、PRISMA-S 2021、Richardson PICO、Cooke SPIDER、Gusenbauer & Haddaway 数据库实证 |
| 文献获取 | Suber Open Access、Piwowar OA 状况实证、ICMJE/COPE 伦理规范 |
| 文献精读 | Keshav 2007 三遍法、Luhmann/Ahrens Zettelkasten、Pauk Cornell、Robinson SQ3R |
| 文献综述写作 | Cooper 1988、Boote & Beile 12 条、Webster & Watson 概念中心法、Torraco 综合矩阵、Grant & Booth 综述类型学、Belcher 2019 |
| 文献综述章节 | Ridley 2012、Machi & McEvoy 2022、Hart 2018、Webster & Watson 2002、Torraco 2016 |

每个方法的原始文献 DOI/链接在子 skill 的 `references/` 目录里。

---

## 不包含什么

这是文献综述部分,**不是完整科研 SOP**。下列内容不在免费版里:

- 选题发掘、选题验证、研究问题精炼
- 研究设计、数据收集、数据分析
- 引言/方法/结果/讨论/结论各章写作
- 投稿、回复审稿、查重、润色
- 中英翻译、学术中文规范、排版

完整 33 skill 版本是 YAN 的付费产品。免费的这 5 个子 skill 是完全自包含的——能独立完成"从找文献到写完综述"全程,不依赖完整 SOP。

---

## 常见问题

**Q: 5 个 skill 顺序必须从头到尾走吗?**
A: 不必。卡在哪步直接进哪个 skill。比如笔记都做完了只是不会整合,直接进 `文献综述写作`。

**Q: 跟其他文献综述教程有什么不同?**
A: 这是给 Claude Code 用的可执行流程——AI 会按 SKILL.md 工作流跟你协作,asset 是真的填空模板,reference 是真的方法论详解。不是博客文章。

**Q: 中文学位论文也能用吗?**
A: 能。中英双轨——`文献检索` 有 CNKI/万方/超星章节,`文献综述写作` 有中英差异对比段。

**Q: 我可以改吗?**
A: 能。MIT 协议,可改可商用可二次分发。如果改得有用,欢迎 PR / 反馈。

**Q: 我怎么知道触发了哪个 skill?**
A: Claude Code 会在响应里显示 "Using <skill-name> to ..."。或者你直接说"用文献检索 skill 帮我搜",强制触发。

---

## 反馈与升级

完整科研写作 SOP(33 skill / 9 层) → 联系 YAN

本免费版本 bug / 改进建议 → 留言或 PR

---

## License

MIT — 见 `LICENSE` 文件。
