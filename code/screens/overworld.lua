local ____lualib = require("lualib_bundle")
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__Spread = ____lualib.__TS__Spread
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STHitbox = ____storyteller.STHitbox
local ____global = require("code.global")
local accessor = ____global.accessor
local sourceClear = ____global.sourceClear
local sourceReset = ____global.sourceReset
local world = ____global.world
local ____home = require("code.maps.home")
local homeArea = ____home.default
local ____redleaf = require("code.maps.redleaf")
local redleafArea = ____redleaf.default
function ____exports.default()
    local area = nil
    repeat
        local ____switch3 = world:get("location_map")
        local ____cond3 = ____switch3 == "home"
        if ____cond3 then
            area = homeArea()
            break
        end
        ____cond3 = ____cond3 or ____switch3 == "redleaf"
        if ____cond3 then
            area = redleafArea()
            break
        end
    until true
    if area == nil then
        return
    end
    local ____area_0 = area
    local cleanup = ____area_0.cleanup
    local map = ____area_0.map
    local acquit = ____area_0.overworld.acquit
    local atlas = ____area_0.overworld.atlas
    local reader = ____area_0.overworld.reader
    local batch = ____area_0.overworld.batch
    local ____debug = ____area_0.overworld.debug
    local screen = ____area_0.overworld.screen
    local inputs = ____area_0.overworld.inputs
    local inventory = ____area_0.overworld.inventory
    local game = ____area_0.overworld.game
    local player = ____area_0.overworld.player
    return ST:view(
        screen.screen,
        inputs,
        function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                sourceReset()
                inventory.update()
                ST.acquit = acquit.handler
                ____debug.map = map
                ____debug.player = player.player
                screen.screen:attach(____debug.display)
                local ____ST_scripts_1 = ST.scripts
                ____ST_scripts_1[#____ST_scripts_1 + 1] = function()
                    if game.cutscene == 0 then
                        player.player_tooltip.metadata.interact = false
                        local dx = (game.c_left and -1 or (game.c_right and 1 or 0)) * (game.c_secondary and 3 or 2)
                        local dy = (game.c_up and -1 or (game.c_down and 1 or 0)) * (game.c_secondary and 3 or 2)
                        local hitboxes = {__TS__Spread(screen.screen:scan(function(container) return __TS__InstanceOf(container, STHitbox) and type(container.metadata) == "table" and container.metadata.scan == true end))}
                        if dx ~= 0 or dy ~= 0 then
                            player.player_move(
                                dx,
                                dy,
                                game.c_left and game.c_right,
                                game.c_up and game.c_down,
                                __TS__ArrayFilter(
                                    hitboxes,
                                    function(____, hitbox)
                                        if hitbox.metadata.obstacle == true and hitbox.metadata.walkable ~= true then
                                            hitbox:calculate()
                                            return true
                                        end
                                        return false
                                    end
                                ),
                                __TS__ArrayFilter(
                                    hitboxes,
                                    function(____, hitbox)
                                        if hitbox.metadata.obstacle == true and hitbox.metadata.walkable == true then
                                            hitbox:calculate()
                                            return true
                                        end
                                        return false
                                    end
                                ),
                                __TS__ArrayFilter(
                                    hitboxes,
                                    function(____, hitbox)
                                        if hitbox.metadata.obstacle ~= true and hitbox.metadata.walkable == true and hitbox.metadata.interactable ~= true then
                                            hitbox:calculate()
                                            return true
                                        end
                                        return false
                                    end
                                )
                            )
                        else
                            player.player_move(0, 0)
                        end
                        if game.interact then
                            player.player_tooltip.metadata.interact = true
                            player.player_interact(
                                false,
                                __TS__ArrayFilter(
                                    hitboxes,
                                    function(____, hitbox)
                                        if hitbox.metadata.interactable == true and (hitbox.metadata.walkable ~= true or hitbox.metadata.obstacle == true) then
                                            hitbox:calculate()
                                            return true
                                        end
                                        return false
                                    end
                                )
                            )
                            player.player_walkeract(
                                false,
                                __TS__ArrayFilter(
                                    hitboxes,
                                    function(____, hitbox)
                                        if hitbox.metadata.walkable == true and hitbox.metadata.interactable == true and hitbox.metadata.obstacle ~= true then
                                            hitbox:calculate()
                                            return true
                                        end
                                        return false
                                    end
                                )
                            )
                        else
                            player.player.metadata.test = false
                            player.player_interact(
                                true,
                                __TS__ArrayFilter(
                                    hitboxes,
                                    function(____, hitbox)
                                        if hitbox.metadata.interactable == true and (hitbox.metadata.walkable ~= true or hitbox.metadata.obstacle == true) then
                                            hitbox:calculate()
                                            return true
                                        end
                                        return false
                                    end
                                )
                            )
                            if not player.player.metadata.test then
                                player.player_walkeract(
                                    true,
                                    __TS__ArrayFilter(
                                        hitboxes,
                                        function(____, hitbox)
                                            if hitbox.metadata.walkable == true and hitbox.metadata.interactable == true and hitbox.metadata.obstacle ~= true then
                                                hitbox:calculate()
                                                return true
                                            end
                                            return false
                                        end
                                    )
                                )
                            end
                            if player.player.metadata.test then
                                screen.screen:attach(player.player_tooltip)
                            end
                        end
                    else
                        player.player.metadata.test = false
                        if not player.player.metadata.walk then
                            player.player_move(0, 0)
                        end
                        if atlas.atlas.target == "reader" then
                            reader.reader:display().metadata.scroll = game.c_up and -1 or (game.c_down and 1 or 0)
                        end
                    end
                    game.c_down = false
                    game.c_right = false
                    game.c_left = false
                    game.c_up = false
                    game.c_primary = false
                    game.c_secondary = false
                    game.c_tertiary = false
                    game.interact = false
                    return false
                end
                screen.screen:attach(map)
                __TS__Await(map:view(accessor.location_idx))
                screen.screen:detach(map)
                ____debug:destroy()
                ST.acquit = nil
                return ____awaiter_resolve(
                    nil,
                    function()
                        cleanup(nil)
                        batch:release()
                        sourceClear()
                    end
                )
            end)
        end
    )
end
return ____exports
