<!--
Sync Impact Report
- Version change: none -> 1.0.0
- Modified principles:
	- Principle 1 -> I. Layered Landing-Zone Architecture
	- Principle 2 -> II. Idempotent Desired-State Deployments
	- Principle 3 -> III. AVM-First Modular Composition
	- Principle 4 -> IV. Secure-by-Default Platform Boundaries
	- Principle 5 -> V. Validate Before Merge and Deploy
- Added sections:
	- Repository Constraints
	- Delivery Workflow
- Removed sections: none
- Follow-up TODOs: none
-->

# Azure Platform Bicep AVM Constitution

## Core Principles

### I. Layered Landing-Zone Architecture
All infrastructure changes MUST preserve the repository's established layering:
tenant landing zone, subscription orchestration, bootstrap, platform, then
application onboarding. Changes MUST extend the nearest existing layer instead of
bypassing it with one-off templates or direct resource additions in unrelated
entrypoints. Rationale: this repository is an application-focused landing-zone
baseline, and architectural drift is most likely when contributors collapse
separate concerns into a single deployment surface.

### II. Idempotent Desired-State Deployments
Every Bicep change MUST remain safe to re-run with the same inputs and MUST
converge on the same Azure state without manual cleanup. Contributors MUST prefer
stable resource naming, declarative resource graphs, explicit conditions, and
direct module output wiring over manual handoff steps. Rationale: repeatable
subscription- and tenant-scope deployments are the repository's core quality bar,
and non-idempotent patterns create operational drift quickly.

### III. AVM-First Modular Composition
New Azure resources and shared patterns MUST prefer Azure Verified Modules when an
appropriate module exists, and custom resource declarations MUST stay minimal,
well-scoped, and justified. Module composition MUST follow current Bicep best
practices, keep public parameters intentional, and avoid unnecessary abstraction.
Rationale: this repository is explicitly built around Bicep and AVM, so reuse and
minimal customization reduce maintenance cost and improve correctness.

### IV. Secure-by-Default Platform Boundaries
Networking, identity, secret-management, and private connectivity changes MUST be
designed for least privilege, clear scope boundaries, and private access by
default where the platform pattern supports it. Contributors MUST treat Key Vault,
RBAC, managed identity, VNets, subnets, private endpoints, and DNS as shared
platform concerns that require explicit review for blast radius. Rationale:
security defects in the bootstrap or platform layers affect every downstream
application workload that inherits the baseline.

### V. Validate Before Merge and Deploy
Infrastructure changes MUST be validated with the narrowest relevant executable
check before merge, and deployment-oriented changes SHOULD use `what-if` before
`create`. Contributors MUST prefer Bicep diagnostics, focused template builds,
and parameter validation before broader manual inspection. Rationale: early
validation catches invalid resource types, API mismatches, and deployment graph
errors before they become Azure-side failures.

## Repository Constraints

This repository MUST remain a lean, reusable baseline for application-oriented
Azure landing zones rather than a generic platform factory or a collection of
environment-specific forks.

- The default subscription entrypoint is `infra/main.bicep`.
- The default tenant entrypoint is `infra/landingzone/main.bicep`.
- Bootstrap and platform modules MUST remain separately deployable.
- Application onboarding patterns MUST build on the shared baseline instead of
	rewriting shared platform concerns per app.
- Regional defaults MAY evolve, but same-region placement for tightly coupled
	networking and private connectivity remains the default unless a change
	intentionally tests cross-region behavior.

## Delivery Workflow

Changes SHOULD begin from the most local controlling file, module, or parameter
surface and stay narrow until validated. For architecture-affecting changes,
reviewers MUST evaluate whether the change fits the existing landing-zone to
subscription to bootstrap to platform flow. When a change touches deployment
behavior, contributors SHOULD run the cheapest relevant validation first:
Bicep diagnostics, focused template build, or targeted `az deployment ... what-if`
for the affected scope.

Pull requests MUST describe the intended deployment scope, the layer being
changed, and any idempotency or security implications. If a change intentionally
deviates from the existing layering, the PR MUST state why the deviation is
unavoidable and what the minimal structural impact is.

## Governance

This constitution governs repository-level engineering decisions and supersedes
informal local practices when they conflict. Amendments MUST be made through a
reviewed change that explains the reason for the update, the affected principles,
and any migration implications for existing templates or workflows.

Versioning policy for this constitution follows semantic versioning:

- MAJOR for incompatible governance changes or principle removals.
- MINOR for new principles, new sections, or materially expanded requirements.
- PATCH for clarifications, wording improvements, or non-semantic refinements.

Compliance review expectations:

- Every infrastructure PR MUST be checked against these principles during review.
- Reviewers MUST reject changes that bypass layering, reduce redeploy safety, or
	weaken secure-by-default platform boundaries without explicit approval.
- Operational guidance in `.github/copilot-instructions.md` and repository READMEs
	SHOULD align with this constitution and may provide implementation detail, but
	they do not override it.

**Version**: 1.0.0 | **Ratified**: 2026-08-27 | **Last Amended**: 2026-08-27
