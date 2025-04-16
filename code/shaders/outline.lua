--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
function ____exports.default(options)
    local canvas1 = love.graphics.newCanvas(ST.width * ST.scale, ST.height * ST.scale)
    local canvas2 = love.graphics.newCanvas(ST.width * ST.scale, ST.height * ST.scale)
    local shader = love.graphics.newShader("\n      extern vec2 pixelsize;\n      extern float thickness;\n      vec4 effect(vec4 color, Image texture, vec2 uv, vec2 fc) {\n         float a = 0.0;\n         if (Texel(texture, uv + vec2(0 * pixelsize.x, 0 * pixelsize.y)).a == 0.0) {\n            float x = -thickness;\n            while (x <= thickness) {\n               float y = -thickness;\n               while (y <= thickness) {\n                  a = max(a, Texel(texture, uv + vec2(x * pixelsize.x, y * pixelsize.y)).a);\n                  y++;\n               }\n               x++;\n            }\n         }\n         return vec4(color.rgb, color.a * a);\n      }\n   ")
    return {
        drawer = function(self)
            local color = {love.graphics.getColor()}
            love.graphics.setColor(1, 1, 1, 1)
            local cv = {love.graphics.getCanvas()}
            love.graphics.setCanvas(canvas1)
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
                love.graphics.clear(0, 0, 0, 0)
                love.graphics.setColor(options.color.red / 255, options.color.green / 255, options.color.blue / 255, options.alpha)
                shader:send("pixelsize", {2 / (ST.width * ST.scale), 2 / (ST.height * ST.scale)})
                shader:send("thickness", options.thickness)
                love.graphics.setShader(shader)
                love.graphics.draw(canvas1)
                love.graphics.setShader()
                love.graphics.setColor(color)
                love.graphics.draw(canvas1)
                love.graphics.setCanvas(cv)
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.draw(canvas2)
                love.graphics.pop()
            end
        end,
        release = function(self)
            canvas1:release()
            canvas2:release()
            shader:release()
        end
    }
end
return ____exports
