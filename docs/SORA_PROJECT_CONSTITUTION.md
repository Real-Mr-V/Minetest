# Sora Project Constitution

**Project:** Sora  
**Repository:** `Real-Mr-V/Minetest`  
**Status:** Foundational governance document  
**Version:** 1.0  
**Date:** 2026-08-18  

---

## 1. Purpose

This document defines the permanent product-level identity, scope, principles, boundaries, and non-negotiable constraints of Sora.

The constitution answers **what Sora is, what it is not, and what principles govern every future technical, educational, gameplay, and narrative decision**.

The Team Operating System governs how the team works. This constitution governs what the team is building.

No implementation task should override this document unless the Project Owner explicitly approves a constitutional change.

---

## 2. Product Identity

**Sora is a voxel-based educational game built on Luanti, using VoxeLibre (formerly MineClone2) as its base game, whose primary purpose is to teach the official Iranian elementary-school Mathematics and Experimental Sciences curriculum through interactive gameplay.**

Sora also contains an independent overarching narrative. The narrative is a product-level layer and must support, not replace, the educational mission.

Sora is intended to evolve across **six years and six major versions**, corresponding to the planned long-term progression of the project.

The project name is **Sora**.

---

## 3. Product Mission

Sora exists to make formal elementary education interactive, understandable, memorable, and engaging without abandoning curricular correctness.

The core mission is:

> **Teach Mathematics and Experimental Sciences through a coherent voxel game world while preserving the correctness, sequence, and educational intent of the official Iranian elementary curriculum.**

Entertainment is important, but educational integrity is a higher-order product constraint.

---

## 4. Absolute Product Scope

### 4.1 Included

Sora's formal educational content is limited to:

- Mathematics for Iranian elementary education.
- Experimental Sciences for Iranian elementary education.
- Interactive activities required to teach, practice, assess, or reinforce those subjects.
- Supporting game systems required to deliver those educational experiences.
- The independent Sora narrative and world-building required by the game's story.

### 4.2 Excluded

Sora must not silently expand into a general-purpose educational platform.

Unless the Project Owner explicitly changes the constitution, Sora does not formally teach:

- Persian language/literature as a curriculum subject.
- Social studies.
- Religious studies.
- English or other foreign languages.
- Arts as a curriculum subject.
- Physical education as a curriculum subject.
- General-purpose programming education.
- Unrelated vocational or university subjects.

Game mechanics may incidentally require reading, navigation, communication, or other supporting skills, but these are not separate Sora curriculum domains.

---

## 5. Curriculum Authority

The official Iranian school curriculum is the authoritative source for formal educational content.

The hierarchy of evidence is:

1. Official Ministry/Organization for Educational Research and Planning textbook and curriculum material.
2. Official teacher guides and other official educational documents.
3. High-quality secondary educational sources used for cross-checking and discovery.
4. General web material, blogs, videos, and informal explanations only as supplementary research.

Secondary sources must never silently override an official curricular source.

When the official source cannot be verified, the team must label the requirement as **unverified** rather than presenting an assumption as curriculum fact.

---

## 6. Educational Design Principles

### 6.1 Curriculum first

Gameplay must serve the learning objective. A visually impressive mechanic that teaches the wrong concept is a defect, not a feature.

### 6.2 Concept before abstraction

Where appropriate, learning should progress from concrete experience to visual representation and then to symbolic representation.

### 6.3 Active learning

The learner should perform meaningful actions rather than merely read explanations or watch passive demonstrations.

### 6.4 Explain errors

Feedback should help the learner understand why an answer or method is incorrect. Correct/incorrect indicators alone are insufficient for important learning objectives.

### 6.5 Progressive difficulty

Difficulty should be controlled through educational variables such as concept complexity, representation, number range, sequencing, and problem structure—not merely larger numbers or faster timers.

### 6.6 No educational deception

The game must not reward a player for producing an answer through a method that contradicts the intended learning objective.

### 6.7 Age-appropriate interaction

User interfaces, language, task length, visual complexity, and failure states must be appropriate for the target elementary-school learner.

---

## 7. Game Design Principles

Sora is a game, not a textbook rendered in voxel graphics.

Educational objectives should therefore be translated into meaningful gameplay wherever practical.

A good Sora activity should answer three questions:

1. **What is the learner supposed to understand or practice?**
2. **What does the player actually do?**
3. **Why does that action reinforce the learning objective?**

Game mechanics must not become arbitrary mini-games attached to unrelated questions merely to make the product look educational.

