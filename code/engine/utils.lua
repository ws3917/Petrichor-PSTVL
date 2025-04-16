local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STActor = ____storyteller.STActor
local STAnimation = ____storyteller.STAnimation
local STContainer = ____storyteller.STContainer
local STHitbox = ____storyteller.STHitbox
local STMap = ____storyteller.STMap
local STPoint = ____storyteller.STPoint
local STSplitterResult = ____storyteller.STSplitterResult
local STSprite = ____storyteller.STSprite
____exports.EXMap = __TS__Class()
local EXMap = ____exports.EXMap
EXMap.name = "EXMap"
__TS__ClassExtends(EXMap, STMap)
function EXMap.prototype.____constructor(self, ____bindingPattern0)
    local visual
    local transition
    local sheet
    local physical
    local objects
    local images
    local framess
    local file
    local daemons
    local camera
    local activate
    activate = ____bindingPattern0.activate
    if activate == nil then
        activate = function()
        end
    end
    camera = ____bindingPattern0.camera
    if camera == nil then
        camera = __TS__New(STPoint)
    end
    daemons = ____bindingPattern0.daemons
    if daemons == nil then
        daemons = {}
    end
    file = ____bindingPattern0.file
    framess = ____bindingPattern0.framess
    if framess == nil then
        framess = {}
    end
    images = ____bindingPattern0.images
    if images == nil then
        images = {}
    end
    objects = ____bindingPattern0.objects
    if objects == nil then
        objects = {
            {},
            function()
            end
        }
    end
    physical = ____bindingPattern0.physical
    if physical == nil then
        physical = function()
        end
    end
    sheet = ____bindingPattern0.sheet
    transition = ____bindingPattern0.transition
    if transition == nil then
        transition = {
            10,
            0,
            1,
            1,
            1
        }
    end
    visual = ____bindingPattern0.visual
    if visual == nil then
        visual = function()
        end
    end
    self.canvas = love.graphics.newCanvas(ST.width * ST.scale, ST.height * ST.scale)
    local rooms = ST:decode((love.filesystem.read("string", file))).rooms
    STMap.prototype.____constructor(
        self,
        {
            objects = function()
                return {objects[1], objects[2]}
            end,
            rooms = __TS__ArrayMap(
                rooms,
                function(____, room, index) return {
                    camera_max = room.camera_max,
                    camera_min = room.camera_min,
                    neighbors = room.neighbors,
                    physical = function(self)
                        local ____opt_0 = physical(nil, index)
                        if ____opt_0 ~= nil then
                            ____opt_0 = ____opt_0()
                        end
                        local ____opt_0_2 = ____opt_0
                        if ____opt_0_2 == nil then
                            ____opt_0_2 = {
                                {},
                                function()
                                end
                            }
                        end
                        local custom = ____opt_0_2
                        local ____array_17 = __TS__SparseArrayNew(unpack(__TS__ArrayMap(
                            __TS__ArrayFilter(
                                room.objects,
                                function(____, object) return object.type == 0 end
                            ),
                            function(____, object)
                                local ____STHitbox_16 = STHitbox
                                local ____object_anchor_10 = object.anchor
                                local ____object_position_11 = object.position
                                local ____object_priority_12 = object.priority
                                local ____object_rotation_13 = object.rotation
                                local ____object_size_14 = object.size
                                local ____object_scale_15 = object.scale
                                local ____object_interactable_3 = object.interactable
                                if ____object_interactable_3 == nil then
                                    ____object_interactable_3 = false
                                end
                                local ____object_obstacle_4 = object.obstacle
                                if ____object_obstacle_4 == nil then
                                    ____object_obstacle_4 = false
                                end
                                local ____index_6 = index
                                local function ____temp_7(self, test)
                                    if object.script == nil then
                                        return
                                    end
                                    activate(
                                        nil,
                                        test,
                                        unpack(object.script)
                                    )
                                end
                                local ____object_tags_8 = object.tags
                                local ____object_type_9 = object.type
                                local ____object_walkable_5 = object.walkable
                                if ____object_walkable_5 == nil then
                                    ____object_walkable_5 = false
                                end
                                local result = __TS__New(____STHitbox_16, {
                                    anchor = ____object_anchor_10,
                                    position = ____object_position_11,
                                    priority = ____object_priority_12,
                                    rotation = ____object_rotation_13,
                                    size = ____object_size_14,
                                    scale = ____object_scale_15,
                                    metadata = {
                                        _ = true,
                                        interactable = ____object_interactable_3,
                                        obstacle = ____object_obstacle_4,
                                        room = ____index_6,
                                        scan = true,
                                        script = ____temp_7,
                                        tags = ____object_tags_8,
                                        type = ____object_type_9,
                                        walkable = ____object_walkable_5
                                    }
                                })
                                if object.autosort then
                                    result:addTicker(function(self)
                                        self.priority = self.position.y
                                    end)
                                end
                                return result
                            end
                        )))
                        __TS__SparseArrayPush(
                            ____array_17,
                            unpack(custom[1])
                        )
                        return {
                            {__TS__SparseArraySpread(____array_17)},
                            custom[2]
                        }
                    end,
                    score = room.score and daemons[room.score.daemon] ~= nil and ({daemon = daemons[room.score.daemon], distance = room.score.distance or 0, gain = room.score.gain or 1, rate = room.score.rate or 1}) or nil,
                    visual = function(self, values, sheet, index)
                        local ____opt_18 = visual(nil, index)
                        if ____opt_18 ~= nil then
                            ____opt_18 = ____opt_18(sheet, index)
                        end
                        local ____opt_18_20 = ____opt_18
                        if ____opt_18_20 == nil then
                            ____opt_18_20 = {
                                {},
                                function()
                                end
                            }
                        end
                        local custom = ____opt_18_20
                        local ____array_21 = __TS__SparseArrayNew(
                            __TS__New(STAnimation, {frames = sheet, frame = index, metadata = {_ = true}}):addTicker(function(self)
                                self.priority = self.position.y
                            end),
                            unpack(__TS__ArrayMap(
                                __TS__ArrayFilter(
                                    room.objects,
                                    function(____, object) return object.type ~= 0 end
                                ),
                                function(____, object)
                                    local result
                                    if object.type == 2 then
                                        result = __TS__New(STAnimation, {
                                            anchor = object.anchor,
                                            crop = object.crop,
                                            direction = object.direction,
                                            duration = object.duration,
                                            frame = object.frame,
                                            frames = framess[object.frames] ~= nil and framess[object.frames] or nil,
                                            metadata = {_ = true, room = index, tags = object.tags, type = object.type},
                                            position = object.position,
                                            priority = object.priority,
                                            rotation = object.rotation,
                                            scale = object.scale,
                                            step = object.step
                                        })
                                    else
                                        result = __TS__New(STSprite, {
                                            anchor = object.anchor,
                                            crop = object.crop,
                                            image = images[object.image] ~= nil and images[object.image] or nil,
                                            metadata = {_ = true, room = index, tags = object.tags, type = object.type},
                                            position = object.position,
                                            priority = object.priority,
                                            rotation = object.rotation,
                                            scale = object.scale
                                        })
                                    end
                                    if object.autosort then
                                        result:addTicker(function(self)
                                            self.priority = self.position.y
                                        end)
                                    end
                                    return result
                                end
                            ))
                        )
                        __TS__SparseArrayPush(
                            ____array_21,
                            unpack(custom[1])
                        )
                        return {
                            {__TS__SparseArraySpread(____array_21)},
                            custom[2]
                        }
                    end
                } end
            ),
            sheet = sheet,
            transition = transition
        }
    )
    self.camera = camera
    self:addDrawer(function(self)
        local color = {love.graphics.getColor()}
        local canvas = {love.graphics.getCanvas()}
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setCanvas(self.canvas)
        love.graphics.clear(0, 0, 0, 1)
        return function()
            love.graphics.push()
            love.graphics.replaceTransform(love.math.newTransform(
                0,
                0,
                0,
                1,
                1
            ))
            love.graphics.setCanvas(canvas)
            love.graphics.setColor(color)
            love.graphics.draw(self.canvas)
            love.graphics.pop()
        end
    end)
