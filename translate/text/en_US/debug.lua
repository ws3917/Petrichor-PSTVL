local ____lualib = require("lualib_bundle")
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__ArrayUnshift = ____lualib.__TS__ArrayUnshift
local __TS__New = ____lualib.__TS__New
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__StringSlice = ____lualib.__TS__StringSlice
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsInteger = ____lualib.__TS__NumberIsInteger
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STPoint = ____storyteller.STPoint
local STRectangle = ____storyteller.STRectangle
local STText = ____storyteller.STText
local ____global = require("code.global")
local accessor = ____global.accessor
local world = ____global.world
local utf8 = require("utf8")
local function textGen()
    local sk = { {} }
    local keys = __TS__ObjectKeys(world.schema)
    table.sort(keys)
    for ____, key in ipairs(keys) do
        local ar = sk[#sk]
        if #ar == 13 then
            sk[#sk + 1] = { key }
        else
            ar[#ar + 1] = key
        end
    end
    local help = { {} }
    for ____, line in ipairs({
"ed - toggle engine debug display",
"fc - toggle map freecam",
"fps - get fps",
"fps <value> - set fps",
"help [page] - this command",
"r - return to last save",
"reset [level] - reset save file",
"rm - get map room index",
"rm <value> - set map room index",
"sk [page] - get save file keys",
"spd - get game speed",
"spd <value> - set game speed",
"sv <key> - get save file value",
"sv <key> <value> - set save file value",
"tp <x> <y> - teleport player"
}) do
        local ar = help[#help]
        if #ar == 13 then
            help[#help + 1] = { line }
        else
            ar[#ar + 1] = line
        end
    end
    return {
        ed_on = "Engine debug display enabled",
        ed_off = "Engine debug display disabled",
        fc_prq = "{color=0xff3f3f}There is no map to toggle the freecam of!",
        fc_on = "Map freecam enabled",
        fc_off = "Map freecam disabled",
        fps_err = "{color=0xff3f3f}<x> is not an integer between 1 and 60!",
        fps_get = "FPS is <x>",
        fps_set = "FPS set to <x>",
        help_err = ("{color=0xff3f3f}<x> is not an integer between 1 and " .. tostring(#help)) .. "!",
        help_header = ("Help (Page <x> of " .. tostring(#help)) .. ")",
        help_pages = __TS__ArrayMap(
            help,
            function(____, lines)
                return table.concat(
                    __TS__ArrayMap(
                        lines,
                        function(____, line)
                            return "{color=0x7f7fff}" .. __TS__StringReplace(
                                __TS__StringReplaceAll(
                                    __TS__StringReplaceAll(
                                        __TS__StringReplaceAll(
                                            __TS__StringReplaceAll(line, "<", "{color=0xffff7f}<"),
                                            ">",
                                            ">{color=0xffffff}"
                                        ),
                                        "[",
                                        "{color=0xff7fff}["
                                    ),
                                    "]",
                                    "]{color=0xffffff}"
                                ),
                                " - ",
                                "{color=0xffffff} - "
                            )
                        end
                    ),
                    "\n"
                )
            end
        ),
        hint = "(Press ESC to open console.)",
        reset_err = "{color=0xff3f3f}<x> is not an integer between 0 and 2!",
        rm_err = "{color=0xff3f3f}<x> is not an integer between 0 and <y>!",
        rm_get = "Room index is {color=0x7f7fff}<x>{color=0xffffff}",
        rm_set = "Room index set to {color=0x7f7fff}<x>{color=0xffffff}",
        rm_prq = "{color=0xff3f3f}There is no map to set the room index of!",
        sk_err = ("{color=0xff3f3f}<x> is not an integer between 1 and " .. tostring(#sk)) .. "!",
        sk_header = ("Save File Keys (Page <x> of " .. tostring(#sk)) .. ")",
        sk_pages = __TS__ArrayMap(
            sk,
            function(____, keys)
                return table.concat(
                    __TS__ArrayMap(
                        keys,
                        function(____, key)
                            return __TS__StringAccess(key, 0) == "$" and "{color=0xff7fff}" .. key or
                                (__TS__StringAccess(key, 0) == "_" and "{color=0xffff7f}" .. key or "{color=0x7f7fff}" .. key)
                        end
                    ),
                    "\n"
                )
            end
        ),
        spd_err = "{color=0xff3f3f}<x> is not a number above 0 and at or below 2!",
        spd_get = "Speed is <x>",
        spd_set = "Speed set to <x>",
        sv_arg = "{color=0xff3f3f}At least 1 argument is required!",
        sv_err1 =
        "{color=0xff3f3f}<x> is not a save file key!\nUse {color=0x7f7fff}sk{color=0xffffff} for a list of save file keys.",
        sv_err2 =
        "{color=0xff3f3f}<x> is not a save file value!\nUse outputs of {color=0x7f7fff}sv {color=0xffff7f}<key>{color=0xffffff} as examples.",
        sv_get = "Value of {color=0x7f7fff}<x>{color=0xffffff} is {color=0x7f7fff}<y>{color=0xffffff}",
        sv_set = "Value of {color=0x7f7fff}<x>{color=0xffffff} set to {color=0x7f7fff}<y>{color=0xffffff}",
        tp = "Teleported to {color=0x7f7fff}<x>{color=0xffffff}x {color=0x7f7fff}<y>{color=0xffffff}y",
        tp_arg = "{color=0xff3f3f}At least 2 arguments are required!",
        tp_err1 = "{color=0xff3f3f}<x> is not a number!",
        tp_prq = "{color=0xff3f3f}There is no player to teleport!",
        unknown =
        "{color=0xff3f3f}<x> is not a command!\n{color=0xffffff}Use {color=0x7f7fff}help{color=0xffffff} for a list of commands."
    }
end
local function dybug(assets, canActivate)
    if canActivate == nil then
        canActivate = accessor["$option_debug"]
    end
    local text = textGen()
    local dybug
    dybug = {
        active = false,
        history = { "" },
        history_index = 0,
        input = function(self)
            return dybug.history[dybug.history_index + 1]
        end,
        input_update = function(self, v)
            if dybug.history_index ~= 0 then
                dybug.history_index = 0
                if dybug.history[1] ~= "" then
                    __TS__ArrayUnshift(dybug.history, v)
                    if #dybug.history == 1000 then
                        table.remove(dybug.history)
                    end
                    return
                end
            end
            dybug.history[1] = v
        end,
        canActivate = canActivate,
        cam_free = __TS__New(STPoint),
        cam_standby = nil,
        destroy = function(self)
            love.keypressed = nil
            love.wheelmoved = nil
            love.textinput = nil
        end,
        display = __TS__New(STText,
                { font = assets["f$helloplayer"], offset = { x = -235, y = -175 }, priority = 1000000000, scale = 0.5 })
            :addTicker(function(self)
                if not dybug.canActivate then
                    self.alpha.value = 0
                    self.content = ""
                elseif not dybug.active then
                    self.alpha.value = 0.5
                    self.content = text.hint
                else
                    self.alpha.value = 1
                    self.content = ""
                end
                local ____opt_0 = dybug.map
                if (____opt_0 and ____opt_0.camera) ~= dybug.cam_free then
                    return
                end
                local width, height = love.window.getMode()
                local x = love.mouse.getX() * (ST.width / width)
                local y = love.mouse.getY() * (ST.height / height)
                if love.mouse.isDown(1) then
                    dybug.cam_free.x = dybug.mouse.value_camera.x - (x - dybug.mouse.click.x) / dybug.map.scale.x
                    dybug.cam_free.y = dybug.mouse.value_camera.y - (y - dybug.mouse.click.y) / dybug.map.scale.y
                else
                    dybug.mouse.value_camera.x = dybug.cam_free.x
                    dybug.mouse.value_camera.y = dybug.cam_free.y
                    dybug.mouse.click.x = x
                    dybug.mouse.click.y = y
                end
            end),
        log = {},
        map = nil,
        mouse = { click = { x = 0, y = 0 }, value_camera = { x = 0, y = 0 } },
        player = nil,
        print = function(self, ...)
            local lines = { ... }
            for ____, line in ipairs(lines) do
                __TS__ArrayPushArray(
                    dybug.log,
                    __TS__StringSplit(line, "\n")
                )
            end
            if #dybug.log <= 14 then
                return
            end
            __TS__ArraySplice(dybug.log, 0, #dybug.log - 14)
        end,
        start = function(self)
            if not dybug.canActivate then
                return
            end
            dybug.active = true
            dybug.display:attach(
                __TS__New(STRectangle, {
                    scale = 2,
                    position = { y = 45 * 2 },
                    anchor = { x = 0.5, y = 1 },
                    size = { x = 240, y = 105 },
                    alpha = 0.5,
                    color = 0
                }),
                __TS__New(STRectangle, {
                    scale = 2,
                    position = { y = 60 * 2 },
                    anchor = { x = 0.5, y = 1 },
                    size = { x = 240, y = 15 },
                    alpha = 0.5
                }),
                __TS__New(STText, { font = assets["f$helloplayer"], position = { x = -120 * 2 + 5, y = -60 * 2 + 5 } })
                :addTicker(function(self)
                    self.content = table.concat(dybug.log, "\n{reset}")
                end),
                __TS__New(STText,
                    { font = assets["f$helloplayer"], position = { x = -120 * 2 + 5, y = 60 * 2 - 5 }, anchor = { y = 1 }, plain = true })
                :addTicker(function(self)
                    self.content = dybug:input() .. "_"
                end)
            )
            __TS__ArrayUnshift(dybug.history, "")
            if #dybug.history == 1000 then
                table.remove(dybug.history)
            end
            dybug.history_index = 0
        end,
        stop = function(self)
            dybug.active = false
            dybug.display:clear()
        end
    }
    love.keypressed = function(key)
        if not dybug.canActivate then
            return
        end
        repeat
            local ____switch41 = key
            local ____cond41 = ____switch41 == "escape"
            if ____cond41 then
                if dybug.active then
                    dybug:stop()
                else
                    dybug:start()
                end
                break
            end
            ____cond41 = ____cond41 or ____switch41 == "backspace"
            if ____cond41 then
                do
                    if not dybug.active then
                        break
                    end
                    if love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl") then
                        dybug:input_update("")
                    else
                        local input = dybug:input()
                        local length = utf8.len(input)
                        if length == 0 then
                            return
                        end
                        dybug:input_update(__TS__StringSlice(
                            input,
                            0,
                            utf8.offset(input, length) - 1
                        ))
                    end
                    break
                end
            end
            ____cond41 = ____cond41 or ____switch41 == "up"
            if ____cond41 then
                dybug.history_index = math.min(dybug.history_index + 1, #dybug.history - 1)
                break
            end
            ____cond41 = ____cond41 or ____switch41 == "down"
            if ____cond41 then
                dybug.history_index = math.max(dybug.history_index - 1, 0)
                break
            end
            ____cond41 = ____cond41 or ____switch41 == "return"
            if ____cond41 then
                do
                    if not dybug.active then
                        break
                    end
                    local input = dybug:input()
                    dybug:input_update(input)
                    local ____TS__StringSplit_result_2 = __TS__StringSplit(input, " ")
                    local name = ____TS__StringSplit_result_2[1]
                    local args = __TS__ArraySlice(____TS__StringSplit_result_2, 1)
                    __TS__ArrayUnshift(dybug.history, "")
                    if #dybug.history == 1000 then
                        table.remove(dybug.history)
                    end
                    dybug.history_index = 0
                    repeat
                        local ____switch52 = name
                        local level
                        local ____cond52 = ____switch52 == "ed"
                        if ____cond52 then
                            if ST.debug then
                                ST.debug = false
                                dybug:print(text.ed_off)
                            else
                                ST.debug = true
                                dybug:print(text.ed_on)
                            end
                            break
                        end
                        ____cond52 = ____cond52 or ____switch52 == "fc"
                        if ____cond52 then
                            if dybug.map == nil then
                                dybug:print(text.fc_prq)
                            elseif dybug.cam_standby == nil then
                                dybug.cam_standby = dybug.map.camera
                                dybug.cam_free:set(dybug.cam_standby)
                                dybug.map.camera = dybug.cam_free
                                dybug.map:cam_free()
                                dybug.map.autorestore = false
                                dybug:print(text.fc_on)
                            else
                                dybug.map.autorestore = true
                                local rm = dybug.map.rooms[dybug.map.room + 1]
                                dybug.map:cam_restore(rm.camera_min, rm.camera_max)
                                dybug.map.camera = dybug.cam_standby
                                dybug.cam_free:set(0)
                                dybug.cam_standby = nil
                                dybug.map.scale:set(1)
                                dybug:print(text.fc_off)
                            end
                            break
                        end
                        ____cond52 = ____cond52 or ____switch52 == "fps"
                        if ____cond52 then
                            if #args == 0 then
                                dybug:print(__TS__StringReplace(
                                    text.fps_get,
                                    "<x>",
                                    tostring(ST.fps)
                                ))
                            else
                                local num = __TS__Number(args[1])
                                if __TS__NumberIsInteger(num) and 1 <= num and num <= 60 and not __TS__StringIncludes(args[1], ".") then
                                    ST.fps = num
                                    dybug:print(__TS__StringReplace(
                                        text.fps_set,
                                        "<x>",
                                        tostring(num)
                                    ))
                                else
                                    dybug:print(__TS__StringReplace(text.fps_err, "<x>", args[1]))
                                end
                            end
                            break
                        end
                        ____cond52 = ____cond52 or ____switch52 == "help"
                        if ____cond52 then
                            do
                                local page
                                if #args == 0 then
                                    page = 0
                                else
                                    local num = __TS__Number(args[1])
                                    if __TS__NumberIsInteger(num) and 1 <= num and num <= #text.help_pages and not __TS__StringIncludes(args[1], ".") then
                                        page = num - 1
                                    else
                                        dybug:print(__TS__StringReplace(
                                            text.help_err,
                                            "<x>",
                                            tostring(num)
                                        ))
                                        break
                                    end
                                end
                                dybug:print(
                                    __TS__StringReplace(
                                        text.help_header,
                                        "<x>",
                                        tostring(page + 1)
                                    ),
                                    unpack(page < #text.help_pages and ({ text.help_pages[page + 1] }) or ({}))
                                )
                                break
                            end
                        end
                        ____cond52 = ____cond52 or ____switch52 == "r"
                        if ____cond52 then
                            if dybug.map == nil then
                                love.event.quit("restart")
                            else
                                world:dump()
                                local ____opt_3 = dybug.map.task
                                if ____opt_3 ~= nil then
                                    ____opt_3.complete(nil)
                                end
                            end
                            break
                        end
                        ____cond52 = ____cond52 or ____switch52 == "reset"
                        if ____cond52 then
                            if #args == 0 then
                                level = 0
                            else
                                local num = __TS__Number(args[1])
                                if __TS__NumberIsInteger(num) and 0 <= num and num <= 2 and not __TS__StringIncludes(args[1], ".") then
                                    level = num
                                else
                                    dybug:print(__TS__StringReplace(
                                        text.reset_err,
                                        "<x>",
                                        tostring(num)
                                    ))
                                    break
                                end
                            end
                            world:reset(level)
                            love.event.quit("restart")
                            break
                        end
                        ____cond52 = ____cond52 or ____switch52 == "rm"
                        if ____cond52 then
                            if dybug.map == nil then
                                dybug:print(text.rm_prq)
                            elseif #args == 0 then
                                dybug:print(__TS__StringReplace(
                                    text.rm_get,
                                    "<x>",
                                    tostring(dybug.map.room)
                                ))
                            else
                                local num = __TS__Number(args[1])
                                if __TS__NumberIsInteger(num) and 0 <= num and num < #dybug.map.rooms and not __TS__StringIncludes(args[1], ".") then
                                    local ____opt_5 = dybug.map.task
                                    if ____opt_5 ~= nil then
                                        ____opt_5.complete(num)
                                    end
                                    dybug:print(__TS__StringReplace(
                                        text.rm_set,
                                        "<x>",
                                        tostring(num)
                                    ))
                                else
                                    dybug:print(__TS__StringReplace(
                                        __TS__StringReplace(text.rm_err, "<x>", args[1]),
                                        "<y>",
                                        tostring(#dybug.map.rooms - 1)
                                    ))
                                end
                            end
                            break
                        end
                        ____cond52 = ____cond52 or ____switch52 == "spd"
                        if ____cond52 then
                            if #args == 0 then
                                dybug:print(__TS__StringReplace(
                                    text.spd_get,
                                    "<x>",
                                    tostring(ST.speed)
                                ))
                            else
                                local num = __TS__Number(args[1])
                                if not __TS__NumberIsNaN(num) and 0 < num and num <= 2 then
                                    ST.speed = num
                                    dybug:print(__TS__StringReplace(
                                        text.spd_set,
                                        "<x>",
                                        tostring(num)
                                    ))
                                else
                                    dybug:print(__TS__StringReplace(text.spd_err, "<x>", args[1]))
                                end
                            end
                            break
                        end
                        ____cond52 = ____cond52 or ____switch52 == "sk"
                        if ____cond52 then
                            do
                                local page
                                if #args == 0 then
                                    page = 0
                                else
                                    local num = __TS__Number(args[1])
                                    if __TS__NumberIsInteger(num) and 1 <= num and num <= #text.sk_pages and not __TS__StringIncludes(args[1], ".") and not __TS__StringIncludes(args[1], "e") then
                                        page = num - 1
                                    else
                                        dybug:print(__TS__StringReplace(
                                            text.sk_err,
                                            "<x>",
                                            tostring(num)
                                        ))
                                        break
                                    end
                                end
                                dybug:print(
                                    __TS__StringReplace(
                                        text.sk_header,
                                        "<x>",
                                        tostring(page + 1)
                                    ),
                                    unpack(page < #text.sk_pages and ({ text.sk_pages[page + 1] }) or ({}))
                                )
                                break
                            end
                        end
                        ____cond52 = ____cond52 or ____switch52 == "sv"
                        if ____cond52 then
                            if #args == 0 then
                                dybug:print(text.sv_arg)
                            elseif not (accessor[args[1]] ~= nil) then
                                dybug:print(__TS__StringReplace(text.sv_err1, "<x>", args[1]))
                            elseif #args == 1 then
                                local value = accessor[args[1]]
                                dybug:print(__TS__StringReplace(
                                    __TS__StringReplace(text.sv_get, "<x>", args[1]),
                                    "<y>",
                                    value == true and "true" or
                                    (value == false and "false" or (type(value) == "string" and ("\"" .. value) .. "\"" or tostring(value)))
                                ))
                            else
                                local value = table.concat(
                                    __TS__ArraySlice(args, 1),
                                    " "
                                )
                                if value == "true" then
                                    accessor[args[1]] = true
                                    dybug:print(__TS__StringReplace(
                                        __TS__StringReplace(text.sv_set, "<x>", args[1]),
                                        "<y>",
                                        "true"
                                    ))
                                elseif value == "false" then
                                    accessor[args[1]] = false
                                    dybug:print(__TS__StringReplace(
                                        __TS__StringReplace(text.sv_set, "<x>", args[1]),
                                        "<y>",
                                        "false"
                                    ))
                                elseif __TS__StringStartsWith(value, "\"") then
                                    if __TS__StringEndsWith(value, "\"") then
                                        accessor[args[1]] = string.sub(value, 2, -2)
                                        dybug:print(__TS__StringReplace(
                                            __TS__StringReplace(text.sv_set, "<x>", args[1]),
                                            "<y>",
                                            value
                                        ))
                                    else
                                        dybug:print(__TS__StringReplace(text.sv_err2, "<x>", value))
                                    end
                                else
                                    local num = __TS__Number(value)
                                    if not __TS__NumberIsNaN(num) then
                                        accessor[args[1]] = num
                                        dybug:print(__TS__StringReplace(
                                            __TS__StringReplace(text.sv_set, "<x>", args[1]),
                                            "<y>",
                                            tostring(num)
                                        ))
                                    else
                                        dybug:print(__TS__StringReplace(text.sv_err2, "<x>", value))
                                        break
                                    end
                                end
                            end
                            break
                        end
                        ____cond52 = ____cond52 or ____switch52 == "tp"
                        if ____cond52 then
                            if dybug.player == nil then
                                dybug:print(text.tp_prq)
                            elseif #args < 2 then
                                dybug:print(text.tp_arg)
                            else
                                local t1 = __TS__StringAccess(args[1], 0) == "~"
                                local num1 = __TS__Number(t1 and string.sub(args[1], 2) or args[1])
                                if not __TS__NumberIsNaN(num1) then
                                    local t2 = __TS__StringAccess(args[2], 0) == "~"
                                    local num2 = __TS__Number(t2 and string.sub(args[2], 2) or args[2])
                                    if not __TS__NumberIsNaN(num2) then
                                        local x = (t1 and dybug.player.position.x or 0) + num1
                                        local y = (t2 and dybug.player.position.y or 0) + num2
                                        dybug.player.position.x = x
                                        dybug.player.position.y = y
                                        dybug:print(__TS__StringReplace(
                                            __TS__StringReplace(
                                                text.tp,
                                                "<x>",
                                                tostring(x)
                                            ),
                                            "<y>",
                                            tostring(y)
                                        ))
                                    else
                                        dybug:print(__TS__StringReplace(text.tp_err1, "<x>", args[2]))
                                    end
                                else
                                    dybug:print(__TS__StringReplace(text.tp_err1, "<x>", args[1]))
                                end
                            end
                            break
                        end
                        do
                            dybug:print(__TS__StringReplace(text.unknown, "<x>", name))
                            break
                        end
                    until true
                    break
                end
            end
        until true
    end
    love.wheelmoved = function(x, y)
        local ____temp_9 = not dybug.canActivate
        if not ____temp_9 then
            local ____opt_7 = dybug.map
            ____temp_9 = (____opt_7 and ____opt_7.camera) ~= dybug.cam_free
        end
        if ____temp_9 then
            return
        end
        dybug.map.scale:set(y < 0 and dybug.map.scale.x / 2 ^ (1 / 4) or dybug.map.scale.x * 2 ^ (1 / 4))
    end
    love.textinput = function(text)
        if not dybug.canActivate or not dybug.active then
            return
        end
        dybug:input_update(dybug:input() .. text)
    end
    return dybug
end
____exports.default = dybug
return ____exports