The voxel environment should be used as a genuine learning medium whenever possible: objects, space, movement, construction, grouping, transformation, exploration, observation, and cause-and-effect can all become educational representations.

---

## 8. Narrative Principle

Sora has an independent overarching story created by the Project Owner.

The story is important to the identity of Sora, but it must not corrupt curriculum accuracy.

The narrative may provide:

- Motivation.
- Context.
- Exploration.
- Characters.
- Mysteries.
- Long-term progression.
- Emotional continuity between lessons.

The narrative must not redefine established mathematical or scientific facts merely for dramatic effect.

Where narrative and curriculum appear to conflict, factual educational correctness takes precedence.

---

## 9. Technical Foundation

Sora is built as an additive application layer over an existing game stack:

```text
Sora educational/gameplay layer
            ↓
Sora-owned mods and content
            ↓
VoxeLibre / MineClone2
            ↓
Luanti
```

### 9.1 Luanti

Luanti is the game engine/runtime foundation.

### 9.2 VoxeLibre / MineClone2

VoxeLibre, historically known as MineClone2, is the base game on which Sora builds.

### 9.3 Sora layer

Sora-specific functionality should live in clearly owned Sora namespaces, modules, content, configuration, documentation, and tests rather than unnecessarily modifying upstream code.

---

## 10. Repository Boundaries

The repository contains assets with fundamentally different ownership and risk levels.

### Protected by default

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

These are not ordinary feature-development directories.

### Sora-owned development area

The preferred home for new Sora implementation is the repository's Sora-owned extension area, currently represented by the root `mods/` location and future explicitly named Sora modules.

Sora code should use explicit names such as `sora_*` to reduce collisions and clarify ownership.

### Runtime data

World databases, authentication data, player state, map state, and generated runtime data must not be treated as ordinary source code.

Agents must not inspect, copy, modify, or expose sensitive player/authentication data unless an explicitly authorized task requires it.

---

## 11. Source of Truth Hierarchy

When two sources disagree, the following order governs:

```text
Project Owner decision
        ↓
This Constitution
        ↓
Approved architecture/contracts
        ↓
Official curriculum sources
        ↓
Approved technical specifications
        ↓
Implementation
        ↓
Agent assumptions
```

An agent assumption can never override an explicit higher-level decision.

---

## 12. Team Structure

The current Sora team is intentionally small.

### 12.1 Project Owner / Executive Director — User

The Project Owner has final authority over:

- Product scope.
- Major architecture decisions.
- Team structure.
- Priorities.
- Acceptance/rejection of major features.
- Constitutional changes.
- Release decisions.
- Access and operational policy.

The Project Owner is also currently acting as the **Executive Director / Executive Manager** of the project.

### 12.2 Chief Architect / Technical Director — ChatGPT Desktop

Responsibilities:

- System architecture.
- Technical direction.
- Repository architecture.
- Cross-module contracts.
- Technical risk analysis.
- Architectural review.
- Long-term maintainability.
- Protection of the Luanti/VoxeLibre/Sora boundaries.

It must not casually implement large features merely because implementation is technically possible.

### 12.3 Education Researcher — ChatGPT Web

Responsibilities:

- Official curriculum research.
- Textbook and teacher-guide analysis.
- Learning-objective extraction.
- Educational correctness.
- Curriculum sequencing.
- Identification of uncertainty and unsupported claims.

The Education Researcher does not independently redefine gameplay architecture.

### 12.4 Technical Lead / Senior Software Engineer — Claude

Responsibilities:

- Convert approved architecture into implementable technical specifications.
- Review implementation quality.
- Identify engineering defects and integration risks.
- Maintain technical consistency across Sora modules.
- Perform code-review and implementation guidance.
- Coordinate technical handoff to OpenCode.

### 12.5 Game Design & Educational Gameplay — Perplexity

Responsibilities:

- Translate approved learning objectives into gameplay concepts.
- Design educational interaction loops.
- Propose mechanics that exploit the voxel environment.
- Evaluate engagement, clarity, pacing, and learner experience.
- Research comparable educational/gameplay patterns where useful.

Gameplay proposals remain subordinate to verified curriculum requirements and approved architecture.

### 12.6 Implementation Engineer — OpenCode

Responsibilities:

- Implement approved technical specifications.
- Modify only authorized repository paths.
- Follow existing contracts and coding conventions.
- Report blockers rather than inventing architectural decisions.
- Keep changes focused and reviewable.

