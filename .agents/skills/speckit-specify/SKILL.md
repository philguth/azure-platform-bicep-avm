---
name: "speckit-specify"
description: "Create or update the feature specification from a natural language feature description."
metadata:
  author: "github-spec-kit"
  source: "templates/commands/specify.md"
---

Read and follow the [shared speckit-specify instructions](../../../.github/skills/speckit-specify/SKILL.md).
Resolve relative links in that document from its own directory.
Use the user's request as the value of `$ARGUMENTS`.
When those instructions name a Copilot `/speckit-<command>` invocation,
use the corresponding Codex `$speckit-<command>` skill instead.
Keep workflow rules in the shared file; this file is only a Codex entry point.
