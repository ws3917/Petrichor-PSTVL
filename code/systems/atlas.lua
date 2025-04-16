local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STAnimation = ____storyteller.STAnimation
local STAtlas = ____storyteller.STAtlas
local STContainer = ____storyteller.STContainer
local STRectangle = ____storyteller.STRectangle
local STScreen = ____storyteller.STScreen
local STSprite = ____storyteller.STSprite
local STText = ____storyteller.STText
local ____global = require("code.global")
local accessor = ____global.accessor
local sourceClear = ____global.sourceClear
local sourceReset = ____global.sourceReset
local world = ____global.world
local ____launcher = require("code.screens.launcher")
local keybindsButtons = ____launcher.keybindsButtons
local mouseButtonMenu = ____launcher.mouseButtonMenu
local function textGen()
    return {
        confirm_debug = "Enable Debug Console?\n{color=0x7f7f7f}For if you do, in fact, know\nexactly what you're doing.",
        confirm_ponder = "Stop And Think?\n{color=0x7f7f7f}If you're stuck, doing this\nmay help you make progress.",
        generic_disabled = "Disabled",
        generic_enabled = "Enabled",
        generic_no = "No",
        generic_yes = "Yes",
        menu1 = "ITEM",
        menu2 = "PONDER",
        menu3 = "OPTIONS",
        menu4 = "SAVE",
        save1 = "Save The World?",
        save2 = "The world has\nbeen saved.",
        settings1 = "Back",
        settings2 = "Music",
        settings3 = "Sound",
        settings4 = "Keybinds",
        settings5 = "Shader Mode",
        settings6 = "Debug Console",
        shaders1 = "Off",
        shaders2 = "Basic",
        shaders3 = "Advanced"
    }
