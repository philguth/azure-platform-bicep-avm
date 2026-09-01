# Research: Multi-Application Baseline Consumption

## Decision 1: Treat bootstrap and platform as a shared platform product

**Decision**: Applications will consume bootstrap and platform capabilities
through an explicit shared baseline contract rather than by directly reusing or
modifying shared modules per workload.

**Rationale**: The repo already treats `infra/main.bicep`, `infra/bootstrap`,
and `infra/platform` as the repeatable shared foundation. Preserving that as a
platform product keeps application onboarding reusable and avoids drift between
applications.

**Alternatives considered**:

- Let each application reuse `infra/main.bicep` unchanged in its own scope.
  Rejected because it risks duplicating or customizing shared concerns per
  workload.
- Let each application deploy directly against shared modules. Rejected because
  it weakens ownership boundaries and makes review paths less explicit.

## Decision 2: Use both subscription-scope and resource-group-scope application patterns

**Decision**: The default model will use subscription scope for onboarding and
resource group scope for the workload. The same logical contract must also work
when an application is placed in a dedicated subscription.

**Rationale**: Subscription scope is the right orchestration boundary for
resource group creation, RBAC, tags, budgets, policy, and future stack
ownership. Resource group scope remains the simplest boundary for most
application resources. This mirrors the existing `vend.bicep` + RG deployment
shape already present under `apps/fabric-capacity/`.

**Alternatives considered**:

- Resource-group-only onboarding. Rejected because it cannot cleanly own
  subscription-level RBAC and onboarding controls.
- Subscription-only application deployment. Rejected because it over-broadens
  the scope for most workload resources and makes blast radius larger than
  necessary.

## Decision 3: Separate ownership domains by identity, platform, and application

**Decision**: The design will explicitly model identity, platform, and
application ownership boundaries as separate review and deployment domains.

**Rationale**: The constitution now requires ownership isolation when lifecycle
or access boundaries differ. Review, escalation, and future deployment stacks
must follow those ownership domains rather than only technical file boundaries.

**Alternatives considered**:

- One central platform owner for all layers. Rejected because it does not prove
  separation of duties and collapses governance boundaries.
- Application-specific exceptions embedded directly in platform templates.
  Rejected because it turns workload onboarding into shared-foundation drift.

## Decision 4: Represent shared platform and per-application deployments as separate deployment stacks

**Decision**: Shared foundation and application deployment surfaces should be
planned as separate deployment stacks or equivalent boundaries, with more
granular identity/platform separation introduced when lifecycle justifies it.

**Rationale**: Stack boundaries should follow lifecycle and ownership. Keeping
shared platform and application resources in different stacks preserves delete,
deny, and approval boundaries.

**Alternatives considered**:

- One stack for all shared and application resources. Rejected because it
  weakens ownership isolation.
- No stack separation. Rejected because the constitution and target operating
  model both require enforceable deployment boundaries.

## Decision 5: Reuse the current app vend pattern as the initial application onboarding shape

**Decision**: Future multi-application onboarding should extend the existing
subscription-scope `vend` plus resource-group-scope workload pattern already
demonstrated by `apps/fabric-capacity/`.

**Rationale**: The repo already has a credible application deployment shape.
Expanding from that pattern is simpler and more consistent than inventing a new
unrelated onboarding structure.

**Alternatives considered**:

- Create a separate one-off onboarding mechanism outside `apps/`. Rejected
  because it would duplicate concerns already present in the current sample app.
- Put all app onboarding under `deploy/`. Rejected because `deploy/` is better
  kept as an end-to-end orchestration surface, not the owner of per-app models.