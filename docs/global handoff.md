# Sora Global Handoff Log

This document is the mandatory chronological history of the Sora project.

## Permanent rule

**Every action performed for Sora must be recorded in this file.**

This includes, at minimum:

- repository inspections;
- documentation reviews;
- issue analysis;
- decisions and architectural decisions;
- workflow changes;
- research and findings that affect the project;
- files created, modified, or deleted;
- implementation work;
- tests and their results;
- blockers and escalations;
- approvals and handoffs;
- changes to team membership or roles.

An action is not considered fully handed off until its relevant outcome is recorded here. Entries must be concise but contain enough information for the next team member to understand what happened, why it happened, and what must happen next.

## Reporting protocol

For every material action, record:

```text
DATE:
ACTOR:
ACTION:
REASON / AUTHORITY:
INPUTS:
RESULT:
FILES AFFECTED:
DECISIONS:
BLOCKERS:
NEXT OWNER:
NEXT ACTION:
```

Do not rewrite history to hide previous actions. Corrections must be appended as a new entry.

---

## 2026-08-25 — Repository / Issue #1 synchronization

**ACTOR:** ChatGPT Desktop / Chief Architect & Technical Director  
**ACTION:** Repository governance and Issue #1 workflow synchronization.  
**REASON / AUTHORITY:** Project Owner instruction: all work must be recorded in `docs/global handoff.md`; existing Sora documentation and active GitHub Issue #1 were reviewed before action.

### Inputs reviewed

- All currently relevant documents under `docs/`, including the Sora constitution, team roles, workflow state, handoff protocol, architecture baseline, and this global handoff log.
- GitHub Issue #1: `SORA: Initial spawn and story-first development handoff`.
- Repository state and the `Elementary_1` world configuration.

### Issue #1 scope confirmed

Issue #1 establishes the first active development order:

1. Main Sora story must be addressed before curriculum lesson implementation.
2. The first-entry spawn for `Elementary_1` is required at `541, 17, -98`.
3. The story source is `sora_story/main story_elementary_1.docx`.
4. The Issue does not authorize unrestricted modification of protected engine, upstream-game, or live-world paths.

### Workflow decision

For this Issue the engineering path remains:

```text
Issue / Human Authorization
        ↓
ChatGPT Web — Education + Gameplay input when required
        ↓
ChatGPT Desktop — Architecture
        ↓
Hermes — Technical Specification
        ↓
Qwen Code — Implementation Preparation
        ↓
Hermes — Preparation / Technical Gate
        ↓
OpenCode — Production Implementation
        ↓
Hermes — Engineering Review
        ↓
Human — Final Acceptance
```

Qwen Code and OpenCode remain deliberately separated: **Qwen Code prepares; OpenCode implements.** Hermes governs the technical specification, gate, and review stages.

### Repository safety decision

No changes were made to:

- `luanti/`
- `games/mineclone2/`
- `worlds/Elementary_1/`
- `mod_data/`

The live world remains protected. The requested spawn coordinate therefore requires an approved implementation path rather than an ad-hoc direct edit of runtime world state.

### Documentation action

`docs/SORA_HANDOFF_PROTOCOL.md` was synchronized with the current team and Issue #1 workflow. The document now explicitly records ChatGPT Web as Education/Game Design, Hermes as Technical Lead/Senior Software Engineer, Qwen Code as implementation preparation, and OpenCode as production implementation.

### Result

- Repository documentation and active Issue scope are aligned.
- Issue #1 is the current development order.
- Story-first development is active for the Issue's scope.
- No production feature implementation was performed during this synchronization.

### Next owner

**Hermes**

### Next action

Produce the technical specification for Issue #1, including the approved mechanism for first-entry spawn at `541,17,-98`, while respecting protected-path and deployment boundaries.

---

## 2026-08-25 — Issue #1 Technical Specification

**ACTOR:** ChatGPT Desktop / Chief Architect & Technical Director  
**ACTION:** Inspected the active Issue #1 and current Sora governance documents, then created the technical specification for the first-entry spawn/story-first implementation boundary.  
**REASON / AUTHORITY:** Issue #1 is the active development order. The project constitution requires architecture before implementation and explicit handoffs.

### Inputs

- GitHub Issue #1, `SORA: Initial spawn and story-first development handoff`.
- `docs/SORA_PROJECT_CONSTITUTION.md`.
- Current `docs/` governance file inventory.
- Existing `docs/global handoff.md`.

### Result

Created:

```text
docs/SORA_ISSUE_1_TECHNICAL_SPEC.md
```

The specification defines:

- Issue #1 scope and exact spawn coordinate `541,17,-98`;
- canonical story source `sora_story/main story_elementary_1.docx`;
- protected-path constraints;
- first-entry/idempotent initialization semantics;
- recommended Sora-owned implementation boundary;
- persistent state requirements;
- implementation-preparation requirements for Qwen Code;
- production implementation requirements for OpenCode;
- acceptance criteria;
- unresolved technical decisions that must be settled during preparation;
- the required handoff chain.

### Important limitation

The GitHub text interface does not expose the internal text of the DOCX story source. Therefore the specification deliberately does **not** claim to have extracted or validated the full narrative. Narrative implementation requirements must be derived from the actual DOCX contents before implementation.

### Safety decision

No protected path was modified. No production source code was implemented. No lesson/educational gameplay was added.

### Next owner

**Hermes**

### Next action

Review and govern the specification, then hand the approved technical requirements to **Qwen Code** for implementation preparation. Qwen Code must inspect the actual repository implementation surface and produce a preparation package; it must not implement production code.

---

## Project origin

Sora's original story is stored in the `sora_story` folder.

Previous entries in this document must remain intact. New events and decisions are appended chronologically below this line.
