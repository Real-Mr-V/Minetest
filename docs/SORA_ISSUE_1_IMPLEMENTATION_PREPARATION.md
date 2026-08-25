# Sora Issue #1 — Implementation Preparation Package

**Issue:** #1 — SORA: Initial spawn and story-first development handoff
**Status:** PREPARATION — ready for Hermes technical gate
**Date:** 2026-08-26
**Preparation owner:** Hermes — Technical Lead (took over preparation after Qwen Code removal)
**Production implementation owner:** OpenCode
**Gate authority:** Hermes

> This is an implementation-ready preparation package produced by Hermes in the Technical Lead role. It does **not** authorize production code by itself. OpenCode must not begin production implementation until Hermes marks this package `READY` after the technical gate.

---

## 1. Approved target module/path

Two Sora-owned mods already exist as scaffolding under the designated Sora location `mods/`:

```text
mods/sora_core/mod.conf      # exists — shared Sora services / storage helper
mods/sora_story/mod.conf     # exists — story initialization and state logic
```

`mod.conf` for `sora_story` declares `depends = sora_core`, so the dependency direction is:

```text
sora_story → sora_core
```

The first-entry spawn logic lives in the **`sora_story`** mod. Any shared storage helper lives in **`sora_core`**.

### Files to create (OpenCode)
```text
mods/sora_core/init.lua       # optional shared storage helper (SoraStorage wrapper)
mods/sora_story/init.lua      # required — first-entry spawn + story state
```

### Protected paths (must remain untouched)
```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

No edit to `worlds/Elementary_1/world.mt`, `map_meta.txt`, `*.sqlite`, or the upstream game/engine source is permitted.

---

## 2. Exact Luanti API calls (verified against Luanti 5.16.1 `doc/lua_api.md`)

| Purpose | API | Notes |
|---|---|---|
| Register first-entry handler | `core.register_on_newplayer(function(player))` | Fires exactly once when a player enters the world for the first time. This is the cleanest idempotent trigger for Issue ~1. |
| Set player position | `player:set_pos({x=541, y=17, z=-98})` | `set_pos(pos)` on ObjectRef; no-op if attached. |
| Persistent Sora state | `local storage = core.get_mod_storage()` | StorageRef, saved automatically; survives restart; per-mod and per-world. Do this at load time. |
| Read/write state | `storage:get_string(key)`, `storage:set_string(key,value)`, `storage:get_int(key)`, `storage:set_int(key,value)`, `storage:contains(key)` | StorageRef inherits MetaDataRef methods. |

### Confirmed signatures (from pinned engine 5.16.1 `doc/lua_api.md`)
- `core.register_on_newplayer(function(ObjectRef))` — "Called when a new player enters the world for the first time."
- `set_pos(pos)` — Sets position of the object; `pos` is `{x=num,y=num,z=num}`.
- `core.get_mod_storage()` — "returns reference to mod private StorageRef" (at load time).
- StorageRef = mod metadata, saved automatically on per-mod and per-world basis; **cannot save raw binary data** (JSON-restricted).

---

## 3. Persistence / state schema (namespaced under Sora)

Store state in the `sora_core` (or per-mod) StorageRef under a Sora namespace. Recommended keys per player, keyed by sanitized player name:

```text
sora.story.first_entry.<player_name>  (int)  → 1 when first-entry has been performed
sora.story.version                    (int)  → story/data version
sora.story.state.<player_name>        (str)  → current player story state (empty until defined)
```

Because `register_on_newplayer` natively fires only for brand-new players, the `first_entry` flag is a **defensive double-check**, not the primary gate. This satisfies the idempotency requirement in the technical specification:

- first eligible entry → `on_newplayer` fires → set position → mark flag
- later entry → `on_newplayer` does NOT fire again → player's existing position/story state preserved
- repeated joins → no duplicate initialization
- missing/corrupt Sora state → the mod should log a clear diagnostic and fall back safely

---

## 4. Initialization and error-handling flow

```lua
-- mods/sora_story/init.lua  (conceptual implementation contract)
local STORY_SPAWN = { x = 541, y = 17, z = -98 }

local function init_story(player)
    if not player or not player:get_player_name() then
        core.log("warning", "[sora_story] newplayer without valid player ref")
        return
    end
    local name = player:get_player_name()
    -- defensive: skip if already initialized into storage
    if storage:get_int("sora_story.first." .. name) == 1 then
        return
    end
    local ok = pcall(function()
        player:set_pos(STORY_SPAWN)
    end)
    if not ok then
        core.log("error", "[sora_story] failed to set first-entry spawn for " .. name)
        return
    end
    storage:set_int("sora_story.first." .. name, 1)
    -- story-phase hook: (future) open the library introductory dialogue/story state here
end

core.register_on_newplayer(init_story)
```

Notes for error handling:
- Use `pcall` around position-setting so a bad world/pos does not crash the join.
- Log namespaced, greppable messages (`[sora_story]`).
- Do **not** write to `players.sqlite`, `auth.sqlite`, `map.sqlite`, or any upstream SQLite backend.

---

## 4. Tests / disposable test-world setup

Issue scope is story-first. Production implementation must NOT go directly to the protected log-level world. Use a disposable copy of the world for verification.

1. Copy the live world to a disposable test world (engine keeps runtime state out of source):
   ```text
   cp -r worlds/Elementary_1 worlds/Elementary_1_test
   ```
   Or create a fresh disposable world via the Luanti main menu pointing at the same game.
2. Enable the Sora mods (`sora_core`, `sora_story`) in that disposable world.
3. Start the world once. Create a **new** test player account (a player who has never joined before).
4. Confirm the new player spawns at `541,17,-98` (print pos via a chat command or `/status` equivalent / mod log).
5. Leave, rename the storage entry away or create a second existing player, rejoin → confirm no forced teleport to spawn.
6. Restart the world → confirm the first-entry state persists and a non-new player is untouched.

---

## 5. Acceptance checks (map to Issue #1 AC-1..AC-6)

- AC-1 (exact position): fresh player positioned at 541,17,-98.
- AC-2 (no repeated teleport): subsequent join does not reset position.
- AC-3 (persistence): state survives world restart.
- AC-4 (isolation): no protected path modified.
- AC-5 (story boundary): no lesson/educational gameplay introduced.
- AC-6 (traceability): all changes attributable to Issue ~1 and recorded in `docs/global handoff.md`.

---

## 6. Recommended files to change (summary for OpenCode)

```text
CREATEm  mods/sora_core/init.lua       (optional shared storage helper)
CREATE   mods/sora_story/init.lua      (first-entry spawn + story-state)
USED AS-IS: mods/sora_core/mod.conf, mods/sora_story/mod.conf (already scaffolded)
```

No protected path is to be modified.

---

## 7. Explicit protected paths (remain untouched)

```text
luanti/
games/mineclone2/
worlds/Elementary_1/
mod_data/
```

---

## 8. Handoff chain

```text
Human Project Owner
  ↓
ChatGPT Web — education/gameplay context (already done)
  ↓
ChatGPT Desktop — architecture/spec direction (spec done)
  ↓
Hermes — technical specification + implementation preparation (this document)
  ↓
Hermes — TECHNICAL GATE (mark package READY)
  ↓
OpenCode — production implementation
  ↓
Hermes — engineering review
  ↓
Human — final acceptance
```

---

## 9. Status

**This is an implementation preparation package produced under Hermes Technical Lead authority.**
Production implementation by OpenCode begins only after Hermes passes the preparation gate on this package.