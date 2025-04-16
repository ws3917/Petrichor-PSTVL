local ____lualib = require("lualib_bundle")
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Generator = ____lualib.__TS__Generator
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local STScreen = ____storyteller.STScreen
local function screen()
    local objects, screen
    local function object(tag)
        return objects(tag):next().value
    end
    objects = __TS__Generator(function(tag)
        local generator = screen:scan(function(container)
            if type(container.metadata) ~= "table" then
                return false
            end
            local tags = container.metadata.tags
            if type(tags) ~= "table" then
                return false
            end
            return __TS__ArrayIncludes(tags, tag)
        end)
        while true do
            local next = generator:next()
            if next.done then
                break
            else
                local container = next.value
                coroutine.yield({
                    self = container,
                    destroy = function(self)
                        local ____opt_0 = container.parent
                        if ____opt_0 ~= nil then
                            ____opt_0:detach(container)
                        end
                    end
                })
            end
        end
    end)
    screen = __TS__New(STScreen)
    return {object = object, objects = objects, screen = screen}
end
____exports.default = screen
return ____exports
