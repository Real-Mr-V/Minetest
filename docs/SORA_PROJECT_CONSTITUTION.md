# Sora Project Constitution

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Status:** Active development under Issue #1  
**Last updated:** 2026-08-26

## 1. Purpose

Sora is an educational voxel game built on Luanti with VoxeLibre/MineClone2 as its base game. Its educational scope is limited to the official Iranian elementary-school curriculum for **Mathematics and Experimental Sciences**. Sora also contains a separate six-year narrative arc prepared by the human project owner.

This constitution governs team authority, development flow, repository boundaries, and decision-making.

## 2. Final authority

The **Human Project Owner / Executive Manager** has final authority over:

- project scope and priorities;
- development authorization;
- acceptance or rejection of completed work;
- architecture exceptions;
- protected-path changes;
- release decisions;
- resolution of conflicts that cannot be resolved within the workflow.

No AI member may override the human project owner.

## 3. Current team

| Member | Role | Authority boundary |
|---|---|---|
| Human | Project Owner / Executive Manager | Final project authority and acceptance |
| ChatGPT Desktop | Chief Architect / Technical Director | Architecture and technical direction |
| ChatGPT Web | Education Researcher + Game Design & Educational Gameplay | Curriculum, educational design, gameplay design |
| Hermes | Technical Lead / Senior Software Engineer | Technical specification, engineering governance, implementation preparation, and review |
| OpenCode | Production Implementation Engineer | Authorized production implementation |

**Claude, Perplexity, and Qwen Code are removed members and have no current authority or assignment.**

## 4. Authority chain

```text
Human
  ↓
ChatGPT Web — Education + Gameplay Context
  ↓
ChatGPT Desktop — Architecture
  ↓
Hermes — Technical Specification / Engineering Gate / Preparation
  ↓
OpenCode — Production Implementation
  ↓
Hermes — Engineering Review
  ↓
Human — Final Acceptance
```

The sequence is a governance model. A phase begins only after an explicit handoff and, where required, human authorization.

## 5. Separation of programming responsibilities

```text
Hermes    = SPECIFY + PREPARE + GOVERN + REVIEW
OpenCode  = IMPLEMENT
```

There is now one production implementation owner. Hermes prepares an implementation-ready package from the approved architecture/specification and governs the engineering gate. OpenCode owns production implementation. They are not parallel production programmers.

## 6. Education and gameplay ownership

ChatGPT Web owns both education research and Game Design & Educational Gameplay because Perplexity has been removed.

It must distinguish:

- official curriculum evidence;
- interpretation;
- product/design inference;
- proposed gameplay mechanics.

Educational claims should be traceable to official Iranian curriculum sources whenever possible.

## 7. Architecture ownership

ChatGPT Desktop owns system architecture and technical direction.

Hermes may challenge an architectural decision and request clarification, but may not silently replace the architecture.

Architecture changes must be recorded before implementation when they materially affect module boundaries, data contracts, repository structure, persistence, or runtime integration.

## 8. Repository safety

The following are protected by default:

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

The live `Elementary_1` world is runtime state, not the normal development workspace. Development should use a disposable test-world copy.

Sora-owned production source must remain clearly separated from upstream Luanti and VoxeLibre/MineClone2 code.

## 9. No implicit orders

A conversation, research result, capability test, commit, document, or previous task does not automatically create a new development assignment.

A development task requires an explicit handoff. GitHub Issue #1 is the current explicit development order and authorizes only the scope stated in that issue.

## 10. Current development authorization

Issue #1, **SORA: Initial spawn and story-first development handoff**, is the first active development order.

Its priority is:

1. establish the main SORA story phase;
2. implement the specified first-entry spawn at `541, 17, -98`;
3. do not begin educational lesson implementation before the story phase is addressed.

The canonical story source is `sora_story/main story_elementary_1.docx`.

This authorization does **not** grant permission to modify protected upstream or live-world paths without an explicit exception.

## 11. Change control

Any change to the team, roles, workflow, protected paths, architecture authority, or development authorization must be reflected in the governing Sora documents before the changed workflow is treated as authoritative.

## 12. Governing principles

1. Human final authority.
2. No implicit orders.
3. One clear owner per responsibility.
4. No parallel production programmers.
5. Architecture before implementation.
6. Preparation before production implementation.
7. Review after implementation.
8. Protected runtime and upstream boundaries.
9. Explicit handoffs.
10. Educational evidence before educational claims.
11. No scope expansion without authorization.
12. No agent claims tests or play-tests it did not actually perform.
