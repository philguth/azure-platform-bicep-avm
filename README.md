# azure-platform-bicep-avm

This repository is a lean, application-focused landing-zone baseline built with Bicep and Azure Verified Modules.

- Use it to stand up repeatable shared platform services and test customer-aligned deployment scenarios.
- Keep it lighter than the full Azure Landing Zones accelerator while preserving enterprise-friendly layering and deployment patterns.

## Architecture phases

The codebase follows a simplified set of landing-zone phases that mirrors the Azure Landing Zones mental model without adopting the full accelerator.

1. Landing zone: define the tenant-level hierarchy and subscription placement in `infra/landingzone/main.bicep`.
2. Subscription orchestration: coordinate shared deployments into a target subscription from `infra/main.bicep`.
3. Bootstrap: provision foundational prerequisites such as identity and Key Vault in `infra/bootstrap/main.bicep`.
4. Platform: deploy shared networking and private connectivity in `infra/platform/main.bicep`.
5. Application onboarding: layer future workload-specific patterns on top of the shared baseline rather than changing the foundation for each scenario.

These phases are intended to make the deployment model easier to understand, easier to extend, and safer to re-run.

See `infra/README.md` for the folder-to-phase mapping inside the infrastructure tree.

## Bicep MCP

This workspace now includes a repo-scoped MCP configuration at `.vscode/mcp.json` for the Bicep MCP server.

- The server is configured with the documented `dnx -y Azure.Bicep.McpServer` command.
- The dev container installs the .NET 10 SDK so `dotnet` and `dnx` are available when the workspace starts.
- The dev container also declares the Azure CLI feature so deployment and what-if commands work inside the workspace.
- The dev container post-create step installs the `graphifyy` UV tool so the `graphify` and `graphify-mcp` commands are available after rebuild.
- The dev container post-create step also runs `graphify copilot install` so the Graphify Copilot skill is restored after container rebuilds and defaults to querying the saved graph output when one already exis- The dev container currently pins `graphifyy==0.9.53`.
- The dev container pins its core tool versions on purpose so rebuilds stay reproducible instead of drifting with `latest` downloads.
- After pulling this change, rebuild the dev container once so VS Code can launch the MCP server from this workspace.

To verify it in VS Code:

1. Rebuild and reopen the dev container.
2. Open Copilot Chat in Agent mode.
3. Use the tools picker and confirm the `Bicep` MCP server is available.

## Graphify workflow

Graphify is useful in this repo, but it is not the only source of truth.

- Use Graphify for repo-shape questions, spec and README relationships, generated ARM JSON relationships, and broad architecture navigation.
- Use the Bicep MCP and direct Bicep file review for native `.bicep` authoring, parameter flow, resource schemas, and template debugging.
- Use direct file reads for the exact local slice being edited, even when Graphify helps identify where to look first.

Current limitation:

- The Graphify support matrix does not currently list native `.bicep` as a supported code format, so treat Graphify as complementary to Bicep MCP rather than a replacement for it in this repository.

Recommended maintenance routine:

1. Run `graphify hook install` once per clone, and re-run it after upgrading or reinstalling Graphify.
2. Let normal `git commit` and `git switch` activity refresh the graph when hooks are installed.
3. Run `graphify update .` after `git pull` or `git merge`.
4. When documentation-heavy changes matter, use `/graphify . --update` in an IDE-backed flow or a configured backend so semantic doc extraction can refresh successfully.
5. If you only need an offline structural refresh, use `graphify extract . --code-only`, but expect that to emphasize supported code formats and generated JSON rather than native Bicep.

## Deployment flow

The recommended entrypoint is the subscription-scope wrapper in `infra/main.bicep` with the dev parameters in `infra/dev.bicepparam`.

This repo also includes an app vending layer under `apps/` and an end-to-end entrypoint in `deploy/` when you want a single deployment that can lay down platform + an example application.

- The wrapper creates or updates the bootstrap and platform resource groups.
- It deploys `infra/bootstrap/main.bicep` first.
- It passes the bootstrap Key Vault output directly into `infra/platform/main.bicep`.
- This removes the manual Key Vault handoff when you use the top-level deployment.

The child templates remain deployable on their own:

- Use `infra/bootstrap/*` when you want to work on the bootstrap stack by itself.
- Use `infra/platform/*` when you intentionally want to deploy the platform stack independently and provide the Key Vault reference yourself.

## App vending

The `apps/` folder is for application-focused deployments that reuse the shared platform.

- Each app should have a resourceGroup-scope template (deploys the app resources).
- Each app should also have an optional subscription-scope “vend” template that creates an app resource group and deploys the app into it.

## Deployment stack direction

Deployment stacks are not configured in this repo yet. The current implementation uses plain ARM/Bicep deployment layering and keeps stack boundaries as a design requirement for future implementation.

