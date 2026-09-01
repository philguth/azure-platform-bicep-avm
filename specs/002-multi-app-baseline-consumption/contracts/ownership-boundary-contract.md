# Contract: Ownership Boundary Review

## Purpose

This contract defines how identity, platform, and application responsibilities
remain separated during onboarding and deployment review.

## Ownership Domains

### Identity Boundary

- Owns privileged access patterns, shared identity controls, and secret-related
  governance
- Reviews changes that alter identity-managed shared capabilities
- Must not be bypassed through application-local exceptions

### Platform Boundary

- Owns shared networking, private connectivity, DNS, and baseline subscription
  controls
- Reviews changes that alter platform-managed shared capabilities
- Publishes approved shared services that applications may consume

### Application Boundary

- Owns application-specific resources and environment lifecycle within approved
  boundaries
- May consume published shared capabilities without redefining them
- Must escalate requests that require shared-foundation change

## Boundary Rules

- Application-owned changes must remain independently deployable
- Shared platform and application deployment units should use separate
  deployment stacks or equivalent boundaries when lifecycle differs
- Approval paths must stay stable whether placement is resource-group-scoped or
  subscription-scoped
- Reviewers must be able to determine the owning team for every proposed change

## Access Control Model

- Each ownership domain should map to one or more Microsoft Entra security
  groups or equivalent identity principals used for deployment and review.
- Identity-owned deployments should use dedicated identity administrator groups
  with privileged roles scoped only to identity-managed resources and control
  planes.
- Platform-owned deployments should use dedicated platform operator groups with
  least-privilege roles scoped to shared subscriptions, shared resource groups,
  and platform-managed resources.
- Application-owned deployments should use dedicated per-application groups with
  roles scoped only to the application deployment unit, whether that unit is a
  resource group or a dedicated subscription.
- Role assignments must follow least privilege and should prefer narrow scopes
  over subscription-wide grants when the deployment model allows it.
- If one individual belongs to multiple groups during early experimentation,
  the deployment model must still preserve separate assignable groups so the
  target operating model remains enforceable later.

## Minimum Review Outputs

- The onboarding contract must identify the expected identity, platform, and
  application security groups for each deployment unit.
- The onboarding contract must identify the minimum Azure roles or custom roles
  required for each group at the intended scope.
- The onboarding contract must identify which role assignments are baseline
  prerequisites and which are application-specific onboarding actions.
- Reviewers must be able to tell whether a requested role assignment belongs to
  the shared foundation or to the application deployment unit.

## Review Failure Conditions

- A proposed application deployment embeds a change to a shared identity or
  platform concern without escalation
- A deployment unit combines independently owned concerns into one unmanaged
  change surface
- The target scope changes but the ownership model becomes ambiguous
- Required security groups or minimum role assignments are undefined for the
  owning identity, platform, or application domain