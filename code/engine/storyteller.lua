local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__DelegatedYield = ____lualib.__TS__DelegatedYield
local __TS__Generator = ____lualib.__TS__Generator
local __TS__ArrayEntries = ____lualib.__TS__ArrayEntries
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__StringSlice = ____lualib.__TS__StringSlice
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectFromEntries = ____lualib.__TS__ObjectFromEntries
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__ArrayUnshift = ____lualib.__TS__ArrayUnshift
local __TS__ArrayFlatMap = ____lualib.__TS__ArrayFlatMap
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Promise = ____lualib.__TS__Promise
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local ____exports = {}
local ____sat = require("code.engine.sat")
local Polygon = ____sat.Polygon
local testPolygonPolygon = ____sat.testPolygonPolygon
local Vector = ____sat.Vector
local events = require("code.engine.events")
local json = require("code.engine.json")
local utf8 = require("utf8")
--- Blend modes used when images or animation frames are drawn to a canvas.
____exports.STBlend = STBlend or ({})
____exports.STBlend.ADD = 0
____exports.STBlend[____exports.STBlend.ADD] = "ADD"
____exports.STBlend.ALPHA = 1
____exports.STBlend[____exports.STBlend.ALPHA] = "ALPHA"
____exports.STBlend.DARKEN = 2
____exports.STBlend[____exports.STBlend.DARKEN] = "DARKEN"
____exports.STBlend.LIGHTEN = 3
____exports.STBlend[____exports.STBlend.LIGHTEN] = "LIGHTEN"
____exports.STBlend.MULTIPLY = 4
____exports.STBlend[____exports.STBlend.MULTIPLY] = "MULTIPLY"
____exports.STBlend.REPLACE = 5
____exports.STBlend[____exports.STBlend.REPLACE] = "REPLACE"
____exports.STBlend.SCREEN = 6
____exports.STBlend[____exports.STBlend.SCREEN] = "SCREEN"
____exports.STBlend.SUBTRACT = 7
____exports.STBlend[____exports.STBlend.SUBTRACT] = "SUBTRACT"
--- Cardinal and diagonal facing directions.
____exports.STFacing = STFacing or ({})
____exports.STFacing.DOWN = 0
____exports.STFacing[____exports.STFacing.DOWN] = "DOWN"
____exports.STFacing.DOWN_LEFT = 1
____exports.STFacing[____exports.STFacing.DOWN_LEFT] = "DOWN_LEFT"
____exports.STFacing.DOWN_RIGHT = 2
____exports.STFacing[____exports.STFacing.DOWN_RIGHT] = "DOWN_RIGHT"
____exports.STFacing.LEFT = 3
____exports.STFacing[____exports.STFacing.LEFT] = "LEFT"
____exports.STFacing.RIGHT = 4
____exports.STFacing[____exports.STFacing.RIGHT] = "RIGHT"
____exports.STFacing.UP = 5
____exports.STFacing[____exports.STFacing.UP] = "UP"
____exports.STFacing.UP_LEFT = 6
____exports.STFacing[____exports.STFacing.UP_LEFT] = "UP_LEFT"
____exports.STFacing.UP_RIGHT = 7
____exports.STFacing[____exports.STFacing.UP_RIGHT] = "UP_RIGHT"
--- The line splitting behavior of individual characters while auto-wrapping text.
____exports.STSplitterResult = STSplitterResult or ({})
____exports.STSplitterResult.NONE = 0
____exports.STSplitterResult[____exports.STSplitterResult.NONE] = "NONE"
____exports.STSplitterResult.INCLUDE = 1
____exports.STSplitterResult[____exports.STSplitterResult.INCLUDE] = "INCLUDE"
____exports.STSplitterResult.EXCLUDE = 2
____exports.STSplitterResult[____exports.STSplitterResult.EXCLUDE] = "EXCLUDE"
--- A loadable *thing* which caches a value if at least one user is retaining it.
____exports.STAsset = __TS__Class()
local STAsset = ____exports.STAsset
STAsset.name = "STAsset"
function STAsset.prototype.____constructor(self, loader, unloader)
    self.users = {}
    self.value = nil
    self.loader = loader
    self.unloader = unloader
