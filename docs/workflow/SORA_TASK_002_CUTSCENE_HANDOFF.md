# SORA TASK 002 — First-Entry Pre-History Cutscene

**Status:** RESEARCH / GAME_DESIGN handoff
**Current owner:** ChatGPT Web
**Next owner:** Perplexity — Game Design & Educational Gameplay Director

## Objective
When a player enters SORA for the first time, start the opening pre-history cutscene. During the cutscene, play `pre-history.ogg` and move the camera upward at a medium, continuous speed. When the audio ends, return the camera to normal gameplay control/state.

## Product context
The main SORA story is the current development priority. Educational lessons are explicitly deferred until the main story phase is addressed.

## Canonical story source
`sora_story/`

Current story document:
`sora_story/main story_elementary_1.docx`

## First-entry spawn
The first-entry player spawn requirement previously established for SORA is:
`541, 17, -98`

The cutscene is intended to occur on that first entry, subject to the technical specification and implementation plan.

## Authoritative inputs
- `docs/SORA_PROJECT_CONSTITUTION.md`
- `docs/SORA_TEAM_OPERATING_SYSTEM.md`
- `docs/SORA_TEAM_ROLES.md`
- `docs/SORA_HANDOFF_PROTOCOL.md`
- `docs/ARCHITECTURE/SORA_ARCHITECTURE_BASELINE.md`
- current workflow-state documents under `docs/WORKFLOW/`
- canonical story under `sora_story/`
- Human request in the project conversation

## Required behavior
1. Detect first entry into SORA for the player.
2. Place/use the first-entry spawn at `541,17,-98` according to the approved technical design.
3. Enter a cutscene state.
4. Play `pre-history.ogg`.
5. While the audio is playing, move the camera upward at a medium speed.
6. At the end of the audio, stop the cutscene and restore normal camera/player control.
7. The behavior must not replay on every ordinary join after the first-entry condition has been completed.

## Important open technical questions
- Exact duration/metadata of `pre-history.ogg` must be verified by the implementation lane; do not invent a duration.
- Exact camera-control mechanism must be defined by the technical lead/architecture lane.
- Exact definition of "first time" (persistent per-player completion state and reset behavior) must be specified technically.
- The implementation must respect protected paths and the approved SORA architecture.

## Scope boundary
This task does not authorize lesson implementation, educational mechanics, or changes to protected upstream/runtime paths.

## Acceptance criteria
- A genuinely first-time player receives the opening cutscene.
- `pre-history.ogg` begins as part of the cutscene.
- Camera movement is visibly upward and continuous at the approved medium speed while audio plays.
- Normal gameplay camera/control is restored when the audio finishes.
- Repeat joins do not replay the first-entry cutscene unless an explicit reset/debug mechanism is provided.
- No protected path is modified without explicit authorization.

## Next action
Perplexity should define the gameplay/cinematic behavior and player-facing presentation, then hand off to ChatGPT Desktop for architecture, followed by Claude technical specification, Qwen preparation, preparation gate, and OpenCode implementation according to the SORA Team Operating System.
