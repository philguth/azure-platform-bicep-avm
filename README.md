# azure-platform-bicep-avm

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

Practical note: “no regression” depends on drift.

- ARM/Bicep deployments are incremental by default and will not delete resources unless you explicitly deploy in complete mode.
- If the live state has drifted from what your templates/parameters now declare, a redeploy will modify resources to converge back to the declared state.
- Use `what-if` on every change to see exactly what will be created/modified before running `create`.