end
local function atlas(assets, batch, ____debug, game, ____bindingPattern0, ____bindingPattern1, ____bindingPattern2, ____bindingPattern3)
    local items
    local inventory
    inventory = ____bindingPattern0.inventory
    items = ____bindingPattern0.items
    local updateSound
    local updateMusic
    local sound
    local music
    music = ____bindingPattern1.music
    sound = ____bindingPattern1.sound
    updateMusic = ____bindingPattern1.updateMusic
    updateSound = ____bindingPattern1.updateSound
    local player_menu
    local player
    player = ____bindingPattern2.player
    player_menu = ____bindingPattern2.player_menu
    local object
    local screen
    screen = ____bindingPattern3.screen
    object = ____bindingPattern3.object
    local keybinds, logo, save, save_hooks, text
    local atlas
    atlas = __TS__New(
        STAtlas,
        {
            choicer = {
                grid = function(self)
                    return ST:populate(
                        game.h_len,
                        function(index) return {index} end
                    )
                end,
                next = function(self)
                    atlas:switch(nil)
                    local ____opt_0 = game.h_task
                    if ____opt_0 ~= nil then
                        ____opt_0.complete()
                    end
                    assets["s$menu_select"]:instance()
                end,
                position = {x = 0, y = 0},
                from = function(self, ____self)
                    ____self.position.y = 0
                end
            },
            choicer_horiz = {
                grid = function(self)
                    return {ST:populate(
                        game.h_len,
                        function(index) return index end
                    )}
                end,
                next = function(self)
                    atlas:switch(nil)
                    local ____opt_2 = game.h_task
                    if ____opt_2 ~= nil then
                        ____opt_2.complete()
                    end
                    assets["s$menu_select"]:instance()
                end,
                position = {x = 0, y = 0},
                from = function(self, ____self, target)
                    if target == "options" then
                        return
                    end
                    ____self.position.x = 0
                end
            },
            item = {
                grid = function(self)
                    return ST:populate(
                        math.ceil(#inventory / 2),
                        function(index) return ST:populate(
                            math.min(#inventory - index * 2, 2),
                            function(subindex) return index * 2 + subindex end
                        ) end
                    )
                end,
                position = {x = 0, y = 0},
                prev = function(self)
                    atlas:switch("menu")
                end,
                from = function(self, ____self)
                    ____self.position.x = 0
                    ____self.position.y = 0
                    screen:attach(__TS__New(
                        STScreen,
                        {
                            metadata = {tags = {"overlay"}},
                            priority = 1000000,
                            children = {
                                __TS__New(STSprite, {image = assets["im$ov_modal"], anchor = 0.5}),
                                unpack(ST:populate(
                                    16,
                                    function(index)
                                        local c = index % 2
                                        local r = math.floor(index / 2)
                                        if index < #inventory then
                                            local item = items[inventory[index + 1] + 1]
                                            return __TS__New(
                                                STText,
                                                {
                                                    font = assets["f$helloplayer"],
                                                    anchor = 0.5,
                                                    content = item:name(),
                                                    position = {
                                                        x = ST:spread_quantize(190 / 2, c, 2),
                                                        y = ST:spread_quantize(120 / 2, r, 8)
                                                    }
                                                }
                                            ):addTicker(function(self)
                                                if atlas.navigators.item.position.x == c and atlas.navigators.item.position.y == r then
                                                    self.color.red = 162
                                                    self.color.green = 137
                                                    self.color.blue = 220
                                                else
                                                    self.color.red = 255
                                                    self.color.green = 255
                                                    self.color.blue = 255
                                                end
                                            end)
                                        else
                                            return __TS__New(
                                                STRectangle,
                                                {
                                                    color = 4144959,
                                                    anchor = 0.5,
                                                    size = {x = 60, y = 0.5},
                                                    position = {
                                                        x = ST:spread_quantize(190 / 2, c, 2),
                                                        y = ST:spread_quantize(120 / 2, r, 8)
                                                    }
                                                }
                                            )
                                        end
                                    end
                                ))
                            }
                        }
                    ))
                end,
                to = function(self, ____self, target)
                    if target == nil then
                        game.cutscene = game.cutscene - 1
                        player_menu.scale.x = 0
                        player_menu.scale.y = 0
                        player_menu.metadata = false
                        player_menu.children[1]:clear()
                    end
                    local ____opt_4 = object("overlay")
                    if ____opt_4 ~= nil then
                        ____opt_4:destroy()
                    end
                end
            },
            menu = {
                grid = function(self)
                    local ____array_6 = __TS__SparseArrayNew(unpack(#inventory == 0 and ({}) or ({{"item"}})))
                    __TS__SparseArrayPush(____array_6, {"ponder"}, {"options"}, {"save"})
                    return {__TS__SparseArraySpread(____array_6)}
                end,
                position = {x = 0, y = 0},
                next = function(self)
                    local sel = atlas:selection()
                    if sel == "ponder" then
                        if not accessor._ponder then
                            atlas:switch("options_confirm")
                        else
                            player_menu.scale.x = 0
                            player_menu.scale.y = 0
                            atlas:switch(nil)
                            local ____opt_7 = game.script
                            if ____opt_7 ~= nil then
                                ____opt_7("ponder")
                            end
                        end
                    else
                        atlas:switch(sel)
                    end
                    assets["s$menu_select"]:instance()
                end,
                prev = function(self)
                    atlas:switch(nil)
                end,
                from = function(self, ____self, target)
                    if target == nil then
                        assets["s$menu_navigate"]:instance()
                        ____self.position.y = 0
                        game.cutscene = game.cutscene + 1
                        player_menu.metadata = true
                        player_menu.children[1]:attach(unpack(ST:populate(
                            4,
                            function(i) return __TS__New(STText, {font = assets["f$fives"], anchor = {x = 0.5}, position = {y = i * 7}, content = ({text.menu1, text.menu2, text.menu3, text.menu4})[i + 1]}):addTicker(function(self)
                                if atlas.target == "menu" and atlas:selection() == ({"item", "ponder", "options", "save"})[i + 1] then
                                    self.color.red = 255
                                    self.color.green = 255
                                    self.color.blue = 255
                                elseif i == 0 and #inventory == 0 then
                                    self.color.red = 63
                                    self.color.green = 63
                                    self.color.blue = 63
                                else
                                    self.color.red = 127
                                    self.color.green = 127
                                    self.color.blue = 127
                                end
                            end) end
                        )))
                    end
                end,
                to = function(self, ____self, target)
                    if target == nil then
                        game.cutscene = game.cutscene - 1
                        player_menu.metadata = false
                        player_menu.children[1]:clear()
                    end
                end
            },
            options = {
                grid = function(self)
                    return {
                        {"back"},
                        {"music"},
                        {"sound"},
                        {"input"},
                        {"shaders"},
                        {"debug"}
                    }
                end,
                position = {x = 0, y = 0},
                prev = function(self)
                    if game.encounter then
                        atlas:switch("choicer_horiz")
                    else
                        atlas:switch("menu")
                    end
                end,
                next = function(self)
                    repeat
                        local ____switch47 = atlas.navigators.options.position.y
                        local ____cond47 = ____switch47 == 0
                        if ____cond47 then
                            atlas:switch("menu")
                            break
                        end
                        ____cond47 = ____cond47 or ____switch47 == 1
                        if ____cond47 then
                            accessor["$option_music_enabled"] = not accessor["$option_music_enabled"]
                            updateMusic()
                            if music.value ~= 0 then
                                assets["s$menu_select$music"]:instance()
                            end
                            break
                        end
                        ____cond47 = ____cond47 or ____switch47 == 2
                        if ____cond47 then
                            accessor["$option_sound_enabled"] = not accessor["$option_sound_enabled"]
                            updateSound()
                            if sound.value ~= 0 then
                                assets["s$menu_select"]:instance()
                            end
                            break
                        end
                        ____cond47 = ____cond47 or ____switch47 == 3
                        if ____cond47 then
                            atlas:switch("options_input")
                            assets["s$menu_select"]:instance()
                            break
                        end
                        ____cond47 = ____cond47 or ____switch47 == 4
                        if ____cond47 then
                            local ____accessor_9, _____24option_shaders_10 = accessor, "$option_shaders"
                            local ____accessor__24option_shaders_11 = ____accessor_9[_____24option_shaders_10] + 1
                            ____accessor_9[_____24option_shaders_10] = ____accessor__24option_shaders_11
                            if ____accessor__24option_shaders_11 == 3 then
                                accessor["$option_shaders"] = 0
                            end
                            assets["s$menu_select"]:instance()
                            break
                        end
                        ____cond47 = ____cond47 or ____switch47 == 5
                        if ____cond47 then
                            if not accessor["$option_debug_prompt"] then
                                atlas:switch("options_confirm")
                            else
                                local ____debug_13 = ____debug
                                local ____temp_12 = not accessor["$option_debug"]
                                accessor["$option_debug"] = ____temp_12
                                ____debug_13.canActivate = ____temp_12
                            end
                            assets["s$menu_select"]:instance()
                            break
                        end
                        ____cond47 = ____cond47 or ____switch47 == 6
                        if ____cond47 then
                            atlas:switch("options_confirm")
                            assets["s$menu_select"]:instance()
                            break
                        end
                    until true
                end,
                from = function(self, ____self, target)
                    if target == "options_input" then
                        return
                    end
                    logo:attach()
                    screen:attach(__TS__New(
                        STContainer,
                        {
                            metadata = {tags = {"overlay"}},
                            priority = 1000000,
                            children = {
                                __TS__New(STRectangle, {anchor = 0.5, size = {x = 240, y = 180}, color = 0}),
                                logo,
                                unpack(__TS__ArrayMap(
                                    {
                                        text.settings1,
                                        text.settings2,
                                        text.settings3,
                                        text.settings4,
                                        text.settings5,
                                        text.settings6
                                    },
                                    function(____, line, index) return __TS__New(
                                        STText,
                                        {
                                            position = {
                                                x = -5,
                                                y = 35 + ST:spread(45, index, 6)
                                            },
                                            anchor = {x = 1, y = 0.5},
                                            font = assets["f$helloplayer"],
                                            content = line,
                                            children = (function()
                                                repeat
                                                    local ____switch60 = index
                                                    local ____cond60 = ____switch60 == 1 or ____switch60 == 2
                                                    if ____cond60 then
                                                        return {
                                                            __TS__New(STText, {anchor = {y = 0.5}, position = {x = 10}, font = assets["f$helloplayer"], content = text.generic_disabled}):addTicker(index == 1 and (function(self)
                                                                self.alpha.value = accessor["$option_music_enabled"] and 0 or 1
                                                            end) or (function(self)
                                                                self.alpha.value = accessor["$option_sound_enabled"] and 0 or 1
                                                            end)),
                                                            __TS__New(STAnimation, {anchor = {y = 0.5}, position = {x = 10, y = -2}, scale = {x = 2}, frames = assets["im$volume"]}):addTicker(index == 1 and (function(self)
                                                                self.alpha.value = accessor["$option_music_enabled"] and 1 or 0
                                                                self.frame = accessor["$option_music"]
                                                            end) or (function(self)
                                                                self.alpha.value = accessor["$option_sound_enabled"] and 1 or 0
                                                                self.frame = accessor["$option_sound"]
                                                            end))
                                                        }
                                                    end
                                                    ____cond60 = ____cond60 or (____switch60 == 4 or ____switch60 == 5)
                                                    if ____cond60 then
                                                        return {__TS__New(STText, {anchor = {y = 0.5}, position = {x = 10}, font = assets["f$helloplayer"]}):addTicker(index == 4 and (function(self)
                                                            self.content = ({text.shaders1, text.shaders2, text.shaders3})[accessor["$option_shaders"] + 1]
                                                        end) or (function(self)
                                                            self.content = accessor["$option_debug"] and text.generic_enabled or text.generic_disabled
                                                        end))}
                                                    end
                                                    do
                                                        return {}
                                                    end
                                                until true
                                            end)()
                                        }
                                    ):addTicker(function(self)
                                        if atlas.navigators.options.position.y == index then
                                            self.color.red = 162
                                            self.color.green = 137
                                            self.color.blue = 220
                                        else
                                            self.color.red = 255
                                            self.color.green = 255
                                            self.color.blue = 255
                                        end
                                    end) end
                                ))
                            }
                        }
                    ))
                end,
                to = function(self, ____self, target)
                    if target == "options_input" then
                        return
                    end
                    if target == "menu" or target == "choicer_horiz" then
                        ____self.position.y = 0
                    end
                    logo:clear()
                    local ____opt_14 = object("overlay")
                    if ____opt_14 ~= nil then
                        ____opt_14:destroy()
                    end
                end
            },
            options_confirm = {
                grid = function(self)
                    return {{"no", "yes"}}
                end,
                position = {x = 0, y = 0},
                prev = function(self)
                    if atlas.navigators.menu.position.y == (#inventory == 0 and 0 or 1) then
                        atlas:switch("menu")
                    else
                        atlas:switch("options")
                    end
                end,
                next = function(self, ____self)
                    if atlas.navigators.menu.position.y == (#inventory == 0 and 0 or 1) then
                        if atlas:selection() == "yes" then
                            accessor._ponder = true
                            player_menu.scale.x = 0
                            player_menu.scale.y = 0
                            atlas:switch(nil)
                            game.cutscene = game.cutscene - 1
                            player_menu.metadata = false
                            player_menu.children[1]:clear()
                            local ____opt_16 = game.script
                            if ____opt_16 ~= nil then
                                ____opt_16("ponder")
                            end
                        else
                            atlas:switch("menu")
                        end
                    else
                        if atlas:selection() == "yes" then
                            accessor["$option_debug_prompt"] = true
                            accessor["$option_debug"] = true
                            ____debug.canActivate = true
                        end
                        atlas:switch("options")
                    end
                    assets["s$menu_select"]:instance()
                end,
                from = function(self, ____self)
                    ____self.position.x = 0
                    screen:attach(__TS__New(
                        STContainer,
                        {
                            metadata = {tags = {"overlay"}},
                            priority = 1000000,
                            children = {
                                __TS__New(STRectangle, {anchor = 0.5, size = {x = 240, y = 180}, color = 0}),
                                __TS__New(STText, {
                                    position = {y = -32},
                                    anchor = {x = 0.5},
                                    justify = 0.5,
                                    font = assets["f$helloplayer"],
                                    content = atlas.navigators.menu.position.y == (#inventory == 0 and 0 or 1) and text.confirm_ponder or text.confirm_debug
                                }),
                                __TS__New(STText, {position = {x = -25, y = 24}, anchor = 0.5, font = assets["f$helloplayer"]}):addTicker(function(self)
                                    if atlas:selection() == "no" then
                                        self.color.red = 162
                                        self.color.green = 137
                                        self.color.blue = 220
                                        self.content = (">{shift=3}" .. text.generic_no) .. "{shift=3}<"
                                    else
                                        self.color.red = 255
                                        self.color.green = 255
                                        self.color.blue = 255
                                        self.content = text.generic_no
                                    end
                                end),
                                __TS__New(STText, {position = {x = 25, y = 24}, anchor = 0.5, font = assets["f$helloplayer"]}):addTicker(function(self)
                                    if atlas:selection() == "yes" then
                                        self.color.red = 162
                                        self.color.green = 137
                                        self.color.blue = 220
                                        self.content = (">{shift=3}" .. text.generic_yes) .. "{shift=3}<"
                                    else
                                        self.color.red = 255
                                        self.color.green = 255
                                        self.color.blue = 255
                                        self.content = text.generic_yes
                                    end
                                end)
                            }
                        }
                    ))
                end,
                to = function(self)
                    local ____opt_18 = object("overlay")
                    if ____opt_18 ~= nil then
                        ____opt_18:destroy()
                    end
                end
            },
            options_input = {
                grid = function(self)
                    return {}
                end,
                position = {x = 0, y = 0},
                from = function(self)
                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                        sourceClear()
                        ____debug.canActivate = false
                        local wrapper = __TS__New(
                            STContainer,
                            {
                                alpha = 0.92,
                                priority = 2000000,
                                children = {
                                    __TS__New(STRectangle, {
                                        alpha = 0.5,
                                        anchor = 0.5,
                                        size = {x = 240, y = 180},
                                        color = 0,
                                        priority = -3
                                    }),
                                    __TS__New(STRectangle, {anchor = 0.5, size = {x = 180, y = 120}, color = 0, priority = -2}),
                                    __TS__New(STContainer, {priority = -1}):addDrawer(function(self)
                                        love.graphics.setLineWidth(1 / 3)
                                        love.graphics.rectangle(
                                            "line",
                                            180 / -2 + 1,
                                            120 / -2 + 1,
                                            180 - 2,
                                            120 - 2
                                        )
                                    end)
                                }
                            }
                        ):addDrawer(batch.drawer)
                        screen:attach(wrapper)
                        local kp = love.keypressed
                        __TS__Await(mouseButtonMenu(
                            wrapper,
                            {keybinds = keybindsButtons(assets)},
                            "keybinds",
                            function(cancel)
                                local ____cancel_20 = cancel
                                keybinds.cancel = ____cancel_20
                                return ____cancel_20
                            end
                        ))
                        love.keypressed = kp
                        keybinds.cancel = nil
                        screen:detach(wrapper)
                        ____debug.canActivate = accessor["$option_debug"]
                        sourceReset()
                        atlas:switch("options")
                    end)
                end
            },
            reader = {
                grid = function(self)
                    return {}
                end,
                position = {x = 0, y = 0}
            },
            save = {
                grid = function(self)
                    return {{"yes", "no"}}
                end,
                position = {x = 0, y = 0},
                next = function(self)
                    if atlas:selection() == "no" then
                        atlas:switch("menu")
                    else
                        save()
                        atlas:switch("save_confirm")
                        assets["s$menu_select_huge"]:instance()
                    end
                end,
                prev = function(self)
                    atlas:switch("menu")
                end,
                from = function(self, ____self)
                    ____self.position.x = 0
                    screen:attach(__TS__New(
                        STContainer,
                        {
                            metadata = {tags = {"overlay"}},
                            priority = 1000000,
                            children = {
                                __TS__New(STSprite, {image = assets["im$ov_toast"], anchor = 0.5}),
                                __TS__New(STText, {position = {y = -14}, anchor = {x = 0.5}, justify = 0.5, font = assets["f$helloplayer"]}):addTicker(function(self)
                                    if atlas.target == "save" then
                                        self.content = text.save1
                                    else
                                        self.color.red = 162
                                        self.color.green = 137
                                        self.color.blue = 220
                                        self.content = text.save2
                                        self.position.y = 1.5
                                        self.anchor.y = 0.5
                                    end
                                end),
                                __TS__New(STText, {position = {x = -25, y = 11}, anchor = 0.5, font = assets["f$helloplayer"]}):addTicker(function(self)
                                    if atlas.target == "save" then
                                        if atlas:selection() == "yes" then
                                            self.color.red = 162
                                            self.color.green = 137
                                            self.color.blue = 220
                                            self.content = (">{shift=3}" .. text.generic_yes) .. "{shift=3}<"
                                        else
                                            self.color.red = 255
                                            self.color.green = 255
                                            self.color.blue = 255
                                            self.content = text.generic_yes
                                        end
                                    else
                                        self.alpha.value = 0
                                    end
                                end),
                                __TS__New(STText, {position = {x = 25, y = 11}, anchor = 0.5, font = assets["f$helloplayer"]}):addTicker(function(self)
                                    if atlas.target == "save" then
                                        if atlas:selection() == "no" then
                                            self.color.red = 162
                                            self.color.green = 137
                                            self.color.blue = 220
                                            self.content = (">{shift=3}" .. text.generic_no) .. "{shift=3}<"
                                        else
                                            self.color.red = 255
                                            self.color.green = 255
                                            self.color.blue = 255
                                            self.content = text.generic_no
                                        end
                                    else
                                        self.alpha.value = 0
                                    end
                                end)
                            }
                        }
                    ))
                end,
                to = function(self, ____self, target)
                    if target == "save_confirm" then
                        return
                    end
                    local ____opt_21 = object("overlay")
                    if ____opt_21 ~= nil then
                        ____opt_21:destroy()
                    end
                end
            },
            save_confirm = {
                grid = function(self)
                    return {}
                end,
                next = function(self)
                    atlas:switch("menu")
                end,
                prev = function(self)
                    atlas:switch("menu")
                end,
                position = {x = 0, y = 0},
                to = function(self)
                    local ____opt_23 = object("overlay")
                    if ____opt_23 ~= nil then
                        ____opt_23:destroy()
                    end
                end
            }
        }
    )
    keybinds = {cancel = nil}
    logo = __TS__New(STAnimation, {
        frames = assets["im$logo"],
        anchor = 0.5,
        direction = 1,
        position = {y = -52},
        scale = 2,
        color = 10652124
    }):addTicker(function(self)
        self.alpha.value = (atlas.target == "options" or atlas.target == "options_input") and 1 or 0
    end)
    local overlay_container = __TS__New(STContainer)
    save = function()
        accessor.location_pos_x = player.position.x
        accessor.location_pos_y = player.position.y
        accessor.location_stance = player.stance or "down"
        for ____, fn in ipairs(save_hooks) do
            fn()
        end
        world:apply()
    end
    save_hooks = {}
    text = textGen()
    return {
        atlas = atlas,
        keybinds = keybinds,
        logo = logo,
        overlay_container = overlay_container,
        save = save,
        save_hooks = save_hooks,
        text = text
    }
end
____exports.default = atlas
return ____exports
