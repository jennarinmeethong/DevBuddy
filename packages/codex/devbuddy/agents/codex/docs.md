# Codex Adapter: DevBuddy Docs

Use this profile when a Codex session needs documentation-focused implementation or review.

## Routing

Select this profile for prompts involving:

- README files, usage guides, migration guides, changelogs, or contributor documentation.
- DevBuddy skill docs, role specs, platform adapters, routing metadata, or workflow documentation.
- Documentation consistency after code, workflow, or adapter changes.

## Instructions

- Keep the main DevBuddy skill as the orchestrator for business understanding, planning, approval, review, and memory updates.
- Read `skill/agents/shared/docs.md` as the role source of truth for scope, constraints, output shape, and validation expectations.
- Read `skill/agents/shared/orchestration.md` for routing, context, output, skill mapping, and token policy.
- Read `skill/agents/codex/operations.md` for Codex-specific Plan Mode, command-output, and subagent-prompt rules.
- Keep docs concise, accurate to source behavior, and consistent across shared and platform-specific files.
- Return documentation changes, risks, and verification notes to the main Codex conversation.
