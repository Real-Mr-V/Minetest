# Sora Issue #1 — Technical Specification

**Issue:** #1 — SORA: Initial spawn and story-first development handoff  
**Status:** Specification draft / implementation not yet authorized by this document alone  
**Date:** 2026-08-25  
**Owner:** Human Project Owner / Executive Manager  
**Technical direction:** ChatGPT Desktop  
**Engineering governance:** Hermes  

## 1. Scope

Issue #1 establishes the first implementation target for Sora: the first-entry player spawn and the initial main-story phase for `Elementary_1`.

The issue explicitly requires the first player entry to occur at:

```text
X = 541
Y = 17
Z = -98
```

Educational lesson implementation is out of scope until the main-story phase has been addressed.

## 2. Canonical source

The canonical story source is:

```text
sora_story/main story_elementary_1.docx
```

The story document is authoritative for narrative content. This specification must not invent narrative events that are not present in the canonical story source.

The DOCX is stored in the repository, but the currently available GitHub text interface does not expose its internal document text as UTF-8 source. Therefore this specification does **not** claim to have extracted or validated the full narrative content of the DOCX.

Before implementation of narrative logic, the implementing workflow must obtain and inspect the actual document contents through an environment capable of reading DOCX files.

## 3. Architectural constraints

The implementation must respect the Sora architecture baseline:

- `luanti/` is protected upstream engine infrastructure.
- `games/mineclone2/` is protected upstream/base-game code.
- `worlds/Elementary_1/` is protected live/runtime world state.
- `mod_data/` is protected runtime-generated state.

No direct modification of these protected areas is permitted merely because Issue #1 exists.

The preferred implementation is an additive Sora-owned layer outside upstream code and a controlled deployment into a disposable test-world copy.

## 4. Spawn behavior

### Required behavior

On the player's **first entry** into the relevant Sora world, the player must be placed at exactly:

```text
541, 17, -98
```

The implementation must distinguish first entry from subsequent entries. A player who has already completed the first-entry initialization must not be repeatedly teleported to the initial spawn on every join unless that behavior is explicitly specified later.

### Initialization semantics

The implementation should use a persistent, namespaced Sora state rather than modifying upstream player databases directly.

Conceptually:

```text
on_join(player)
    if sora.first_entry_initialized(player) == false
        set player position = (541, 17, -98)
        mark first_entry_initialized = true
    end
end
```

The exact Lua API and persistence mechanism must be selected during implementation preparation after inspecting the repository's actual mod API/version and existing Sora-owned module structure.

## 5. Narrative boundary

Issue #1 is **story-first**, not lesson-first.

The first implementation slice should establish the technical foundation required for the canonical story's opening sequence. It must not introduce unrelated mathematics/science lessons, assessment systems, curriculum progression, or educational mechanics.

If the story requires an interaction, trigger, NPC, object, area, dialogue, or state transition, those requirements must be extracted from the canonical story document before implementation.

## 6. Recommended Sora implementation boundary

The implementation should use a dedicated Sora-owned module, preferably with a narrow responsibility such as:

```text
sora_core/          # shared Sora services, if already established
sora_story/         # story initialization and story-state logic
```

Do not create a new namespace blindly if an existing Sora-owned module contract already defines the correct location. Qwen Code must inspect the current repository and use the established architecture rather than duplicating modules.

## 7. State model

At minimum, story initialization should conceptually track:

```text
story_version
first_entry_initialized
current_story_state
```

State keys must be namespaced under Sora and versioned if persisted through mod storage.

The implementation must avoid direct writes to upstream SQLite databases such as `players.sqlite`, `auth.sqlite`, or `map.sqlite`.

## 8. Idempotency and recovery

The first-entry initialization must be idempotent:

- first eligible entry → initialize and spawn at required coordinates;
- later entry → preserve the player's existing valid position/story state;
- repeated join events → must not create duplicate initialization state;
- missing/corrupt Sora state → fail safely and report a clear diagnostic rather than silently modifying unrelated runtime data.

## 9. Implementation preparation requirements

Qwen Code must prepare, but not own, production implementation. Its preparation package should contain:

1. exact target Sora module/path;
2. dependency declarations;
3. exact Luanti/VoxeLibre API calls to use;
4. persistence/state schema;
5. initialization and error-handling flow;
6. test-world setup instructions;
7. acceptance checks;
8. files OpenCode is expected to create or modify;
9. explicit protected paths that must remain untouched.

## 10. Production implementation requirements

OpenCode is the production implementation owner after the preparation gate.

OpenCode must:

- implement only the approved specification;
- avoid modifying protected upstream/live-world paths unless a written exception is issued;
- keep changes isolated and reviewable;
- document all created/modified Sora-owned files;
- report commands executed and actual outcomes;
- avoid claiming game execution or play-testing unless it actually occurred.

## 11. Validation and acceptance

The minimum acceptance criteria for the spawn portion are:

### AC-1 — Exact first-entry position
A fresh test player entering the target world is positioned at:

```text
541, 17, -98
```

### AC-2 — No repeated forced teleport
After first-entry initialization, a subsequent join does not forcibly reset the player to the initial spawn.

### AC-3 — Persistence
The initialization state survives the relevant server/world restart mechanism used by the implementation.

### AC-4 — Isolation
No protected upstream engine, upstream game, live-world database, or runtime-generated production state is modified as part of source implementation.

### AC-5 — Story boundary
No educational lesson implementation is introduced as part of Issue #1.

### AC-6 — Repository traceability
Every implementation change is attributable to Issue #1 and recorded in `docs/global handoff.md`.

## 12. Open technical decisions

The following must be resolved by the technical workflow before production implementation:

- exact Sora mod path to receive the story logic;
- whether a Sora story module already exists;
- exact Luanti/VoxeLibre player-join callback/API available in the current pinned version;
- exact persistent Sora state mechanism;
- how a disposable `Elementary_1` test-world copy will be created;
- how the canonical DOCX story will be inspected and converted into implementation requirements;
- whether the story opening requires additional entities, formspecs, dialogue, or world content beyond spawn.

These are implementation-preparation questions, not permission to expand Issue #1 scope.

## 13. Handoff chain

```text
Human Project Owner
        ↓
ChatGPT Desktop — architecture/specification direction
        ↓
Hermes — technical specification governance
        ↓
Qwen Code — implementation preparation
        ↓
Hermes — preparation gate
        ↓
OpenCode — production implementation
        ↓
Hermes — engineering review
        ↓
Human — final acceptance
```

## 14. Explicit status

**This document is a technical specification. It is not a production implementation.**

No source code is authorized merely by the existence of this document. Production implementation begins only after the appropriate handoff and preparation gate defined by the Sora workflow.
