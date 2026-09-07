# App recipe template for tenant-local POC deployment

This template shows how an application recipe can be cloned into a local repo and deployed into a target tenant while consuming the shared platform baseline already defined in this repository.

The goal is to keep the platform foundation stable and reusable while letting each application team or POC work in a lightweight deployment recipe that can be copied, adapted, and deployed independently.

## Design intent

Use this pattern when:

- you want to deploy a focused app or AI workload into your own tenant
- the shared platform and security baseline already exist in this repo
- you want a repeatable app recipe without redefining bootstrap or platform concerns
- you want to use `azd` for the quick app deployment experience while preserving the repo contract

## Separation of responsibilities

The repo already separates the two layers:

- Shared platform baseline: bootstrap + platform + landing-zone concerns in `infra/`
- Application recipe: workload-specific deployment in `apps/`
- Deployment orchestration: `azd` or a local wrapper for the app recipe

This means the app recipe must consume the platform outputs rather than recreate them.

## Contract boundary

The application recipe consumes a `sharedBaseline` object produced by the platform deployment. The contract is defined in:

- `apps/contracts/application-baseline.bicep`
- `apps/modules/app-vending.bicep`
- `apps/contracts/ownership-boundaries.bicep`

At minimum, the recipe should expect values similar to:

```json
{
  "environmentName": "dev",
  "namePrefix": "sample",
  "location": "northcentralus",
  "bootstrapResourceGroupId": "/subscriptions/<sub>/resourceGroups/rg-sample-bootstrap-dev",
  "platformResourceGroupId": "/subscriptions/<sub>/resourceGroups/rg-sample-platform-dev",
  "keyVaultResourceId": "/subscriptions/<sub>/resourceGroups/rg-sample-bootstrap-dev/providers/Microsoft.KeyVault/vaults/samplekv123",
  "uamiResourceId": "/subscriptions/<sub>/resourceGroups/rg-sample-bootstrap-dev/providers/Microsoft.ManagedIdentity/userAssignedIdentities/sample-deploy-uami",
  "uamiPrincipalId": "<managed-identity-object-id>",
  "tags": {
    "Environment": "dev",
    "Project": "AzurePlatformLearning"
  }
}
```

The application recipe should also pass app-specific ownership data such as:

```json
{
  "securityPrincipals": {
    "identityOwnerObjectId": "<id>",
    "platformOwnerObjectId": "<id>",
    "applicationOwnerObjectId": "<id>"
  }
}
```

## Suggested repo layout

Use this layout when cloning the app recipe into a local repo for a POC:

```text
my-app-recipe/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   └── main.parameters.json
├── src/
│   └── app code or deployment assets
├── .env
├── README.md
└── app.config.json
```

The `infra/` folder in the recipe can stay intentionally small and app-specific. It should not redefine bootstrap or platform resources. It should only define:

- app resource group
- app hosting or AI resources
- app config values
- app-specific managed identity or role assignments
- workload-specific secrets or settings references

## Recommended `azd` flow

Use `azd` only for the application recipe, not for the shared platform layer.

1. Deploy or validate the shared platform baseline from this repo.
2. Capture the platform outputs you need, especially:
   - `keyVaultResourceId`
   - `platformResourceGroupId`
   - `uamiResourceId`
   - `uamiPrincipalId`
   - region and environment values
3. Clone the app recipe into a tenant-local repo.
4. Set environment values in `.env` or `azd env`.
5. Reference the platform outputs via environment values or `main.parameters.json`.
6. Deploy the app recipe with `azd up`.

## Example `azure.yaml`

```yaml
name: my-app-recipe
metadata:
  template: my-app-recipe@0.0.1-beta
infra:
  provider: bicep
  path: infra
services:
  web:
    project: ./src
    host: appservice
```

This is intentionally lightweight. The app-specific deployment is the focus; the shared platform remains the foundation.

## Example app input contract

A tenant-local recipe should accept values like:

```json
{
  "location": "northcentralus",
  "environmentName": "dev",
  "appResourceGroupName": "rg-myapp-dev",
  "appName": "myapp-dev",
  "aiServiceName": "myapp-ai",
  "skuName": "S0",
  "securityPrincipals": {
    "identityOwnerObjectId": "<id>",
    "platformOwnerObjectId": "<id>",
    "applicationOwnerObjectId": "<id>"
  }
}
```

## Deployment pattern for a Foundry / LLM POC

For a Foundry or LLM-based proof-of-concept, the recipe usually includes:

- AI Foundry or Azure OpenAI resource
- application host (App Service or Container Apps)
- managed identity
- Key Vault for secrets and connection strings
- Application Insights or Log Analytics
- storage for chat or document features if needed
- minimal RBAC assignments for the app identity

The recipe should consume shared platform outputs and should not duplicate:

- bootstrap identity creation
- network and private-link setup
- shared Key Vault creation
- shared platform guardrails

## POC guidance

For the fastest path to value:

- start with Azure-provided sample apps and adapt them
- keep the platform baseline stable
- only add app-specific resources in the recipe
- keep the ingestion and authentication model simple
- prefer managed identity and Key Vault instead of app secrets in config files
- document which values are tenant-specific and which values are shared baseline values

## Local repo use case

This recipe pattern works well when you want to:

- clone a sample app into a local repo
- deploy it to your tenant using the shared platform already created by this repo
- customize only the app-specific configuration and ownership inputs
- re-use the same platform contract across multiple application recipes

The result is a fast, reviewable, and reusable POC deployment model without creating a second platform by accident.
