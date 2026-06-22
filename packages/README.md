# DevBuddy Install Packages

This folder contains install-ready package layouts for each supported assistant.

## Codex

Package root: `packages/codex/devbuddy/`

Generated install zip: `packages/devbuddy-codex.zip`

The zip contains a top-level `devbuddy/` skill folder. Use it directly with Codex skill installation, or copy `packages/codex/devbuddy/` directly to the Codex skills directory:

```text
~/.codex/skills/devbuddy/
```

The folder is a Codex skill root and contains `SKILL.md`, `agents/openai.yaml`, `agents/codex/`, `agents/shared/`, workflows, capabilities, references, templates, and memory files. It does not include Claude native `.claude/agents/`.

## Claude

Package root: `packages/claude/devbuddy/`

Generated skill install zip: `packages/devbuddy-claude.zip`

The zip contains a top-level `devbuddy/` skill folder built from `packages/claude/devbuddy/skill/`, so it can be installed as a Claude skill without manually zipping the `skill` folder.

Generated project bundle zip: `packages/devbuddy-claude-project.zip`

Use the project bundle when you want Claude Code native agents plus the shared skill folder in a project root:

```text
<project>/.claude/agents/
<project>/skill/
```

The Claude project package includes `.claude/agents/` plus the shared `skill/` folder those agents read from. The Claude package keeps only shared role specs under `skill/agents/shared/`; it does not include Codex routing metadata or Codex adapter prompts.

## Maintenance

Edit the source folders at the repository root first:

- `skill/` for shared behavior and Codex skill content.
- `.claude/agents/` for Claude-specific agent prompts.

After changing source files, rebuild these package folders before zipping. Zip archives such as `devbuddy-codex.zip` and `devbuddy-claude.zip` are rebuildable distribution artifacts and are intentionally ignored by git.

From the repository root, run `prepare-zips.bat` on Windows or `./prepare-zips.sh` in a bash-compatible shell to create Codex, Claude skill, and Claude project archives.
