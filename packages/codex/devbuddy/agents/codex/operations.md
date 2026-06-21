# Codex Adapter Operations

## Purpose

Apply DevBuddy orchestration inside Codex without leaking Codex-specific mechanics into shared role specs.

## Plan Mode

- Treat Plan Mode as read-only for repository-tracked files.
- Use subagents only for non-mutating discovery, validation, and risk analysis while Plan Mode is active.
- Produce an approval-ready plan before implementation when the active collaboration mode requires it.

## Command Output

- Prefer `rg` or `rg --files` for discovery.
- When a workspace instructs command prefixing, preserve that convention.
- With RTK on PowerShell, call PowerShell cmdlets through `rtk proxy powershell -NoProfile -Command "..."`.
- Summarize command output in the conversation unless the user explicitly asks for raw output.

## Codex Subagent Prompts

Keep prompts short and bounded:

- Name the role profile to use.
- Provide only the relevant files, folders, or symbols.
- State whether edits are allowed.
- Request the shared output contract from `agents/shared/orchestration.md`.

The main Codex conversation remains responsible for final decisions, user communication, and memory updates.
