# Skill Implementation Plan

## Business Summary

Provide a reusable, platform-independent senior developer workflow for AI coding assistants. The skill helps agents understand business intent, architecture, and risks before implementation.

## Technical Summary

The skill package contains:

- A Claude-compatible `SKILL.md`.
- Persistent memory files for technical context, business context, decisions, and learning.
- Focused principle, capability, workflow, and template documents.
- Progressive Angular capability, workflow, and reference documents for Angular-specific tasks.
- Progressive .NET capability, workflow, and reference documents for .NET-specific tasks.
- ADR and report folders for durable records.

## Affected Files

The skill package is self-contained under this directory.

## Risks

LOW: the package is documentation and workflow guidance only. Its main risk is overloading agents with too much process, so general workflow files stay concise and Angular/.NET details load only when relevant.

## Alternatives

The chosen approach uses focused Markdown files to support progressive disclosure. A single large file was rejected because it would be harder for agents to load selectively.

## Open Questions

- Whether future consumers need additional Claude Code subagent profiles.

## Confidence Level

HIGH: the package follows the requested structure and includes Claude-compatible metadata.

## Recommendation

Use `SKILL.md` as the Claude skill entrypoint.
