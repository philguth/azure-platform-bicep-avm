# Deployment runbook: provider-hosted PoC and client-tenant application onboarding

This runbook captures the operating model for applying the shared baseline contract to either a provider-hosted PoC or a client-tenant deployment. The goal is to keep the same deployment pattern while making the approval gates explicit.

## 1. Scope and responsibilities

The shared foundation remains the responsibility of the platform and identity owners:

- `infra/` deploys shared bootstrap and platform resources.
- `apps/` contains application-owned deployment units.
- The app recipe consumes the published `sharedBaseline` contract and never redefines platform-owned resources.

Application onboarding is valid only when:

- the shared baseline already exists or is being deployed separately,
- the required Entra group object IDs are available,
- the app team owns the workload resource group and workload resources,
- any request beyond the contract is escalated for platform or identity review.

## 2. Provider-hosted PoC flow

1. Confirm the provider tenant, subscription, and target resource group.
2. Validate the shared baseline in the target tenant.
3. Capture the platform outputs required by the app recipe:
   - `bootstrapResourceGroupId`
   - `platformResourceGroupId`
   - `keyVaultResourceId`
   - `uamiResourceId`
   - `uamiPrincipalId`
   - `location`
   - `environmentName`
4. Populate the `securityPrincipals` block with valid object IDs for the application, platform, and identity owners.
5. Deploy the app recipe with the approved workload parameters.
6. Confirm the deployment only creates or updates the application-owned resource group and workload resources.
7. Record which values were provider defaults and which values later require client confirmation.

## 3. Client-tenant delivery flow

1. Start from the same application baseline contract used for the provider PoC.
2. Replace provider-owned defaults with explicit client-owned values for tenant, subscription, ownership, networking, and security.
3. Require written approval from the client for:
   - tenant and subscription choice,
   - network integration,
   - identity and RBAC groups,
   - cost ownership and tags,
   - support contacts and change ownership.
4. Validate the client-scoped values against the shared baseline contract before deploying the app recipe.
5. Use the same `azd` recipe pattern for the application deployment, but keep the shared foundation separate.
6. Confirm the deployment boundary remains application-only and does not recreate or mutate the shared landing-zone resources.

## 4. Operating rules

- Do not create shared Key Vault, networking, or platform resources from the app recipe.
- Do not assume a new identity or platform capability is available without explicit approval.
- Protect the shared foundation with a change request and a review gate when platform or identity boundaries are touched.
- Use the same contract and review model for PoCs and client delivery so onboarding stays consistent.

## 5. `azd` recipe lifecycle

The app recipe should use `azd up` to deploy application-owned resources and `azd down` to clean up only recipe-owned resources.

Required guardrail:

- `azd down` must not remove anything outside the recipe-owned app resource group or application workload resources.

Use this decision rule:

- Shared infrastructure is managed outside the recipe.
- Application recipe resources are managed inside the recipe environment.
- Only the recipe-owned app scope can be torn down by `azd down`.

## 6. Validation checklist

Before sign-off, confirm:

- [ ] Shared baseline outputs are stable and valid.
- [ ] Security groups are already present in Microsoft Entra.
- [ ] Role assignments are limited to the application-owned scope and any explicitly approved shared-scope assignments.
- [ ] Reviewers can tell whether a proposed change belongs to the app recipe or the shared platform foundation.
- [ ] `azd up` and `azd down` are limited to the recipe scope.
- [ ] Client or provider approvals are captured and recorded.
