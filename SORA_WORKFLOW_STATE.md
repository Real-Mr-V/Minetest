# SORA Workflow State

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Branch:** `main`  
**Document role:** Authoritative workflow state and handoff record  
**Status:** PRE-DEVELOPMENT / NOT AUTHORIZED FOR IMPLEMENTATION  
**Last updated:** 2026-08-19

---

## 1. Current project state

Sora is in the **pre-development preparation phase**.

The project infrastructure, team structure, development boundaries, repository organization, and workflow rules are being established.

**No development order has been issued to the Sora team.**

No team member currently has authorization to:

- implement a Sora feature;
- create production Sora code;
- modify the live `Elementary_1` world;
- modify `luanti/`;
- modify `games/mineclone2/`;
- begin the first Vertical Slice;
- treat previous discussions or capability tests as a development assignment.

Previous capability tests and repository inspections are **not development orders**.

The project must remain in this state until the human project owner explicitly authorizes the start of development.

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

The workflow must **not** advance automatically from one phase to another merely because a previous document exists.

A phase transition requires an explicit handoff recorded in this document or in the appropriate project document.

---

## 3. First planned development target

The first planned Sora development target is:

> **Elementary Grade 1 Mathematics — Addition and Subtraction**

This is a **planned target only**. It is not yet an active development assignment.

The educational scope must first be established from the official Iranian curriculum materials before implementation begins.

The first Vertical Slice should eventually prove the complete Sora workflow on a small, controlled educational feature rather than attempting to build the entire game at once.

---

## 4. Team and authority model

### Human Project Owner / Executive Manager

**Role:** Project Owner, Executive Manager, final authority

Responsibilities:

- approve or reject development phases;
- issue development orders;
- resolve disputes between agents;
- approve architectural changes with project-wide consequences;
- approve changes to protected infrastructure;
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
- coordination of technical work after authorization.

ChatGPT Desktop does not automatically authorize implementation.

### ChatGPT Web

**Role:** Education Researcher

Owns:

- official curriculum research;
- educational objectives;
- textbook and teacher-guide analysis;
- educational correctness;
- curriculum traceability.

Its research is authoritative only after the project owner accepts the relevant research output.

### Perplexity

**Role:** Game Design & Educational Gameplay

Owns:

- translating approved educational objectives into gameplay concepts;
- game mechanics;
- player interaction design;
- educational game loops;
- age-appropriate gameplay proposals.

It does not independently redefine curriculum requirements or technical architecture.

### Claude

**Role:** Technical Lead / Senior Software Engineer

Owns:

- technical design derived from the approved architecture;
- implementation specifications;
- code-quality standards;
- technical review;
- engineering risk identification;
- review of implementation produced by OpenCode.

Claude is the technical gatekeeper for implementation quality but does not replace the human project's final authority.

### Qwen Code

**Role:** Implementation Preparation Engineer

Owns:

- preparing implementation-ready tasks;
- inspecting the relevant code paths;
- identifying exact files/modules that should change;
- preparing implementation plans;
- identifying dependencies and integration points;
- preparing testable acceptance conditions;
- removing avoidable ambiguity before implementation.

Qwen Code **does not act as the primary production implementer**.

### OpenCode

**Role:** Production Implementation Engineer

Owns:

- writing Sora production code;
- implementing approved technical specifications;
- making changes only within authorized paths;
- local validation appropriate to the implementation;
- reporting exactly what was changed.

OpenCode **does not independently redesign requirements or architecture**.

### Perplexity / other research tools

Research tools may provide evidence and recommendations, but they do not possess project authority. Their outputs must enter the workflow through the assigned role and be reviewed according to the workflow.

---

## 5. Critical separation of responsibilities

The two implementation-oriented roles are deliberately separated:

```text
Qwen Code
Implementation Preparation
        ↓
Claude
Technical Review / Approval Gate
        ↓
OpenCode
Production Implementation
```

They are **not parallel programmers**.

Qwen Code prepares the road.

OpenCode builds on that prepared road.

If Qwen Code and OpenCode encounter an ambiguity that cannot be resolved from the approved specification, implementation must stop and the issue must return to Claude / the appropriate owner rather than being resolved through unilateral architectural changes.

---

## 6. Standard feature workflow

For every Sora feature, the following sequence applies unless the project owner explicitly approves an exception.

### Phase 0 — Authorization

The human project owner issues an explicit feature-development order.

Required information:

