param(
    [string]$TargetRoot = (Join-Path $HOME ".codex\skills")
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$SourceRoot = Join-Path $RepoRoot "skills"

$Skills = @(
    @{ Source = "文献检索"; Target = "literature-search" },
    @{ Source = "文献获取"; Target = "literature-acquisition" },
    @{ Source = "文献精读"; Target = "literature-reading" },
    @{ Source = "文献综述写作"; Target = "literature-writing" },
    @{ Source = "文献综述章节"; Target = "literature-review-chapter" }
)

New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null

foreach ($Skill in $Skills) {
    $src = Join-Path $SourceRoot $Skill.Source
    $dst = Join-Path $TargetRoot $Skill.Target

    if (-not (Test-Path (Join-Path $src "SKILL.md"))) {
        throw "SKILL.md not found: $src"
    }

    New-Item -ItemType Directory -Force -Path $dst | Out-Null
    Copy-Item -Path (Join-Path $src "*") -Destination $dst -Recurse -Force
    Write-Host "Installed $($Skill.Target) -> $dst"
}

Write-Host ""
Write-Host "Codex literature-review skills installed successfully."
Write-Host "Restart Codex or reopen the project so Skills are rediscovered."
