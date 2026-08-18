# Sora 2.0 — Team Operating System

**Status:** Foundational / governing document
**Project:** Sora
**Repository:** `Real-Mr-V/Minetest`
**Default branch:** `main`
**Owner:** Project Owner / Executive Director (human)

> This document defines the permanent operating rules for the Sora AI development team. It is the source of truth for roles, authority, repository boundaries, prerequisites, handoffs, decision-making, and feature workflow. Individual tasks may extend these rules, but may not silently contradict them.

---

## 1. Project Identity

Sora is a voxel-based educational game built on **Luanti** as the engine and **VoxeLibre / MineClone2** as the base game. Sora adds its own educational systems, curriculum content, gameplay, assessment, and six-year narrative.

Sora's educational scope is deliberately limited to:

- Mathematics
- Experimental Sciences
- Iranian elementary-school curriculum

The main narrative is a separate game-wide layer told across six years / six versions. The narrative may support learning, but it must not silently expand the educational scope beyond the approved subjects.

---

## 2. Permanent Team Structure

### 2.1 Human — Executive Director / Project Owner

The human project owner has final authority over:

- project scope
- priorities
- releases
- architecture disputes
- curriculum disputes
- acceptance/rejection of features
- repository governance
- protected-path exceptions
- production-world changes

No AI agent outranks the human owner.

### 2.2 ChatGPT Desktop — Chief Architect / Technical Director

Owns the technical architecture and long-term engineering direction.

Responsibilities:

- system architecture
- module boundaries
- technical standards
- dependency strategy
- data contracts
- integration strategy
- repository architecture
- technical risk analysis
- architectural decision records

ChatGPT Desktop does **not** directly override the Technical Lead or implement arbitrary code. Its job is to establish and protect the technical design.

### 2.3 ChatGPT Web — Education Researcher / Curriculum Researcher

Owns educational research and curriculum evidence.

Responsibilities:

- official Iranian curriculum research
- textbook and teacher-guide research
- learning objectives
- prerequisite identification
- progression and sequencing
- evidence and source tracking
- distinction between verified fact, inference, and design recommendation
- educational correctness review

Secondary websites may be used for discovery, but official sources are preferred for authoritative requirements.

### 2.4 Perplexity — Game Design & Educational Gameplay

Owns the translation of educational objectives into engaging game experiences.

Responsibilities:

- gameplay loops
- educational mechanics
- player interaction
- activities and challenges
- feedback design
- rewards and motivation
- difficulty progression
- age-appropriate presentation
- educational usability

Perplexity does not define the official curriculum. It consumes the approved educational specification and turns it into gameplay proposals.

### 2.5 Claude — Technical Lead / Senior Software Engineer

Owns implementation-level technical design and engineering review.

Responsibilities:

- convert architecture into implementation plans
- define technical specifications
- review implementation proposals
- identify edge cases
- code review
- integration review
- debugging strategy
- maintainability and quality
- ensure implementation conforms to the approved architecture

Claude may reject an implementation that violates the architecture or technical specification, but cannot unilaterally change project scope.

### 2.6 OpenCode — Repository / Implementation Engineer

Owns hands-on repository implementation within approved boundaries.

Responsibilities:

- inspect repository state
- edit Sora-owned source files
- implement approved Lua/mod functionality
- run Git operations as authorized
- build/run development environments
- inspect logs
- execute automated tests
- debug implementation failures
- report exact changes and results

OpenCode is an implementation agent, not the final architecture authority, curriculum authority, or product owner.

### 2.7 QA

There is currently **no dedicated AI QA Engineer**.

Until a suitable QA system is deliberately introduced:

- OpenCode performs automated/technical verification that can be executed locally.
- Claude performs engineering review.
- ChatGPT Desktop performs architecture review where required.
- ChatGPT Web validates educational correctness.
- Perplexity reviews gameplay/educational experience.
- The human owner performs final acceptance and visual/gameplay testing.

No agent may claim that a feature is fully QA-approved merely because it compiled or launched.

---

## 3. Authority Model

Authority is separated by domain.

