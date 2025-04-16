local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STContainer = ____storyteller.STContainer
local STDaemon = ____storyteller.STDaemon
local STFrames = ____storyteller.STFrames
local STHitbox = ____storyteller.STHitbox
local STImage = ____storyteller.STImage
local STRectangle = ____storyteller.STRectangle
local STSprite = ____storyteller.STSprite
local STText = ____storyteller.STText
local STValue = ____storyteller.STValue
local ____utils = require("code.engine.utils")
local EXMap = ____utils.EXMap
local rainGen = ____utils.rainGen
local ____global = require("code.global")
local accessor = ____global.accessor
local init = ____global.init
local world = ____global.world
local ____bloom = require("code.shaders.bloom")
local bloomShader = ____bloom.default
local ____frameblur = require("code.shaders.frameblur")
local frameblurShader = ____frameblur.default
local ____overworld = require("code.systems.overworld")
local overworldSystem = ____overworld.default
function ____exports.commonCharactersGen()
    return {stowaway = {
        down = __TS__New(STFrames, "images/characters/stowaway/down.json", "images/characters/stowaway/down.png"),
        left = __TS__New(STFrames, "images/characters/stowaway/left.json", "images/characters/stowaway/left.png"),
        right = __TS__New(STFrames, "images/characters/stowaway/right.json", "images/characters/stowaway/right.png"),
        up = __TS__New(STFrames, "images/characters/stowaway/up.json", "images/characters/stowaway/up.png")
    }}
end
function ____exports.commonResourcesGen(music, sound)
    return {
        daemons = {
            rain = __TS__New(STDaemon, "sounds/rain.ogg", {mixer = sound, loop = true, gain = 0.4}),
            thunder = __TS__New(STDaemon, "sounds/thunder.ogg", {mixer = sound, loop = true, gain = 0.4})
        },
        framess = {golden = __TS__New(STFrames, "images/objects/common/golden.json", "images/objects/common/golden.png")},
        images = {
            goatplush = __TS__New(STImage, "images/objects/common/goatplush.png"),
            void = __TS__New(STImage, "images/objects/common/void.png"),
            void_window = __TS__New(STImage, "images/objects/common/void_window.png"),
            jusant = __TS__New(STImage, "images/objects/common/jusant.png"),
            jusant_circle = __TS__New(STImage, "images/objects/common/jusant_circle.png")
        }
    }
