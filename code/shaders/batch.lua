--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local function batch()
    local canvas = love.graphics.newCanvas(ST.width * ST.scale, ST.height * ST.scale)
    return {
        drawer = function(self)
            local cv = {love.graphics.getCanvas()}
            local color = {love.graphics.getColor()}
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.setCanvas(canvas)
            love.graphics.clear(0, 0, 0, 0)
            return function()
                love.graphics.push()
                love.graphics.replaceTransform(love.math.newTransform(
                    0,
                    0,
                    0,
                    1,
                    1
                ))
                love.graphics.setCanvas(cv)
                love.graphics.setColor(color)
                love.graphics.draw(canvas)
                love.graphics.pop()
            end
        end,
        release = function(self)
            canvas:release()
        end
    }
end
____exports.default = batch
return ____exports
