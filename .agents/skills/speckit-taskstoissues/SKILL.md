---
name: "speckit-taskstoissues"
description: "Convert existing tasks into actionable, dependency-ordered GitHub issues for the feature based on available design artifacts."
metadata:
  author: "github-spec-kit"
  source: "templates/commands/taskstoissues.md"
---

Read and follow the [shared speckit-taskstoissues instructions](../../../.github/skills/speckit-taskstoissues/SKILL.md).
Resolve relative links in that document from its own directory.
Use the user's request as the value of `$ARGUMENTS`.
When those instructions name a Copilot `/speckit-<command>` invocation,
use the corresponding Codex `$speckit-<command>` skill instead.
Keep workflow rules in the shared file; this file is only a Codex entry point.
