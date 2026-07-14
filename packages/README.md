# DevBuddy Install Packages

This folder contains the Claude distribution package layout.

## Claude

This project produces **two** Claude artifacts. They serve different install paths, so pick the one that matches how you want to use DevBuddy.

### Artifact 1 — the skill zip: `packages/devbuddy-claude.zip`

Use this to install the `/devbuddy` skill itself. It is built from the project-local skill at `.claude/skills/devbuddy/`. Per Claude's skill-upload rule, `SKILL.md` sits at the **root** of the archive (no wrapping folder) with forward-slash entry paths, so it can be uploaded to Claude directly or extracted straight into a skill directory.

Claude Code does not auto-load the zip from `packages/`. **Extract its contents** so that `SKILL.md` lands directly under the skill folder:

```text
<project>/.claude/skills/devbuddy/SKILL.md      # per-project install
~/.claude/skills/devbuddy/SKILL.md              # global install
```

Because `SKILL.md` is at the zip root, extracting the zip **into** `.claude/skills/devbuddy/` produces exactly this layout. Restart Claude Code if `.claude/skills/` did not exist when the session started.

### Artifact 2 — the project-agents bundle: `packages/claude/devbuddy/`

This folder is **not** a skill folder (it has no root `SKILL.md`, and Claude would not load it as one). It is a staging bundle for the DevBuddy subagents plus the shared content they read. It holds two things you copy into a project root separately:

| Copy this from the bundle | To this destination | Purpose |
|---|---|---|
| `packages/claude/devbuddy/.claude/agents/` | `<project>/.claude/agents/` | The 10 `devbuddy-*` project subagents Claude Code registers. |
| `packages/claude/devbuddy/skill/` | `<project>/skill/` | The shared workflow/reference content those subagents read from. |

Note the two artifacts overlap on purpose: `.claude/skills/devbuddy/` (Artifact 1) and `packages/claude/devbuddy/skill/` (Artifact 2) are both mirrors of the canonical `skill/` source, kept in sync by `sync-sources`. Subagents live only in Artifact 2 because a skill zip installs to `.claude/skills/<name>/` and cannot place files into a project's `.claude/agents/`.

## Maintenance

Edit the **canonical source** at the repository root first — never edit the mirrors directly:

- `skill/` — shared behavior and Claude skill content (the single source of truth).
- `.claude/agents/` — Claude-specific subagent prompts.

`sync-sources` then propagates `skill/` into the two mirror trees, `.claude/skills/devbuddy/` and `packages/claude/devbuddy/skill/` (per-project memory files are preserved, not overwritten).

From the repository root run `prepare-zips.bat` (Windows) or `./prepare-zips.sh` (bash). Each script runs `sync-sources` first so the archive is never made from a stale mirror, then builds `packages/devbuddy-claude.zip`. Both guarantee the same Claude-compatible layout (`SKILL.md` at the root, forward-slash paths): `prepare-zips.sh` uses `zip` when available, and both fall back to the shared `prepare-claude-zip.ps1` helper otherwise. Zip archives are rebuildable artifacts and are intentionally ignored by git.
