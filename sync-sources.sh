#!/usr/bin/env bash
set -euo pipefail

# Propagate the canonical skill source (skill/) to the two mirror trees:
#   - .claude/skills/devbuddy/        (what /devbuddy runs in this repo)
#   - packages/claude/devbuddy/skill/ (the packaged copy)
#
# Per-project memory files are runtime state and diverge legitimately per
# install, so they are never overwritten. Everything else must stay identical
# across the three trees; edit skill/ and run this script to sync.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$ROOT/skill"
DESTS=(
  "$ROOT/.claude/skills/devbuddy"
  "$ROOT/packages/claude/devbuddy/skill"
)

# Memory files are excluded from sync (anchored to the transfer root).
MEMORY_FILES=(
  "Context.md"
  "BusinessContext.md"
  "DecisionLog.md"
  "KnowledgeBase.md"
  "plan.md"
)

if [[ ! -f "$SRC/SKILL.md" ]]; then
  echo "Missing canonical skill source: $SRC" >&2
  exit 1
fi

if ! command -v rsync >/dev/null 2>&1; then
  echo "rsync is required to sync skill sources." >&2
  exit 1
fi

EXCLUDES=(--exclude ".DS_Store")
for f in "${MEMORY_FILES[@]}"; do
  EXCLUDES+=(--exclude "/$f")
done

for dest in "${DESTS[@]}"; do
  mkdir -p "$dest"
  # No --delete: live-only artifacts (reports/, extra memory) are preserved.
  rsync -a "${EXCLUDES[@]}" "$SRC/" "$dest/"
  echo "Synced skill/ -> ${dest#"$ROOT/"}"
done

echo "Sync complete. Memory files were preserved in each mirror."
