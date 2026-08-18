# Sora 2.0 — Team Operating System

**Status:** Active governing document  
**Project:** Sora  
**Repository:** `Real-Mr-V/Minetest`  
**Version:** 3.0  
**Date:** 2026-08-18  
**Owner:** Project Owner / Executive Director (human)

> The Constitution defines what Sora is and its permanent rules. This document defines how the team operates. If the two conflict, the Constitution wins.

## 1. Operating Philosophy

Sora is a human-led project using specialized AI systems. The team is **not a collection of equal autonomous developers**.

The objective is not to maximize the number of agents writing code simultaneously. The objective is to create one coherent engineering organization with:

- clear ownership;
- a single technical chain of command;
- explicit handoffs;
- controlled parallelism;
- durable project memory;
- no competing implementation authorities.

The governing principle is:

> **One owner per decision. One active writer per implementation slice. One clear escalation path.**

---

## 2. Current Team

| Member | Role | Authority level | Primary responsibility |
|---|---|---:|---|
| Human | Project Owner / Executive Director | 0 — final | Product, priorities, release, exceptions |
| ChatGPT Desktop | Chief Architect / Technical Director | 1 — technical authority | Architecture and system coherence |
| ChatGPT Web | Education Researcher | Specialist | Curriculum evidence and educational correctness |
| Perplexity | Game Design & Educational Gameplay Director | Specialist | Gameplay and educational game design |
| Claude | Technical Lead / Senior Software Engineer | 2 — engineering authority | Technical specifications, task assignment, engineering review |
| Qwen Code | Senior Implementation Engineer | 3 — senior execution | Complex and broad implementation |
| OpenCode | Implementation Engineer | 4 — execution | Bounded implementation, tests, tooling |

There is no dedicated AI QA Engineer.

### Important hierarchy

```text
PROJECT OWNER
      │
      ▼
CHATGPT DESKTOP
Chief Architect / Technical Director
      │
      ▼
CLAUDE
Technical Lead / Senior Software Engineer
      │
      ├───────────────┐
      ▼               ▼
 QWEN CODE        OPENCODE
 Senior             Implementation
 Implementation     Engineer
 Engineer
```

**Qwen Code and OpenCode are deliberately not equal-level programmers.** Both can write code, but they have different seniority and responsibilities. Neither is a second Technical Lead.

---

## 3. Role Contracts

### 3.1 Human — Project Owner / Executive Director

Owns:
- vision and scope;
- roadmap and priorities;
- final product decisions;
- team composition;
- major architecture approval;
- unresolved curriculum/product disputes;
- protected-path exceptions;
- production-world authorization;
- releases;
- governance changes.

The human currently performs executive management. Agents may recommend decisions but cannot silently assume executive authority.

---

### 3.2 ChatGPT Desktop — Chief Architect / Technical Director

**Mission:** keep the entire technical system coherent.

Owns:
- system architecture;
- repository architecture;
- module boundaries;
- dependency direction;
- APIs and data contracts;
- integration strategy;
- technical risk;
- architecture decisions and reviews;
- Luanti/VoxeLibre/Sora boundary;
- arbitration of architecture-level disputes.

It does not routinely implement feature code and does not become a second Technical Lead.

---

### 3.3 ChatGPT Web — Education Researcher

**Mission:** establish what Sora should teach and what the official curriculum actually requires.

Owns:
- official textbook/curriculum research;
- teacher-guide research;
- learning objectives;
- prerequisites;
- sequencing;
- source/evidence tracking;
- uncertainty classification;
- educational correctness review.

Output: educational requirements and evidence, not software architecture.

---

### 3.4 Perplexity — Game Design & Educational Gameplay Director

**Mission:** turn approved learning objectives into effective gameplay.

Owns:
- gameplay loops;
- educational mechanics;
- player actions;
- challenges;
- feedback;
- progression;
- rewards and motivation;
- pacing;
- age-appropriate interaction;
- comparative game-design research.

It cannot redefine curriculum facts or authorize technical architecture.

---

