local ____lualib = require("lualib_bundle")
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__New = ____lualib.__TS__New
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Spread = ____lualib.__TS__Spread
local __TS__ArrayEntries = ____lualib.__TS__ArrayEntries
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STAnimation = ____storyteller.STAnimation
local STHitbox = ____storyteller.STHitbox
local STScreen = ____storyteller.STScreen
local STSplitterResult = ____storyteller.STSplitterResult
local STText = ____storyteller.STText
local ____global = require("code.global")
local accessor = ____global.accessor
local cursors = ____global.cursors
local input_defaults = ____global.input_defaults
local ____assets = require("code.systems.assets")
local assetsSystem = ____assets.default
local ____mixer = require("code.systems.mixer")
local mixerSystem = ____mixer.default
local function textGen()
    return {
        main1 = "PLAY",
        main2 = "CALIBRATION",
        main3 = "EXIT",
        c_back = "BACK",
        c_header1 = "Music Volume",
        c_header2 = "Sound Volume",
        c_header3 = "Keybinds",
        c_option1 = "DECREASE",
        c_option2 = "INCREASE",
        k_header1 = "Select an Input",
        k_header2 = "Type to Bind",
        k_header3 = "Press ESC to Reset",
        k_key1 = "[Z]",
        k_key2 = "[X]",
        k_key3 = "[C]",
        k_key4 = "[V]",
        k_key5 = "[↑]",
        k_key6 = "[↓]",
        k_key7 = "[←]",
        k_key8 = "[→]",
        k_names = {
            _ = "_",
            ["-"] = "-",
            [","] = ",",
            [";"] = ";",
            [":"] = ":",
            ["!"] = "!",
            ["?"] = "?",
            ["."] = ".",
            ["'"] = "'",
            ["\""] = "\"",
            ["("] = "(",
            [")"] = ")",
            ["["] = "[",
            ["]"] = "]",
            ["@"] = "@",
            ["*"] = "*",
            ["/"] = "/",
            ["\\"] = "\\",
            ["&"] = "&",
            ["#"] = "#",
            ["`"] = "`",
            ["^"] = "^",
            ["+"] = "+",
            ["<"] = "<",
            ["="] = "=",
            [">"] = ">",
            ["$"] = "Dollar",
            ["0"] = "0",
            ["1"] = "1",
            ["2"] = "2",
            ["3"] = "3",
            ["4"] = "4",
            ["5"] = "5",
            ["6"] = "6",
            ["7"] = "7",
            ["8"] = "8",
            ["9"] = "9",
            a = "A",
            appback = "AppBack",
            appbookmarks = "AppBookmarks",
            appforward = "AppForward",
            apphome = "AppHome",
            application = "Application",
            apprefresh = "AppRefresh",
            appsearch = "AppSearch",
            b = "B",
            backspace = "Backspace",
            c = "C",
            calculator = "Calculator",
            capslock = "CapsLock",
            clear = "Clear",
            computer = "Computer",
            currencyunit = "Currency",
            d = "D",
            delete = "Delete",
            down = "Down",
            e = "E",
            ["end"] = "End",
            escape = "Escape",
            f = "F",
            f1 = "F1",
            f2 = "F2",
            f3 = "F3",
            f4 = "F4",
            f5 = "F5",
            f6 = "F6",
            f7 = "F7",
            f8 = "F8",
            f9 = "F9",
            f10 = "F10",
            f11 = "F11",
            f12 = "F12",
            f13 = "F13",
            f14 = "F14",
            f15 = "F15",
            f16 = "F16",
            f17 = "F17",
            f18 = "F18",
            g = "G",
            h = "H",
            help = "Help",
            home = "Home",
            i = "I",
            insert = "Insert",
            j = "J",
            k = "K",
            ["kp-"] = "Num-",
            ["kp,"] = "Num,",
            ["kp."] = "Num.",
            ["kp*"] = "Num*",
            ["kp/"] = "Num/",
            ["kp+"] = "Num+",
            ["kp="] = "Num=",
            kp0 = "Num0",
            kp1 = "Num1",
            kp2 = "Num2",
            kp3 = "Num3",
            kp4 = "Num4",
            kp5 = "Num5",
            kp6 = "Num6",
            kp7 = "Num7",
            kp8 = "Num8",
            kp9 = "Num9",
            kpenter = "NumEnter",
            l = "L",
            lalt = "LAlt",
            lctrl = "LCtrl",
            left = "Left",
            lgui = "LSuper",
            lshift = "LShift",
            m = "M",
            mail = "Mail",
            menu = "Menu",
            mode = "Mode",
            n = "N",
            numlock = "NumLock",
            o = "O",
            p = "P",
            pagedown = "PageDown",
            pageup = "PageUp",
            pause = "Pause",
            power = "Power",
            printscreen = "PrintScreen",
            q = "Q",
            r = "R",
            ralt = "RAlt",
            rctrl = "RCtrl",
            ["return"] = "Enter",
            rgui = "RSuper",
            right = "Right",
            rshift = "RShift",
            s = "S",
            scrolllock = "ScrollLock",
            space = "Space",
            sysreq = "SysReq",
            t = "T",
            tab = "Tab",
            u = "U",
            undo = "Undo",
            up = "Up",
            v = "V",
            w = "W",
            www = "WWW",
            x = "X",
            y = "Y",
            z = "Z"
        }
    }
