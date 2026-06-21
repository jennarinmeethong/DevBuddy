# Context

## Project Structure

This package is a DevBuddy skill with shared memory files, capability references, workflow references, platform adapters, and optional framework guidance.

## Architecture

DevBuddy uses `SKILL.md` as the canonical orchestrator for business understanding, planning discipline, approval before implementation, review, and memory updates.

Focused agent role guidance is split into shared specs under `agents/shared/`, Codex adapters under `agents/codex/` with routing metadata in `agents/openai.yaml`.

## Modules

- `analyze`: read-only project, code, tests, business, and risk analysis before implementation.
- `frontend`: frontend and Angular implementation or review.
- `backend`: backend and .NET implementation or review.

## Feature Flows

No feature flows recorded yet.

## Data Models

No data models recorded yet.

## Dependencies

No dependencies recorded yet.

## Runtime Behavior

No runtime behavior recorded yet.

## Test Strategy

No test strategy recorded yet.

## Unknowns

- Target project details must be discovered before implementation tasks.