end
function EXMap.prototype.cleanup(self)
    STMap.prototype.cleanup(self)
    self.canvas:release()
end
____exports.EXPoint = __TS__Class()
local EXPoint = ____exports.EXPoint
EXPoint.name = "EXPoint"
function EXPoint.prototype.____constructor(self, getX, getY, setX, setY)
    self.getX = getX
    self.getY = getY
    self.setX = setX
    self.setY = setY
end
__TS__SetDescriptor(
    EXPoint.prototype,
    "x",
    {
        get = function(self)
            return self.getX()
        end,
        set = function(self, v)
            self.setX(v)
        end
    },
    true
)
__TS__SetDescriptor(
    EXPoint.prototype,
    "y",
    {
        get = function(self)
            return self.getY()
        end,
        set = function(self, v)
            self.setY(v)
        end
    },
    true
)
function ____exports.bb_display(character, image, height)
    if height == nil then
        height = 1
    end
    local dims = character:getSize() or ({x = 0, y = 0})
    return __TS__New(STSprite, {anchor = {x = 0.5, y = 1}, image = image, position = {x = dims.x * -character.anchor.x + dims.x / 2, y = dims.y * -character.anchor.y + -height}})
end
function ____exports.bb_standard(character, image, height)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local display = ____exports.bb_display(character, image, height)
        character:attach(display)
        __TS__Await(display.offset:automate(10, {y = -5}, {y = -5}, {y = 0}))
        __TS__Await(ST:pause(20))
        character:detach(display)
    end)