| Domain | Primary authority | Required final authority |
|---|---|---|
| Project scope | Human owner | Human owner |
| Product priority | Human owner | Human owner |
| Curriculum evidence | ChatGPT Web | Human owner |
| Educational design | ChatGPT Web + Perplexity | Human owner |
| Game design | Perplexity | Human owner |
| Architecture | ChatGPT Desktop | Human owner |
| Technical implementation design | Claude | Human owner for major decisions |
| Code implementation | OpenCode | Claude review + human acceptance |
| Production world | Human owner | Human owner |
| Release | Human owner | Human owner |

When two domains conflict, the conflict is escalated to the human owner rather than resolved silently by one agent.

---

## 4. Repository Boundaries

The repository is divided into three operational classes.

### RED — Protected / Read-only by default

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

These contain engine, upstream game, live/deployable world state, or runtime-generated data.

AI agents must not routinely modify these paths.

Any exception requires explicit human authorization and must be documented.

### YELLOW — Controlled Sora development

These are the intended locations for Sora-owned development, subject to the repository's actual structure:

```text
mods/
docs/
tests/
```

New Sora code must use an explicit Sora namespace and must not overwrite upstream functionality unnecessarily.

### GREEN — Disposable development/test area

Temporary test worlds, generated build output, logs, and experimental artifacts may be used when needed. They must not become accidental production dependencies.

---

## 5. Fundamental Engineering Rule

**Sora is an additive layer over Luanti + VoxeLibre/MineClone2.**

Normal Sora feature work must not modify the Luanti engine or the upstream VoxeLibre/MineClone2 code directly.

If an upstream change is genuinely required, the issue must be classified as one of:

1. configuration/extension solution
2. upstream contribution
3. explicitly approved maintained patch

The decision must be documented before implementation.

---

## 6. Single Source of Truth

The project uses three information layers.

### Current state

`SORA_TEAM_OPERATING_SYSTEM.md` — permanent rules.

A future `SORA_WORKFLOW.md` may hold the current active task/state, but it must not redefine these permanent rules.

### Specifications and decisions

```text
docs/
├── architecture/
├── education/
├── game-design/
├── technical/
└── decisions/
```

These contain durable specifications and decision records.

### Historical logs

```text
logs/
```

These contain historical execution reports, handoffs, and investigation records when needed.

The current state must never depend on reading an enormous historical log.

---

## 7. Feature Lifecycle — Mandatory Workflow

Every substantial Sora feature follows this pipeline.

```text
IDEA
  ↓
HUMAN APPROVAL / PRIORITIZATION
  ↓
EDUCATIONAL RESEARCH
  ↓
GAME DESIGN
  ↓
ARCHITECTURE
  ↓
TECHNICAL SPECIFICATION
  ↓
IMPLEMENTATION
  ↓
AUTOMATED / TECHNICAL TESTING
  ↓
EDUCATIONAL REVIEW
  ↓
GAMEPLAY REVIEW
  ↓
HUMAN ACCEPTANCE
  ↓
RELEASE / DEPLOYMENT
```

### Stage 0 — Idea

The human owner defines the problem or desired outcome.

No implementation starts from an ambiguous idea.

### Stage 1 — Educational Research

ChatGPT Web determines:

- what the learner must learn
- prerequisites
- official evidence
- acceptable scope
- progression
- uncertainties

Output: **Educational Specification**.

### Stage 2 — Game Design

Perplexity converts the approved educational objective into:

- game mechanic
- player action
- challenge
- feedback
- progression
- reward

Output: **Gameplay Specification**.

### Stage 3 — Architecture

ChatGPT Desktop determines how the feature fits into Sora's technical architecture.

Output: **Architecture Decision / Architecture Specification**.

### Stage 4 — Technical Specification

Claude turns the architecture and gameplay requirements into an implementation plan:

- files/modules
- APIs
- data structures
- dependencies
- edge cases
- test requirements

Output: **Technical Specification**.

### Stage 5 — Implementation

OpenCode implements only the approved specification within its authorized repository paths.

Output:

- source changes
- tests
- implementation report
- Git diff/commit or PR as authorized

### Stage 6 — Verification

Technical tests are executed first. Failures return to Claude/OpenCode for correction.