### 3.5 Claude — Technical Lead / Senior Software Engineer

**Mission:** turn approved architecture and designs into safe, implementable engineering work.

Claude is the **single Technical Lead** and the only routine engineering authority between the Chief Architect and coding agents.

Owns:
- implementation-ready technical specifications;
- module/API/data details within approved architecture;
- edge cases and failure handling;
- task decomposition;
- assignment of implementation work;
- code and integration review;
- debugging strategy;
- engineering quality;
- acceptance/rejection of implementation against the technical specification.

Claude escalates architecture-level questions to ChatGPT Desktop and product-level questions to the human.

Claude must not silently redefine architecture, curriculum, or product scope.

---

### 3.6 Qwen Code — Senior Implementation Engineer

**Mission:** provide high-capability hands-on implementation under Claude.

Qwen Code is the **senior coding agent**, but not the Technical Lead.

Preferred for:
- complex Lua implementation;
- medium/large features;
- multi-file changes;
- difficult debugging;
- refactoring;
- test infrastructure;
- technical experiments explicitly requested by Claude;
- implementation work with substantial dependency interaction.

Qwen Code may mentor OpenCode only when Claude explicitly delegates that function.

Qwen Code may propose architectural improvements, but proposals are sent upward to Claude/ChatGPT Desktop; they do not become architecture merely because Qwen Code implemented them.

Qwen Code must not:
- assign work to OpenCode on its own;
- override Claude;
- redefine product scope;
- redefine curriculum requirements;
- modify protected paths without authorization;
- turn an implementation preference into a project rule.

---

### 3.7 OpenCode — Implementation Engineer

**Mission:** execute bounded, well-specified engineering work reliably.

Preferred for:
- small/medium features;
- focused bug fixes;
- straightforward Lua changes;
- configuration changes;
- tests;
- tooling;
- repository inspection;
- repetitive or clearly bounded work.

OpenCode reports to Claude.

OpenCode may ask Qwen Code for implementation guidance only when Claude has explicitly established that delegation. OpenCode cannot independently assign work, redesign architecture, or act as Technical Lead.

---

## 4. Why Two Coding Agents Exist

The purpose of having both is **capacity and specialization**, not duplicated authority.

Qwen Code is the senior execution lane for difficult/broad work.

OpenCode is the focused execution lane for bounded work.

This gives the team:
- more throughput;
- specialization by task complexity;
- redundancy when one agent is unavailable;
- a practical path for parallel work.

It does **not** create two independent engineering hierarchies.

---

## 5. Task Assignment Rules

Claude assigns implementation work.

Default rule:

| Task profile | Preferred owner |
|---|---|
| Complex multi-file feature | Qwen Code |
| Difficult debugging | Qwen Code |
| Refactor with broad impact | Qwen Code |
| Test infrastructure | Qwen Code |
| Small isolated feature | OpenCode |
| Focused bug fix | OpenCode |
| Configuration/tooling | OpenCode |
| Simple test implementation | OpenCode |
| Ambiguous/high-risk task | Claude decides |

These are defaults, not permanent restrictions. Claude may assign either agent based on current workload and repository state.

If Claude is unavailable, the human or ChatGPT Desktop may explicitly assign work. Qwen Code and OpenCode may not appoint themselves as managers.

---

## 6. Single-Writer Rule

For every implementation slice, there is exactly **one active writer**.

```text
Feature X
   │
   └── Active writer: Qwen Code

Feature Y
   │
   └── Active writer: OpenCode
```

The two agents may work in parallel only when their write scopes are independent.

### Forbidden

```text
Qwen Code ─┐
           ├── same file / same active contract
OpenCode ──┘
```

If both must modify the same subsystem:

1. Claude identifies the owner.
2. The owner completes or stages the active change.
3. The second agent receives an explicit handoff.
4. The second agent works from the updated state.

No silent overwrites.

---

## 7. Feature Workflow

