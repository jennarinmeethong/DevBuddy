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

Date: 2026-06-17
Decision: Add an optional specialized skill catalog as a bundled reference.
Context: Users may want to install Angular or .NET skills separately later, and agents need a stable place to map specialized topics to optional skills without relying on a temporary source checkout.
Alternatives: Leave the mapping only in conversation history; add install instructions as a README; hardcode all specialized skill names into SKILL.md.
Trade-offs: A reference file adds one more document to maintain, but keeps SKILL.md concise and avoids treating specialized skills as required dependencies.
Outcome: Add `references/optional-specialized-skills.md` and link it from delegation guidance and Angular/.NET capabilities.

Date: 2026-06-17
Decision: Record upstream source collections for optional Angular and .NET skills.
Context: Optional specialized skill guidance should make the upstream source repositories discoverable without making runtime behavior depend on temporary local checkouts.
Alternatives: Leave source links only in conversation history; duplicate the source URLs in each Angular/.NET reference file.
Trade-offs: A short source section adds minor maintenance overhead, but makes provenance visible where optional skill selection is documented.
Outcome: Add source links to `references/optional-specialized-skills.md` for `dotnet/skills` and `angular/skills`.

Use this format:

```text
Date:
Decision:
Context:
Alternatives:
Trade-offs:
Outcome:
```
