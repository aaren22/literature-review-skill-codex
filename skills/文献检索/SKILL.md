---
name: literature-search
description: Build reproducible Chinese and English academic literature search strategies. Use when the user needs search terms, database-specific queries, systematic-review retrieval, citation chaining, or a documented search log. This skill designs and, when supported by available web/MCP access, helps execute searches; it does not assume access to subscription databases.
---

# 文献检索

把研究问题变成可复现的检索策略，而不是凭感觉搜几个词。

## 触发

激活：
- "帮我搜文献"、"怎么找相关论文"
- "关键词搜不到合适的"
- "我要做系统综述的检索"
- "这个领域有什么关键文献"

不激活：
- 论文下载不到 → `文献获取`
- 搜出来了不知怎么读 → `文献精读`
- 文献堆读完了要整合 → `文献综述写作`

## Codex 工作原则

- 区分“设计检索”和“执行检索”。本 Skill 可以设计数据库检索式、比较数据库、生成检索日志，并在当前 Codex 会话具备相应网页或 MCP 访问能力时执行检索。
- 不要假定有数据库订阅。Web of Science、Scopus、CNKI、万方、IEEE Xplore、ACM DL、Embase 等可能需要账号、机构订阅或专用访问权限；没有实际访问能力时，只生成可复制执行的检索式，并明确说明限制。
- 搜索结果不是证据本身。候选记录只能用于发现文献；要把论文作为综述证据，必须取得并核对论文全文或可靠的正式出版记录。
- 优先保存可复现信息：日期、数据库/来源、完整检索式、过滤条件、命中数（若实际可见）和导出结果位置。

## 工作流

### Step 1｜判断检索类型（决定严格度）

| 综述类型 | 检索严格度 | 参考标准 |
|---------|---------|---------|
| 叙事综述（学位论文综述章） | 中 | 覆盖主要文献即可 |
| 系统综述 | **严** | PRISMA-S 27 项全部 |
| 范围综述 | 严 | PRISMA-ScR |
| 快速综述 | 松 | 简化 systematic |
| 引言内 mini 综述 | 松 | 覆盖核心即可 |

### Step 2｜问题概念化（选 PICO / PICOC / SPIDER）

把 RQ 拆成可检索的概念块。

- **定量 + 干预** → PICO（Population / Intervention / Comparison / Outcome）
- **定量 + 社科** → PICOC（+ Context）
- **质性** → SPIDER（Sample / Phenomenon / Design / Evaluation / Research type）

每格填出 3-8 个同义词。填 `assets/picos-worksheet.md`。

框架详解 → `references/search-frameworks.md`

### Step 3｜关键词扩展

对每个概念块：

1. 列**同义词**（学术 + 俗称）
2. 查**受控词表**（MeSH / Emtree / CNKI 主题词）
3. 加**截断符**（writing vs writings vs writer → writ*）
4. 考虑**不同表达**（中英互译、不同学科术语）

Boolean + MeSH 详解 → `references/boolean-search.md`

### Step 4｜选数据库

**系统综述应根据研究领域和协议预先确定数据库覆盖范围，而不是机械规定固定数量。** 原则上覆盖主要综合数据库、学科数据库和必要的中文数据库；如果研究协议规定了具体数据库，应以协议为准。

| 学科 | 英文必检 | 中文必检 |
|------|---------|---------|
| 医学 | PubMed / Cochrane / Embase / Web of Science | CNKI / 万方 / 中国生物医学文献库 |
| 心理 | PsycINFO / Web of Science / Scopus / ERIC | CNKI / 万方 |
| 管理 | Business Source / Web of Science / Scopus / ABI | CNKI / 万方 |
| 教育 | ERIC / Web of Science / Scopus / PsycINFO | CNKI / 万方 |
| CS | IEEE Xplore / ACM DL / Web of Science / Scopus / DBLP | CNKI（工程辑）|

数据库覆盖对比 + 选型依据 → `references/databases.md`（基于 Gusenbauer & Haddaway 2020 26 库实证）

### Step 5｜构建搜索字符串

每个库**语法不同**，不能复制粘贴。

- Web of Science: `TS=("digital transformation" AND "SME*")`
- PubMed: `"digital transformation"[Title/Abstract] AND SME*`
- Scopus: `TITLE-ABS-KEY("digital transformation" AND SME*)`
- CNKI: `SU = '数字化转型' AND SU = '中小企业'`

详见 `references/boolean-search.md`。

### Step 6｜执行检索 + 记录

**每次检索必须记录**：日期、数据库、搜索字符串、命中数、筛选标准、保留数。

填 `assets/search-log.md`。这是可复现性的核心。

### Step 7｜去重 + 导出

- Zotero / EndNote 批量去重
- 导出 RIS / BibTeX 供下一步引用管理（Zotero / EndNote / Mendeley）

### Step 8｜灰色文献（如需）

- 会议论文（IEEE / ACM）
- 预印本（arXiv / bioRxiv / SSRN）
- 政府/机构报告
- 博硕学位论文（ProQuest / 万方）

方法详见 `references/grey-literature.md`

### Step 9｜质量自检（系统综述用）

PRISMA-S 27 项 checklist → `references/prisma-s.md`

## 中文数据库特殊点

- **CNKI** — 最大中文期刊库，但导出需订阅
- **万方** — 与 CNKI 重叠度高，部分补充
- **维普** — 工科偏好
- **超星/读秀** — 图书 + 学位论文强
- **ProQuest（含中文版）** — 海外访问学位论文

详见 `references/databases-cn.md`

## 雷区

1. **只搜一个库** — Google Scholar 覆盖面最广但召回差，系统综述必多库
2. **凭感觉选关键词** — 不查 MeSH / 主题词，漏掉同义表达
3. **不记录搜索过程** — 答辩 / 审稿问"怎么搜的"答不出
4. **忽略灰色文献** — 发表偏误（publication bias）严重
5. **中英分离** — 中文学位论文只搜中文库 = 没看到国际进展
6. **一次性搜完不迭代** — 搜到几篇关键文献后应该再扩关键词二次搜

## Codex / AI 边界

- **能做：** 生成同义词表、翻译中英术语、检查搜索字符串语法、导出格式转换
- **不能假定：** 已登录或有权访问任何订阅数据库；不能把无法实际验证的命中数、筛选数或数据库结果写成事实。
- **可以辅助：** 判断候选数据库是否与研究问题匹配、比较覆盖范围，并根据用户实际可访问的数据库调整策略；最终纳入/排除和质量判断由研究者确认。

## 何时读 references/

| 需求 | 读哪个 |
|------|-------|
| PICO/SPIDER 具体用法 | `references/search-frameworks.md` |
| 英文数据库选型与对比 | `references/databases.md` |
| 中文数据库使用 | `references/databases-cn.md` |
| Boolean + MeSH 详解 | `references/boolean-search.md` |
| 灰色文献检索 | `references/grey-literature.md` |
| PRISMA-S 27 项 | `references/prisma-s.md` |
| 引文追踪（雪球法） | `references/citation-chaining.md` |

## 何时用 assets/

| 需求 | 用哪个 |
|------|-------|
| 填 PICO/PICOC/SPIDER 概念化 | `assets/picos-worksheet.md` |
| 每次检索记录 | `assets/search-log.md` |

## 下游

检索完成 →
- 下载不到 → `文献获取`
- 下完开始读 → `文献精读`
- 全部读完开始整合 → `文献综述写作`
