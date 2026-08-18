# Sora Project Constitution

**Project:** Sora  
**Repository:** `Real-Mr-V/Minetest`  
**Status:** Foundational governance document  
**Version:** 2.0  
**Date:** 2026-08-18  

## 1. Purpose

This Constitution defines what Sora is, what it is not, its permanent product principles, technical boundaries, educational authority, and the authority of its human and AI team.

It is the highest project-level specification below the explicit authority of the Project Owner. The Team Operating System defines how those rules are executed in practice.

No agent may silently override this document.

## 2. Product Identity

**Sora is a voxel-based educational game built on Luanti, using VoxeLibre (formerly MineClone2) as its base game, whose formal educational purpose is to teach the official Iranian elementary-school Mathematics and Experimental Sciences curriculum through interactive gameplay.**

Sora also contains an independent overarching narrative created by the Project Owner and planned across six years and six major versions.

The narrative supports the game identity and motivation; it does not redefine curriculum facts.

## 3. Mission and Scope

Sora exists to make elementary Mathematics and Experimental Sciences interactive, understandable, memorable, and engaging while preserving curricular correctness.

### Included
- Iranian elementary Mathematics.
- Iranian elementary Experimental Sciences.
- Gameplay and assessment systems required to teach, practice, reinforce, or assess those subjects.
- Supporting systems required to deliver those experiences.
- The approved Sora narrative and world-building.

### Excluded unless the Project Owner changes this Constitution
- Other school subjects as formal curriculum domains.
- General-purpose educational-platform functionality unrelated to Sora's mission.
- Unrelated Luanti/VoxeLibre enhancements.
- Features added solely because they are technically interesting.

Supporting skills such as reading, navigation, interaction, and communication may be necessary for gameplay but do not become separate formal curriculum domains.

## 4. Curriculum Authority

For formal educational claims, authority is ordered as follows:

1. Official Iranian Ministry / Organization for Educational Research and Planning curriculum and textbooks.
2. Official teacher guides and official educational documents.
3. High-quality secondary educational sources for discovery and cross-checking.
4. General web sources only as supplementary evidence.

Secondary sources cannot silently override official material.

If the authoritative source cannot be verified, the claim must be marked **unverified** or treated as a proposal rather than curriculum fact.

## 5. Educational Principles

1. Curriculum correctness outranks entertainment value.
2. Conceptual understanding precedes unnecessary abstraction.
3. Where appropriate, move from concrete experience to visual representation to symbolic representation.
4. Prefer active learner interaction over passive exposition.
5. Explain important errors instead of merely saying "wrong".
6. Difficulty should reflect conceptual complexity, representation, sequencing, and problem structure—not merely speed or larger numbers.
7. The game must not reward a method that contradicts the intended learning objective.
8. Language, interface, pacing, and failure states must be appropriate for elementary learners.
9. Every educational mechanic must have an identifiable learning purpose.

## 6. Game Design Principles

Sora is a game, not a textbook with voxel graphics.

Every substantial educational activity should make clear:
- What the learner should understand or practice.
- What the player actually does.
- Why the player action reinforces the learning objective.

Voxel space should be used as a genuine learning medium where practical: objects, grouping, movement, construction, transformation, observation, spatial relationships, exploration, and cause-and-effect can represent concepts.

Mini-games that merely decorate conventional quizzes are discouraged unless they have a defensible learning purpose.

## 7. Narrative Principle

The Project Owner's independent Sora story is a first-class product element, but educational correctness remains non-negotiable.

Narrative may provide motivation, context, exploration, characters, mystery, progression, and emotional continuity. It must not intentionally redefine established mathematical or scientific facts.

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

