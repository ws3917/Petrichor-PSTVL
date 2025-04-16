local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STScreen = ____storyteller.STScreen
function ____exports.default()
    return ST:view(
        __TS__New(STScreen),
        {},
        function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                __TS__Await(ST:pause(0))
                return ____awaiter_resolve(
                    nil,
                    function()
                    end
                )
            end)
        end
    )
end
return ____exports
