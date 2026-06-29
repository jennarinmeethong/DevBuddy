#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES="$ROOT/packages"
CLAUDE_SRC="$ROOT/.claude/skills/devbuddy"
CLAUDE_ZIP="$PACKAGES/devbuddy-claude.zip"

if [[ ! -f "$CLAUDE_SRC/SKILL.md" ]]; then
  echo "Missing Claude package source: $CLAUDE_SRC" >&2
  exit 1
fi

rm -f "$CLAUDE_ZIP"

TEMP_ROOT="$(mktemp -d)"
trap 'rm -rf "$TEMP_ROOT"' EXIT
CLAUDE_SKILL_ROOT="$TEMP_ROOT/devbuddy"
mkdir -p "$CLAUDE_SKILL_ROOT"
cp -R "$CLAUDE_SRC/." "$CLAUDE_SKILL_ROOT/"
find "$CLAUDE_SKILL_ROOT" -name ".DS_Store" -delete

if command -v zip >/dev/null 2>&1; then
  (cd "$TEMP_ROOT" && zip -qr "$CLAUDE_ZIP" devbuddy -x "*/.DS_Store" "__MACOSX/*")
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

  CLAUDE_INSTALL_ROOT_PS="$(ps_path "$CLAUDE_SKILL_ROOT")"
  CLAUDE_ZIP_PS="$(ps_path "$CLAUDE_ZIP")"

  "$POWERSHELL_BIN" -NoProfile -ExecutionPolicy Bypass -Command \
    "\$ErrorActionPreference = 'Stop';" \
    "Compress-Archive -LiteralPath '$CLAUDE_INSTALL_ROOT_PS' -DestinationPath '$CLAUDE_ZIP_PS' -CompressionLevel Optimal;"
fi

echo "Created $CLAUDE_ZIP"