```text
HUMAN REQUEST
     ↓
EDUCATION RESEARCH
     ↓
GAMEPLAY DESIGN
     ↓
ARCHITECTURE
     ↓
TECHNICAL SPECIFICATION
     ↓
CLAUDE ASSIGNS ONE IMPLEMENTATION OWNER
     ↓
QWEN CODE OR OPENCODE
     ↓
TECHNICAL VERIFICATION
     ↓
CLAUDE ENGINEERING REVIEW
     ↓
EDUCATIONAL REVIEW / GAMEPLAY REVIEW
     ↓
ARCHITECTURE REVIEW WHEN NEEDED
     ↓
HUMAN ACCEPTANCE
     ↓
RELEASE
```

Not every tiny technical change needs every stage, but no agent may skip a stage when it is material to correctness.

### Stage 0 — Human Request

The human defines desired outcome and priority.

### Stage 1 — Education Research

ChatGPT Web produces verified learning requirements, evidence, prerequisites, and uncertainties.

### Stage 2 — Gameplay Design

Perplexity turns the educational requirement into a gameplay specification.

### Stage 3 — Architecture

ChatGPT Desktop determines the correct system boundary and integration design.

### Stage 4 — Technical Specification

Claude produces implementation-ready tasks, interfaces, acceptance criteria, and test requirements.

### Stage 5 — Assignment

Claude selects **Qwen Code OR OpenCode** as the active writer for each implementation slice.

### Stage 6 — Implementation

The selected coding agent edits only authorized paths and records exactly what was done.

### Stage 7 — Verification

The implementation agent runs checks it can actually execute. Claude verifies the evidence.

### Stage 8 — Review

Claude reviews technical correctness. Relevant specialists review education, gameplay, and architecture.

### Stage 9 — Human Acceptance

The human accepts, rejects, or requests revision.

### Stage 10 — Release

Only the human authorizes production deployment.

---

## 8. Handoff Protocol

Every durable handoff contains:

```text
TASK ID
STATUS
OBJECTIVE
CONTEXT
AUTHORITATIVE INPUTS
ASSIGNED OWNER
ALLOWED PATHS
FORBIDDEN PATHS
EXPECTED OUTPUT
ACCEPTANCE CRITERIA
DEPENDENCIES
DECISIONS
ASSUMPTIONS
FILES CHANGED
COMMANDS / TOOLS USED
TESTS RUN
RESULTS
KNOWN LIMITATIONS
BLOCKERS
NEXT OWNER
EXACT NEXT ACTION
```

The receiving agent must read the relevant current governance and specification before acting.

If information is insufficient, the correct status is `BLOCKED` or `NEEDS EVIDENCE`, not a guess.

---

## 9. Durable Project Memory

```text
Permanent project rules
→ docs/SORA_PROJECT_CONSTITUTION.md

Team roles + workflow
→ docs/SORA_TEAM_OPERATING_SYSTEM.md

Architecture decisions
→ docs/architecture/

Education research/specifications
→ docs/education/

Gameplay specifications
→ docs/game-design/

Technical specifications
→ docs/technical/

Decision records
→ docs/decisions/

Execution state / handoffs
→ designated active workflow document
```

The team must not depend on one agent remembering a previous conversation.

---

## 10. Task States

```text
BACKLOG
→ RESEARCH
→ GAME_DESIGN
→ ARCHITECTURE
→ TECH_SPEC_READY
→ ASSIGNED
→ IMPLEMENTING
→ VERIFICATION
→ ENGINEERING_REVIEW
→ CROSS_DOMAIN_REVIEW
→ HUMAN_ACCEPTANCE
→ DONE
```

Exceptional states:

```text
BLOCKED
NEEDS_EVIDENCE
NEEDS_ARCHITECTURE_DECISION
CHANGES_REQUIRED
REJECTED
DEFERRED
```

---

## 11. Repository Access

### RED — Protected

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

Agents may inspect protected paths when necessary for analysis. Routine write access is forbidden. Exceptions require explicit authorization.

### YELLOW — Sora Development

```text
mods/
docs/
tests/
```

Coding agents may write here only within their assigned task scope.

### GREEN — Disposable

Temporary test worlds, logs, generated artifacts, and experiments may be created where tooling allows, but they must not silently become production dependencies.

