local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local STValue = ____storyteller.STValue
local ____global = require("code.global")
local accessor = ____global.accessor
local function mixer(enabled)
    local valueMusic, valueSound
    local music = __TS__New(STValue)
    local sound = __TS__New(STValue)
    local function updateMusic(enabled)
        if enabled == nil then
            enabled = accessor["$option_music_enabled"]
        end
        music.value = valueMusic(enabled) ^ 2
    end
    local function updateSound(enabled)
        if enabled == nil then
            enabled = accessor["$option_sound_enabled"]
        end
        sound.value = valueSound(enabled) ^ 2
    end
    valueMusic = function(enabled)
        if enabled == nil then
            enabled = accessor["$option_music_enabled"]
        end
        return enabled and accessor["$option_music"] / 16 or 0
    end
    valueSound = function(enabled)
        if enabled == nil then
            enabled = accessor["$option_sound_enabled"]
        end
        return enabled and accessor["$option_sound"] / 16 or 0
    end
    updateMusic(enabled)
    updateSound(enabled)
    return {
        music = music,
        sound = sound,
        updateMusic = updateMusic,
        updateSound = updateSound,
        valueMusic = valueMusic,
        valueSound = valueSound
    }
end
____exports.default = mixer
return ____exports
