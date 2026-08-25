# Sora Project Constitution

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Status:** Pre-development  
**Last updated:** 2026-08-19

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
| Hermes | Technical Lead / Senior Software Engineer | Technical specification, engineering governance and review |
| Qwen Code | Implementation Preparation Engineer | Implementation preparation; not production ownership |
| OpenCode | Production Implementation Engineer | Authorized production implementation |

**Claude and Perplexity are removed members and have no current authority or assignment.**

## 4. Authority chain

```text
Human
  ↓
ChatGPT Desktop — Architecture
  ↓
ChatGPT Web — Education + Gameplay Design
  ↓
Hermes — Technical Specification / Engineering Gate
  ↓
Qwen Code — Implementation Preparation
  ↓
OpenCode — Production Implementation
  ↓
Hermes — Engineering Review
  ↓
Human — Final Acceptance
```

The sequence is a governance model, not permission for autonomous execution. A phase begins only after an explicit handoff and, where required, human authorization.

## 5. Separation of programming responsibilities

Qwen Code and OpenCode are deliberately different roles:

```text
Qwen Code = PREPARE
OpenCode  = IMPLEMENT
Hermes    = GOVERN + REVIEW
```

Qwen Code analyzes approved specifications, repository structure, files, dependencies, integration points, implementation sequence, and validation requirements.

OpenCode implements the approved specification in authorized source paths. It does not independently redesign architecture, curriculum, or gameplay.

If ambiguity affects architecture, Qwen Code and OpenCode must escalate to Hermes; Hermes escalates architectural matters to ChatGPT Desktop.

## 6. Education and gameplay ownership

ChatGPT Web owns both education research and Game Design & Educational Gameplay because Perplexity has been removed.

It must distinguish:

- official curriculum evidence;
- interpretation;
- product/design inference;
- proposed gameplay mechanics.

Educational claims should be traceable to official Iranian curriculum sources whenever possible.

## 7. Architecture ownership

ChatGPT Desktop owns the system architecture and technical direction.

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

A development task requires an explicit handoff containing at least:

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

## 10. Development authorization

The project is currently:

```text
PRE-DEVELOPMENT
DEVELOPMENT AUTHORIZATION: NOT GRANTED
ACTIVE FEATURE: NONE
```

The first planned feature is **Elementary Grade 1 Mathematics — Addition and Subtraction**, but it is not active until the human project owner explicitly authorizes it.

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
10. No production development without authorization.