OpenCode is an implementation authority, not the final product or architecture authority.

---

## 13. Authority and Escalation

The team follows this authority chain:

```text
Project Owner
      ↓
Chief Architect / Technical Director
      ↓
Technical Lead
      ↓
Implementation Engineer
```

Educational questions follow:

```text
Project Owner
      ↓
Education Researcher
```

Gameplay questions follow:

```text
Project Owner
      ↓
Education Researcher + Game Design
      ↓
Chief Architect
      ↓
Technical Lead
```

When responsibilities overlap, the agents must collaborate rather than silently override one another.

The Project Owner resolves unresolved cross-domain disputes.

---

## 14. The Fundamental Development Pipeline

Every significant feature should pass through these stages:

```text
IDEA
  ↓
EDUCATIONAL RESEARCH
  ↓
GAMEPLAY DESIGN
  ↓
ARCHITECTURE
  ↓
TECHNICAL SPECIFICATION
  ↓
IMPLEMENTATION
  ↓
VERIFICATION
  ↓
REVIEW
  ↓
HUMAN ACCEPTANCE
  ↓
RELEASE
```

A stage may be skipped only when the task is genuinely trivial and the responsible authority explicitly determines that the omitted stage adds no value.

---

## 15. Required Feature Contract

Before implementation of a non-trivial feature, the feature must have:

- A unique identifier.
- A clear educational objective, if educational.
- A defined gameplay objective, if gameplay-facing.
- Acceptance criteria.
- Known dependencies.
- A defined Sora-owned implementation location.
- Explicit out-of-scope items.
- A verification strategy.
- An owner.

A feature without a clear objective is not ready for implementation.

---

## 16. Change Management

Every meaningful change must answer:

1. Why is this change needed?
2. Which requirement authorizes it?
3. Which files/modules does it affect?
4. What could it break?
5. How will it be verified?
6. Who reviews it?

Large architectural or educational changes require explicit Project Owner approval.

---

## 17. Git and Repository Discipline

The repository is the shared development memory of Sora.

Rules:

- Do not overwrite another agent's work without understanding it.
- Do not make unrelated changes in a feature task.
- Keep commits focused and explain intent.
- Do not commit secrets, credentials, authentication data, or sensitive learner data.
- Do not commit generated runtime state merely because it exists locally.
- Do not rewrite history to hide mistakes.
- Do not alter protected upstream components for convenience.
- Prefer small, reviewable changes.

When the working tree or remote state is uncertain, stop and inspect before editing.

---

## 18. Protected World Policy

`worlds/Elementary_1/` is a runtime world, not a disposable coding workspace.

Development and experimentation should occur against a disposable test-world copy or controlled test environment.

The live/primary `Elementary_1` world must not be casually modified by agents.

Before any intentional deployment to the primary world:

1. The change must be reviewed.
2. A backup must exist.
3. The deployment scope must be known.
4. Recovery must be possible.
5. The Project Owner must authorize the deployment.

---

## 19. Testing and Verification Philosophy

Sora must distinguish between:

- Static/code verification.
- Automated tests.
- Scenario tests.
- Educational review.
- Gameplay review.
- Actual game execution.
- Human acceptance testing.

No agent may claim that a feature was successfully play-tested merely because its source code looks correct.

If an agent cannot actually execute or observe the game, it must explicitly report that limitation.

Human verification remains authoritative for behavior that the available tooling cannot reliably execute or observe.

---

## 20. Definition of Done

A non-trivial feature is not Done merely because code exists.

It is Done when:

- The intended requirement is documented.
- Educational claims are verified where applicable.
- Architecture is consistent with Sora boundaries.
- Implementation is complete.
- Relevant static/automated checks pass where available.
- Known limitations are documented.
- Code has received the appropriate technical review.
- Educational/gameplay review has occurred when applicable.
- The Project Owner accepts the result for release.

---

## 21. Uncertainty Rule

**When evidence is insufficient, stop rather than guess.**

Agents must clearly distinguish:

- Confirmed fact.
- Strong inference.
- Design proposal.
- Assumption.
- Unknown.

This rule applies especially to curriculum requirements, engine behavior, upstream VoxeLibre behavior, repository state, and claims about what a tool or agent can actually do.

---

## 22. AI Autonomy Limits

AI agents may accelerate analysis, design, coding, documentation, and review, but they do not possess independent authority over the project's goals.

An AI agent must not:

