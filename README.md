# DevBuddy

DevBuddy is a senior-engineering workflow skill for AI coding assistants. It helps an agent understand business intent, project architecture, risks, and tests before making code changes.

## Source

- `skill/` is the canonical shared skill source. Edit skill content here.
- `skill/SKILL.md` is the Claude skill entrypoint.
- `.claude/skills/devbuddy/` is the project-local Claude Code skill path that enables `/devbuddy`. It is a mirror of `skill/` (plus this repo's own live memory).
- `packages/claude/devbuddy/skill/` is the packaged mirror of `skill/`.
- `skill/agents/shared/` contains role guidance used by the skill and Claude subagents.
- `.claude/agents/` contains Claude Code project subagent adapters.

### Keeping the mirrors in sync

After editing `skill/`, propagate it to the two mirrors with:

```bash
./sync-sources.sh
```

```bat
sync-sources.bat
```

This copies everything except the per-project memory files (`Context.md`, `BusinessContext.md`, `DecisionLog.md`, `KnowledgeBase.md`, `plan.md`), which are runtime state and diverge legitimately per install. `prepare-zips` runs the sync automatically before building, so the archive is never built from a stale copy.

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

By default these files live next to the installed `SKILL.md` (co-located with the skill). To relocate memory, add a `devbuddy.config.md` file at the project root (preferred, so it is committed and the project remembers its location) with one of:

- `memory_root:` — a path relative to the project root, e.g. `docs/devbuddy/`.
- `obsidian_vault:` (plus optional `obsidian_subfolder:`) — an Obsidian vault path. Memory is then stored in the vault in Obsidian-native form (YAML frontmatter, `[[wikilinks]]` between notes, and a per-project index note). Only the `devbuddy.config.md` pointer is committed; the memory content lives in the vault.

See `templates/devbuddy-config-template.md` and the `Memory Location` section in `SKILL.md` for the resolution order and Obsidian-mode rules.

Package copies and `.claude/skills/devbuddy/` should stay aligned with the source when package layouts are rebuilt.
