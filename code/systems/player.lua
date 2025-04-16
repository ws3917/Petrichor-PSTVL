local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STAnimation = ____storyteller.STAnimation
local STContainer = ____storyteller.STContainer
local STHitbox = ____storyteller.STHitbox
local STObject = ____storyteller.STObject
local STSprite = ____storyteller.STSprite
local STText = ____storyteller.STText
local ____utils = require("code.engine.utils")
local ezchar = ____utils.ezchar
local ____global = require("code.global")
local accessor = ____global.accessor
local function player(assets, batch, game)
    local metadata = {
        floof = accessor.floof,
        floof_update = false,
        last_x = 0,
        last_y = 0,
        moved = false,
        test = false,
        walk = false
    }
    local player = ezchar({
        metadata = metadata,
        position = {x = accessor.location_pos_x, y = accessor.location_pos_y},
        stances = {down = assets["ic$player$down"], left = assets["ic$player$left"], right = assets["ic$player$right"], up = assets["ic$player$up"]},
        stance = accessor.location_stance,
        color = 10652124
    }):addTicker(function(self)
        self.priority = self.position.y
    end):addDrawer(function(self)
        if metadata.floof then
            if not metadata.floof_update then
                metadata.floof_update = true
                self.stances.down = assets["ic$player$down_plush"]
                self.stances.left = assets["ic$player$left_plush"]
                self.stances.right = assets["ic$player$right_plush"]
                self.stances.up = assets["ic$player$up_plush"]
                self.stance = self.stance
            end
        elseif metadata.floof_update then
            metadata.floof_update = false
            self.stances.down = assets["ic$player$down"]
            self.stances.left = assets["ic$player$left"]
            self.stances.right = assets["ic$player$right"]
            self.stances.up = assets["ic$player$up"]
            self.stance = self.stance
        end
    end)
    local player_hitbox = __TS__New(STHitbox, {anchor = {x = 0.5, y = 1}, size = {x = 17, y = 3}})
    local player_interactor = __TS__New(STHitbox)
    local player_walkbox = __TS__New(STHitbox, {anchor = {x = 0.5, y = 1}, size = {x = 9, y = 3}})
    local player_walkeractor = __TS__New(STHitbox, {anchor = {x = 0.5, y = 1}, size = {x = 7, y = 2}})
    player:attach(player_hitbox, player_interactor, player_walkbox, player_walkeractor)
    return {
        player = player,
        player_hitbox = player_hitbox,
        player_interact = function(test, interactables)
            if interactables == nil then
                interactables = {}
            end
            player_interactor:calculate()
            table.sort(
                interactables,
                function(a, b) return a.priority < b.priority end
            )
            for ____, interactable in ipairs(interactables) do
                if player_interactor:test(interactable) then
                    interactable.metadata:script(test)
                    if test and player.metadata.test then
                        break
                    end
                end
            end
        end,
        player_interactor = player_interactor,
        player_menu = __TS__New(
            STAnimation,
            {
                metadata = false,
                alpha = 0,
                anchor = {x = 0.5, y = 1},
                scale = 0,
                children = {__TS__New(STContainer)},
                priority = 10000,
                frames = assets["im$ov_bubble"],
                color = 10652124
            }
        ):addTicker(function(self)
            local s
            local x = player.position.x
            local y = player.position.y
            local px = player.parent.position.x + x
            local py = player.parent.position.y + y
            if px < -95 and py < -58 then
                s = 6
                self.anchor.x = 0
                self.anchor.y = 0
                self.position.x = x + 7
                self.position.y = y
                self.children[1].position.x = 28
                self.children[1].position.y = 7.5
            elseif px < -95 and py > 86 then
                s = 4
                self.anchor.x = 0
                self.anchor.y = 1
                self.position.x = x + 7
                self.position.y = y - 28
                self.children[1].position.x = 28
                self.children[1].position.y = -34.5
            elseif px > 95 and py < -58 then
                s = 5
                self.anchor.x = 1
                self.anchor.y = 0
                self.position.x = x - 7
                self.position.y = y
                self.children[1].position.x = -27
                self.children[1].position.y = 7.5
            elseif px > 95 and py > 86 then
                s = 7
                self.anchor.x = 1
                self.anchor.y = 1
                self.position.x = x - 7
                self.position.y = y - 28
                self.children[1].position.x = -27
                self.children[1].position.y = -34.5
            elseif px < -95 then
                s = 2
                self.anchor.x = 0
                self.anchor.y = 0.5
                self.position.x = x + 7
                self.position.y = y - 14
                self.children[1].position.x = 28
                self.children[1].position.y = -13.5
            elseif px > 95 then
                s = 3
                self.anchor.x = 1
                self.anchor.y = 0.5
                self.position.x = x - 7
                self.position.y = y - 14
                self.children[1].position.x = -27
                self.children[1].position.y = -13.5
            elseif py < -21 then
                s = 1
                self.anchor.x = 0.5
                self.anchor.y = 0
                self.position.x = x
                self.position.y = y
                self.children[1].position.x = 0.5
                self.children[1].position.y = 7.5
            else
                s = 0
                self.anchor.x = 0.5
                self.anchor.y = 1
                self.position.x = x
                self.position.y = y - 28
                self.children[1].position.x = 0.5
                self.children[1].position.y = -34.5
            end
            self.frame = s
            if self.metadata then
                local ____self_alpha_0, ____value_1 = self.alpha, "value"
                ____self_alpha_0[____value_1] = ____self_alpha_0[____value_1] + (1 - self.alpha.value) / 2
                if s < 2 then
                    self.scale.x = 1
                    local ____self_scale_2, ____y_3 = self.scale, "y"
                    ____self_scale_2[____y_3] = ____self_scale_2[____y_3] + (1 - self.scale.y) / 2
                elseif s < 4 then
                    local ____self_scale_4, ____x_5 = self.scale, "x"
                    ____self_scale_4[____x_5] = ____self_scale_4[____x_5] + (1 - self.scale.x) / 2
                    self.scale.y = 1
                else
                    local ____self_scale_6, ____x_7 = self.scale, "x"
                    ____self_scale_6[____x_7] = ____self_scale_6[____x_7] + (1 - self.scale.x) / 2
                    local ____self_scale_8, ____y_9 = self.scale, "y"
                    ____self_scale_8[____y_9] = ____self_scale_8[____y_9] + (1 - self.scale.y) / 2
                end
            else
                local ____self_alpha_10, ____value_11 = self.alpha, "value"
                ____self_alpha_10[____value_11] = ____self_alpha_10[____value_11] - self.alpha.value / 2
                if s < 2 then
                    self.scale.x = 1
                    local ____self_scale_12, ____y_13 = self.scale, "y"
                    ____self_scale_12[____y_13] = ____self_scale_12[____y_13] - self.scale.y / 2
                elseif s < 4 then
                    local ____self_scale_14, ____x_15 = self.scale, "x"
                    ____self_scale_14[____x_15] = ____self_scale_14[____x_15] - self.scale.x / 2
                    self.scale.y = 1
                else
                    local ____self_scale_16, ____x_17 = self.scale, "x"
                    ____self_scale_16[____x_17] = ____self_scale_16[____x_17] - self.scale.x / 2
                    local ____self_scale_18, ____y_19 = self.scale, "y"
                    ____self_scale_18[____y_19] = ____self_scale_18[____y_19] - self.scale.y / 2
                end
            end
        end),
        player_move = function(x, y, a, b, obstacles, walkstacles, walkables)
            if a == nil then
                a = false
            end
            if b == nil then
                b = false
            end
            if obstacles == nil then
                obstacles = {}
            end
            if walkstacles == nil then
                walkstacles = {}
            end
            if walkables == nil then
                walkables = {}
            end
            player:move(x, y)
            if x > 2 or x < -2 or y > 2 or y < -2 then
                player.duration = 3
            elseif x > 1 or x < -1 or y > 1 or y < -1 then
                player.duration = 5
            else
                player.duration = 6
            end
            repeat
                local ____switch35 = player.stance
                local ____cond35 = ____switch35 == "down"
                if ____cond35 then
                    player_interactor.anchor.x = 0.5
                    player_interactor.anchor.y = 0
                    player_interactor.size.x = 1
                    player_interactor.size.y = 10
                    break
                end
                ____cond35 = ____cond35 or ____switch35 == "left"
                if ____cond35 then
                    player_interactor.anchor.x = 1
                    player_interactor.anchor.y = 1
                    player_interactor.size.x = 19
                    player_interactor.size.y = 1
                    break
                end
                ____cond35 = ____cond35 or ____switch35 == "right"
                if ____cond35 then
                    player_interactor.anchor.x = 0
                    player_interactor.anchor.y = 1
                    player_interactor.size.x = 19
                    player_interactor.size.y = 1
                    break
                end
                ____cond35 = ____cond35 or ____switch35 == "up"
                if ____cond35 then
                    player_interactor.anchor.x = 0.5
                    player_interactor.anchor.y = 1
                    player_interactor.size.x = 1
                    player_interactor.size.y = 10 + 3
                    break
                end
            until true
            if x == 0 and y == 0 then
                player.metadata.moved = false
                return
            end
            player.metadata.last_x = x
            player.metadata.last_y = y
            player.metadata.moved = true
            local obs = #obstacles
            local wls = #walkstacles
            if obs == 0 and wls == 0 then
                return
            end
            local ____player_position_20, ____y_21 = player.position, "y"
            ____player_position_20[____y_21] = ____player_position_20[____y_21] - y
            if x ~= 0 and obs ~= 0 then
                player_hitbox:calculate()
                for ____, obstacle in ipairs(obstacles) do
                    while x ~= 0 and player_hitbox:test(obstacle) do
                        local d = ST:clamp(x, -1, 1)
                        x = x - d
                        local ____player_position_22, ____x_23 = player.position, "x"
                        ____player_position_22[____x_23] = ____player_position_22[____x_23] - d
                        player_hitbox:calculate()
                    end
                    if x == 0 then
                        break
                    end
                end
            end
            if x ~= 0 and wls ~= 0 then
                player_walkbox:calculate()
                for ____, walkstacle in ipairs(walkstacles) do
                    while x ~= 0 and player_walkbox:test(walkstacle) do
                        local d = ST:clamp(x, -1, 1)
                        x = x - d
                        local ____player_position_24, ____x_25 = player.position, "x"
                        ____player_position_24[____x_25] = ____player_position_24[____x_25] - d
                        player_walkbox:calculate()
                    end
                    if x == 0 then
                        break
                    end
                end
            end
            local ____player_position_26, ____y_27 = player.position, "y"
            ____player_position_26[____y_27] = ____player_position_26[____y_27] + y
            if y ~= 0 and obs ~= 0 then
                player_hitbox:calculate()
                for ____, obstacle in ipairs(obstacles) do
                    while y ~= 0 and player_hitbox:test(obstacle) do
                        local d = ST:clamp(y, -1, 1)
                        y = y - d
                        local ____player_position_28, ____y_29 = player.position, "y"
                        ____player_position_28[____y_29] = ____player_position_28[____y_29] - d
                        player_hitbox:calculate()
                    end
                    if y == 0 then
                        break
                    end
                end
            end
            if y ~= 0 and wls ~= 0 then
                player_walkbox:calculate()
                for ____, walkstacle in ipairs(walkstacles) do
                    while y ~= 0 and player_walkbox:test(walkstacle) do
                        local d = ST:clamp(y, -1, 1)
                        y = y - d
                        local ____player_position_30, ____y_31 = player.position, "y"
                        ____player_position_30[____y_31] = ____player_position_30[____y_31] - d
                        player_walkbox:calculate()
                    end
                    if y == 0 then
                        break
                    end
                end
            end
            if a and x == 0 or b and y == 0 then
                local dance_x = a and x == 0 and (game.c_secondary and 3 or 2) or 0
                local dance_y = b and y == 0 and (game.c_secondary and 3 or 2) or 0
                local ____player_metadata_32, ____last_x_33 = player.metadata, "last_x"
                ____player_metadata_32[____last_x_33] = ____player_metadata_32[____last_x_33] + dance_x
                local ____player_metadata_34, ____last_y_35 = player.metadata, "last_y"
                ____player_metadata_34[____last_y_35] = ____player_metadata_34[____last_y_35] + dance_y
                player:move(dance_x, dance_y)
            elseif x == 0 and y == 0 then
                player.direction = 0
                player.frame = 0
                player.step = 0
            end
            table.sort(
                walkables,
                function(a, b) return a.priority < b.priority end
            )
            for ____, walkable in ipairs(walkables) do
                if player_hitbox:test(walkable) then
                    walkable.metadata:script()
                end
            end
            return {x = x, y = y}
        end,
        player_step = function(speed, ...)
            if speed == nil then
                speed = 0
            end
            local points = {...}
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                player.metadata.walk = true
                if speed > 2 then
                    player.duration = 3
                elseif speed > 1 then
                    player.duration = 5
                else
                    player.duration = 6
                end
                player.direction = 1
                player.frame = 0
                player.step = 0
                __TS__Await(player.position:step(
                    speed,
                    unpack(points)
                ))
                player.direction = 0
                player.frame = 0
                player.step = 0
                player.metadata.walk = false
            end)
        end,
        player_tooltip = __TS__New(
            STObject,
            {
                alpha = 0,
                priority = 9999,
                metadata = {content = "", interact = false, width = 0},
                children = {
                    __TS__New(STSprite, {anchor = {x = 1}, image = assets["im$tt_side"], position = {y = -90}}),
                    __TS__New(STSprite, {anchor = {x = 0.5}, image = assets["im$tt_edge"], position = {y = -90}}),
                    __TS__New(STSprite, {anchor = {x = 1}, scale = {x = -1}, image = assets["im$tt_side"], position = {y = -90}}),
                    __TS__New(STText, {
                        font = assets["f$helloplayer"],
                        priority = 1,
                        justify = 0.5,
                        anchor = {x = 0.5},
                        position = {y = -87.5}
                    })
                }
            }
        ):addTicker(function(self)
            local spr1, spr2, spr3, txt = unpack(self.children)
            local ideal
            if self.metadata.content == txt.content then
                ideal = self.metadata.width
            else
                txt.content = self.metadata.content
                ideal = assets["f$helloplayer"]:compute(self.metadata.content).x + 10
                self.metadata.width = ideal
            end
            if player.metadata.test then
                if self.alpha.value ~= 0.7 then
                    local ____self_alpha_36, ____value_37 = self.alpha, "value"
                    local ____self_alpha_value_38 = ____self_alpha_36[____value_37] + 0.7 / 4
                    ____self_alpha_36[____value_37] = ____self_alpha_value_38
                    if 0.7 < ____self_alpha_value_38 then
                        self.alpha.value = 0.7
                    end
                end
            elseif self.alpha.value ~= 0 then
                local ____self_alpha_39, ____value_40 = self.alpha, "value"
                local ____self_alpha_value_41 = ____self_alpha_39[____value_40] - 1 / 4
                ____self_alpha_39[____value_40] = ____self_alpha_value_41
                if ____self_alpha_value_41 < 0 then
                    self.alpha.value = 0
                    self:isolate()
                end
            end
            local width = self.alpha.value == 0.7 and (spr2.scale.x + ideal * 2) / 3 or ideal
            self.position.y = ST:bezier(self.alpha.value / 0.7, -15, 0, 0)
            spr1.position.x = width / -2
            spr2.scale.x = width
            spr3.position.x = width / 2
            if self.metadata.interact then
                txt.color.red = 162
                txt.color.green = 137
                txt.color.blue = 220
            else
                txt.color.red = 255
                txt.color.green = 255
                txt.color.blue = 255
            end
        end):addDrawer(batch.drawer),
        player_walk = function(speed, ...)
            if speed == nil then
                speed = 0
            end
            local points = {...}
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                player.metadata.walk = true
                if speed > 2 then
                    player.duration = 3
                elseif speed > 1 then
                    player.duration = 5
                else
                    player.duration = 6
                end
                __TS__Await(player:walk(
                    speed,
                    unpack(points)
                ))
                player.metadata.walk = false
            end)
        end,
        player_walkbox = player_walkbox,
        player_walkeract = function(test, walkeractables)
            if walkeractables == nil then
                walkeractables = {}
            end
            player_walkeractor:calculate()
            table.sort(
                walkeractables,
                function(a, b) return a.priority < b.priority end
            )
            for ____, walkeractable in ipairs(walkeractables) do
                if player_walkeractor:test(walkeractable) then
                    walkeractable.metadata:script(test)
                    if test and player.metadata.test then
                        break
                    end
                end
            end
        end,
        player_walkeractor = player_walkeractor
    }
end
____exports.default = player
return ____exports
