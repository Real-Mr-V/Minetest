# Sora Project Constitution

**Project:** Sora  
**Repository:** `Real-Mr-V/Minetest`  
**Status:** Foundational governance document  
**Version:** 4.0  
**Date:** 2026-08-19  

## 1. Purpose

This Constitution defines what Sora is, its permanent product principles, technical boundaries, educational authority, and the authority of its human and AI team.

It is the highest project-level specification below the explicit authority of the Project Owner. The Team Operating System defines how these rules are executed.

## 2. Product Identity

**Sora is a voxel-based educational game built on Luanti, using VoxeLibre (formerly MineClone2) as its base game, whose formal educational purpose is to teach the official Iranian elementary-school Mathematics and Experimental Sciences curriculum through interactive gameplay.**

Sora also contains an independent overarching narrative created by the Project Owner and planned across six years and six major versions.

## 3. Mission and Scope

Sora exists to make elementary Mathematics and Experimental Sciences interactive, understandable, memorable, and engaging while preserving curricular correctness.

Included:
- Iranian elementary Mathematics.
- Iranian elementary Experimental Sciences.
- Gameplay and assessment systems required to teach, practice, reinforce, or assess those subjects.
- Supporting systems required to deliver those experiences.
- The approved Sora narrative and world-building.

Excluded unless the Project Owner changes this Constitution:
- Other school subjects as formal curriculum domains.
- Unrelated Luanti/VoxeLibre enhancements.
- Features added solely because they are technically interesting.

## 4. Curriculum Authority

For formal educational claims, authority is ordered as follows:

1. Official Iranian Ministry / Organization for Educational Research and Planning curriculum and textbooks.
2. Official teacher guides and official educational documents.
3. High-quality secondary educational sources for discovery and cross-checking.
4. General web sources only as supplementary evidence.

If authoritative evidence cannot be verified, the claim must be marked unverified or treated as a proposal rather than curriculum fact.

## 5. Educational Principles

1. Curriculum correctness outranks entertainment value.
2. Conceptual understanding precedes unnecessary abstraction.
3. Where appropriate, move from concrete experience to visual representation to symbolic representation.
4. Prefer active learner interaction over passive exposition.
5. Explain important errors instead of merely saying "wrong".
6. Difficulty should reflect conceptual complexity, representation, sequencing, and problem structure—not merely speed.
7. Every educational mechanic must have an identifiable learning purpose.

## 6. Game Design Principles

Sora is a game, not a textbook with voxel graphics. Voxel space should be used as a genuine learning medium where practical: objects, grouping, movement, construction, transformation, observation, spatial relationships, exploration, and cause-and-effect.

## 7. Narrative Principle

The Project Owner's independent Sora story is a first-class product element. Narrative may provide motivation, context, exploration, mystery, characters, progression, and emotional continuity, but must not intentionally redefine established mathematical or scientific facts.

## 8. Technical Foundation

Sora is an additive layer over a governed game stack:

```text
Sora educational + gameplay systems
            ↓
Sora-owned mods / content / configuration
            ↓
VoxeLibre / MineClone2
            ↓
Luanti
```

Sora should extend rather than unnecessarily fork or modify the engine or upstream base game.

Protected by default:
```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

The root `mods/` area is the designated Sora extension location, currently marked by `mods/Sora mods location.txt`.

## 9. Source-of-Truth Hierarchy

```text
Project Owner decision
        ↓
Sora Project Constitution
        ↓
Approved architecture / contracts
        ↓
Verified official curriculum evidence
        ↓
Approved technical specifications
        ↓
Implementation
        ↓
Agent assumptions
```

## 10. Team Structure and Authority

The Sora 2.0 team consists of the human Project Owner plus seven active AI roles.

### 10.1 Human — Project Owner / Executive Director

The Project Owner is the final authority over product scope, priorities, architecture disputes, curriculum disputes, team structure, releases, protected-path exceptions, production-world changes, and constitutional changes. The human performs the executive management function.

### 10.2 ChatGPT Desktop — Chief Architect / Technical Director

The highest technical authority beneath the Project Owner. Owns system and repository architecture, module boundaries, dependency direction, interfaces, data contracts, integration strategy, architectural risk, and architecture decisions. It does not routinely implement feature code.

### 10.3 ChatGPT Web — Education Researcher

Owns official curriculum research, teacher-guide research, learning-objective extraction, prerequisites, sequencing, evidence tracking, uncertainty classification, and educational correctness review. It does not define software architecture.

### 10.4 Perplexity — Game Design & Educational Gameplay Director

Owns translation of approved learning objectives into gameplay loops, educational mechanics, player actions, challenges, feedback, rewards, pacing, progression, age-appropriate interaction, and comparative game-design research. It cannot override curriculum authority or technical architecture.

### 10.5 Claude — Technical Lead / Senior Software Engineer

Claude is the **single Technical Lead** and the direct engineering authority below ChatGPT Desktop.

Claude owns implementation-ready technical specifications, module-level interfaces and data structures, edge cases, task decomposition, work assignment, engineering review, integration strategy, debugging strategy, and acceptance/rejection of implementation against the specification.

Only Claude assigns the two engineering execution lanes during normal work.

### 10.6 Qwen Code — Implementation Preparation Engineer

Qwen Code is **not a second implementation programmer alongside OpenCode**. Its permanent role is to prepare the implementation environment so that OpenCode can implement the feature without architectural, dependency, scaffolding, or tooling obstacles.

Qwen Code owns:
- translating Claude's technical specification into an implementation package;
- preparing directory/module scaffolding;
- creating interfaces, contracts, schemas, configuration structures, and extension points;
- preparing dependency declarations and integration points;
- creating fixtures, test harnesses, mocks, stubs, seed data, and development tooling when required;
- identifying missing prerequisites and resolving them before implementation;
- validating that the implementation surface is ready;
- documenting exact files, APIs, inputs, outputs, constraints, and acceptance conditions for OpenCode;
- performing technical reconnaissance and feasibility experiments requested by Claude;
- preparing a clean handoff package for the implementation phase.

Qwen Code may write code during preparation, but such code is **preparatory infrastructure**, not ownership of the feature's final production implementation. If a preparation change would itself constitute the feature implementation, Qwen Code must stop and escalate to Claude.

Qwen Code does not independently assign work to OpenCode and does not become Technical Lead.

### 10.7 OpenCode — Primary Implementation Engineer

OpenCode is the **primary production implementation owner** for the prepared feature.

OpenCode owns:
- implementing the feature's production logic;
- completing authorized Lua/code changes against the prepared implementation surface;
- integrating the prepared interfaces and dependencies;
- implementing focused tests required by the technical specification;
- running available checks and debugging its implementation;
- reporting exact files changed, commands run, results, assumptions, and blockers.

OpenCode should receive a complete implementation package from Qwen Code before starting whenever the task is non-trivial.

OpenCode does not redesign the prepared architecture. If the preparation is insufficient or a technical contradiction is discovered, OpenCode stops and escalates to Claude rather than inventing a parallel design.

### 10.8 No Dedicated AI QA Engineer

There is no dedicated AI QA role. Verification is distributed across implementation, technical review, architecture review, educational review, gameplay review, and human acceptance. No agent may claim full play-testing unless it actually performed the relevant runtime interaction.

## 11. Non-Overlapping Engineering Model

The engineering chain is deliberately sequential:

```text
PROJECT OWNER
      ↓
