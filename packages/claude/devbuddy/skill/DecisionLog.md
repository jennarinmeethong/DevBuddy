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

Date: 2026-06-21
Decision: Split DevBuddy role guidance into analyze, frontend, and backend agent profiles with platform adapters.
Context: Users want Codex and Claude workflows to delegate analysis, frontend, and backend work to focused roles while preserving DevBuddy's senior-engineer workflow and shared project memory.
Alternatives: Keep all role guidance only inside `SKILL.md`; create separate standalone skills for each role; create only Claude subagents without Codex routing.
Trade-offs: Shared specs plus adapters add a small amount of structure to maintain, but avoid duplicating prompts and prevent platform-specific subagent assumptions from leaking across runtimes.
Outcome: Add shared role specs under `agents/shared/`, Claude native subagents under `.claude/agents/`, and Codex routing/profile adapters under `agents/openai.yaml` and `agents/codex/`.

Date: 2026-06-21
Decision: Add explicit DevBuddy orchestration, context contract, output contract, skill mapping, and token policy.
Context: Focused agent profiles existed, but the rules for when the main agent should route work, what context to pass, and how to keep outputs compact were implicit.
Alternatives: Keep routing as informal conversation guidance; duplicate routing rules in every role profile; make Codex-specific behavior part of shared specs.
Trade-offs: A new shared policy file adds one more reference to maintain, but keeps role files concise and prevents repeated or platform-specific instructions.
Outcome: Add `agents/shared/orchestration.md`, add Codex-specific operational guidance in `agents/codex/operations.md`, and link both from relevant profiles.

Date: 2026-06-22
Decision: Add QA, operations, docs, and data DevBuddy subagent profiles while keeping operations explicit-use only.
Context: Existing analyze, frontend, and backend profiles covered primary discovery and implementation work, but quality review, operational work, documentation, and data-focused changes benefit from narrower role guidance. Operations work is higher-risk and should not be selected just because a task touches builds, scripts, backend configuration, Dockerfiles, or deployment-adjacent files.
Alternatives: Keep all new responsibilities inside existing profiles; add only QA; make operations route automatically from deployment-adjacent files.
Trade-offs: More role files increase adapter maintenance, but shared specs keep behavior consistent and focused. Requiring explicit operations intent may route some ambiguous tasks through backend or QA first, but prevents accidental infrastructure changes.
Outcome: Add shared, Codex, and Claude profiles for `qa`, `operations`, `docs`, and `data`; point the Codex operations role to `agents/codex/operations-profile.md`; document the operations opt-in rule in orchestration, routing metadata, and primary docs.

Date: 2026-06-22
Decision: Keep Codex and Claude subagent install packages separated while sharing role specs.
Context: DevBuddy maintains shared role behavior in one source tree, but users need platform-specific subagent packages so Claude installs do not carry Codex routing files and Codex installs do not carry Claude native agents.
Alternatives: Include all adapters in every package; duplicate shared specs separately per platform.
Trade-offs: Separate packages require package snapshot maintenance, but avoid platform leakage and keep shared behavior consistent.
Outcome: Codex package contains `agents/openai.yaml`, `agents/codex/`, and `agents/shared/`; Claude package contains `.claude/agents/` and `skill/agents/shared/` without Codex routing metadata or Codex adapter files.

Date: 2026-06-22
Decision: Generate separate Claude skill and Claude project archives from package scripts.
Context: The previous Claude archive bundled `.claude/agents/` and `skill/`, which was useful as a project bundle but was not directly installable as a Claude skill without manually zipping the `skill` folder.
Alternatives: Keep only the project bundle; replace the project bundle entirely with a skill archive.
Trade-offs: Producing one additional archive adds a small packaging artifact, but preserves Claude Code project-agent installation while making Claude skill installation direct.
Outcome: `devbuddy-claude.zip` is now a Claude skill install archive with a top-level `devbuddy/` skill folder, and `devbuddy-claude-project.zip` keeps the project bundle containing `.claude/agents/` plus `skill/`.

Use this format:

```text
Date:
Decision:
Context:
Alternatives:
Trade-offs:
Outcome:
```
