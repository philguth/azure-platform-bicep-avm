# Shared Speckit Hook Contract

All Speckit skills use this contract for extension hooks. A skill-specific file owns only the hook phase name, such as `before_plan` or `after_tasks`.

## Discovery

1. Check whether `.specify/extensions.yml` exists at the repository root.
2. If it is absent, or the YAML cannot be parsed, skip hook processing silently.
3. Read only the relevant phase key under `hooks`, for example `hooks.before_specify`.
4. Treat hooks with `enabled: false` as disabled. Treat a missing `enabled` field as enabled.
5. Do not evaluate non-empty `condition` expressions. Leave those to the HookExecutor; skip those hooks in the skill workflow.
6. Replace dots in command names with hyphens when constructing the invocation. For example, `speckit.git.commit` becomes `/speckit-git-commit`.

## Execution

For an executable optional hook, report the extension, command, description, and prompt, then offer the command for explicit execution. Do not execute it automatically.

For an executable mandatory hook:

1. Report the extension and command using `EXECUTE_COMMAND: {command}`.
2. Invoke the hook in the current agent/session using the applicable skill invocation syntax.
3. Wait for the hook to finish before continuing.
4. Handle hook failures according to the phase-specific skill or HookExecutor behavior.

A hook with a skipped condition is not executable by the skill and must not be invoked by it. After hooks are processed, continue with the phase workflow and completion report.

## Phase Mapping

Each skill maps its lifecycle point to the corresponding hook key:

- `speckit-specify`: `before_specify`, `after_specify`
- `speckit-clarify`: `before_clarify`, `after_clarify`
- `speckit-plan`: `before_plan`, `after_plan`
- `speckit-tasks`: `before_tasks`, `after_tasks`
- `speckit-analyze`: `before_analyze`, `after_analyze`
- `speckit-checklist`: `before_checklist`, `after_checklist`
- `speckit-implement`: `before_implement`, `after_implement`
- `speckit-converge`: `before_converge`, `after_converge`
- `speckit-taskstoissues`: `before_taskstoissues`, `after_taskstoissues`

The phase-specific skill remains responsible for the timing of its before and after checks. This document is the authoritative source for hook discovery, filtering, invocation, and failure behavior.