end
function ____exports.commonAreaGen(extras, resourcesGen)
    local overworld = overworldSystem(extras)
    local assets = overworld.assets
    local atlas = overworld.atlas.atlas
    local music = overworld.mixer.music
    local sound = overworld.mixer.sound
    local player = overworld.player.player
    local player_menu = overworld.player.player_menu
    local player_tooltip = overworld.player.player_tooltip
    local reader = overworld.reader.reader
    local object = overworld.screen.object
    local objects = overworld.screen.objects
    local screen = overworld.screen.screen
    local resources = resourcesGen(music, sound)
    local images = resources.images
    local activators = {}
    local temp = {}
    local map
    map = __TS__New(
        EXMap,
        __TS__ObjectAssign(
            {},
            resources,
            {
                camera = player.position,
                objects = {
                    {player, player_menu},
                    function()
                    end
                },
                activate = function(self, test, ...)
                    for ____, activator in ipairs(activators) do
                        activator(test, ...)
                    end
                end
            }
        )
    ):addUpdater(function(self, from, to, physical, x, y)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            if to == nil then
                return ____awaiter_resolve(nil)
            end
            if physical then
                for ____, t in ipairs(__TS__ArraySplice(temp, 0)) do
                    self:detach(t)
                end
                for ____, obj in __TS__Iterator(objects("tint")) do
                    local tags = obj.self.metadata.tags
                    obj.self.color.value = __TS__ParseInt(
                        tags[__TS__ArrayIndexOf(tags, "tint") + 1 + 1],
                        16
                    )
                end
                for ____, obj in __TS__Iterator(objects("fixed")) do
                    local ____obj_self_position_0 = obj.self.position
                    local x = ____obj_self_position_0.x
                    local y = ____obj_self_position_0.y
                    obj.self:addTicker(function(self)
                        self.position.x = x - map.position.x / map.scale.x
                        self.position.y = y - map.position.y / map.scale.y
                        self.scale.x = 1 / map.scale.x
                        self.scale.y = 1 / map.scale.y
                    end)
                end
                local fog = object("fog")
                if fog then
                    fog:destroy()
                    local y = 0
                    while y <= 180 do
                        local my = y - 90
                        local fr = __TS__New(STSprite, {alpha = 0.02, anchor = {x = 0.5, y = 1}, image = images.void}):addTicker(function(self)
                            self.position.x = -map.position.x / map.scale.x
                            self.position.y = my - map.position.y / map.scale.y
                            self.priority = my == -90 and -1000000 or (my == 90 and 1000000 or self.position.y + 0.000001)
                            self.scale.x = 1 / map.scale.x
                            self.scale.y = 1 / map.scale.y
                        end)
                        if y % 90 == 0 then
                            fr:attach(rainGen())
                        end
                        map:attach(fr)
                        temp[#temp + 1] = fr
                        y = y + 9
                    end
                end
            end
            if physical and from == nil then
                if not init.load then
                    init.load = true
                    local fd = __TS__New(STRectangle, {
                        alpha = 1,
                        color = 0,
                        size = {x = 240, y = 180},
                        anchor = 0.5,
                        priority = 1000
                    })
                    screen:attach(fd)
                    local ____self_1 = fd.alpha:automate(7, 0)
                    ____self_1["then"](
                        ____self_1,
                        function()
                            screen:detach(fd)
                        end
                    )
                end
            end
        end)
    end)
    local function failer()
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            assets["s$reload"]:instance()
            local sh = __TS__New(STValue)
            local function shTicker()
                screen.position.x = sh.value * (math.random() * 2 - 1)
                screen.position.y = sh.value * (math.random() * 2 - 1)
            end
            screen:addTicker(shTicker)
            __TS__Await(sh:automate(30, 0, 1))
            local scale = ST.scale
            local fader = __TS__New(STRectangle, {
                alpha = 0,
                color = 0,
                size = {x = 240, y = 180},
                anchor = 0.5,
                priority = 1000
            })
            screen:attach(fader)
            __TS__Await(ST:when(function()
                local ____fader_alpha_2, ____value_3 = fader.alpha, "value"
                local ____fader_alpha_value_4 = ____fader_alpha_2[____value_3] + 1 / 60
                ____fader_alpha_2[____value_3] = ____fader_alpha_value_4
                local fa = ____fader_alpha_value_4
                if 1 <= fa then
                    ST.scale = scale
                    return true
                end
                ST.scale = scale * 0.5 ^ (fa * 5)
                return false
            end))
            local ____opt_5 = map.task
            if ____opt_5 ~= nil then
                ____opt_5.complete(nil)
            end
            world:dump()
            init.reload = true
        end)
    end
    local function hide(tag, y)
        if y == nil then
            y = 9000
        end
        for ____, obj in __TS__Iterator(objects(tag)) do
            if __TS__InstanceOf(obj.self, STHitbox) then
                obj.self.metadata.y = obj.self.position.y
                obj.self.position.y = y
            else
                obj.self.alpha.value = 0
            end
        end
    end
    local function hintGen(content, mode, metadata, alpha, hpy, hpa)
        if alpha == nil then
            alpha = 0.25
        end
        if hpy == nil then
            hpy = 0
        end
        if hpa == nil then
            hpa = 1
        end
        local ____end = false
        local time = 0
        local hint = __TS__New(
            STContainer,
            {
                alpha = 0,
                position = {y = hpy},
                metadata = metadata,
                children = {
                    __TS__New(STRectangle, {alpha = alpha, color = 0, anchor = 0.5, size = {x = 240, y = 180}}),
                    __TS__New(STText, {
                        anchor = 0.5,
                        justify = 0.5,
                        color = 16777215,
                        font = assets["f$helloplayer"],
                        content = content
                    })
                },
                priority = 1000
            }
        ):addDrawer(function(self)
            if ____end then
                return
            end
            local ____temp_8 = mode ~= 1 or not player.metadata.moved
            if ____temp_8 then
                local ____temp_7
                if mode == 2 then
                    ____temp_7 = reader.next_task ~= nil
                else
                    ____temp_7 = atlas.target == nil or mode == 3
                end
                ____temp_8 = ____temp_7
            end
            if ____temp_8 then
                if self.metadata == nil then
                    self.metadata = math.max(
                        time,
                        math.min(metadata, 60)
                    )
                end
                local ____self_alpha_14 = self.alpha
                local ____ST_12 = ST
                local ____ST_remap_clamped_13 = ST.remap_clamped
                local ____self_9, ____metadata_10 = self, "metadata"
                local ____self_metadata_11 = ____self_9[____metadata_10]
                ____self_9[____metadata_10] = ____self_metadata_11 - 1
                ____self_alpha_14.value = ____ST_remap_clamped_13(
                    ____ST_12,
                    ____self_metadata_11,
                    0,
                    hpa,
                    7,
                    0
                )
            elseif self.metadata ~= nil then
                time = self.metadata
                self.metadata = nil
                self.alpha.value = 0
            end
        end)
        screen:attach(hint)
        return function()
            ____end = true
            local ____self_15 = hint.alpha:automate(7, 0)
            ____self_15["then"](
                ____self_15,
                function()
                    screen:detach(hint)
                end
            )
        end
    end
    local function pstop()
        local ____player_position_16, ____x_17 = player.position, "x"
        ____player_position_16[____x_17] = ____player_position_16[____x_17] - player.metadata.last_x
        local ____player_position_18, ____y_19 = player.position, "y"
        ____player_position_18[____y_19] = ____player_position_18[____y_19] - player.metadata.last_y
        player:move(0, 0)
    end
    local function reveal(tag)
        for ____, obj in __TS__Iterator(objects(tag)) do
            if __TS__InstanceOf(obj.self, STHitbox) then
                obj.self.position.y = obj.self.metadata.y
            else
                obj.self.alpha.value = 1
            end
        end
    end
    local function shaderSetup()
        local frameblur = frameblurShader(
            3,
            0.05,
            (0.005 / 0.05) ^ (1 / 3),
            function() return accessor["$option_shaders"] == 2 end
        )
        screen:addDrawer(frameblur.drawer)
        local bloom1 = bloomShader({
            threshold = 0.1,
            intensity = 1.2,
            xsamples = 13,
            ysamples = 13,
            limit = 0.8,
            bleed = 0.5,
            absorb = 0.6,
            enabled = function() return accessor["$option_shaders"] ~= 0 end
        })
        screen:addDrawer(bloom1.drawer)
        local bloom2 = bloomShader({
            threshold = 0.8,
            intensity = 0.8,
            xsamples = 17,
            ysamples = 17,
            limit = 1,
            bleed = 0,
            absorb = 0.6,
            enabled = function() return accessor["$option_shaders"] == 2 end
        })
        screen:addDrawer(bloom2.drawer)
        return function()
            frameblur:release()
            bloom1:release()
            bloom2:release()
        end
    end
    local function stepSFX(self)
        if self.step < 1 and self.frame % 2 == 1 then
            local snd = nil
            local hbox = __TS__New(STHitbox, {anchor = {x = 0.5, y = 1}, size = 1})
            self:attach(hbox)
            hbox:calculate()
            for ____, stepbox in __TS__Iterator(objects("stepbox")) do
                local sbox = stepbox.self
                if sbox.metadata.calculate ~= true then
                    sbox.metadata.calculate = true
                    sbox:calculate()
                end
                if hbox:test(sbox) then
                    local tags = sbox.metadata.tags
                    snd = tags[__TS__ArrayIndexOf(tags, "stepbox") + 1 + 1]
                    break
                end
            end
            self:detach(hbox)
            if snd == nil then
                local step = objects("step"):next().value
                if step ~= nil then
                    local tags = step.self.metadata.tags
                    snd = tags[__TS__ArrayIndexOf(tags, "step") + 1 + 1]
                end
            end
            if snd ~= nil then
                assets[snd]:instance({
                    gain = 0.4 + math.random() * 0.4,
                    rate = 0.9 + math.random() * 0.2
                })
            end
        end
    end
    local function tooltip(content)
        if player.metadata.test or accessor.plot < 1 then
            return
        end
        player.metadata.test = true
        player_tooltip.metadata.content = content
    end
    local function unfailer()
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            init.reload = false
            assets["s$reload_ex"]:instance()
            local scale = ST.scale
            local fader = __TS__New(STRectangle, {
                alpha = 1,
                color = 0,
                size = {x = 240, y = 180},
                anchor = 0.5,
                priority = 1000000001
            })
            screen:attach(fader)
            __TS__Await(ST:pause(30))
            local sh = __TS__New(STValue, 1)
            local function shTicker()
                screen.position.x = sh.value * (math.random() * 2 - 1)
                screen.position.y = sh.value * (math.random() * 2 - 1)
            end
            screen:addTicker(shTicker)
            local ____self_20 = sh:automate(30, 1, 0)
            ____self_20["then"](
                ____self_20,
                function()
                    screen:removeTicker(shTicker)
                end
            )
            __TS__Await(ST:when(function()
                local ____fader_alpha_21, ____value_22 = fader.alpha, "value"
                local ____fader_alpha_value_23 = ____fader_alpha_21[____value_22] - 1 / 60
                ____fader_alpha_21[____value_22] = ____fader_alpha_value_23
                local fa = ____fader_alpha_value_23
                if fa <= 0 then
                    ST.scale = scale
                    return true
                end
                ST.scale = scale * 0.5 ^ (fa * 5)
                return false
            end))
            screen:detach(fader)
        end)
    end
    return {
        failer = failer,
        hide = hide,
        hintGen = hintGen,
        map = map,
        overworld = overworld,
        pstop = pstop,
        resources = resources,
        reveal = reveal,
        activators = activators,
        shaderSetup = shaderSetup,
        stepSFX = stepSFX,
        temp = temp,
        tooltip = tooltip,
        unfailer = unfailer
    }
end
return ____exports
