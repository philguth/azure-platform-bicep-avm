---
name: "speckit-plan"
description: "Execute the implementation planning workflow using the plan template to generate design artifacts."
metadata:
  author: "github-spec-kit"
  source: "templates/commands/plan.md"
---

Read and follow the [shared speckit-plan instructions](../../../.github/skills/speckit-plan/SKILL.md).
Resolve relative links in that document from its own directory.
Use the user's request as the value of `$ARGUMENTS`.
When those instructions name a Copilot `/speckit-<command>` invocation,
use the corresponding Codex `$speckit-<command>` skill instead.
Keep workflow rules in the shared file; this file is only a Codex entry point.
