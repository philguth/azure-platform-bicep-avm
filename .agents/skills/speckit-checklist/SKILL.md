---
name: "speckit-checklist"
description: "Generate a custom checklist for the current feature based on user requirements."
metadata:
  author: "github-spec-kit"
  source: "templates/commands/checklist.md"
---

Read and follow the [shared speckit-checklist instructions](../../../.github/skills/speckit-checklist/SKILL.md).
Resolve relative links in that document from its own directory.
Use the user's request as the value of `$ARGUMENTS`.
When those instructions name a Copilot `/speckit-<command>` invocation,
use the corresponding Codex `$speckit-<command>` skill instead.
Keep workflow rules in the shared file; this file is only a Codex entry point.
