param([string]$WorkRoot = ".literature-review")
$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force -Path $WorkRoot | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkRoot "reading-notes") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkRoot "sources") | Out-Null
$project = @("# Literature Review Project","","## Research question","","## Review type","","## Scope","","## Current stage","discovered","","## Key concepts","","## Target databases","","## Open questions / decisions","","## Planned next step")
$matrix = @("# Literature Matrix","","| paper_id | authors | year | title | venue | doi | url | full_text_status | source_version | research_question | context_sample | method | theory_framework | key_findings | limitations | gap | relevance | reading_status | evidence_location | notes_path |","|---|---|---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|")
if (-not (Test-Path (Join-Path $WorkRoot "project.md"))) { $project | Set-Content (Join-Path $WorkRoot "project.md") -Encoding UTF8 }
if (-not (Test-Path (Join-Path $WorkRoot "literature-matrix.md"))) { $matrix | Set-Content (Join-Path $WorkRoot "literature-matrix.md") -Encoding UTF8 }
if (-not (Test-Path (Join-Path $WorkRoot "search-log.md"))) { "# Search Log" | Set-Content (Join-Path $WorkRoot "search-log.md") -Encoding UTF8 }
Write-Host "Literature review workbench initialized at $WorkRoot"