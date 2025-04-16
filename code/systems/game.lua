--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local function game()
    return {
        c_up = false,
        c_down = false,
        c_left = false,
        c_right = false,
        c_primary = false,
        c_secondary = false,
        c_tertiary = false,
        h_len = 0,
        h_task = nil,
        r_color = 16777215,
        r_choice = -1,
        r_face = nil,
        r_flip = false,
        r_font = nil,
        r_content = nil,
        r_preset = nil,
        r_skip = false,
        r_voice = nil,
        cutscene = 0,
        encounter = false,
        interact = false,
        script = nil,
        sprint = false
    }
end
____exports.default = game
return ____exports
