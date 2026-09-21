---
name: "speckit-constitution"
description: "Create or update the project constitution from interactive or provided principle inputs."
metadata:
  author: "github-spec-kit"
  source: "templates/commands/constitution.md"
---

Read and follow the [shared speckit-constitution instructions](../../../.github/skills/speckit-constitution/SKILL.md).
Resolve relative links in that document from its own directory.
Use the user's request as the value of `$ARGUMENTS`.
When those instructions name a Copilot `/speckit-<command>` invocation,
use the corresponding Codex `$speckit-<command>` skill instead.
Keep workflow rules in the shared file; this file is only a Codex entry point.
