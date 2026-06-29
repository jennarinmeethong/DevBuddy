# DevBuddy Install Packages

This folder contains the Claude install-ready package layout.

## Claude

Package root: `packages/claude/devbuddy/`

Generated skill install zip: `packages/devbuddy-claude.zip`

The zip contains a top-level `devbuddy/` skill folder built from `packages/claude/devbuddy/skill/`, so it can be installed as a Claude skill without manually zipping the `skill` folder.

For Claude Code project agents, copy these folders into a project root:

```text
<project>/.claude/agents/
<project>/skill/
```

The Claude package includes `.claude/agents/` plus the shared `skill/` folder those agents read from.

## Maintenance

Edit the source folders at the repository root first:

- `skill/` for shared behavior and Claude skill content.
- `.claude/agents/` for Claude-specific agent prompts.

After changing source files, rebuild the package folder before zipping. Zip archives such as `devbuddy-claude.zip` are rebuildable distribution artifacts and are intentionally ignored by git.

From the repository root, run `prepare-zips.bat` on Windows or `./prepare-zips.sh` in a bash-compatible shell to create the Claude skill archive.
