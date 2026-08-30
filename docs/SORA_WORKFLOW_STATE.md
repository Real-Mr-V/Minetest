# SORA Workflow State

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Branch:** `main`  
**Status:** ACTIVE DEVELOPMENT — ISSUE #1  
**Last updated:** 2026-08-26

## 1. Authoritative current state

Sora has entered development under GitHub Issue #1: **SORA: Initial spawn and story-first development handoff**.

Current team:

- Human — Project Owner / Executive Manager
- ChatGPT Desktop — Chief Architect / Technical Director
- ChatGPT Web — Education Researcher + Game Design & Educational Gameplay
- Hermes — Technical Lead / Senior Software Engineer
- OpenCode — Production Implementation Engineer

Claude, Perplexity, and Qwen Code are removed and must not receive assignments.

## 2. Active development order

**Issue:** #1  
**Title:** SORA: Initial spawn and story-first development handoff  
**Priority:** Main SORA story first  
**First-entry requirement:** player must spawn at `541, 17, -98` on first entry.  
**Story source:** `sora_story/main story_elementary_1.docx`  
**Educational lessons:** blocked until the main story phase is addressed.

Issue #1 explicitly authorizes development, overriding the previous pre-development standby state for this task only.

## 3. Current workflow

```text
Human Authorization / Issue #1
        ↓
ChatGPT Web — Education + Gameplay Context
        ↓
ChatGPT Desktop — Architecture
        ↓
Hermes — Technical Specification + Implementation Preparation
        ↓
Hermes — Technical Gate
        ↓
OpenCode — Production Implementation
        ↓
Hermes — Engineering Review
        ↓
Human — Final Acceptance
```

No phase transition is automatic. Each transition requires a recorded handoff.

## 4. Current phase

```text
CURRENT PHASE:    HERMES PREP — TASK 002 EXPANSION
CURRENT ISSUE:    #1 / TASK 002 (expanded)
ACTIVE FEATURE:   First-entry pre-history cutscene + black stone + luminous guide
CURRENT OWNER:    Hermes — Technical Lead (preparation ready)
PHASE STATUS:     READY_FOR_IMPLEMENTATION — gate passed
NEXT HANDOFF:     OpenCode — Production Implementation
```

Hermes completed preparation and passed the technical gate (see `docs/workflow/SORA_TASK_002_CUTSCENE_PREPARATION.md`). OpenCode may now begin production implementation of the cutscene.

## 5. Responsibility boundaries

### Human
Final authority, scope, priority, protected-path exceptions, release and acceptance.

### ChatGPT Web
Education research and educational gameplay design. For Issue #1 it supplies the existing story/game-design context and does not expand the educational scope.

### ChatGPT Desktop
Architecture, technical direction, system boundaries, integration strategy, and architecture decisions.

### Hermes
Technical specification, engineering constraints, dependency analysis, implementation preparation, preparation gate, and engineering review.

### OpenCode
Sole production implementation owner, after Hermes marks preparation `READY`.

## 6. Programming separation

```text
Hermes    = SPECIFY + PREPARE + GOVERN + REVIEW
OpenCode  = IMPLEMENT
```

There is one production programmer. Hermes does not become a parallel production programmer merely because it prepares implementation.

## 7. Protected repository boundaries

Unless explicitly authorized by the Human Project Owner:

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

remain protected. The issue does not authorize direct modification of protected upstream or live-world paths merely because they are related to spawn behavior.

The designated Sora mod location remains `mods/`, marked by `mods/Sora mods location.txt`.

## 8. Handoff protocol

Every formal handoff must contain:

```text
TASK ID:
FROM:
TO:
FEATURE:
PHASE:
STATUS:
INPUTS:
TASK:
ALLOWED PATHS:
FORBIDDEN PATHS:
EXPECTED OUTPUT:
ACCEPTANCE CRITERIA:
BLOCKERS:
NEXT OWNER:
EXACT NEXT ACTION:
```

## 9. Definition of completion for Issue #1

The issue is not complete merely because code is written. Completion requires:

- the first-entry spawn behavior is implemented according to the approved technical specification;
- story-first ordering is preserved;
- no educational lesson implementation is introduced prematurely;
- applicable checks are actually run and reported;
- Hermes completes engineering review;
- human performs final acceptance.

If actual visual/play testing is required and cannot be performed by an AI tool, it remains a Human verification responsibility.
