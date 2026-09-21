---
name: "speckit-clarify"
description: "Identify underspecified areas in the current feature spec by asking up to 5 highly targeted clarification questions and encoding answers back into the spec."
metadata:
  author: "github-spec-kit"
  source: "templates/commands/clarify.md"
---

Read and follow the [shared speckit-clarify instructions](../../../.github/skills/speckit-clarify/SKILL.md).
Resolve relative links in that document from its own directory.
Use the user's request as the value of `$ARGUMENTS`.
When those instructions name a Copilot `/speckit-<command>` invocation,
use the corresponding Codex `$speckit-<command>` skill instead.
Keep workflow rules in the shared file; this file is only a Codex entry point.
