# SORA Workflow State

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Branch:** `main`  
**Document role:** Authoritative workflow state and handoff record  
**Status:** PRE-DEVELOPMENT / NOT AUTHORIZED FOR IMPLEMENTATION  
**Last updated:** 2026-08-19

---

## 1. Current project state

Sora remains in the **pre-development preparation phase**.

The project owner has changed the team composition:

- **Claude has been removed from the Sora team.**
- **Hermes has replaced Claude** as the team's technical lead / senior engineering role.

This change does **not** constitute a development order.

**No development order has been issued to the Sora team.**

No team member currently has authorization to:

- implement a Sora feature;
- create production Sora code;
- modify the live `Elementary_1` world;
- modify `luanti/`;
- modify `games/mineclone2/`;
- begin the first Vertical Slice;
- treat previous discussions, research, capability tests, or this team change as a development assignment.

The project remains on standby until the human project owner explicitly authorizes development.

---

## 2. Current workflow state

```text
PROJECT PREPARATION
        ↓
TEAM / ROLE DEFINITION
        ↓
REPOSITORY SAFETY & GOVERNANCE
        ↓
WORKFLOW DOCUMENTATION
        ↓
[CURRENT STATE]
READY FOR DEVELOPMENT ORDER
        ↓
HUMAN AUTHORIZATION REQUIRED
        ↓
RESEARCH
        ↓
GAME DESIGN
        ↓
ARCHITECTURE
        ↓
TECHNICAL SPECIFICATION
        ↓
IMPLEMENTATION PREPARATION
        ↓
IMPLEMENTATION
        ↓
ENGINEERING REVIEW
        ↓
HUMAN ACCEPTANCE
```

The workflow must not advance automatically merely because a document exists or an agent has completed an earlier activity.

Every transition requires an explicit handoff.

---

## 3. First planned development target

The first planned Sora development target remains:

> **Elementary Grade 1 Mathematics — Addition and Subtraction**

This is a **planned target only** and is not currently active.

The educational scope must first be established from official Iranian curriculum materials before implementation begins.

---

## 4. Team and authority model

### Human Project Owner / Executive Manager

**Role:** Project Owner, Executive Manager, final authority

Responsibilities:

- issue development orders;
- approve or reject phase transitions;
- resolve conflicts;
- approve project-wide architectural changes;
- authorize changes to protected infrastructure;
- perform final product acceptance.

No AI agent may override the human project owner.

### ChatGPT Desktop

**Role:** Chief Architect / Technical Director

Owns:

- system architecture;
- technical boundaries;
- integration strategy;
- architectural decisions;
- repository-level technical governance;
- technical coordination after authorization.

ChatGPT Desktop does not independently authorize implementation.

### ChatGPT Web

**Role:** Education Researcher

Owns:

- official curriculum research;
- textbook and teacher-guide analysis;
- learning objectives;
- educational constraints;
- curriculum traceability.

It does not independently convert research into production implementation.

### Perplexity

**Role:** Game Design & Educational Gameplay

Owns:

- educational gameplay design;
- game mechanics;
- player interaction design;
- game loops;
- progression and feedback concepts;
- mapping approved learning objectives into gameplay.

It does not redefine the curriculum or technical architecture.

### Hermes

**Role:** Technical Lead / Senior Software Engineer

Hermes replaces Claude in the technical leadership position.

Owns:

- converting approved architecture into technical specifications;
- engineering design;
- implementation constraints;
- dependency and integration analysis;
- code-quality standards;
- technical risk analysis;
- review of implementation prepared or produced by the engineering agents;
- deciding whether an implementation is technically ready for human acceptance.

Hermes is the **technical gatekeeper** between architecture/specification and production implementation.

Hermes does not replace ChatGPT Desktop as Chief Architect and does not replace the human project owner as final authority.

### Qwen Code

**Role:** Implementation Preparation Engineer

Owns:

- detailed repository inspection for an assigned task;
- identifying exact files and modules involved;
- preparing implementation-ready plans;
- dependency checks;
- identifying integration points;
- preparing implementation sequences;
- preparing validation checklists.

Qwen Code is **not the primary production implementer**.

Qwen Code must not independently redesign the architecture.

### OpenCode

**Role:** Production Implementation Engineer

Owns:

- implementing approved technical specifications;
- writing Sora production code;
- modifying only authorized paths;
- performing appropriate local validation;
- reporting changed files and implementation results.

OpenCode is the **primary production implementer**.

OpenCode must not independently redefine educational requirements, gameplay design, or system architecture.

---

## 5. Critical separation of engineering roles

There are deliberately **not two equal-level programmers**.

```text
ChatGPT Desktop
Chief Architect / Technical Director
        ↓
Hermes
Technical Lead / Senior Software Engineer
        ↓
Qwen Code
Implementation Preparation
        ↓
OpenCode
Production Implementation
        ↓
Hermes
Technical Review / Gate
```

The intended distinction is:

**Qwen Code prepares. OpenCode implements. Hermes reviews and governs the engineering quality.**

Qwen Code and OpenCode must not work as independent parallel programmers on the same feature.

If Qwen Code discovers an architectural ambiguity, it escalates to Hermes and/or ChatGPT Desktop rather than inventing a new architecture.

