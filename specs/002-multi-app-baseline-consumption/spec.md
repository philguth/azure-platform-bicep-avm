# Feature Specification: Multi-Application Baseline Consumption

**Feature Branch**: `002-multi-app-baseline-consumption`

**Created**: 2026-08-31

**Status**: Draft

**Input**: User description: "Define how bootstrap and platform deployments should support multiple application deployments with clear identity, platform, and application team boundaries, while keeping the model reusable for resource-group-scoped or subscription-scoped application placement."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Define the shared application baseline contract (Priority: P1)

As a platform architect, I want a standard contract that defines how
applications consume shared bootstrap and platform capabilities so that multiple
application teams can deploy workloads without redefining the shared foundation.

**Why this priority**: This is the core architectural slice because every later
application onboarding flow depends on a clear distinction between shared
platform services and application-owned resources.

**Independent Test**: Can be fully tested by reviewing one application onboarding
definition and confirming it identifies which shared services are consumed,
which inputs must be supplied, and which resources remain application-owned.

**Acceptance Scenarios**:

1. **Given** a new application needs network, identity, and shared platform
services, **When** the application onboarding contract is prepared, **Then** it
defines the approved shared capabilities the application may consume without
changing the shared foundation.
2. **Given** an application request includes requirements outside the approved
shared contract, **When** the request is reviewed, **Then** those requirements
are surfaced for explicit platform or identity review instead of being absorbed
into the application deployment by default.

---

### User Story 2 - Onboard multiple applications independently (Priority: P2)

As an application platform owner, I want multiple application deployments to
reuse the same shared baseline while remaining independently deployable so that
one application's rollout or rollback does not require redeploying the shared
platform for every other application.

**Why this priority**: Repeated application onboarding is the main scaling use
case and proves that the shared baseline behaves like a reusable platform rather
than a one-off environment.

**Independent Test**: Can be tested independently by defining two application
deployments against the same baseline and confirming each can be reviewed and
deployed without changing the other application's deployment surface.

**Acceptance Scenarios**:

1. **Given** two applications target the same shared baseline, **When** each
application onboarding definition is prepared, **Then** each deployment can be
reviewed and executed independently while consuming the same approved shared
services.
2. **Given** one application requires a change to a shared platform concern,
**When** that request is evaluated, **Then** the requested change is routed to
the owning shared layer instead of being embedded directly into the application
deployment.

---

### User Story 3 - Preserve ownership boundaries across scopes (Priority: P3)

As a governance reviewer, I want identity, platform, and application ownership
boundaries to remain clear whether applications are placed at resource-group
scope or subscription scope so that separation of duties is preserved as the
deployment model evolves.

**Why this priority**: The repository's governance direction depends on
enforceable ownership boundaries, and scope changes should not blur those
responsibilities.

**Independent Test**: Can be tested independently by reviewing an onboarding
definition for one resource-group-scoped application and one
subscription-scoped application and confirming both identify the same ownership
boundaries and escalation paths.

**Acceptance Scenarios**:

1. **Given** an application is deployed into a shared subscription at resource
group scope, **When** its onboarding definition is reviewed, **Then** the
definition clearly distinguishes platform-owned resources from application-owned
resources.
2. **Given** an application is instead deployed through a subscription-scoped
onboarding flow, **When** its onboarding definition is reviewed, **Then** the
same ownership model and boundary checks still apply.

---

### User Story 4 - Reuse the onboarding model across provider and client tenants (Priority: P3)

As a solution provider, I want the same onboarding contract to support both
provider-hosted proof-of-concept deployments and client-tenant production
deployments so that I can demo solutions quickly in my own tenant while using a
similar governed process when deploying into a client environment.

**Why this priority**: This is the commercial operating model behind the
feature. The platform baseline should support internal learning and sales demos
without creating a different onboarding method from the one used for client
delivery.

**Independent Test**: Can be tested independently by reviewing one
provider-hosted PoC onboarding definition and one client-tenant onboarding
definition and confirming both use the same contract categories, with only
tenant ownership, security, and approval inputs varying.

**Acceptance Scenarios**:

1. **Given** a provider-hosted PoC is deployed in the solution provider's own
tenant, **When** the onboarding contract is prepared, **Then** it captures the
same application, security, networking, and ownership inputs used for a client
deployment, while allowing provider-owned defaults where appropriate.
2. **Given** a client wants the proven PoC deployed into the client's
production tenant, **When** the onboarding contract is prepared, **Then** the
same contract structure identifies the client-owned tenant, subscription,
approval, security, and access prerequisites that must be satisfied before
deployment.

---

### User Story 5 - Deploy a tenant-ready application unit (Priority: P2)