### Repository boundary
Protected by default:
```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

The root `mods/` area is the designated Sora extension location, currently marked by `mods/Sora mods location.txt`. New Sora modules should use explicit `sora_*` names and ownership.

Runtime databases, authentication data, player state, map state, and generated data are operational state, not ordinary source code.

## 9. Source-of-Truth Hierarchy

When sources disagree:
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

An assumption can never override a higher-level decision.

## 10. Team and Authority

The current Sora 2.0 team consists of the human Project Owner plus six active AI roles.

### Project Owner / Executive Director — Human
Final authority over product scope, priorities, architecture disputes, curriculum disputes, team structure, releases, protected-path exceptions, production-world changes, and constitutional changes. The human currently performs the Executive Director / Executive Manager function.

### Chief Architect / Technical Director — ChatGPT Desktop
Owns technical architecture and long-term engineering direction: system and repository architecture, module boundaries, interfaces and data contracts, dependency strategy, integration strategy, technical risk analysis, architecture decisions and reviews, and protection of the Luanti/VoxeLibre/Sora boundary.

ChatGPT Desktop does not become the implementation bottleneck; it defines and protects the architecture and resolves architectural ambiguity.

### Education Researcher — ChatGPT Web
Owns curriculum evidence and educational research: official textbook/curriculum research, teacher-guide research, learning-objective extraction, prerequisites and sequencing, source tracking, uncertainty classification, and educational correctness review.

### Game Design & Educational Gameplay — Perplexity
Owns translation of approved learning objectives into gameplay: gameplay loops, educational mechanics, player actions, challenges, feedback, rewards, motivation, pacing, progression, age-appropriate interaction, and comparative gameplay research.

It consumes verified educational requirements rather than redefining them.

### Technical Lead / Senior Software Engineer — Claude
Owns implementation-level engineering design and technical review: converting architecture into implementable specifications, defining interfaces/modules/data structures/edge cases, reviewing implementation plans and code, debugging reasoning and integration problems, enforcing maintainability, preparing work for implementation, and reviewing OpenCode/Qwen Code changes.

Claude may reject technically unsafe implementation, but cannot silently change product scope or architecture.

### Implementation Engineer — OpenCode
Owns hands-on repository implementation within authorized paths: inspecting repository state, implementing approved specifications, editing Sora-owned source, running permitted Git operations, building/executing development tooling, running available checks, inspecting logs, debugging defects, and producing precise change reports.

OpenCode is an implementation agent, not the architecture, curriculum, or product authority.

### Implementation Engineer / Coding Agent — Qwen Code
Qwen Code is restored as an active member. Its role is **parallel engineering capacity under the same technical authority**, not a second independent technical lead.

Responsibilities:
- implement well-scoped tasks from approved specifications;
- inspect repository code and dependencies;
- create or modify Sora-owned files within authorized paths;
- write tests and technical tooling when specified;
- perform focused debugging/refactoring;
- perform focused implementation review when explicitly assigned by Claude;
- report exact files, commands, results, assumptions, and blockers.

Qwen Code must not independently redefine architecture, curriculum, product scope, or protected-path policy.

### No dedicated QA Engineer
There is still no dedicated AI QA role. Verification is distributed across OpenCode/Qwen Code for executable technical checks, Claude for engineering review, ChatGPT Desktop for architecture review, ChatGPT Web for educational verification, Perplexity for gameplay review, and the human for final gameplay, visual, acceptance, and release decisions.

No agent may claim full QA or successful play-testing unless it actually performed the relevant verification.

## 11. Authority Model

| Domain | Primary authority | Final authority |
|---|---|---|
| Product scope | Human | Human |
| Priority | Human | Human |
| Curriculum evidence | ChatGPT Web | Human |
| Educational design | ChatGPT Web + Perplexity | Human |
| Game design | Perplexity | Human |
| Architecture | ChatGPT Desktop | Human for major decisions |
| Technical implementation design | Claude | Human for major decisions |
| Code implementation | OpenCode / Qwen Code | Claude review + Human acceptance |
| Production world | Human | Human |
| Release | Human | Human |

Cross-domain disagreements are escalated rather than silently resolved by a lower-level role.

## 12. Engineering Non-Negotiables

- Sora is an additive layer over Luanti + VoxeLibre.
- Do not modify protected upstream components for convenience.
- Prefer configuration, extension, clean APIs, or upstream contribution before maintaining a fork/patch.
- Educational content should be data-driven where practical.
- Important logic must have testable interfaces.
- Dependencies must be explicit.
- Sora data must be namespaced.
- Runtime state must be separated from source.
- No sensitive player/authentication data may be exposed to external services merely for convenience.

## 13. Uncertainty Rule

**When evidence is insufficient, stop rather than guess.**

Every important claim must be distinguishable as verified fact, strong inference, design proposal, assumption, or unknown.

This applies to curriculum, repository state, engine behavior, upstream behavior, and agent capabilities.

## 14. Testing and Verification

Testing is multi-layered: static/code verification, unit and logic tests, integration tests, runtime/startup checks, scenario tests, educational review, gameplay review, and human visual/play testing.

A successful build is not proof of correct gameplay. A launched executable is not proof of educational correctness. If tooling cannot execute or observe the game reliably, the limitation must be stated and human verification used where necessary.

## 15. Feature Definition of Done

A non-trivial feature is complete only when applicable requirements, educational evidence, gameplay design, architecture, implementation, tests, technical review, educational/gameplay review, limitations, and human acceptance are satisfied.

## 16. Protected World

`worlds/Elementary_1/` is protected runtime state. Development should use disposable test-world copies whenever practical.

Before deployment to the primary world: review the change; create and validate a backup; record deployment scope/version; deploy; verify startup/data integrity; record the result; obtain Project Owner authorization.

## 17. Six-Version Principle

Sora is intended to evolve through six major versions/years. Architecture should preserve deliberate extension points without introducing premature complexity.

> Build the smallest safe architecture that solves today's requirement and preserves the extension points needed tomorrow.

## 18. Anti-Scope-Creep

Do not expand Sora merely because an agent can implement something. No unrelated school subjects, general Minecraft features, engine rewrites, premature infrastructure, or technically interesting but educationally irrelevant systems should enter the roadmap without explicit approval.

## 19. Constitutional Change

Only the Project Owner may approve changes to this Constitution. Every amendment must record reason, affected rules, impact on workflow/architecture, new version/date, and communication to active agents.

## 20. Permanent Principles

1. Human owns the project.
2. One primary responsibility per agent.
3. Specifications precede implementation.
4. Evidence precedes educational claims.
5. Architecture precedes substantial code.
6. OpenCode and Qwen Code are implementation agents, not competing architects.
7. No uncontrolled parallel editing of the same files.
8. Production world is protected.
9. Luanti/VoxeLibre are governed dependencies.
10. Every handoff is explicit.
11. Important decisions are traceable.
12. Tests prove only what they actually test.
13. No false claims of execution or play-testing.
14. Uncertainty is reported, not hidden.
15. Human acceptance is the final gate.
