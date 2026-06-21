# DevBuddy Agent Orchestration

## Purpose

Keep DevBuddy's main agent responsible for business understanding, planning, approval, implementation discipline, review, and memory updates while using focused agents only when they reduce risk or context load.

## Main Agent Responsibilities

- Read the user request, DevBuddy entrypoint, memory, ADRs, and relevant source before planning.
- Decide whether the work is small enough to handle directly or large enough to route through a focused role.
- Provide subagents only the goal, relevant paths or areas, constraints, and expected output.
- Integrate subagent findings into one business-aware plan or final answer.
- Preserve DevBuddy's memory, review, approval, and definition-of-done rules.

## Subagent Routing

Use a subagent when the task benefits from bounded, focused work:

- Use `analyze` for read-only discovery, affected-area mapping, risk discovery, and implementation planning.
- Use `frontend` for Angular, UI behavior, accessibility, responsive behavior, visual consistency, routing, state, forms, and frontend tests.
- Use `backend` for .NET, APIs, data models, persistence, runtime configuration, security, diagnostics, performance, and backend tests.

Avoid subagents when the task is narrow, the main agent already has enough context, or the routing overhead would exceed the benefit.

## Context Contract

When routing work, include only:

- The specific goal and success criteria.
- Relevant files, folders, symbols, commands, or user-facing workflow.
- Current mode and mutation constraints.
- Required output shape.
- Any known business rules, assumptions, or unresolved questions.

Do not send broad repository context, long logs, or unrelated memory unless it is required for correctness.

## Output Contract

Focused agents should return concise findings:

- Business and technical summary.
- Files or areas inspected.
- Findings with file references when applicable.
- Risks, unknowns, and confidence.
- Recommended next steps or tests.

Do not paste full files or long command output. Summarize evidence and cite the smallest useful reference.

## Skill Mapping

- Use DevBuddy for senior-engineering workflow, architecture, planning, implementation discipline, review, memory, Angular, and .NET.
- Use more specific installed Angular or .NET skills when available, then return to DevBuddy for trade-offs, review, and learning.
- Use document, PDF, spreadsheet, image, browser, OpenAI-docs, plugin, or skill-creation skills only when the task matches those domains.

## Token Policy

- Prefer targeted source inspection over broad reads.
- Search before opening large files.
- Load references only when the current task needs them.
- Keep subagent prompts narrow and outputs compact.
- Summarize logs and test output instead of copying them verbatim.
- Reuse existing findings rather than asking multiple agents to read the same files.
