--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
function ____exports.default(color)
    local canvas = love.graphics.newCanvas(ST.width * ST.scale, ST.height * ST.scale)
    local shader = love.graphics.newShader("\n      extern float hue;\n      extern float saturation;\n      extern float value;\n\n      const float e = 1.0e-10;\n\n      vec3 rgb2hsv(vec3 c) {\n         vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);\n         vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));\n         vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));\n         float d = q.x - min(q.w, q.y);\n         return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);\n      }\n\n      vec3 hsv2rgb(vec3 c) {\n         vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);\n         vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);\n         return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);\n      }\n\n      vec4 effect (vec4 color, Image image, vec2 uv, vec2 fc) {\n         vec4 tex = Texel(image, uv);\n         vec3 hsv = rgb2hsv(vec3(tex.r, tex.g, tex.b));\n         hsv.r += hue;\n         while (hsv.r < 0.0) {\n            hsv.r++;\n         }\n         while (hsv.r > 0.0) {\n            hsv.r--;\n         }\n         vec3 rgb = hsv2rgb(vec3(hsv.r, clamp(hsv.g * saturation, 0.0, 1.0), clamp(hsv.b * value, 0.0, 1.0)));\n         return vec4(rgb, tex.a);\n      }\n   ")
    return {
        color = color,
        drawer = function(self)
            local cv = {love.graphics.getCanvas()}
            local cl = {love.graphics.getColor()}
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
                love.graphics.setColor(cl)
                shader:send("hue", color.hue)
                shader:send("saturation", color.saturation)
                shader:send("value", color.value)
                love.graphics.setShader(shader)
                love.graphics.draw(canvas)
                love.graphics.setShader()
                love.graphics.pop()
            end
        end,
        release = function(self)
            canvas:release()
            shader:release()
        end
    }
end
return ____exports
