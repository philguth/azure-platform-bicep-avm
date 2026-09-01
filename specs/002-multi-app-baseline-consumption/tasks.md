---

description: "Task list for feature 002 multi-application baseline consumption"
---

# Tasks: Multi-Application Baseline Consumption

**Input**: Design documents from `/specs/002-multi-app-baseline-consumption/`

**Prerequisites**: plan.md, spec.md, research.md, data-model.md, contracts/, quickstart.md

**Tests**: Validation tasks use Bicep diagnostics, focused builds, and `az deployment ... what-if` scenarios from quickstart.md. Separate automated test files are not required by the specification.

**Organization**: Tasks are grouped by user story to enable independent implementation and validation.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel when tasks touch different files and do not depend on unfinished work
- **[Story]**: Which user story this task belongs to
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Prepare repo guidance and implementation surfaces for the feature

- [ ] T001 Update repository direction and deployment stack guidance in README.md
- [ ] T002 Update infrastructure phase guidance for application onboarding in infra/README.md
- [ ] T003 [P] Create shared application onboarding documentation stub in apps/README.md

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Define the shared contract and common deployment surfaces required by all stories

**CRITICAL**: Complete this phase before starting user story implementation

- [ ] T004 Define the shared application baseline contract in apps/contracts/application-baseline.bicep
- [ ] T005 [P] Define ownership boundary metadata and review rules in apps/contracts/ownership-boundaries.bicep
- [ ] T006 [P] Create a shared subscription-scope onboarding interface in apps/modules/app-vending.bicep
- [ ] T007 Create shared tagging and baseline parameter conventions in apps/modules/app-defaults.bicep
- [ ] T008 Update deploy/main.bicep to consume the shared application onboarding interface without changing shared platform ownership
- [ ] T009 Define the Microsoft Entra security group and minimum RBAC role model in specs/002-multi-app-baseline-consumption/contracts/ownership-boundary-contract.md
- [ ] T010 Create a shared scoped RBAC module for subscription and resource-group role assignments in apps/modules/role-assignments.bicep

**Checkpoint**: Shared onboarding contract and reusable application scaffolding are ready

---

## Phase 3: User Story 1 - Define the shared application baseline contract (Priority: P1) MVP

**Goal**: Make the approved shared baseline contract explicit so applications can consume bootstrap and platform capabilities without redefining them

**Independent Test**: Review one onboarding definition and confirm it identifies approved shared capabilities, required inputs, ownership boundaries, and escalation points without requiring a shared-foundation template edit

### Implementation for User Story 1

- [ ] T011 [P] [US1] Add baseline contract inputs and shared capability references to apps/contracts/application-baseline.bicep
- [ ] T012 [P] [US1] Add ownership review metadata to apps/contracts/ownership-boundaries.bicep
- [ ] T013 [US1] Wire contract validation and shared defaults into apps/modules/app-vending.bicep
- [ ] T014 [US1] Update apps/fabric-capacity/vend.bicep to consume the shared onboarding interface and contract metadata
- [ ] T015 [US1] Document the contract, approved shared capabilities, escalation rules, and required security principals in specs/002-multi-app-baseline-consumption/contracts/application-baseline-contract.md
- [ ] T016 [US1] Validate the Fabric onboarding contract with `az deployment sub what-if` using apps/fabric-capacity/vend.bicep and a non-production parameter set captured in specs/002-multi-app-baseline-consumption/quickstart.md

**Checkpoint**: One application can consume the shared baseline through a documented and reviewable contract

---

## Phase 4: User Story 2 - Onboard multiple applications independently (Priority: P2)

**Goal**: Enable multiple apps to reuse the same baseline while remaining independently deployable

**Independent Test**: Define two application onboarding units against the same baseline and confirm each can be reviewed and deployed without changing the other application's deployment surface

### Implementation for User Story 2

- [ ] T017 [P] [US2] Create a second application onboarding example under apps/shared-template/README.md that documents the expected per-app file pattern
- [ ] T018 [P] [US2] Create a reusable per-application parameter example in apps/shared-template/example.bicepparam
- [ ] T019 [US2] Refactor apps/fabric-capacity/vend.bicep to align with the shared vending module contract and per-app parameter conventions
- [ ] T020 [US2] Add a second independently deployable sample onboarding definition in apps/fabric-capacity-alt/vend.bicep
- [ ] T021 [P] [US2] Add the companion workload template for the second sample in apps/fabric-capacity-alt/main.bicep
- [ ] T022 [US2] Update deploy/main.bicep to show how shared platform deployment composes with one selected app deployment unit without owning all application rollouts
- [ ] T023 [US2] Validate two independent app onboarding what-if scenarios from specs/002-multi-app-baseline-consumption/quickstart.md using apps/fabric-capacity/vend.bicep and apps/fabric-capacity-alt/vend.bicep