ChatGPT Desktop — Architecture
      ↓
Claude — Technical Specification + Assignment
      ↓
Qwen Code — IMPLEMENTATION PREPARATION
      ↓
Preparation Gate
      ↓
OpenCode — PRODUCTION IMPLEMENTATION
      ↓
Claude — Engineering Review
      ↓
Specialist Reviews as needed
      ↓
Human Acceptance
```

This is the default model for substantial features.

### Fundamental separation

**Qwen Code prepares. OpenCode implements.**

They are not parallel substitutes for the same job.

Qwen Code's output is an **Implementation Package**. OpenCode's output is the **Implemented Feature**.

Qwen Code must not simultaneously implement the same production feature while OpenCode is implementing it. OpenCode must not redesign the implementation package unless Claude changes the assignment.

### Exception

For a small task where no meaningful preparation is required, Claude may assign OpenCode directly. For a specialized preparatory task, Claude may assign Qwen Code without a subsequent OpenCode implementation. These are explicit exceptions, not the normal workflow.

## 12. Authority Matrix

| Domain | Primary authority |
|---|---|
| Product scope / priorities | Human |
| Curriculum evidence | ChatGPT Web |
| Educational gameplay | Perplexity + ChatGPT Web |
| Architecture | ChatGPT Desktop |
| Technical specification | Claude |
| Implementation preparation | Qwen Code |
| Production implementation | OpenCode |
| Engineering review | Claude |
| Architecture review | ChatGPT Desktop |
| Educational review | ChatGPT Web |
| Gameplay review | Perplexity |
| Production deployment | Human |

## 13. Engineering Non-Negotiables

- One Technical Lead: Claude.
- One architecture authority: ChatGPT Desktop.
- Qwen Code prepares; OpenCode implements.
- No two agents simultaneously own the same production implementation slice.
- Production implementation begins only after its implementation package passes the preparation gate.
- Architecture deviations require ChatGPT Desktop approval.
- Implementation-level deviations require Claude approval.
- Protected upstream and runtime paths are not normal feature-development surfaces.
- Runtime state is separated from source.
- Sora data is namespaced.
- Important logic has testable interfaces.

## 14. Uncertainty Rule

When evidence is insufficient, stop rather than guess. Important claims must be distinguishable as verified fact, inference, proposal, assumption, or unknown.

## 15. Testing and Verification

Testing may include static checks, unit tests, integration tests, runtime/startup checks, scenario tests, educational review, gameplay review, and human visual/play testing. A successful build is not proof of correct gameplay or educational correctness.

## 16. Feature Definition of Done

A non-trivial feature is complete only when applicable educational requirements, gameplay design, architecture, implementation package, production implementation, tests, technical review, specialist review, limitations, and human acceptance are satisfied.

## 17. Protected World

`worlds/Elementary_1/` is protected runtime state. Development should use disposable test-world copies whenever practical. Production deployment requires human authorization, backup, recorded scope/version, and post-deployment verification.

## 18. Six-Version Principle

Sora is intended to evolve through six major versions/years. Architecture should preserve deliberate extension points without premature complexity.

## 19. Anti-Scope-Creep

Do not expand Sora merely because an agent can implement something. Unrelated school subjects, engine rewrites, premature infrastructure, and technically interesting but educationally irrelevant systems require explicit approval.

## 20. Constitutional Change

Only the Project Owner may approve changes to this Constitution. Every amendment must record reason, affected rules, impact, new version/date, and communication to active agents.

## 21. Permanent Principles

1. Human owns the project.
2. One architecture authority: ChatGPT Desktop.
3. One Technical Lead: Claude.
4. Qwen Code prepares implementation; OpenCode performs primary production implementation.
5. Specifications precede implementation.
6. Evidence precedes educational claims.
7. No competing coding authority.
8. No uncontrolled parallel editing.
9. Protected world and upstream code remain governed assets.
10. Every handoff is explicit and traceable.
11. Tests prove only what they actually test.
12. Uncertainty is reported, not hidden.
13. Human acceptance is the final gate.
