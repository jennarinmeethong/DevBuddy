# DevBuddy Install Packages

This folder contains install-ready package layouts for each supported assistant.

## Codex

Package root: `packages/codex/devbuddy/`

Zip the `devbuddy` folder itself, or copy it directly to the Codex skills directory:

```text
~/.codex/skills/devbuddy/
```

The folder is a Codex skill root and contains `SKILL.md`, `agents/openai.yaml`, shared role specs, workflows, capabilities, references, templates, and memory files.

## Claude

Package root: `packages/claude/devbuddy/`

Zip the contents of this folder, or copy them into a project root:

```text
<project>/.claude/agents/
<project>/skill/
```

The Claude package includes `.claude/agents/` plus the shared `skill/` folder those agents read from.

## Maintenance

Edit the source folders at the repository root first:

- `skill/` for shared behavior and Codex skill content.
- `.claude/agents/` for Claude-specific agent prompts.

After changing source files, rebuild these package folders before zipping. Zip archives such as `devbuddy-codex.zip` and `devbuddy-claude.zip` are rebuildable distribution artifacts and are intentionally ignored by git.