If OpenCode discovers an ambiguity that cannot be resolved from the approved specification, it stops and escalates rather than making an unapproved design decision.

---

## 6. Standard feature workflow

### Phase 0 — Human Authorization

The human project owner explicitly activates a feature.

Required:

- feature name;
- educational scope;
- desired outcome;
- constraints;
- explicit authorization.

Until this occurs, the feature is `PLANNED`, not active.

### Phase 1 — Education Research

**Owner:** ChatGPT Web

Produces:

- official-source research;
- learning objectives;
- curriculum boundaries;
- age/grade constraints;
- source traceability;
- unresolved questions.

### Phase 2 — Educational Gameplay Design

**Owner:** Perplexity

Uses the approved educational research to produce:

- gameplay loop;
- mechanics;
- player actions;
- feedback model;
- progression;
- educational-to-gameplay mapping.

### Phase 3 — Architecture

**Owner:** ChatGPT Desktop

Produces:

- architecture decisions;
- module boundaries;
- data flow;
- integration points;
- repository paths;
- technical constraints.

### Phase 4 — Technical Specification

**Owner:** Hermes

Produces:

- implementation specification;
- interfaces/APIs where needed;
- file-level change plan;
- dependencies;
- edge cases;
- acceptance criteria;
- engineering risks;
- implementation constraints.

Hermes may return the architecture to ChatGPT Desktop if the proposed implementation cannot be supported safely or cleanly.

### Phase 5 — Implementation Preparation

**Owner:** Qwen Code

Produces:

- implementation-ready task;
- exact relevant files;
- existing-code analysis;
- dependency checks;
- implementation sequence;
- validation checklist.

Qwen Code must stay within the approved architecture and specification.

### Phase 6 — Production Implementation

**Owner:** OpenCode

Produces:

- production code;
- authorized configuration/content changes;
- implementation report;
- validation results;
- modified-file list.

### Phase 7 — Engineering Review

**Owner:** Hermes

Checks:

- specification compliance;
- architecture compliance;
- code quality;
- scope discipline;
- dependency correctness;
- maintainability;
- identifiable regressions.

Hermes may reject the implementation and return it to OpenCode with actionable corrections.

### Phase 8 — Human Acceptance

**Owner:** Human Project Owner

The feature is not accepted merely because Hermes approves it.

Final product acceptance belongs to the human project owner.

---

## 7. Handoff protocol

Every formal handoff must state:

```text
FROM:
TO:
FEATURE:
CURRENT PHASE:
STATUS:
INPUTS:
TASK:
CONSTRAINTS:
EXPECTED OUTPUT:
BLOCKERS:
NEXT OWNER:
```

An agent must not infer a new assignment merely from a previous conversation, commit, research document, or capability test.

---

## 8. Status vocabulary

- `PLANNED` — identified but not active.
- `AUTHORIZED` — explicitly authorized by the human owner.
- `IN_PROGRESS` — actively being worked on.
- `BLOCKED` — cannot continue without a decision/input.
- `READY_FOR_REVIEW` — deliverable is complete and awaiting review.
- `REJECTED` — reviewer found actionable problems.
- `APPROVED` — required technical/research review passed.
- `IMPLEMENTED` — implementation exists.
- `ACCEPTED` — human owner accepted the result.

Current project status:

```text
READY_FOR_DEVELOPMENT_ORDER
```

---

## 9. Protected repository boundaries

Unless explicitly authorized by the human project owner:

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

are protected.

The live `Elementary_1` world is runtime state and is not the normal development workspace.

Development and testing should use a disposable/test world whenever execution-based validation is required.

---

## 10. Git and change discipline

Every implementation must be:

1. traceable to an authorized task;
2. limited to approved scope;
3. reviewable;
4. reported with modified paths;
5. isolated from unrelated work.

No agent may perform opportunistic refactoring outside its assignment.

No agent may modify protected infrastructure merely because it is convenient.

---

## 11. Current handoff record

### Current phase

`PRE-DEVELOPMENT`

### Current status

`READY_FOR_DEVELOPMENT_ORDER`

### Active feature

`NONE`

### Active owner

`NONE`

### Development authorization

`NOT GRANTED`

### Team change

`Claude REMOVED → Hermes INSTALLED as Technical Lead / Senior Software Engineer`

### Next required action

**Human Project Owner must explicitly issue the first development order.**

### First planned feature after authorization

`Elementary Grade 1 Mathematics — Addition and Subtraction`

### First expected owner after authorization

`ChatGPT Web — Education Researcher`

### Standby rule

Until the human project owner issues that order, all AI team members remain on standby with respect to feature development.

---

## 12. Historical clarification

Previous repository inspections, capability tests, architecture discussions, `.gitignore` creation, workflow-document creation, and the replacement of Claude by Hermes are **project-management / preparation activities**.

They do not constitute a feature-development order.

---

## 13. Governing principle

> **No implicit orders. No autonomous phase transitions. No parallel ownership of the same engineering responsibility. No production implementation without an approved technical specification.**

Sora proceeds through explicit authority, separated responsibilities, documented handoffs, and human acceptance.
