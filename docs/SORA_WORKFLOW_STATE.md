# SORA Workflow State

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Branch:** `main`  
**Status:** PRE-DEVELOPMENT / DEVELOPMENT NOT AUTHORIZED  
**Last updated:** 2026-08-19

## 1. Authoritative current state

Sora is still in pre-development preparation. The current team is:

- Human — Project Owner / Executive Manager
- ChatGPT Desktop — Chief Architect / Technical Director
- ChatGPT Web — Education Researcher + Game Design & Educational Gameplay
- Hermes — Technical Lead / Senior Software Engineer
- Qwen Code — Implementation Preparation Engineer
- OpenCode — Production Implementation Engineer

Claude and Perplexity are removed and must not receive assignments.

No development order has been issued. Team reorganization and document maintenance do not authorize development.

## 2. Current workflow

```text
Human Authorization
        ↓
ChatGPT Web — Education + Gameplay
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

No phase transition is automatic.

## 3. Responsibility boundaries

### Human
Final authority, authorization, scope, priority, protected-path exceptions, and acceptance.

### ChatGPT Web
Owns curriculum research and educational gameplay design. This role combines the responsibilities previously split between ChatGPT Web and Perplexity.

### ChatGPT Desktop
Owns architecture, technical direction, system boundaries, integration strategy, and architecture decisions.

### Hermes
Owns technical specifications, engineering constraints, dependency analysis, technical gate, and engineering review. Hermes replaced Claude in the technical-lead position.

### Qwen Code
Prepares implementation-ready work from an approved specification. It does not own production implementation.

### OpenCode
Performs the authorized production implementation. It does not redesign architecture or educational/gameplay requirements independently.

## 4. Qwen Code / OpenCode separation

```text
Qwen Code = PREPARE
OpenCode  = IMPLEMENT
Hermes    = GOVERN + REVIEW
```

They are not parallel programmers. Qwen Code prepares; OpenCode implements.

Ambiguity in preparation → Hermes, with architectural questions escalated to ChatGPT Desktop.  
Ambiguity during implementation → Hermes.  
No agent may silently invent an architectural exception.

## 5. First planned feature

**Elementary Grade 1 Mathematics — Addition and Subtraction**

Status: `PLANNED` only.

## 6. Handoff protocol

Every formal handoff must contain:

```text
FROM:
TO:
FEATURE:
PHASE:
STATUS:
INPUTS:
TASK:
CONSTRAINTS:
EXPECTED OUTPUT:
BLOCKERS:
NEXT OWNER:
```

A document, conversation, research result, commit, or previous task does not create an implicit assignment.

## 7. Protected repository boundaries

Unless explicitly authorized by the Human Project Owner:

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

remain protected. `Elementary_1` is live/runtime world state and is not the normal development workspace.

## 8. Current handoff record

```text
CURRENT PHASE:       PRE-DEVELOPMENT
CURRENT STATUS:      READY_FOR_DEVELOPMENT_ORDER
ACTIVE FEATURE:      NONE
ACTIVE OWNER:        NONE
AUTHORIZATION:       NOT GRANTED
```

The next transition requires an explicit development order from the Human Project Owner.

## 9. Governing rule

> **No implicit orders. No autonomous phase transitions. One clear owner per responsibility. No parallel production programmers. No production implementation without an approved specification and explicit authorization.**
