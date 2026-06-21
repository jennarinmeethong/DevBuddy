@echo off
setlocal

set "ROOT=%~dp0"
set "PACKAGES=%ROOT%packages"
set "CODEX_SRC=%PACKAGES%\codex\devbuddy"
set "CLAUDE_SRC=%PACKAGES%\claude\devbuddy"
set "CODEX_ZIP=%PACKAGES%\devbuddy-codex.zip"
set "CLAUDE_ZIP=%PACKAGES%\devbuddy-claude.zip"

if not exist "%CODEX_SRC%\SKILL.md" (
  echo Missing Codex package source: %CODEX_SRC%
  exit /b 1
)

if not exist "%CLAUDE_SRC%\skill\SKILL.md" (
  echo Missing Claude package source: %CLAUDE_SRC%
  exit /b 1
)

if exist "%CODEX_ZIP%" del /f /q "%CODEX_ZIP%"
if exist "%CLAUDE_ZIP%" del /f /q "%CLAUDE_ZIP%"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference = 'Stop';" ^
  "Compress-Archive -LiteralPath '%CODEX_SRC%' -DestinationPath '%CODEX_ZIP%' -CompressionLevel Optimal;" ^
  "Compress-Archive -LiteralPath '%CLAUDE_SRC%\.claude','%CLAUDE_SRC%\skill' -DestinationPath '%CLAUDE_ZIP%' -CompressionLevel Optimal;"

if errorlevel 1 exit /b %errorlevel%

echo Created %CODEX_ZIP%
echo Created %CLAUDE_ZIP%
