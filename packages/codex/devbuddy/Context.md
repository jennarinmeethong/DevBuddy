# Context

## Project Structure

This package is a DevBuddy skill with shared memory files, capability references, workflow references, platform adapters, and optional framework guidance.

## Architecture

DevBuddy uses `SKILL.md` as the canonical orchestrator for business understanding, planning discipline, approval before implementation, review, and memory updates.

Focused agent role guidance is split into shared specs under `agents/shared/`, Codex adapters under `agents/codex/` with routing metadata in `agents/openai.yaml`.

Shared orchestration policy lives in `agents/shared/orchestration.md`. Codex-specific operational rules live in `agents/codex/operations.md`.

## Modules

- `analyze`: read-only project, code, tests, business, and risk analysis before implementation.
- `frontend`: frontend and Angular implementation or review.
- `backend`: backend and .NET implementation or review.
- `orchestration`: main-agent responsibilities, subagent routing, context and output contracts, skill mapping, and token policy.

## Feature Flows

No feature flows recorded yet.

## Data Models

No data models recorded yet.

## Dependencies

- `prepare-zips.bat` uses Windows PowerShell `Compress-Archive`.
- `prepare-zips.sh` uses `zip` when available and falls back to PowerShell or PowerShell Core.

## Runtime Behavior

- Run `prepare-zips.bat` from Windows cmd or `prepare-zips.sh` from a bash-compatible shell to recreate `packages/devbuddy-codex.zip` and `packages/devbuddy-claude.zip`.
- The Codex archive contains the `devbuddy/` folder as its root. The Claude archive contains `.claude/` and `skill/` at its root.

## Test Strategy

No test strategy recorded yet.

## Unknowns

- Target project details must be discovered before implementation tasks.