end
function ____exports.keybindsButtons(assets, endpoint, text)
    if text == nil then
        text = textGen()
    end
    local keys = {
        "primary",
        "secondary",
        "tertiary",
        "fullscreen",
        "up",
        "down",
        "left",
        "right"
    }
    local state = { i = nil }
    return ST:populate(
        11,
        function(i)
            if i == 10 then
                return __TS__New(
                    STHitbox,
                    {
                        metadata = {
                            disabled = true,
                            action = function()
                            end
                        },
                        children = { __TS__New(STText, {
                            anchor = 0.5,
                            font = assets["f$helloplayer"],
                            position = { y = 6 },
                            spacing = { y = -1 },
                            justify = 0.5
                        }):addTicker(function(self)
                            if state.i == nil then
                                self.content = ""
                                return
                            end
                            local ik = keys[state.i]
                            local value = accessor["$option_input_" .. ik]
                            local def = __TS__StringAccess(value, 0) ~= " "
                            self.content = assets["f$helloplayer"]:wrap(
                                table.concat(
                                    __TS__ArrayMap(
                                        __TS__StringSplit(
                                            def and value or string.sub(value, 2),
                                            " "
                                        ),
                                        function(____, name, index)
                                            return ((def or index % 2 == 0) and "{color=}" or "{color=0x3f3f7f}") ..
                                                text.k_names[name]
                                        end
                                    ),
                                    " "
                                ),
                                function() return 170 end,
                                function(char) return char == " " and STSplitterResult.EXCLUDE or STSplitterResult.NONE end
                            )
                            if def then
                                self.color.red = 63
                                self.color.green = 63
                                self.color.blue = 63
                            else
                                self.color.red = 162
                                self.color.green = 137
                                self.color.blue = 220
                            end
                        end) }
                    }
                ):addDrawer(function()
                    love.graphics.setColor(1, 1, 1, 1)
                end)
            end
            local content = ({
                "",
                text.k_key1,
                text.k_key2,
                text.k_key3,
                text.k_key4,
                text.k_key5,
                text.k_key6,
                text.k_key7,
                text.k_key8,
                text.c_back
            })[i + 1]
            local metadata
            metadata = {
                disabled = i == 0,
                action = function(____, controller)
                    repeat
                        local ____switch16 = i
                        local ____cond16 = ____switch16 == 1 or ____switch16 == 2 or ____switch16 == 3 or
                            ____switch16 == 4 or ____switch16 == 5 or ____switch16 == 6 or ____switch16 == 7 or
                            ____switch16 == 8
                        if ____cond16 then
                            if state.i == nil then
                                love.keypressed = function(key)
                                    local ik = keys[state.i]
                                    if key == "escape" then
                                        accessor["$option_input_" .. ik] = input_defaults[ik]
                                    elseif text.k_names[key] ~= nil then
                                        if __TS__StringAccess(accessor["$option_input_" .. ik], 0) ~= " " then
                                            accessor["$option_input_" .. ik] = " " .. key
                                        elseif not __TS__StringIncludes(accessor["$option_input_" .. ik], " " .. key) then
                                            local ____accessor_1 = accessor
                                            local ____temp_2 = "$option_input_" .. ik
                                            local ____array_0 = __TS__SparseArrayNew(unpack(__TS__ArraySlice(
                                                __TS__StringSplit(
                                                    string.sub(accessor["$option_input_" .. ik], 2),
                                                    " "
                                                ),
                                                0,
                                                7
                                            )))
                                            __TS__SparseArrayPush(____array_0, key)
                                            ____accessor_1[____temp_2] = " " .. table.concat(
                                                { __TS__SparseArraySpread(____array_0) },
                                                " "
                                            )
                                        end
                                    end
                                end
                            end
                            state.i = i
                            metadata.disabled = true
                            break
                        end
                        ____cond16 = ____cond16 or ____switch16 == 9
                        if ____cond16 then
                            state.i = nil
                            love.keypressed = nil
                            controller["goto"](controller, endpoint)
                            if endpoint == nil then
                                metadata.disabled = true
                            end
                            break
                        end
                    until true
                end
            }
            local position = i == 0 and 0.25 or 0.5
            return __TS__New(
                STHitbox,
                {
                    anchor = 0.5,
                    metadata = metadata,
                    position = {
                        x = ((i == 0 or i == 9) and 0 or ST:spread(70, i - 1, 8)) - position,
                        y = (i == 0 and -37.5 or (i == 9 and 37.5 or -25.5)) - position
                    },
                    size = i == 0 and 0 or assets["f$fives"]:compute(content),
                    children = { __TS__New(STText,
                        {
                            anchor = 0.5,
                            font = i == 0 and assets["f$helloplayer"] or assets["f$fives"],
                            position =
                                position,
                            content = content
                        }):addTicker(function(self)
                        if i == 0 then
                            if state.i == nil then
                                self.content = text.k_header1
                            else
                                local ik = keys[state.i]
                                if __TS__StringAccess(accessor["$option_input_" .. ik], 0) == " " then
                                    self.content = text.k_header3
                                else
                                    self.content = text.k_header2
                                end
                            end
                        elseif i ~= 9 then
                            if state.i == i then
                                metadata.disabled = true
                                self.color.red = 80
                                self.color.green = 68
                                self.color.blue = 110
                            else
                                metadata.disabled = false
                                self.color.red = 255
                                self.color.green = 255
                                self.color.blue = 255
                            end
                        end
                    end) }
                }
            )
        end
    )
