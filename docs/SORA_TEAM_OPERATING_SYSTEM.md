# Sora 2.0 — Team Operating System

**Status:** Foundational / governing document  
**Project:** Sora  
**Repository:** `Real-Mr-V/Minetest`  
**Default branch:** `main`  
**Version:** 2.0  
**Owner:** Project Owner / Executive Director (human)

> This document defines how the Sora team operates. The Constitution defines what Sora is; this document defines roles, authority, handoffs, repository discipline, workflow, and execution rules.

## 1. Current Team

| Member | Role | Primary responsibility |
|---|---|---|
| Human | Project Owner / Executive Director | Product authority, priorities, final acceptance, releases |
| ChatGPT Desktop | Chief Architect / Technical Director | Architecture, system design, technical direction |
| ChatGPT Web | Education Researcher | Curriculum evidence, learning objectives, educational correctness |
| Perplexity | Game Design & Educational Gameplay | Educational gameplay, mechanics, player experience |
| Claude | Technical Lead / Senior Software Engineer | Technical specifications, engineering review, integration quality |
| OpenCode | Implementation Engineer | Repository implementation, tooling, executable technical verification |
| Qwen Code | Implementation Engineer | Parallel implementation, tests/tooling, focused debugging |

There is **no dedicated AI QA Engineer** at present. QA responsibilities remain distributed as described below.

## 2. Authority Model

The human Project Owner is the final authority and currently performs the executive-management function.

```text
PRODUCT / SCOPE / RELEASE
          Human
             │
      ┌──────┼───────────┐
      ▼      ▼           ▼
Education  Architecture  Gameplay
 ChatGPT    ChatGPT      Perplexity
   Web       Desktop
                │
                ▼
       Technical Engineering
              Claude
                │
          ┌─────┴─────┐
          ▼           ▼
      OpenCode    Qwen Code
```

This is a functional authority model, not a claim that every task must pass through every agent.

### Critical distinction

OpenCode and Qwen Code are peers in implementation capacity. Neither outranks the other. Claude governs implementation-level engineering quality; ChatGPT Desktop governs architecture; the human governs product decisions.

## 3. Role Definitions

### 3.1 Human — Project Owner / Executive Director

Owns scope and roadmap, priorities, final decisions, release approval, production-world authorization, constitutional changes, exceptions to protected-path policy, and resolution of unresolved cross-domain disputes.

The human does not need to personally perform every technical task; the purpose of the team is to multiply the owner's execution capacity.

### 3.2 ChatGPT Desktop — Chief Architect / Technical Director

Owns architecture, repository structure, system boundaries, interfaces/contracts, dependency strategy, technical risk, architectural decisions, and cross-module integration design.

It should avoid becoming a second coding agent unless explicitly assigned.

### 3.3 ChatGPT Web — Education Researcher

Owns official curriculum research, textbook and teacher-guide analysis, learning objectives, prerequisites, sequencing, source/evidence tracking, uncertainty classification, and educational correctness review.

Output is an **Educational Specification**, not merely a collection of facts.

### 3.4 Perplexity — Game Design & Educational Gameplay

Owns translation of learning objectives into player actions, gameplay loops, educational mechanics, activities/challenges, feedback and motivation, progression/pacing, age-appropriate interaction, and useful game-design research.

It may propose alternatives but cannot redefine curriculum requirements.

### 3.5 Claude — Technical Lead / Senior Software Engineer

Owns implementation-level technical design, technical specifications, API/data/module decisions within approved architecture, edge cases, code review, integration review, debugging strategy, engineering quality, and review of OpenCode/Qwen Code work.

Claude is the engineering gatekeeper, not the project owner.

### 3.6 OpenCode — Implementation Engineer

Owns repository inspection, implementation of assigned specifications, Sora-owned source changes, build/run/tooling work available to it, automated/static/integration checks, focused debugging, and implementation reports.

### 3.7 Qwen Code — Implementation Engineer

Qwen Code provides a second implementation lane so the project can scale without creating a second architecture hierarchy.

Responsibilities:
- implement independently assigned tasks from approved specifications;
- inspect relevant repository code;
- create/modify Sora-owned files within assigned boundaries;
- write tests/tooling where requested;
- perform focused debugging and refactoring;
- provide implementation evidence and reports;
- review another implementation only when explicitly assigned.

Qwen Code must not create an architectural fork simply because it is implementing a different feature.

