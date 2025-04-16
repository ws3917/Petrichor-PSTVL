--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local function frameblur(count, decay_base, decay_multiplier, enabled)
    local canvas = love.graphics.newCanvas(ST.width * ST.scale, ST.height * ST.scale)
    local extras = ST:populate(
        count,
        function() return love.graphics.newCanvas(ST.width * ST.scale, ST.height * ST.scale) end
    )
    return {
        drawer = function(self)
            if not enabled() then
                return
            end
            local color = {love.graphics.getColor()}
            local canvas2 = {love.graphics.getCanvas()}
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
                love.graphics.setCanvas(canvas2)
                love.graphics.setColor(color)
                love.graphics.draw(canvas)
                local decay = decay_base
                local blend = {love.graphics.getBlendMode()}
                love.graphics.setBlendMode("alpha", "alphamultiply")
                for ____, extra in ipairs(extras) do
                    love.graphics.setColor(1, 1, 1, decay)
                    love.graphics.draw(extra)
                    decay = decay * decay_multiplier
                end
                love.graphics.setBlendMode(blend[1], blend[2])
                love.graphics.setColor(color)
                local i = #extras
                while true do
                    local ____i_0 = i
                    i = ____i_0 - 1
                    if not (____i_0 ~= 0) then
                        break
                    end
                    love.graphics.setCanvas(extras[i + 1])
                    if i == 0 then
                        love.graphics.setColor(0, 0, 0, 1)
                        love.graphics.rectangle(
                            "fill",
                            0,
                            0,
                            ST.width * ST.scale,
                            ST.height * ST.scale
                        )
                        love.graphics.setColor(color)
                        love.graphics.draw(canvas)
                    else
                        love.graphics.draw(extras[i])
                    end
                end
                love.graphics.pop()
                love.graphics.setCanvas(canvas2)
            end
        end,
        release = function(self)
            canvas:release()
            for ____, extra in ipairs(extras) do
                extra:release()
            end
        end
    }
end
____exports.default = frameblur
return ____exports
