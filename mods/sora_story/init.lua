-- sora_story — Story initialization and story-state logic for Elementary_1
-- Issue #1: First-entry spawn at 541, 17, -98

local SoraStorage = dofile(core.get_modpath("sora_core") .. "/init.lua")

local STORY_SPAWN = { x = 541, y = 17, z = -98 }
local STORY_VERSION = 1

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

	-- Mark first-entry as complete
	SoraStorage.set_int(SoraStoryKeys.first_entry(name), 1)
	SoraStorage.set_int(SoraStoryKeys.version(), STORY_VERSION)

	-- Initialize empty story state (future: library introductory dialogue/story state)
	SoraStorage.set_string(SoraStoryKeys.state(name), "")

	core.log("action", "[sora_story] first-entry spawn completed for " .. name .. " at 541,17,-98")
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
			"[sora_story] player=%s first_entry=%d version=%d pos=(%.1f,%.1f,%.1f) state=%s",
			name, first, version, pos.x, pos.y, pos.z, state ~= "" and state or "(empty)"
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