## 4. Division of Coding Work

Two coding agents are useful only if their write scopes are isolated.

Recommended allocation:

```text
Feature A → OpenCode
Feature B → Qwen Code

or

Implementation → OpenCode
Test/tooling/refactor → Qwen Code

or

Subsystem A → OpenCode
Subsystem B → Qwen Code
```

Avoid OpenCode + Qwen Code editing the same files simultaneously.

When both must touch the same subsystem, one agent owns the active change and the other becomes reviewer or follows after an explicit handoff.

## 5. Repository Access Policy

### RED — protected
```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

Read access may be needed for analysis. Write access is not routine. Any write exception requires explicit human authorization.

### YELLOW — Sora development
```text
mods/
docs/
tests/
```

OpenCode and Qwen Code may write here for assigned tasks. Claude may review and propose changes. Other agents should normally modify documents/specifications rather than implementation code unless explicitly authorized.

### GREEN — disposable

Temporary test worlds, generated output, logs, scratch data, and local experiments may be created where tooling permits. They must not silently become production dependencies.

## 6. Canonical Workflow

A substantial feature follows:

```text
BACKLOG
   ↓
EDUCATION RESEARCH
   ↓
GAME DESIGN
   ↓
ARCHITECTURE
   ↓
TECHNICAL SPECIFICATION
   ↓
IMPLEMENTATION
   ↓
TECHNICAL VERIFICATION
   ↓
EDUCATIONAL REVIEW
   ↓
GAMEPLAY REVIEW
   ↓
HUMAN ACCEPTANCE
   ↓
RELEASE
```

Human prioritization occurs before work begins. Not every trivial technical task requires every stage.

### Stage 0 — Human task creation
The Project Owner defines the desired outcome and priority.

### Stage 1 — Education Research
ChatGPT Web establishes what should be taught, based on authoritative sources.

Output: learning objectives, prerequisites, scope, evidence, uncertainties, and learning acceptance criteria.

### Stage 2 — Game Design
Perplexity translates the approved educational objective into a playable experience.

Output: player goal, actions, mechanics, feedback, progression, and failure/recovery behavior.

### Stage 3 — Architecture
ChatGPT Desktop decides where and how the feature belongs in Sora.

Output: component boundaries, interfaces, dependencies, data flow, persistence strategy, and architectural constraints.

### Stage 4 — Technical Specification
Claude converts the architecture into an implementation-ready plan.

Output: exact modules/files, APIs/data structures, edge cases, error handling, test plan, and implementation order.

### Stage 5 — Implementation
OpenCode **or** Qwen Code receives the approved specification and becomes the single active writer for that implementation slice.

Output: code, tests, diff/commit or PR as authorized, and implementation report.

### Stage 6 — Technical Verification
The implementation agent runs all checks it can actually execute. Claude reviews the result and code.

A failure returns to implementation. A successful build does not automatically advance the feature to acceptance.

### Stage 7 — Educational Review
ChatGPT Web verifies that implemented behavior still teaches the intended concept correctly.

### Stage 8 — Gameplay Review
Perplexity evaluates coherence, engagement, age-appropriateness, and educational alignment.

### Stage 9 — Human Acceptance
The Project Owner decides Accept / Revise / Reject.

### Stage 10 — Release
Only the Project Owner authorizes production-world deployment.

## 7. Handoff Protocol

Every handoff must contain:

```text
TASK ID
STATUS
OBJECTIVE
WHAT WAS DONE
FILES / PATHS TOUCHED
DECISIONS
ASSUMPTIONS
COMMANDS / TOOLS USED
TESTS RUN
RESULTS
KNOWN LIMITATIONS
BLOCKERS
NEXT AGENT
EXACT REQUEST TO NEXT AGENT
```

The receiving agent must read the relevant Constitution, specification, and handoff before changing anything.

If a required fact is missing, report `BLOCKED` instead of inventing it.

## 8. Shared Project Memory

```text
Permanent rules
  → docs/SORA_PROJECT_CONSTITUTION.md

Team operating rules
  → docs/SORA_TEAM_OPERATING_SYSTEM.md

Current execution state
  → future active workflow/state document

Durable specifications / decisions
  → docs/architecture/
     docs/education/
     docs/game-design/
     docs/technical/
     docs/decisions/