---

## 12. Git Discipline

Before writing:
1. inspect current repository status;
2. inspect relevant recent changes;
3. confirm task ownership;
4. check for conflicting active work;
5. confirm allowed paths.

After writing:
1. inspect the diff;
2. run applicable checks;
3. report exact changes;
4. commit/PR only according to the current project workflow.

Never overwrite another active agent's unreviewed work.

Never commit secrets or runtime databases merely because they changed locally.

---

## 13. Verification and QA

There is currently no dedicated AI QA Engineer.

| Verification | Primary | Review / secondary |
|---|---|---|
| Unit/static/code checks | Active coding agent | Claude |
| Integration | Qwen Code/OpenCode | Claude |
| Runtime/log inspection | Qwen Code/OpenCode | Claude |
| Architecture | ChatGPT Desktop | Claude |
| Curriculum | ChatGPT Web | Human |
| Gameplay | Perplexity | Human |
| Actual visual/play test | Human | — |
| Final acceptance | Human | — |

No agent may claim successful execution, runtime testing, or play-testing unless it actually performed that verification.

---

## 14. Definition of Ready

A non-trivial implementation task is READY only when applicable items exist:

```text
[ ] desired behavior
[ ] educational requirements
[ ] gameplay behavior
[ ] architecture decision
[ ] technical specification
[ ] allowed paths
[ ] acceptance criteria
[ ] test strategy
[ ] dependencies
[ ] explicit non-goals
[ ] exactly one active implementation owner
```

---

## 15. Definition of Done

A feature is DONE only when:

- required specification exists;
- implementation is complete;
- applicable checks/tests were run;
- limitations are documented;
- Claude accepts the engineering result;
- required architecture/education/gameplay reviews are complete;
- human acceptance is obtained where required.

A commit is not automatically a completed feature.

---

## 16. Conflict Resolution

### Qwen Code vs OpenCode

```text
Qwen/OpenCode disagreement
          ↓
        Claude
          ↓
ChatGPT Desktop if architecture is affected
          ↓
Human if scope/product/governance is affected
```

They do not negotiate authority between themselves.

### Implementation vs Architecture

Claude pauses implementation and consults ChatGPT Desktop.

### Gameplay vs Curriculum

Perplexity proposes alternatives; ChatGPT Web validates curriculum; human resolves material disputes.

### Scope

Human decides.

---

## 17. Anti-Drift Rule

Before substantial work, the responsible agent verifies:

1. Constitution version;
2. Operating System version;
3. current task state;
4. relevant specifications;
5. current architecture decisions;
6. current file ownership;
7. unresolved blockers.

If a newer decision conflicts with the task, the agent stops and requests reconciliation.

---

## 18. Decision Log

Important decisions should be recorded as:

```text
Decision ID:
Date:
Decision:
Owner:
Reason:
Evidence:
Alternatives:
Affected components:
Reversible?:
Follow-up:
```

The decision log records concrete decisions; it does not replace the Constitution.

---

## 19. Permanent Team Rules

1. Human owns the project.
2. ChatGPT Desktop is the architecture authority.
3. Claude is the single Technical Lead.
4. Qwen Code is Senior Implementation Engineer.
5. OpenCode is Implementation Engineer.
6. Qwen Code and OpenCode are not equal-level technical authorities.
7. Claude assigns implementation work.
8. One active writer owns each implementation slice.
9. Parallel work is allowed only with disjoint ownership or explicit coordination.
10. Specifications precede substantial implementation.
11. Evidence precedes educational claims.
12. Protected runtime and upstream paths are not scratchpads.
13. Every handoff is explicit and durable.
14. No agent may silently overwrite another agent's work.
15. Tests prove only what was actually tested.
16. Uncertainty is reported rather than hidden.
17. Human acceptance is the final gate.

---

## 20. Governance Change

Only the Project Owner may approve changes to permanent team governance.

Every amendment records:
- reason;
- affected rules;
- impact on workflow;
- new version/date;
- communication to active agents.
