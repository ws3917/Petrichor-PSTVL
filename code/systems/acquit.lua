local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STContainer = ____storyteller.STContainer
local STHitbox = ____storyteller.STHitbox
local STRectangle = ____storyteller.STRectangle
local STText = ____storyteller.STText
local ____global = require("code.global")
local sourceClear = ____global.sourceClear
local sourceReset = ____global.sourceReset
local world = ____global.world
local ____launcher = require("code.screens.launcher")
local mouseButtonMenu = ____launcher.mouseButtonMenu
local function textGen()
    return {header = "(Are you sure?)\n{color=0xff3f3f}(Unsaved data in this\nworld will be lost.)", button1 = "STAY", button2 = "EXIT"}
end
local function acquit(assets, atlas, batch, ____debug, ____bindingPattern0)
    local screen
    screen = ____bindingPattern0.screen
    local text = textGen()
    local state = {acquitted = false, debug = false}
    return {
        text = text,
        state = state,
        handler = function(self, result)
            if result == "restart" or not love.window.hasFocus() or world:check() == 0 or state.acquitted then
                return false
            end
            local ____opt_0 = atlas.keybinds.cancel
            if ____opt_0 ~= nil then
                ____opt_0()
            end
            state.acquitted = true
            sourceClear()
            if ____debug.canActivate then
                state.debug = true
                ____debug.canActivate = false
            end
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
                        __TS__New(STRectangle, {anchor = 0.5, size = {x = 180, y = 90}, color = 0, priority = -2}),
                        __TS__New(STContainer, {priority = -1}):addDrawer(function(self)
                            love.graphics.setLineWidth(1 / 3)
                            love.graphics.rectangle(
                                "line",
                                180 / -2 + 1,
                                90 / -2 + 1,
                                180 - 2,
                                90 - 2
                            )
                        end)
                    }
                }
            ):addDrawer(batch.drawer)
            screen:attach(wrapper)
            local ____self_2 = mouseButtonMenu(
                wrapper,
                {main = ST:populate(
                    3,
                    function(i)
                        local content = ({text.header, text.button1, text.button2})[i + 1]
                        local metadata
                        metadata = {
                            disabled = i == 0,
                            action = function(____, controller)
                                repeat
                                    local ____switch12 = i
                                    local ____cond12 = ____switch12 == 1
                                    if ____cond12 then
                                        controller["goto"](controller, nil)
                                        metadata.disabled = true
                                        state.acquitted = false
                                        break
                                    end
                                    ____cond12 = ____cond12 or ____switch12 == 2
                                    if ____cond12 then
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
                                    x = (i == 0 and 0 or ST:spread(45, i - 1, 2)) - position,
                                    y = (i == 0 and -8 or 24) - position
                                },
                                size = i == 0 and 0 or assets["f$fives"]:compute(content),
                                children = {__TS__New(STText, {
                                    anchor = 0.5,
                                    justify = i == 0 and 0.5 or nil,
                                    font = i == 0 and assets["f$helloplayer"] or assets["f$fives"],
                                    position = position,
                                    content = content
                                })}
                            }
                        )
                    end
                )},
                "main"
            )
            ____self_2["then"](
                ____self_2,
                function()
                    screen:detach(wrapper)
                    if state.debug then
                        ____debug.canActivate = true
                    end
                    sourceReset()
                end
            )
            return true
        end
    }
end
____exports.default = acquit
return ____exports