```

Historical reports may live under `logs/`, but current execution state must not depend on reading an enormous historical log.

## 9. Task State Machine

```text
BACKLOG → RESEARCH → GAME_DESIGN → ARCHITECTURE → TECH_SPEC
        → IMPLEMENTATION → TESTING → REVIEW → HUMAN_ACCEPTANCE → RELEASED
```

Any active state may become `BLOCKED`, `NEEDS_REVISION`, or `REJECTED`.

Only the responsible role advances the task after satisfying that stage's exit criteria.

## 10. Concurrency Rules

Multiple agents may work simultaneously only when their write scopes are independent.

Allowed examples:
- ChatGPT Web researches while Perplexity researches gameplay patterns.
- OpenCode implements Feature A while Qwen Code implements Feature B in different files.
- Claude reviews completed work while another independent task is being implemented.

Forbidden:
- Two agents editing the same file concurrently.
- Two agents changing the same schema/API without coordination.
- One agent modifying another agent's active work without handoff.
- Direct edits to the protected production world by multiple agents.

The goal is **controlled parallelism**, not maximum simultaneous activity.

## 11. Git Discipline

Before writing:
1. inspect repository status;
2. inspect relevant recent changes;
3. identify current branch/work scope;
4. confirm no conflicting active change;
5. edit only authorized paths.

After writing:
1. inspect diff;
2. run applicable checks;
3. report exactly what changed;
4. commit/PR only according to the active workflow.

Never hide changes, overwrite unreviewed work, rewrite history, or commit secrets/runtime databases merely because they changed locally.

## 12. Testing and QA Model

There is no dedicated AI QA engineer yet. QA is therefore a distributed verification function:

| Verification | Primary | Secondary |
|---|---|---|
| Code/static/unit | OpenCode or Qwen Code | Claude |
| Integration | OpenCode/Qwen Code | Claude |
| Runtime/logs | OpenCode/Qwen Code | Claude |
| Architecture | ChatGPT Desktop | Claude |
| Curriculum | ChatGPT Web | Human |
| Gameplay | Perplexity | Human |
| Actual visual/play test | Human | — |
| Final acceptance | Human | — |

No one may report a test they did not actually run.

## 13. Definition of Ready

Before implementation of a non-trivial feature:

```text
[ ] objective defined
[ ] educational requirements verified or explicitly marked unverified
[ ] gameplay behavior defined
[ ] architecture approved
[ ] technical specification complete
[ ] acceptance criteria defined
[ ] test strategy defined
[ ] implementation path authorized
[ ] active implementation owner selected: OpenCode OR Qwen Code
```

If a missing prerequisite materially affects correctness, the task is `BLOCKED`.

## 14. Definition of Done

A feature is Done only when applicable requirements are satisfied: specification exists, implementation is complete, relevant tests/checks pass, limitations are recorded, technical review passes, educational review passes when educational, gameplay review passes when gameplay-facing, and the human owner accepts it.

Compilation or successful launch alone is never sufficient.

## 15. Conflict Resolution

### Curriculum vs gameplay
ChatGPT Web supplies evidence; Perplexity proposes alternatives; unresolved product decisions go to the human.

### Architecture vs implementation
ChatGPT Desktop owns architectural intent; Claude owns implementation-level engineering judgment; unresolved major conflicts go to the human.

### OpenCode vs Qwen Code
They are peers. Claude determines whether either implementation conforms to the technical specification. Neither agent can veto the other merely because it prefers a different implementation style.

### Scope
Human decides.

## 16. Emergency Rule

A critical production defect may bypass normal sequencing only when the Project Owner explicitly declares an emergency. The smallest safe change is preferred; protected paths still require explicit authorization; testing and post-incident documentation remain mandatory.

## 17. Operating Principles

1. Human owns the project.
2. One primary responsibility per AI.
3. OpenCode and Qwen Code are parallel implementation capacity, not competing leadership.
4. Architecture precedes substantial implementation.
5. Evidence precedes educational claims.
6. No uncontrolled shared-file editing.
7. Protected world state is never a scratchpad.
8. Luanti/VoxeLibre remain governed dependencies.
9. Every handoff is explicit.
10. Every important decision is traceable.
11. Agents report uncertainty and limitations honestly.
12. Tests prove only what they actually test.
13. Human acceptance is the final gate.

## 18. Governance Changes

Only the Project Owner may approve changes to permanent governance. An amendment must state the reason, affected rules, impact, new version/date, and communication plan to active agents.
