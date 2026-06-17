# Skill Implementation Plan

## Business Summary

Provide a reusable, platform-independent senior developer workflow for AI coding assistants. The skill helps agents understand business intent, architecture, and risks before implementation.

## Technical Summary

The skill package contains:

- A Codex-compatible `SKILL.md`.
- A cross-platform `skill.md`.
- Persistent memory files for technical context, business context, decisions, and learning.
- Focused principle, capability, workflow, and template documents.
- ADR and report folders for durable records.

## Affected Files

The skill package is self-contained under this directory.

## Risks

LOW: the package is documentation and workflow guidance only. Its main risk is overloading agents with too much process, so files are intentionally concise.

## Alternatives

The chosen approach uses focused Markdown files to support progressive disclosure. A single large file was rejected because it would be harder for agents to load selectively.

## Open Questions

- Whether future consumers need platform-specific adapters for assistants other than Codex.

## Confidence Level

HIGH: the package follows the requested structure and includes Codex-compatible metadata.

## Recommendation

Use `SKILL.md` for Codex and `skill.md` for platform-independent assistants.

