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
Decision: Split DevBuddy role guidance into analyze, frontend, and backend Claude Code agent profiles.
Context: Users want Claude workflows to delegate analysis, frontend, and backend work to focused roles while preserving DevBuddy's senior-engineer workflow and shared project memory.
Alternatives: Keep all role guidance only inside `SKILL.md`; create separate standalone skills for each role.
Trade-offs: Shared specs plus adapters add a small amount of structure to maintain, but avoid duplicating prompts.
Outcome: Add shared role specs under `agents/shared/` and Claude native subagents under `.claude/agents/`.

Date: 2026-06-21
Decision: Add explicit DevBuddy orchestration, context contract, output contract, skill mapping, and token policy.
Context: Focused agent profiles existed, but the rules for when the main agent should route work, what context to pass, and how to keep outputs compact were implicit.
Alternatives: Keep routing as informal conversation guidance; duplicate routing rules in every role profile.
Trade-offs: A new shared policy file adds one more reference to maintain, but keeps role files concise and prevents repeated or platform-specific instructions.
Outcome: Add `agents/shared/orchestration.md` and link it from relevant profiles.

Date: 2026-06-22
Decision: Add QA, operations, docs, and data DevBuddy subagent profiles while keeping operations explicit-use only.
Context: Existing analyze, frontend, and backend profiles covered primary discovery and implementation work, but quality review, operational work, documentation, and data-focused changes benefit from narrower role guidance. Operations work is higher-risk and should not be selected just because a task touches builds, scripts, backend configuration, Dockerfiles, or deployment-adjacent files.
Alternatives: Keep all new responsibilities inside existing profiles; add only QA; make operations route automatically from deployment-adjacent files.
Trade-offs: More role files increase adapter maintenance, but shared specs keep behavior consistent and focused. Requiring explicit operations intent may route some ambiguous tasks through backend or QA first, but prevents accidental infrastructure changes.
Outcome: Add shared and Claude profiles for `qa`, `operations`, `docs`, and `data`; document the operations opt-in rule in orchestration and primary docs.

Date: 2026-06-22
Decision: Keep the install package Claude-focused while sharing role specs.
Context: DevBuddy maintains shared role behavior in one source tree, and Claude installs should carry only Claude project agents plus shared role specs.
Alternatives: Include unused platform adapters in the package; duplicate shared specs in each agent prompt.
Trade-offs: A Claude-focused package is simpler to install and maintain, while shared specs still prevent prompt drift.
Outcome: The Claude package contains `.claude/agents/` and `skill/agents/shared/`.

Date: 2026-06-22
Decision: Generate a Claude skill archive from package scripts.
Context: The archive must be directly installable as a Claude skill and expose `/devbuddy`.
Alternatives: Zip the `skill/` folder directly; keep a project bundle archive.
Trade-offs: Building a temporary top-level `devbuddy/` folder avoids manual packaging mistakes and keeps the install archive focused.
Outcome: `devbuddy-claude.zip` is a Claude skill install archive with a top-level `devbuddy/` skill folder containing `SKILL.md`.

Date: 2026-06-29
Decision: Ask before switching command tools and prefer dedicated test folders for new tests.
Context: The user wants DevBuddy to avoid guessing alternative package managers or commands when a requested command is missing, and wants newly created tests separated into a folder layout similar to documentation.
Alternatives: Automatically try common alternatives such as `bun`, `yarn`, or `pnpm`; colocate new tests next to source files by default.
Trade-offs: Asking may add one interaction when local tooling is missing, but prevents unintended tool choices. A dedicated `tests/` folder improves separation, while existing intentional repository layouts still take precedence.
Outcome: Add command fallback and new-test placement conventions to `SKILL.md` and `workflows/implementation-workflow.md`.

Use this format:

```text
Date:
Decision:
Context:
Alternatives:
Trade-offs:
Outcome:
```
