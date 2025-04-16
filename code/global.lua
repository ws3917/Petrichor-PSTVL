local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local STSaveFile = ____storyteller.STSaveFile
local STValueRandom = ____storyteller.STValueRandom
local ____utils = require("code.engine.utils")
local keygen = ____utils.keygen
local TRUE = true
local FALSE = false
____exports.cursors = {
    arrow = love.mouse.newCursor("cursors/arrow.png", 1, 1),
    arrow_active = love.mouse.newCursor("cursors/arrow_active.png", 1, 1),
    hand = love.mouse.newCursor("cursors/hand.png", 1, 1)
}
____exports.init = {load = false, reload = false}
____exports.input_defaults = {
    down = "down s k kp5",
    fullscreen = "v f4",
    left = "left a j kp4",
    primary = "z return space kp1",
    right = "right d l kp6",
    secondary = "x rshift lshift kp2",
    tertiary = "c rctrl lctrl kp3",
    up = "up w i kp8"
}
____exports.random = __TS__New(
    STValueRandom,
    0,
    0,
    function()
        local value = ____exports.accessor.random
        if value == "" then
            return nil
        else
            return value
        end
    end,
    function(value)
        local ____value_0 = value
        ____exports.accessor.random = ____value_0
        return ____value_0
    end
)
____exports.sources = {
    down = {},
    fullscreen = {},
    left = {},
    primary = {},
    right = {},
    secondary = {},
    tertiary = {},
    up = {}
}
____exports.world = __TS__New(STSaveFile, "world.csv", {
    ["$option_debug"] = FALSE,
    ["$option_debug_prompt"] = FALSE,
    ["$option_input_down"] = ____exports.input_defaults.down,
    ["$option_input_fullscreen"] = ____exports.input_defaults.fullscreen,
    ["$option_input_left"] = ____exports.input_defaults.left,
    ["$option_input_primary"] = ____exports.input_defaults.primary,
    ["$option_input_right"] = ____exports.input_defaults.right,
    ["$option_input_secondary"] = ____exports.input_defaults.secondary,
    ["$option_input_tertiary"] = ____exports.input_defaults.tertiary,
    ["$option_input_up"] = ____exports.input_defaults.up,
    ["$option_music"] = 12,
    ["$option_music_enabled"] = TRUE,
    ["$option_shaders"] = 1,
    ["$option_sound"] = 12,
    ["$option_sound_enabled"] = TRUE,
    _ponder = FALSE,
    choice_home_book = 0,
    choice_home_food = 0,
    event_home_bookshelf = 0,
    event_home_bucket = FALSE,
    event_home_computer = FALSE,
    event_home_food = FALSE,
    event_home_fusebox = FALSE,
    event_home_outside = FALSE,
    event_home_rope = FALSE,
    event_home_secret = FALSE,
    event_home_telecomm = FALSE,
    event_home_telescope = FALSE,
    event_redleaf_gateclimb = 0,
    floof = FALSE,
    item_boot1 = FALSE,
    item_boot2 = FALSE,
    item_bucket = FALSE,
    item_cover = FALSE,
    item_crowbar = FALSE,
    item_drill = FALSE,
    item_glove1 = FALSE,
    item_glove2 = FALSE,
    item_goatplush = FALSE,
    item_rock = FALSE,
    item_rope = FALSE,
    item_scissors = FALSE,
    location_idx = 1,
    location_map = "home",
    location_pos_x = 235,
    location_pos_y = 230,
    location_stance = "down",
    pager_home = "{}",
    pager_redleaf = "{}",
    plot = 0,
    random = "",
    rhythm = FALSE,
    state_home_fusebox = 21,
    state_home_telecomm_message = 0,
    state_home_telescope_x = 0,
    state_home_telescope_y = 0,
    state_redleaf_gate = 0,
    state_redleaf_trowel = 0,
    tutorial_choice = TRUE,
    tutorial_dialogue = TRUE,
    tutorial_sprint = TRUE
})
____exports.accessor = ____exports.world:accessor()
function ____exports.sourceClear()
    for key in pairs(____exports.sources) do
        __TS__ArraySplice(____exports.sources[key], 0)
    end
end
function ____exports.sourceReset()
    for key in pairs(____exports.sources) do
        local source = ____exports.sources[key]
        __TS__ArraySplice(
            source,
            0,
            #source,
            unpack(keygen(____exports.accessor["$option_input_" .. key]))
        )
    end
end
return ____exports
