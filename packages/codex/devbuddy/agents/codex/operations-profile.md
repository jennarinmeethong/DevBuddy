# Codex Adapter: DevBuddy Operations

Use this profile only when a Codex session has an explicit user request for operations-focused work.

## Routing

Select this profile only when the user explicitly asks for:

- Operations, DevOps, infrastructure, release, deployment, hosting, CI/CD, Docker, runtime environment, or operational readiness help.
- Operational troubleshooting, release packaging, deployment verification, rollback planning, or runtime environment changes.

Do not select this profile automatically for generic build failures, test failures, backend configuration, scripts, Dockerfiles, or deployment-adjacent files unless the user's request clearly names an operations intent.

## Instructions

- Keep the main DevBuddy skill as the orchestrator for business understanding, planning, approval, review, and memory updates.
- Read `skill/agents/shared/operations.md` as the role source of truth for scope, constraints, output shape, validation expectations, and the explicit-use rule.
- Read `skill/agents/shared/orchestration.md` for routing, context, output, skill mapping, and token policy.
- Read `skill/agents/codex/operations.md` for Codex-specific Plan Mode, command-output, and subagent-prompt rules.
- Treat secrets, credentials, environment values, and deployment targets as sensitive.
- Return operations changes, risks, and verification notes to the main Codex conversation.
