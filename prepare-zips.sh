#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES="$ROOT/packages"
CODEX_SRC="$PACKAGES/codex/devbuddy"
CLAUDE_SRC="$PACKAGES/claude/devbuddy"
CODEX_ZIP="$PACKAGES/devbuddy-codex.zip"
CLAUDE_ZIP="$PACKAGES/devbuddy-claude.zip"
CLAUDE_PROJECT_ZIP="$PACKAGES/devbuddy-claude-project.zip"

if [[ ! -f "$CODEX_SRC/SKILL.md" ]]; then
  echo "Missing Codex package source: $CODEX_SRC" >&2
  exit 1
fi

if [[ ! -f "$CLAUDE_SRC/skill/SKILL.md" ]]; then
  echo "Missing Claude package source: $CLAUDE_SRC" >&2
  exit 1
fi

rm -f "$CODEX_ZIP" "$CLAUDE_ZIP" "$CLAUDE_PROJECT_ZIP"

TEMP_ROOT="$(mktemp -d)"
trap 'rm -rf "$TEMP_ROOT"' EXIT
CLAUDE_SKILL_ROOT="$TEMP_ROOT/devbuddy"
mkdir -p "$CLAUDE_SKILL_ROOT"
cp -R "$CLAUDE_SRC/skill/." "$CLAUDE_SKILL_ROOT/"

if command -v zip >/dev/null 2>&1; then
  (cd "$PACKAGES/codex" && zip -qr "$CODEX_ZIP" devbuddy)
  (cd "$TEMP_ROOT" && zip -qr "$CLAUDE_ZIP" devbuddy)
  (cd "$CLAUDE_SRC" && zip -qr "$CLAUDE_PROJECT_ZIP" .claude skill)
else
  POWERSHELL_BIN=""
  if command -v pwsh >/dev/null 2>&1; then
    POWERSHELL_BIN="pwsh"
  elif command -v powershell.exe >/dev/null 2>&1; then
    POWERSHELL_BIN="powershell.exe"
  elif command -v powershell >/dev/null 2>&1; then
    POWERSHELL_BIN="powershell"
  fi

  if [[ -z "$POWERSHELL_BIN" ]]; then
    echo "zip or PowerShell is required to create archives." >&2
    exit 1
  fi

  ps_path() {
    if command -v cygpath >/dev/null 2>&1; then
      cygpath -w "$1"
    else
      printf '%s' "$1"
    fi
  }

  CODEX_SRC_PS="$(ps_path "$CODEX_SRC")"
  CLAUDE_AGENTS_PS="$(ps_path "$CLAUDE_SRC/.claude")"
  CLAUDE_SKILL_PS="$(ps_path "$CLAUDE_SRC/skill")"
  CLAUDE_INSTALL_SKILL_PS="$(ps_path "$CLAUDE_SKILL_ROOT")"
  CODEX_ZIP_PS="$(ps_path "$CODEX_ZIP")"
  CLAUDE_ZIP_PS="$(ps_path "$CLAUDE_ZIP")"
  CLAUDE_PROJECT_ZIP_PS="$(ps_path "$CLAUDE_PROJECT_ZIP")"

  "$POWERSHELL_BIN" -NoProfile -ExecutionPolicy Bypass -Command \
    "\$ErrorActionPreference = 'Stop';" \
    "Compress-Archive -LiteralPath '$CODEX_SRC_PS' -DestinationPath '$CODEX_ZIP_PS' -CompressionLevel Optimal;" \
    "Compress-Archive -LiteralPath '$CLAUDE_INSTALL_SKILL_PS' -DestinationPath '$CLAUDE_ZIP_PS' -CompressionLevel Optimal;" \
    "Compress-Archive -LiteralPath '$CLAUDE_AGENTS_PS','$CLAUDE_SKILL_PS' -DestinationPath '$CLAUDE_PROJECT_ZIP_PS' -CompressionLevel Optimal;"
fi

echo "Created $CODEX_ZIP"
echo "Created $CLAUDE_ZIP"
echo "Created $CLAUDE_PROJECT_ZIP"
