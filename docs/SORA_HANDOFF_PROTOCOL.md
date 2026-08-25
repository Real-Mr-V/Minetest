# Sora Handoff Protocol

**Project:** Sora Educational Game  
**Status:** Active workflow rule  
**Last updated:** 2026-08-25

## Purpose

This document defines how work moves between Sora team members without duplicated authority or conflicting implementation.

## Mandatory sequence

For a normal feature:

```text
Human Authorization
      ↓
ChatGPT Web — Education Research + Game Design
      ↓
ChatGPT Desktop — Architecture
      ↓
Hermes — Technical Specification
      ↓
Qwen Code — Implementation Preparation
      ↓
Hermes — Technical Gate
      ↓
OpenCode — Production Implementation
      ↓
Hermes — Engineering Review
      ↓
Human — Final Acceptance
```

ChatGPT Web owns both education research and educational gameplay design because Perplexity is no longer a team member. Claude is no longer a team member; Hermes owns the Technical Lead function.

A stage may be skipped only when the Human Project Owner explicitly approves the exception and the reason is recorded.

## Handoff record

Every formal handoff must contain:

```text
TASK ID:
FROM:
TO:
FEATURE:
CURRENT PHASE:
STATUS:
AUTHORITATIVE INPUTS:
DECISIONS ALREADY MADE:
TASK:
ALLOWED PATHS:
FORBIDDEN PATHS:
CONSTRAINTS:
EXPECTED OUTPUT:
ACCEPTANCE CRITERIA:
BLOCKERS:
NEXT OWNER:
EXACT NEXT ACTION:
```

## Engineering separation

### Qwen Code

Prepares. It investigates the repository and creates the implementation-ready surface and handoff package from an approved technical specification. It is not the production implementation owner.

### OpenCode

Implements. It executes the approved implementation package in authorized source paths. It does not act as an independent architect.

### Hermes

Governs engineering. It converts architecture into technical specifications, resolves engineering ambiguity, controls the preparation gate, and reviews implementation.

### ChatGPT Desktop

Owns architecture. It resolves system-level architectural decisions and does not routinely implement production feature code.

### ChatGPT Web

Owns curriculum evidence and Game Design & Educational Gameplay. It does not own software architecture or production implementation.

## Escalation

```text
Educational ambiguity
    → ChatGPT Web

Gameplay ambiguity
    → ChatGPT Web

Architectural ambiguity
    → ChatGPT Desktop

Technical specification ambiguity
    → Hermes

Implementation ambiguity
    → Hermes

Project-scope / governance conflict
    → Human Project Owner
```

## Stop conditions

An agent must stop and escalate if:

- the requested change conflicts with an approved architecture;
- required files are outside its authorized scope;
- a protected path must be modified;
- the specification is contradictory or incomplete;
- the change would materially expand project scope;
- the agent cannot determine whether a behavior is intentional.

## Current execution rule

Issue #1 is the first active development order. Its scope is **main Sora story first**, beginning with the required first-entry spawn for `Elementary_1`. Educational lesson implementation must not begin before the story phase is addressed.
