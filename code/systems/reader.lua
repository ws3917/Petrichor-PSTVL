local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__PromiseAll = ____lualib.__TS__PromiseAll
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__Promise = ____lualib.__TS__Promise
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayJoin = ____lualib.__TS__ArrayJoin
local __TS__PromiseRace = ____lualib.__TS__PromiseRace
local __TS__Number = ____lualib.__TS__Number
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STAnimation = ____storyteller.STAnimation
local STContainer = ____storyteller.STContainer
local STObject = ____storyteller.STObject
local STRectangle = ____storyteller.STRectangle
local STSprite = ____storyteller.STSprite
local STText = ____storyteller.STText
local STTyper = ____storyteller.STTyper
local ____utils = require("code.engine.utils")
local standardSplitter = ____utils.standardSplitter
local function reader(assets, ____bindingPattern0, batch, game, ____bindingPattern1)
    local atlas
    atlas = ____bindingPattern0.atlas
    local screen
    screen = ____bindingPattern1.screen
    local typer
    local reader
    reader = {
        display_value = nil,
        headers = {},
        last_task = nil,
        next_task = nil,
        presets = {
            none = {
                color = 16777215,
                chunk = math.huge,
                faces = {},
                font = assets["f$helloplayer"],
                interval = 1,
                voices = {}
            },
            player = {
                color = 10652124,
                chunk = 1,
                faces = {
                    annoyed = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$annoyed_large"] or assets["if$player$annoyed"]}) end,
                    confused = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$confused_large"] or assets["if$player$confused"]}) end,
                    cry = function(box) return __TS__New(STAnimation, {direction = 1, anchor = 0.5, frames = box and assets["if$player$cry_large"] or assets["if$player$cry"]}) end,
                    default = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$default_large"] or assets["if$player$default"]}) end,
                    determined = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$determined_large"] or assets["if$player$determined"]}) end,
                    determined2 = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$determined2_large"] or assets["if$player$determined2"]}) end,
                    happi = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$happi_large"] or assets["if$player$happi"]}) end,
                    happi2 = function(box) return __TS__New(STAnimation, {direction = 1, anchor = 0.5, frames = box and assets["if$player$happi2_large"] or assets["if$player$happi2"]}) end,
                    sad = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sad_large"] or assets["if$player$sad"]}) end,
                    sad2 = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sad2_large"] or assets["if$player$sad2"]}) end,
                    side = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$side_large"] or assets["if$player$side"]}) end,
                    sigh = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sigh_large"] or assets["if$player$sigh"]}) end,
                    sleep = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sleep_large"] or assets["if$player$sleep"]}) end,
                    sodesuka = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sodesuka_large"] or assets["if$player$sodesuka"]}) end,
                    surprise = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$surprise_large"] or assets["if$player$surprise"]}) end,
                    sweat = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sweat_large"] or assets["if$player$sweat"]}) end,
                    sweat2 = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sweat2_large"] or assets["if$player$sweat2"]}) end,
                    sweat3 = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sweat3_large"] or assets["if$player$sweat3"]}) end,
                    sweat4 = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sweat4_large"] or assets["if$player$sweat4"]}) end,
                    sweat5 = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$sweat5_large"] or assets["if$player$sweat5"]}) end,
                    upset = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$upset_large"] or assets["if$player$upset"]}) end,
                    upset2 = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$upset2_large"] or assets["if$player$upset2"]}) end,
                    what = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$what_large"] or assets["if$player$what"]}) end,
                    wink = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$wink_large"] or assets["if$player$wink"]}) end,
                    xeyes = function(box) return __TS__New(STSprite, {anchor = 0.5, image = box and assets["if$player$xeyes_large"] or assets["if$player$xeyes"]}) end
                },
                font = assets["f$helloplayer"],
                interval = 1,
                voices = {default = {{assets["v$player"], 1}}}
            }
        },
        choice = function(self, choices)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                game.r_choice = -1
                if #choices == 0 then
                    return ____awaiter_resolve(nil)
                end
                game.cutscene = game.cutscene + 1
                local fader = __TS__New(STRectangle, {alpha = 0, color = 0, size = {x = 240, y = 180}, anchor = 0.5})
                local dropdown = __TS__New(STSprite, {image = assets["im$ch_dropdown"], priority = 1, anchor = {x = 0.5, y = 1}, position = {y = -90}})
                local text = __TS__New(STText, {
                    anchor = {x = 0.5},
                    justify = 0.5,
                    priority = 2,
                    font = assets["f$helloplayer"],
                    position = {y = -85}
                }):addTicker(function(self)
                    local ____ = self.alpha.value
                    self.content = table.concat(
                        __TS__ArrayMap(
                            choices,
                            function(____, c, i)
                                local active = i == atlas.navigators.choicer.position.y
                                return (((("{color=" .. tostring(active and 10652124 or 16777215)) .. "}") .. (active and ">{shift=3}" or "")) .. c) .. (active and "{shift=3}<" or "")
                            end
                        ),
                        "\n"
                    )
                end)
                local wrapper = __TS__New(STContainer, {alpha = 0.7, children = {fader, dropdown}, priority = 1000000}):addDrawer(batch.drawer)
                screen:attach(wrapper)
                local y = -85 + assets["f$helloplayer"]:compute(table.concat(choices, "\n")).y + 5
                local transtime = 7
                __TS__Await(__TS__PromiseAll({
                    fader.alpha:automate(transtime, 0.25),
                    dropdown.position:automate(transtime, {y = y}, {y = y})
                }))
                wrapper:attach(text)
                game.h_len = #choices
                local task = ST:task()
                game.h_task = task
                atlas:switch("choicer")
                __TS__Await(task)
                game.r_choice = atlas.navigators.choicer.position.y
                game.h_task = nil
                wrapper:detach(text)
                game.h_len = 0
                game.cutscene = game.cutscene - 1
                local ____self_0 = __TS__PromiseAll({
                    fader.alpha:automate(transtime, 0),
                    dropdown.position:automate(transtime, {}, {y = -90})
                })
                ____self_0["then"](
                    ____self_0,
                    function()
                        screen:detach(wrapper)
                    end
                )
            end)
        end,
        display = function(self)
            local ____reader_9, ____display_value_10 = reader, "display_value"
            if ____reader_9[____display_value_10] == nil then
                ____reader_9[____display_value_10] = (function()
                    local container = __TS__New(STContainer, {alpha = 0, position = {x = -120, y = -90}, metadata = {
                        active = true,
                        initY = false,
                        endY = false,
                        veloY = 0,
                        scroll = 0
                    }, priority = 50000}):addTicker(function(self)
                        if self.metadata.active then
                            local ____temp_4 = self.alpha.value ~= 0.7
                            if ____temp_4 then
                                local ____self_alpha_1, ____value_2 = self.alpha, "value"
                                local ____self_alpha_value_3 = ____self_alpha_1[____value_2] + 0.7 / 4
                                ____self_alpha_1[____value_2] = ____self_alpha_value_3
                                ____temp_4 = ____self_alpha_value_3 > 0.7
                            end
                            if ____temp_4 then
                                self.alpha.value = 0.7
                            end
                        else
                            local ____temp_8 = self.alpha.value ~= 0
                            if ____temp_8 then
                                local ____self_alpha_5, ____value_6 = self.alpha, "value"
                                local ____self_alpha_value_7 = ____self_alpha_5[____value_6] - 0.7 / 4
                                ____self_alpha_5[____value_6] = ____self_alpha_value_7
                                ____temp_8 = ____self_alpha_value_7 < 0
                            end
                            if ____temp_8 then
                                self.alpha.value = 0
                                screen:detach(self)
                                reader.display_value = nil
                            end
                        end
                    end)
                    return container
                end)()
            end
            return reader.display_value
        end,
        header = function(self, value)
            return __TS__New(
                __TS__Promise,
                function(____, resolve)
                    local ____reader_headers_12 = reader.headers
                    ____reader_headers_12[#____reader_headers_12 + 1] = {value, resolve}
                end
            )
        end,
        read = function(self)
            local ____opt_13 = reader.next_task
            if ____opt_13 ~= nil then
                ____opt_13.complete()
            end
        end,
        text = function(self, lines)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                local ____opt_15 = reader.last_task
                if ____opt_15 ~= nil then
                    ____opt_15.complete()
                end
                if #lines == 0 then
                    reader.last_task = nil
                    return ____awaiter_resolve(nil)
                end
                local last_task = ST:task()
                reader.last_task = last_task
                local display = reader:display()
                display:clear()
                display.metadata.scroll = 0
                atlas:switch("reader")
                game.cutscene = game.cutscene + 1
                screen:attach(display)
                display.metadata.active = true
                game.r_color = 16777215
                game.r_face = nil
                game.r_skip = true
                game.r_flip = false
                game.r_font = nil
                game.r_content = nil
                game.r_preset = nil
                game.r_voice = nil
                typer.interval = 1
                local index = 0
                while index ~= #lines do
                    typer.content = ""
                    local ____typer_text_19 = typer.text
                    local ____lines_18 = lines
                    local ____index_17 = index
                    index = ____index_17 + 1
                    local textPromise = ____typer_text_19(
                        typer,
                        __TS__StringReplaceAll(
                            __TS__StringReplaceAll(
                                __TS__StringReplaceAll(
                                    __TS__StringReplaceAll(
                                        __TS__StringReplaceAll(
                                            __TS__StringReplaceAll(
                                                __TS__StringReplaceAll(
                                                    __TS__StringReplaceAll(
                                                        __TS__StringReplaceAll(
                                                            __TS__StringReplaceAll(
                                                                __TS__StringReplaceAll(
                                                                    __TS__StringReplaceAll(____lines_18[____index_17 + 1], " (", " [^2]("),
                                                                    ") ",
                                                                    ") [^2]"
                                                                ),
                                                                ", ",
                                                                ",[^3] "
                                                            ),
                                                            ",\n",
                                                            ",[^3]\n"
                                                        ),
                                                        ": ",
                                                        ":[^4] "
                                                    ),
                                                    ":\n",
                                                    ":[^4]\n"
                                                ),
                                                ". ",
                                                ".[^5] "
                                            ),
                                            ".\n",
                                            ".[^5]\n"
                                        ),
                                        "! ",
                                        "![^5] "
                                    ),
                                    "!\n",
                                    "![^5]\n"
                                ),
                                "? ",
                                "?[^5] "
                            ),
                            "?\n",
                            "?[^5]\n"
                        )
                    )
                    if index == #lines then
                        game.r_skip = false
                    end
                    local color = game.r_color
                    local face = game.r_face
                    local flip = game.r_flip
                    local font = game.r_font
                    local face_box = face and face(true) or nil
                    local face_bubble = face and face(false) or nil
                    local ____opt_24 = font
                    if ____opt_24 ~= nil then
                        local ____opt_25 = font
                        if ____opt_25 ~= nil then
                            local ____opt_26 = font
                            ____opt_25 = __TS__ArrayMap(
                                ____opt_26 and __TS__StringSplit(
                                    font and font:wrap(
                                        game.r_content or "",
                                        face == nil and (function() return 225 end) or (function(line) return 225 - (line == 0 and 18 or 0) end),
                                        standardSplitter
                                    ),
                                    "\n"
                                ),
                                function(____, line, index)
                                    if face_box ~= nil and index == 0 then
                                        return flip and line .. "{shift=18}" or "{shift=18}" .. line
                                    else
                                        return line
                                    end
                                end
                            )
                        end
                        ____opt_24 = __TS__ArrayJoin(____opt_25, "\n")
                    end
                    local content = ____opt_24 or ""
                    if #display.children == 0 then
                        display:attach(__TS__New(
                            STSprite,
                            {
                                position = {x = 3, y = 180 - 52 - 3},
                                image = assets["im$dl_box"],
                                metadata = {face = face_bubble, flip = flip, content = content},
                                children = {
                                    __TS__New(STContainer, {color = color, position = {x = flip and 234 - 6 - 20 or 6 + 20, y = 6 + 20}, children = face_box == nil and ({}) or ({face_box})}),
                                    __TS__New(STText, {font = font, position = {x = (flip or face_box == nil) and 6 or 6 + 40, y = 6}}):addTicker(function(self)
                                        self.content = typer.content
                                    end)
                                }
                            }
                        ))
                    else
                        if #display.children == 1 then
                            display:attach(__TS__New(STObject, {acceleration = 0.85, priority = -1, metadata = {endY = false, initY = false, veloY = 0, update = 0}}):addTicker(function(self)
                                local m = self.metadata
                                local y1 = 0
                                local margin = 5
                                for ____, bubble in ipairs(self.children) do
                                    y1 = y1 + (bubble.metadata.y + margin + 9)
                                end
                                local bstop = 90
                                local bsbot = 180 - 52
                                local bsfad = 30
                                local bottom = bsbot - y1
                                if self.metadata.update ~= #self.children then
                                    self.velocity.y = 0
                                    self.metadata.update = #self.children
                                    m.endY = false
                                    if not m.initY then
                                        m.initY = true
                                        self.position.y = bottom + y1
                                    else
                                        local ____self_position_35, ____y_36 = self.position, "y"
                                        local ____m_32, ____veloY_33 = m, "veloY"
                                        local ____m_veloY_34 = ____m_32[____veloY_33] + ((bottom - self.position.y) / 2 - m.veloY) / 2
                                        ____m_32[____veloY_33] = ____m_veloY_34
                                        ____self_position_35[____y_36] = ____self_position_35[____y_36] + ____m_veloY_34
                                    end
                                else
                                    local scroll = display.metadata.scroll
                                    if scroll ~= 0 then
                                        m.endY = true
                                    elseif not m.endY then
                                        local ____self_position_40, ____y_41 = self.position, "y"
                                        local ____m_37, ____veloY_38 = m, "veloY"
                                        local ____m_veloY_39 = ____m_37[____veloY_38] + ((bottom - self.position.y) / 2 - m.veloY) / 2
                                        ____m_37[____veloY_38] = ____m_veloY_39
                                        ____self_position_40[____y_41] = ____self_position_40[____y_41] + ____m_veloY_39
                                    end
                                    local stretch = (self.position.y - ST:clamp(
                                        self.position.y,
                                        bottom,
                                        math.max(bottom, bstop)
                                    )) / 2
                                    self.velocity.y = ST:clamp(
                                        self.velocity.y - scroll,
                                        math.min(-6 + -stretch, 0),
                                        math.max(6 - stretch, 0)
                                    )
                                    if scroll == 0 then
                                        local ____self_position_42, ____y_43 = self.position, "y"
                                        ____self_position_42[____y_43] = ____self_position_42[____y_43] + math.min(stretch / -5, 2)
                                    end
                                end
                                local y2 = 0
                                for ____, bubble in ipairs(self.children) do
                                    do
                                        local n = bubble.metadata
                                        bubble.position.x = n.flip and 240 - 11 - margin - n.x + 1 or margin - 2
                                        bubble.position.y = y2
                                        local realY = self.position.y + y2
                                        y2 = y2 + (n.y + margin + 9)
                                        local alpha = 1 - math.min(
                                            math.abs(realY - ST:clamp(realY, bstop, bsbot - n.y)) / bsfad,
                                            1
                                        )
                                        bubble.alpha.value = alpha * 0.7
                                        if alpha == 0 then
                                            goto __continue65
                                        end
                                    end
                                    ::__continue65::
                                end
                            end))
                        end
                        local box = display.children[1]
                        local boxFace = box.children[1]
                        local boxText = box.children[2]
                        local bubbles = display.children[2]
                        local ____temp_46 = font and font:compute(box.metadata.content) or ({x = 0, y = 0})
                        local x = ____temp_46.x
                        local y = ____temp_46.y
                        local w = x + 12
                        local h = y + 10
                        bubbles:attach(__TS__New(
                            STContainer,
                            {
                                metadata = {x = x, y = y, flip = box.metadata.flip},
                                children = {
                                    __TS__New(STSprite, {image = assets["im$dl_corner"]}),
                                    __TS__New(STSprite, {image = assets["im$dl_corner"], scale = {x = -1}, position = {x = w}}),
                                    __TS__New(STSprite, {image = assets["im$dl_corner"], scale = {y = -1}, position = {y = h}}),
                                    __TS__New(STSprite, {image = assets["im$dl_corner"], scale = -1, position = {x = w, y = h}}),
                                    __TS__New(STSprite, {image = assets["im$dl_edge"], position = {x = 6}, scale = {x = x}}),
                                    __TS__New(STSprite, {image = assets["im$dl_edge"], position = {x = 6, y = h}, scale = {x = x, y = -1}}),
                                    __TS__New(STSprite, {image = assets["im$dl_edge"], position = {y = 5}, rotation = 90, scale = {x = y, y = -1}}),
                                    __TS__New(STSprite, {image = assets["im$dl_edge"], position = {x = w, y = 5}, rotation = 90, scale = {x = y}}),
                                    __TS__New(STRectangle, {position = 5, color = 0, size = 1, scale = {x = x + 2, y = y}}),
                                    __TS__New(STText, {font = boxText.font, position = 6, content = box.metadata.content}),
                                    unpack(box.metadata.face == nil and ({}) or ({__TS__New(STSprite, {
                                        image = assets["im$dl_circle"],
                                        color = boxFace.color,
                                        anchor = 0.5,
                                        children = {box.metadata.face},
                                        position = {x = box.metadata.flip and w - 10.5 or 10.5, y = 7.5}
                                    })}))
                                }
                            }
                        ):addDrawer(batch.drawer))
                        box.metadata.face = face_bubble
                        box.metadata.flip = flip
                        box.metadata.content = content
                        boxFace.color.value = color
                        boxFace.position.x = flip and 234 - 6 - 20 or 6 + 20
                        boxFace:clear()
                        if face_box ~= nil then
                            boxFace:attach(face_box)
                        end
                        boxText.font = font
                        boxText.content = ""
                        boxText.position.x = (flip or face_box == nil) and 6 or 6 + 40
                    end
                    __TS__Await(__TS__PromiseRace({textPromise, last_task}))
                    if not last_task.active then
                        textPromise.complete()
                        typer.task = nil
                        atlas:switch(nil)
                        display.metadata.active = false
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    if game.r_preset ~= nil and reader.presets[game.r_preset] ~= nil then
                        typer.chunk = reader.presets[game.r_preset].chunk
                    else
                        typer.chunk = 1
                    end
                    local next_task = ST:task()
                    reader.next_task = next_task
                    __TS__Await(__TS__PromiseRace({next_task, last_task}))
                    if not last_task.active then
                        next_task.complete()
                        reader.next_task = nil
                        atlas:switch(nil)
                        display.metadata.active = false
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    reader.next_task = nil
                    if #lines ~= 0 then
                    end
                end
                local ____opt_47 = reader.last_task
                if ____opt_47 ~= nil then
                    ____opt_47.complete()
                end
                reader.last_task = nil
                atlas:switch(nil)
                display.metadata.active = false
                game.cutscene = game.cutscene - 1
            end)
        end,
        skip = function(self)
            if typer.task == nil then
                return
            end
            typer.chunk = math.huge
        end
    }
    typer = __TS__New(
        STTyper,
        {
            formatter = function(content)
                local font = game.r_font
                if font == nil then
                    game.r_content = ""
                    return ""
                end
                game.r_content = content
                return font:wrap(
                    content,
                    game.r_face == nil and (function() return 234 - 12 end) or (function() return 234 - 12 - 40 - 6 end),
                    standardSplitter
                )
            end,
            functions = {
                c = function(self, value)
                    typer.chunk = __TS__Number(value)
                end,
                f = function(self, value)
                    if game.r_preset == nil then
                        return
                    end
                    local faces = reader.presets[game.r_preset].faces
                    if not (faces[value] ~= nil) then
                        return
                    end
                    game.r_face = faces[value]
                end,
                h = function(self, value)
                    local index = #reader.headers
                    while true do
                        local ____index_49 = index
                        index = ____index_49 - 1
                        if not (____index_49 ~= 0) then
                            break
                        end
                        local header = reader.headers[index + 1]
                        if header[1] == value then
                            __TS__ArraySplice(reader.headers, index, 1)
                            header[2]()
                        end
                    end
                end,
                i = function(self, value)
                    typer.interval = __TS__Number(value)
                end,
                p = function(self, value)
                    if value ~= game.r_preset then
                        game.r_flip = not game.r_flip
                        if game.r_preset ~= nil then
                        end
                        game.r_preset = value
                    end
                    if not (reader.presets[value] ~= nil) then
                        typer.chunk = 1
                        game.r_color = 16777215
                        game.r_face = nil
                        game.r_font = nil
                        typer.interval = 1
                        game.r_voice = nil
                        return
                    end
                    local preset = reader.presets[value]
                    typer.chunk = preset.chunk
                    game.r_color = preset.color
                    game.r_face = preset.faces.default or nil
                    game.r_font = preset.font
                    typer.interval = preset.interval
                    game.r_voice = preset.voices.default or nil
                end,
                v = function(self, value)
                    if game.r_preset == nil then
                        return
                    end
                    local voices = reader.presets[game.r_preset].voices
                    if not (voices[value] ~= nil) then
                        return
                    end
                    game.r_voice = voices[value]
                end
            },
            receiver = function(content)
                if game.r_voice ~= nil and #game.r_voice ~= 0 and #__TS__StringReplaceAll(
                    __TS__StringReplaceAll(
                        __TS__StringReplaceAll(content, " ", ""),
                        "\n",
                        ""
                    ),
                    "\0",
                    ""
                ) ~= 0 then
                    if #game.r_voice == 1 then
                        game.r_voice[1][1]:instance()
                        return
                    end
                    ST:weigh(
                        game.r_voice,
                        math.random()
                    ):instance()
                end
            end
        }
    )
    return {reader = reader, typer = typer}
end
____exports.default = reader
return ____exports