end
function ____exports.ezchar(properties)
    return __TS__New(
        STActor,
        __TS__ObjectAssign({anchor = {x = 0.5, y = 1}, facings = {down = "down", left = "left", right = "right", up = "up"}}, properties)
    ):addTicker(function(self)
        self.priority = self.position.y
    end)
end
function ____exports.ezecho(src, delay, mix, feedback, threshold, stop)
    if stop == nil then
        stop = true
    end
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local ____end = math.floor(src.position.value * ST.fps + 0.5)
        if ____end == 0 then
            return ____awaiter_resolve(nil)
        end
        local position = math.max(____end - delay, 0) / ST.fps
        local start = math.max(delay - ____end, 0)
        local gain = mix
        local inst = stop and src or nil
        while gain > threshold do
            if inst ~= nil then
                inst:stop()
            end
            if start ~= 0 then
                __TS__Await(ST:pause(start))
            end
            inst = src.daemon:instance_forced({gain = gain, position = position})
            __TS__Await(ST:pause(delay - start))
            gain = gain * feedback
        end
        if inst ~= nil then
            inst:stop()
        end
    end)
end
function ____exports.ezfade(instance)
    local ____instance_gain_26, ____value_27 = instance.gain, "value"
    ____instance_gain_26[____value_27] = ____instance_gain_26[____value_27] / 10
    instance.gain:automate(7, instance.gain.value * 10)
end
function ____exports.keygen(value)
    return __TS__ArrayMap(
        __TS__StringSplit(
            __TS__StringAccess(value, 0) == " " and string.sub(value, 2) or value,
            " "
        ),
        function(____, key) return function() return love.keyboard.isDown(key) end end
    )
end
function ____exports.object_updater(screen, room, metadata, generator)
    return function(self, from, to, physical, x, y)
        if to == room then
            if not physical then
                return
            end
            local existing = screen:scan(function(container) return container.metadata == metadata end):next().value
            if existing ~= nil then
                return
            end
            local container = generator(metadata)
            screen:attach(container)
            return
        end
        if not physical or from == room then
            return
        end
        local existing = screen:scan(function(container) return container.metadata == metadata end):next().value
        if existing ~= nil then
            screen:detach(existing)
        end
    end
end
function ____exports.rainGen()
    local angle = 105
    local unit = ST:ray(angle, 1)
    local xextent = 240 + math.abs(unit.x * (180 / unit.y))
    local pptMin = 2
    local pptMax = 3
    local sizeMin = 5
    local sizeMax = 30
    local speedMin = 10
    local speedMax = 25
    local thiccMin = 0.25
    local thiccMax = 0.5
    local alphaMin = 0.1
    local alphaMax = 0.4
    local p = 0
    local sim = 60
    local particles = {}
    return __TS__New(STContainer):addDrawer(function(self)
        while true do
            local ____sim_30 = sim
            sim = ____sim_30 - 1
            if not (____sim_30 ~= 0) then
                break
            end
            p = pptMin + math.floor(math.random() * (pptMax - pptMin))
            while true do
                local ____p_28 = p
                p = ____p_28 - 1
                if not (____p_28 ~= 0) then
                    break
                end
                local ss = math.random()
                local speed = speedMin + math.floor(ss * (speedMax - speedMin))
                local size = sizeMin + math.floor(ss * (sizeMax - sizeMin))
                particles[#particles + 1] = {
                    -120 + math.floor(math.random() * xextent),
                    -90 - unit.y * speed,
                    speed,
                    size
                }
            end
            local index = #particles
            local color = {love.graphics.getColor()}
            while true do
                local ____index_29 = index
                index = ____index_29 - 1
                if not (____index_29 ~= 0) then
                    break
                end
                local particle = particles[index + 1]
                if 90 <= particle[2] then
                    __TS__ArraySplice(particles, index, 1)
                else
                    particle[1] = particle[1] + unit.x * particle[3]
                    particle[2] = particle[2] + unit.y * particle[3]
                    if sim == 0 then
                        love.graphics.setColor(
                            1,
                            1,
                            1,
                            alphaMin + math.random() * (alphaMax - alphaMin)
                        )
                        love.graphics.setLineWidth(thiccMin + math.random() * (thiccMax - thiccMin))
                        love.graphics.line(particle[1], particle[2], particle[1] + unit.x * particle[4], particle[2] + unit.y * particle[4])
                    end
                end
            end
            love.graphics.setColor(color)
        end
        sim = 1
    end)
end
function ____exports.standardSplitter(char)
    repeat
        local ____switch64 = char
        local ____cond64 = ____switch64 == " "
        if ____cond64 then
            return STSplitterResult.EXCLUDE
        end
        ____cond64 = ____cond64 or ____switch64 == "-"
        if ____cond64 then
            return STSplitterResult.INCLUDE
        end
        do
            return STSplitterResult.NONE
        end
    until true
end
return ____exports
