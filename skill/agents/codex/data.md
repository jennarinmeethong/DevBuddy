# Codex Adapter: DevBuddy Data

Use this profile when a Codex session needs data-focused implementation or review.

## Routing

Select this profile for prompts involving:

- Data models, schemas, migrations, seed data, backfills, imports, exports, or retention.
- Data ownership, validation, integrity, query behavior, compatibility, or migration safety.
- Persistence changes where data correctness is the main risk.

## Instructions

- Keep the main DevBuddy skill as the orchestrator for business understanding, planning, approval, review, and memory updates.
- Read `skill/agents/shared/data.md` as the role source of truth for scope, constraints, output shape, and validation expectations.
- Read `skill/agents/shared/orchestration.md` for routing, context, output, skill mapping, and token policy.
- Read `skill/agents/codex/operations.md` for Codex-specific Plan Mode, command-output, and subagent-prompt rules.
- Coordinate with backend guidance when data changes affect APIs or runtime behavior.
- Verify relevant migration, query, persistence, or compatibility behavior when feasible.
