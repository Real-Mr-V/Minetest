# Sora Workflow State

**Status:** ACTIVE — Development Kickoff
**Version:** 1.0
**Date:** 2026-08-19
**Owner:** Human Project Owner / Executive Director

## Current Objective

Begin the first real Sora vertical slice without destabilizing the Luanti/VoxeLibre platform or the protected `Elementary_1` world.

## Current Feature

**Elementary Grade 1 Mathematics — Addition and Subtraction**

This is the first implementation slice and must remain intentionally narrow.

## Current State

```text
BACKLOG → RESEARCH
```

## Current Owner

**ChatGPT Web — Education Researcher**

## Next Exact Action

Produce an evidence-based curriculum specification for Grade 1 addition and subtraction using the official Iranian textbook and official teacher guide as primary authorities. Clearly separate verified facts from secondary-source findings, inferences, and proposals.

The output must define:

- exact curriculum references where available;
- learning objectives;
- prerequisites;
- sequencing;
- number/value domain;
- representations and instructional progression;
- examples from the official material;
- unresolved questions requiring human or source verification;
- educational acceptance criteria for the game feature.

Do not write production code.

## Handoff Sequence

```text
ChatGPT Web
    ↓
Perplexity
    ↓
ChatGPT Desktop
    ↓
Claude
    ↓
Qwen Code
    ↓
Claude Preparation Gate
    ↓
OpenCode
    ↓
Claude Engineering Review
    ↓
Perplexity + ChatGPT Web specialist review
    ↓
Human play/acceptance
```

## Repository Safety

### Forbidden for routine feature work

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

### Current development surface

```text
mods/
docs/
```

Agents must use only task-authorized paths.

## Handoff Record

Each owner must update the workflow record when the task is complete or blocked. The next owner must not infer a handoff from a chat conversation alone.

Required fields:

```text
TASK ID
STATUS
OWNER
OBJECTIVE
AUTHORITATIVE INPUTS
OUTPUT
FILES CHANGED
TOOLS/COMMANDS USED
VERIFICATION
ASSUMPTIONS
LIMITATIONS
BLOCKERS
NEXT OWNER
EXACT NEXT ACTION
```

## Active Decision Rules

1. The Constitution is authoritative.
2. The Team Operating System controls execution.
3. One owner acts at a time on the active feature lane unless explicit parallel work is declared.
4. Qwen Code prepares; OpenCode implements.
5. Claude controls the preparation gate.
6. Architecture changes require ChatGPT Desktop.
7. Product/scope/governance changes require the human.
8. Educational claims require evidence.
9. No agent may claim execution or play-testing it did not perform.

## Start Condition

Development implementation is **NOT YET READY**.

The first gate is completion and review of the official curriculum research package. Only after that package is accepted does the feature move to gameplay design.
