# Infrastructure phases

This folder is organized around a simplified Azure landing-zone progression.

## Phase 1: Landing zone

Folder or file:
- `landingzone/`

Purpose:
- Define tenant-level hierarchy.
- Create or align management groups.
- Create subscription aliases.
- Place subscriptions so shared platform services and future applications can be deployed into the right structure.

Primary entrypoint:
- `landingzone/main.bicep`

## Phase 2: Subscription orchestration

Folder or file:
- `main.bicep`
- `dev.bicepparam`

Purpose:
- Coordinate the deployment of shared resources into a target subscription.
- Create or update the bootstrap and platform resource groups.
- Pass shared outputs between deployment layers so the overall flow remains repeatable.

Primary entrypoint:
- `main.bicep`

## Phase 3: Bootstrap

Folder or file:
- `bootstrap/`

Purpose:
- Provision foundational prerequisites needed by the shared platform layer.
- Establish shared identity and secret-management building blocks.
- Output references that the platform layer consumes directly.

Primary entrypoint:
- `bootstrap/main.bicep`

## Phase 4: Platform

Folder or file:
- `platform/`

Purpose:
- Deploy shared networking and private connectivity.
- Extend the baseline created by the bootstrap phase.
- Provide a stable shared environment for application scenarios.

Primary entrypoint:
- `platform/main.bicep`

## Phase 5: Application onboarding

Current state:
- Not yet implemented as a separate folder.

Intended direction:
- Add workload-specific patterns on top of the shared baseline rather than modifying the foundation for every scenario.
- Keep onboarding concerns separate from shared platform concerns when this codebase grows.

## Design rule

Treat each phase as part of a repeatable, idempotent deployment flow. Re-running the same phase with the same inputs should converge on the same desired state without manual cleanup.
