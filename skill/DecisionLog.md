# Decision Log

## Decisions

Date: 2026-06-17
Decision: Keep the senior developer skill framework-neutral while adding Angular as progressive capability and reference guidance.
Context: Angular guidance is useful for Angular tasks, but loading all Angular details for every coding task would make the general workflow noisy.
Alternatives: Convert the skill into an Angular-only skill; keep Angular as separate unrelated skills.
Trade-offs: Progressive references require one extra selection step, but preserve broad usefulness and reduce unnecessary context.
Outcome: Add Angular trigger text, one Angular project capability, one new-app workflow, and topic-specific Angular references.

Date: 2026-06-17
Decision: Add .NET as progressive capability guidance rather than embedding the full .NET skill set into the main skill file.
Context: The source .NET skill collection is broad and domain-specific, covering C#, ASP.NET Core, EF Core, MSBuild, testing, diagnostics, MAUI, Blazor, NuGet, AI, and upgrades. Loading all details for every coding task would make the senior developer workflow noisy.
Alternatives: Copy the .NET skills wholesale into this package; create one large .NET reference file; keep .NET guidance outside this skill.
Trade-offs: Topic-specific references require an extra selection step, but preserve the broad senior-developer workflow and keep context use proportional to the task.
Outcome: Add .NET trigger text, one .NET project capability, one new-app workflow, and topic-specific .NET references.

Date: 2026-06-17
Decision: Treat installed Angular and .NET specialized skills as optional delegation targets, not required dependencies.
Context: This skill bundles enough Angular and .NET guidance to work independently, but users may later install more specific skills that contain deeper procedures, scripts, or newer framework knowledge.
Alternatives: Require users to install Angular/.NET skills separately; ignore specialized skills even when present.
Trade-offs: Optional delegation adds one selection step, but keeps the skill self-contained while allowing deeper installed skills to take precedence when available.
Outcome: Add delegation guidance that prefers matching specialized skills when exposed in the current session and falls back to bundled references otherwise.

Use this format:

```text
Date:
Decision:
Context:
Alternatives:
Trade-offs:
Outcome:
```