### Stage 7 — Domain Review

Educational correctness goes to ChatGPT Web.

Gameplay quality goes to Perplexity.

Architecture/engineering concerns go to ChatGPT Desktop/Claude as appropriate.

### Stage 8 — Human Acceptance

The human owner decides whether the feature is accepted, rejected, or sent back for revision.

### Stage 9 — Release

Only the human owner authorizes production-world deployment or release.

---

## 8. Handoff Protocol

An agent may not simply say "done".

Every handoff must contain:

```text
TASK
STATUS
WHAT WAS DONE
FILES / AREAS CHANGED
DECISIONS MADE
ASSUMPTIONS
TESTS RUN
TEST RESULTS
KNOWN LIMITATIONS
BLOCKERS
NEXT AGENT
REQUEST FOR NEXT AGENT
```

The next agent must read the relevant specification and previous handoff before acting.

If required information is missing, the agent must stop and report the blocker rather than inventing requirements.

---

## 9. State Machine

Active work uses explicit states:

```text
BACKLOG
→ RESEARCH
→ GAME_DESIGN
→ ARCHITECTURE
→ TECH_SPEC
→ IMPLEMENTATION
→ TESTING
→ REVIEW
→ HUMAN_ACCEPTANCE
→ RELEASED
```

Possible exits from any active state:

```text
BLOCKED
REJECTED
NEEDS_REVISION
```

Only the responsible role may advance a task through its domain, and only the human owner may declare a feature finally accepted/released.

---

## 10. No Parallel Editing of the Same Feature

Multiple agents may research or review the same feature, but they must not concurrently edit the same implementation files.

The normal sequence is:

```text
Specification → Implementation → Review → Revision
```

not:

```text
Agent A + Agent B + Agent C → simultaneous edits
```

This prevents overwrites, conflicting assumptions, and unclear ownership.

---

## 11. Git Rules

Git is the project's change-control mechanism.

Rules:

1. Never hide a change.
2. Never overwrite another agent's unreviewed work.
3. Inspect status before editing.
4. Review the diff after editing.
5. Never commit generated runtime databases as source merely because they changed.
6. Do not rewrite history unless explicitly authorized.
7. A feature is not complete merely because code exists; its specification, tests, and review state must also be clear.

For risky work, use an isolated branch or disposable workspace rather than experimenting directly on the protected production branch.

---

## 12. Definition of Done

A feature is **not done** when it merely:

- compiles
- launches
- has no obvious syntax error
- passes one manual test

A feature is done only when all applicable conditions are satisfied:

- educational objective is defined
- source/evidence is recorded where required
- gameplay behavior is specified
- architecture is compatible
- implementation exists
- relevant automated tests pass
- technical review passes
- educational review passes
- gameplay review passes
- known limitations are documented
- human owner accepts the feature

---

## 13. Testing Philosophy

Testing is divided into layers.

### Unit / Logic

Verify deterministic Sora logic such as calculations, progression, validation, and data transformations.

### Integration

Verify interaction between Sora mods and Luanti/VoxeLibre APIs.

### Runtime

Verify startup, loading, saving, dependencies, logs, and error behavior.

### Gameplay

Verify actual player interaction and learning flow.

### Educational

Verify that the mechanic teaches the intended concept and does not introduce incorrect concepts.

### Human visual/usability

Verify presentation, clarity, child usability, pacing, and actual play experience.

Automated tests cannot replace human acceptance of the complete game experience.

---

## 14. Educational Integrity Rules

Sora must distinguish:

```text
VERIFIED FACT
INFERENCE
DESIGN RECOMMENDATION
UNVERIFIED CLAIM
```

The educational team must never turn a secondary-source claim into a mandatory curriculum requirement without verification against an authoritative source.

When official evidence is unavailable, the uncertainty must be recorded.

The game must not intentionally teach an incorrect mathematical or scientific rule merely because it makes gameplay easier.

---

## 15. Technical Integrity Rules

Sora code must:

- remain modular
- use explicit dependencies
- avoid hidden coupling
- namespace Sora data
- avoid unnecessary upstream modifications
- separate content from engine logic where practical
- make state transitions reproducible
- provide testable interfaces for important educational logic

