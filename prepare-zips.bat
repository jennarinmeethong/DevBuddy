@echo off
setlocal

set "ROOT=%~dp0"
set "PACKAGES=%ROOT%packages"
set "CLAUDE_SRC=%ROOT%\.claude\skills\devbuddy"
set "CLAUDE_ZIP=%PACKAGES%\devbuddy-claude.zip"

rem Sync canonical skill\ into the mirrors first so the archive is never built
rem from a stale copy.
call "%ROOT%sync-sources.bat"
if errorlevel 1 exit /b %errorlevel%

if not exist "%CLAUDE_SRC%\SKILL.md" (
  echo Missing Claude package source: %CLAUDE_SRC%
  exit /b 1
)

if exist "%CLAUDE_ZIP%" del /f /q "%CLAUDE_ZIP%"

rem Build the archive via the shared helper so SKILL.md lands at the zip root
rem with forward-slash entry paths, exactly as Claude's skill uploader expects.
powershell -NoProfile -ExecutionPolicy Bypass -File "%ROOT%prepare-claude-zip.ps1" -Source "%CLAUDE_SRC%" -Destination "%CLAUDE_ZIP%"

if errorlevel 1 exit /b %errorlevel%

echo Created %CLAUDE_ZIP%