- feature name;
- intended educational scope;
- desired outcome;
- relevant constraints;
- authorization to begin.

Without this step, the feature is **NOT ACTIVE**.

### Phase 1 — Education Research

Owner: **ChatGPT Web**

Deliverables:

- official-source research;
- learning objectives;
- curriculum boundaries;
- age/grade constraints;
- source traceability;
- unresolved questions.

### Phase 2 — Educational Gameplay Design

Owner: **Perplexity**

Inputs:

- approved educational research.

Deliverables:

- gameplay loop;
- mechanics;
- player actions;
- feedback model;
- progression;
- educational-to-gameplay mapping.

### Phase 3 — Architecture

Owner: **ChatGPT Desktop**

Inputs:

- approved educational requirements;
- approved gameplay design.

Deliverables:

- architecture decision;
- module boundaries;
- data flow;
- integration points;
- repository paths;
- technical constraints.

### Phase 4 — Technical Specification

Owner: **Claude**

Deliverables:

- implementation specification;
- APIs/interfaces where necessary;
- file-level change plan;
- dependencies;
- edge cases;
- acceptance criteria;
- engineering risks.

### Phase 5 — Implementation Preparation

Owner: **Qwen Code**

Deliverables:

- implementation-ready task;
- exact relevant files;
- existing-code analysis;
- dependency checks;
- implementation sequence;
- validation checklist.

### Phase 6 — Production Implementation

Owner: **OpenCode**

Deliverables:

- production code;
- configuration/content changes within authorized paths;
- implementation report;
- validation results;
- list of modified files.

### Phase 7 — Engineering Review

Owner: **Claude**

Checks:

- specification compliance;
- architecture compliance;
- code quality;
- unintended scope expansion;
- regressions identifiable from available tooling;
- maintainability.

Claude may reject the implementation and return it to OpenCode with actionable corrections.

### Phase 8 — Human Acceptance

Owner: **Human Project Owner**

The feature is not considered accepted merely because code review passed.

The human owner determines whether the feature is suitable for the actual Sora product.

---

## 7. Handoff protocol

Every handoff must state:

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

An agent must not infer a new assignment merely from the existence of a document, commit, discussion, or previous message.

The assignment must be explicit.

---

## 8. Status vocabulary

Use only these workflow states unless a new state is formally approved:

- `PLANNED` — idea exists but is not active.
- `AUTHORIZED` — human has explicitly authorized work.
- `IN_PROGRESS` — assigned owner is actively working.
- `BLOCKED` — work cannot continue without an external decision/input.
- `READY_FOR_REVIEW` — deliverable is complete and awaiting review.
- `REJECTED` — reviewer found actionable problems.
- `APPROVED` — required reviewer approved the deliverable.
- `ACCEPTED` — human project owner accepted the result.
- `IMPLEMENTED` — code exists, but human acceptance may still be pending.

Current project status:

```text
READY_FOR_DEVELOPMENT_ORDER
```

---

## 9. Protected repository boundaries

The following remain protected unless the human project owner explicitly authorizes an exception:

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

Normal Sora implementation should occur in the designated Sora-owned development area.

The live `Elementary_1` world is runtime state and must not be used as the ordinary development workspace.

Development should use a disposable/test world when execution-based validation is required.

---

## 10. Git and change discipline

Every implementation must be:

1. traceable to an authorized task;
2. limited to the approved scope;
3. reviewable;
4. reported with modified paths;
5. kept separate from unrelated changes.

No agent should silently perform opportunistic refactoring outside its assigned task.

No agent should modify protected infrastructure merely because doing so appears convenient.

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

### Next required action

**Human Project Owner must explicitly issue the first development order.**

### First planned feature after authorization

`Elementary Grade 1 Mathematics — Addition and Subtraction`

### First expected owner after authorization

`ChatGPT Web — Education Researcher`

### No-action rule

Until the human project owner issues that order, all team members remain in **standby** with respect to feature development.

---

## 12. Historical clarification

Previous repository inspections, capability tests, architectural discussions, `.gitignore` creation, and workflow-document creation are **project preparation activities**.

They must not be interpreted as authorization to begin developing the first Sora feature.

The first development cycle begins only when the human project owner explicitly says that development is authorized and identifies the feature/order.

---

## 13. Governing principle

> **No implicit orders. No autonomous phase transitions. No parallel ownership of the same responsibility. No production implementation without an approved specification.**

Sora development proceeds deliberately, through explicit ownership and documented handoffs.
