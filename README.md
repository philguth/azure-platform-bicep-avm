# azure-platform-bicep-avm

## Deployment flow

The recommended entrypoint is the subscription-scope wrapper in `infra/main.bicep` with the dev parameters in `infra/dev.bicepparam`.

- The wrapper creates or updates the bootstrap and platform resource groups.
- It deploys `infra/bootstrap/main.bicep` first.
- It passes the bootstrap Key Vault output directly into `infra/platform/main.bicep`.
- This removes the manual Key Vault handoff when you use the top-level deployment.

The child templates remain deployable on their own:

- Use `infra/bootstrap/*` when you want to work on the bootstrap stack by itself.
- Use `infra/platform/*` when you intentionally want to deploy the platform stack independently and provide the Key Vault reference yourself.

## Regional guidance

Current dev defaults pin both stacks to `eastus`.

- Bootstrap dev sets `location = 'eastus'` in `infra/bootstrap/dev.bicepparam`.
- Platform dev sets `location = 'eastus'` in `infra/platform/dev.bicepparam`.
- Keep the platform virtual network and private endpoint in the same region.
- The Key Vault can be in a different region than the virtual network and private endpoint, but same-region deployment is the simpler default for this repo because it reduces latency and cross-region complexity.
- The private DNS zone is global and doesn't need to be in the same region as the virtual network.

Recommended default for this repository:

- Keep bootstrap and platform resources together in `eastus` unless you are intentionally testing cross-region or failover behavior.

## Idempotency

Using `infra/main.bicep` gives you a better redeploy path because bootstrap outputs are wired directly into platform in a single deployment graph.

- Re-running the same deployment with the same parameters should converge on the same Azure state.
- This improves idempotency by removing the manual copy step for Key Vault identifiers.
- It does not create transactional behavior across all Azure resource providers, but it does give you the normal desired-state behavior expected from ARM/Bicep deployments.