As a platform or solution owner, I want an application deployment to realize
the approved identity, networking, observability, and cost requirements for the
target tenant so that a successful deployment is more than just provisioning
the workload resource.

**Why this priority**: A resource-only deployment proves that the template can
create a workload, but it does not establish the security and operational
controls required for a viable customer service offering.

**Independent Test**: Deploy one application unit into a non-production tenant
and verify that its declared application-owned security, network, diagnostics,
tagging, and cost controls are present without creating or mutating shared
foundation resources outside the approved contract.

**Acceptance Scenarios**:

1. **Given** a client-tenant application request includes approved identity,
network, observability, and cost inputs, **When** the application what-if is
reviewed, **Then** the planned changes include the required application-owned
controls and identify any unsupported service capability as an explicit
exception.
2. **Given** a tenant-ready application deployment succeeds, **When** the
deployed resource group and resources are inspected, **Then** ownership and
cost tags, least-privilege role assignments, diagnostics, and approved network
integration are present and shared platform resources remain unchanged.
3. **Given** the application is offered as a reusable service or Marketplace
candidate, **When** readiness is reviewed, **Then** the repository provides a
deployment, security, operations, cost, and lifecycle checklist without
claiming Microsoft Marketplace certification that must be completed outside
this repository.

### Edge Cases

- What happens when two applications request overlapping names, address space,
or shared service assumptions within the same target environment?
- How does the system handle an application that needs a platform capability not
yet published as part of the shared baseline contract?
- What happens when an application can be hosted either in a shared
subscription or in a dedicated subscription, but the ownership boundaries must
remain consistent?
- How does onboarding handle applications that require exceptions to the shared
identity, network, or connectivity posture?
- What happens when an application deployment is removed or replaced while the
shared platform baseline remains in use by other applications?
- How does the onboarding contract distinguish provider-owned demo defaults from
	client-supplied production values without creating two separate delivery
	models?
- What happens when a PoC succeeds in the provider tenant but the client tenant
	has stricter networking, identity, or policy requirements that require
	additional approvals?

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The system MUST define a reusable application baseline contract
that describes how application deployments consume shared bootstrap and platform
capabilities.
- **FR-002**: The system MUST distinguish shared foundation concerns from
application-owned concerns so reviewers can determine which team owns each
change.
- **FR-003**: The system MUST support repeated onboarding of multiple
applications against the same shared baseline without requiring a custom shared
foundation change for each valid application request.
- **FR-004**: The system MUST support application placement patterns that are
valid for either resource-group-scoped deployments or subscription-scoped
deployments without changing the underlying ownership model.
- **FR-005**: The system MUST identify the approved shared capabilities an
application may consume, including network, identity, secret-management,
connectivity, observability, and tagging expectations where relevant.
- **FR-006**: The system MUST surface when an application request requires a
change to identity-owned or platform-owned concerns rather than permitting that
change to be embedded directly into the application deployment.
- **FR-007**: The system MUST define clear review boundaries for identity,
platform, and application teams, including which changes each team can approve
or must escalate.
- **FR-008**: The system MUST allow application deployments to be reviewed and
deployed independently of other applications that consume the same shared
baseline.
- **FR-009**: The system MUST preserve redeploy safety by ensuring application
onboarding outputs remain safe to re-run with the same inputs.
- **FR-010**: The system SHOULD represent independently owned shared foundation
and application deployment surfaces with separate deployment stacks or
equivalent deployment boundaries when lifecycle or access control differs.
- **FR-011**: The system MUST define the expected Microsoft Entra security
groups or equivalent identity principals for identity, platform, and
application ownership domains, along with the minimum Azure role assignments
required for each domain at the intended deployment scope.
- **FR-012**: The system SHOULD support implementation of subscription-scope or
resource-group-scope Azure role assignments in Bicep when principal identifiers
are provided and the assignment belongs to the shared foundation or application
deployment unit being onboarded.
- **FR-013**: The system MUST support a dual operating model in which the same
application onboarding contract can be used for provider-hosted PoC
deployments in the solution provider's tenant and for governed deployments in a
client-owned tenant.
- **FR-014**: The system MUST distinguish which onboarding fields may use
provider-owned defaults for internal learning or sales demonstrations and which
fields MUST be supplied or approved by the client before a client-tenant
deployment can proceed.
- **FR-015**: The system MUST define a client-facing intake or readiness view of
the application baseline contract so required tenant, networking, identity,
security, access, and operational answers can be collected before deployment.
- **FR-016**: A tenant-local application recipe that consumes the shared
baseline contract MUST support `azd up` to deploy application-owned resources
to a target subscription without redeploying or recreating the shared
foundation.
- **FR-017**: The tenant-local application recipe MUST ensure `azd down`
removes only recipe-owned application resources and never deletes shared
landing-zone, bootstrap, platform, identity, networking, or Key Vault
resources.
- **FR-018**: The application onboarding contract MUST distinguish required
tenant-ready controls from optional provider-hosted PoC defaults, including
identity, network, diagnostics, cost, and lifecycle inputs.
- **FR-019**: An application deployment MUST apply an agreed tag set to the
application resource group and workload resources, including environment,
application, owner, management, and cost-allocation metadata where required by
the target tenant.
- **FR-020**: An application deployment MUST create or configure only the
application-owned identity, RBAC, network, private-connectivity, diagnostic,
and cost resources explicitly approved by the baseline contract.
- **FR-021**: An application deployment MUST fail validation or surface an
explicit exception when a required tenant-ready input is missing or when the
target workload does not support a requested security or network capability.
- **FR-022**: The application deployment workflow MUST provide a repeatable
handoff from successful shared-infrastructure outputs to application parameter
files without requiring manual copying of subscription-specific resource IDs.
- **FR-023**: The repository MUST provide non-production validation for the
application what-if, deployment resource inventory, RBAC, tags, diagnostics,
network integration, and cleanup boundary.
- **FR-024**: The repository MUST provide a Marketplace-readiness checklist for
the intended offer model, while treating Microsoft publisher enrollment,
technical certification, commercial terms, and Marketplace submission as
external release activities.

