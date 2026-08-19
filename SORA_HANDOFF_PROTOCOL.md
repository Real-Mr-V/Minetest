# Sora Handoff Protocol

**Project:** Sora Educational Game  
**Status:** Active workflow rule  
**Last updated:** 2026-08-19

## Purpose

This document defines how work moves between Sora team members without duplicated authority or parallel conflicting implementation.

## Mandatory sequence

For a normal feature:

```text
Human Authorization
      ↓
ChatGPT Web — Education Research
      ↓
Perplexity — Game Design
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

A stage may be skipped only when the human project owner explicitly approves the exception and the reason is recorded.

## Handoff record

Every formal handoff must contain:

```text
FROM:
TO:
FEATURE:
CURRENT PHASE:
STATUS:
INPUTS:
DECISIONS ALREADY MADE:
TASK:
CONSTRAINTS:
EXPECTED OUTPUT:
BLOCKERS:
NEXT OWNER:
```

## Engineering separation

### Qwen Code

Prepares. It investigates the repository and creates an implementation-ready plan based on an approved technical specification.

### OpenCode

Implements. It executes the approved implementation plan and does not act as an independent architect.

### Hermes

Governs engineering. It converts architecture into technical specifications, resolves engineering ambiguity, and reviews implementation.

### ChatGPT Desktop

Owns architecture. It resolves system-level architectural decisions and remains above implementation details unless intervention is required.

## Escalation

```text
Educational ambiguity
    → ChatGPT Web

Gameplay ambiguity
    → Perplexity

Architectural ambiguity
    → ChatGPT Desktop

Technical specification ambiguity
    → Hermes

Implementation ambiguity
    → Hermes

Project-scope conflict
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

## Current state

No feature is currently active and no development order has been issued. This protocol is therefore currently a governance rule, not an active task assignment.
