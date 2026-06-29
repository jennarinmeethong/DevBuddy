@echo off
setlocal

set "ROOT=%~dp0"
set "PACKAGES=%ROOT%packages"
set "CLAUDE_SRC=%ROOT%\.claude\skills\devbuddy"
set "CLAUDE_ZIP=%PACKAGES%\devbuddy-claude.zip"

if not exist "%CLAUDE_SRC%\SKILL.md" (
  echo Missing Claude package source: %CLAUDE_SRC%
  exit /b 1
)

if exist "%CLAUDE_ZIP%" del /f /q "%CLAUDE_ZIP%"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference = 'Stop';" ^
  "$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('devbuddy-package-' + [guid]::NewGuid().ToString('N'));" ^
  "$claudeSkillRoot = Join-Path $tempRoot 'devbuddy';" ^
  "try {" ^
  "  New-Item -ItemType Directory -Path $claudeSkillRoot -Force | Out-Null;" ^
  "  Copy-Item -Path '%CLAUDE_SRC%\*' -Destination $claudeSkillRoot -Recurse -Force;" ^
  "  Get-ChildItem -LiteralPath $claudeSkillRoot -Recurse -Force -Filter '.DS_Store' | Remove-Item -Force;" ^
  "  Compress-Archive -LiteralPath $claudeSkillRoot -DestinationPath '%CLAUDE_ZIP%' -CompressionLevel Optimal;" ^
  "  if (!(Test-Path -LiteralPath '%CLAUDE_ZIP%')) { throw 'Archive was not created: %CLAUDE_ZIP%' }" ^
  "} finally {" ^
  "  if (Test-Path -LiteralPath $tempRoot) { Remove-Item -LiteralPath $tempRoot -Recurse -Force }" ^
  "}"

if errorlevel 1 exit /b %errorlevel%

echo Created %CLAUDE_ZIP%