end
function STAsset.prototype.load(self, user)
    if user == nil then
        user = self
    end
    if #self.users == 0 or not __TS__ArrayIncludes(self.users, user) then
        local ____self_users_0 = self.users
        ____self_users_0[#____self_users_0 + 1] = user
    end
    local ____self_1, ____value_2 = self, "value"
    if ____self_1[____value_2] == nil then
        ____self_1[____value_2] = self.loader()
    end
    return self.value
end
function STAsset.prototype.reload(self)
    if self.value ~= nil then
        self.unloader(self.value)
        self.value = self.loader()
    end
end
function STAsset.prototype.unload(self, user)
    if user == nil then
        user = self
    end
    if #self.users == 0 then
        return
    end
    local index = __TS__ArrayIndexOf(self.users, user)
    if index ~= -1 then
        __TS__ArraySplice(self.users, index, 1)
        if #self.users == 0 then
            self.unloader(self.value)
            self.value = nil
        end
    end
end
--- A control system that can switch between navigators as targets. This system is designed primarily for creating multi-level menus.
-- ```ts
-- // create the atlas
-- const atlas = new STAtlas({
--    main_menu: {
--       grid: () => [ [ 'play', 'settings' ], [ 'quit'] ],
--       position: { x: 0, y: 0 },
--       from () {
--          // start rendering menu
--       },
--       to () {
--          // stop rendering menu
--       },
--       next () {
--          // check which grid value is selected
--          switch (atlas.selection()) {
--             case 'play':
--                atlas.switch(null); // close the atlas
--                // play game
--                break;
--             case 'settings':
--                atlas.switch('settings'); // switch to `settings` menu
--                break;
--             case 'quit':
--                atlas.switch(null); // close the atlas
--                // quit game
--                break;
--          }
--       }
--    },
--    settings: {
--       grid: () => [ [ 'music' ], [ 'sound' ], [ 'language' ], [ 'back' ] ],
--       position: { x: 0, y: 0 },
--       from () {
--          // start rendering menu
--       },
--       to () {
--          // stop rendering menu
--       },
--       next () {
--          // check which grid value is selected
--          switch (atlas.selection()) {
--             case 'music':
--                // toggle music
--                break;
--             case 'sound':
--                // toggle sound
--                break;
--             case 'language':
--                // switch language
--                break;
--             case 'back':
--                atlas.prev(); // call `prev()` (as seen below) by way of `atlas.prev()`
--                break;
--          }
--       },
--       prev () {
--          atlas.switch('main_menu'); // return to `main_menu`
--       }
--    }
-- });
-- 
-- // open the atlas to `main_menu`
-- atlas.switch('main_menu');
-- ```
____exports.STAtlas = __TS__Class()
local STAtlas = ____exports.STAtlas
STAtlas.name = "STAtlas"
function STAtlas.prototype.____constructor(self, navigators)
    self.target = nil
    self.navigators = navigators
end
function STAtlas.prototype.next(self)
    if self.target == nil then
        return
    end
    local navigator = self.navigators[self.target]
    local ____opt_4 = navigator.next
    if ____opt_4 ~= nil then
        ____opt_4(navigator, navigator)
    end
end
function STAtlas.prototype.prev(self)
    if self.target == nil then
        return
    end
    local navigator = self.navigators[self.target]
    local ____opt_6 = navigator.prev
    if ____opt_6 ~= nil then
        ____opt_6(navigator, navigator)
    end
end
function STAtlas.prototype.seek(self, facing)
    if self.target == nil then
        return false
    end
    local navigator = self.navigators[self.target]
    local grid = navigator:grid(navigator)
    if #grid == 0 then
        return false
    end
    repeat
        local ____switch19 = facing
        local ____cond19 = ____switch19 == ____exports.STFacing.DOWN
        if ____cond19 then
            do
                if #grid == 1 then
                    return false
                end
                local y = navigator.position.y
                while true do
                    local ____navigator_position_8, ____y_9 = navigator.position, "y"
                    local ____navigator_position_y_10 = ____navigator_position_8[____y_9] + 1
                    ____navigator_position_8[____y_9] = ____navigator_position_y_10
                    if ____navigator_position_y_10 == #grid then
                        navigator.position.y = 0
                    end
                    if #grid[navigator.position.y + 1] > navigator.position.x then
                        break
                    end
                end
                return navigator.position.y ~= y
            end
        end
        ____cond19 = ____cond19 or ____switch19 == ____exports.STFacing.LEFT
        if ____cond19 then
            do
                local subgrid = grid[navigator.position.y + 1]
                if (subgrid and #subgrid) < 2 then
                    return false
                end
                local ____navigator_position_13, ____x_14 = navigator.position, "x"
                local ____navigator_position_x_15 = ____navigator_position_13[____x_14] - 1
                ____navigator_position_13[____x_14] = ____navigator_position_x_15
                if ____navigator_position_x_15 == -1 then
                    navigator.position.x = #subgrid - 1
                end
                return true
            end
        end
        ____cond19 = ____cond19 or ____switch19 == ____exports.STFacing.RIGHT
        if ____cond19 then
            do
                local subgrid = grid[navigator.position.y + 1]
                if #subgrid < 2 then
                    return false
                end
                local ____navigator_position_16, ____x_17 = navigator.position, "x"
                local ____navigator_position_x_18 = ____navigator_position_16[____x_17] + 1
                ____navigator_position_16[____x_17] = ____navigator_position_x_18
                if ____navigator_position_x_18 == #subgrid then
                    navigator.position.x = 0
                end
                return true
            end
        end
        ____cond19 = ____cond19 or ____switch19 == ____exports.STFacing.UP
        if ____cond19 then
            do
                if #grid == 1 then
                    return false
                end
                local y = navigator.position.y
                while true do
                    local ____navigator_position_19, ____y_20 = navigator.position, "y"
                    local ____navigator_position_y_21 = ____navigator_position_19[____y_20] - 1
                    ____navigator_position_19[____y_20] = ____navigator_position_y_21
                    if ____navigator_position_y_21 == -1 then
                        navigator.position.y = #grid - 1
                    end
                    if #grid[navigator.position.y + 1] > navigator.position.x then
                        break
                    end
                end
                return navigator.position.y ~= y
            end
        end
    until true
    return false
end
function STAtlas.prototype.selection(self)
    if self.target == nil then
        return
    end
    local navigator = self.navigators[self.target]
    local list = navigator:grid(navigator)[navigator.position.y + 1]
    if list == nil then
        return
    end
    return list[navigator.position.x + 1]
end
function STAtlas.prototype.switch(self, target)
    local current = self.target
    if target == current then
        return
    end
    if current ~= nil then
        local navigator = self.navigators[current]
        local ____opt_22 = navigator.to
        if ____opt_22 ~= nil then
            ____opt_22(navigator, navigator, target)
        end
    end
    self.target = target
    if target ~= nil then
        local navigator = self.navigators[target]
        local ____opt_24 = navigator.from
        if ____opt_24 ~= nil then
            ____opt_24(navigator, navigator, current)
        end
    end
end
--- An automatable, single-number representable RGB color, with values ranging from `0` to `255` (`0xff`).
____exports.STColor = __TS__Class()
local STColor = ____exports.STColor
STColor.name = "STColor"
function STColor.prototype.____constructor(self, value)
    self.task = nil
    self.red = value.red
    self.green = value.green
    self.blue = value.blue
end
function STColor.prototype.automate(self, duration, ...)
    local points = {...}
    local ____opt_26 = self.task
    if ____opt_26 ~= nil then
        ____opt_26.complete()
    end
    local r = self.red
    local g = self.green
    local b = self.blue
    local ____temp_28 = ____exports.ST:automate(
        duration,
        function(delta)
            self.red = ____exports.ST:bezier(
                delta,
                r,
                unpack(__TS__ArrayMap(
                    points,
                    function(____, point) return point.red or self.red end
                ))
            )
            self.green = ____exports.ST:bezier(
                delta,
                g,
                unpack(__TS__ArrayMap(
                    points,
                    function(____, point) return point.green or self.green end
                ))
            )
            self.blue = ____exports.ST:bezier(
                delta,
                b,
                unpack(__TS__ArrayMap(
                    points,
                    function(____, point) return point.blue or self.blue end
                ))
            )
            if delta == 1 then
                self.task = nil
                return true
            end
            return false
        end
    )
    self.task = ____temp_28
    return ____temp_28
end
__TS__SetDescriptor(
    STColor.prototype,
    "value",
    {
        get = function(self)
            return ____exports.ST:rgb2hex(self.red, self.green, self.blue)
        end,
        set = function(self, value)
            local color = ____exports.ST:hex2rgb(value)
            self.red = color.red
            self.green = color.green
            self.blue = color.blue
        end
    },
    true
)
--- A scene graph element, which can both contain, and be contained by other scene graph elements. A container does nothing on its own, but can be used to group together other scene graph elements like `STSprite` and `STHitbox`.
____exports.STContainer = __TS__Class()
local STContainer = ____exports.STContainer
STContainer.name = "STContainer"
function STContainer.prototype.____constructor(self, ____bindingPattern0)
    if ____bindingPattern0 == nil then
        ____bindingPattern0 = ____exports.ST.empty_table
    end
    local scale
    local rotation
    local priority
    local position
    local metadata
    local color
    local children
    local blend_multiply
    local blend
    local alpha
    alpha = ____bindingPattern0.alpha
    if alpha == nil then
        alpha = 1
    end
    blend = ____bindingPattern0.blend
    if blend == nil then
        blend = ____exports.STBlend.ALPHA
    end
    blend_multiply = ____bindingPattern0.blend_multiply
    if blend_multiply == nil then
        blend_multiply = true
    end
    children = ____bindingPattern0.children
    if children == nil then
        children = ____exports.ST.empty_array
    end
    color = ____bindingPattern0.color
    if color == nil then
        color = 16777215
    end
    metadata = ____bindingPattern0.metadata
    if metadata == nil then
        metadata = nil
    end
    position = ____bindingPattern0.position
    if position == nil then
        position = 0
    end
    priority = ____bindingPattern0.priority
    if priority == nil then
        priority = 0
    end
    rotation = ____bindingPattern0.rotation
    if rotation == nil then
        rotation = 0
    end
    scale = ____bindingPattern0.scale
    if scale == nil then
        scale = 1
    end
    self.children = {}
    self.drawers = {}
    self.parent = nil
    self.tickers = {}
    self.alpha = __TS__New(____exports.STValue, alpha)
    self.blend = blend
    self.blend_multiply = blend_multiply
    self.color = __TS__New(
        ____exports.STColor,
        type(color) == "number" and ____exports.ST:hex2rgb(color) or color
    )
    self.metadata = metadata
    self.position = __TS__New(____exports.STPoint, position)
    self.priority = priority
    self.rotation = __TS__New(____exports.STValue, rotation)
    self.scale = __TS__New(
        ____exports.STPoint,
        type(scale) == "number" and scale or ({x = scale.x or 1, y = scale.y or 1})
    )
    self:attach(unpack(__TS__ArraySlice(children, 0)))
end
function STContainer.prototype.addDrawer(self, script)
    if #self.drawers == 0 or not __TS__ArrayIncludes(self.drawers, script) then
        local ____self_drawers_29 = self.drawers
        ____self_drawers_29[#____self_drawers_29 + 1] = script
    end
    return self
end
function STContainer.prototype.addTicker(self, script)
    if #self.tickers == 0 or not __TS__ArrayIncludes(self.tickers, script) then
        local ____self_tickers_30 = self.tickers
        ____self_tickers_30[#____self_tickers_30 + 1] = script
    end
    return self
end
function STContainer.prototype.attach(self, ...)
    local children = {...}
    for ____, child in ipairs(children) do
        do
            if child.parent == self then
                goto __continue58
            end
            if child.parent ~= nil then
                __TS__ArraySplice(
                    child.parent.children,
                    __TS__ArrayIndexOf(child.parent.children, child),
                    1
                )
            end
            child.parent = self
            local ____self_children_31 = self.children
            ____self_children_31[#____self_children_31 + 1] = child
        end
        ::__continue58::
    end
    return self
end
function STContainer.prototype.cleanup(self)
    for ____, child in ipairs(self.children) do
        child:cleanup()
    end
end
function STContainer.prototype.clear(self)
    return self:detach(unpack(self.children))
end
function STContainer.prototype.detach(self, ...)
    local children = {...}
    for ____, child in ipairs(children) do
        do
            if child.parent ~= self then
                goto __continue67
            end
            child.parent = nil
            __TS__ArraySplice(
                self.children,
                __TS__ArrayIndexOf(self.children, child),
                1
            )
            child:cleanup()
        end
        ::__continue67::
    end
    return self
end
function STContainer.prototype.draw(self)
    love.graphics.push()
    love.graphics.translate(self.position.x, self.position.y)
    love.graphics.rotate(self.rotation.value * (math.pi / 180))
    love.graphics.scale(self.scale.x, self.scale.y)
    local color = {love.graphics.getColor()}
    love.graphics.setColor(color[1] * (self.color.red / 255), color[2] * (self.color.green / 255), color[3] * (self.color.blue / 255), color[4] * self.alpha.value)
    local blend, blend_alpha = love.graphics.getBlendMode()
    repeat
        local ____switch71 = self.blend
        local ____cond71 = ____switch71 == ____exports.STBlend.ADD
        if ____cond71 then
            love.graphics.setBlendMode("add", self.blend_multiply and "alphamultiply" or "premultiplied")
            break
        end
        ____cond71 = ____cond71 or ____switch71 == ____exports.STBlend.ALPHA
        if ____cond71 then
            love.graphics.setBlendMode("alpha", self.blend_multiply and "alphamultiply" or "premultiplied")
            break
        end
        ____cond71 = ____cond71 or ____switch71 == ____exports.STBlend.DARKEN
        if ____cond71 then
            love.graphics.setBlendMode("darken", self.blend_multiply and "alphamultiply" or "premultiplied")
            break
        end
        ____cond71 = ____cond71 or ____switch71 == ____exports.STBlend.LIGHTEN
        if ____cond71 then
            love.graphics.setBlendMode("lighten", self.blend_multiply and "alphamultiply" or "premultiplied")
            break
        end
        ____cond71 = ____cond71 or ____switch71 == ____exports.STBlend.MULTIPLY
        if ____cond71 then
            love.graphics.setBlendMode("multiply", self.blend_multiply and "alphamultiply" or "premultiplied")
            break
        end
        ____cond71 = ____cond71 or ____switch71 == ____exports.STBlend.REPLACE
        if ____cond71 then
            love.graphics.setBlendMode("replace", self.blend_multiply and "alphamultiply" or "premultiplied")
            break
        end
        ____cond71 = ____cond71 or ____switch71 == ____exports.STBlend.SCREEN
        if ____cond71 then
            love.graphics.setBlendMode("screen", self.blend_multiply and "alphamultiply" or "premultiplied")
            break
        end
        ____cond71 = ____cond71 or ____switch71 == ____exports.STBlend.SUBTRACT
        if ____cond71 then
            love.graphics.setBlendMode("subtract", self.blend_multiply and "alphamultiply" or "premultiplied")
            break
        end
    until true
    local results = {}
    for ____, script in ipairs(__TS__ArraySlice(self.drawers)) do
        results[#results + 1] = script(self)
    end
    self:draw_self()
    if #self.children ~= 0 then
        __TS__ArrayPushArray(____exports.ST.empty_array, self.children)
        table.sort(
            ____exports.ST.empty_array,
            function(a, b) return a.priority < b.priority end
        )
        for ____, child in ipairs(__TS__ArraySplice(____exports.ST.empty_array, 0)) do
            child:draw()
        end
    end
    local index = #results
    while true do
        local ____index_34 = index
        index = ____index_34 - 1
        if not (____index_34 ~= 0) then
            break
        end
        local ____opt_32 = results[index + 1]
        if ____opt_32 ~= nil then
            ____opt_32()
        end
    end
    love.graphics.setBlendMode(blend, blend_alpha)
    love.graphics.setColor(color)
    love.graphics.pop()
end
function STContainer.prototype.draw_self(self)
end
function STContainer.prototype.isolate(self)
    local ____opt_35 = self.parent
    return ____opt_35 and ____opt_35:detach(self)
end
function STContainer.prototype.removeDrawer(self, script)
    if #self.drawers ~= 0 then
        local index = __TS__ArrayIndexOf(self.drawers, script)
        if index ~= -1 then
            __TS__ArraySplice(self.drawers, index, 1)
        end
    end
    return self
end
function STContainer.prototype.removeTicker(self, script)
    if #self.tickers ~= 0 then
        local index = __TS__ArrayIndexOf(self.tickers, script)
        if index ~= -1 then
            __TS__ArraySplice(self.tickers, index, 1)
        end
    end
    return self
end
STContainer.prototype.scan = __TS__Generator(function(self, filter)
    if filter == nil then
        filter = true
    end
    if filter == true or filter(self) then
        coroutine.yield(self)
    end
    for ____, child in ipairs({unpack(self.children)}) do
        __TS__DelegatedYield(child:scan(filter))
    end
end)
function STContainer.prototype.tick(self)
    local results = {}
    for ____, script in ipairs(__TS__ArraySlice(self.tickers)) do
        results[#results + 1] = script(self)
    end
    self:tick_self()
    if #self.children ~= 0 then
        __TS__ArrayPushArray(____exports.ST.empty_array, self.children)
        for ____, child in ipairs(__TS__ArraySplice(____exports.ST.empty_array, 0)) do
            child:tick()
        end
    end
    local index = #results
    while true do
        local ____index_39 = index
        index = ____index_39 - 1
        if not (____index_39 ~= 0) then
            break
        end
        local ____opt_37 = results[index + 1]
        if ____opt_37 ~= nil then
            ____opt_37()
        end
    end
end
function STContainer.prototype.tick_self(self)
end
--- A system for playing and managing audio.
-- ```ts
-- // make a new daemon
-- const daemon = new STDaemon('dist/test.ogg', {
--    gain: 0.5,
--    rate: 0.8,
--    loop: true
-- });
-- 
-- // start playback (use instance_forced to ensure the audio starts)
-- const inst = daemon.instance_forced();
-- 
-- // wait for some time (100 frames)
-- ST.pause(100).then(() => {
--    // stop playback
--    inst.stop();
-- });
-- 
-- // a hypothetical event function which may be called multiple times during one frame
-- function gameEvent () {
--    // instance() ensures the daemon can't create two instances during one frame
--    daemon.instance({
--       // multiplied with daemon gain of 0.5, resulting in 0.25 gain on playback
--       gain: 0.5,
--       // multiplied with daemon rate of 0.8, resulting in 0.6 rate on playback
--       rate: 0.75,
--       // overrides the daemon's loop property
--       loop: false
--    });
-- };
-- ```
____exports.STDaemon = __TS__Class()
local STDaemon = ____exports.STDaemon
STDaemon.name = "STDaemon"
function STDaemon.prototype.____constructor(self, source, ____bindingPattern0)
    if ____bindingPattern0 == nil then
        ____bindingPattern0 = ____exports.ST.empty_table
    end
    local rate
    local position
    local pass
    local mixer
    local loop
    local gain
    local effects
    effects = ____bindingPattern0.effects
    if effects == nil then
        effects = {}
    end
    gain = ____bindingPattern0.gain
    if gain == nil then
        gain = 1
    end
    loop = ____bindingPattern0.loop
    if loop == nil then
        loop = false
    end
    mixer = ____bindingPattern0.mixer
    if mixer == nil then
        mixer = __TS__New(____exports.STValue)
    end
    pass = ____bindingPattern0.pass
    if pass == nil then
        pass = 1
    end
    position = ____bindingPattern0.position
    if position == nil then
        position = 0
    end
    rate = ____bindingPattern0.rate
    if rate == nil then
        rate = 1
    end
    self.instances = {}
    self.last_player = nil
    self.effects = effects
    self.gain = gain
    self.loop = loop
    self.mixer = mixer
    self.pass = pass
    self.position = position
    self.rate = rate
    self.source = source
end
function STDaemon.prototype.instance(self, properties)
    if self.last_player == ____exports.ST.time then
        return
    end
    self.last_player = ____exports.ST.time
    return __TS__New(____exports.STInstance, self, properties)
end
function STDaemon.prototype.instance_forced(self, properties)
    self.last_player = ____exports.ST.time
    return __TS__New(____exports.STInstance, self, properties)
end
function STDaemon.prototype.stop(self)
    local index = #self.instances
    while true do
        local ____index_40 = index
        index = ____index_40 - 1
        if not (____index_40 ~= 0) then
            break
        end
        self.instances[index + 1]:stop()
    end
end
--- Handles user input in a logical way.
-- ```ts
-- // create an input from the spacebar
-- const input = new STInput([ () => love.keyboard.isDown('space') ]);
-- 
-- // add a handler for pressing the spacebar
-- input.addDown(() => {
--    // perform an action
-- });
-- 
-- // add a handler which fires every tick the spacebar is held
-- input.addHold(() => {
--    // perform an action perpetually
-- });
-- 
-- // add a handler for releasing the spacebar
-- input.addUp(() => {
--    // stop performing an action, perhaps?
-- });
-- 
-- // create an input with multiple sources (up arrow, W, and primary mouse button)
-- const input = new STInput([
--    () => love.keyboard.isDown('up'),
--    () => love.keyboard.isDown('w'),
--    () => love.mouse.isDown(1)
-- ]);
-- 
-- // add a handler for activating an input (pressing up or w, clicking the primary mouse button)
-- input.addDown(index => {
--    switch (index) {
--       case 0:
--          // up was pressed
--          break;
--       case 1:
--          // w was pressed
--          break;
--       case 2:
--          // primary mouse button was clicked
--          break;
--    }
-- });
-- 
-- // check if an input is being held during some other hypothetical code
-- const gameEvent = () => {
--    if (input.held) {
--       // perform an action
--    } else {
--       // you've really got to stop performing these actions, mate
--    }
-- };
-- ```
____exports.STInput = __TS__Class()
local STInput = ____exports.STInput
STInput.name = "STInput"
function STInput.prototype.____constructor(self, sources)
    self.buffer = false
    self.downs = {}
    self.held = false
    self.holds = {}
    self.queue = {}
    self.sources = {}
    self.state = {}
    self.ups = {}
    self.sources = sources
end
function STInput.prototype.addDown(self, listener)
    if #self.downs == 0 or not __TS__ArrayIncludes(self.downs, listener) then
        local ____self_downs_41 = self.downs
        ____self_downs_41[#____self_downs_41 + 1] = listener
    end
    return self
end
function STInput.prototype.addHold(self, listener)
    if #self.holds == 0 or not __TS__ArrayIncludes(self.holds, listener) then
        local ____self_holds_42 = self.holds
        ____self_holds_42[#____self_holds_42 + 1] = listener
    end
    return self
end
function STInput.prototype.addUp(self, listener)
    if #self.ups == 0 or not __TS__ArrayIncludes(self.ups, listener) then
        local ____self_ups_43 = self.ups
        ____self_ups_43[#____self_ups_43 + 1] = listener
    end
    return self
end
function STInput.prototype.fire(self)
    if #self.queue ~= 0 then
        for ____, ____value in ipairs(__TS__ArraySplice(self.queue, 0)) do
            local index = ____value[1]
            local value = ____value[2]
            repeat
                local ____switch115 = value
                local ____cond115 = ____switch115 == 0
                if ____cond115 then
                    for ____, down in ipairs(self.downs) do
                        down(self, index)
                    end
                    break
                end
                ____cond115 = ____cond115 or ____switch115 == 1
                if ____cond115 then
                    for ____, down in ipairs(self.downs) do
                        down(self, index)
                    end
                    for ____, up in ipairs(self.ups) do
                        up(self, index)
                    end
                    break
                end
                ____cond115 = ____cond115 or ____switch115 == 2
                if ____cond115 then
                    for ____, up in ipairs(self.ups) do
                        up(self, index)
                    end
                    break
                end
                ____cond115 = ____cond115 or ____switch115 == 3
                if ____cond115 then
                    for ____, up in ipairs(self.ups) do
                        up(self, index)
                    end
                    break
                end
            until true
        end
    end
    if self.buffer then
        self.buffer = false
        self.held = true
        for ____, hold in ipairs(self.holds) do
            hold(self)
        end
    else
        self.held = false
    end
end
function STInput.prototype.removeDown(self, listener)
    if #self.downs ~= 0 then
        local index = __TS__ArrayIndexOf(self.downs, listener)
        if index ~= -1 then
            __TS__ArraySplice(self.downs, index, 1)
        end
    end
    return self
end
function STInput.prototype.removeHold(self, listener)
    if #self.holds ~= 0 then
        local index = __TS__ArrayIndexOf(self.holds, listener)
        if index ~= -1 then
            __TS__ArraySplice(self.holds, index, 1)
        end
    end
    return self
end
function STInput.prototype.removeUp(self, listener)
    if #self.ups ~= 0 then
        local index = __TS__ArrayIndexOf(self.ups, listener)
        if index ~= -1 then
            __TS__ArraySplice(self.ups, index, 1)
        end
    end
    return self
end
function STInput.prototype.update(self)
    for ____, ____value in __TS__Iterator(__TS__ArrayEntries(self.sources)) do
        local index = ____value[1]
        local source = ____value[2]
        do
            if source() then
                self.buffer = true
                if #self.state == 0 or not __TS__ArrayIncludes(self.state, index) then
                    local ____self_state_44 = self.state
                    ____self_state_44[#____self_state_44 + 1] = index
                    if #self.queue ~= 0 then
                        local down = false
                        for ____, event in ipairs(self.queue) do
                            if event[1] == index then
                                down = true
                                if event[2] == 2 then
                                    event[2] = 3
                                end
                                break
                            end
                        end
                        if down then
                            goto __continue141
                        end
                    end
                    local ____self_queue_45 = self.queue
                    ____self_queue_45[#____self_queue_45 + 1] = {index, 0}
                end
            elseif #self.state ~= 0 and __TS__ArrayIncludes(self.state, index) then
                __TS__ArraySplice(
                    self.state,
                    __TS__ArrayIndexOf(self.state, index),
                    1
                )
                if #self.queue ~= 0 then
                    local up = false
                    for ____, event in ipairs(self.queue) do
                        if event[1] == index then
                            up = true
                            if event[2] == 0 then
                                event[2] = 1
                            end
                            break
                        end
                    end
                    if up then
                        goto __continue141
                    end
                end
                local ____self_queue_46 = self.queue
                ____self_queue_46[#____self_queue_46 + 1] = {index, 2}
            end
        end
        ::__continue141::
    end
end
--- A control wrapper around an audio source, created with an `STDaemon`.
____exports.STInstance = __TS__Class()
local STInstance = ____exports.STInstance
STInstance.name = "STInstance"
function STInstance.prototype.____constructor(self, daemon, ____bindingPattern0)
    if ____bindingPattern0 == nil then
        ____bindingPattern0 = ____exports.ST.empty_table
    end
    local rate
    local position
    local pass
    local mixer
    local loop
    local gain
    local effects
    local autoplay
    autoplay = ____bindingPattern0.autoplay
    if autoplay == nil then
        autoplay = true
    end
    effects = ____bindingPattern0.effects
    if effects == nil then
        effects = daemon.effects
    end
    gain = ____bindingPattern0.gain
    if gain == nil then
        gain = 1
    end
    loop = ____bindingPattern0.loop
    if loop == nil then
        loop = daemon.loop
    end
    mixer = ____bindingPattern0.mixer
    if mixer == nil then
        mixer = daemon.mixer
    end
    pass = ____bindingPattern0.pass
    if pass == nil then
        pass = daemon.pass
    end
    position = ____bindingPattern0.position
    if position == nil then
        position = daemon.position
    end
    rate = ____bindingPattern0.rate
    if rate == nil then
        rate = 1
    end
    self.active_value = false
    self.pass = __TS__New(
        ____exports.STValueLinked,
        function() return self.pass_value end,
        function(value)
            self.pass_value = value
            self:access(function(audio) return audio:setFilter({type = "bandpass", volume = value}) end)
        end
    )
    self.position = __TS__New(
        ____exports.STValueLinked,
        function() return self:access(
            function(audio) return audio:tell() end,
            self.position_value
        ) end,
        function(value)
            self.position_value = value
            self:access(function(audio) return audio:seek(value) end)
        end
    )
    self.position_value = 0
    if type(daemon.source) == "string" then
        self.audio = love.audio.newSource(daemon.source, "stream")
    else
        self.audio = love.audio.newSource(daemon.source:load(self))
    end
    self.daemon = daemon
    self.effects = effects
    self.gain = __TS__New(____exports.STValue, gain)
    self.loop_value = loop
    self.mixer = mixer
    self.pass_value = pass
    self.rate = __TS__New(____exports.STValue, rate)
    for ____, effect in ipairs(effects) do
        self.audio:setEffect(effect)
    end
    self.audio:setLooping(loop)
    self.audio:seek(position)
    local ____daemon_instances_47 = daemon.instances
    ____daemon_instances_47[#____daemon_instances_47 + 1] = self
    local ____exports_ST_instances_48 = ____exports.ST.instances
    ____exports_ST_instances_48[#____exports_ST_instances_48 + 1] = self
    self:update()
    if autoplay then
        self.active_value = true
        self.audio:play()
    end
end
function STInstance.prototype.access(self, callback, placeholder)
    do
        local function ____catch()
            return true, placeholder
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            return true, callback(self.audio)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch()
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function STInstance.prototype.stop(self)
    do
        pcall(function()
            self.audio:stop()
            self.audio:release()
        end)
    end
    __TS__ArraySplice(
        self.daemon.instances,
        __TS__ArrayIndexOf(self.daemon.instances, self),
        1
    )
    if type(self.daemon.source) ~= "string" then
        self.daemon.source:unload(self)
    end
    __TS__ArraySplice(
        ____exports.ST.instances,
        __TS__ArrayIndexOf(____exports.ST.instances, self),
        1
    )
end
function STInstance.prototype.update(self)
    do
        pcall(function()
            if self.active_value and not self.audio:isPlaying() then
                self:stop()
            else
                self.audio:setPitch(self.rate.value * self.daemon.rate * ____exports.ST.speed)
                self.audio:setVolume(self.gain.value * self.daemon.gain * self.mixer.value)
                self.position_value = self.audio:tell()
            end
        end)
    end
end
__TS__SetDescriptor(
    STInstance.prototype,
    "active",
    {
        get = function(self)
            return self.active_value
        end,
        set = function(self, value)
            self.active_value = value
            if value then
                self:access(function(audio) return audio:play() end)
            else
                self:access(function(audio) return audio:pause() end)
            end
        end
    },
    true
)
__TS__SetDescriptor(
    STInstance.prototype,
    "loop",
    {
        get = function(self)
            return self.loop_value
        end,
        set = function(self, value)
            self.loop_value = value
            self:access(function(audio) return audio:setLooping(value) end)
        end
    },
    true
)
____exports.STInterpolator = __TS__Class()
local STInterpolator = ____exports.STInterpolator
STInterpolator.name = "STInterpolator"
function STInterpolator.prototype.____constructor(self, ...)
    local events = {...}
    self.events = events
end
function STInterpolator.prototype.resolve(self, time, offset, events)
    if offset == nil then
        offset = 0
    end
    if events == nil then
        events = self.events
    end
    local value = 0
    for ____, event in ipairs(events) do
        for ____, start in ipairs(event.starts) do
            do
                if time - offset < start or time - offset > start + event.duration then
                    goto __continue193
                end
                if type(event.resolve) == "function" then
                    value = value + event.resolve((time - offset - start) / event.duration, time)
                else
                    value = value + self:resolve(time, offset + start, event.resolve)
                end
            end
            ::__continue193::
        end
    end
    return value
end
____exports.STPager = __TS__Class()
local STPager = ____exports.STPager
STPager.name = "STPager"
function STPager.prototype.____constructor(self, random, storage)
    self.random = random
    self.storage = storage
end
function STPager.prototype.create(self, ____type, ...)
    local pages = {...}
    repeat
        local ____switch201 = ____type
        local ____cond201 = ____switch201 == 0
        if ____cond201 then
            return function(key, ...)
                if not (self.storage[key] ~= nil) then
                    self.storage[key] = 0
                end
                local ____pages_53 = pages
                local ____temp_52
                if self.storage[key] == #pages - 1 then
                    ____temp_52 = self.storage[key]
                else
                    local ____self_storage_49, ____key_50 = self.storage, key
                    local ____self_storage_key_51 = ____self_storage_49[____key_50]
                    ____self_storage_49[____key_50] = ____self_storage_key_51 + 1
                    ____temp_52 = ____self_storage_key_51
                end
                local page = ____pages_53[____temp_52 + 1]
                return type(page) == "function" and page(...) or page
            end
        end
        ____cond201 = ____cond201 or ____switch201 == 1
        if ____cond201 then
            return function(key, ...)
                if not (self.storage[key] ~= nil) then
                    self.storage[key] = 0
                end
                local ____temp_54 = self.storage[key] == #pages
                if ____temp_54 then
                    self.storage[key] = 0
                    ____temp_54 = 0
                end
                local ____pages_58 = pages
                local ____self_storage_55, ____key_56 = self.storage, key
                local ____self_storage_key_57 = ____self_storage_55[____key_56]
                ____self_storage_55[____key_56] = ____self_storage_key_57 + 1
                local page = ____pages_58[____self_storage_key_57 + 1]
                return type(page) == "function" and page(...) or page
            end
        end
        ____cond201 = ____cond201 or ____switch201 == 2
        if ____cond201 then
            return function(key, ...)
                local page = pages[self.random:int(#pages) + 1]
                return type(page) == "function" and page(...) or page
            end
        end
    until true
end
____exports.STPoint = __TS__Class()
local STPoint = ____exports.STPoint
STPoint.name = "STPoint"
function STPoint.prototype.____constructor(self, arg1, arg2)
    if arg1 == nil then
        arg1 = 0
    end
    if arg2 == nil then
        arg2 = arg1
    end
    self.task = nil
    if type(arg1) == "number" then
        self.x = arg1
        self.y = arg2
    else
        self.x = arg1.x or 0
        self.y = arg1.y or 0
    end
end
function STPoint.prototype.abs(self)
    return __TS__New(
        ____exports.STPoint,
        math.abs(self.x),
        math.abs(self.y)
    )
end
function STPoint.prototype.add(self, arg1, arg2)
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        return __TS__New(____exports.STPoint, self.x + arg1, self.y + arg2)
    else
        return self:add(arg1.x or 0, arg1.y or 0)
    end
end
function STPoint.prototype.angle(self, arg1, arg2)
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        if self.y == arg2 then
            if self.x < arg1 then
                return 0
            else
                return 180
            end
        elseif self.x == arg1 then
            if self.y < arg2 then
                return 90
            else
                return 270
            end
        else
            return math.atan2(arg2 - self.y, arg1 - self.x) * (180 / math.pi)
        end
    else
        return self:angle(arg1.x or self.x, arg1.y or self.y)
    end
end
function STPoint.prototype.automate(self, duration, ...)
    local points = {...}
    local ____opt_59 = self.task
    if ____opt_59 ~= nil then
        ____opt_59.complete()
    end
    local x = self.x
    local y = self.y
    local ____temp_61 = ____exports.ST:automate(
        duration,
        function(delta)
            self.x = ____exports.ST:bezier(
                delta,
                x,
                unpack(__TS__ArrayMap(
                    points,
                    function(____, point) return type(point) == "number" and point or (point.x or self.x) end
                ))
            )
            self.y = ____exports.ST:bezier(
                delta,
                y,
                unpack(__TS__ArrayMap(
                    points,
                    function(____, point) return type(point) == "number" and point or (point.y or self.y) end
                ))
            )
            if delta == 1 then
                self.task = nil
                return true
            end
            return false
        end
    )
    self.task = ____temp_61
    return ____temp_61
end
function STPoint.prototype.ceil(self, arg1, arg2)
    if arg1 == nil then
        arg1 = 1
    end
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        return __TS__New(
            ____exports.STPoint,
            math.ceil(self.x * arg1) / arg1,
            math.ceil(self.y * arg2) / arg2
        )
    else
        return self:ceil(arg1.x or 1, arg1.y or 1)
    end
end
function STPoint.prototype.clamp(self, min, max)
    return __TS__New(
        ____exports.STPoint,
        math.min(
            math.max(
                self.x,
                type(min) == "number" and min or (min.x or -math.huge)
            ),
            type(max) == "number" and max or (max.x or math.huge)
        ),
        math.min(
            math.max(
                self.y,
                type(min) == "number" and min or (min.y or -math.huge)
            ),
            type(max) == "number" and max or (max.y or math.huge)
        )
    )
end
function STPoint.prototype.clone(self)
    return __TS__New(____exports.STPoint, self)
end
function STPoint.prototype.distance(self, arg1, arg2)
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        if self.x == arg1 then
            return math.abs(arg2 - self.y)
        elseif self.y == arg2 then
            return math.abs(arg1 - self.x)
        else
            return math.sqrt((arg1 - self.x) ^ 2 + (arg2 - self.y) ^ 2)
        end
    else
        return self:distance(arg1.x or self.x, arg1.y or self.y)
    end
end
function STPoint.prototype.divide(self, arg1, arg2)
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        return __TS__New(____exports.STPoint, self.x / arg1, self.y / arg2)
    else
        return self:divide(arg1.x or 1, arg1.y or 1)
    end
end
function STPoint.prototype.floor(self, arg1, arg2)
    if arg1 == nil then
        arg1 = 1
    end
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        return __TS__New(
            ____exports.STPoint,
            math.floor(self.x * arg1) / arg1,
            math.floor(self.y * arg2) / arg2
        )
    else
        return self:floor(arg1.x or 1, arg1.y or 1)
    end
end
function STPoint.prototype.multiply(self, arg1, arg2)
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        return __TS__New(____exports.STPoint, self.x * arg1, self.y * arg2)
    else
        return self:multiply(arg1.x or 1, arg1.y or 1)
    end
end
function STPoint.prototype.round(self, arg1, arg2)
    if arg1 == nil then
        arg1 = 1
    end
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        return __TS__New(
            ____exports.STPoint,
            math.floor(self.x * arg1 + 0.5) / arg1,
            math.floor(self.y * arg2 + 0.5) / arg2
        )
    else
        return self:round(arg1.x or 1, arg1.y or 1)
    end
end
function STPoint.prototype.set(self, arg1, arg2)
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        self.x = arg1
        self.y = arg2
        return self
    else
        return self:set(arg1.x or self.x, arg1.y or self.y)
    end
end
function STPoint.prototype.step(self, speed, ...)
    local points = {...}
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        for ____, point in ipairs(points) do
            if type(point) == "number" then
                __TS__Await(self:automate(
                    math.floor(self:distance(point) / speed + 0.5),
                    point
                ))
            else
                __TS__Await(self:automate(
                    math.floor(self:distance(point.x or self.x, point.y or self.y) / speed + 0.5),
                    point
                ))
            end
        end
    end)
end
function STPoint.prototype.subtract(self, arg1, arg2)
    if arg2 == nil then
        arg2 = arg1
    end
    if type(arg1) == "number" then
        return __TS__New(____exports.STPoint, self.x - arg1, self.y - arg2)
    else
        return self:subtract(arg1.x or 0, arg1.y or 0)
    end
end
____exports.STStorage = __TS__Class()
local STStorage = ____exports.STStorage
STStorage.name = "STStorage"
function STStorage.prototype.____constructor(self, file)
    self.entries = nil
    self.file = file
end
function STStorage.prototype.get(self, key)
    self:load()
    for ____, entry in ipairs(self.entries) do
        if entry[1] == key then
            return entry[2]
        end
    end
    return nil
end
STStorage.prototype.keys = __TS__Generator(function(self)
    self:load()
    for ____, entry in __TS__Iterator(__TS__ArrayEntries(self.entries)) do
        coroutine.yield(entry[2][1])
    end
end)
function STStorage.prototype.load(self)
    if self.entries ~= nil then
        return
    end
    local ____opt_62 = love.filesystem.getInfo(self.file)
    local ____type = ____opt_62 and ____opt_62.type
    if ____type ~= "file" then
        self.entries = {}
    else
        self.entries = __TS__ArrayMap(
            __TS__ArrayFilter(
                __TS__StringSplit((love.filesystem.read("string", self.file)), "\n"),
                function(____, a) return a ~= "" end
            ),
            function(____, a)
                local index = (string.find(a, "=", nil, true) or 0) - 1
                local value = __TS__StringSlice(a, index + 1)
                return {
                    __TS__StringSlice(a, 0, index),
                    value == "Infinity" and math.huge or (value == "-Infinity" and -math.huge or ____exports.ST:decode(value))
                }
            end
        )
    end
end
function STStorage.prototype.save(self)
    if self.entries == nil then
        return
    end
    local ____opt_64 = love.filesystem.getInfo(self.file)
    local ____type = ____opt_64 and ____opt_64.type
    if ____type == nil or ____type == "file" then
        local data = table.concat(
            __TS__ArrayMap(
                self.entries,
                function(____, ____bindingPattern0)
                    local value
                    local key
                    key = ____bindingPattern0[1]
                    value = ____bindingPattern0[2]
                    return (key .. "=") .. (value == math.huge and "Infinity" or (value == -math.huge and "-Infinity" or ____exports.ST:encode(value)))
                end
            ),
            "\n"
        )
        for ____, file in ipairs(____exports.ST.disk.files) do
            if file[1] == self.file then
                file[2] = data
                return
            end
        end
        local ____exports_ST_disk_files_66 = ____exports.ST.disk.files
        ____exports_ST_disk_files_66[#____exports_ST_disk_files_66 + 1] = {self.file, data}
    end
end
function STStorage.prototype.set(self, key, value)
    if value == nil then
        if self.entries ~= nil then
            for ____, entry in __TS__Iterator(__TS__ArrayEntries(self.entries)) do
                if entry[2][1] == key then
                    __TS__ArraySplice(self.entries, entry[1], 1)
                    self:save()
                    return
                end
            end
        end
    else
        self:load()
        for ____, entry in ipairs(self.entries) do
            if entry[1] == key then
                entry[2] = value
                self:save()
                return
            end
        end
        local ____self_entries_67 = self.entries
        ____self_entries_67[#____self_entries_67 + 1] = {key, value}
        self:save()
    end
end
function STStorage.prototype.unload(self, save)
    if save == nil then
        save = false
    end
    if self.entries == nil then
        return
    end
    if save then
        self:save()
    end
    self.entries = nil
end
STStorage.prototype.values = __TS__Generator(function(self)
    self:load()
    for ____, entry in __TS__Iterator(__TS__ArrayEntries(self.entries)) do
        coroutine.yield(entry[2][2])
    end
end)
____exports.STTyper = __TS__Class()
local STTyper = ____exports.STTyper
STTyper.name = "STTyper"
function STTyper.prototype.____constructor(self, ____bindingPattern0)
    if ____bindingPattern0 == nil then
        ____bindingPattern0 = ____exports.ST.empty_table
    end
    local variables
    local receiver
    local placeholder
    local interval
    local functions
    local formatter
    local chunk
    chunk = ____bindingPattern0.chunk
    if chunk == nil then
        chunk = 1
    end
    formatter = ____bindingPattern0.formatter
    if formatter == nil then
        formatter = nil
    end
    functions = ____bindingPattern0.functions
    if functions == nil then
        functions = {}
    end
    interval = ____bindingPattern0.interval
    if interval == nil then
        interval = 1
    end
    placeholder = ____bindingPattern0.placeholder
    if placeholder == nil then
        placeholder = "\0"
    end
    receiver = ____bindingPattern0.receiver
    if receiver == nil then
        receiver = nil
    end
    variables = ____bindingPattern0.variables
    if variables == nil then
        variables = {}
    end
    self.content = ""
    self.task = nil
    self.chunk = chunk
    self.formatter = formatter
    self.functions = functions
    self.interval = interval
    self.placeholder = placeholder
    self.receiver = receiver
    self.variables = variables
end
function STTyper.prototype.text(self, content)
    while __TS__StringAccess(content, 0) == "<" do
        local ____end = (string.find(content, ">", nil, true) or 0) - 1
        local key, value = unpack(__TS__StringSplit(
            __TS__StringSlice(content, 1, ____end),
            ":"
        ))
        if value == nil then
            value = ""
        end
        if self.functions[key] ~= nil then
            self.functions[key](self, value)
        end
        content = __TS__StringSlice(content, ____end + 1)
    end
    while true do
        local start = (string.find(content, "[", nil, true) or 0) - 1
        if start == -1 then
            break
        end
        local ____end = (string.find(content, "]", nil, true) or 0) - 1
        local code = __TS__StringSlice(content, start + 2, ____end)
        local value = ""
        repeat
            local ____switch306 = __TS__StringAccess(content, start + 1)
            local ____cond306 = ____switch306 == "%"
            if ____cond306 then
                if self.variables[code] ~= nil then
                    value = self.variables[code]
                end
                break
            end
            ____cond306 = ____cond306 or ____switch306 == "^"
            if ____cond306 then
                do
                    local count = code
                    while true do
                        local ____count_68 = count
                        count = ____count_68 - 1
                        if not (____count_68 ~= 0) then
                            break
                        end
                        value = value .. self.placeholder
                    end
                    break
                end
            end
        until true
        content = (__TS__StringSlice(content, 0, start) .. value) .. __TS__StringSlice(content, ____end + 1)
    end
    if self.formatter ~= nil then
        content = self.formatter(content)
    end
    local ____opt_69 = self.task
    if ____opt_69 ~= nil then
        ____opt_69.complete()
    end
    local index = 0
    local interval = 0
    local text_length = utf8.len(content)
    local task = ____exports.ST:task()
    local ____exports_ST_scripts_71 = ____exports.ST.scripts
    ____exports_ST_scripts_71[#____exports_ST_scripts_71 + 1] = function()
        if not task.active then
            return true
        end
        if interval == 0 then
            interval = self.interval
            local chunk = ""
            local index_chunk = 0
            while index < text_length and index_chunk < self.chunk do
                local offs = utf8.offset(content, index + 1) - 1
                local char = __TS__StringSlice(
                    content,
                    offs,
                    utf8.offset(content, index + 2) - 1
                )
                index = index + 1
                if char == "{" then
                    local offs = utf8.offset(content, index + 1) - 1
                    local code = __TS__StringSlice(
                        content,
                        offs,
                        (string.find(
                            content,
                            "}",
                            math.max(offs + 1, 1),
                            true
                        ) or 0) - 1
                    )
                    index = index + (utf8.len(code) + 1)
                    self.content = self.content .. ("{" .. code) .. "}"
                else
                    chunk = chunk .. char
                    index_chunk = index_chunk + 1
                    self.content = self.content .. char
                end
            end
            if self.receiver ~= nil and index_chunk ~= 0 then
                self.receiver(chunk)
            end
        end
        interval = interval - 1
        if index < text_length then
            return false
        end
        self.task = nil
        task.complete()
        return true
    end
    self.task = task
    return task
end
____exports.STValue = __TS__Class()
local STValue = ____exports.STValue
STValue.name = "STValue"
function STValue.prototype.____constructor(self, value)
    if value == nil then
        value = 0
    end
    self.task = nil
    self.value = value
end
function STValue.prototype.automate(self, duration, ...)
    local points = {...}
    local ____opt_72 = self.task
    if ____opt_72 ~= nil then
        ____opt_72.complete()
    end
    local v = self.value
    local ____temp_74 = ____exports.ST:automate(
        duration,
        function(delta)
            self.value = ____exports.ST:bezier(
                delta,
                v,
                unpack(points)
            )
            if delta == 1 then
                self.task = nil
                return true
            end
            return false
        end
    )
    self.task = ____temp_74
    return ____temp_74
end
function STValue.prototype.step(self, speed, ...)
    local points = {...}
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        for ____, point in ipairs(points) do
            __TS__Await(self:automate(
                math.abs(point - self.value) / speed,
                point
            ))
        end
    end)
end
____exports.STValueLinked = __TS__Class()
local STValueLinked = ____exports.STValueLinked
STValueLinked.name = "STValueLinked"
function STValueLinked.prototype.____constructor(self, getter, setter)
    self.task = nil
    self.getter = getter
    self.setter = setter
end
function STValueLinked.prototype.automate(self, duration, ...)
    local points = {...}
    local ____opt_75 = self.task
    if ____opt_75 ~= nil then
        ____opt_75.complete()
    end
    local v = self.getter()
    local ____temp_77 = ____exports.ST:automate(
        duration,
        function(delta)
            self.setter(____exports.ST:bezier(
                delta,
                v,
                unpack(points)
            ))
            if delta == 1 then
                self.task = nil
                return true
            end
            return false
        end
    )
    self.task = ____temp_77
    return ____temp_77
end
function STValueLinked.prototype.step(self, speed, ...)
    local points = {...}
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        for ____, point in ipairs(points) do
            __TS__Await(self:automate(
                math.abs(point - self.getter()) / speed,
                point
            ))
        end
    end)
end
__TS__SetDescriptor(
    STValueLinked.prototype,
    "value",
    {
        get = function(self)
            return self.getter()
        end,
        set = function(self, value)
            self.setter(value)
        end
    },
    true
)
____exports.STValueRandom = __TS__Class()
local STValueRandom = ____exports.STValueRandom
STValueRandom.name = "STValueRandom"
function STValueRandom.prototype.____constructor(self, low, high, get, set)
    self.generator = love.math.newRandomGenerator(low, high)
    self.getter = get
    self.setter = set
end
function STValueRandom.prototype.int(self, limit)
    return math.floor(self:next() * limit)
end
function STValueRandom.prototype.next(self)
    local value = self.value
    self.setter(self.generator:getState())
    return value
end
__TS__SetDescriptor(
    STValueRandom.prototype,
    "value",
    {get = function(self)
        local state = self.getter()
        if state ~= nil then
            self.generator:setState(state)
        end
        return self.generator:random()
    end},
    true
)
____exports.STAudio = __TS__Class()
local STAudio = ____exports.STAudio
STAudio.name = "STAudio"
__TS__ClassExtends(STAudio, ____exports.STAsset)
function STAudio.prototype.____constructor(self, source)
    STAudio.____super.prototype.____constructor(
        self,
        function() return love.sound.newSoundData(self.source) end,
        function(value) return value:release() end
    )
    self.source = source
end
function STAudio.prototype.swap(self, source)
    self.source = source
    self:reload()
end
____exports.STFont = __TS__Class()
local STFont = ____exports.STFont
STFont.name = "STFont"
__TS__ClassExtends(STFont, ____exports.STAsset)
function STFont.prototype.____constructor(self, source_data, source_image)
    STFont.____super.prototype.____constructor(
        self,
        function()
            local ____string = (love.filesystem.read("string", self.source_data))
            if ____string == nil then
                error("MISSING " .. self.source_data, 0)
            end
            local array = __TS__ArrayFilter(
                __TS__StringSplit(____string, "\n"),
                function(____, a) return a ~= "" end
            )
            return {
                {
                    array[1],
                    __TS__ObjectFromEntries(__TS__ArrayMap(
                        __TS__ArraySlice(array, 1),
                        function(____, a)
                            local b = __TS__ArrayMap(
                                __TS__StringSplit(a, ";"),
                                function(____, a) return a end
                            )
                            return {
                                b[1],
                                __TS__ArraySlice(b, 1)
                            }
                        end
                    ))
                },
                love.graphics.newImage(self.source_image)
            }
        end,
        function(value) return value[2]:release() end
    )
    self.source_data = source_data
    self.source_image = source_image
end
function STFont.prototype.compute(self, content, ____bindingPattern0)
    if ____bindingPattern0 == nil then
        ____bindingPattern0 = ____exports.ST.empty_table
    end
    local spacing
    local plain
    plain = ____bindingPattern0.plain
    if plain == nil then
        plain = false
    end
    spacing = ____bindingPattern0.spacing
    if spacing == nil then
        spacing = {x = 0, y = 0}
    end
    local cursor_x = 0
    local cursor_y = 0
    local index = 0
    local line = 0
    local max_x = 0
    local stretch = 1
    local subspacing_x = 0
    local subspacing_y = 0
    local data = self:load()[1]
    self:unload()
    local line_max = {0}
    local line_height = data[1]
    local text_length = utf8.len(content)
    while index < text_length do
        local offs = utf8.offset(content, index + 1) - 1
        local char = __TS__StringSlice(
            content,
            offs,
            utf8.offset(content, index + 2) - 1
        )
        index = index + 1
        if char == "\n" then
            cursor_x = 0
            cursor_y = cursor_y + (line_height + spacing.y + subspacing_y)
            line_max[#line_max + 1] = 0
            line = line + 1
        elseif not plain and char == "{" then
            local offs = utf8.offset(content, index + 1) - 1
            local code = __TS__StringSlice(
                content,
                offs,
                (string.find(
                    content,
                    "}",
                    math.max(offs + 1, 1),
                    true
                ) or 0) - 1
            )
            index = index + (utf8.len(code) + 1)
            local key, value = unpack(__TS__StringSplit(code, "="))
            repeat
                local ____switch355 = key
                local x, y
                local ____cond355 = ____switch355 == "shift"
                if ____cond355 then
                    cursor_x = cursor_x + value * stretch
                    max_x = math.max(max_x, cursor_x)
                    line_max[line + 1] = math.max(line_max[line + 1], cursor_x)
                    break
                end
                ____cond355 = ____cond355 or ____switch355 == "stretch"
                if ____cond355 then
                    stretch = value
                    break
                end
                ____cond355 = ____cond355 or ____switch355 == "spacing"
                if ____cond355 then
                    x, y = unpack(__TS__StringSplit(value, "/"))
                    if y == nil then
                        y = x
                    end
                    subspacing_x = x
                    subspacing_y = y
                    break
                end
            until true
        else
            local glyph = data[2][tostring(utf8.codepoint(char, 1))]
            if glyph ~= nil then
                cursor_x = cursor_x + glyph[7] * stretch
                max_x = math.max(max_x, cursor_x)
                line_max[line + 1] = math.max(line_max[line + 1], cursor_x)
                cursor_x = cursor_x + (spacing.x + subspacing_x) * stretch
            end
        end
    end
    cursor_y = cursor_y + line_height
    return {x = max_x, y = cursor_y, w = line_max}
end
function STFont.prototype.swap(self, source_data, source_image)
    self.source_data = source_data
    self.source_image = source_image
    self:reload()
end
function STFont.prototype.wrap(self, content, width, splitter, ____bindingPattern0)
    if ____bindingPattern0 == nil then
        ____bindingPattern0 = ____exports.ST.empty_table
    end
    local spacing
    local plain
    plain = ____bindingPattern0.plain
    if plain == nil then
        plain = false
    end
    spacing = ____bindingPattern0.spacing
    if spacing == nil then
        spacing = {x = 0}
    end
    local index = 0
    local line_x = 0
    local stretch = 1
    local subspacing_x = 0
    local word = ""
    local word_size = 0
    local word_x = 0
    local data = self:load()[1]
    self:unload()
    local output = ____exports.ST.empty_array
    output[#output + 1] = ""
    local text_length = utf8.len(content)
    local stack = {}
    while index < text_length do
        do
            local char_end = 0
            local char_size = 0
            local char_x = 0
            local offs = utf8.offset(content, index + 1) - 1
            local char = __TS__StringSlice(
                content,
                offs,
                utf8.offset(content, index + 2) - 1
            )
            index = index + 1
            if char == "\n" then
                if index < text_length then
                    char_end = 3
                else
                    char_end = 4
                end
            elseif not plain and char == "{" then
                local offs = utf8.offset(content, index + 1) - 1
                local code = __TS__StringSlice(
                    content,
                    offs,
                    (string.find(
                        content,
                        "}",
                        math.max(offs + 1, 1),
                        true
                    ) or 0) - 1
                )
                index = index + (utf8.len(code) + 1)
                word = word .. ("{" .. code) .. "}"
                local key, value = unpack(__TS__StringSplit(code, "="))
                repeat
                    local ____switch365 = key
                    local x
                    local ____cond365 = ____switch365 == "shift"
                    if ____cond365 then
                        word_x = word_x + value * stretch
                        word_size = word_x
                        break
                    end
                    ____cond365 = ____cond365 or ____switch365 == "stretch"
                    if ____cond365 then
                        stretch = value
                        break
                    end
                    ____cond365 = ____cond365 or ____switch365 == "spacing"
                    if ____cond365 then
                        x = __TS__StringSplit(value, "/")[1]
                        subspacing_x = x
                        break
                    end
                until true
                if index < text_length then
                    goto __continue360
                end
                char_end = 4
            else
                local glyph = data[2][tostring(utf8.codepoint(char, 1))]
                if glyph ~= nil then
                    char_size = glyph[7] * stretch
                    char_x = char_size + (spacing.x + subspacing_x) * stretch
                end
                char_end = splitter(char)
                if char_end == 0 then
                    word = word .. char
                    word_size = word_x + char_size
                    word_x = word_x + char_x
                    if index < text_length then
                        goto __continue360
                    end
                    char_end = 4
                end
            end
            repeat
                local ____switch371 = char_end
                local ____cond371 = ____switch371 == ____exports.STSplitterResult.INCLUDE or ____switch371 == ____exports.STSplitterResult.EXCLUDE
                if ____cond371 then
                    if line_x + (char_end == 1 and word_x + char_size or word_size) > width(#output - 1) then
                        stack[#stack + 1] = word .. char
                        line_x = 0
                    else
                        local ____output_78, ____temp_79 = output, #output
                        ____output_78[____temp_79] = ____output_78[____temp_79] .. word .. char
                    end
                    line_x = line_x + (word_x + char_x)
                    break
                end
                ____cond371 = ____cond371 or (____switch371 == 3 or ____switch371 == 4)
                if ____cond371 then
                    if line_x + word_size > width(#output - 1) then
                        stack[#stack + 1] = word
                    else
                        local ____output_80, ____temp_81 = output, #output
                        ____output_80[____temp_81] = ____output_80[____temp_81] .. word
                    end
                    if char_end == 3 then
                        stack[#stack + 1] = ""
                        line_x = 0
                    end
                    break
                end
            until true
            for ____, element in ipairs(__TS__ArraySplice(stack, 0)) do
                local line = output[#output]
                if splitter(__TS__StringAccess(line, #line - 1)) == 2 then
                    output[#output] = string.sub(line, 1, -2)
                end
                output[#output + 1] = element
            end
            word = ""
            word_size = 0
            word_x = 0
        end
        ::__continue360::
    end
    return table.concat(
        __TS__ArraySplice(output, 0),
        "\n"
    )
end
____exports.STFrames = __TS__Class()
local STFrames = ____exports.STFrames
STFrames.name = "STFrames"
__TS__ClassExtends(STFrames, ____exports.STAsset)
function STFrames.prototype.____constructor(self, source_data, source_image)
    STFrames.____super.prototype.____constructor(
        self,
        function()
            local ____string = (love.filesystem.read("string", self.source_data))
            if ____string == nil then
                error("MISSING " .. self.source_data, 0)
            end
            local object = ____exports.ST:decode(____string)
            return {
                __TS__ArrayMap(
                    object.frames,
                    function(____, frame, index) return {
                        frame.duration,
                        frame.spriteSourceSize.x,
                        frame.spriteSourceSize.y,
                        frame.sourceSize.w,
                        frame.sourceSize.h,
                        frame.frame.x,
                        frame.frame.y,
                        frame.frame.w,
                        frame.frame.h,
                        unpack(__TS__ArrayMap(
                            __TS__ArrayFilter(
                                object.meta.frameTags,
                                function(____, tag) return tag.from <= index and index <= tag.to end
                            ),
                            function(____, tag) return tag.name end
                        ))
                    } end
                ),
                love.graphics.newImage(self.source_image)
            }
        end,
        function(value) return value[2]:release() end
    )
    self.source_data = source_data
    self.source_image = source_image
end
function STFrames.prototype.swap(self, source_data, source_image)
    self.source_data = source_data
    self.source_image = source_image
    self:reload()
end
____exports.STImage = __TS__Class()
local STImage = ____exports.STImage
STImage.name = "STImage"
__TS__ClassExtends(STImage, ____exports.STAsset)
function STImage.prototype.____constructor(self, source)
    STImage.____super.prototype.____constructor(
        self,
        function() return love.graphics.newImage(self.source) end,
        function(value) return value:release() end
    )
    self.source = source
end
function STImage.prototype.swap(self, source)
    self.source = source
    self:reload()
end
____exports.STObject = __TS__Class()
local STObject = ____exports.STObject
STObject.name = "STObject"
__TS__ClassExtends(STObject, ____exports.STContainer)
function STObject.prototype.____constructor(self, properties)
    if properties == nil then
        properties = ____exports.ST.empty_table
    end
    STObject.____super.prototype.____constructor(self, properties);
    (function(____bindingPattern0)
        local velocity
        local spin
        local offset
        local gravity
        local anchor
        local acceleration
        acceleration = ____bindingPattern0.acceleration
        if acceleration == nil then
            acceleration = 1
        end
        anchor = ____bindingPattern0.anchor
        if anchor == nil then
            anchor = 0
        end
        gravity = ____bindingPattern0.gravity
        if gravity == nil then
            gravity = 0
        end
        offset = ____bindingPattern0.offset
        if offset == nil then
            offset = 0
        end
        spin = ____bindingPattern0.spin
        if spin == nil then
            spin = 0
        end
        velocity = ____bindingPattern0.velocity
        if velocity == nil then
            velocity = 0
        end
        self.acceleration = __TS__New(____exports.STValue, acceleration)
        self.anchor = __TS__New(____exports.STPoint, anchor)
        self.gravity = __TS__New(____exports.STPoint, gravity)
        self.offset = __TS__New(____exports.STPoint, offset)
        self.spin = __TS__New(____exports.STValue, spin)
        self.velocity = __TS__New(____exports.STPoint, velocity)
    end)(properties)
end
function STObject.prototype.tick_self(self)
    local ____self_velocity_82, ____x_83 = self.velocity, "x"
    ____self_velocity_82[____x_83] = ____self_velocity_82[____x_83] + self.gravity.x
    local ____self_velocity_84, ____y_85 = self.velocity, "y"
    ____self_velocity_84[____y_85] = ____self_velocity_84[____y_85] + self.gravity.y
    if self.acceleration.value ~= 1 then
        local ____self_velocity_86, ____x_87 = self.velocity, "x"
        ____self_velocity_86[____x_87] = ____self_velocity_86[____x_87] * self.acceleration.value
        local ____self_velocity_88, ____y_89 = self.velocity, "y"
        ____self_velocity_88[____y_89] = ____self_velocity_88[____y_89] * self.acceleration.value
        local ____self_spin_90, ____value_91 = self.spin, "value"
        ____self_spin_90[____value_91] = ____self_spin_90[____value_91] * self.acceleration.value
    end
    local ____self_position_92, ____x_93 = self.position, "x"
    ____self_position_92[____x_93] = ____self_position_92[____x_93] + self.velocity.x
    local ____self_position_94, ____y_95 = self.position, "y"
    ____self_position_94[____y_95] = ____self_position_94[____y_95] + self.velocity.y
    local ____self_rotation_96, ____value_97 = self.rotation, "value"
    ____self_rotation_96[____value_97] = ____self_rotation_96[____value_97] + self.spin.value
end
____exports.STScreen = __TS__Class()
local STScreen = ____exports.STScreen
STScreen.name = "STScreen"
__TS__ClassExtends(STScreen, ____exports.STContainer)
function STScreen.prototype.____constructor(self, properties)
    if properties == nil then
        properties = ____exports.ST.empty_table
    end
    STScreen.____super.prototype.____constructor(self, properties);
    (function(____bindingPattern0)
        local camera_min
        local camera_max
        local camera
        camera = ____bindingPattern0.camera
        if camera == nil then
            camera = 0
        end
        camera_max = ____bindingPattern0.camera_max
        if camera_max == nil then
            camera_max = 0
        end
        camera_min = ____bindingPattern0.camera_min
        if camera_min == nil then
            camera_min = 0
        end
        self.camera = __TS__New(____exports.STPoint, camera)
        self.camera_max = __TS__New(____exports.STPoint, camera_max)
        self.camera_min = __TS__New(____exports.STPoint, camera_min)
    end)(properties)
end
function STScreen.prototype.draw_self(self)
    self.position.x = -____exports.ST:clamp(self.camera.x, self.camera_min.x, self.camera_max.x)
    self.position.y = -____exports.ST:clamp(self.camera.y, self.camera_min.y, self.camera_max.y)
end
____exports.STSaveFile = __TS__Class()
local STSaveFile = ____exports.STSaveFile
STSaveFile.name = "STSaveFile"
__TS__ClassExtends(STSaveFile, ____exports.STStorage)
function STSaveFile.prototype.____constructor(self, file, schema)
    STSaveFile.____super.prototype.____constructor(self, file)
    self.volatile = {}
    self.schema = schema
end
function STSaveFile.prototype.accessor(self)
    local object = {}
    for key in pairs(self.schema) do
        __TS__ObjectDefineProperty(
            object,
            key,
            {
                get = function() return self:get(key) end,
                set = function(____, value) return self:set(key, value) end
            }
        )
    end
    return object
end
function STSaveFile.prototype.apply(self)
    for ____, ____value in ipairs(self:dump()) do
        local key = ____value[1]
        local value = ____value[2]
        local ____key_99 = key
        local ____temp_98
        if value == self.schema[key] then
            ____temp_98 = nil
        else
            ____temp_98 = value
        end
        STSaveFile.____super.prototype.set(self, ____key_99, ____temp_98)
    end
end
function STSaveFile.prototype.check(self)
    return #self.volatile
end
function STSaveFile.prototype.dump(self)
    return __TS__ArraySplice(self.volatile, 0)
end
function STSaveFile.prototype.get(self, key)
    if __TS__StringAccess(key, 0) == "_" or __TS__StringAccess(key, 0) == "$" then
        local ____STSaveFile_____super_prototype_get_result_100 = STSaveFile.____super.prototype.get(self, key)
        if ____STSaveFile_____super_prototype_get_result_100 == nil then
            ____STSaveFile_____super_prototype_get_result_100 = self.schema[key]
        end
        return ____STSaveFile_____super_prototype_get_result_100
    end
    for ____, entry in ipairs(self.volatile) do
        if entry[1] == key then
            return entry[2]
        end
    end
    local ____STSaveFile_____super_prototype_get_result_101 = STSaveFile.____super.prototype.get(self, key)
    if ____STSaveFile_____super_prototype_get_result_101 == nil then
        ____STSaveFile_____super_prototype_get_result_101 = self.schema[key]
    end
    return ____STSaveFile_____super_prototype_get_result_101
end
function STSaveFile.prototype.reset(self, level)
    if level == nil then
        level = 0
    end
    self:dump()
    for key in pairs(self.schema) do
        do
            if __TS__StringAccess(key, 0) == "_" and level < 1 then
                goto __continue416
            elseif __TS__StringAccess(key, 0) == "$" and level < 2 then
                goto __continue416
            end
            STSaveFile.____super.prototype.set(self, key, nil)
        end
        ::__continue416::
    end
end
function STSaveFile.prototype.set(self, key, value)
    if __TS__StringAccess(key, 0) == "_" or __TS__StringAccess(key, 0) == "$" then
        local ____key_103 = key
        local ____temp_102
        if value == self.schema[key] then
            ____temp_102 = nil
        else
            ____temp_102 = value
        end
        STSaveFile.____super.prototype.set(self, ____key_103, ____temp_102)
        return
    end
    for ____, entry in ipairs(self.volatile) do
        if entry[1] == key then
            entry[2] = value
            return
        end
    end
    local ____self_volatile_104 = self.volatile
    ____self_volatile_104[#____self_volatile_104 + 1] = {key, value}
end
____exports.STAnimation = __TS__Class()
local STAnimation = ____exports.STAnimation
STAnimation.name = "STAnimation"
__TS__ClassExtends(STAnimation, ____exports.STObject)
function STAnimation.prototype.____constructor(self, properties)
    if properties == nil then
        properties = ____exports.ST.empty_table
    end
    STAnimation.____super.prototype.____constructor(self, properties);
    (function(____bindingPattern0)
        local step
        local speed
        local frames
        local frame
        local duration
        local direction
        local crop
        crop = ____bindingPattern0.crop
        if crop == nil then
            crop = nil
        end
        direction = ____bindingPattern0.direction
        if direction == nil then
            direction = 0
        end
        duration = ____bindingPattern0.duration
        if duration == nil then
            duration = 0
        end
        frame = ____bindingPattern0.frame
        if frame == nil then
            frame = 0
        end
        frames = ____bindingPattern0.frames
        if frames == nil then
            frames = nil
        end
        speed = ____bindingPattern0.speed
        if speed == nil then
            speed = 1
        end
        step = ____bindingPattern0.step
        if step == nil then
            step = 0
        end
        local ____temp_105
        if crop == nil then
            ____temp_105 = nil
        else
            ____temp_105 = {bottom = crop.bottom or 0, left = crop.left or 0, right = crop.right or 0, top = crop.top or 0}
        end
        self.crop = ____temp_105
        self.direction = direction
        self.duration = duration
        self.frame = frame
        self.frames_value = frames
        self.speed = __TS__New(____exports.STValue, speed)
        self.step = step
    end)(properties)
end
function STAnimation.prototype.cleanup(self)
    local ____opt_106 = self.frames_value
    if ____opt_106 ~= nil then
        ____opt_106:unload(self)
    end
    STAnimation.____super.prototype.cleanup(self)
end
function STAnimation.prototype.draw_self(self)
    if self.frames_value == nil then
        return
    end
    local data, image = unpack(self.frames_value:load(self))
    local frame = data[math.floor(self.frame) + 1]
    if frame == nil then
        return
    end
    local width = frame[4]
    local height = frame[5]
    local cx = 0
    local cy = 0
    local cw = width
    local ch = height
    if self.crop ~= nil then
        local cb = self.crop.bottom or 0
        local cl = self.crop.left or 0
        local cr = self.crop.right or 0
        local ct = self.crop.top or 0
        cx = (cl < 0 and width or 0) + cl
        cw = (cr < 0 and 0 or width) - cr - cx
        cy = (ct < 0 and height or 0) + ct
        ch = (cb < 0 and 0 or height) - cb - cy
    end
    local dx = math.max(cx - frame[2], 0)
    local dy = math.max(cy - frame[3], 0)
    local ex = math.max(frame[2] - cx, 0)
    local ey = math.max(frame[3] - cy, 0)
    local quad = love.graphics.newQuad(
        frame[6] + dx,
        frame[7] + dy,
        math.min(frame[8] - dx, cw - ex),
        math.min(frame[9] - dy, ch - ey),
        image:getWidth(),
        image:getHeight()
    )
    love.graphics.draw(image, quad, ex + self.offset.x + cw * -self.anchor.x, ey + self.offset.y + ch * -self.anchor.y)
    quad:release()
end
function STAnimation.prototype.getSize(self)
    if self.frames_value == nil then
        return
    end
    local data = self.frames_value:load()[1]
    self.frames_value:unload()
    local frame = data[math.floor(self.frame) + 1]
    if frame == nil then
        return
    end
    local width = frame[4]
    local height = frame[5]
    local cx = 0
    local cy = 0
    local cw = width
    local ch = height
    if self.crop ~= nil then
        local cb = self.crop.bottom or 0
        local cl = self.crop.left or 0
        local cr = self.crop.right or 0
        local ct = self.crop.top or 0
        cx = (cl < 0 and width or 0) + cl
        cw = (cr < 0 and 0 or width) - cr - cx
        cy = (ct < 0 and height or 0) + ct
        ch = (cb < 0 and 0 or height) - cb - cy
    end
    local dx = math.max(cx - frame[2], 0)
    local dy = math.max(cy - frame[3], 0)
    local ex = math.max(frame[2] - cx, 0)
    local ey = math.max(frame[3] - cy, 0)
    return {
        x = math.min(frame[8] - dx, cw - ex),
        y = math.min(frame[9] - dy, ch - ey)
    }
end
function STAnimation.prototype.tick_self(self)
    STAnimation.____super.prototype.tick_self(self)
    if self.direction == 0 or self.frames_value == nil then
        return
    end
    local data = self.frames_value:load(self)[1]
    local frame = data[math.floor(self.frame) + 1]
    if frame == nil then
        return
    end
    local duration = self.duration == 0 and frame[1] / (1000 / ____exports.ST.fps) or self.duration
    if duration <= 0 then
        return
    end
    if self.direction == -1 then
        self.step = self.step - self.speed.value
        while self.step < 0 do
            self.step = self.step + duration
            local ____self_108, ____frame_109 = self, "frame"
            local ____self_frame_110 = ____self_108[____frame_109] - 1
            ____self_108[____frame_109] = ____self_frame_110
            if ____self_frame_110 == -1 then
                self.frame = #data - 1
            end
        end
    else
        self.step = self.step + self.speed.value
        while duration <= self.step do
            self.step = self.step - duration
            local ____self_111, ____frame_112 = self, "frame"
            local ____self_frame_113 = ____self_111[____frame_112] + 1
            ____self_111[____frame_112] = ____self_frame_113
            if ____self_frame_113 == #data then
                self.frame = 0
            end
        end
    end
end
__TS__SetDescriptor(
    STAnimation.prototype,
    "frames",
    {
        get = function(self)
            return self.frames_value
        end,
        set = function(self, value)
            if value == self.frames_value then
                return
            end
            local ____opt_114 = self.frames_value
            if ____opt_114 ~= nil then
                ____opt_114:unload(self)
            end
            self.frames_value = value
        end
    },
    true
)
____exports.STHitbox = __TS__Class()
local STHitbox = ____exports.STHitbox
STHitbox.name = "STHitbox"
__TS__ClassExtends(STHitbox, ____exports.STObject)
function STHitbox.prototype.____constructor(self, properties)
    if properties == nil then
        properties = ____exports.ST.empty_table
    end
    STHitbox.____super.prototype.____constructor(self, properties)
    self.bounds_max = {x = 0, y = 0}
    self.bounds_min = {x = 0, y = 0}
    self.polygon = __TS__New(
        Polygon,
        __TS__New(Vector),
        {
            __TS__New(Vector),
            __TS__New(Vector),
            __TS__New(Vector),
            __TS__New(Vector)
        }
    );
    (function(____bindingPattern0)
        local size
        size = ____bindingPattern0.size
        if size == nil then
            size = 0
        end
        self.size = __TS__New(____exports.STPoint, size)
    end)(properties)
end
function STHitbox.prototype.calculate(self)
    local ____self = self
    local containers = ____exports.ST.empty_array
    while ____self ~= nil do
        __TS__ArrayUnshift(containers, ____self)
        ____self = ____self.parent
    end
    local position_x = 0
    local position_y = 0
    local rotation = 0
    local scale_x = 1
    local scale_y = 1
    for ____, container in ipairs(__TS__ArraySplice(containers, 0)) do
        if rotation ~= 0 and rotation % 360 ~= 0 and container.parent ~= nil then
            local ____temp_116 = ____exports.ST:ray(
                container.parent.position:angle(container.position) + rotation,
                container.parent.position:distance(container.position)
            )
            local x = ____temp_116.x
            local y = ____temp_116.y
            position_x = position_x + x * scale_x
            position_y = position_y + y * scale_y
        else
            position_x = position_x + container.position.x * scale_x
            position_y = position_y + container.position.y * scale_y
        end
        rotation = rotation + container.rotation.value
        scale_x = scale_x * container.scale.x
        scale_y = scale_y * container.scale.y
    end
    position_x = position_x + self.offset.x
    position_y = position_y + self.offset.y
    scale_x = scale_x * self.size.x
    scale_y = scale_y * self.size.y
    self.polygon.pos.x = position_x
    self.polygon.pos.y = position_y
    self.polygon:setAngle(rotation * (math.pi / 180))
    self.polygon:setOffset(__TS__New(Vector, scale_x * -self.anchor.x, scale_y * -self.anchor.y))
    self.polygon:setPoints({
        __TS__New(Vector),
        __TS__New(Vector, scale_x, 0),
        __TS__New(Vector, scale_x, scale_y),
        __TS__New(Vector, 0, scale_y)
    })
    if #self.polygon.calcPoints == 4 then
        local ____self_polygon_calcPoints__1_117 = self.polygon.calcPoints[1]
        local x1 = ____self_polygon_calcPoints__1_117.x
        local y1 = ____self_polygon_calcPoints__1_117.y
        local ____self_polygon_calcPoints__2_118 = self.polygon.calcPoints[2]
        local x2 = ____self_polygon_calcPoints__2_118.x
        local y2 = ____self_polygon_calcPoints__2_118.y
        local ____self_polygon_calcPoints__3_119 = self.polygon.calcPoints[3]
        local x3 = ____self_polygon_calcPoints__3_119.x
        local y3 = ____self_polygon_calcPoints__3_119.y
        local ____self_polygon_calcPoints__4_120 = self.polygon.calcPoints[4]
        local x4 = ____self_polygon_calcPoints__4_120.x
        local y4 = ____self_polygon_calcPoints__4_120.y
        self.bounds_min.x = math.floor((position_x + math.min(x1, x2, x3, x4)) * 1000 + 0.5) / 1000
        self.bounds_min.y = math.floor((position_y + math.min(y1, y2, y3, y4)) * 1000 + 0.5) / 1000
        self.bounds_max.x = math.floor((position_x + math.max(x1, x2, x3, x4)) * 1000 + 0.5) / 1000
        self.bounds_max.y = math.floor((position_y + math.max(y1, y2, y3, y4)) * 1000 + 0.5) / 1000
    else
        local ____self_polygon_calcPoints__1_121 = self.polygon.calcPoints[1]
        local x = ____self_polygon_calcPoints__1_121.x
        local y = ____self_polygon_calcPoints__1_121.y
        self.bounds_min.x = math.floor((position_x + x) * 1000 + 0.5) / 1000
        self.bounds_min.y = math.floor((position_y + y) * 1000 + 0.5) / 1000
        self.bounds_max.x = math.floor((position_x + x) * 1000 + 0.5) / 1000
        self.bounds_max.y = math.floor((position_y + y) * 1000 + 0.5) / 1000
    end
    return self
end
function STHitbox.prototype.draw_self(self)
    if not ____exports.ST.debug then
        return
    end
    local canvas = {love.graphics.getCanvas()}
    local color = {love.graphics.getColor()}
    love.graphics.setCanvas(____exports.ST.canvas_debug)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle(
        "line",
        self.offset.x + self.size.x * -self.anchor.x,
        self.offset.y + self.size.y * -self.anchor.y,
        self.size.x,
        self.size.y
    )
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(color)
end
function STHitbox.prototype.test(self, other)
    return self.bounds_min.x < other.bounds_max.x and other.bounds_min.x < self.bounds_max.x and self.bounds_min.y < other.bounds_max.y and other.bounds_min.y < self.bounds_max.y and testPolygonPolygon(self.polygon, other.polygon)
end
____exports.STMap = __TS__Class()
local STMap = ____exports.STMap
STMap.name = "STMap"
__TS__ClassExtends(STMap, ____exports.STScreen)
function STMap.prototype.____constructor(self, ____bindingPattern0)
    local transition
    local sheet
    local rooms
    local objects
    objects = ____bindingPattern0.objects
    rooms = ____bindingPattern0.rooms
    sheet = ____bindingPattern0.sheet
    transition = ____bindingPattern0.transition
    if transition == nil then
        transition = {1}
    end
    STMap.____super.prototype.____constructor(self)
    self.autoplay = true
    self.autorestore = true
    self.music_state = nil
    self.music_state_previous = nil
    self.task = nil
    self.transition_state = {0, 0, 0}
    self.room_value = 0
    self.updaters = {}
    self.objects = objects
    self.rooms = rooms
    self.sheet_value = sheet
    self.transition = transition
end
function STMap.prototype.addUpdater(self, script)
    if #self.updaters == 0 or not __TS__ArrayIncludes(self.updaters, script) then
        local ____self_updaters_122 = self.updaters
        ____self_updaters_122[#____self_updaters_122 + 1] = script
    end
    return self
end
function STMap.prototype.cam_clamped(self)
    return self.camera:clamp(self.camera_min, self.camera_max)
end
function STMap.prototype.cam_free(self)
    local min = self.camera_min:clone()
    local max = self.camera_max:clone()
    self.camera_min.x = -math.huge
    self.camera_min.y = -math.huge
    self.camera_max.x = math.huge
    self.camera_max.y = math.huge
    return {min, max}
end
function STMap.prototype.cam_restore(self, min, max)
    if type(min) == "table" then
        self.camera_min.x = min.x or -math.huge
        self.camera_min.y = min.y or -math.huge
    else
        local ____self_camera_min_124 = self.camera_min
        local ____min_123 = min
        if ____min_123 == nil then
            ____min_123 = -math.huge
        end
        ____self_camera_min_124.x = ____min_123
        local ____self_camera_min_126 = self.camera_min
        local ____min_125 = min
        if ____min_125 == nil then
            ____min_125 = -math.huge
        end
        ____self_camera_min_126.y = ____min_125
    end
    if type(max) == "table" then
        self.camera_max.x = max.x or math.huge
        self.camera_max.y = max.y or math.huge
    else
        local ____self_camera_max_128 = self.camera_max
        local ____max_127 = max
        if ____max_127 == nil then
            ____max_127 = math.huge
        end
        ____self_camera_max_128.x = ____max_127
        local ____self_camera_max_130 = self.camera_max
        local ____max_129 = max
        if ____max_129 == nil then
            ____max_129 = math.huge
        end
        ____self_camera_max_130.y = ____max_129
    end
end
function STMap.prototype.play(self, score)
    local ____opt_131 = self.music_state_previous
    local player_previous = ____opt_131 and ____opt_131[1]
    self.music_state = {
        score.daemon == (player_previous and player_previous.daemon) and player_previous or score.daemon:instance_forced({
            gain = self.transition_state[1] == self.transition[1] and score.gain or 0,
            pass = ____exports.ST:remap(score.distance, ____exports.ST.distance.near_pass, ____exports.ST.distance.far_pass),
            rate = score.rate,
            effects = ____exports.ST.distance.name_list
        }),
        score.distance,
        score.gain,
        score.rate
    }
end
function STMap.prototype.removeUpdater(self, script)
    if #self.updaters ~= 0 then
        local index = __TS__ArrayIndexOf(self.updaters, script)
        if index ~= -1 then
            __TS__ArraySplice(self.updaters, index, 1)
        end
    end
    return self
end
function STMap.prototype.stop(self)
    local music = self.music_state
    if music ~= nil then
        music[1]:stop()
        self.music_state = nil
        local ____music__1_137 = music[1]
        local ____opt_135 = self.music_state_previous
        if ____music__1_137 == (____opt_135 and ____opt_135[1]) then
            self.music_state_previous = nil
        end
    end
end
function STMap.prototype.tick_music(self, progress)
    if progress == nil then
        progress = self:tick_progress()
    end
    local music = self.music_state
    local music_previous = self.music_state_previous
    local distance = nil
    if music ~= nil then
        if music[1] == (music_previous and music_previous[1]) then
            distance = ____exports.ST:remap(progress, music_previous[2], music[2])
            music[1].gain.value = ____exports.ST:remap(progress, music_previous[3], music[3])
            music[1].pass.value = ____exports.ST:remap(distance, ____exports.ST.distance.near_pass, ____exports.ST.distance.far_pass)
            music[1].rate.value = ____exports.ST:remap(progress, music_previous[4], music[4])
        else
            distance = music[2]
            music[1].gain.value = ____exports.ST:remap(progress, 0, music[3])
            music[1].pass.value = ____exports.ST:remap(distance, ____exports.ST.distance.near_pass, ____exports.ST.distance.far_pass)
            music[1].rate.value = music[4]
        end
    end
    if music_previous ~= nil then
        if progress == self.transition[#self.transition] then
            if (music and music[1]) ~= music_previous[1] then
                music_previous[1]:stop()
            end
            self.music_state_previous = nil
        elseif (music and music[1]) ~= music_previous[1] then
            distance = music_previous[2]
            music_previous[1].gain.value = ____exports.ST:remap(progress, music_previous[3], 0)
            music_previous[1].pass.value = ____exports.ST:remap(distance, ____exports.ST.distance.near_pass, ____exports.ST.distance.far_pass)
            music_previous[1].rate.value = music_previous[4]
        end
    end
    if distance == nil then
        return
    end
    ____exports.ST.distance.properties_a.gain = ____exports.ST:remap(distance, ____exports.ST.distance.near_mix, ____exports.ST.distance.far_mix)
    ____exports.ST.distance.properties_b.highcut = ____exports.ST:remap(distance, ____exports.ST.distance.near_frequency, ____exports.ST.distance.far_frequency)
    love.audio.setEffect(____exports.ST.distance.name_a, ____exports.ST.distance.properties_a)
    love.audio.setEffect(____exports.ST.distance.name_b, ____exports.ST.distance.properties_b)
end
function STMap.prototype.tick_position(self, progress)
    if progress == nil then
        progress = self:tick_progress()
    end
    self.position.x = ____exports.ST:remap(
        progress,
        self.transition_state[2],
        -____exports.ST:clamp(self.camera.x, self.camera_min.x, self.camera_max.x)
    ) * self.scale.x
    self.position.y = ____exports.ST:remap(
        progress,
        self.transition_state[3],
        -____exports.ST:clamp(self.camera.y, self.camera_min.y, self.camera_max.y)
    ) * self.scale.y
end
function STMap.prototype.tick_progress(self, step)
    if step == nil then
        step = false
    end
    if step then
        local ____temp_147 = self.transition_state[1] < self.transition[1]
        if ____temp_147 then
            local ____self_transition_state_144, ____1_145 = self.transition_state, 1
            local ____self_transition_state__1_146 = ____self_transition_state_144[____1_145]
            ____self_transition_state_144[____1_145] = ____self_transition_state__1_146 + 1
            ____temp_147 = ____self_transition_state__1_146
        end
    end
    return ____exports.ST:bezier(
        math.min(self.transition_state[1] / self.transition[1], 1),
        unpack(__TS__ArraySlice(self.transition, 1))
    )
end
function STMap.prototype.tick_self(self)
    local progress = self:tick_progress(true)
    self:tick_position(progress)
    self:tick_music(progress)
end
function STMap.prototype.view(self, index, values)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local prev = nil
        self.transition_state[1] = self.transition[1]
        local objects, release = unpack(self.objects(values))
        self:attach(unpack(objects))
        while index ~= nil do
            self.room_value = index
            local task = ____exports.ST:task()
            local room = self.rooms[index + 1]
            if self.autorestore then
                self:cam_restore(room.camera_min, room.camera_max)
                if type(room.camera_min) == "table" then
                    self.camera_min.x = room.camera_min.x or 0
                    self.camera_min.y = room.camera_min.y or 0
                else
                    self.camera_min.x = room.camera_min or 0
                    self.camera_min.y = room.camera_min or 0
                end
                if type(room.camera_max) == "table" then
                    self.camera_max.x = room.camera_max.x or 0
                    self.camera_max.y = room.camera_max.y or 0
                else
                    self.camera_max.x = room.camera_max or 0
                    self.camera_max.y = room.camera_max or 0
                end
            end
            local rooms = {
                {index, 0, 0},
                unpack(room.neighbors or ____exports.ST.empty_array)
            }
            local visuals = __TS__ArrayMap(
                rooms,
                function(____, ____bindingPattern0)
                    local y
                    local x
                    local index
                    index = ____bindingPattern0[1]
                    x = ____bindingPattern0[2]
                    y = ____bindingPattern0[3]
                    local ____opt_150 = self.rooms[index + 1]
                    local ____opt_148 = ____opt_150 and ____opt_150.visual
                    local ____temp_152 = ____opt_148 and ____opt_148(____opt_150, values, self.sheet_value, index)
                    if ____temp_152 == nil then
                        ____temp_152 = {
                            ____exports.ST.empty_array,
                            function()
                            end
                        }
                    end
                    local containers, release = unpack(____temp_152)
                    for ____, container in ipairs(containers) do
                        local ____container_position_153, ____x_154 = container.position, "x"
                        ____container_position_153[____x_154] = ____container_position_153[____x_154] + x
                        local ____container_position_155, ____y_156 = container.position, "y"
                        ____container_position_155[____y_156] = ____container_position_155[____y_156] + y
                        if type(container.metadata) == "table" then
                            container.metadata.x = x
                            container.metadata.y = y
                        end
                    end
                    return {containers, release}
                end
            )
            local ____opt_157 = room.physical
            local ____temp_159 = ____opt_157 and ____opt_157(room, values)
            if ____temp_159 == nil then
                ____temp_159 = {
                    ____exports.ST.empty_array,
                    function()
                    end
                }
            end
            local containers, release = unpack(____temp_159)
            local ____self_attach_161 = self.attach
            local ____array_160 = __TS__SparseArrayNew(unpack(__TS__ArrayFlatMap(
                visuals,
                function(____, visual) return visual[1] end
            )))
            __TS__SparseArrayPush(
                ____array_160,
                unpack(containers)
            )
            ____self_attach_161(
                self,
                __TS__SparseArraySpread(____array_160)
            )
            local rm = 0
            while rm ~= #rooms do
                local room = rooms[rm + 1]
                local last = rm == #rooms - 1
                for ____, script in ipairs(self.updaters) do
                    script(
                        self,
                        prev,
                        room[1],
                        room[1] == index,
                        room[2],
                        room[3],
                        last
                    )
                end
                rm = rm + 1
            end
            if self.autoplay and room.score ~= nil then
                self:play(room.score)
            end
            self.task = task
            prev = index
            index = __TS__Await(task)
            self.task = nil
            local ____self_detach_163 = self.detach
            local ____array_162 = __TS__SparseArrayNew(unpack(__TS__ArrayFlatMap(
                visuals,
                function(____, visual) return visual[1] end
            )))
            __TS__SparseArrayPush(
                ____array_162,
                unpack(containers)
            )
            ____self_detach_163(
                self,
                __TS__SparseArraySpread(____array_162)
            )
            for ____, visual in ipairs(visuals) do
                visual[2]()
            end
            release()
            if self.music_state_previous ~= nil then
                local ____self_music_state_previous__1_166 = self.music_state_previous[1]
                local ____opt_164 = self.music_state
                if ____self_music_state_previous__1_166 ~= (____opt_164 and ____opt_164[1]) then
                    self.music_state_previous[1]:stop()
                    self.music_state_previous = nil
                end
            end
            if index ~= nil or index ~= prev then
                self.transition_state[1] = self.transition[1]
                if room.neighbors ~= nil then
                    for ____, neighbor in ipairs(room.neighbors) do
                        if neighbor[1] == index then
                            self.transition_state[1] = 0
                            self.transition_state[2] = self.position.x + neighbor[2]
                            self.transition_state[3] = self.position.y + neighbor[3]
                            local cam = false
                            for ____, object in ipairs(objects) do
                                local ____object_position_167, ____x_168 = object.position, "x"
                                ____object_position_167[____x_168] = ____object_position_167[____x_168] - neighbor[2]
                                local ____object_position_169, ____y_170 = object.position, "y"
                                ____object_position_169[____y_170] = ____object_position_169[____y_170] - neighbor[3]
                                if object.position == self.camera then
                                    cam = true
                                end
                            end
                            if not cam then
                                local ____self_camera_171, ____x_172 = self.camera, "x"
                                ____self_camera_171[____x_172] = ____self_camera_171[____x_172] - neighbor[2]
                                local ____self_camera_173, ____y_174 = self.camera, "y"
                                ____self_camera_173[____y_174] = ____self_camera_173[____y_174] - neighbor[3]
                            end
                            break
                        end
                    end
                end
                if self.music_state ~= nil then
                    self.music_state_previous = self.music_state
                    self.music_state = nil
                end
            end
            self.autoplay = true
            if index == nil then
                for ____, script in ipairs(self.updaters) do
                    script(
                        self,
                        prev,
                        nil,
                        false,
                        0,
                        0,
                        true
                    )
                end
            end
        end
        self.room_value = 0
        self:stop()
        self:detach(unpack(objects))
        release()
    end)
end
__TS__SetDescriptor(
    STMap.prototype,
    "music",
    {get = function(self)
        local ____opt_175 = self.music_state
        return ____opt_175 and ____opt_175[1]
    end},
    true
)
__TS__SetDescriptor(
    STMap.prototype,
    "music_previous",
    {get = function(self)
        local ____opt_177 = self.music_state_previous
        return ____opt_177 and ____opt_177[1]
    end},
    true
)
__TS__SetDescriptor(
    STMap.prototype,
    "room",
    {get = function(self)
        return self.room_value
    end},
    true
)
__TS__SetDescriptor(
    STMap.prototype,
    "sheet",
    {get = function(self)
        return self.sheet_value
    end},
    true
)
____exports.STRectangle = __TS__Class()
local STRectangle = ____exports.STRectangle
STRectangle.name = "STRectangle"
__TS__ClassExtends(STRectangle, ____exports.STObject)
function STRectangle.prototype.____constructor(self, properties)
    if properties == nil then
        properties = ____exports.ST.empty_table
    end
    STRectangle.____super.prototype.____constructor(self, properties);
    (function(____bindingPattern0)
        local size
        size = ____bindingPattern0.size
        if size == nil then
            size = 0
        end
        self.size = __TS__New(____exports.STPoint, size)
    end)(properties)
end
function STRectangle.prototype.draw_self(self)
    if self.size.x == 0 or self.size.y == 0 then
        return
    end
    love.graphics.rectangle(
        "fill",
        self.offset.x + self.size.x * -self.anchor.x,
        self.offset.y + self.size.y * -self.anchor.y,
        self.size.x,
        self.size.y
    )
end
____exports.STSprite = __TS__Class()
local STSprite = ____exports.STSprite
STSprite.name = "STSprite"
__TS__ClassExtends(STSprite, ____exports.STObject)
function STSprite.prototype.____constructor(self, properties)
    if properties == nil then
        properties = ____exports.ST.empty_table
    end
    STSprite.____super.prototype.____constructor(self, properties);
    (function(____bindingPattern0)
        local image
        local crop
        crop = ____bindingPattern0.crop
        if crop == nil then
            crop = nil
        end
        image = ____bindingPattern0.image
        if image == nil then
            image = nil
        end
        local ____temp_179
        if crop == nil then
            ____temp_179 = nil
        else
            ____temp_179 = {bottom = crop.bottom or 0, left = crop.left or 0, right = crop.right or 0, top = crop.top or 0}
        end
        self.crop = ____temp_179
        self.image_value = image
    end)(properties)
end
function STSprite.prototype.cleanup(self)
    local ____opt_180 = self.image_value
    if ____opt_180 ~= nil then
        ____opt_180:unload(self)
    end
    STSprite.____super.prototype.cleanup(self)
end
function STSprite.prototype.draw_self(self)
    if self.image_value == nil then
        return
    end
    local image = self.image_value:load(self)
    local width = image:getWidth()
    local height = image:getHeight()
    local cx = 0
    local cy = 0
    local cw = width
    local ch = height
    if self.crop ~= nil then
        local cb = self.crop.bottom or 0
        local cl = self.crop.left or 0
        local cr = self.crop.right or 0
        local ct = self.crop.top or 0
        cx = (cl < 0 and width or 0) + cl
        cw = (cr < 0 and 0 or width) - cr - cx
        cy = (ct < 0 and height or 0) + ct
        ch = (cb < 0 and 0 or height) - cb - cy
    end
    local quad = love.graphics.newQuad(
        cx,
        cy,
        cw,
        ch,
        width,
        height
    )
    love.graphics.draw(image, quad, self.offset.x - cw * self.anchor.x, self.offset.y - ch * self.anchor.y)
    quad:release()
end
function STSprite.prototype.getSize(self)
    if self.image_value == nil then
        return
    end
    local image = self.image_value:load()
    local width = image:getWidth()
    local height = image:getHeight()
    self.image_value:unload()
    local cx = 0
    local cy = 0
    local cw = width
    local ch = height
    if self.crop ~= nil then
        local cb = self.crop.bottom or 0
        local cl = self.crop.left or 0
        local cr = self.crop.right or 0
        local ct = self.crop.top or 0
        cx = (cl < 0 and width or 0) + cl
        cw = (cr < 0 and 0 or width) - cr - cx
        cy = (ct < 0 and height or 0) + ct
        ch = (cb < 0 and 0 or height) - cb - cy
    end
    return {x = cw, y = ch}
end
__TS__SetDescriptor(
    STSprite.prototype,
    "image",
    {
        get = function(self)
            return self.image_value
        end,
        set = function(self, value)
            if value == self.image_value then
                return
            end
            local ____opt_182 = self.image_value
            if ____opt_182 ~= nil then
                ____opt_182:unload(self)
            end
            self.image_value = value
        end
    },
    true
)
____exports.STText = __TS__Class()
local STText = ____exports.STText
STText.name = "STText"
__TS__ClassExtends(STText, ____exports.STObject)
function STText.prototype.____constructor(self, properties)
    if properties == nil then
        properties = ____exports.ST.empty_table
    end
    STText.____super.prototype.____constructor(self, properties);
    (function(____bindingPattern0)
        local spacing
        local plain
        local justify
        local font
        local content
        content = ____bindingPattern0.content
        if content == nil then
            content = ""
        end
        font = ____bindingPattern0.font
        if font == nil then
            font = nil
        end
        justify = ____bindingPattern0.justify
        if justify == nil then
            justify = 0
        end
        plain = ____bindingPattern0.plain
        if plain == nil then
            plain = false
        end
        spacing = ____bindingPattern0.spacing
        if spacing == nil then
            spacing = 0
        end
        self.content = content
        self.font_value = font
        self.justify = justify
        self.plain = plain
        self.spacing = __TS__New(____exports.STPoint, spacing)
    end)(properties)
end
function STText.prototype.cleanup(self)
    local ____opt_184 = self.font_value
    if ____opt_184 ~= nil then
        ____opt_184:unload(self)
    end
    STText.____super.prototype.cleanup(self)
end
function STText.prototype.draw_self(self)
    if self.font_value == nil then
        return
    end
    local color = {love.graphics.getColor()}
    local data, image = unpack(self.font_value:load(self))
    local width = image:getWidth()
    local height = image:getHeight()
    local color_r = color[1]
    local color_g = color[2]
    local color_b = color[3]
    local cursor_x = 0
    local cursor_y = 0
    local index = 0
    local line = 0
    local shake_x = 0
    local shake_y = 0
    local stretch = 1
    local subspacing_x = 0
    local subspacing_y = 0
    local wave_d = 0
    local wave_i = 0
    local wave_o = 0
    local wave_s = 0
    local wave_x = 0
    local wave_y = 0
    local size = self.font_value:compute(self.content, self)
    local base_x = self.offset.x + size.x * -self.anchor.x
    local base_y = self.offset.y + size.y * -self.anchor.y
    local line_height = data[1]
    local line_max = math.max(unpack(size.w))
    local text_length = utf8.len(self.content)
    while index < text_length do
        local offs = utf8.offset(self.content, index + 1) - 1
        local char = __TS__StringSlice(
            self.content,
            offs,
            utf8.offset(self.content, index + 2) - 1
        )
        index = index + 1
        if char == "\n" then
            cursor_x = 0
            cursor_y = cursor_y + (line_height + self.spacing.y + subspacing_y)
            line = line + 1
        elseif not self.plain and char == "{" then
            local offs = utf8.offset(self.content, index + 1) - 1
            local code = __TS__StringSlice(
                self.content,
                offs,
                (string.find(
                    self.content,
                    "}",
                    math.max(offs + 1, 1),
                    true
                ) or 0) - 1
            )
            index = index + (utf8.len(code) + 1)
            local key, value = unpack(__TS__StringSplit(code, "="))
            if value == nil then
                value = ""
            end
            repeat
                local ____switch556 = key
                local ____cond556 = ____switch556 == "color"
                if ____cond556 then
                    do
                        if value == "" then
                            color_r = color[1]
                            color_g = color[2]
                            color_b = color[3]
                        else
                            local color = ____exports.ST:hex2rgb(value)
                            color_r = color.red / 255
                            color_g = color.green / 255
                            color_b = color.blue / 255
                        end
                        break
                    end
                end
                ____cond556 = ____cond556 or ____switch556 == "reset"
                if ____cond556 then
                    do
                        color_r = color[1]
                        color_g = color[2]
                        color_b = color[3]
                        shake_x = 0
                        shake_y = 0
                        stretch = 1
                        wave_d = 0
                        wave_o = 0
                        wave_s = 0
                        wave_x = 0
                        wave_y = 0
                        break
                    end
                end
                ____cond556 = ____cond556 or ____switch556 == "shake"
                if ____cond556 then
                    do
                        local x, y = unpack(__TS__StringSplit(value, "/"))
                        if y == nil then
                            y = x
                        end
                        shake_x = x
                        shake_y = y
                        break
                    end
                end
                ____cond556 = ____cond556 or ____switch556 == "shift"
                if ____cond556 then
                    cursor_x = cursor_x + value * stretch
                    break
                end
                ____cond556 = ____cond556 or ____switch556 == "stretch"
                if ____cond556 then
                    stretch = value
                    break
                end
                ____cond556 = ____cond556 or ____switch556 == "spacing"
                if ____cond556 then
                    do
                        local x, y = unpack(__TS__StringSplit(value, "/"))
                        if y == nil then
                            y = x
                        end
                        subspacing_x = x
                        subspacing_y = y
                        break
                    end
                end
                ____cond556 = ____cond556 or ____switch556 == "wave"
                if ____cond556 then
                    do
                        local x, y, s, o, d = unpack(__TS__StringSplit(value, "/"))
                        if y == nil then
                            y = x
                        end
                        if s == nil then
                            s = 1
                        end
                        if o == nil then
                            o = 1
                        end
                        if d == nil then
                            d = x == 0 and 0 or 0.25
                        end
                        wave_d = d * math.pi * 2
                        wave_o = o * math.pi * 2
                        wave_s = s / ____exports.ST.fps * math.pi * 2
                        wave_x = x
                        wave_y = y
                        break
                    end
                end
            until true
        else
            local glyph = data[2][tostring(utf8.codepoint(char, 1))]
            if glyph ~= nil then
                love.graphics.setColor(color_r, color_g, color_b, color[4])
                local quad = love.graphics.newQuad(
                    glyph[1],
                    glyph[2],
                    glyph[3],
                    glyph[4],
                    width,
                    height
                )
                love.graphics.draw(
                    image,
                    quad,
                    base_x + self.justify * (line_max - size.w[line + 1]) + cursor_x + (shake_x == 0 and 0 or shake_x * stretch * (math.random() - 0.5)) + (wave_x == 0 and 0 or wave_x * stretch * math.sin(____exports.ST.time * wave_s + wave_i * wave_o)) + glyph[5],
                    base_y + cursor_y + (shake_y == 0 and 0 or shake_y * (math.random() - 0.5)) + (wave_y == 0 and 0 or wave_y * math.sin(____exports.ST.time * wave_s + wave_i * wave_o + wave_d)) + glyph[6],
                    0,
                    stretch,
                    1
                )
                quad:release()
                cursor_x = cursor_x + (glyph[7] + self.spacing.x + subspacing_x) * stretch
            end
            wave_i = wave_i + 1
        end
    end
    love.graphics.setColor(color)
end
__TS__SetDescriptor(
    STText.prototype,
    "font",
    {
        get = function(self)
            return self.font_value
        end,
        set = function(self, value)
            if value == self.font_value then
                return
            end
            local ____opt_186 = self.font_value
            if ____opt_186 ~= nil then
                ____opt_186:unload(self)
            end
            self.font_value = value
        end
    },
    true
)
____exports.STActor = __TS__Class()
local STActor = ____exports.STActor
STActor.name = "STActor"
__TS__ClassExtends(STActor, ____exports.STAnimation)
function STActor.prototype.____constructor(self, properties)
    if properties == nil then
        properties = ____exports.ST.empty_table
    end
    STActor.____super.prototype.____constructor(self, properties)
    self.task = nil;
    (function(____bindingPattern0)
        local stances
        local stance
        local facings
        facings = ____bindingPattern0.facings
        if facings == nil then
            facings = ____exports.ST.empty_table
        end
        stance = ____bindingPattern0.stance
        if stance == nil then
            stance = nil
        end
        stances = ____bindingPattern0.stances
        if stances == nil then
            stances = {}
        end
        self.facings = {
            facings.up or nil,
            facings.up_right or facings.up or nil,
            facings.right or facings.down or nil,
            facings.down_right or facings.down or nil,
            facings.down or nil,
            facings.down_left or facings.down or nil,
            facings.left or facings.up or nil,
            facings.up_left or facings.up or nil
        }
        local ____temp_188
        if stance == nil then
            ____temp_188 = nil
        else
            ____temp_188 = stances[stance]
        end
        self.frames = ____temp_188
        self.stance_value = stance
        self.stances = stances
    end)(properties)
end
function STActor.prototype.move(self, x, y, r)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if r == nil then
        r = false
    end
    if x == 0 and y == 0 then
        self.direction = 0
        self.frame = 0
        self.step = 0
    else
        self.direction = 1
        local stance = self.facings[(x == 0 and (y < 0 and 0 or 4) or (y == 0 and (x < 0 and 6 or 2) or (x < 0 and (y < 0 and 7 or 5) or (y < 0 and 1 or 3)))) + 1]
        if self.stance_value ~= stance then
            self.stance = stance
            if r then
                self.frame = 0
                self.step = 0
            end
        end
        local ____self_position_189, ____x_190 = self.position, "x"
        ____self_position_189[____x_190] = ____self_position_189[____x_190] + x
        local ____self_position_191, ____y_192 = self.position, "y"
        ____self_position_191[____y_192] = ____self_position_191[____y_192] + y
    end
end
function STActor.prototype.walk(self, speed, ...)
    if speed == nil then
        speed = 0
    end
    local points = {...}
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local ____opt_193 = self.task
        if ____opt_193 ~= nil then
            ____opt_193.complete()
        end
        if speed == 0 then
            self:move()
            self.task = nil
            return ____awaiter_resolve(nil)
        end
        local index = 0
        local task = ____exports.ST:task()
        local ____exports_ST_scripts_195 = ____exports.ST.scripts
        ____exports_ST_scripts_195[#____exports_ST_scripts_195 + 1] = function()
            if not task.active then
                return true
            end
            local point = points[index + 1]
            self:move(
                ____exports.ST:clamp((point.x or self.position.x) - self.position.x, -speed, speed),
                ____exports.ST:clamp((point.y or self.position.y) - self.position.y, -speed, speed)
            )
            while math.abs((point.x or self.position.x) - self.position.x) < 0.000001 and math.abs((point.y or self.position.y) - self.position.y) < 0.000001 do
                self.position.x = point.x or self.position.x
                self.position.y = point.y or self.position.y
                index = index + 1
                if index == #points then
                    self:move()
                    self.task = nil
                    task.complete()
                    return true
                end
                point = points[index + 1]
            end
            return false
        end
        self.task = task
        return ____awaiter_resolve(nil, task)
    end)
end
__TS__SetDescriptor(
    STActor.prototype,
    "stance",
    {
        get = function(self)
            return self.stance_value
        end,
        set = function(self, value)
            local ____temp_196
            if value == nil then
                ____temp_196 = nil
            else
                ____temp_196 = self.stances[value]
            end
            self.frames = ____temp_196
            if value == self.stance_value then
                return
            end
            self.stance_value = value
        end
    },
    true
)
____exports.ST_SEMITONE = 2 ^ (1 / 12)
____exports.ST = {
    acquit = nil,
    canvas = nil,
    canvas_debug = nil,
    debug = false,
    delta = 1,
    distance = {
        near_frequency = 20000,
        near_pass = 1,
        near_mix = 0,
        far_frequency = 4000,
        far_pass = 0,
        far_mix = 1,
        name_a = "#distance_a",
        name_b = "#distance_b",
        name_list = {"#distance_a", "#distance_b"},
        properties_a = {
            type = "reverb",
            airabsorption = 0.892,
            decaytime = 4,
            density = 1,
            diffusion = 1,
            gain = 0
        },
        properties_b = {type = "equalizer", highcut = 20000}
    },
    disk = {
        channel = love.thread.getChannel("files"),
        files = {},
        thread = love.thread.newThread("\n         files = love.thread.getChannel('files');\n         while true do\n            local file = files:pop();\n            if file then\n               love.filesystem.write(file[1], file[2]);\n            else\n               break\n            end\n         end\n      ")
    },
    empty_array = {},
    empty_table = {},
    fps = 30,
    height = 640,
    inputs = {},
    instances = {},
    scale = 1,
    screen = nil,
    scripts = {},
    speed = 1,
    superscripts = {},
    time = 0,
    width = 480,
    automate = function(self, duration, controller)
        local time = 0
        local task = ____exports.ST:task()
        local ____exports_ST_scripts_198 = ____exports.ST.scripts
        ____exports_ST_scripts_198[#____exports_ST_scripts_198 + 1] = function()
            if not task.active then
                return true
            end
            local ____controller_197 = controller
            time = time + 1
            if ____controller_197(time / duration) then
                task.complete()
                return true
            end
            return false
        end
        return task
    end,
    bezier = function(self, value, ...)
        local points = {...}
        repeat
            local ____switch590 = #points
            local ____cond590 = ____switch590 == 0
            if ____cond590 then
                return value
            end
            ____cond590 = ____cond590 or ____switch590 == 1
            if ____cond590 then
                return points[1]
            end
            ____cond590 = ____cond590 or ____switch590 == 2
            if ____cond590 then
                if points[1] == points[2] then
                    return points[1]
                else
                    return value * (points[2] - points[1]) / 1 + points[1]
                end
            end
            ____cond590 = ____cond590 or ____switch590 == 3
            if ____cond590 then
                if points[1] == points[2] then
                    if points[1] == points[3] then
                        return points[1]
                    else
                        return value ^ 2 * (points[3] - points[1]) + points[1]
                    end
                elseif points[1] == points[3] then
                    return (value * (value - 1) * 2 + 1) * (points[1] - points[2]) + points[2]
                elseif points[2] == points[3] then
                    return (1 - (1 - value) ^ 2) * (points[2] - points[1]) + points[1]
                end
                break
            end
            ____cond590 = ____cond590 or ____switch590 == 4
            if ____cond590 then
                if points[1] == points[2] then
                    if points[1] == points[3] then
                        if points[1] == points[4] then
                            return points[1]
                        else
                            return value ^ 3 * (points[4] - points[1]) + points[1]
                        end
                    elseif points[3] == points[4] then
                        return value ^ 2 * (3 - value * 2) * (points[4] - points[1]) + points[1]
                    end
                elseif points[2] == points[3] then
                    if points[1] == points[4] then
                        return (value * (value - 1) * 3 + 1) * (points[1] - points[2]) + points[2]
                    elseif points[2] == points[4] then
                        return (1 - (1 - value) ^ 3) * (points[2] - points[1]) + points[1]
                    end
                end
                break
            end
        until true
        local total = #points - 1
        while total ~= 0 do
            local index = 0
            while index ~= total do
                points[index + 1] = points[index + 1] * (1 - value) + points[index + 1 + 1] * value
                index = index + 1
            end
            total = total - 1
        end
        return points[1]
    end,
    cardinal = function(self, angle)
        local trueAngle = angle % 360
        if trueAngle < -315 or trueAngle > 315 then
            return "right"
        end
        if trueAngle <= -225 then
            return "down"
        end
        if trueAngle < -135 then
            return "left"
        end
        if trueAngle <= -45 then
            return "up"
        end
        if trueAngle < 45 then
            return "right"
        end
        if trueAngle <= 135 then
            return "down"
        end
        if trueAngle < 225 then
            return "left"
        end
        return "up"
    end,
    clamp = function(self, value, min, max)
        return value < min and min or (value > max and max or value)
    end,
    cos = function(self, value)
        return math.cos(value * (math.pi / 180))
    end,
    decode = function(self, value)
        return json.decode(value)
    end,
    encode = function(self, value)
        return json.encode(value)
    end,
    hex2rgb = function(self, value)
        return {
            red = math.floor(value / 65536) % 256,
            green = math.floor(value / 256) % 256,
            blue = math.floor(value) % 256
        }
    end,
    linear = function(self, value, ...)
        local points = {...}
        if #points == 0 then
            return value
        elseif #points == 1 then
            return points[1]
        elseif value <= 0 then
            return ____exports.ST:remap(value, points[1], points[2])
        elseif 1 <= value then
            return ____exports.ST:remap(value, points[#points - 2 + 1], points[#points])
        else
            local supervalue = value * (#points - 1)
            local index = math.floor(supervalue)
            return ____exports.ST:remap(supervalue % 1, points[index + 1], points[index + 1 + 1])
        end
    end,
    pause = function(self, duration)
        local time = 0
        return ____exports.ST:when(function()
            time = time + 1
            return time == duration
        end)
    end,
    populate = function(self, size, provider)
        local index = 0
        local array = {}
        while index ~= size do
            local ____provider_200 = provider
            local ____index_199 = index
            index = ____index_199 + 1
            array[#array + 1] = ____provider_200(____index_199)
        end
        return array
    end,
    ray = function(self, angle, distance)
        return {
            x = distance * ____exports.ST:sin(angle + 90),
            y = -distance * ____exports.ST:cos(angle + 90)
        }
    end,
    remap = function(self, value, min2, max2, min1, max1)
        if min1 == nil then
            min1 = 0
        end
        if max1 == nil then
            max1 = 1
        end
        return (value - min1) * (max2 - min2) / (max1 - min1) + min2
    end,
    remap_clamped = function(self, value, min2, max2, min1, max1)
        if min1 == nil then
            min1 = 0
        end
        if max1 == nil then
            max1 = 1
        end
        return ____exports.ST:clamp((value - min1) * (max2 - min2) / (max1 - min1) + min2, min2, max2)
    end,
    rgb2hex = function(self, red, green, blue)
        return red * 65536 + green * 256 + blue
    end,
    sin = function(self, value)
        return math.sin(value * (math.pi / 180))
    end,
    spread = function(self, size, index, total)
        if total <= 1 then
            return 0
        else
            local base = (total - 1) / 2
            return (index - base) / base * size
        end
    end,
    spread_quantize = function(self, size, index, total)
        return ____exports.ST:spread(size, index % total + 0.5, total + 1)
    end,
    stack = function(self, radix, values)
        local total = 0
        for ____, ____value in __TS__Iterator(__TS__ArrayEntries(values)) do
            local index = ____value[1]
            local value = ____value[2]
            total = total + value * radix ^ (#values - index - 1)
        end
        return total
    end,
    task = function(self)
        local task
        local complete
        local promise = __TS__New(
            __TS__Promise,
            function(____, resolve)
                complete = function(value)
                    task.active = false
                    resolve(nil, value)
                end
            end
        )
        task = __TS__ObjectAssign(promise, {active = true, complete = complete})
        return task
    end,
    unstack = function(self, radix, value, place)
        return math.floor(value / radix ^ place) % radix
    end,
    view = function(self, screen, inputs, script)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            ____exports.ST.screen = screen
            ____exports.ST.inputs = __TS__ObjectValues(inputs)
            local cleanup = __TS__Await(script(screen, inputs))
            ____exports.ST.scripts = {}
            ____exports.ST.inputs = {}
            ____exports.ST.screen = nil
            screen:cleanup()
            if #____exports.ST.instances ~= 0 then
                __TS__ArrayPushArray(____exports.ST.empty_array, ____exports.ST.instances)
                for ____, instance in ipairs(__TS__ArraySplice(____exports.ST.empty_array, 0)) do
                    instance:stop()
                end
            end
            cleanup()
        end)
    end,
    wave = function(self, value)
        return ____exports.ST:sin(math.floor(((value + 0.5) * 2 - 1) * 180 + 0.5)) / 2 + 0.5
    end,
    weigh = function(self, weights, modifier)
        local total = 0
        for ____, entry in ipairs(weights) do
            total = total + entry[2]
        end
        local value = modifier * total
        for ____, entry in ipairs(weights) do
            total = total - entry[2]
            if value > total then
                return entry[1]
            end
        end
    end,
    when = function(self, condition)
        return __TS__New(
            __TS__Promise,
            function(____, resolve)
                local ____self_scripts_201 = self.scripts
                ____self_scripts_201[#____self_scripts_201 + 1] = function()
                    if condition() then
                        resolve(nil)
                        return true
                    else
                        return false
                    end
                end
            end
        )
    end
}
love.run = function()
    collectgarbage("stop")
    love.audio.setEffect(____exports.ST.distance.name_a, ____exports.ST.distance.properties_a)
    love.audio.setEffect(____exports.ST.distance.name_b, ____exports.ST.distance.properties_b)
    love.graphics.setBlendMode("alpha", "alphamultiply")
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    love.graphics.setLineStyle("rough")
    love.timer.step()
    return function()
        local result = events()
        local ____temp_204 = result ~= nil
        if ____temp_204 then
            local ____opt_202 = ____exports.ST.acquit
            ____temp_204 = (____opt_202 and ____opt_202(result)) ~= true
        end
        if ____temp_204 then
            while #____exports.ST.disk.files ~= 0 do
                for ____, file in ipairs(__TS__ArraySplice(____exports.ST.disk.files, 0)) do
                    ____exports.ST.disk.channel:push(file)
                end
                if not ____exports.ST.disk.thread:isRunning() then
                    ____exports.ST.disk.thread:start()
                end
                ____exports.ST.disk.thread:wait()
            end
            return result
        end
        for ____, superscript in ipairs(____exports.ST.superscripts) do
            superscript()
        end
        if #____exports.ST.instances ~= 0 then
            local index = #____exports.ST.instances
            while true do
                local ____index_205 = index
                index = ____index_205 - 1
                if not (____index_205 ~= 0) then
                    break
                end
                ____exports.ST.instances[index + 1]:update()
            end
        end
        for ____, input in ipairs(____exports.ST.inputs) do
            input:update()
        end
        local ____exports_ST_206, ____delta_207 = ____exports.ST, "delta"
        local ____exports_ST_delta_208 = ____exports_ST_206[____delta_207] + math.min(
            love.timer.step() * ____exports.ST.fps * ____exports.ST.speed,
            1
        )
        ____exports_ST_206[____delta_207] = ____exports_ST_delta_208
        if 1 <= ____exports_ST_delta_208 then
            local ____exports_ST_209, ____delta_210 = ____exports.ST, "delta"
            ____exports_ST_209[____delta_210] = ____exports_ST_209[____delta_210] - 1
            local ____exports_ST_211, ____time_212 = ____exports.ST, "time"
            ____exports_ST_211[____time_212] = ____exports_ST_211[____time_212] + 1
            for ____, input in ipairs(____exports.ST.inputs) do
                input:fire()
            end
            if #____exports.ST.scripts ~= 0 then
                __TS__ArrayPushArray(____exports.ST.empty_array, ____exports.ST.scripts)
                for ____, script in ipairs(__TS__ArraySplice(____exports.ST.empty_array, 0)) do
                    if script() then
                        __TS__ArraySplice(
                            ____exports.ST.scripts,
                            __TS__ArrayIndexOf(____exports.ST.scripts, script),
                            1
                        )
                    end
                end
            end
            local width = ____exports.ST.width * ____exports.ST.scale
            local height = ____exports.ST.height * ____exports.ST.scale
            if ____exports.ST.canvas == nil or ____exports.ST.canvas:getWidth() ~= width or ____exports.ST.canvas:getHeight() ~= height then
                local ____opt_213 = ____exports.ST.canvas
                if ____opt_213 ~= nil then
                    ____opt_213:release()
                end
                ____exports.ST.canvas = love.graphics.newCanvas(width, height)
            end
            if ____exports.ST.screen == nil then
                love.graphics.clear()
            else
                ____exports.ST.screen:tick()
                if ____exports.ST.debug then
                    ____exports.ST.canvas_debug = love.graphics.newCanvas(width, height)
                    love.graphics.setCanvas(____exports.ST.canvas_debug)
                    love.graphics.clear()
                end
                love.graphics.setCanvas(____exports.ST.canvas)
                love.graphics.clear()
                love.graphics.push()
                love.graphics.translate(width / 2, height / 2)
                love.graphics.scale(____exports.ST.scale)
                ____exports.ST.screen:draw()
                love.graphics.pop()
                if ____exports.ST.debug then
                    love.graphics.draw(____exports.ST.canvas_debug)
                    ____exports.ST.canvas_debug:release()
                    ____exports.ST.canvas_debug = nil
                end
                love.graphics.setCanvas()
            end
            local win_width, win_height = love.window.getMode()
            local x = 0
            local y = 0
            local scale
            if width / height < win_width / win_height then
                scale = win_height / height
                x = (win_width - width * scale) / 2
            else
                scale = win_width / width
                y = (win_height - height * scale) / 2
            end
            love.graphics.clear()
            love.graphics.setBlendMode("alpha", "premultiplied")
            love.graphics.draw(
                ____exports.ST.canvas,
                x,
                y,
                0,
                scale,
                scale
            )
            love.graphics.setBlendMode("alpha", "alphamultiply")
            love.graphics.present()
            if #____exports.ST.disk.files ~= 0 then
                for ____, file in ipairs(__TS__ArraySplice(____exports.ST.disk.files, 0)) do
                    ____exports.ST.disk.channel:push(file)
                end
                if not ____exports.ST.disk.thread:isRunning() then
                    ____exports.ST.disk.thread:start()
                end
            end
            collectgarbage("collect")
        end
        love.timer.sleep(0.001)
    end
end
return ____exports
