local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local STFacing = ____storyteller.STFacing
local STInput = ____storyteller.STInput
local ____global = require("code.global")
local accessor = ____global.accessor
local sources = ____global.sources
local function inputs(assets, ____bindingPattern0, ____debug, game, ____bindingPattern1, ____bindingPattern2, ____bindingPattern3)
    local atlas
    atlas = ____bindingPattern0.atlas
    local items
    local inventory
    inventory = ____bindingPattern1.inventory
    items = ____bindingPattern1.items
    local updateSound
    local updateMusic
    local sound
    local music
    music = ____bindingPattern2.music
    sound = ____bindingPattern2.sound
    updateMusic = ____bindingPattern2.updateMusic
    updateSound = ____bindingPattern2.updateSound
    local reader
    reader = ____bindingPattern3.reader
    return {
        down = __TS__New(STInput, sources.down):addDown(function()
            if ____debug.active or atlas.target == nil or not atlas:seek(STFacing.DOWN) then
                return
            end
            if atlas.target == "choicer" or atlas.target == "menu" or atlas.target == "options" or atlas.target == "options_input" or atlas.target == "item" then
                assets["s$menu_navigate"]:instance()
            end
        end):addHold(function()
            if ____debug.active then
                return
            end
            game.c_down = true
        end),
        fullscreen = __TS__New(STInput, sources.fullscreen):addDown(function()
            if ____debug.active then
                return
            end
            if (love.window.getFullscreen()) then
                love.window.setFullscreen(false)
            else
                love.window.setFullscreen(true)
            end
        end),
        primary = __TS__New(STInput, sources.primary):addDown(function()
            if ____debug.active then
                return
            end
            if game.cutscene == 0 then
                game.interact = true
                return
            end
            if atlas.target == nil then
                return
            end
            if atlas.target == "reader" then
                reader:read()
                return
            end
            if atlas.target == "item" then
                local selection = atlas:selection()
                atlas:switch(nil)
                assets["s$menu_select"]:instance()
                items[inventory[selection + 1] + 1]:script(reader)
            end
            atlas:next()
        end):addHold(function()
            if ____debug.active then
                return
            end
            game.c_primary = true
        end),
        left = __TS__New(STInput, sources.left):addDown(function()
            if ____debug.active or atlas.target == nil then
                return
            end
            if atlas.target == "options" then
                repeat
                    local ____switch25 = atlas.navigators.options.position.y
                    local ____cond25 = ____switch25 == 1
                    if ____cond25 then
                        if not accessor["$option_music_enabled"] then
                            accessor["$option_music_enabled"] = true
                        elseif accessor["$option_music"] ~= 0 then
                            accessor["$option_music"] = accessor["$option_music"] - 1
                        else
                            break
                        end
                        updateMusic()
                        if music.value ~= 0 then
                            assets["s$menu_select$music"]:instance()
                        end
                        break
                    end
                    ____cond25 = ____cond25 or ____switch25 == 2
                    if ____cond25 then
                        if not accessor["$option_sound_enabled"] then
                            accessor["$option_sound_enabled"] = true
                        elseif accessor["$option_sound"] ~= 0 then
                            accessor["$option_sound"] = accessor["$option_sound"] - 1
                        else
                            break
                        end
                        updateSound()
                        if sound.value ~= 0 then
                            assets["s$menu_select"]:instance()
                        end
                        break
                    end
                until true
                return
            end
            if not atlas:seek(STFacing.LEFT) then
                return
            end
            if atlas.target == "save" or atlas.target == "options_confirm" or atlas.target == "choicer_horiz" or atlas.target == "item" then
                assets["s$menu_navigate"]:instance()
            end
        end):addHold(function()
            if ____debug.active then
                return
            end
            game.c_left = true
        end),
        right = __TS__New(STInput, sources.right):addDown(function()
            if ____debug.active or atlas.target == nil then
                return
            end
            if atlas.target == "options" then
                repeat
                    local ____switch41 = atlas.navigators.options.position.y
                    local ____cond41 = ____switch41 == 1
                    if ____cond41 then
                        if not accessor["$option_music_enabled"] then
                            accessor["$option_music_enabled"] = true
                        elseif accessor["$option_music"] ~= 16 then
                            accessor["$option_music"] = accessor["$option_music"] + 1
                        else
                            break
                        end
                        updateMusic()
                        if music.value ~= 0 then
                            assets["s$menu_select$music"]:instance()
                        end
                        break
                    end
                    ____cond41 = ____cond41 or ____switch41 == 2
                    if ____cond41 then
                        if not accessor["$option_sound_enabled"] then
                            accessor["$option_sound_enabled"] = true
                        elseif accessor["$option_sound"] ~= 16 then
                            accessor["$option_sound"] = accessor["$option_sound"] + 1
                        else
                            break
                        end
                        updateSound()
                        if sound.value ~= 0 then
                            assets["s$menu_select"]:instance()
                        end
                        break
                    end
                until true
                return
            end
            if not atlas:seek(STFacing.RIGHT) then
                return
            end
            if atlas.target == "save" or atlas.target == "options_confirm" or atlas.target == "choicer_horiz" or atlas.target == "item" then
                assets["s$menu_navigate"]:instance()
            end
        end):addHold(function()
            if ____debug.active then
                return
            end
            game.c_right = true
        end),
        secondary = __TS__New(STInput, sources.secondary):addDown(function()
            if ____debug.active or atlas.target == nil then
                return
            end
            if atlas.target == "reader" then
                reader:skip()
                return
            end
            atlas:prev()
        end):addHold(function()
            if ____debug.active then
                return
            end
            game.c_secondary = true
        end),
        tertiary = __TS__New(STInput, sources.tertiary):addDown(function()
            if ____debug.active then
                return
            end
            if game.cutscene == 0 then
                atlas:switch("menu")
                return
            end
            if atlas.target == nil then
                return
            end
            if game.encounter then
                if atlas.target == "options" then
                    atlas:switch("choicer_horiz")
                elseif atlas.target == "choicer_horiz" then
                    atlas:switch("options")
                end
                return
            end
            if atlas.target == "menu" then
                atlas:prev()
            end
        end):addHold(function()
            if ____debug.active then
                return
            end
            game.c_tertiary = true
            if atlas.target == "reader" then
                reader:skip()
                if game.r_skip then
                    reader:read()
                end
            end
        end),
        up = __TS__New(STInput, sources.up):addDown(function()
            if ____debug.active or atlas.target == nil or not atlas:seek(STFacing.UP) then
                return
            end
            if atlas.target == "choicer" or atlas.target == "menu" or atlas.target == "options" or atlas.target == "options_input" or atlas.target == "item" then
                assets["s$menu_navigate"]:instance()
            end
        end):addHold(function()
            if ____debug.active then
                return
            end
            game.c_up = true
        end)
    }
end
____exports.default = inputs
return ____exports
