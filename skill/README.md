# DevBuddy

This skill guides AI coding assistants to behave like senior engineers: understand business intent and architecture first, plan before implementation, make minimal maintainable changes, review critically, and preserve project knowledge.

It also includes progressive Angular and .NET guidance for framework-specific projects and new app setup, loaded only when relevant.

It is platform-independent. The canonical Codex entrypoint is `SKILL.md`; the cross-platform entrypoint is `skill.md`.

## Agent Profiles

DevBuddy defines seven role profiles that share the same memory files and senior-engineer workflow:

- `analyze`: read-only project, code, tests, business, and risk analysis before implementation.
- `frontend`: frontend and Angular work, including UI behavior, accessibility, styling, state, routing, forms, and tests.
- `backend`: backend and .NET work, including APIs, data models, persistence, runtime behavior, diagnostics, security, performance, and tests.
- `qa`: post-change quality review, regression risk, test gaps, acceptance checks, and verification strategy.
- `operations`: explicitly requested operations, DevOps, infrastructure, CI/CD, Docker, release, deployment, hosting, runtime environment, and operational readiness work.
- `docs`: README files, usage guides, migration notes, changelogs, skill docs, adapter docs, and documentation consistency.
- `data`: data models, schema changes, migrations, data ownership, query behavior, compatibility, and data integrity.

`operations` is opt-in only. Use it only when the user explicitly asks for operations, DevOps, infrastructure, release, deployment, hosting, CI/CD, Docker, runtime environment, or operational readiness help.

Shared role specs live in `agents/shared/`.

## Platform Adapters

Claude Code can use native project subagents from `.claude/agents/`:

- `devbuddy-analyze`
- `devbuddy-frontend`
- `devbuddy-backend`
- `devbuddy-qa`
- `devbuddy-operations`
- `devbuddy-docs`
- `devbuddy-data`

Codex uses the main DevBuddy skill as the orchestrator and routes work through the Codex adapter metadata in `agents/openai.yaml` plus the profile prompts in `agents/codex/`.

In both platforms, `SKILL.md` remains responsible for business understanding, planning discipline, approval before implementation when required, review, and memory updates.

Install packages are platform-specific. The Codex package contains `agents/openai.yaml`, `agents/codex/`, and `agents/shared/`; the Claude package contains `.claude/agents/` and `skill/agents/shared/` but does not include Codex adapter files.

## Adapter Maintenance

DevBuddy is maintained as one conceptual skill with shared core behavior and thin platform adapters.

- Shared source of truth: `SKILL.md`, memory files, `workflows/`, `capabilities/`, `references/`, and `agents/shared/`.
- Codex adapter source: `agents/openai.yaml` and `agents/codex/`.
- Claude adapter source: `.claude/agents/`.
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
