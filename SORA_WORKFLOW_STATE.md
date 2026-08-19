# SORA Workflow State

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Branch:** `main`  
**Status:** PRE-DEVELOPMENT / DEVELOPMENT NOT AUTHORIZED  
**Last updated:** 2026-08-19

---

## 1. Authoritative current state

Sora remains in the **pre-development preparation phase**.

The team has been reorganized:

- **Claude — REMOVED**
- **Hermes — ACTIVE, replacing Claude as Technical Lead / Senior Software Engineer**
- **Perplexity — REMOVED**
- **ChatGPT Web — expanded to Education Researcher + Game Design & Educational Gameplay**

These changes do **not** constitute a development order.

**No development order has been issued to the Sora team.**

No AI member currently has authorization to implement a Sora feature, create production Sora code, modify the live `Elementary_1` world, modify `luanti/`, modify `games/mineclone2/`, begin the first Vertical Slice, or interpret previous discussions as a development assignment.

---

## 2. Current workflow state

```text
PROJECT PREPARATION
        ↓
TEAM / ROLE DEFINITION
        ↓
REPOSITORY GOVERNANCE
        ↓
WORKFLOW DOCUMENTATION
        ↓
[CURRENT STATE]
READY FOR DEVELOPMENT ORDER
        ↓
HUMAN AUTHORIZATION REQUIRED
        ↓
EDUCATION RESEARCH + GAMEPLAY DESIGN
        ↓
ARCHITECTURE
        ↓
TECHNICAL SPECIFICATION
        ↓
IMPLEMENTATION PREPARATION
        ↓
TECHNICAL GATE
        ↓
PRODUCTION IMPLEMENTATION
        ↓
ENGINEERING REVIEW
        ↓
HUMAN ACCEPTANCE
```

No transition is automatic. Every transition requires an explicit handoff.

---

## 3. Current team

| Member | Role | Primary responsibility |
|---|---|---|
| Human | Project Owner / Executive Manager | Executive authority, authorization, final acceptance |
| ChatGPT Desktop | Chief Architect / Technical Director | Architecture and technical direction |
| ChatGPT Web | Education Researcher + Game Design & Educational Gameplay | Curriculum research, educational design, gameplay design |
| Hermes | Technical Lead / Senior Software Engineer | Technical specification, engineering gate, code review |
| Qwen Code | Implementation Preparation Engineer | Prepare implementation-ready work |
| OpenCode | Production Implementation Engineer | Implement approved production code |

### Removed members

- Claude — no longer a Sora team member.
- Perplexity — no longer a Sora team member.

No workflow instruction should assign work to either removed member.

---

## 4. Critical responsibility boundaries

```text
ChatGPT Web
Education + Gameplay Design
        ↓
ChatGPT Desktop
Architecture
        ↓
Hermes
Technical Specification / Engineering Gate
        ↓
Qwen Code
Implementation Preparation
        ↓
Hermes
Technical Gate
        ↓
OpenCode
Production Implementation
        ↓
Hermes
Engineering Review
        ↓
Human
Acceptance
```

### Qwen Code vs OpenCode

They are **not parallel programmers**.

- Qwen Code prepares the implementation.
- OpenCode performs the production implementation.
- Hermes owns the technical gate and engineering review.

If Qwen Code discovers an architectural ambiguity, it escalates to Hermes and/or ChatGPT Desktop.

If OpenCode discovers an ambiguity that cannot be resolved from the approved specification, it stops and escalates rather than making an unapproved design decision.

---

## 5. First planned feature

The first planned Sora Vertical Slice remains:

> **Elementary Grade 1 Mathematics — Addition and Subtraction**

This remains **PLANNED**, not active.

---

## 6. Standard feature workflow

### Phase 0 — Human Authorization

The human project owner explicitly activates a feature. Until this occurs, the feature remains `PLANNED`.

### Phase 1 — Education Research & Gameplay Design

**Owner: ChatGPT Web**

Because Perplexity has been removed, ChatGPT Web now owns both responsibilities.

Deliverables:

- official curriculum research;
- learning objectives;
- textbook/teacher-guide traceability;
- educational boundaries;
- gameplay concept;
- gameplay loop;
- mechanics;
- progression and feedback;
- educational-to-gameplay mapping.

ChatGPT Web must clearly distinguish official facts from design inference.

### Phase 2 — Architecture

**Owner: ChatGPT Desktop**

Produces architecture decisions, module boundaries, data flow, integration points, repository paths, and technical constraints.

### Phase 3 — Technical Specification

**Owner: Hermes**

Produces implementation specifications, interfaces where needed, file-level change plans, dependencies, edge cases, acceptance criteria, and engineering risks.

Hermes may return an architectural problem to ChatGPT Desktop rather than inventing an architectural exception.

### Phase 4 — Implementation Preparation

**Owner: Qwen Code**

Produces implementation-ready tasks, exact relevant files, existing-code analysis, dependency checks, implementation sequence, and validation checklist.

### Phase 5 — Production Implementation

**Owner: OpenCode**

Produces authorized production changes and reports modified files and validation results.

### Phase 6 — Engineering Review

**Owner: Hermes**

Checks specification compliance, architecture compliance, code quality, scope discipline, dependency correctness, maintainability, and identifiable regressions.

Hermes may reject the implementation and return actionable corrections to OpenCode.

### Phase 7 — Human Acceptance

**Owner: Human Project Owner**

Only the human project owner can declare the feature accepted for Sora.

---

## 7. Handoff protocol

Every formal handoff must state:

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

An agent must not infer a new assignment merely from a previous conversation, document, commit, research result, or capability test.

---

## 8. Protected repository boundaries

Unless explicitly authorized by the human project owner:

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

remain protected.

The live `Elementary_1` world is runtime state, not the normal development workspace.

---

## 9. Current handoff record

```text
CURRENT PHASE:       PRE-DEVELOPMENT
CURRENT STATUS:      READY_FOR_DEVELOPMENT_ORDER
ACTIVE FEATURE:      NONE
ACTIVE OWNER:        NONE
AUTHORIZATION:       NOT GRANTED
```

### Next required action

**Human Project Owner must explicitly issue the first development order.**

### First planned feature after authorization

`Elementary Grade 1 Mathematics — Addition and Subtraction`

Until that order is issued, all AI team members remain on standby for feature development.

---

## 10. Historical clarification

Previous repository inspections, capability tests, architecture discussions, `.gitignore` creation, workflow-document creation, and team reorganization are preparation activities only.

They do not constitute a feature-development order.

---

## 11. Governing principle

> **No implicit orders. No autonomous phase transitions. No parallel ownership of the same responsibility. No production implementation without an approved specification and explicit authorization.**