**Checkpoint**: Two applications reuse the same baseline and remain independently deployable

---

## Phase 5: User Story 3 - Preserve ownership boundaries across scopes (Priority: P3)

**Goal**: Keep identity, platform, and application boundaries clear whether an app is placed at resource-group or subscription scope

**Independent Test**: Review one RG-scoped and one subscription-scoped onboarding definition and confirm both show the same ownership model, escalation path, and boundary checks

### Implementation for User Story 3

- [ ] T024 [P] [US3] Add explicit ownership boundary outputs and annotations to apps/modules/app-vending.bicep
- [ ] T025 [P] [US3] Add subscription-scope ownership boundary guidance to infra/main.bicep outputs or metadata comments where shared foundation handoff occurs
- [ ] T026 [US3] Create a dedicated ownership-boundary deployment guidance document in docs/deployment-stacks.md
- [ ] T027 [US3] Document the future shared-foundation and per-application stack split in specs/002-multi-app-baseline-consumption/contracts/ownership-boundary-contract.md
- [ ] T028 [US3] Implement shared-foundation and application scoped role assignments in apps/modules/role-assignments.bicep and apps/modules/app-vending.bicep
- [ ] T029 [US3] Add security-group and role-assignment setup guidance for identity, platform, and application teams in docs/deployment-stacks.md
- [ ] T030 [US3] Add quickstart validation steps for ownership review across RG-scope and subscription-scope app placement in specs/002-multi-app-baseline-consumption/quickstart.md
- [ ] T031 [US3] Validate stack-boundary and ownership guidance with focused Bicep builds for infra/main.bicep and apps/fabric-capacity/vend.bicep

**Checkpoint**: Ownership and future stack boundaries are explicit across both placement models

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Finish documentation, consistency, and full-scenario validation

- [ ] T032 [P] Align repository narrative with implemented onboarding surfaces in README.md and infra/README.md
- [ ] T033 [P] Review application folder naming, parameter naming, and tag conventions across apps/ and deploy/
- [ ] T034 Run the end-to-end validation sequence from specs/002-multi-app-baseline-consumption/quickstart.md and capture any required follow-up notes in specs/002-multi-app-baseline-consumption/plan.md

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies
- **Foundational (Phase 2)**: Depends on Setup and blocks all user stories
- **User Story 1 (Phase 3)**: Starts after Foundational and delivers the MVP contract
- **User Story 2 (Phase 4)**: Starts after Foundational and builds on the shared contract from User Story 1
- **User Story 3 (Phase 5)**: Starts after Foundational and should follow User Story 1 so the ownership model is attached to the implemented contract
- **Polish (Phase 6)**: Depends on the desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: No dependency on other stories after Foundational
- **User Story 2 (P2)**: Depends on the shared onboarding contract from User Story 1
- **User Story 3 (P3)**: Depends on the shared onboarding contract from User Story 1 and should align with User Story 2 examples where available

### Parallel Opportunities

- T002 and T003 can run in parallel after T001 starts the documentation direction
- T005, T006, T007, and T009 can run in parallel once T004 establishes the contract surface
- T011 and T012 can run in parallel within User Story 1
- T017 and T018 can run in parallel within User Story 2
- T020 and T021 can run in parallel once the second sample app shape is agreed
- T024 and T025 can run in parallel within User Story 3
- T032 and T033 can run in parallel during Polish

---

## Parallel Example: User Story 2

```bash
Task: "Create a second application onboarding example under apps/shared-template/README.md"
Task: "Create a reusable per-application parameter example in apps/shared-template/example.bicepparam"

Task: "Add a second independently deployable sample onboarding definition in apps/fabric-capacity-alt/vend.bicep"
Task: "Add the companion workload template for the second sample in apps/fabric-capacity-alt/main.bicep"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational
3. Complete Phase 3: User Story 1
4. Validate the shared contract with the Fabric sample onboarding flow
5. Stop and review the contract before expanding to additional applications

### Incremental Delivery

1. Establish shared contract and vending module surfaces
2. Convert the existing Fabric sample to the shared contract
3. Add a second sample onboarding unit to prove independent reuse
4. Add ownership-boundary and future stack guidance across scopes
5. Run end-to-end quickstart validation and align repo documentation

### Parallel Team Strategy

1. One contributor finalizes contract modules under apps/contracts/
2. One contributor updates the existing Fabric app to the shared onboarding pattern
3. One contributor documents ownership boundaries and future stack guidance

---

## Notes

- All tasks follow the required checklist format with IDs and file paths
- Validation is driven by focused Bicep builds and `az deployment ... what-if` checks rather than separate automated test suites
- User Story 1 is the recommended MVP because User Stories 2 and 3 depend on the shared contract existing first