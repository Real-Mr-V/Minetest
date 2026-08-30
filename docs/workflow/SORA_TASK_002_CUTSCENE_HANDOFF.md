# SORA TASK 002 — First-Entry Pre-History Cutscene and Black Stone

**Status:** RESEARCH / GAME_DESIGN handoff
**Current owner:** ChatGPT Web
**Next owner:** Perplexity — Game Design & Educational Gameplay Director

## Objective
When a player enters SORA for the first time, start the opening pre-history cutscene. During the cutscene, play `pre-history.ogg` and move the camera upward at a medium, continuous speed. When the audio ends, return to normal gameplay state and immediately play `befor_black_stone.ogg`.

After that sequence, the player encounters the story's black stone. The block must be named `sora_intro_black_stone`. The black stone must be placed at `574,18,-148`. When the player strikes it, play `black_stone.ogg`; after that audio finishes, a luminous block appears and guides the player toward `524,18,-148`.

## Product context
The main SORA story is the current development priority. Educational lessons are explicitly deferred until the main story phase is addressed.

## Canonical story source
`sora_story/`

Current story document:
`sora_story/main story_elementary_1.docx`

## First-entry spawn
`541,17,-98`

## Black stone location
The authoritative player-provided placement for the SORA story black stone is:
`574,18,-148`

## Authoritative audio asset locations
All SORA audio assets are located under:
`Minetest\mods\audios`

Story-specific audio requested in this task is located under:
`Minetest\mods\sora_story\sounds`

Required story audio:
- `pre-history.ogg`
- `befor_black_stone.ogg`
- `black_stone.ogg`

The exact duration of each audio file must be obtained from the actual assets by the technical implementation/review lane. Do not invent durations.

## Black stone visual asset
The user-provided image is `black_stone.png`, dimensions `300 x 300`, located at:
`Minetest\asset\block_pic\black_stone.png`

This image is the intended visual source for the SORA story's black stone. The technical implementation must determine the appropriate texture/resource path according to repository conventions.

## Required behavior
1. On the player's first entry, use the first-entry spawn at `541,17,-98` according to the approved technical design.
2. Enter the opening cutscene.
3. Play `pre-history.ogg` while the camera moves upward at medium speed.
4. When `pre-history.ogg` ends, end the cutscene and restore normal camera/player state.
5. Immediately after that opening sequence, play `befor_black_stone.ogg`.
6. Provide the story black-stone block named exactly `sora_intro_black_stone` at `574,18,-148`.
7. Use the supplied `black_stone.png` as its intended visual texture.
8. When the player strikes the black stone, play `black_stone.ogg`.
9. Do not reveal/activate the luminous guidance block until `black_stone.ogg` has finished.
10. After `black_stone.ogg` finishes, make a luminous block appear.
11. The luminous guidance must direct the player toward `524,18,-148`.
12. First-entry/cutscene behavior must not replay on ordinary subsequent joins unless an explicit reset/debug mechanism is provided.

## Important open technical questions
- Exact audio durations must be measured from the actual `.ogg` files.
- Exact camera-control mechanism must be defined by the architecture/technical lane.
- Exact definition and persistence of first-entry completion must be specified technically.
- Exact behavior of the luminous guide (placement, duration, indicator behavior, and player guidance presentation) must be defined by gameplay design and then architecture/technical specification.
- The supplied PNG is 300x300; implementation must determine proper texture handling without silently changing the intended visual.

## Scope boundary
This task is for the main story opening sequence only. It does not authorize lesson implementation, educational mechanics, or changes to protected upstream/runtime paths.

## Acceptance criteria
- A genuinely first-time player receives the opening cutscene at the required first-entry spawn.
- `pre-history.ogg` plays during the upward camera movement.
- Normal gameplay camera/control is restored when the opening audio/cutscene finishes.
- `befor_black_stone.ogg` plays after that opening sequence.
- `sora_intro_black_stone` exists at `574,18,-148` with the supplied black-stone visual.
- Striking the stone starts `black_stone.ogg`.
- The luminous guide does not appear before `black_stone.ogg` finishes.
- The luminous guide appears afterward and directs the player to `524,18,-148`.
- The first-entry sequence does not replay on ordinary subsequent joins.
- No protected path is modified without explicit authorization.

## Next action
Perplexity should define the player-facing cinematic/gameplay behavior and guidance presentation, then hand off to ChatGPT Desktop for architecture, followed by Claude technical specification, Qwen preparation, preparation gate, and OpenCode implementation according to the SORA Team Operating System.
