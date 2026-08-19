# Sora Architecture Baseline

**Status:** Baseline for development
**Version:** 1.0
**Date:** 2026-08-19
**Authority:** ChatGPT Desktop — Chief Architect / Technical Director

## 1. Purpose

This document establishes the initial technical baseline before Sora feature implementation begins. It is subordinate to `SORA_PROJECT_CONSTITUTION.md` and is executed through `SORA_TEAM_OPERATING_SYSTEM.md`.

## 2. Existing Platform

The repository currently contains the existing Luanti runtime/engine, the VoxeLibre/MineClone2 game, and the `Elementary_1` world.

Known baseline from repository inspection:

```text
luanti/                  → Luanti engine/runtime
 games/mineclone2/       → VoxeLibre / MineClone2 base game
 worlds/Elementary_1/    → existing first-grade world/runtime state
 mods/                   → designated Sora extension location
 mod_data/               → runtime-generated mod state
```

`games/mineclone2/game.conf` identifies the base game as VoxeLibre, version `0.92.1`. The repository's existing engine baseline is Luanti `5.16.1`.

## 3. Architectural Principle

Sora is an additive application layer. Normal Sora development must not require modification of the Luanti engine or the upstream VoxeLibre/MineClone2 source.

```text
                 SORA
  educational systems + gameplay systems
                 │
       Sora-owned mods/content
                 │
              VoxeLibre
                 │
               Luanti
```

## 4. Ownership Boundaries

### Protected platform

```text
luanti/
games/mineclone2/
```

These are governed dependencies. A Sora feature must not modify them unless the Project Owner explicitly authorizes an exception.

### Sora development surface

```text
mods/
docs/
```

The `mods/` directory is the current designated location for Sora-owned mods, marked by `mods/Sora mods location.txt`.

### Runtime state

```text
worlds/Elementary_1/
mod_data/
```

These are operational/runtime assets, not normal source-code workspaces. Development should use disposable world copies whenever practical.

## 5. Proposed Sora Module Boundary

The following is an architectural target, not permission to create all modules immediately:

```text
mods/
  sora_core/
  sora_education/
  sora_gameplay/
  sora_assessment/
  sora_ui/
  sora_shared/
```

Modules must only be created when a concrete requirement justifies them. Avoid speculative framework construction.

### `sora_core`
Stable Sora APIs, lifecycle, configuration, shared events, versioning, and cross-module contracts.

### `sora_education`
Learning objectives, lesson state, activity state, curriculum-linked progression, and educational domain logic.

### `sora_gameplay`
Gameplay mechanics that operationalize approved educational and narrative requirements.

### `sora_assessment`
Progress, mastery signals, attempts, results, and privacy-conscious educational records.

### `sora_ui`
Shared Sora presentation/formspec interaction where separation is useful.

### `sora_shared`
Reusable constants, utilities, localization, content schemas, and non-domain-specific assets.

## 6. Dependency Direction

The preferred dependency direction is:

```text
sora_ui ───────┐
sora_gameplay ─┼──→ sora_education ─→ sora_core
sora_assessment┘          │
                          └──────────→ sora_shared (where appropriate)
```

Avoid circular dependencies. `sora_core` must not depend on higher-level lesson or gameplay modules.

## 7. Content/Data Separation

Educational content should be separable from engine logic whenever practical.

A future content representation should be declarative enough to describe, at minimum:

- curriculum reference;
- grade;
- subject;
- lesson/objective;
- prerequisites;
- activity type;
- difficulty parameters;
- allowed number/value domain;
- representation type;
- expected learner action;
- feedback rules;
- mastery/assessment criteria;
- content version.

The exact schema must be designed and approved before implementation.

## 8. World Strategy

`Elementary_1` is the first-grade runtime world and is protected.

Development workflow:

```text
Source-controlled Sora code/content
        ↓
Disposable test world
        ↓
Verification
        ↓
Human-approved deployment
        ↓
Elementary_1
```

Do not use the live `Elementary_1` world as a shared development scratchpad.

## 9. Persistence Principle

SQLite databases and generated world metadata are runtime state. They must not be treated as ordinary mergeable source.

Any persistent Sora schema must have:

- a namespace;
- version information;
- migration strategy when needed;
- clear ownership;
- backup/recovery expectations;
- a defined source-of-truth relationship with source-controlled content.

## 10. Architecture Decision Rules

A feature requires an architecture decision when it changes:

- module boundaries;
- public interfaces;
- persistence contracts;
- dependency direction;
- world/runtime integration;
- upstream modification requirements;
- cross-feature data contracts.

ChatGPT Desktop owns these decisions. Claude may design implementation details within the approved architecture.

## 11. First Development Principle

Do not build a generic Sora framework before the first real educational feature demonstrates the need for it.

The first feature should be used to validate the architecture through a narrow vertical slice.

## 12. Initial Vertical Slice

The first candidate slice is **Elementary Grade 1 Mathematics — Addition and Subtraction**.

The slice should prove the complete pipeline:

```text
curriculum evidence
→ gameplay design
→ architecture
→ technical specification
→ preparation
→ implementation
→ verification
→ human play/acceptance
```

It should remain narrow enough to discard or redesign without destabilizing the entire project.

## 13. Architectural Constraints

- Do not modify Luanti merely to simplify a Sora feature.
- Do not modify VoxeLibre merely to simplify a Sora feature.
- Do not hard-code a single lesson into a reusable core API unless the abstraction is justified.
- Do not couple educational truth to presentation/UI code.
- Do not make the live world the source of truth for curriculum content.
- Do not introduce network/server architecture until a concrete requirement exists.

## 14. Change Control

Any change to this baseline must identify:

```text
Architecture decision
Reason
Affected modules
Migration impact
Runtime impact
Compatibility impact
Reversibility
Owner
```

Architecture changes require ChatGPT Desktop approval before implementation.
