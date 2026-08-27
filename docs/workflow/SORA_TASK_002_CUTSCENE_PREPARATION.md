# SORA TASK 002 — Cutscene Implementation Preparation

**Status:** Ready for implementation (OpenCode — Production Implementation Engineer)
**Author:** Hermes — Technical Lead / Senior Software Engineer
**Date:** 2026-08-26
**Reference:** `docs/workflow/SORA_TASK_002_CUTSCENE_HANDOFF.md`
**Applies to:** First-entry pre-history cutscene in the Elementary story world.

---

## 1. Objective

On first entry into the Elementary_1 world, play a pre-history cutscene: an upward
camera sweep while the `pre-history.ogg` audio plays, with the player optionally
locked, then restore normal control.

## 2. Verified Constraints

### 2.1 Audio asset

- Asset: `mods/audios/pre-history.ogg`
- **Measured duration:** 21.315875 s (ffprobe; MPEG Layer III, 128 kbps, 44.1 kHz, mono)
- **Pitfall:** the file lives in `mods/audios/`, NOT in a mod-local `sounds/` folder.
  `core.sound_play({name = "pre-history"})` resolves against registered sound names.
  Recommended: reference the file directly by path
  (`minetest.get_modpath("sora_story") .. "/../audios/pre-history.ogg"`), or copy/register
  it under the story mod. Confirm only one of these; do not rely on bare name resolution
  without verifying registration.

### 2.2 Camera sweep — Luanti 5.16.1

- There is **no native camera-animate API** in Luanti 5.16.1.
- Mechanism: `core.register_globalstep(fn)` + `player:set_look_vertical(rad)`
  (negative value = look up) driven over the measured duration with a frame delta.
- Loop must run only while the cutscene is active; stop when duration is reached.
- Use `player:set_look_vertical` stepwise (e.g. ease-in then steady sweep) toward a
  target angle, then hold; then end the cutscene.

### 2.3 Player lock (optional but recommended)

- `player:set_physics_override({speed = 0, jump = 0, gravity = 0})` to freeze the player.
- Must **restore** original values after the cutscene ends (engine default:
  `{speed = 1, jump = 1, gravity = 1}` or the values captured before locking).

### 2.4 Sound playback

- Start: `core.sound_play({name = <resolved name or path>, gain = 1.0, loop = false},
  {to_player = name})`
- Stop/cleanup: `core.sound_stop(handle)` on cutscene end.

### 2.5 First-entry trigger

- First entry is already handled by Issue #1: `core.register_on_newplayer` in
  `mods/sora_story/init.lua`, which persists a first-entry flag.
- The cutscene trigger must reuse the **same persisted flag** so the flag stays in
  sync: set the persisted flag BEFORE the cutscene completes (or atomically with
  trigger) so re-entry never re-triggers mid-cutscene; show + play cutscene, then done.

### 2.6 State / persistence

- Cutscene **active state is in-memory only** (a local variable / flag dict). It is NOT
  stored, because it only needs to suppress re-trigger within a single session; the
  persistent first-entry flag already provides cross-session suppression.
- Debug re-play: reuse existing `/sora_story_reset` command (resets the persisted flag).

## 3. Implementation Sketch (Lua, reference only — OpenCode implements cleanly)

```lua
-- mods/sora_story/init.lua (integration point: inside register_on_newplayer, after flag set)
local sweep = { active = false, t0 = 0, dur = 21.315875, start_pitch = 0, end_pitch = 0 }

function sora_story.play_cutscene(player)
  if sweep.active then return end
  local name = player:get_player_name()
  sweep.active, sweep.t0 = true, minetest.get_us_time() / 1e6
  sweep.start_pitch = player:get_look_vertical()
  sweep.end_pitch   = sweep.start_pitch + math.rad(60)  -- sweep up by 60 deg
  if sora_story.is_first_entry or force then
    -- trigger only on first entry (flag already set by Issue #1)
  end
  -- lock
  player:set_physics_override({speed = 0, jump = 0, gravity = 0})
  -- audio
  sora_story.sfx = core.sound_play(
    { name = minetest.get_modpath("sora_story") .. "/../audios/pre-history.ogg",
      gain = 1.0, loop = false },
    { to_player = name })
end

-- globalstep (registered once)
core.register_globalstep(function(dtime)
  if not sweep.active then return end
  local elapsed = minetest.get_us_time() / 1e6 - sweep.t0
  if elapsed >= sweep.dur then
    -- restore + end
    sweep.active = false
    if sora_story.sfx then core.sound_stop(sora_story.sfx); sora_story.sfx = nil end
    return
  end
  local t = elapsed / sweep.dur
  if t > 1 then t = 1 end
  local pitch = sweep.start_pitch + (sweep.end_pitch - sweep.start_pitch) * t
  for _, p in ipairs(minetest.get_connected_players()) do
    p:set_look_vertical(pitch)
  end
end)

-- on completion (when elapsed >= dur):
--   for each connected player: restore physics override (speed/jump/gravity = 1)
--   (headless note: disconnect/reconnect during cutscene = acceptable edge case)
```

> Note: `minetest.get_us_time()` is monotonically increasing microseconds — good for
> duration timing without dtime drift.

## 4. OpenCode Checklist

- [ ] Pick ONE audio-resolution approach (path vs registration) and verify it plays.
- [ ] Add `play_cutscene` call inside existing `register_on_newplayer`, gated on the
      Issue #1 persisted first-entry flag (set the flag before triggering).
- [ ] Register a single globalstep for the sweep; start it in `play_cutscene`.
- [ ] `set_look_vertical` eased upward over 21.315875 s; cap at end angle.
- [ ] Apply physics lock on start; **restore** on end.
- [ ] Play `pre-history.ogg` on start; `sound_stop` on end.
- [ ] Ensure `/sora_story_reset` re-enables the cutscene for debug.
- [ ] Test in the disposable test world (NOT `worlds/Elementary_1/`).
- [ ] Report back for Hermes engineering review.

## 5. Acceptance Checks (T-AC)

| ID | Check |
|----|-------|
| T-AC-1 | Cutscene plays only on first entry (persisted flag). |
| T-AC-2 | Audio is the full `pre-history.ogg` (~21.3 s). |
| T-AC-3 | Camera visibly sweeps upward (HUMAN visual check). |
| T-AC-4 | Player is locked during the cutscene. |
| T-AC-5 | Control / physics fully restored after the cutscene. |
| T-AC-6 | No re-trigger on the same session re-entry / re-login. |
| T-AC-7 | `/sora_story_reset` re-enables the cutscene. |
| T-AC-8 | No changes to protected paths (`luanti/`, `games/mineclone2/`, `worlds/Elementary_1/`). |

## 6. Protected Paths

Do NOT modify:
- `luanti/`
- `games/mineclone2/`
- `worlds/Elementary_1/`  (production world — test only in disposable world)
- `mod_data/`

## 7. Handoff Chain

- **Author (spec + prep):** Hermes — Technical Lead / Senior Software Engineer
- **Next owner (implement + verify):** OpenCode — Production Implementation Engineer
- **Engineering review:** Hermes, after OpenCode reports back.

## 8. Notes / Edge Cases

- Headless env cannot visually confirm the sweep (T-AC-3); that is Human visual
  verification per `SORA_WORKFLOW_STATE.md` section 9.
- Disconnect/reconnect mid-cutscene: the globalstep runs only for connected players;
  acceptable, no crash expected.
- If the audio path approach strums re-registration issues, fall back to copying the
  file into `mods/sora_story/sounds/` and registering a sound entry — document which.
