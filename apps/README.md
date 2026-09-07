# Application onboarding

The `apps/` folder contains independently deployable application onboarding units that consume the shared infrastructure baseline defined under `infra/`.

Each application deployment targets a subscription in an Azure tenant and owns only its application resource group and workload resources. It must consume the published `sharedBaseline` contract rather than recreating shared identity, Key Vault, networking, or connectivity resources.

## Application layout

Each application should use the following shape:

```text
apps/<app>/
├── main.bicep
└── vend.bicep
```

- `main.bicep` is the resource-group-scope workload template.
- `vend.bicep` is the subscription-scope onboarding template that creates the application resource group and deploys the workload.

Shared onboarding components are defined in:

- `contracts/application-baseline.bicep`
- `contracts/ownership-boundaries.bicep`
- `modules/app-vending.bicep`

See `recipe-template/README.md` for the pattern for a separate, tenant-local application recipe that can consume this contract through `azd`.
