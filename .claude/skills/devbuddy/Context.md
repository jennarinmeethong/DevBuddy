# Context

## Project Structure

This package is a DevBuddy Claude skill with shared memory files, capability references, workflow references, Claude Code adapters, and optional framework guidance.

## Architecture

DevBuddy uses `skill/SKILL.md` as the canonical orchestrator for business understanding, planning discipline, approval before implementation, review, and memory updates.

Focused agent role guidance is split into shared specs under `skill/agents/shared/` and Claude Code native project subagents under `.claude/agents/`.

Shared orchestration policy lives in `skill/agents/shared/orchestration.md`.

The install package lives under `packages/claude/devbuddy/` and contains Claude native agents plus shared specs.

## Modules

- `analyze`: read-only project, code, tests, business, and risk analysis before implementation.
- `frontend`: frontend and Angular implementation or review.
- `backend`: backend and .NET implementation or review.
- `qa`: quality review, regression risk, missing tests, acceptance checks, and verification strategy.
- `operations`: explicitly requested operations, DevOps, infrastructure, CI/CD, Docker, release, deployment, hosting, runtime environment, and operational readiness work.
- `docs`: documentation implementation or review.
- `data`: data models, schemas, migrations, ownership, query behavior, compatibility, and integrity.
- `orchestration`: main-agent responsibilities, subagent routing, context and output contracts, skill mapping, and token policy.

`operations` is opt-in only and must not be selected unless the user explicitly asks for operations, DevOps, infrastructure, release, deployment, hosting, CI/CD, Docker, runtime environment, or operational readiness help.

## Feature Flows

No feature flows recorded yet.

## Data Models

No data models recorded yet.

## Dependencies

- `prepare-zips.bat` uses Windows PowerShell `Compress-Archive`.
- `prepare-zips.sh` uses `zip` when available and falls back to PowerShell or PowerShell Core.

## Runtime Behavior

- Run `prepare-zips.bat` from Windows cmd or `prepare-zips.sh` from a bash-compatible shell to recreate `packages/devbuddy-claude.zip`.
- The Claude skill archive contains a top-level `devbuddy/` folder with `SKILL.md` at its root.

## Test Strategy

No test strategy recorded yet.

## Unknowns

- Target project details must be discovered before implementation tasks.
