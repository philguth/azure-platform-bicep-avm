# Contract: Application Baseline Consumption

## Purpose

This contract defines the minimum agreement between the shared platform baseline
and each application deployment unit.

## Required Inputs

- Application name and environment name
- Placement intent: shared subscription, dedicated subscription, or both
- Target deployment scope: subscription, resource group, or a two-step flow
- Required shared capabilities
- Application-owned resources and responsibilities
- Exception requests that touch identity- or platform-owned concerns

## Shared Capability Categories

- Identity and secret-management consumption
- Network and private connectivity attachment
- Observability and operational tagging
- Policy, RBAC, and guardrail inheritance
- Shared service references required by the application

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

## Review Outcome

An application onboarding definition passes this contract when reviewers can
identify the target scope, consumed shared capabilities, owned resources,
required approvals, and re-run boundary without follow-up discovery.