- Change Sora's scope on its own.
- Replace the official curriculum with an unofficial interpretation without disclosure.
- Rewrite architecture to make its own task easier.
- Modify protected infrastructure merely to bypass a problem.
- Claim execution/testing that it did not perform.
- Conceal uncertainty or failure.
- Expose sensitive operational/player data.
- Introduce a major dependency without review.

---

## 23. Dependency and Upstream Policy

Luanti and VoxeLibre/MineClone2 are foundational dependencies.

Sora should prefer extension over unnecessary modification.

If an upstream change appears necessary, the team must first determine whether the problem can be solved through:

1. Sora-owned extension.
2. Configuration.
3. A clean interface/API.
4. An upstream contribution.
5. A deliberately maintained patch, only when justified.

Direct upstream modification is the last resort, not the default workflow.

---

## 24. Data and Privacy Principles

Sora must minimize collection and exposure of learner data.

The team must treat authentication databases, player databases, inventories, progress records, and other runtime state as potentially sensitive.

Educational analytics should collect only data that serves a defined product or educational purpose.

No agent may copy sensitive runtime databases into external services merely for convenience.

---

## 25. Six-Version Product Principle

Sora is designed as a long-term project with six major versions/years of progression.

The architecture must therefore avoid assumptions that make the first version impossible to extend.

However, long-term extensibility must not be used as an excuse for premature complexity.

The rule is:

> **Build the smallest architecture that safely supports the current educational requirement while preserving deliberate extension points for future versions.**

---

## 26. Anti-Scope-Creep Rules

The following are explicitly discouraged:

- Adding features because they are technically interesting but educationally irrelevant.
- Turning Sora into a general Minecraft/VoxeLibre enhancement project.
- Rebuilding Luanti unnecessarily.
- Rewriting VoxeLibre unnecessarily.
- Adding unrelated school subjects.
- Adding monetization systems before core learning quality is proven.
- Creating complex online infrastructure before the single-player educational loop works.
- Building analytics that do not serve a defined learning/product decision.

---

## 27. Decision Record Principle

Important decisions must be recorded rather than existing only in chat history.

A future team member or AI agent should be able to understand:

- What was decided.
- Why it was decided.
- Who approved it.
- What alternatives were rejected.
- What consequences were accepted.

The repository is the durable memory of the project; chat is an interface to that memory, not its sole source.

---

## 28. Constitutional Change Procedure

This constitution is intentionally difficult to change.

A proposed constitutional change must include:

1. The exact section being changed.
2. The proposed new rule.
3. The reason for the change.
4. The expected impact.
5. Compatibility implications.
6. Project Owner approval.

A constitutional change must be explicitly identified in its commit message and documented in the project's decision history.

---

## 29. Current Non-Negotiable Principles

For practical use, the following rules have the highest operational importance:

1. **Sora teaches only Mathematics and Experimental Sciences as formal curriculum subjects.**
2. **Official Iranian curriculum sources outrank secondary educational sources.**
3. **The independent Sora story must not compromise educational correctness.**
4. **Sora is an additive layer over Luanti and VoxeLibre whenever practical.**
5. **Protected infrastructure and the primary school world are not ordinary agent workspaces.**
6. **No agent may claim a test it did not actually perform.**
7. **No agent may silently invent requirements when evidence is missing.**
8. **The Project Owner has final authority.**
9. **Major work moves through research → design → architecture → specification → implementation → verification → review → acceptance.**
10. **When in doubt, stop rather than guess.**

---

## 30. Relationship to Other Sora Documents

This constitution is part of a hierarchy of project documentation:

```text
SORA_PROJECT_CONSTITUTION.md
        │
        ├── Defines what Sora is
        │
        ▼
SORA_TEAM_OPERATING_SYSTEM.md
        │
        ├── Defines how the team works
        │
        ▼
Architecture Documents
        │
        ▼
Development Contracts
        │
        ▼
Feature Specifications
        │
        ▼
Implementation
        │
        ▼
Verification / Review / Release Records
```

Lower-level documents must not contradict higher-level rules without an explicitly approved change.

---

## 31. Constitutional Statement

Sora will be developed as a serious educational game rather than as a collection of disconnected mini-games.

Its technology, curriculum, gameplay, and narrative must converge toward one coherent product.

The project will favor correctness over speed when the two conflict, clarity over unnecessary complexity, evidence over assumption, and controlled iteration over uncontrolled expansion.

**This is the constitutional foundation of Sora.**
