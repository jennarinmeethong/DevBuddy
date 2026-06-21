# DevBuddy

This skill guides AI coding assistants to behave like senior engineers: understand business intent and architecture first, plan before implementation, make minimal maintainable changes, review critically, and preserve project knowledge.

It also includes progressive Angular and .NET guidance for framework-specific projects and new app setup, loaded only when relevant.

It is platform-independent. The canonical Codex entrypoint is `SKILL.md`; the cross-platform entrypoint is `skill.md`.

## Agent Profiles

DevBuddy defines three role profiles that share the same memory files and senior-engineer workflow:

- `analyze`: read-only project, code, tests, business, and risk analysis before implementation.
- `frontend`: frontend and Angular work, including UI behavior, accessibility, styling, state, routing, forms, and tests.
- `backend`: backend and .NET work, including APIs, data models, persistence, runtime behavior, diagnostics, security, performance, and tests.

Shared role specs live in `agents/shared/`.

## Platform Adapters

Claude Code can use native project subagents from `.claude/agents/`:

- `devbuddy-analyze`
- `devbuddy-frontend`
- `devbuddy-backend`

Codex uses the main DevBuddy skill as the orchestrator and routes work through the Codex adapter metadata in `agents/openai.yaml` plus the profile prompts in `agents/codex/`.

In both platforms, `SKILL.md` remains responsible for business understanding, planning discipline, approval before implementation when required, review, and memory updates.

## Adapter Maintenance

DevBuddy is maintained as one conceptual skill with shared core behavior and thin platform adapters.

- Shared source of truth: `SKILL.md`, memory files, `workflows/`, `capabilities/`, `references/`, and `agents/shared/`.
- Codex adapter: `agents/openai.yaml` and `agents/codex/`.
- Claude adapter: `.claude/agents/`.
- For shared behavior changes, update the shared source first, then review the corresponding Codex and Claude adapters.
- For platform-only mechanics, update only that platform adapter and leave shared behavior unchanged.

## Core Workflow

```text
Receive Request
Read Skill
Read Project Memory
Analyze Relevant Area
Identify Unknowns
Ask Material Questions
Create Plan
Wait For Approval
Implement Minimal Change
Review
Document Learning
Update Memory
```

## Memory Files

- `Context.md`: technical project understanding.
- `BusinessContext.md`: business and domain understanding.
- `DecisionLog.md`: durable engineering decisions.
- `KnowledgeBase.md`: lessons learned and reusable knowledge.
