# Repository guidance for Azure infrastructure planning

Use the Azure enterprise infrastructure planner skill for infrastructure design and architecture decisions in this repository.

## When to apply the skill
Use the skill whenever a task involves:
- changing the subscription-scope topology in infra/main.bicep
- revising the bootstrap or platform module structure
- adding or changing networking, private endpoints, VNets, subnets, DNS, or routing
- introducing or changing identity, RBAC, managed identity, or Key Vault access patterns
- deciding on regions, naming, segmentation, or landing-zone alignment
- reviewing whether a change should use existing patterns or Azure Verified Modules (AVM)

## Repo-specific context
This codebase is organized as:
- infra/main.bicep: subscription-scope wrapper
- infra/bootstrap/main.bicep: shared bootstrap resources
- infra/platform/main.bicep: shared platform resources

Treat the existing structure as the baseline architecture. When proposing changes, keep the deployment flow consistent and prefer architecture decisions that preserve the current wrapper -> bootstrap -> platform layering. If a required change cannot preserve the wrapper -> bootstrap -> platform layering, explicitly flag the deviation, explain why it is unavoidable, and propose the minimal structural change needed.

## Expected behavior
When working on this repo, the agent should:
1. Review the existing Bicep modules before suggesting architectural changes.
2. Use the Azure enterprise infrastructure planner skill to validate design choices for any change that matches the trigger list in the 'When to apply the skill' section above.
3. Prefer secure, scalable, and modular Azure patterns that fit a platform foundation.
4. Keep changes aligned with the current repo conventions and deployment model.

## Helpful prompt phrase
If you want the agent to explicitly use the planner skill, use prompts such as:
- "Use the Azure enterprise infrastructure planner skill to review this infrastructure change."
- "Assess this Bicep change from an enterprise landing-zone and networking perspective."
- "Propose an architecture update for this repo using the infra planning skill."
