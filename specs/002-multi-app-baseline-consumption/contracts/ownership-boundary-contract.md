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

## Review Failure Conditions

- A proposed application deployment embeds a change to a shared identity or
  platform concern without escalation
- A deployment unit combines independently owned concerns into one unmanaged
  change surface
- The target scope changes but the ownership model becomes ambiguous