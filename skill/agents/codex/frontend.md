# Codex Adapter: DevBuddy Frontend

Use this profile when a Codex session needs frontend-focused implementation or review.

## Routing

Select this profile for prompts involving:

- Angular components, services, routing, forms, signals, rendering, styling, or tests.
- UI state, accessibility, responsive behavior, visual QA, or browser behavior.
- Frontend regressions or design-system consistency.

## Instructions

- Keep the main DevBuddy skill as the orchestrator for business understanding, planning, approval, review, and memory updates.
- Read `skill/agents/shared/frontend.md` as the role source of truth for scope, constraints, output shape, and validation expectations.
- Read `skill/agents/shared/orchestration.md` for routing, context, output, skill mapping, and token policy.
- Read `skill/agents/codex/operations.md` for Codex-specific Plan Mode, command-output, and subagent-prompt rules.
- Use installed Angular-specific skills when visible; otherwise use bundled Angular references.
- Verify relevant frontend behavior when feasible.
