local ____lualib = require("lualib_bundle")
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local ____global = require("code.global")
local cursors = ____global.cursors
local init = ____global.init
local ____editor = require("code.screens.editor")
local editorScreen = ____editor.default
local ____launcher = require("code.screens.launcher")
local launcherScreen = ____launcher.default
local ____overworld = require("code.screens.overworld")
local overworldScreen = ____overworld.default
local ____test = require("code.screens.test")
local testScreen = ____test.default
ST.fps = 30
ST.scale = 4
local function gameWindow()
    ST.width = 240
    ST.height = 180
    love.window.setMode(ST.width * ST.scale, ST.height * ST.scale, {centered = true, resizable = true, vsync = 0})
end
local function launcherWindow()
    ST.width = 180
    ST.height = 120
    love.window.setMode(ST.width * ST.scale, ST.height * ST.scale, {borderless = true, centered = true, vsync = 0})
end
love.window.setIcon(love.image.newImageData("images/icon.png"))
love.window.setTitle("Petrichor")
love.mouse.setCursor(cursors.arrow)
if __TS__ArrayIncludes(arg, "test") then
    gameWindow()
    testScreen()
elseif __TS__ArrayIncludes(arg, "editor") then
    gameWindow()
    editorScreen()
else
    local active = false
    local stage
    if __TS__ArrayIncludes(arg, "fast") then
        stage = 2
        gameWindow()
        init.load = true
    else
        stage = 0
        launcherWindow()
    end
    local ____ST_superscripts_0 = ST.superscripts
    ____ST_superscripts_0[#____ST_superscripts_0 + 1] = function()
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            if active then
                return ____awaiter_resolve(nil)
            end
            active = true
            repeat
                local ____switch11 = stage
                local ____cond11 = ____switch11 == 0
                if ____cond11 then
                    __TS__Await(launcherScreen())
                    love.window.close()
                    stage = 1
                    break
                end
                ____cond11 = ____cond11 or ____switch11 == 1
                if ____cond11 then
                    gameWindow()
                    love.graphics.clear()
                    love.graphics.present()
                    stage = 2
                    __TS__Await(ST:pause(23))
                end
                ____cond11 = ____cond11 or ____switch11 == 2
                if ____cond11 then
                    __TS__Await(overworldScreen())
                    break
                end
            until true
            active = false
        end)
    end
end
return ____exports
