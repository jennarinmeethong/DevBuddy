# DevBuddy

This skill guides AI coding assistants to behave like senior engineers: understand business intent and architecture first, plan before implementation, make minimal maintainable changes, review critically, and preserve project knowledge.

It also includes progressive Angular and .NET guidance for framework-specific projects and new app setup, loaded only when relevant.

It is packaged as a Claude skill. The canonical entrypoint is `SKILL.md`.

## Agent Profiles

DevBuddy defines ten role profiles that share the same memory files and senior-engineer workflow:

- `analyze`: read-only project, code, tests, business, and risk analysis before implementation.
- `ba`: business requirements, stakeholders, workflows, domain rules, acceptance criteria, priorities, and business readiness.
- `sa`: system analysis, architecture boundaries, module responsibilities, integrations, data flow, runtime behavior, non-functional requirements, and architecture risks.
- `frontend`: frontend and Angular work, including UI behavior, accessibility, styling, state, routing, forms, and tests.
- `backend`: backend and .NET work, including APIs, data models, persistence, runtime behavior, diagnostics, security, performance, and tests.
- `qa`: post-change quality review, regression risk, test gaps, acceptance checks, and verification strategy.
- `tester`: test case design, manual or automated test execution, defect reproduction, test data, acceptance validation, regression suites, and test evidence summaries.
- `operations`: explicitly requested operations, DevOps, infrastructure, CI/CD, Docker, release, deployment, hosting, runtime environment, and operational readiness work.
- `docs`: README files, usage guides, migration notes, changelogs, skill docs, adapter docs, and documentation consistency.
- `data`: data models, schema changes, migrations, data ownership, query behavior, compatibility, and data integrity.

`operations` is opt-in only. Use it only when the user explicitly asks for operations, DevOps, infrastructure, release, deployment, hosting, CI/CD, Docker, runtime environment, or operational readiness help.

Shared role specs live in `agents/shared/`.

## Claude Code Adapters

Claude Code can use native project subagents from `.claude/agents/`:

- `devbuddy-analyze`
- `devbuddy-ba`
- `devbuddy-sa`
- `devbuddy-frontend`
- `devbuddy-backend`
- `devbuddy-qa`
- `devbuddy-tester`
- `devbuddy-operations`
- `devbuddy-docs`
- `devbuddy-data`

`SKILL.md` remains responsible for business understanding, planning discipline, approval before implementation when required, review, and memory updates.

The Claude package contains `.claude/agents/` and `skill/agents/shared/`.

## Adapter Maintenance

DevBuddy is maintained as one conceptual skill with shared core behavior and Claude Code adapters.

- Shared source of truth: `SKILL.md`, memory files, `workflows/`, `capabilities/`, `references/`, and `agents/shared/`.
- Claude adapter source: `.claude/agents/`.
- For shared behavior changes, update the shared source first, then review the corresponding Claude adapters.
- For Claude-only mechanics, update only the Claude adapter and leave shared behavior unchanged.

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

## Loop Engineering

For repetitive, verification-driven work, DevBuddy can run an autonomous `execute -> verify -> refine` loop:

- Run `/devbuddy loop ...` (or ask to "keep going until" a condition holds) to start it directly.
- When a task looks loop-shaped but you did not ask for a loop, DevBuddy explains why and asks before entering — it does not auto-start.
- Every loop defines a testable exit condition and a max iteration count up front, and stops to ask when progress stalls or the next step is hard to reverse. See `workflows/loop-workflow.md`.

## Reusable Tools

When a task will recur, DevBuddy can capture it as a small, parameterized tool instead of redoing the work by hand:

- Tools are built only for genuinely recurring work (the last resort in the `Delete -> Simplify -> Reuse -> Refactor -> Build` order).
- Python is preferred; if it is missing, DevBuddy asks which SDKs/runtimes the machine has and picks an installed language.
- Generated tools live in a `tools/` folder at the project memory root (beside `Context.md`), indexed in `tools/README.md`. They are project-local and are not synced with the skill. See `references/reusable-tools.md`.

## Model Selection

DevBuddy's orchestrator can choose a model per subagent call instead of always inheriting the caller's model:

- Default stays `inherit`; the main agent only overrides when a task is clearly simple/routine (lighter model) or complex/high-risk (stronger model), never on a hunch.
- Per-role heuristics live in `agents/shared/orchestration.md`. `.claude/agents/*` frontmatter stays `model: inherit` — the override happens at call time via the Agent-tool's `model` parameter, not by editing the agent files.

## Memory Files

- `Context.md`: technical project understanding.
- `BusinessContext.md`: business and domain understanding.
- `DecisionLog.md`: durable engineering decisions.
- `KnowledgeBase.md`: lessons learned and reusable knowledge.