end

function ____exports.mouseButtonMenu(container, buttons, start, callback)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local active = nil
        local width = ST.width
        local height = ST.height
        local task = ST:task()
        local cursor = __TS__New(STHitbox)
        local controller
        controller = {
            key = start,
            ["goto"] = function(self, target)
                if target == nil then
                    task.complete()
                    return
                end
                active = nil
                container:detach(__TS__Spread(buttons[controller.key]))
                controller.key = target
                container:attach(__TS__Spread(buttons[target]))
            end
        }
        local function buttonTest()
            for ____, ____value in __TS__Iterator(__TS__ArrayEntries(buttons[controller.key])) do
                local index = ____value[1]
                local button = ____value[2]
                if not button.metadata.disabled and button:test(cursor) then
                    return { index, button }
                end
            end
            return nil
        end
        local function cursorIcon()
            local result = buttonTest()
            if result == nil then
                love.mouse.setCursor(cursors.arrow_active)
            else
                love.mouse.setCursor(cursors.hand)
            end
        end
        local function cursorPosition(x, y)
            if x == nil then
                x = love.mouse.getX()
            end
            if y == nil then
                y = love.mouse.getY()
            end
            local win_width, win_height = love.window.getMode()
            local scale = width / height < win_width / win_height and win_height / height or win_width / width
            cursor.position:set((x - win_width / 2) / scale, (y - win_height / 2) / scale)
            cursor:calculate()
        end
        cursorPosition()
        for key in pairs(buttons) do
            for ____, ____value in __TS__Iterator(__TS__ArrayEntries(buttons[key])) do
                local index = ____value[1]
                local button = ____value[2]
                button:calculate()
                button:addTicker(function(self)
                    if button.metadata.disabled then
                        button.color.red = 127
                        button.color.green = 127
                        button.color.blue = 127
                    elseif index == active then
                        button.color.red = 80
                        button.color.green = 68
                        button.color.blue = 110
                    elseif self:test(cursor) then
                        button.color.red = 162
                        button.color.green = 137
                        button.color.blue = 220
                    else
                        button.color.red = 255
                        button.color.green = 255
                        button.color.blue = 255
                    end
                end)
            end
        end
        love.focus = function(focus)
            if focus or active == nil then
                return
            end
            active = nil
            love.mouse.setCursor(cursors.arrow_active)
            cursorPosition(math.huge, math.huge)
        end
        love.mousemoved = function(x, y)
            cursorPosition(x, y)
            cursorIcon()
        end
        love.mousepressed = function(x, y, button)
            if button ~= 1 then
                return
            end
            cursorPosition(x, y)
            local result = buttonTest()
            if result == nil then
                return
            end
            active = result[1]
        end
        love.mousereleased = function(x, y, button)
            if button ~= 1 or active == nil then
                return
            end
            cursorPosition(x, y)
            local result = buttonTest()
            if result ~= nil and result[1] == active then
                result[2].metadata:action(controller)
            end
            active = nil
            if task.active then
                cursorIcon()
            end
        end
        container:attach(__TS__Spread(buttons[controller.key]))
        love.mouse.setCursor(cursors.arrow_active)
        if callback ~= nil then
            callback(function() return task.complete() end)
        end
        __TS__Await(task)
        love.mouse.setCursor(cursors.arrow)
        container:detach(__TS__Spread(buttons[controller.key]))
        love.focus = nil
        love.mousemoved = nil
        love.mousepressed = nil
        love.mousereleased = nil
    end)
