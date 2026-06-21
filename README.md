# DevBuddy

DevBuddy is a senior-engineering workflow skill for AI coding assistants. It helps an agent understand business intent, project architecture, risks, and tests before making code changes.

## Source

- `skill/` is the canonical shared skill source.
- `skill/SKILL.md` is the Codex entrypoint.
- `skill/agents/shared/` contains role guidance shared across platforms.
- `.claude/agents/` contains Claude Code project subagent adapters.

## Packages

Install-ready package layouts live under `packages/`:

- `packages/codex/devbuddy/`
- `packages/claude/devbuddy/`

Edit source files first, then rebuild package layouts and archives from the updated source. Rebuildable zip archives are intentionally ignored by git.

Create distribution archives from the repository root:

```bash
./prepare-zips.sh
```

```bat
prepare-zips.bat
```

## Memory

DevBuddy keeps durable project knowledge in:

- `skill/Context.md`
- `skill/BusinessContext.md`
- `skill/DecisionLog.md`
- `skill/KnowledgeBase.md`

Package copies of these files should stay aligned with the source when package layouts are rebuilt.