### Key Entities *(include if feature involves data)*

- **Application Baseline Contract**: Represents the approved shared foundation
capabilities, inputs, constraints, and review rules that application
deployments must follow.
- **Application Deployment Unit**: Represents the deployable scope for one
application environment, including placement target, owned resources, and shared
baseline dependencies.
- **Ownership Boundary**: Represents the assignment of responsibility across
identity, platform, and application teams, including escalation paths and
approval expectations.
- **Shared Capability Reference**: Represents a reusable platform-provided
service or dependency that an application may consume without redefining the
shared foundation.
- **Security Principal Mapping**: Represents the expected Entra groups,
principal identifiers, scopes, and minimum roles associated with each
ownership domain.
- **Deployment Engagement Mode**: Represents whether the onboarding request is a
provider-hosted PoC, an internal learning deployment, or a client-tenant
delivery deployment, along with the ownership and approval rules that apply.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Reviewers can determine the owning team, target scope, and shared
baseline dependencies for a proposed application deployment in under 10 minutes
for at least 90% of onboarding reviews.
- **SC-002**: At least 90% of valid application onboarding requests reuse the
shared baseline without requiring a change to shared identity or platform
definitions.
- **SC-003**: Two or more application deployments can be defined against the
same shared baseline and reviewed independently without ambiguity about
ownership or lifecycle boundaries.
- **SC-004**: All onboarding definitions clearly state whether deployment is at
resource-group scope, subscription scope, or both, without changing the
governance model applied to the deployment.
- **SC-005**: Reviewers can identify the required security groups or principals,
their target scopes, and their minimum Azure roles for a proposed onboarding
definition without consulting external design notes.
- **SC-006**: A provider-hosted PoC onboarding definition and a client-tenant
deployment onboarding definition can be completed from the same contract
structure without ambiguity about which inputs are provider defaults and which
require client confirmation or approval.
- **SC-007**: A tenant-ready application deployment can be validated in a
non-production tenant with no unapproved changes to shared foundation resources.
- **SC-008**: At least 95% of required application cost, ownership, identity,
network, and observability inputs are represented in the generated parameter
file or an explicit readiness exception before deployment approval.
- **SC-009**: Reviewers can distinguish repository-controlled deployment
readiness from external Microsoft Marketplace certification and commercial
submission requirements.

## Assumptions

- The shared bootstrap and platform layers remain the platform baseline that
applications consume rather than clone per workload.
- Most application resources will continue to deploy at resource-group scope,
but subscription-scoped onboarding remains a valid orchestration pattern.
- Identity, platform, and application teams will remain separate governance
domains even when a single individual performs multiple roles during early
experimentation.
- Deployment stacks are an intended future control boundary for independently
owned deployment surfaces, even if some initial onboarding flows begin without
full stack separation.
- Some security groups may be provisioned outside this repository, but the
required principals, scopes, and role assignments must still be defined here.
- The solution provider may use a personal or internal Azure tenant for rapid
PoC and learning deployments, but client-tenant delivery must still follow the
same contract categories and governance model.
- Marketplace readiness is treated as an operational and technical readiness
boundary in this repository; Microsoft Marketplace publisher validation,
commercial packaging, and certification remain external activities.