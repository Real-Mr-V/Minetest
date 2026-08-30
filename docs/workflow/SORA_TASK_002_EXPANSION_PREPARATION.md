# Sora TASK 002 — Expanded Opening Sequence: Implementation Preparation

**Status:** PREPARATION — ready for Hermes technical gate  
**Date:** 2026-08-30  
**Author:** Hermes — Technical Lead / Senior Software Engineer  
**Producer implementation:** OpenCode — Production Implementation Engineer  

> **Note:** This document covers elements **not yet implemented** by OpenCode.  
> The pre‑history cutscene itself was implemented by OpenCode in `mods/sora_story/init.lua`  
> (commit `2745b16` / `4ef5bff`) and is NOT re‑specified here.  
> This package only covers the *expanded* requirements from the updated  
> `docs/workflow/SORA_TASK_002_CUTSCENE_HANDOFF.md` (commit `a4da8ab`).

---

## 1. Elements to add

| # | Element | Status |
|---|---------|--------|
| 1 | After pre‑history cutscene ends → play `befor_black_stone.ogg` (29.7 s) | ❌ missing |
| 2 | Node `sora_story:black_stone` at `574,18,-148` with black‑stone texture | ❌ missing |
| 3 | On punch → play `black_stone.ogg` (35.4 s) + lock player | ❌ missing |
| 4 | After `black_stone.ogg` finishes → place luminous guide at `524,18,-148` | ❌ missing |
| 5 | `mods/sora_story/sounds/` — all 3 `.ogg` assets | ✅ staged |
| 6 | `mods/sora_story/textures/sora_intro_black_stone.png` (300×300 RGBA) | ✅ staged |

---

## 2. Verified technical facts

**Audio durations (ffprobe):**
| File | Duration | Bit‑rate |
|------|----------|----------|
| `pre‑history.ogg` | 21.290854 s | 128 kbps 44.1 kHz mono |
| `befor_black_stone.ogg` | 29.702292 s | (same) |
| `black_stone.ogg` | 35.370854 s | (same) |

**Texture:** `sora_intro_black_stone.png` — 300×300, RGBA (8‑bit, non‑interlaced)  
Source: `asset/block_pic/black_stone.png` (provided by Human, stored in `mods/sora_story/textures/`).

**Luanti 5.16.1 API (already verified in prior preparation):**
- `minetest.register_node(name, def)` — register a node with `tiles`, `groups`, `on_punch`
- `minetest.set_node(pos, {name = …})` — place a node in the world
- `minetest.get_node_or_nil(pos)` — read a node (for idempotent placement)
- `core.sound_play({name = …}, {to_player = …})` — player‑targeted sound
- `core.sound_stop(handle)`
- `player:set_physics_override(table)` — lock / unlock player
- `player:get_physics_override()` → capture, `player:set_physics_override(captured)` → restore
- `core.register_globalstep(fn)` — per‑tick driver for cutscene phases

---

## 3. Recommended implementation approach

### 3.1 Architecture

Extend the **existing** `mods/sora_story/init.lua` with:

- A **cutscene phase machine** (enum + driver) so the single `globalstep` handles:
  1. `PRE_HISTORY` (exists, keep)
  2. `BEFOR_STONE` (new — play `befor_black_stone.ogg` while holding camera)
  3. `BLACK_STONE` (new — triggered by punching the black‑stone node)
- A **persistence key** `"sora_story.black_stone_done.<player>"` to prevent repeat
  activation of the black‑stone sequence per player (stored in `sora_core` mod‑storage).

### 3.2 Phase machine sketch (reference, not production code)

```lua
-- Enum
local PHASE = { PRE_HISTORY = 1, BEFOR_STONE = 2, BLACK_STONE = 3, NONE = 0 }

-- State (add to existing cutscene_state)
--   .phase: PHASE enum
--   .target_phase_time: seconds until phase ends

-- PRE_HISTORY driver already exists (21.3 s → auto‑transition)
-- On PRE_HISTORY end: stop current sound, transition to BEFOR_STONE

-- In BEFOR_STONE: play befor_black_stone.ogg, hold camera.
-- On BEFOR_STONE end: core.after(0, end_cutscene) → restore pos/phys

-- Black‑stone node register_node with on_punch:
--   check persistence key; if not done, mark done, set phase = BLACK_STONE,
--   play black_stone.ogg, lock physics.
-- On BLACK_STONE end: place luminous guide, restore player.
```

### 3.3 Luminous guide node

- `light_source = 14` so it glows in darkness
- Initial texture can reuse the black‑stone texture (substitute until a dedicated
  emissive texture is produced)
- Placed via `minetest.set_node(GUIDE_POS, {name = "sora_story:luminous_guide"})`
- Must only appear when `black_stone.ogg` finishes (not before)

### 3.4 Idempotency

- The black‑stone punch must be guarded by a persistent flag per player so it
  fires only once.
- The `init_story` → `play_cutscene(path) call already gated by Issue #1's
  `first_entry` flag → the whole opening sequence is single‑run per player.

---

## 4. OpenCode checklist

- [ ] Insert `PHASE` enum into cutscene state.
- [ ] In `globalstep`, add `BEFOR_STONE` and `BLACK_STONE` branches.
- [ ] On `PRE_HISTORY` completion → start `befor_black_stone.ogg`.
- [ ] On `BEFOR_STONE` completion → restore player (end_cutscene).
- [ ] Register `sora_story:black_stone` node at `574,18,-148` with `sora_intro_black_stone.png`
- [ ] Add per‑player persistence flag `"sora_story.black_stone_done.<name>"`.
- [ ] `on_punch` → set `BLACK_STONE` phase, play `black_stone.ogg`, lock physics.
- [ ] On `BLACK_STONE` completion → `place_luminous_guide()` + restore player.
- [ ] Register `sora_story:luminous_guide` node (light_source=14).
- [ ] Verify all 3 `.ogg` assets load (they are already staged under `sounds/`).
- [ ] Verify black‑stone texture loads (staged under `textures/`).

---

## 5. Acceptance checks

| ID | Criterion | How to verify |
|----|-----------|---------------|
| T‑AC‑2b | `befor_black_stone.ogg` plays after pre‑history cutscene | Audio |
| T‑AC‑3b | Black‑stone node exists at correct coordinate | `/sora_story_status` or in‑game |
| T‑AC‑4b | Punch plays `black_stone.ogg` and locks player | Audio + control check |
| T‑AC‑5b | Luminous guide appears only after `black_stone.ogg` finishes | Visual |
| T‑AC‑6b | Guide coordinates = `524,18,-148` | Visual or `/debug` |
| T‑AC‑7b | Sequence does not repeat on subsequent joins | /sora_story_status |
| T‑AC‑8b | No protected paths modified | git status |

---

## 6. Protected paths (unchanged)

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

---

## 7. Handoff chain

```text
ChatGPT Web (game‑design context) → ChatGPT Desktop (architecture)
  → Hermes (technical + prep, this document) → Hermes gate
  → OpenCode (production implementation) → Hermes review
  → Human acceptance
```

---

## 8. Status

This is a **correction‑aware preparation package**.  
I, Hermes, previously exceeded my role by writing production code — that has been
reverted (git checkout HEAD — mods/sora_story/init.lua).  
From this point forward I prepare and govern; OpenCode implements.

OpenCode may begin implementation once Hermes passes the technical gate on this package.