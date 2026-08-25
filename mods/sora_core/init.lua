-- sora_core — Shared Sora services
-- Provides a lightweight wrapper around mod storage for Sora namespaced state

local SoraStorage = {}

-- Get the mod storage reference (must be called at load time)
local storage = core.get_mod_storage()

-- Internal: build a namespaced key
local function ns(key)
	return "sora." .. key
end

-- Get integer value
function SoraStorage.get_int(key)
	return storage:get_int(ns(key))
end

-- Set integer value
function SoraStorage.set_int(key, value)
	storage:set_int(ns(key), value)
end

-- Get string value
function SoraStorage.get_string(key)
	return storage:get_string(ns(key))
end

-- Set string value
function SoraStorage.set_string(key, value)
	storage:set_string(ns(key), value)
end

-- Check if key exists
function SoraStorage.contains(key)
	return storage:contains(ns(key))
end

-- Clear a key
function SoraStorage.clear(key)
	storage:set_string(ns(key), "")
end

-- Story-specific keys
SoraStoryKeys = {
	first_entry = function(player_name)
		return "story.first_entry." .. player_name
	end,
	version = function()
		return "story.version"
	end,
	state = function(player_name)
		return "story.state." .. player_name
	end,
}

return SoraStorage