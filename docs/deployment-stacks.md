# Deployment ownership and access control

This repository separates the shared foundation from independently deployable
application units. The boundary applies to deployment lifecycle and Azure RBAC.

## Deployment boundaries

- Shared foundation: `infra/landingzone/`, `infra/`, `infra/bootstrap/`, and
  `infra/platform/` own the tenant hierarchy, subscription orchestration,
  shared identity, Key Vault, networking, and private connectivity.
- Application unit: `apps/<app>/vend.bicep` owns one application resource group
  and its workload resources. It consumes the published `sharedBaseline`.

An application deployment must not create, delete, or grant access to a shared
foundation resource. Shared-foundation changes require a deployment from the
shared infrastructure layer and review by the owning domain.

## Required Microsoft Entra groups

Provide existing Microsoft Entra group object IDs as `securityPrincipals` in an
application onboarding deployment. Group lifecycle and membership are managed
outside this repository.

| Group | Object-ID input | Scope | Minimum role | Owner |
| --- | --- | --- | --- | --- |
| Application deployment group | `applicationOwnerObjectId` | Application resource group | Contributor | Application team |
| Platform review group | `platformOwnerObjectId` | Application resource group | Reader | Platform team |
| Identity administration group | `identityOwnerObjectId` | Shared identity or Key Vault resource, when needed | Key Vault Secrets User or a narrower service-specific role | Identity team |

`app-vending.bicep` creates the first two assignments only when their object IDs
are provided. It intentionally does not assign the identity group to the shared
Key Vault or any shared platform resource. Those assignments belong to the
shared-foundation deployment and must be approved by the identity or platform
owners.

## Deployment permissions

The principal that deploys application onboarding requires permission to create
the application resource group and its workload resources. When
`securityPrincipals` supplies a non-empty application or platform group ID, the
deployment principal also needs `Microsoft.Authorization/roleAssignments/write`
at the application resource group scope, normally through `Owner` or `User
Access Administrator`.

For a quick PoC, the same person may belong to all three groups. Keep the three
groups separate nonetheless, so a client deployment can enforce separation of
duties without changing the contract.