The intended divider is ownership and lifecycle, not just file layout.

- Shared foundation stack: tenant landing zone, subscription orchestration, bootstrap, and platform-owned shared services.
- Application stack: one independently deployable stack per application onboarding unit.
- Optional later split: separate identity-owned and platform-owned stacks when RBAC, deny settings, or lifecycle justify a stricter boundary.

This means the current folders map cleanly to future stack ownership without requiring every folder to become its own stack:

- `infra/landingzone/` remains the tenant-scope hierarchy surface.
- `infra/` remains the subscription-scope shared foundation orchestration surface.
- `apps/<app>/vend.bicep` remains the subscription-scope application onboarding surface.
- `apps/<app>/main.bicep` remains the resource-group-scope workload surface.
- `deploy/` remains an end-to-end composition entrypoint rather than the owner of shared or app-specific lifecycle boundaries.

Operationally, stack boundaries are intended to support clearer RBAC, safer delete behavior, and better separation of platform versus application ownership. Cost management still depends on tagging, management-group or subscription alignment, and Azure budgets. A deployment stack can have tags on the stack resource itself, but application and platform resources should still be tagged explicitly in their own Bicep modules rather than relying on the stack to apply tags for them.

Current sample app:

- `apps/fabric-capacity/main.bicep` (resource group scope)
- `apps/fabric-capacity/vend.bicep` (subscription scope)

## End-to-end deployment

Use `deploy/main.bicep` when you want one subscription-scope deployment that:

- Deploys the shared platform via `infra/main.bicep`
- Vends an application resource group and deploys a Fabric capacity into it

Example what-if:

- `az deployment sub what-if --name endtoend-dev-whatif --location northcentralus --template-file deploy/main.bicep --parameters deploy/dev.bicepparam`

App-only what-if (does not touch platform):

- `az deployment sub what-if --name app-fabric-whatif --location northcentralus --template-file apps/fabric-capacity/vend.bicep --parameters location=northcentralus appResourceGroupName=rg-yourapp-dev capacityName=yourcapacity skuName=F2 administrators='["phil@guthink.com"]'`

## Regional guidance

Current dev defaults pin both stacks to `northcentralus`.

- Bootstrap dev sets `location = 'northcentralus'` in `infra/bootstrap/dev.bicepparam`.
- Platform dev sets `location = 'northcentralus'` in `infra/platform/dev.bicepparam`.
- Keep the platform virtual network and private endpoint in the same region.
- The Key Vault can be in a different region than the virtual network and private endpoint, but same-region deployment is the simpler default for this repo because it reduces latency and cross-region complexity.
- The private DNS zone is global and doesn't need to be in the same region as the virtual network.

Recommended default for this repository:

- Keep bootstrap and platform resources together in `northcentralus` unless you are intentionally testing cross-region or failover behavior.

## Idempotency

Using `infra/main.bicep` gives you a better redeploy path because bootstrap outputs are wired directly into platform in a single deployment graph.

- Re-running the same deployment with the same parameters should converge on the same Azure state.
- This improves idempotency by removing the manual copy step for Key Vault identifiers.
- It does not create transactional behavior across all Azure resource providers, but it does give you the normal desired-state behavior expected from ARM/Bicep deployments.

Practical note: `no regression` depends on drift.

- ARM/Bicep deployments are incremental by default and will not delete resources unless you explicitly deploy in complete mode.
- If the live state has drifted from what your templates or parameters now declare, a redeploy will modify resources to converge back to the declared state.
- Use `what-if` on every change to see exactly what will be created or modified before running `create`.

## Landing-zone pattern

The repository now also includes a tenant-scope landing-zone entrypoint at `infra/landingzone/main.bicep` for a Well-Architected-style hierarchy.

- It creates or updates platform and application management groups.
- It creates subscription aliases that can be used as the foundation for future application subscriptions.
- It can place existing subscriptions into those management groups and then deploy the shared platform stack into them.
- It is intended to serve as a reusable baseline for application-oriented customer environments rather than a full enterprise platform factory.

Example deployment flow:

1. Deploy the landing-zone template at tenant scope to create the management groups and subscription aliases.
2. Use the returned subscription alias names or supplied subscription IDs to place subscriptions under the intended management groups.
3. Re-run the landing-zone deployment with the concrete subscription IDs to deploy the shared bootstrap and platform stacks into those subscriptions.

A sample parameter file is available at `infra/landingzone/dev.bicepparam`.

## Repository direction

The long-term direction for this codebase is to remain a reusable landing-zone baseline for application deployments into existing enterprise estates.

- Preserve the current layering of landing zone, subscription wrapper, bootstrap, and platform modules.
- Prefer patterns that are reusable across customer scenarios instead of one-off environment customizations.
- Treat idempotent redeployment as a standing design requirement for future changes.