end

function ____exports.default()
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local text = textGen()
        local mixer = mixerSystem(true)
        local assets = assetsSystem({}, mixer)
        local buttons = {
            main = ST:populate(
                4,
                function(i)
                    if i == 3 then
                        return __TS__New(
                            STHitbox,
                            {
                                metadata = {
                                    disabled = true,
                                    action = function()
                                    end
                                },
                                children = { __TS__New(STAnimation, { frames = assets["im$logo"], anchor = 0.5, scale = 2, direction = 1 }) }
                            }
                        ):addDrawer(function()
                            love.graphics.setColor(1, 1, 1, 1)
                        end)
                    end
                    local content = ({ text.main1, text.main2, text.main3 })[i + 1]
                    local metadata
                    metadata = {
                        disabled = false,
                        action = function(____, controller)
                            repeat
                                local ____switch70 = i
                                local ____cond70 = ____switch70 == 0
                                if ____cond70 then
                                    controller["goto"](controller, nil)
                                    metadata.disabled = true
                                    break
                                end
                                ____cond70 = ____cond70 or ____switch70 == 1
                                if ____cond70 then
                                    controller["goto"](controller, "calibration")
                                    break
                                end
                                ____cond70 = ____cond70 or ____switch70 == 2
                                if ____cond70 then
                                    love.event.quit()
                                    break
                                end
                            until true
                        end
                    }
                    local position = 0.5
                    return __TS__New(
                        STHitbox,
                        {
                            anchor = 0.5,
                            metadata = metadata,
                            position = {
                                x = ST:spread(60, i, 3) - position,
                                y = 37.5 - position
                            },
                            size = assets["f$fives"]:compute(content),
                            children = { __TS__New(STText, { anchor = 0.5, font = assets["f$fives"], position = position, content = content }) }
                        }
                    )
                end
            ),
            calibration = ST:populate(
                10,
                function(i)
                    if i > 7 then
                        return __TS__New(
                            STHitbox,
                            {
                                position = { y = i == 8 and -27 or 3 },
                                metadata = {
                                    disabled = true,
                                    action = function()
                                    end
                                },
                                children = { __TS__New(STAnimation,
                                    { scale = { x = 1.5 }, frames = assets["im$volume"], anchor = 0.5 }):addTicker(i == 8 and
                                    (function(self)
                                        self.frame = accessor["$option_music"]
                                    end) or (function(self)
                                        self.frame = accessor["$option_sound"]
                                    end)) }
                            }
                        ):addDrawer(function()
                            love.graphics.setColor(1, 1, 1, 1)
                        end)
                    end
                    local content = ({
                        text.c_header1,
                        text.c_option1,
                        text.c_option2,
                        text.c_header2,
                        text.c_option1,
                        text.c_option2,
                        text.c_header3,
                        text.c_back
                    })[i + 1]
                    local metadata
                    metadata = {
                        disabled = i < 6 and i % 3 == 0,
                        action = function(____, controller)
                            repeat
                                local ____switch78 = i
                                local ____cond78 = ____switch78 == 1
                                if ____cond78 then
                                    local ____accessor_5, _____24option_music_6 = accessor, "$option_music"
                                    local ____accessor__24option_music_7 = ____accessor_5[_____24option_music_6] - 1
                                    ____accessor_5[_____24option_music_6] = ____accessor__24option_music_7
                                    metadata.disabled = ____accessor__24option_music_7 == 0
                                    mixer.updateMusic(true)
                                    if mixer.music.value ~= 0 then
                                        assets["s$menu_select$music"]:instance()
                                    end
                                    break
                                end
                                ____cond78 = ____cond78 or ____switch78 == 2
                                if ____cond78 then
                                    local ____accessor_8, _____24option_music_9 = accessor, "$option_music"
                                    local ____accessor__24option_music_10 = ____accessor_8[_____24option_music_9] + 1
                                    ____accessor_8[_____24option_music_9] = ____accessor__24option_music_10
                                    metadata.disabled = ____accessor__24option_music_10 == 16
                                    mixer.updateMusic(true)
                                    assets["s$menu_select$music"]:instance()
                                    break
                                end
                                ____cond78 = ____cond78 or ____switch78 == 4
                                if ____cond78 then
                                    local ____accessor_11, _____24option_sound_12 = accessor, "$option_sound"
                                    local ____accessor__24option_sound_13 = ____accessor_11[_____24option_sound_12] - 1
                                    ____accessor_11[_____24option_sound_12] = ____accessor__24option_sound_13
                                    metadata.disabled = ____accessor__24option_sound_13 == 0
                                    mixer.updateSound(true)
                                    if mixer.sound.value ~= 0 then
                                        assets["s$menu_select"]:instance()
                                    end
                                    break
                                end
                                ____cond78 = ____cond78 or ____switch78 == 5
                                if ____cond78 then
                                    local ____accessor_14, _____24option_sound_15 = accessor, "$option_sound"
                                    local ____accessor__24option_sound_16 = ____accessor_14[_____24option_sound_15] + 1
                                    ____accessor_14[_____24option_sound_15] = ____accessor__24option_sound_16
                                    metadata.disabled = ____accessor__24option_sound_16 == 16
                                    mixer.updateSound(true)
                                    assets["s$menu_select"]:instance()
                                    break
                                end
                                ____cond78 = ____cond78 or ____switch78 == 6
                                if ____cond78 then
                                    controller["goto"](controller, "keybinds")
                                    break
                                end
                                ____cond78 = ____cond78 or ____switch78 == 7
                                if ____cond78 then
                                    controller["goto"](controller, "main")
                                    break
                                end
                            until true
                        end
                    }
                    local position = i < 6 and i % 3 == 0 and 0.25 or 0.5
                    return __TS__New(
                        STHitbox,
                        {
                            anchor = 0.5,
                            metadata = metadata,
                            position = {
                                x = (i < 6 and i % 3 ~= 0 and ST:spread(45, i % 3 - 1, 2) or 0) - position,
                                y = ({
                                    -37.5,
                                    -25.5,
                                    -25.5,
                                    -7.5,
                                    4.5,
                                    4.5,
                                    22.5,
                                    37.5
                                })[i + 1] - position
                            },
                            size = i < 6 and i % 3 == 0 and 0 or assets["f$fives"]:compute(content),
                            children = { __TS__New(STText, { anchor = 0.5, font = i < 6 and i % 3 == 0 and assets["f$helloplayer"] or assets["f$fives"], position = position, content = content }) }
                        }
                    ):addTicker(function(self)
                        repeat
                            local ____switch82 = i
                            local ____cond82 = ____switch82 == 1
                            if ____cond82 then
                                self.metadata.disabled = accessor["$option_music"] == 0
                                break
                            end
                            ____cond82 = ____cond82 or ____switch82 == 2
                            if ____cond82 then
                                self.metadata.disabled = accessor["$option_music"] == 16
                                break
                            end
                            ____cond82 = ____cond82 or ____switch82 == 4
                            if ____cond82 then
                                self.metadata.disabled = accessor["$option_sound"] == 0
                                break
                            end
                            ____cond82 = ____cond82 or ____switch82 == 5
                            if ____cond82 then
                                self.metadata.disabled = accessor["$option_sound"] == 16
                                break
                            end
                        until true
                    end)
                end
            ),
            keybinds = ____exports.keybindsButtons(assets, "calibration", text)
        }
        return ____awaiter_resolve(
            nil,
            ST:view(
                __TS__New(STScreen):addDrawer(function(self)
                    love.graphics.setLineWidth(1 / 3)
                    love.graphics.rectangle(
                        "line",
                        ST.width / -2 + 1,
                        ST.height / -2 + 1,
                        ST.width - 2,
                        ST.height - 2
                    )
                end),
                {},
                function(screen)
                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                        local music = assets["m$mainmenu"]:instance_forced()
                        __TS__Await(____exports.mouseButtonMenu(screen, buttons, "main"))
                        music:stop()
                        return ____awaiter_resolve(
                            nil,
                            function()
                            end
                        )
                    end)
                end
            )
        )
    end)
end

return ____exports
