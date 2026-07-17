# Repository guidance for Azure infrastructure planning

Use the Azure enterprise infrastructure planner skill for infrastructure design and architecture decisions in this repository.

## Baseline architecture
Treat this repository as an application-focused landing-zone baseline rather than a generic platform scaffold.

- The tenant-scope entrypoint in `infra/landingzone/main.bicep` is the starting point for organizing platform and application subscriptions and management groups.
- The subscription-scope wrapper in `infra/main.bicep` is the default deployment path for shared bootstrap and platform resources inside a target subscription.
- The bootstrap and platform layers remain separate and composable so they can support application workloads without bypassing the established layering.

## When to apply the skill
Use the skill whenever a task involves:
- changing the subscription-scope topology in infra/main.bicep
- changing tenant-scope topology in infra/landingzone/main.bicep
- revising the bootstrap, platform, or landing-zone module structure
- adding or changing networking, private endpoints, VNets, subnets, DNS, or routing
- introducing or changing identity, RBAC, managed identity, or Key Vault access patterns
- deciding on regions, naming, segmentation, management-group placement, or landing-zone alignment
- reviewing whether a change should use existing patterns or Azure Verified Modules (AVM)
- introducing or adjusting application subscription patterns that should fit the shared platform baseline

## Repo-specific context
This codebase is organized as:
- infra/main.bicep: subscription-scope wrapper
- infra/bootstrap/main.bicep: shared bootstrap resources
- infra/landingzone/main.bicep: tenant-scope landing-zone foundation for platform and application subscriptions
- infra/platform/main.bicep: shared platform resources

Treat the existing structure as the baseline architecture. When proposing changes, keep the deployment flow consistent and prefer architecture decisions that preserve the current landing-zone -> subscription wrapper -> bootstrap -> platform layering. If a required change cannot preserve that layering, explicitly flag the deviation, explain why it is unavoidable, and propose the minimal structural change needed.

## Idempotency expectations
Treat every change as a repeatable desired-state deployment.

- Re-running the same deployment with the same parameters should converge on the same Azure state.
- Changes should be safe to apply repeatedly without introducing drift, duplicate resources, or manual follow-up steps.
- Prefer declarative Bicep and ARM patterns, stable resource naming, and conditional resource logic that supports re-runs.
- If a change introduces non-idempotent behavior, explicitly call it out and describe the mitigation or operational caveat.

## Expected behavior
When working on this repo, the agent should:
1. Review the existing Bicep modules before suggesting architectural changes.
2. Use the Azure enterprise infrastructure planner skill to validate design choices for any change that matches the trigger list in the 'When to apply the skill' section above.
3. Prefer secure, scalable, and modular Azure patterns that fit a platform foundation for application workloads.
4. Keep changes aligned with the current repo conventions and deployment model.
5. Preserve or improve idempotency, re-deployment safety, and repeatable outcomes.

## Helpful prompt phrases
If you want the agent to explicitly use the planner skill, use prompts such as:
- "Use the Azure enterprise infrastructure planner skill to review this infrastructure change."
- "Assess this Bicep change from an enterprise landing-zone and application workload perspective."
- "Propose an architecture update for this repo using the infra planning skill."
