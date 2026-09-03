# Contract: Application Baseline Consumption

## Purpose

This contract defines the minimum agreement between the shared platform baseline
and each application deployment unit.

In this feature, the shared platform baseline is the platform landing zone and
the application deployment unit is the application landing zone or recipe. The
contract exists so application recipes can consume shared platform capabilities
through stable inputs and outputs instead of reaching directly into platform
implementation details.

## Required Inputs

- Application name and environment name
- Engagement mode: provider-hosted PoC, internal learning deployment, or
  client-tenant delivery deployment
- Placement intent: shared subscription, dedicated subscription, or both
- Target deployment scope: subscription, resource group, or a two-step flow
- Required shared capabilities
- Application-owned resources and responsibilities
- Exception requests that touch identity- or platform-owned concerns

## Engagement Modes

### Provider-hosted PoC

- Used for rapid demonstrations, internal learning, or pre-sales validation in
  the solution provider's own tenant
- May use provider-owned defaults for tenant selection, subscription choice,
  baseline shared services, and some operational settings
- Must still capture the same contract categories that a client deployment will
  require later

### Client-tenant delivery

- Used when the client wants the application deployed into the client's Azure
  tenant or production-aligned environment
- Requires explicit client-owned values for tenant, subscription, approvals,
  networking, access, security groups, RBAC, operational ownership, and any
  compliance-sensitive fields
- Must preserve the same contract structure as the provider-hosted PoC so the
  delivery process remains comparable and repeatable

## Platform Outputs Exposed to Application Recipes

- Shared capability identifiers that application recipes may reference without
  redefining the platform baseline
- Approved network attachment points, connectivity expectations, and naming
  constraints
- Identity, secret-management, and RBAC prerequisites that must exist before an
  application recipe is deployed
- Policy, tagging, and observability expectations inherited by the application
  deployment unit
- Ownership and escalation metadata that tells application teams when a request
  leaves recipe scope and becomes a platform or identity change

## Current Repository Platform Output Map

The current shared baseline already publishes a small but concrete output
surface from `infra/main.bicep`. These outputs are the first candidates for the
formal platform-to-recipe contract.

| Platform output | Current source | Meaning for recipes |
| --- | --- | --- |
| `bootstrapResourceGroupId` | `infra/main.bicep` output | Identifies the bootstrap scope that owns shared prerequisite resources |
| `platformResourceGroupId` | `infra/main.bicep` output | Identifies the shared platform scope that owns networking and shared services |
| `keyVaultName` | `infra/main.bicep` output | Names the shared Key Vault when applications are allowed to consume shared secrets by contract |
| `keyVaultResourceId` | `infra/main.bicep` output | Stable resource identifier for shared secret-management integration |
| `uamiResourceId` | `infra/main.bicep` output | Stable identifier for the shared user-assigned managed identity when the contract allows its use |

These outputs are already forwarded through `deploy/main.bicep` where relevant,
which makes them the natural starting point for a formal shared baseline module
or output contract.

## Recipe Inputs Supplied by Application Teams

- Application-specific names, environment labels, and target placement choices
- Application-owned resource definitions and per-environment parameters
- Requested shared capabilities selected from the published platform contract
- Principal identifiers and role-assignment inputs that belong to the
  application deployment unit
- Exception requests when the desired outcome cannot be met through the
  published shared baseline

## Current Repository Recipe Input Map

The current `apps/fabric-capacity/vend.bicep` sample shows the concrete input
shape an application recipe already owns today.

| Recipe input | Current source | Meaning for the application deployment unit |
| --- | --- | --- |
| `location` | `apps/fabric-capacity/vend.bicep` parameter | Region for the application resource group and workload resources |
| `appResourceGroupName` | `apps/fabric-capacity/vend.bicep` parameter | Resource-group boundary owned by the application deployment unit |
| `capacityName` | `apps/fabric-capacity/vend.bicep` parameter | Application-specific workload name |
| `skuName` | `apps/fabric-capacity/vend.bicep` parameter | Application workload sizing choice |
| `administrators` | `apps/fabric-capacity/vend.bicep` parameter | Application-specific principal list for workload administration |
| `resourceGroupTags` | `apps/fabric-capacity/vend.bicep` parameter | Tags applied to the application-owned resource-group boundary |
| `tags` | `apps/fabric-capacity/vend.bicep` parameter | Tags applied to workload resources inside the application deployment unit |

The current `deploy/main.bicep` entrypoint adds the outer orchestration values
that connect an application recipe to the shared baseline in one end-to-end
deployment:

