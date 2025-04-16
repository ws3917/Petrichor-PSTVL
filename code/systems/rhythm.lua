local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local Map = ____lualib.Map
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__PromiseAll = ____lualib.__TS__PromiseAll
local __TS__Delete = ____lualib.__TS__Delete
local __TS__Iterator = ____lualib.__TS__Iterator
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STAnimation = ____storyteller.STAnimation
local STContainer = ____storyteller.STContainer
local STFacing = ____storyteller.STFacing
local STMap = ____storyteller.STMap
local STRectangle = ____storyteller.STRectangle
local STSprite = ____storyteller.STSprite
local STText = ____storyteller.STText
local STValue = ____storyteller.STValue
local ____global = require("code.global")
local accessor = ____global.accessor
local random = ____global.random
local function textGen()
    return { encounter1 = "(Press [↑] [↓] [←] [→] to move.)" }
end
local function rhythm(assets, ____bindingPattern0, batch, game, inputs, ____bindingPattern1)
    local atlas
    atlas = ____bindingPattern0.atlas
    local screen
    screen = ____bindingPattern1.screen
    local rhythm_container, rhythm_hooks, text
    local rhythm = {
        intro = function(self)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                local acc = 0
                local starx = __TS__New(
                    STRectangle,
                    {
                        metadata = __TS__New(STValue, 0.25),
                        priority = 60000
                    }
                )
                screen:attach(starx)
                local field = __TS__New(STContainer, { alpha = 0, metadata = { b = {}, p = {} }, priority = 2 })
                local function starDrawer(sim, a)
                    if sim == nil then
                        sim = false
                    end
                    if a == nil then
                        a = starx.metadata.value
                    end
                    acc = acc + (1 + a * 20)
                    while 1 <= acc do
                        acc = acc - 1
                        if #field.metadata.b == 0 then
                            __TS__ArrayPushArray(
                                field.metadata.b,
                                ST:populate(
                                    360,
                                    function(i) return i end
                                )
                            )
                        end
                        local xy = ST:ray(
                            __TS__ArraySplice(
                                field.metadata.b,
                                math.floor(math.random() * #field.metadata.b),
                                1
                            )[1],
                            1
                        )
                        local ____field_metadata_p_0 = field.metadata.p
                        ____field_metadata_p_0[#____field_metadata_p_0 + 1] = {
                            xy.x,
                            xy.y,
                            math.random(),
                            0.001
                        }
                    end
                    local index = #field.metadata.p
                    while true do
                        local ____index_1 = index
                        index = ____index_1 - 1
                        if not (____index_1 ~= 0) then
                            break
                        end
                        do
                            local starline = field.metadata.p[index + 1]
                            local progress = starline[4] * (1 + a / (50 - starline[3] * 48))
                            if 1.5 <= progress then
                                __TS__ArraySplice(field.metadata.p, index, 1)
                                goto __continue9
                            end
                            if sim then
                                starline[4] = progress
                                goto __continue9
                            end
                            local ox = starline[1] * starline[4] * 200
                            local oy = starline[2] * starline[4] * 200
                            starline[4] = progress
                            local c = (1 - (1 - progress) ^ 2) * (0.05 + starline[3] ^ 4 * 0.95)
                            love.graphics.setLineWidth(ST:remap(progress * (0.2 + starline[3] * 0.8), 0.25, 1.5))
                            love.graphics.setColor(c, c, c, a)
                            love.graphics.line(ox, oy, starline[1] * progress * 200, starline[2] * progress * 200)
                        end
                        ::__continue9::
                    end
                end
                local i = 30 * 20
                while true do
                    local ____i_2 = i
                    i = ____i_2 - 1
                    if not (____i_2 ~= 0) then
                        break
                    end
                    starDrawer(true, 1)
                end
                local sh = __TS__New(STValue)
                local function shTicker()
                    screen.position.x = sh.value * (math.random() * 2 - 1)
                    screen.position.y = sh.value * (math.random() * 2 - 1)
                end
                screen:addTicker(shTicker)
                local ____self_3 = sh:automate(150, 2, 0)
                ____self_3["then"](
                    ____self_3,
                    function()
                        screen:removeTicker(shTicker)
                        screen.position.x = 0
                        screen.position.y = 0
                    end
                )
                local canvas = love.graphics.newCanvas(ST.width, ST.height)
                field:addDrawer(function(self)
                    local color = { love.graphics.getColor() }
                    local canvas2 = { love.graphics.getCanvas() }
                    love.graphics.setColor(1, 1, 1, 1)
                    love.graphics.setCanvas(canvas)
                    love.graphics.clear(0, 0, 0, 0)
                    love.graphics.push()
                    love.graphics.replaceTransform(love.math.newTransform(
                        ST.width / 2 + starx.position.x,
                        ST.height / 2 + starx.position.y,
                        0,
                        starx.scale.x,
                        starx.scale.y
                    ))
                    starDrawer()
                    love.graphics.pop()
                    return function()
                        love.graphics.push()
                        love.graphics.replaceTransform(love.math.newTransform(
                            0,
                            0,
                            0,
                            ST.scale,
                            ST.scale
                        ))
                        love.graphics.setCanvas(canvas2)
                        love.graphics.setColor(color)
                        love.graphics.setBlendMode("add", "alphamultiply")
                        love.graphics.draw(canvas)
                        love.graphics.pop()
                    end
                end)
                starx:attach(field)
                field.alpha:automate(15, 1)
                starx.metadata:automate(150, 1)
                __TS__Await(ST:pause(10))
                local black = __TS__New(STRectangle, {
                    alpha = 0,
                    priority = 1,
                    anchor = 0.5,
                    color = 0,
                    size = { x = 250, y = 190 }
                })
                starx:attach(black)
                __TS__Await(black.alpha:automate(30, 1))
                local white = __TS__New(STRectangle,
                    { alpha = 0, anchor = 0.5, size = { x = 250, y = 190 }, priority = 3 })
                starx:attach(white)
                __TS__Await(white.alpha:automate(90, 1))
                starx:detach(black, field)
                canvas:release()
                local ____self_4 = white.alpha:automate(90, 0)
                ____self_4["then"](
                    ____self_4,
                    function()
                        screen:detach(starx)
                    end
                )
            end)
        end,
        start = function(self, preset)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                game.encounter = true
                local stage = preset.init
                local state = {}
                local music = __TS__New(Map)
                while true do
                    local stargate, task1, wrapper, xgen
                    local value = preset.stages[stage]
                    local script = __TS__Await(preset:script(state, stage))
                    if value == nil then
                        break
                    end
                    for ____, track in ipairs(value.tracks) do
                        if not music:has(track) then
                            music:set(
                                track,
                                preset.tracks[track + 1]:instance_forced({
                                    autoplay = false,
                                    effects = ST.distance
                                        .name_list,
                                    rate = value.rate
                                })
                            )
                        end
                    end
                    local audios = __TS__ArrayMap(
                        value.tracks,
                        function(____, track) return music:get(track).audio end
                    )
                    if not music:has(-1) then
                        music:set(
                            -1,
                            value.inst:instance_forced({ autoplay = false, gain = 0, rate = value.rate })
                        )
                    end
                    local inst = music:get(-1)
                    audios[#audios + 1] = inst.audio
                    local ____try = __TS__AsyncAwaiter(function()
                        for ____, audio in ipairs(audios) do
                            audio:play()
                        end
                    end)
                    __TS__Await(____try.catch(
                        ____try,
                        function(____)
                        end
                    ))
                    for ____, track in ipairs(value.tracks) do
                        music:get(track).active = true
                    end
                    inst.active = true
                    local apool = ST:populate(
                        #value.actions,
                        function(index) return index end
                    )
                    local actions = __TS__ArrayMap(
                        value.actions,
                        function(____, action, index)
                            return {
                                action[1],
                                __TS__ArraySplice(
                                    apool,
                                    random:int(#apool),
                                    1
                                )[1],
                                action[2],
                                index
                            }
                        end
                    )
                    table.sort(
                        actions,
                        function(a, b) return a[1] < b[1] end
                    )
                    local finish = -math.huge
                    local total = 0
                    local buffer = value.buffer
                    local duration = math.floor(value.duration / value.rate + 0.5)
                    local notes = {}
                    local seconds = math.floor((inst.audio:getDuration("seconds") or 0) * ST.fps + 0.5)
                    local start = math.floor((inst.position.value or 0) * ST.fps + 0.5)
                    for ____, note in ipairs(value.chart) do
                        if start + buffer <= note[1] and note[1] + note[2] <= start + buffer + duration then
                            notes[#notes + 1] = note
                            finish = math.max(finish, note[1] + note[2])
                            total = total + note[2]
                        elseif start + buffer <= seconds + note[1] and seconds + note[1] + note[2] <= start + buffer + duration then
                            notes[#notes + 1] = { seconds + note[1], note[2], note[3] }
                            finish = math.max(finish, seconds + note[1] + note[2])
                            total = total + note[2]
                        end
                    end
                    local done = false
                    local face_note = nil
                    local face = nil
                    local score = 0
                    local hint_progress = accessor.rhythm and 3 or 0
                    local hint_time = 0
                    local prog = 0
                    local time = start
                    local canvas = love.graphics.newCanvas(ST.width, ST.height)
                    local emotion = __TS__New(STAnimation, {
                        frames = value.emotion,
                        anchor = 0.5,
                        direction = 1,
                        priority = -99,
                        color = value.color
                    }):addTicker(function(self)
                        self.alpha.value = wrapper.alpha.value * stargate.alpha.value * 0.2
                    end)
                    local gvalue = __TS__New(STValue, 1)
                    local function flare_ticker(self)
                        if self.metadata then
                            self.alpha.value = 1
                            self.direction = 1
                        else
                            self.direction = 0
                            local ____temp_8 = not done and self.alpha.value > 0
                            if ____temp_8 then
                                local ____self_alpha_5, ____value_6 = self.alpha, "value"
                                local ____self_alpha_value_7 = ____self_alpha_5[____value_6] - 0.1
                                ____self_alpha_5[____value_6] = ____self_alpha_value_7
                                ____temp_8 = ____self_alpha_value_7 < 0
                            end
                            if ____temp_8 then
                                self.alpha.value = 0
                                self.frame = 0
                                self.step = 0
                            end
                        end
                    end
                    local flare_down = __TS__New(STAnimation, {
                        alpha = 0,
                        priority = 5,
                        metadata = false,
                        anchor = { y = 0.5 },
                        frames = assets["ig$rhythm$flare"],
                        position = { y = 20 },
                        rotation = 90
                    }):addTicker(flare_ticker)
                    local flare_down_left = __TS__New(STAnimation, {
                        alpha = 0,
                        priority = 5,
                        metadata = false,
                        frames = assets["ig$rhythm$flare_diag"],
                        position = { x = -8, y = 8 },
                        rotation = 90
                    }):addTicker(flare_ticker)
                    local flare_down_right = __TS__New(STAnimation, {
                        alpha = 0,
                        priority = 5,
                        metadata = false,
                        frames = assets["ig$rhythm$flare_diag"],
                        position = 8
                    }):addTicker(flare_ticker)
                    local flare_left = __TS__New(STAnimation, {
                        alpha = 0,
                        priority = 5,
                        metadata = false,
                        anchor = { y = 0.5 },
                        frames = assets["ig$rhythm$flare"],
                        position = { x = -20 },
                        rotation = 180
                    }):addTicker(flare_ticker)
                    local flare_right = __TS__New(STAnimation, {
                        alpha = 0,
                        priority = 5,
                        metadata = false,
                        anchor = { y = 0.5 },
                        frames = assets["ig$rhythm$flare"],
                        position = { x = 20 }
                    }):addTicker(flare_ticker)
                    local flare_up = __TS__New(STAnimation, {
                        alpha = 0,
                        priority = 5,
                        metadata = false,
                        anchor = { y = 0.5 },
                        frames = assets["ig$rhythm$flare"],
                        position = { y = -20 },
                        rotation = 270
                    }):addTicker(flare_ticker)
                    local flare_up_left = __TS__New(STAnimation, {
                        alpha = 0,
                        priority = 5,
                        metadata = false,
                        frames = assets["ig$rhythm$flare_diag"],
                        position = { x = -8, y = -8 },
                        rotation = 180
                    }):addTicker(flare_ticker)
                    local flare_up_right = __TS__New(STAnimation, {
                        alpha = 0,
                        priority = 5,
                        metadata = false,
                        frames = assets["ig$rhythm$flare_diag"],
                        position = { x = 8, y = -8 },
                        rotation = 270
                    }):addTicker(flare_ticker)
                    local joystick = __TS__New(STAnimation, {
                        anchor = 0.5,
                        direction = 1,
                        frames = assets["ig$rhythm$joystick_neutral1"],
                        priority = 6,
                        metadata = { x = nil, y = nil, c = 15 }
                    }):addTicker(function(self)
                        local idx = math.floor(ST:remap(
                            score / total,
                            0,
                            6,
                            prog == 0 and 0 or actions[prog][1],
                            actions[prog + 1][1]
                        ))
                        local d = false
                        local r = 0
                        local x = 0
                        local y = 0
                        repeat
                            local ____switch45 = face
                            local ____cond45 = ____switch45 == STFacing.DOWN
                            if ____cond45 then
                                r = 90
                                y = 1
                                break
                            end
                            ____cond45 = ____cond45 or ____switch45 == STFacing.DOWN_LEFT
                            if ____cond45 then
                                d = true
                                r = 90
                                x = -0.7071067811865476
                                y = 0.7071067811865476
                                break
                            end
                            ____cond45 = ____cond45 or ____switch45 == STFacing.DOWN_RIGHT
                            if ____cond45 then
                                d = true
                                x = 0.7071067811865476
                                y = 0.7071067811865476
                                break
                            end
                            ____cond45 = ____cond45 or ____switch45 == STFacing.LEFT
                            if ____cond45 then
                                r = 180
                                x = -1
                                break
                            end
                            ____cond45 = ____cond45 or ____switch45 == STFacing.RIGHT
                            if ____cond45 then
                                x = 1
                                break
                            end
                            ____cond45 = ____cond45 or ____switch45 == STFacing.UP
                            if ____cond45 then
                                r = 270
                                y = -1
                                break
                            end
                            ____cond45 = ____cond45 or ____switch45 == STFacing.UP_LEFT
                            if ____cond45 then
                                d = true
                                r = 180
                                x = -0.7071067811865476
                                y = -0.7071067811865476
                                break
                            end
                            ____cond45 = ____cond45 or ____switch45 == STFacing.UP_RIGHT
                            if ____cond45 then
                                d = true
                                r = 270
                                x = 0.7071067811865476
                                y = -0.7071067811865476
                                break
                            end
                        until true
                        x = x * (11 - idx)
                        y = y * (11 - idx)
                        if self.metadata.x == nil or self.metadata.y == nil then
                            self.metadata.x = x
                            self.metadata.y = y
                        end
                        self.metadata.x = (self.metadata.x + x * 2) / 3
                        self.metadata.y = (self.metadata.y + y * 2) / 3
                        self.position.x = math.floor(self.metadata.x + 0.5)
                        self.position.y = math.floor(self.metadata.y + 0.5)
                        self.rotation.value = r
                        if face_note ~= nil and face == face_note then
                            if not done then
                                self.metadata.c = 0
                            end
                            if d then
                                repeat
                                    local ____switch50 = idx
                                    local ____cond50 = ____switch50 == 0
                                    if ____cond50 then
                                        self.frames = assets["ig$rhythm$joystick_diagonal1"]
                                        break
                                    end
                                    ____cond50 = ____cond50 or ____switch50 == 1
                                    if ____cond50 then
                                        self.frames = assets["ig$rhythm$joystick_diagonal2"]
                                        break
                                    end
                                    ____cond50 = ____cond50 or ____switch50 == 2
                                    if ____cond50 then
                                        self.frames = assets["ig$rhythm$joystick_diagonal3"]
                                        break
                                    end
                                    ____cond50 = ____cond50 or ____switch50 == 3
                                    if ____cond50 then
                                        self.frames = assets["ig$rhythm$joystick_diagonal4"]
                                        break
                                    end
                                    ____cond50 = ____cond50 or ____switch50 == 4
                                    if ____cond50 then
                                        self.frames = assets["ig$rhythm$joystick_diagonal5"]
                                        break
                                    end
                                    ____cond50 = ____cond50 or ____switch50 == 5
                                    if ____cond50 then
                                        self.frames = assets["ig$rhythm$joystick_diagonal6"]
                                        break
                                    end
                                until true
                            else
                                repeat
                                    local ____switch52 = idx
                                    local ____cond52 = ____switch52 == 0
                                    if ____cond52 then
                                        self.frames = assets["ig$rhythm$joystick_cardinal1"]
                                        break
                                    end
                                    ____cond52 = ____cond52 or ____switch52 == 1
                                    if ____cond52 then
                                        self.frames = assets["ig$rhythm$joystick_cardinal2"]
                                        break
                                    end
                                    ____cond52 = ____cond52 or ____switch52 == 2
                                    if ____cond52 then
                                        self.frames = assets["ig$rhythm$joystick_cardinal3"]
                                        break
                                    end
                                    ____cond52 = ____cond52 or ____switch52 == 3
                                    if ____cond52 then
                                        self.frames = assets["ig$rhythm$joystick_cardinal4"]
                                        break
                                    end
                                    ____cond52 = ____cond52 or ____switch52 == 4
                                    if ____cond52 then
                                        self.frames = assets["ig$rhythm$joystick_cardinal5"]
                                        break
                                    end
                                    ____cond52 = ____cond52 or ____switch52 == 5
                                    if ____cond52 then
                                        self.frames = assets["ig$rhythm$joystick_cardinal6"]
                                        break
                                    end
                                until true
                            end
                        else
                            repeat
                                local ____switch54 = idx
                                local ____cond54 = ____switch54 == 0
                                if ____cond54 then
                                    self.frames = assets["ig$rhythm$joystick_neutral1"]
                                    break
                                end
                                ____cond54 = ____cond54 or ____switch54 == 1
                                if ____cond54 then
                                    self.frames = assets["ig$rhythm$joystick_neutral2"]
                                    break
                                end
                                ____cond54 = ____cond54 or ____switch54 == 2
                                if ____cond54 then
                                    self.frames = assets["ig$rhythm$joystick_neutral3"]
                                    break
                                end
                                ____cond54 = ____cond54 or ____switch54 == 3
                                if ____cond54 then
                                    self.frames = assets["ig$rhythm$joystick_neutral4"]
                                    break
                                end
                                ____cond54 = ____cond54 or ____switch54 == 4
                                if ____cond54 then
                                    self.frames = assets["ig$rhythm$joystick_neutral5"]
                                    break
                                end
                                ____cond54 = ____cond54 or ____switch54 == 5
                                if ____cond54 then
                                    self.frames = assets["ig$rhythm$joystick_neutral6"]
                                    break
                                end
                            until true
                        end
                        local c = ST:remap(self.metadata.c / 15, 255, 127)
                        self.color.red = c
                        self.color.green = c
                        self.color.blue = c
                        if not done and self.metadata.c < 15 then
                            local ____self_metadata_9, ____c_10 = self.metadata, "c"
                            ____self_metadata_9[____c_10] = ____self_metadata_9[____c_10] + 1
                        end
                    end)
                    local map = screen:scan(function(c) return __TS__InstanceOf(c, STMap) end):next().value
                    local rgb = ST:hex2rgb(value.color)
                    stargate = __TS__New(
                        STContainer,
                        {
                            scale = 0.9,
                            color = ST:hex2rgb(12566463),
                            metadata = nil,
                            children = {
                                __TS__New(STSprite, { image = assets["ig$rhythm$backdrop"], anchor = 0.5 }):addTicker(function(
                                    self)
                                    self.scale.x = 1 / stargate.scale.x
                                    self.scale.y = 1 / stargate.scale.y
                                end),
                                __TS__New(STSprite,
                                    { image = assets["ig$rhythm$circle"], anchor = 0.5, metadata = 15, priority = 2 })
                                    :addTicker(function(self)
                                        if not done and face_note ~= nil and face ~= face_note then
                                            self.metadata = 0
                                        end
                                        local c = ST:remap(self.metadata / 15, 255, 127)
                                        self.color.red = c
                                        self.color.green = c
                                        self.color.blue = c
                                        if not done and self.metadata < 15 then
                                            self.metadata = self.metadata + 1
                                        end
                                    end),
                                flare_down,
                                flare_down_left,
                                flare_down_right,
                                flare_left,
                                flare_right,
                                flare_up,
                                flare_up_left,
                                flare_up_right,
                                __TS__New(STContainer, { priority = 4 }):addDrawer(function(self)
                                    local color = { love.graphics.getColor() }
                                    local canvas2 = { love.graphics.getCanvas() }
                                    love.graphics.setColor(1, 1, 1, 1)
                                    love.graphics.setCanvas(canvas)
                                    love.graphics.clear(0, 0, 0, 0)
                                    love.graphics.push()
                                    love.graphics.replaceTransform(love.math.newTransform(
                                        ST.width / 2 + stargate.position.x,
                                        ST.height / 2 + stargate.position.y,
                                        0,
                                        stargate.scale.x,
                                        stargate.scale.y
                                    ))
                                    for ____, note in ipairs(notes) do
                                        if note[1] <= time + 50 and time < note[1] + note[2] then
                                            local offset = math.floor(math.max(0, note[1] - time) * 4 + 0.5)
                                            local length = math.floor(math.min(
                                                note[2],
                                                math.max(0, note[1] + note[2] - time)
                                            ) * 4 + 0.5)
                                            repeat
                                                local ____switch72 = note[3]
                                                local ____cond72 = ____switch72 == STFacing.DOWN
                                                if ____cond72 then
                                                    love.graphics.rectangle(
                                                        "line",
                                                        -1.5,
                                                        21.5 + offset,
                                                        3,
                                                        length
                                                    )
                                                    break
                                                end
                                                ____cond72 = ____cond72 or ____switch72 == STFacing.DOWN_LEFT
                                                if ____cond72 then
                                                    do
                                                        local x = math.floor(-15 - offset * 0.7071067811865476 + 0.5)
                                                        local y = math.floor(15 + offset * 0.7071067811865476 + 0.5)
                                                        local l = math.floor(length * 0.7071067811865476 + 0.5)
                                                        love.graphics.line(
                                                            x - 1.5,
                                                            y - 1.5,
                                                            x + 1.5,
                                                            y + 1.5,
                                                            x - l + 1.5,
                                                            y + l + 1.5,
                                                            x - l - 1.5,
                                                            y + l - 1.5,
                                                            x - 1.5,
                                                            y - 1.5
                                                        )
                                                        break
                                                    end
                                                end
                                                ____cond72 = ____cond72 or ____switch72 == STFacing.DOWN_RIGHT
                                                if ____cond72 then
                                                    do
                                                        local x = math.floor(15 + offset * 0.7071067811865476 + 0.5)
                                                        local y = math.floor(15 + offset * 0.7071067811865476 + 0.5)
                                                        local l = math.floor(length * 0.7071067811865476 + 0.5)
                                                        love.graphics.line(
                                                            x + 1.5,
                                                            y - 1.5,
                                                            x + l + 1.5,
                                                            y + l - 1.5,
                                                            x + l - 1.5,
                                                            y + l + 1.5,
                                                            x - 1.5,
                                                            y + 1.5,
                                                            x + 1.5,
                                                            y - 1.5
                                                        )
                                                        break
                                                    end
                                                end
                                                ____cond72 = ____cond72 or ____switch72 == STFacing.LEFT
                                                if ____cond72 then
                                                    love.graphics.rectangle(
                                                        "line",
                                                        -21.5 - offset - length,
                                                        -1.5,
                                                        length,
                                                        3
                                                    )
                                                    break
                                                end
                                                ____cond72 = ____cond72 or ____switch72 == STFacing.RIGHT
                                                if ____cond72 then
                                                    love.graphics.rectangle(
                                                        "line",
                                                        21.5 + offset,
                                                        -1.5,
                                                        length,
                                                        3
                                                    )
                                                    break
                                                end
                                                ____cond72 = ____cond72 or ____switch72 == STFacing.UP
                                                if ____cond72 then
                                                    love.graphics.rectangle(
                                                        "line",
                                                        -1.5,
                                                        -21.5 - offset - length,
                                                        3,
                                                        length
                                                    )
                                                    break
                                                end
                                                ____cond72 = ____cond72 or ____switch72 == STFacing.UP_LEFT
                                                if ____cond72 then
                                                    do
                                                        local x = math.floor(-15 - offset * 0.7071067811865476 + 0.5)
                                                        local y = math.floor(-15 - offset * 0.7071067811865476 + 0.5)
                                                        local l = math.floor(length * 0.7071067811865476 + 0.5)
                                                        love.graphics.line(
                                                            x - l + 1.5,
                                                            y - l - 1.5,
                                                            x + 1.5,
                                                            y - 1.5,
                                                            x - 1.5,
                                                            y + 1.5,
                                                            x - l - 1.5,
                                                            y - l + 1.5,
                                                            x - l + 1.5,
                                                            y - l - 1.5
                                                        )
                                                        break
                                                    end
                                                end
                                                ____cond72 = ____cond72 or ____switch72 == STFacing.UP_RIGHT
                                                if ____cond72 then
                                                    do
                                                        local x = math.floor(15 + offset * 0.7071067811865476 + 0.5)
                                                        local y = math.floor(-15 - offset * 0.7071067811865476 + 0.5)
                                                        local l = math.floor(length * 0.7071067811865476 + 0.5)
                                                        love.graphics.line(
                                                            x + l - 1.5,
                                                            y - l - 1.5,
                                                            x + l + 1.5,
                                                            y - l + 1.5,
                                                            x + 1.5,
                                                            y + 1.5,
                                                            x - 1.5,
                                                            y - 1.5,
                                                            x + l - 1.5,
                                                            y - l - 1.5
                                                        )
                                                        break
                                                    end
                                                end
                                            until true
                                        end
                                    end
                                    love.graphics.pop()
                                    return function()
                                        love.graphics.push()
                                        love.graphics.replaceTransform(love.math.newTransform(
                                            0,
                                            0,
                                            0,
                                            ST.scale,
                                            ST.scale
                                        ))
                                        love.graphics.setCanvas(canvas2)
                                        love.graphics.setColor(color)
                                        love.graphics.draw(canvas)
                                        love.graphics.pop()
                                    end
                                end),
                                joystick
                            }
                        }
                    ):addTicker(function(self)
                        if done then
                            if self.alpha.value > 0.01 then
                                self.alpha.value = self.alpha.value * 5 / 6
                                self.scale.x = (self.scale.x * 5 + 0.9) / 6
                                self.scale.y = (self.scale.y * 5 + 0.9) / 6
                                map.alpha.value = 1 - self.alpha.value / 4
                                map.scale.x = self.scale.x / 0.9
                                map.scale.y = self.scale.y / 0.9
                                local ev = { name = "gameplay_fade", value = 1 - self.alpha.value }
                                for ____, fn in ipairs(rhythm_hooks) do
                                    fn(ev)
                                end
                                map:tick_position()
                                gvalue.value = 1 - self.alpha.value
                            else
                                wrapper:detach(stargate)
                                map.alpha.value = 1
                                map.scale.x = 1
                                map.scale.y = 1
                                local ev = { name = "gameplay_fade", value = 1 }
                                for ____, fn in ipairs(rhythm_hooks) do
                                    fn(ev)
                                end
                                map:tick_position()
                                task1.complete()
                            end
                        end
                    end)
                    local task0 = ST:task()
                    task1 = ST:task()
                    wrapper = __TS__New(
                        STContainer,
                        {
                            alpha = 0,
                            metadata = { xord = {}, xpop = 0 },
                            children = {
                                stargate,
                                unpack(accessor.rhythm and ({}) or ({ __TS__New(STText, {
                                    font = assets["f$helloplayer"],
                                    color = 8355711,
                                    anchor = 0.5,
                                    position = { y = -70 },
                                    scale = 0.75,
                                    content = text.encounter1,
                                    justify = 0.5
                                }):addTicker(function(self)
                                    self.alpha.value = (3 <= hint_progress or hint_time < 90) and 0 or 1
                                    if not done and face == nil then
                                        hint_time = hint_time + 1
                                    end
                                end) }))
                            }
                        }
                    ):addTicker(function(self)
                        if self.alpha.value < 0.99 then
                            self.alpha.value = (self.alpha.value * 5 + 1) / 6
                            stargate.scale.x = (stargate.scale.x * 5 + 1) / 6
                            stargate.scale.y = (stargate.scale.y * 5 + 1) / 6
                            map.alpha.value = 1 - self.alpha.value / 3
                            map.scale.x = stargate.scale.x / 0.9
                            map.scale.y = stargate.scale.y / 0.9
                            local ev = { name = "gameplay_fade", value = 1 - self.alpha.value }
                            for ____, fn in ipairs(rhythm_hooks) do
                                fn(ev)
                            end
                            map:tick_position()
                            gvalue.value = 1 - self.alpha.value
                        elseif self.alpha.value ~= 1 then
                            self.alpha.value = 1
                            stargate.scale.x = 1
                            stargate.scale.y = 1
                            map.alpha.value = 2 / 3
                            map.scale.x = 1 / 0.9
                            map.scale.y = 1 / 0.9
                            local ev = { name = "gameplay_fade", value = 0 }
                            for ____, fn in ipairs(rhythm_hooks) do
                                fn(ev)
                            end
                            map:tick_position()
                            gvalue.value = 0
                        end
                        flare_down.metadata = false
                        flare_down_left.metadata = false
                        flare_down_right.metadata = false
                        flare_left.metadata = false
                        flare_right.metadata = false
                        flare_up.metadata = false
                        flare_up_left.metadata = false
                        flare_up_right.metadata = false
                        if done then
                            local ____inst_gain_13, ____value_14 = inst.gain, "value"
                            ____inst_gain_13[____value_14] = ____inst_gain_13[____value_14] / 4
                            return
                        end
                        local shx = 0
                        local shy = 0
                        local pface = face
                        if inputs.up.held then
                            if inputs.left.held then
                                face = STFacing.UP_LEFT
                                shx = -1
                                shy = -1
                            elseif inputs.right.held then
                                face = STFacing.UP_RIGHT
                                shx = 1
                                shy = -1
                            else
                                face = STFacing.UP
                                shy = -1
                            end
                        elseif inputs.down.held then
                            if inputs.left.held then
                                face = STFacing.DOWN_LEFT
                                shx = -1
                                shy = 1
                            elseif inputs.right.held then
                                face = STFacing.DOWN_RIGHT
                                shx = 1
                                shy = 1
                            else
                                face = STFacing.DOWN
                                shy = 1
                            end
                        elseif inputs.left.held then
                            face = STFacing.LEFT
                            shx = -1
                        elseif inputs.right.held then
                            face = STFacing.RIGHT
                            shx = 1
                        else
                            face = nil
                        end
                        if pface ~= face and face ~= nil then
                            if 120 <= hint_time then
                                hint_progress = 3
                            else
                                hint_progress = hint_progress + 1
                            end
                            hint_time = 0
                        end
                        face_note = nil
                        for ____, note in ipairs(notes) do
                            do
                                if note[1] <= time and time < note[1] + note[2] then
                                    face_note = note[3]
                                    if face ~= face_note then
                                        goto __continue110
                                    end
                                    repeat
                                        local ____switch113 = note[3]
                                        local ____cond113 = ____switch113 == STFacing.DOWN
                                        if ____cond113 then
                                            flare_down.metadata = true
                                            break
                                        end
                                        ____cond113 = ____cond113 or ____switch113 == STFacing.DOWN_LEFT
                                        if ____cond113 then
                                            flare_down_left.metadata = true
                                            break
                                        end
                                        ____cond113 = ____cond113 or ____switch113 == STFacing.DOWN_RIGHT
                                        if ____cond113 then
                                            flare_down_right.metadata = true
                                            break
                                        end
                                        ____cond113 = ____cond113 or ____switch113 == STFacing.LEFT
                                        if ____cond113 then
                                            flare_left.metadata = true
                                            break
                                        end
                                        ____cond113 = ____cond113 or ____switch113 == STFacing.RIGHT
                                        if ____cond113 then
                                            flare_right.metadata = true
                                            break
                                        end
                                        ____cond113 = ____cond113 or ____switch113 == STFacing.UP
                                        if ____cond113 then
                                            flare_up.metadata = true
                                            break
                                        end
                                        ____cond113 = ____cond113 or ____switch113 == STFacing.UP_LEFT
                                        if ____cond113 then
                                            flare_up_left.metadata = true
                                            break
                                        end
                                        ____cond113 = ____cond113 or ____switch113 == STFacing.UP_RIGHT
                                        if ____cond113 then
                                            flare_up_right.metadata = true
                                            break
                                        end
                                    until true
                                end
                            end
                            ::__continue110::
                        end
                        local x
                        local y
                        if face_note ~= nil then
                            if face == face_note then
                                local s = ST:wave(ST:remap(
                                    score / total,
                                    0,
                                    6,
                                    prog == 0 and 0 or actions[prog][1],
                                    actions[prog + 1][1]
                                ))
                                x = s * shx * -2
                                y = s * shy * -2
                                inst.gain.value = inst.daemon.gain
                                emotion.alpha.value = 0.3
                            else
                                x = math.random() * 2 - 1
                                y = math.random() * 2 - 1
                                local ____inst_gain_15, ____value_16 = inst.gain, "value"
                                ____inst_gain_15[____value_16] = ____inst_gain_15[____value_16] / 4
                                local ____emotion_alpha_17, ____value_18 = emotion.alpha, "value"
                                ____emotion_alpha_17[____value_18] = ____emotion_alpha_17[____value_18] - 0.05 / 15
                                if emotion.alpha.value < 0.25 then
                                    emotion.alpha.value = 0.25
                                end
                            end
                        else
                            x = 0
                            y = 0
                            local ____emotion_alpha_19, ____value_20 = emotion.alpha, "value"
                            ____emotion_alpha_19[____value_20] = ____emotion_alpha_19[____value_20] - 0.05 / 15
                            if emotion.alpha.value < 0.2 then
                                emotion.alpha.value = 0.2
                            end
                        end
                        if stargate.metadata == nil then
                            stargate.metadata = { x, y }
                        end
                        stargate.metadata[1] = (stargate.metadata[1] + x * 2) / 3
                        stargate.metadata[2] = (stargate.metadata[2] + y * 2) / 3
                        stargate.position.x = math.floor(stargate.metadata[1] + 0.5)
                        stargate.position.y = math.floor(stargate.metadata[2] + 0.5)
                    end):addDrawer(function(self)
                        local c = { love.graphics.getColor() }
                        love.graphics.setColor(
                            ST:remap(stargate.alpha.value, c[1], rgb.red / 255),
                            ST:remap(stargate.alpha.value, c[2], rgb.green / 255),
                            ST:remap(stargate.alpha.value, c[3], rgb.blue / 255),
                            c[4]
                        )
                        return function()
                            if not done then
                                time = time + value.rate
                                local ____temp_12 = face_note ~= nil and face == face_note
                                if ____temp_12 then
                                    local ____actions_index__1_11 = actions[prog + 1][1]
                                    score = score + 1
                                    ____temp_12 = ____actions_index__1_11 <= score / total
                                end
                                if ____temp_12 then
                                    xgen()
                                end
                                if finish <= time or prog == #actions then
                                    done = true
                                    if 3 <= hint_progress then
                                        accessor.rhythm = true
                                    else
                                        hint_progress = 3
                                    end
                                    joystick.direction = 0
                                    if prog == #actions then
                                        stargate:detach(joystick)
                                    end
                                end
                            end
                            if done and task0.active and wrapper.metadata.xpop == 0 then
                                task0.complete()
                            end
                            love.graphics.setColor(c)
                        end
                    end)
                    xgen = function(insta)
                        if insta == nil then
                            insta = false
                        end
                        if not insta then
                            local ____wrapper_metadata_21, ____xpop_22 = wrapper.metadata, "xpop"
                            ____wrapper_metadata_21[____xpop_22] = ____wrapper_metadata_21[____xpop_22] + 1
                            local ev = { name = "action_unlock" }
                            for ____, fn in ipairs(rhythm_hooks) do
                                fn(ev)
                            end
                        end
                        local ex = 0
                        local ty = 0
                        local ____prog_23 = prog
                        prog = ____prog_23 + 1
                        local action = actions[____prog_23 + 1]
                        local diag = joystick.frames == assets["ig$rhythm$joystick_diagonal6"]
                        while ex < #wrapper.metadata.xord and wrapper.metadata.xord[ex + 1] < action[2] do
                            ex = ex + 1
                        end
                        __TS__ArraySplice(wrapper.metadata.xord, ex, 0, action[2])
                        local xfade = __TS__New(STAnimation, {
                            direction = 1,
                            anchor = 0.5,
                            frames = joystick.frames,
                            step = joystick.step,
                            frame = joystick.frame,
                            rotation = joystick.rotation.value
                        })
                        local xtext = __TS__New(STText, {
                            position = { x = 0.5 },
                            metadata = 0,
                            alpha = 0,
                            font = assets["f$fives"],
                            anchor = 0.5
                        })
                        local xwrapper = __TS__New(
                            STContainer,
                            {
                                alpha = insta and 0 or 1,
                                metadata = { c = 0, w = 0 },
                                children = {
                                    __TS__New(STSprite,
                                        { anchor = { x = 1, y = 0.5 }, image = assets["ig$rhythm$expand_side"] }),
                                    __TS__New(STSprite, { anchor = 0.5, image = assets["ig$rhythm$expand_middle"] }),
                                    __TS__New(STSprite,
                                        { anchor = { x = 1, y = 0.5 }, image = assets["ig$rhythm$expand_side"], scale = -1 }),
                                    xtext
                                }
                            }
                        ):addTicker(function(self)
                            if self.alpha.value < 0.99 then
                                self.alpha.value = (self.alpha.value * 3 + 1) / 4
                            elseif self.alpha.value ~= 1 then
                                self.alpha.value = 1
                            end
                            local w = math.max(self.metadata.w - 10, 4)
                            self.children[1].position.x = w / -2
                            self.children[2].scale.x = w
                            self.children[3].position.x = w / 2
                            self.children[4].scale.x = self.metadata.w / xtext.metadata
                            if self.children[4].alpha.value < 1 then
                                local ____self_children__4_alpha_24, ____value_25 = self.children[4].alpha, "value"
                                local ____self_children__4_alpha_value_26 = ____self_children__4_alpha_24[____value_25] +
                                    0.1
                                ____self_children__4_alpha_24[____value_25] = ____self_children__4_alpha_value_26
                                if ____self_children__4_alpha_value_26 > 1 then
                                    self.children[4].alpha.value = 1
                                end
                            end
                            if atlas.target == "choicer_horiz" and atlas.navigators.choicer_horiz.position.x == __TS__ArrayIndexOf(wrapper.metadata.xord, action[2]) then
                                self.color.red = 162
                                self.color.green = 137
                                self.color.blue = 220
                            elseif atlas.target == nil or atlas.target == "choicer_horiz" then
                                local c = ST:remap(self.metadata.c, 127, 255)
                                self.color.red = c
                                self.color.green = c
                                self.color.blue = c
                            else
                                self.color.red = 63
                                self.color.green = 63
                                self.color.blue = 63
                            end
                        end)
                        if not insta then
                            local vy = -4
                            local py = joystick.position.y + stargate.position.y
                            while py < 70 do
                                vy = vy + 0.4
                                py = py + vy
                                ty = ty + (vy - math.max(py - 70, 0)) / vy
                            end
                            assets["s$ry_split"]:instance({ rate = 0.9 + math.random() * 0.2 })
                        end
                        local tf = insta and 0 or math.ceil(ty) - 1
                        local dx = ST:spread_quantize(120, action[2], #actions)
                        local ____wrapper_attach_44 = wrapper.attach
                        local ____STAnimation_43 = STAnimation
                        local ____temp_40 = insta and 0.7 or nil
                        local ____temp_41 = { time = 0, squish_time = 0 }
                        local ____temp_42 = insta and ({ x = dx, y = 70 }) or joystick.position:add(stargate.position)
                        local ____insta_38
                        if insta then
                            ____insta_38 = nil
                        else
                            ____insta_38 = { y = 0.4 }
                        end
                        local ____insta_39
                        if insta then
                            ____insta_39 = nil
                        else
                            ____insta_39 = { x = (dx - (joystick.position.x + stargate.position.x)) / ty, y = -4 }
                        end
                        ____wrapper_attach_44(
                            wrapper,
                            __TS__New(____STAnimation_43, {
                                alpha = ____temp_40,
                                anchor = 0.5,
                                metadata = ____temp_41,
                                position = ____temp_42,
                                gravity = ____insta_38,
                                priority = 2,
                                velocity = ____insta_39,
                                children = insta and ({ xwrapper }) or ({ xfade })
                            }):addTicker(function(self)
                                local mt = self.metadata.time
                                if mt < tf then
                                    local wave = ST:remap(mt / tf, 1.2, 1)
                                    self.scale.x = ST:remap(
                                        ST:wave(mt / tf),
                                        1 / wave,
                                        wave
                                    )
                                    self.scale.y = ST:remap(
                                        ST:wave(0.5 + mt / tf),
                                        1 / wave,
                                        wave
                                    )
                                    xfade.alpha.value = (1 - mt / tf) ^ 2
                                    self.alpha.value = ST:remap(mt / tf, 1, 0.7)
                                    repeat
                                        local ____switch142 = math.floor((1 - (1 - mt / tf) ^ 3) * 6)
                                        local ____cond142 = ____switch142 == 0
                                        if ____cond142 then
                                            self.frames = assets["ig$rhythm$joystick_neutral6"]
                                            xfade.frames = diag and assets["ig$rhythm$joystick_diagonal6"] or
                                                assets["ig$rhythm$joystick_cardinal6"]
                                            break
                                        end
                                        ____cond142 = ____cond142 or ____switch142 == 1
                                        if ____cond142 then
                                            self.frames = assets["ig$rhythm$joystick_neutral5"]
                                            xfade.frames = diag and assets["ig$rhythm$joystick_diagonal5"] or
                                                assets["ig$rhythm$joystick_cardinal5"]
                                            break
                                        end
                                        ____cond142 = ____cond142 or ____switch142 == 2
                                        if ____cond142 then
                                            self.frames = assets["ig$rhythm$joystick_neutral4"]
                                            xfade.frames = diag and assets["ig$rhythm$joystick_diagonal4"] or
                                                assets["ig$rhythm$joystick_cardinal4"]
                                            break
                                        end
                                        ____cond142 = ____cond142 or ____switch142 == 3
                                        if ____cond142 then
                                            self.frames = assets["ig$rhythm$joystick_neutral3"]
                                            xfade.frames = diag and assets["ig$rhythm$joystick_diagonal3"] or
                                                assets["ig$rhythm$joystick_cardinal3"]
                                            break
                                        end
                                        ____cond142 = ____cond142 or ____switch142 == 4
                                        if ____cond142 then
                                            self.frames = assets["ig$rhythm$joystick_neutral2"]
                                            xfade.frames = diag and assets["ig$rhythm$joystick_diagonal2"] or
                                                assets["ig$rhythm$joystick_cardinal2"]
                                            break
                                        end
                                        ____cond142 = ____cond142 or ____switch142 == 5
                                        if ____cond142 then
                                            self.frames = assets["ig$rhythm$joystick_neutral1"]
                                            xfade.frames = diag and assets["ig$rhythm$joystick_diagonal1"] or
                                                assets["ig$rhythm$joystick_cardinal1"]
                                            break
                                        end
                                    until true
                                elseif mt < tf + 7 then
                                    if self.gravity.y ~= 0 then
                                        self:attach(__TS__New(STAnimation, {
                                            anchor = 0.5,
                                            frames = assets["ig$rhythm$joystick_neutral1"],
                                            gravity = { y = 0.5 },
                                            velocity = { x = self.velocity.x * 0.75, y = self.velocity.y / -2 },
                                            priority = 5000000
                                        }):addTicker(function(self)
                                            local ____self_alpha_27, ____value_28 = self.alpha, "value"
                                            local ____self_alpha_value_29 = ____self_alpha_27[____value_28] - 0.1
                                            ____self_alpha_27[____value_28] = ____self_alpha_value_29
                                            if ____self_alpha_value_29 <= 0 then
                                                self.parent:detach(self)
                                            else
                                                local ____self_scale_30, ____x_31 = self.scale, "x"
                                                ____self_scale_30[____x_31] = ____self_scale_30[____x_31] * 1.08
                                                local ____self_scale_32, ____y_33 = self.scale, "y"
                                                ____self_scale_32[____y_33] = ____self_scale_32[____y_33] * 1.08
                                            end
                                        end))
                                        self.gravity.y = 0
                                        self.velocity.x = 0
                                        self.velocity.y = 0
                                        self.position.x = dx
                                        self.position.y = 70
                                        self.scale.x = 1
                                        self.scale.y = 1
                                        self.frames = nil
                                        self:detach(xfade)
                                        self:attach(xwrapper)
                                        local ____wrapper_metadata_34, ____xpop_35 = wrapper.metadata, "xpop"
                                        ____wrapper_metadata_34[____xpop_35] = ____wrapper_metadata_34[____xpop_35] - 1
                                        self.alpha.value = 0.7
                                        assets["s$ry_bounce"]:instance({ rate = 0.9 + math.random() * 0.2 })
                                    end
                                    if task0.active then
                                        return
                                    end
                                    if mt == tf then
                                        xtext.content = action[3]
                                        xtext.metadata = assets["f$fives"]:compute(action[3]).x + 10
                                    end
                                    xwrapper.metadata.c = (mt - tf) / 7
                                    xwrapper.metadata.w = ST:remap(
                                        ST:bezier((mt - tf) / 7, 0, 1.05, 1),
                                        14,
                                        xtext.metadata
                                    )
                                elseif mt == tf + 7 then
                                    xwrapper.metadata.c = 1
                                    xtext.metadata = xtext.metadata
                                else
                                    return
                                end
                                local ____self_metadata_36, ____time_37 = self.metadata, "time"
                                ____self_metadata_36[____time_37] = ____self_metadata_36[____time_37] + 1
                            end):addDrawer(function(self)
                                local v = math.min(self.metadata.time / tf, 1)
                                local color = { love.graphics.getColor() }
                                love.graphics.setColor(
                                    ST:remap(v, color[1], 1),
                                    ST:remap(v, color[2], 1),
                                    ST:remap(v, color[3], 1),
                                    color[4]
                                )
                            end):addDrawer(batch.drawer)
                        )
                    end
                    while actions[prog + 1][1] == 0 do
                        xgen(true)
                    end
                    rhythm_container:attach(wrapper)
                    screen:attach(rhythm_container, emotion)
                    __TS__Await(task0)
                    score = math.floor(score / total * 1000 + 0.5) / 1000
                    local choices = __TS__ArrayFilter(
                        actions,
                        function(____, action) return action[1] <= score end
                    )
                    table.sort(
                        choices,
                        function(a, b) return a[2] < b[2] end
                    )
                    game.h_len = #choices
                    local ____opt_result_47
                    if script ~= nil then
                        ____opt_result_47 = script()
                    end
                    __TS__Await(____opt_result_47)
                    local task2 = ST:task()
                    game.h_task = task2
                    atlas:switch("choicer_horiz")
                    local ____self_48 = __TS__PromiseAll({ task1, task2 })
                    ____self_48["then"](
                        ____self_48,
                        function()
                            rhythm_container:clear()
                            screen:detach(rhythm_container, emotion)
                            canvas:release()
                        end
                    )
                    __TS__Await(task2)
                    game.h_task = nil
                    game.h_len = 0
                    __TS__Await(value.actions[choices[atlas.navigators.choicer_horiz.position.x + 1][4] + 1][3](
                        function(progression)
                            for key in pairs(progression) do
                                state[key] = math.floor(((state[key] or 0) + progression[key]) * 1000 + 0.5) / 1000
                            end
                            local max = 0
                            local max_stage = nil
                            for key in pairs(state) do
                                do
                                    if state[key] < 1 then
                                        goto __continue159
                                    end
                                    local power = progression[key]
                                    if power > max then
                                        max = power
                                        max_stage = key
                                    end
                                end
                                ::__continue159::
                            end
                            if max_stage ~= nil then
                                stage = max_stage
                                for key in pairs(state) do
                                    __TS__Delete(state, key)
                                end
                                for ____, instance in __TS__Iterator(music:values()) do
                                    instance:stop()
                                end
                                music:clear()
                                local ev = { name = "stage_update", stage = stage }
                                for ____, fn in ipairs(rhythm_hooks) do
                                    fn(ev)
                                end
                            end
                        end,
                        state
                    ))
                end
                game.encounter = false
            end)
        end
    }
    rhythm_container = __TS__New(STContainer, { priority = 20 })
    rhythm_hooks = {}
    text = textGen()
    return { rhythm = rhythm, rhythm_container = rhythm_container, rhythm_hooks = rhythm_hooks, text = text }
end
____exports.default = rhythm
return ____exports
