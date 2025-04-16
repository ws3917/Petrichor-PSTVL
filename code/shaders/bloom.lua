--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
function ____exports.default(options)
    local canvas = love.graphics.newCanvas(ST.width * ST.scale, ST.height * ST.scale)
    local shader = love.graphics.newShader("\n      extern vec2 size;\n      extern int xsamples;\n      extern int ysamples;\n      extern float threshold;\n      extern float intensity;\n      extern float limit;\n      extern float bleed;\n      extern float absorb;\n\n      int xdiff = (xsamples - 1) / 2;\n      int ydiff = (ysamples - 1) / 2;\n      float mdiff = max(xdiff, ydiff);\n      float square = xsamples * ysamples;\n\n      vec4 effect (vec4 color, Image tex, vec2 tc, vec2 sc) {\n         vec4 src = Texel(tex, tc);\n         float src_max = max(max(src.r, src.g), src.b);\n         float src_min = min(min(src.r, src.g), src.b);\n         float src_avg = ((src_min + src_max) / 2.0) * (1.0 - bleed);\n         float src_glw = 1.0 - pow(1.0 - src_avg, 4.0) * absorb;\n         vec4 sum = vec4(0.0);\n         for (int x = -xdiff; x <= xdiff; x++) {\n            for (int y = -ydiff; y <= ydiff; y++) {\n               if (abs(x) + abs(y) <= mdiff) {\n                  vec4 add = Texel(tex, tc + vec2(x, y) * size);\n                  float add_max = max(max(add.r, add.g), add.b);\n                  float add_min = min(min(add.r, add.g), add.b);\n                  float add_avg = (add_min + add_max) / 2.0;\n                  if (threshold <= add_avg && add_avg <= limit && add_avg > src_avg) {\n                     sum += add * (add_avg - src_avg) * src_glw;\n                  }\n               }\n            }\n         }\n         vec4 res = (src + (sum / square) * intensity) * color;\n         return vec4(max(res.r, src.r), max(res.g, src.g), max(res.b, src.b), max(res.a, src.a));\n      }\n   ")
    return {
        drawer = function(self)
            if not options.enabled() then
                return
            end
            local cv = {love.graphics.getCanvas()}
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
                shader:send("size", {2 / (ST.width * ST.scale), 2 / (ST.height * ST.scale)})
                shader:send("xsamples", options.xsamples)
                shader:send("ysamples", options.ysamples)
                shader:send("threshold", options.threshold)
                shader:send("intensity", options.intensity)
                shader:send("limit", options.limit)
                shader:send("bleed", options.bleed)
                shader:send("absorb", options.absorb)
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
