-- sora_story — Story initialization and story-state logic for Elementary_1
-- Issue #1: First-entry spawn at 541, 17, -98 + TASK 002: Pre-history cutscene

local SoraStorage = dofile(core.get_modpath("sora_core") .. "/init.lua")

local STORY_SPAWN = { x = 541, y = 17, z = -98 }
local STORY_VERSION = 1

-- Cutscene constants (from preparation document)
local CUTSCENE_DURATION = 21.315875 -- seconds, from ffprobe of pre-history.ogg
local CUTSCENE_AUDIO_PATH = core.get_modpath("sora_story") .. "/../audios/pre-history.ogg"
local CUTSCENE_SWEEP_DEGREES = 60 -- sweep up by 60 degrees

-- Cutscene state (in-memory only; persisted flag handles cross-session)
local cutscene_state = {
	active = false,
	player_name = nil,
	start_time = 0,
	start_pitch = 0,
	end_pitch = 0,
	sound_handle = nil,
	orig_physics = nil,
}

-- Play the pre-history cutscene
local function play_cutscene(player)
	local name = player:get_player_name()
	if cutscene_state.active then
		core.log("warning", "[sora_story] cutscene already active for " .. name)
		return
	end

	-- Lock player physics
	local orig_physics = player:get_physics_override()
	cutscene_state.orig_physics = orig_physics
	player:set_physics_override({ speed = 0, jump = 0, gravity = 0 })

	-- Start audio
	local sound_handle = core.sound_play({
		name = CUTSCENE_AUDIO_PATH,
		gain = 1.0,
		loop = false,
	}, { to_player = name })

	-- Initialize camera sweep
	local start_pitch = player:get_look_vertical()
	local end_pitch = start_pitch - math.rad(CUTSCENE_SWEEP_DEGREES) -- negative = look up

	-- Activate cutscene state
	cutscene_state.active = true
	cutscene_state.player_name = name
	cutscene_state.start_time = core.get_us_time() / 1e6 -- seconds
	cutscene_state.start_pitch = start_pitch
	cutscene_state.end_pitch = end_pitch
	cutscene_state.sound_handle = sound_handle

	core.log("action", "[sora_story] cutscene started for " .. name)
end

-- Globalstep: drive camera sweep while cutscene is active
core.register_globalstep(function(dtime)
	if not cutscene_state.active then
		return
	end

	local elapsed = core.get_us_time() / 1e6 - cutscene_state.start_time
	if elapsed >= CUTSCENE_DURATION then
		-- End cutscene: restore and cleanup
		core.log("action", "[sora_story] cutscene completed for " .. (cutscene_state.player_name or "unknown"))

		-- Stop audio
		if cutscene_state.sound_handle then
			core.sound_stop(cutscene_state.sound_handle)
			cutscene_state.sound_handle = nil
		end

		-- Restore player physics
		local player = core.get_player_by_name(cutscene_state.player_name)
		if player and cutscene_state.orig_physics then
			player:set_physics_override(cutscene_state.orig_physics)
		elseif player then
			-- Fallback to defaults
			player:set_physics_override({ speed = 1, jump = 1, gravity = 1 })
		end

		-- Clear state
		cutscene_state.active = false
		cutscene_state.player_name = nil
		cutscene_state.orig_physics = nil
		return
	end

	-- Sweep camera upward
	local t = elapsed / CUTSCENE_DURATION
	if t > 1 then t = 1 end
	local pitch = cutscene_state.start_pitch + (cutscene_state.end_pitch - cutscene_state.start_pitch) * t

	-- Apply to all connected players (should only be the one player)
	for _, p in ipairs(core.get_connected_players()) do
		p:set_look_vertical(pitch)
	end
end)

-- First-entry initialization (spawn + cutscene trigger)
local function init_story(player)
	if not player or not player.get_player_name then
		core.log("warning", "[sora_story] newplayer without valid player ref")
		return
	end

	local name = player:get_player_name()
	if not name or name == "" then
		core.log("warning", "[sora_story] newplayer with empty name")
		return
	end

	-- Defensive: skip if already initialized in storage
	if SoraStorage.get_int(SoraStoryKeys.first_entry(name)) == 1 then
		return
	end

	-- Verify story version compatibility
	local version = SoraStorage.get_int(SoraStoryKeys.version())
	if version > STORY_VERSION then
		core.log("warning", "[sora_story] stored story version " .. version .. " > current " .. STORY_VERSION)
	end

	-- Attempt to set position with error handling
	local ok, err = pcall(function()
		player:set_pos(STORY_SPAWN)
	end)

	if not ok then
		core.log("error", "[sora_story] failed to set first-entry spawn for " .. name .. ": " .. tostring(err))
		return
	end

	-- Mark first-entry as complete BEFORE triggering cutscene
	-- (so re-entry never re-triggers mid-cutscene)
	SoraStorage.set_int(SoraStoryKeys.first_entry(name), 1)
	SoraStorage.set_int(SoraStoryKeys.version(), STORY_VERSION)

	-- Initialize empty story state (future: library introductory dialogue/story state)
	SoraStorage.set_string(SoraStoryKeys.state(name), "")

	core.log("action", "[sora_story] first-entry spawn completed for " .. name .. " at 541,17,-98")

	-- Trigger pre-history cutscene
	play_cutscene(player)
end

core.register_on_newplayer(init_story)

-- Chat command for testing/debugging
core.register_chatcommand("sora_story_status", {
	params = "",
	description = "Show Sora story state for current player",
	func = function(name)
		local player = core.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end

		local first = SoraStorage.get_int(SoraStoryKeys.first_entry(name))
		local state = SoraStorage.get_string(SoraStoryKeys.state(name))
		local version = SoraStorage.get_int(SoraStoryKeys.version())

		local pos = player:get_pos()
		return true, string.format(
			"[sora_story] player=%s first_entry=%d version=%d pos=(%.1f,%.1f,%.1f) state=%s cutscene_active=%s",
			name, first, version, pos.x, pos.y, pos.z,
			state ~= "" and state or "(empty)",
			cutscene_state.active and "true" or "false"
		)
	end,
})

core.register_chatcommand("sora_story_reset", {
	params = "",
	description = "Reset Sora story state for current player (admin/testing)",
	func = function(name)
		if not core.check_player_privs(name, { server = true }) then
			return false, "Requires server privilege"
		end

		SoraStorage.clear(SoraStoryKeys.first_entry(name))
		SoraStorage.clear(SoraStoryKeys.state(name))
		return true, "[sora_story] state reset for " .. name
	end,
})

-- Debug command to replay cutscene without resetting persistent flag
core.register_chatcommand("sora_story_replay_cutscene", {
	params = "",
	description = "Replay the pre-history cutscene for current player (server priv)",
	func = function(name)
		if not core.check_player_privs(name, { server = true }) then
			return false, "Requires server privilege"
		end

		local player = core.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end

		play_cutscene(player)
		return true, "[sora_story] cutscene replay triggered for " .. name
	end,
})