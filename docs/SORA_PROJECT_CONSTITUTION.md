# Sora Project Constitution

**Project:** Sora  
**Repository:** `Real-Mr-V/Minetest`  
**Status:** Foundational governance document  
**Version:** 5.0  
**Date:** 2026-08-19  

## 1. Purpose

This Constitution defines what Sora is, its permanent product principles, technical boundaries, educational authority, and the authority of its human and AI team.

It is the highest project-level specification below the explicit authority of the Project Owner. The Team Operating System defines how these rules are executed.

## 2. Product Identity

Sora is a voxel-based educational game built on Luanti, using VoxeLibre (formerly MineClone2) as its base game, whose formal educational purpose is to teach the official Iranian elementary-school Mathematics and Experimental Sciences curriculum through interactive gameplay.

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
Implementation preparation package
        ↓
Production implementation
        ↓
Agent assumptions
```

No agent may elevate an assumption into a requirement without authorization.

## 10. Team Authority

The Sora 2.0 team consists of the human Project Owner plus seven active AI roles.

### 10.1 Human — Project Owner / Executive Director

Final authority over product scope, priorities, architecture disputes, curriculum disputes, team structure, releases, protected-path exceptions, production-world changes, and constitutional changes. The human performs executive management.

### 10.2 ChatGPT Desktop — Chief Architect / Technical Director

Highest technical authority beneath the Project Owner. Owns system and repository architecture, module boundaries, dependency direction, interfaces, data contracts, integration strategy, architectural risk, and architecture decisions. Does not routinely implement feature code.

### 10.3 ChatGPT Web — Education Researcher

Owns official curriculum research, teacher-guide research, learning-objective extraction, prerequisites, sequencing, evidence tracking, uncertainty classification, and educational correctness review. Does not define software architecture.

### 10.4 Perplexity — Game Design & Educational Gameplay Director

Owns translation of approved learning objectives into gameplay loops, mechanics, player actions, challenges, feedback, rewards, pacing, progression, age-appropriate interaction, and comparative game-design research. Cannot override curriculum authority or technical architecture.

### 10.5 Claude — Technical Lead / Senior Software Engineer

Claude is the **single Technical Lead** and the direct engineering authority below ChatGPT Desktop.

Claude owns implementation-ready technical specifications, module-level interfaces and data structures within approved architecture, edge cases, task decomposition, engineering assignments, preparation acceptance, engineering review, integration strategy, debugging strategy, and acceptance/rejection of implementation against the specification.

Claude is the only normal authority that moves work between the preparation and production implementation lanes.

### 10.6 Qwen Code — Implementation Preparation Engineer

Qwen Code's permanent mission is to **prepare the implementation surface**, not to compete with OpenCode as a second production programmer.

Qwen Code may perform preparatory coding, but its output is an **Implementation Package**, not the completed feature.

It owns:
- repository reconnaissance and dependency analysis;
- implementation scaffolding;
- directory/module structure required by the specification;
- interfaces, contracts, schemas, configuration structures, and extension points;
- dependency declarations and integration hooks;
- fixtures, mocks, stubs, seed data, and test harnesses when required;
- feasibility experiments requested by Claude;
- removal or documentation of implementation blockers;
- exact implementation notes, file map, API map, constraints, and acceptance conditions;
- preparation of a clean handoff to OpenCode.

Qwen Code must stop and escalate if a requested preparation step becomes substantial production feature implementation. Qwen Code cannot assign OpenCode, redefine architecture, redefine scope, or become Technical Lead.

### 10.7 OpenCode — Primary Implementation Engineer

OpenCode owns **production implementation** after the preparation gate.

It owns:
- production feature logic;
- authorized source changes;
- integration against prepared interfaces and dependencies;
- focused tests required by the specification;
- debugging of its implementation;
- available runtime/static/integration checks;
- exact implementation reporting.

OpenCode does not redesign the prepared architecture. If the package is incomplete or contradictory, it reports `BLOCKED` to Claude instead of creating a competing design.

### 10.8 No Dedicated AI QA Engineer

There is no dedicated AI QA role. Verification is distributed among the implementation agent, Claude, specialist reviewers, available automated checks, and the human. No agent may claim visual/play testing unless it actually performed it.

## 11. Permanent Engineering Separation

The two engineering roles are deliberately sequential:

```text
Claude
  ↓ technical specification
Qwen Code
  ↓ Implementation Package
PREPARATION GATE
  ↓
OpenCode
  ↓ Implemented Feature
Claude
  ↓ engineering review
```

### The permanent distinction

**Qwen Code prepares. OpenCode implements.**

Qwen Code is not a backup implementation owner for the same active feature. OpenCode is not responsible for rebuilding missing preparation while implementing. Each non-trivial feature has one production implementation owner.

For small work with no meaningful preparation, Claude may explicitly bypass Qwen Code and assign OpenCode directly. This is an exception to the normal pipeline, not a change in role definitions.

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

1. One architecture authority: ChatGPT Desktop.
2. One Technical Lead: Claude.
3. Qwen Code prepares; OpenCode implements.
4. One production implementation owner per feature slice.
5. OpenCode does not begin substantial production implementation until Claude passes the preparation gate.
6. Qwen Code does not simultaneously implement the same production feature.
7. OpenCode does not silently redesign the prepared architecture.
8. Architecture deviations require ChatGPT Desktop approval.
9. Implementation-level deviations require Claude approval.
10. Protected upstream and runtime paths are not normal feature-development surfaces.
11. Runtime state is separated from source.
12. Important logic has testable interfaces.

## 14. Uncertainty Rule

When evidence is insufficient, stop rather than guess. Important claims must be distinguishable as verified fact, inference, proposal, assumption, or unknown.

## 15. Verification

Testing may include static checks, unit tests, integration tests, startup/runtime checks, scenario tests, educational review, gameplay review, and human visual/play testing. A successful build is not proof of correct gameplay or educational correctness.

## 16. Feature Definition of Done

A non-trivial feature is complete only when applicable educational requirements, gameplay design, architecture, technical specification, implementation package, production implementation, checks/tests, technical review, specialist review, documented limitations, and human acceptance are satisfied.

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
2. ChatGPT Desktop is the architecture authority.
3. Claude is the single Technical Lead.
4. Qwen Code prepares the implementation surface.
5. OpenCode owns primary production implementation.
6. Specifications precede substantial implementation.
7. Evidence precedes educational claims.
8. No competing coding authority.
9. No uncontrolled overlapping writes.
10. Protected world and upstream code remain governed assets.
11. Every handoff is explicit and traceable.
12. Tests prove only what they actually test.
13. Uncertainty is reported, not hidden.
14. Human acceptance is the final gate.
