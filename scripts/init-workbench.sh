#!/usr/bin/env bash
set -euo pipefail
WORK_ROOT="${1:-.literature-review}"
mkdir -p "$WORK_ROOT/reading-notes" "$WORK_ROOT/sources"
[ -f "$WORK_ROOT/project.md" ] || printf "%s\n" "# Literature Review Project" "" "## Research question" "" "## Review type" "" "## Scope" "" "## Current stage" "discovered" "" "## Key concepts" "" "## Target databases" "" "## Open questions / decisions" "" "## Planned next step" > "$WORK_ROOT/project.md"
[ -f "$WORK_ROOT/literature-matrix.md" ] || printf "%s\n" "# Literature Matrix" "" "| paper_id | authors | year | title | venue | doi | url | full_text_status | source_version | research_question | context_sample | method | theory_framework | key_findings | limitations | gap | relevance | reading_status | evidence_location | notes_path |" "|---|---|---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|" > "$WORK_ROOT/literature-matrix.md"
[ -f "$WORK_ROOT/search-log.md" ] || printf "# Search Log\n" > "$WORK_ROOT/search-log.md"
echo "Literature review workbench initialized at $WORK_ROOT"