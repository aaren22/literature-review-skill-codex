#!/usr/bin/env bash
set -euo pipefail

TARGET_ROOT="${1:-$HOME/.codex/skills}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_ROOT="$REPO_ROOT/skills"

declare -A SKILLS=(
  ["文献检索"]="literature-search"
  ["文献获取"]="literature-acquisition"
  ["文献精读"]="literature-reading"
  ["文献综述写作"]="literature-writing"
  ["文献综述章节"]="literature-review-chapter"
)

mkdir -p "$TARGET_ROOT"

for source in "${!SKILLS[@]}"; do
  target="${SKILLS[$source]}"
  src="$SOURCE_ROOT/$source"
  dst="$TARGET_ROOT/$target"

  test -f "$src/SKILL.md"
  mkdir -p "$dst"
  cp -R "$src/." "$dst/"
  echo "Installed $target -> $dst"
done

echo
echo "Codex literature-review skills installed successfully."
echo "Restart Codex or reopen the project so Skills are rediscovered."
