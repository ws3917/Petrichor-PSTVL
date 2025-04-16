local ____lualib = require("lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local ____global = require("code.global")
local accessor = ____global.accessor
local function textGen()
    return {
        item_bucket = {
            name = "Pail",
            info = function()
                return {
                    "<p:player>(A pail. Good for collecting things.)",
                    unpack(accessor.event_home_bucket and ({
"<p:player><f:sigh>(Apart from rainwater, apparently.)"
}) or ({}))
                }
            end
        },
        item_card = {
            name = "Library Card",
            info = {
"<p:player>(A library card with a blued, jeweled strip.)"
}
        },
        item_drill = {
            name = "Drill",
            info = function()
                return ({ {
"<p:player>(An electric drill, fully charged.)"
}, {
"<p:player>(An electric drill, half-charged.)"
}, {
"<p:player>(An electric drill. The batteries are dead.)"
} })
                    [math.max((accessor.item_crowbar and 1 or 0) + (accessor.state_redleaf_gate == 1 and 1 or 0), 0) + 1]
            end
        },
        item_goatplush = {
            name = "Plushie",
            info1a = {
"<p:player>(Never hurts to have one of these around.)"
},
            info1b = {
"Wear it",
"Do nothing"
},
            info1c = {
"<p:player><f:sigh>(Up you go.)"
},
            info2a = {
"<p:player><f:wink>(A worn plushie.)"
},
            info2b = {
"Take it off",
"Do nothing"
},
            info2c = {
"<p:player><f:sigh>(I'll take it off for now.)"
}
        },
        item_rope = {
            name = "Rope",
            info = function()
                return accessor.plot < 2 and ({
"<p:player>(A worn rope, nearly at its end.)"
}) or
                    (accessor.plot < 3 and ({ "<p:player><f:side>(If only this were longer...)", accessor.item_cover and "<p:player><f:sweat4>(... then I wouldn't have to make ropes out of blankets.)" or "<p:player>(... maybe there's something else I could make a rope out of.)" }) or ({
"<p:player>(A worn rope, nearly at its end.)",
"<p:player><f:determined>(Nothing like the one I made myself.)"
}))
            end
        },
        item_scissors = {
            name = "Scissors",
            info = {
"<p:player>An average pair of kitchen scissors."
}
        }
    }
end
local function inventory(game, ____bindingPattern0)
    local player
    player = ____bindingPattern0.player
    local text
    local inventory = {}
    local items = {
        {
            name = function(self)
                return text.item_goatplush.name
            end,
            priority = 0,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    if accessor.floof then
                        __TS__Await(reader:text(text.item_goatplush.info2a))
                        __TS__Await(reader:choice(text.item_goatplush.info2b))
                        if game.r_choice == 0 then
                            __TS__Await(reader:text(text.item_goatplush.info2c))
                            accessor.floof = false
                            player.metadata.floof = false
                        end
                    else
                        __TS__Await(reader:text(text.item_goatplush.info1a))
                        __TS__Await(reader:choice(text.item_goatplush.info1b))
                        if game.r_choice == 0 then
                            __TS__Await(reader:text(text.item_goatplush.info1c))
                            accessor.floof = true
                            player.metadata.floof = true
                        end
                    end
                end)
            end,
            show = function(self)
                return accessor.item_goatplush
            end
        },
        {
            name = function(self)
                return text.item_scissors.name
            end,
            priority = 1,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    __TS__Await(reader:text(text.item_scissors.info))
                end)
            end,
            show = function(self)
                return accessor.item_scissors
            end
        },
        {
            name = function(self)
                return text.item_drill.name
            end,
            priority = 2,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    local ____opt_0 = game.script
                    if __TS__Await(____opt_0 and ____opt_0("drillie")) == true then
                        return ____awaiter_resolve(nil)
                    end
                    __TS__Await(reader:text(text.item_drill.info()))
                end)
            end,
            show = function(self)
                return accessor.item_drill
            end
        },
        {
            name = function(self)
                return text.item_rope.name
            end,
            priority = 3,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    local ____opt_2 = game.script
                    if __TS__Await(____opt_2 and ____opt_2("roper")) == true then
                        return ____awaiter_resolve(nil)
                    end
                    reader:text(text.item_rope.info())
                end)
            end,
            show = function(self)
                return accessor.item_rope
            end
        },
        {
            name = function(self)
                return text.item_bucket.name
            end,
            priority = 4,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    local ____opt_4 = game.script
                    if __TS__Await(____opt_4 and ____opt_4("buckey")) == true then
                        return ____awaiter_resolve(nil)
                    end
                    reader:text(text.item_bucket.info())
                end)
            end,
            show = function(self)
                return accessor.item_bucket
            end
        },
        {
            name = function(self)
                return text.item_card.name
            end,
            priority = 1000,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    __TS__Await(reader:text(text.item_card.info))
                end)
            end,
            show = function(self)
                return accessor.event_home_bookshelf == 2
            end
        }
    }
    text = textGen()
    local function update()
        local id = 0
        while id ~= #items do
            if items[id + 1]:show() then
                if #inventory == 0 or not __TS__ArrayIncludes(inventory, id) then
                    inventory[#inventory + 1] = id
                end
            else
                local index = __TS__ArrayIndexOf(inventory, id)
                if #inventory ~= 0 and index ~= -1 then
                    __TS__ArraySplice(inventory, index, 1)
                end
            end
            id = id + 1
        end
        table.sort(
            inventory,
            function(a, b) return items[a + 1].priority < items[b + 1].priority end
        )
    end
    return { inventory = inventory, items = items, text = text, update = update }
end
____exports.default = inventory
return ____exports
