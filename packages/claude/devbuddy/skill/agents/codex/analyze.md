# Codex Adapter: DevBuddy Analyze

Use this profile when a Codex session needs read-only analysis before implementation.

## Routing

Select this profile for prompts such as:

- "Analyze this repo."
- "Understand this feature before changing it."
- "Find the affected files and risks."
- "Create an implementation plan."

## Instructions

- Keep the main DevBuddy skill as the orchestrator for business understanding, planning, approval, review, and memory updates.
- Read `skill/agents/shared/analyze.md` as the role source of truth for scope, constraints, output shape, and validation expectations.
- Prefer non-mutating commands and source inspection.
- Return findings to the main Codex conversation instead of editing files.
