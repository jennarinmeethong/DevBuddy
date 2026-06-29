# DevBuddy

DevBuddy is a senior-engineering workflow skill for AI coding assistants. It helps an agent understand business intent, project architecture, risks, and tests before making code changes.

## Source

- `skill/` is the canonical shared skill source.
- `skill/SKILL.md` is the Claude skill entrypoint.
- `.claude/skills/devbuddy/` is the project-local Claude Code skill path that enables `/devbuddy`.
- `skill/agents/shared/` contains role guidance used by the skill and Claude subagents.
- `.claude/agents/` contains Claude Code project subagent adapters.

## Packages

Install-ready package layouts live under `packages/claude/devbuddy/`.

Claude Code does not auto-load `packages/devbuddy-claude.zip` from the repo. To use `/devbuddy` in the Claude Code terminal, the skill must exist at one of these paths:

```text
<project>/.claude/skills/devbuddy/SKILL.md
~/.claude/skills/devbuddy/SKILL.md
```

This repo includes the project-local path. If Claude Code was already open before `.claude/skills/` existed, restart Claude Code from the repo root.

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

Package copies and `.claude/skills/devbuddy/` should stay aligned with the source when package layouts are rebuilt.
