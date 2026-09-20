# Repository Spec Kit Workflow

This repository follows the upstream Spec Kit strategy for Spec-Driven Development while adding repository-specific quality gates.

## Core Path

The normal feature path is:

```text
constitution -> specify -> plan -> tasks -> implement -> converge
```

- `constitution` establishes project-wide principles once.
- `specify` defines what and why in `spec.md`.
- `plan` defines how and produces the technical design artifacts.
- `tasks` turns the design into dependency-ordered implementation work in `tasks.md`.
- `implement` executes the tasks.
- `converge` compares the implemented code with the artifacts and appends any remaining work.

Repeat `implement -> converge` until convergence reports that the feature is complete.

## Optional Quality Gates

These commands are optional gates and may be inserted when their review is useful:

- `clarify`: resolve important ambiguity in `spec.md`, normally before `plan`.
- `checklist`: create a reviewer-owned requirements-quality checklist.
- `analyze`: inspect consistency and coverage across `spec.md`, `plan.md`, and `tasks.md`, normally after `tasks` and before `implement`.
- `taskstoissues`: publish tasks as GitHub issues after `tasks` exists.

This repository may require a selected gate through local project policy, but the upstream workflow does not require every optional gate for every feature.

## Artifact Ownership

- `specify` and `clarify` may update `spec.md` and the built-in `checklists/requirements.md`.
- `plan` owns the design artifacts such as `plan.md`, `research.md`, `data-model.md`, `contracts/`, and `quickstart.md`.
- `tasks` owns the initial task breakdown in `tasks.md`.
- `analyze` is read-only and reports findings.
- `implement` changes the codebase and treats checklist state as a review gate; it does not mark checklist items complete.
- `converge` may append new tasks to `tasks.md`, but does not rewrite existing tasks or modify the specification, plan, or application code.
- `checklist` creates or appends unchecked reviewer-owned checklist items.