| Orchestration field | Current source | Meaning for the shared platform to recipe handoff |
| --- | --- | --- |
| `environmentName` | `deploy/main.bicep` parameter | Shared environment label applied across platform and application surfaces |
| `namePrefix` | `deploy/main.bicep` parameter | Shared naming prefix that helps keep platform and recipe resources aligned |
| `bootstrapResourceGroupName` | `deploy/main.bicep` parameter | Shared baseline bootstrap scope name |
| `platformResourceGroupName` | `deploy/main.bicep` parameter | Shared baseline platform scope name |
| `resourceGroupTags` | `deploy/main.bicep` parameter | Tags consistently applied to resource-group boundaries |
| `bootstrapTags` | `deploy/main.bicep` parameter | Shared bootstrap tagging contract |
| `platformTags` | `deploy/main.bicep` parameter | Shared platform tagging contract |
| `appTags` | `deploy/main.bicep` parameter | Application workload tagging contract |

## Client Intake View

The same contract should be usable as a client-facing intake template before a
deployment begins. At minimum, the intake view should collect answers for these
categories:

- Target tenant and subscription ownership
- Environment purpose: demo, PoC, internal learning, non-production, or
  production
- Application name, purpose, and placement model
- Networking, private connectivity, and DNS expectations
- Identity, secrets, RBAC, and admin principal requirements
- Required shared capabilities and external dependencies
- Cost ownership, tags, and billing or chargeback identifiers
- Operational support model, monitoring expectations, and change owners
- Client approvals, exceptions, and prerequisites that must be satisfied before
  deployment

## Shared Capability Categories

- Identity and secret-management consumption
- Network and private connectivity attachment
- Observability and operational tagging
- Policy, RBAC, and guardrail inheritance
- Shared service references required by the application

## Interface Rules

- Platform outputs must be stable enough that an application recipe can be
  versioned and reviewed independently of platform implementation refactors.
- Application recipes must consume platform outputs only through documented
  contract fields, module parameters, or published deployment outputs.
- The contract must distinguish inherited platform controls from application
  inputs so reviewers can tell whether a change belongs to AVM-based platform
  composition or to the application recipe.
- The same interface contract must work whether the application recipe deploys
  into a shared subscription, a dedicated subscription, or a two-step
  subscription-plus-resource-group flow.
- The formal contract should start from fields already present in `infra/`,
  `deploy/`, and `apps/` before introducing new abstractions.
- When a field is needed only for orchestration between layers, the contract
  should document whether it is platform-owned, recipe-owned, or supplied by an
  outer deployment wrapper such as `deploy/main.bicep`.
- The contract must identify which fields may be prepopulated by the solution
  provider during provider-hosted PoCs and which fields require explicit client
  confirmation before client-tenant deployment.
- The contract should remain stable enough to be handed to a client as a
  readiness checklist without exposing unnecessary implementation detail from
  the underlying platform modules.

## Consumer Obligations

- Application deployments must consume only approved shared capabilities
- Application templates must not redefine shared platform capabilities already
  owned elsewhere
- Exception requests must be surfaced before rollout approval
- Application deployment units must remain safe to re-run with the same inputs

## Provider Obligations

- Shared platform layers must publish stable contract inputs and outputs
- Ownership and escalation paths must be explicit for each capability category
- Shared capabilities must remain reusable across multiple application
  deployment units

## Reference Deployment Flow

1. Deploy or validate the shared platform landing zone from `infra/`.
2. Publish the platform outputs and approved shared capability references that
  recipes are allowed to consume.
3. Select the engagement mode: provider-hosted PoC, internal learning, or
  client-tenant delivery.
4. Prepare an application recipe or onboarding deployment under `apps/` using
  only the published contract inputs.
5. For provider-hosted PoCs, apply provider-owned defaults where permitted and
  confirm the same contract categories remain visible for later client use.
6. For client-tenant delivery, collect the client-facing intake answers,
  validate approvals and access prerequisites, and confirm client-owned values
  replace any provider defaults.
7. Review the recipe against ownership, RBAC, and exception rules before
  rollout.
8. Deploy the recipe independently of other applications while reusing the same
  platform landing zone.
9. Re-run what-if or create operations on either side without forcing a
  redeployment of unrelated application recipes.

## Review Outcome

An application onboarding definition passes this contract when reviewers can
identify the target scope, consumed shared capabilities, owned resources,
required approvals, platform outputs, recipe inputs, and re-run boundary
without follow-up discovery.

At minimum, reviewers should be able to point to the concrete platform outputs
and recipe inputs listed above and explain which team owns each field.