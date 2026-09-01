# Implementation Plan: Multi-Application Baseline Consumption

**Branch**: `002-multi-app-baseline-consumption` | **Date**: 2026-09-01 | **Spec**: [specs/002-multi-app-baseline-consumption/spec.md](./spec.md)

**Input**: Feature specification from `/specs/002-multi-app-baseline-consumption/spec.md`

## Summary

Define a reusable application baseline contract that lets multiple application
deployments consume the shared bootstrap and platform foundation without
redefining it per workload. The design keeps subscription-scope onboarding and
resource-group-scope workloads as complementary patterns, preserves identity,
platform, and application ownership boundaries, and prepares the repo for
separate deployment stacks where lifecycle or access control differs.

## Technical Context

**Language/Version**: Bicep templates, Bicep parameter files, ARM deployment
model, Markdown design artifacts

**Primary Dependencies**: Azure Resource Manager deployments, Azure CLI,
Azure Verified Modules, current repo Bicep module structure under `infra/` and
`apps/`

**Storage**: N/A for runtime application data; repository-hosted IaC, parameter,
and documentation files only

**Testing**: Bicep diagnostics, focused template builds, `az deployment ...
what-if`, targeted non-production `create` deployments, post-deploy Azure
resource inspection

**Target Platform**: Azure tenant, management group, subscription, and resource
group scopes managed from the repo devcontainer on Linux

**Project Type**: Infrastructure-as-code landing-zone baseline with application
onboarding patterns

**Performance Goals**: Reviewers can determine ownership boundaries, placement,
and shared-service dependencies for an onboarding definition in under 10 minutes
for most reviews

**Constraints**: Preserve landing-zone -> subscription -> bootstrap -> platform
layering; keep shared foundation reusable; maintain safe re-run behavior; avoid
embedding identity- or platform-owned concerns into application-owned
deployments; prepare for separate deployment stacks where ownership differs;
support least-privilege RBAC modeling with explicit ownership-domain security
principals and scoped role assignments where principal IDs are supplied

**Scale/Scope**: Multiple applications across shared or dedicated subscriptions,
each with one or more environments, all consuming a common enterprise baseline

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **Layered Landing-Zone Architecture**: PASS. The plan extends the application
  onboarding layer without bypassing tenant, subscription, bootstrap, or
  platform layers.
- **Idempotent Desired-State Deployments**: PASS. The design keeps shared
  foundation and per-application deployment units separately re-runnable.
- **AVM-First Modular Composition**: PASS. The plan retains AVM-first guidance
  for future shared and application resource additions.
- **Secure-by-Default Platform Boundaries and Ownership Isolation**: PASS. The
  plan explicitly separates identity, platform, and application ownership and
  preserves deployment-boundary isolation.
- **Validate Before Merge and Deploy**: PASS. The plan uses what-if, focused
  deployment checks, and contract review as primary validation mechanisms.

**Post-Design Re-check**: PASS. Research, contracts, and quickstart preserve the
same gates and do not introduce constitution violations.

## Project Structure

### Documentation (this feature)

```text
specs/002-multi-app-baseline-consumption/
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
│   ├── application-baseline-contract.md
│   └── ownership-boundary-contract.md
└── tasks.md
```

### Source Code (repository root)

```text
infra/
├── main.bicep
├── dev.bicepparam
├── landingzone/
│   └── main.bicep
├── bootstrap/
│   └── main.bicep
└── platform/
    └── main.bicep

apps/
└── fabric-capacity/
    ├── main.bicep
    └── vend.bicep

deploy/
└── main.bicep

.specify/
└── memory/constitution.md

specs/
├── 001-standardize-app-onboarding/
└── 002-multi-app-baseline-consumption/
```

**Structure Decision**: Keep shared foundation composition in `infra/` and keep
per-application deployment units under `apps/`. The feature will define a new
application baseline contract and future onboarding pattern that can introduce a
shared application onboarding layer without collapsing shared platform concerns
into individual application templates.

**Security Decision**: Treat Entra group definitions, minimum roles, and scoped
Azure role assignments as part of the onboarding contract. Where the repo can
legally and safely create role assignments at subscription or resource-group
scope, implementation should accept principal IDs as inputs and create the
required assignments declaratively in Bicep. Tenant-level group lifecycle may
remain external, but the contract and deployment surfaces must not leave RBAC
requirements implicit.

## Complexity Tracking

No constitution violations currently require justification.
