# Data Model: Multi-Application Baseline Consumption

## Application Baseline Contract

**Purpose**: Defines how an application may consume shared bootstrap and
platform capabilities without redefining the shared foundation.

**Fields**:

- `contractName`: Stable name for the approved baseline contract
- `targetScopePattern`: Allowed placement pattern such as shared subscription,
  dedicated subscription, resource-group deployment, or a combined subscription
  plus resource-group flow
- `sharedCapabilities`: Approved shared services the application may consume,
  such as network attachment, private connectivity, Key Vault integration,
  observability, and tagging requirements
- `requiredInputs`: Minimum onboarding information required from the application
  team
- `restrictedChanges`: Shared concerns that application onboarding must not
  modify directly
- `reviewRequirements`: Which team must review or approve changes by category
- `redeployExpectations`: Required re-run and idempotency expectations

**Relationships**:

- One Application Baseline Contract governs many Application Deployment Units
- One Application Baseline Contract references many Shared Capability
  References
- One Application Baseline Contract is enforced through many Ownership
  Boundaries

## Application Deployment Unit

**Purpose**: Represents one independently deployable application environment.

**Fields**:

- `applicationName`: Human-readable workload identifier
- `environmentName`: Environment label such as dev, test, or prod
- `placementTarget`: Shared subscription, dedicated subscription, and target
  resource group or equivalent scope
- `deploymentScope`: Resource-group scope, subscription scope, or both
- `ownedResources`: Resources owned by the application team
- `sharedDependencies`: Shared capabilities consumed from the baseline
- `lifecycleBoundary`: Boundary that determines independent rollout, rollback,
  deletion, and future deployment stack scope
- `exceptionRequests`: Requested deviations from the standard baseline contract

**Relationships**:

- Many Application Deployment Units consume one Application Baseline Contract
- Each Application Deployment Unit has one or more Ownership Boundaries
- Each Application Deployment Unit references zero or more Shared Capability
  References

## Ownership Boundary

**Purpose**: Captures which team owns approval, change authority, and lifecycle
control for a concern.

**Fields**:

- `boundaryName`: Identity, platform, or application ownership domain
- `owningTeam`: Team or role accountable for the concern
- `changeTypes`: Types of change the owner may approve directly
- `escalationTriggers`: Conditions that require escalation to another owner
- `approvalScope`: Scope at which the boundary is enforced
- `deploymentBoundary`: Expected deployment stack or equivalent boundary for the
  owned concern

**Relationships**:

- One Ownership Boundary can apply to many Application Deployment Units
- One Ownership Boundary can govern many Shared Capability References

## Shared Capability Reference

**Purpose**: Describes a reusable shared service dependency that applications
consume without redefining it.

**Fields**:

- `capabilityName`: Shared service identifier
- `category`: Identity, network, connectivity, observability, secrets, tagging,
  or policy
- `consumptionMode`: Reference, attachment, inherited policy, or approved output
- `providerLayer`: Bootstrap, platform, landing-zone, or future onboarding
  layer
- `constraints`: Rules the application must follow when consuming the capability
- `ownerBoundary`: Ownership Boundary responsible for the capability

**Relationships**:

- Many Shared Capability References can be listed in one Application Baseline
  Contract
- Many Application Deployment Units can consume the same Shared Capability
  Reference