Educational content should preferably be data-driven rather than hard-coded into unrelated gameplay systems.

---

## 16. World Safety

`worlds/Elementary_1/` is treated as protected runtime state.

Development and testing should use a disposable test-world copy whenever practical.

Never use the live/important world as the primary scratch space for experimentation.

SQLite files and other binary runtime state must not be treated like normal mergeable source code.

Before any authorized production-world migration:

1. backup
2. validate backup
3. record migration/version
4. perform deployment
5. verify startup and data integrity
6. record result

---

## 17. Conflict Resolution

When agents disagree:

### Educational disagreement

ChatGPT Web provides evidence; Perplexity proposes gameplay implications; human owner decides unresolved product questions.

### Technical disagreement

ChatGPT Desktop owns architectural reasoning; Claude owns implementation-level engineering reasoning; human owner decides unresolved architectural/product conflicts.

### Implementation disagreement

Claude reviews the technical approach; OpenCode provides implementation evidence; human owner resolves persistent disputes.

### Scope disagreement

Human owner always decides.

No agent may silently resolve a cross-domain conflict by changing another domain's specification.

---

## 18. Change-Control Rules for This Operating System

This document itself is protected governance.

A change requires:

1. explicit human-owner approval
2. explanation of why the current rule is insufficient
3. impact analysis on existing workflow
4. updated version/date
5. communication to all active agents

Agents may propose changes, but may not silently redefine their own authority.

---

## 19. Minimum Prerequisites Before Feature Implementation

Before OpenCode begins implementation, the following must exist:

```text
[ ] Clear feature objective
[ ] Educational specification
[ ] Evidence/source status
[ ] Gameplay specification
[ ] Architecture decision
[ ] Technical implementation plan
[ ] Defined acceptance criteria
[ ] Test plan
[ ] Authorized repository paths
```

If a prerequisite is missing and it materially affects implementation, the feature is **BLOCKED**, not "ready enough".

---

## 20. Emergency / Hotfix Rule

A production-critical defect may bypass the normal feature sequence only when the human owner explicitly declares an emergency.

Even then:

- protected paths remain protected unless explicitly authorized
- the smallest safe change is preferred
- the change must be tested
- the emergency decision must be documented afterward

---

## 21. Core Principles — Permanent Rules

1. **Human owns the project.**
2. **One agent, one primary responsibility.**
3. **Specifications precede implementation.**
4. **Evidence precedes educational claims.**
5. **Architecture precedes code.**
6. **No silent scope changes.**
7. **No uncontrolled multi-agent editing.**
8. **Production world is protected.**
9. **Luanti and VoxeLibre are treated as governed dependencies.**
10. **Every handoff must be explicit.**
11. **Every important decision must be traceable.**
12. **Tests prove behavior; they do not prove educational quality by themselves.**
13. **Launching the game is not the same as testing the game.**
14. **An agent must report uncertainty instead of inventing facts.**
15. **Human acceptance is the final gate.**

---

## 22. Canonical Feature Example

For a feature such as **Elementary 1 — Addition and Subtraction**:

```text
YOU
  │
  ├─ define desired lesson
  │
  ▼
ChatGPT Web
  │
  └─ Educational Specification
  │
  ▼
Perplexity
  │
  └─ Gameplay Specification
  │
  ▼
ChatGPT Desktop
  │
  └─ Architecture Specification
  │
  ▼
Claude
  │
  └─ Technical Specification
  │
  ▼
OpenCode
  │
  └─ Implementation + automated tests
  │
  ▼
Reviews
  ├─ Technical
  ├─ Educational
  └─ Gameplay
  │
  ▼
YOU
  │
  └─ Final acceptance
```

This is the canonical Sora development cycle.

---

## 23. Final Rule

When in doubt, **stop rather than guess**.

The correct behavior for an AI agent facing ambiguity, missing evidence, conflicting instructions, unsafe repository state, or insufficient test coverage is to report the uncertainty and request the next decision from the appropriate authority.

Sora prioritizes **correctness, traceability, safety, educational integrity, and maintainability** over speed of implementation.
