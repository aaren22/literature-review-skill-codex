# Codex 文献综述工作台：数据契约

本文件定义 5 个 Skill 之间共享的数据结构，使“检索 → 获取 → 精读 → 矩阵 → 综合”形成连续工作流。

## 1. 工作台目录

在用户当前项目的工作区内，优先使用：

    .literature-review/
    ├── project.md
    ├── search-log.md
    ├── literature-matrix.md
    ├── reading-notes/
    │   └── <paper-id>.md
    └── sources/
        └── <paper-id>.pdf

如果用户已经指定其他目录，遵循用户目录。不要擅自覆盖已有数据。

## 2. 论文唯一 ID

优先使用 DOI 的规范化形式生成 ID；没有 DOI 时使用 firstauthor-year-shorttitle。同一篇论文不同版本共用同一个 paper_id。

## 3. Literature Matrix 最小字段

| 字段 | 含义 |
|---|---|
| paper_id | 唯一 ID |
| authors | 作者 |
| year | 年份 |
| title | 标题 |
| venue | 期刊/会议/学位论文等 |
| doi | DOI |
| url | 可验证来源 |
| full_text_status | missing / oa / author_copy / subscription / library / provided |
| source_version | publisher / accepted_manuscript / preprint / thesis / report |
| research_question | 研究问题 |
| context_sample | 对象、场景、样本或数据 |
| method | 方法/模型/实验/统计方法 |
| theory_framework | 理论或概念框架 |
| key_findings | 主要发现 |
| limitations | 作者明确局限 + 研究者识别局限 |
| gap | 与当前研究相关的 gap |
| relevance | high / medium / low / unassessed |
| reading_status | discovered / retrieved / first_pass / second_pass / third_pass / synthesized |
| evidence_location | 页码、章节、表/图等证据位置 |
| notes_path | 对应精读笔记路径 |

未知字段必须留空或标记 unknown，不得猜测。

## 4. 状态流转

    discovered → retrieved → first_pass → second_pass → third_pass（按需） → synthesized

检索 Skill 负责 discovered；获取 Skill 负责 full_text_status；精读 Skill 负责研究问题、方法、发现、局限、gap 和 reading_status；综述 Skill 消费矩阵并补充主题、综合和 gap；章节 Skill 消费同一矩阵生成章节。

## 5. 更新规则

- 新论文：追加一行，不覆盖已有论文。
- 已存在 paper_id：更新已有行。
- 不删除用户已有字段，除非用户明确要求。
- 无法核实的信息保持空白。
- 从 PDF 提取的信息必须带 evidence_location。
- 从摘要提取的结论标明 abstract，不假装来自全文。
- 论文版本发生变化时更新 source_version。
- 矩阵保存事实与结构化证据；主题聚类、综合判断和写作草稿放在其他文件。

## 6. 精读笔记与矩阵

reading-notes/<paper-id>.md 保存单篇论文的详细证据和分析；literature-matrix.md 保存跨论文可比较字段。精读时先写单篇笔记，再同步矩阵。

## 7. 完成标准

当用户说“继续做文献综述”时，Skill 应优先检查 .literature-review/literature-matrix.md 和 .literature-review/project.md，而不是要求用户重新描述已经完成的检索和精读工作。