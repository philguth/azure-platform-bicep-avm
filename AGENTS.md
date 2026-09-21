# Shared repository instructions

These instructions apply to both Codex and GitHub Copilot. Maintain shared
repository guidance here; keep agent-specific entry files as pointers to this
file rather than copies of these rules.

## Required context

- Before repository work, read the [constitution](.specify/memory/constitution.md).
  It is the authoritative source for engineering principles and governance.
- For specification-driven work, read the [Spec Kit workflow](.github/skills/speckit-workflow.md)
  and the active feature selected by [.specify/feature.json](.specify/feature.json).
  Read its specification, plan, and tasks as applicable before implementation.
- When using a Spec Kit command, read its existing instructions under
  `.github/skills/speckit-<command>/SKILL.md` and the
  [hook contract](.github/skills/speckit-hook-contract.md). Use these same files
  from either agent; do not create separate copies for Codex.
- Tool integrations and installed skills can differ between agents. If a required
  skill is unavailable, state that limitation rather than claiming it was used.

## Azure infrastructure planning

Use the Azure enterprise infrastructure planner skill for infrastructure design and architecture decisions in this repository.

### Baseline architecture
Treat this repository as an application-focused landing-zone baseline rather than a generic platform scaffold.

- The tenant-scope entrypoint in `infra/landingzone/main.bicep` is the starting point for organizing platform and application subscriptions and management groups.
- The subscription-scope wrapper in `infra/main.bicep` is the default deployment path for shared bootstrap and platform resources inside a target subscription.
- The bootstrap and platform layers remain separate and composable so they can support application workloads without bypassing the established layering.

### When to apply the skill
Use the skill whenever a task involves:
- changing the subscription-scope topology in infra/main.bicep
- changing tenant-scope topology in infra/landingzone/main.bicep
- revising the bootstrap, platform, or landing-zone module structure
- adding or changing networking, private endpoints, VNets, subnets, DNS, or routing
- introducing or changing identity, RBAC, managed identity, or Key Vault access patterns
- deciding on regions, naming, segmentation, management-group placement, or landing-zone alignment
- reviewing whether a change should use existing patterns or Azure Verified Modules (AVM)
- introducing or adjusting application subscription patterns that should fit the shared platform baseline

### Idempotency expectations
Treat every change as a repeatable desired-state deployment.

- Re-running the same deployment with the same parameters should converge on the same Azure state.
- Changes should be safe to apply repeatedly without introducing drift, duplicate resources, or manual follow-up steps.
- Prefer declarative Bicep and ARM patterns, stable resource naming, and conditional resource logic that supports re-runs.
- If a change introduces non-idempotent behavior, explicitly call it out and describe the mitigation or operational caveat.

### Expected behavior
When working on this repo, the agent should:
1. Review the existing Bicep modules before suggesting architectural changes.
2. Use the Azure enterprise infrastructure planner skill to validate design choices for any change that matches the trigger list in the 'When to apply the skill' section above.
3. Prefer secure, scalable, and modular Azure patterns that fit a platform foundation for application workloads.
4. Keep changes aligned with the current repo conventions and deployment model.
5. Preserve or improve idempotency, re-deployment safety, and repeatable outcomes.

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

When the user types `/graphify`, use the installed graphify skill or instructions before doing anything else.

Rules:
- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- Dirty graphify-out/ files are expected after hooks or incremental updates; dirty graph files are not a reason to skip graphify. Only skip graphify if the task is about stale or incorrect graph output, or the user explicitly says not to use it.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
