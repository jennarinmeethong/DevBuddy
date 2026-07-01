@echo off
setlocal

rem Propagate the canonical skill source (skill\) to the two mirror trees:
rem   - .claude\skills\devbuddy\        (what /devbuddy runs in this repo)
rem   - packages\claude\devbuddy\skill\ (the packaged copy)
rem
rem Per-project memory files are runtime state and diverge legitimately per
rem install, so they are never overwritten. Everything else must stay identical
rem across the three trees; edit skill\ and run this script to sync.

set "ROOT=%~dp0"
set "SRC=%ROOT%skill"

if not exist "%SRC%\SKILL.md" (
  echo Missing canonical skill source: %SRC%
  exit /b 1
)

rem /E copy subdirs incl. empty; /XF excludes memory files; /XF .DS_Store too.
rem No purge: live-only artifacts (reports\, extra memory) are preserved.
set "EXCLUDES=/XF Context.md BusinessContext.md DecisionLog.md KnowledgeBase.md plan.md .DS_Store"

for %%D in (
  "%ROOT%.claude\skills\devbuddy"
  "%ROOT%packages\claude\devbuddy\skill"
) do (
  robocopy "%SRC%" "%%~D" /E %EXCLUDES% >nul
  if errorlevel 8 (
    echo robocopy failed syncing to %%~D
    exit /b 1
  )
  echo Synced skill\ -^> %%~D
)

echo Sync complete. Memory files were preserved in each mirror.
exit /b 0
