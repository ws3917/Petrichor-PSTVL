local ____lualib = require("lualib_bundle")
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__StringSlice = ____lualib.__TS__StringSlice
local __TS__Delete = ____lualib.__TS__Delete
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STAnimation = ____storyteller.STAnimation
local STAtlas = ____storyteller.STAtlas
local STContainer = ____storyteller.STContainer
local STFacing = ____storyteller.STFacing
local STFont = ____storyteller.STFont
local STHitbox = ____storyteller.STHitbox
local STInput = ____storyteller.STInput
local STMap = ____storyteller.STMap
local STRectangle = ____storyteller.STRectangle
local STScreen = ____storyteller.STScreen
local STSprite = ____storyteller.STSprite
local STText = ____storyteller.STText
local ____utils = require("code.engine.utils")
local EXPoint = ____utils.EXPoint
local ____outline = require("code.shaders.outline")
local outlineShader = ____outline.default
local ____mixer = require("code.systems.mixer")
local mixerSystem = ____mixer.default
local utf8 = require("utf8")
function ____exports.default()
    local ____require_result_0 = require("code/maps/" .. arg[__TS__ArrayIndexOf(arg, "editor") + 1 + 1])
    local resourcesGen = ____require_result_0.resourcesGen
    local ____mixerSystem_result_1 = mixerSystem()
    local music = ____mixerSystem_result_1.music
    local sound = ____mixerSystem_result_1.sound
    local ____resourcesGen_result_2 = resourcesGen(music, sound)
    local daemons = ____resourcesGen_result_2.daemons
    if daemons == nil then
        daemons = {}
    end
    local file = ____resourcesGen_result_2.file
    local framess = ____resourcesGen_result_2.framess
    if framess == nil then
        framess = {}
    end
    local images = ____resourcesGen_result_2.images
    if images == nil then
        images = {}
    end
    local sheet = ____resourcesGen_result_2.sheet
    local map = __TS__New(
        STMap,
        {
            objects = function()
                return {
                    {},
                    function()
                    end
                }
            end,
            rooms = {},
            sheet = sheet,
            transition = {
                7,
                0,
                1,
                1,
                1
            }
        }
    )
    local wrapper
    wrapper = __TS__New(
        STContainer,
        {
            scale = 1 / 2 ^ (1 / 4),
            children = {
                map,
                __TS__New(STRectangle, {color = 16711935}):addTicker(function(self)
                    self.alpha.value = wrapper.scale.x < 1 and 0.1 or 0
                    self.position.x = map.position.x + (map.camera_min.x - 120)
                    self.position.y = map.position.y + (map.camera_min.y - 90)
                    self.size.x = 240 + (map.camera_max.x - map.camera_min.x)
                    self.size.y = 180 + (map.camera_max.y - map.camera_min.y)
                end),
                __TS__New(STRectangle, {color = 16711935, size = {x = 240, y = 180}, anchor = 0.5}):addTicker(function(self)
                    self.alpha.value = wrapper.scale.x < 1 and 0.1 or 0
                end)
            }
        }
    )
    love.filesystem.setIdentity("dist")
    return ST:view(
        __TS__New(STScreen, {children = {wrapper}}),
        {
            ctrl = __TS__New(
                STInput,
                {function() return love.keyboard.isDown("lctrl", "rctrl") end}
            ),
            left = __TS__New(
                STInput,
                {function() return love.keyboard.isDown("a") end}
            ),
            right = __TS__New(
                STInput,
                {function() return love.keyboard.isDown("d") end}
            ),
            shift = __TS__New(
                STInput,
                {function() return love.keyboard.isDown("lshift", "rshift") end}
            )
        },
        function(screen, inputs)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                local editor
                local width = ST.width
                local height = ST.height
                local data = ST:decode((love.filesystem.read("string", file)))
                local atlas
                atlas = __TS__New(
                    STAtlas,
                    {
                        list = {
                            grid = function(self)
                                return __TS__ArrayMap(
                                    editor:list(),
                                    function(____, value) return {value} end
                                )
                            end,
                            position = {x = 0, y = 0},
                            next = function(self)
                                atlas:switch("string")
                            end,
                            prev = function(self)
                                atlas:switch(editor.atlas_prev)
                            end,
                            from = function(self, ____self, target)
                                if target ~= "string" then
                                    ____self.position.x = 0
                                    ____self.position.y = 0
                                    editor.atlas_prev = target
                                end
                            end
                        },
                        neighbors = {
                            grid = function(self)
                                local list = editor:room().neighbors or ({})
                                return __TS__ArrayMap(
                                    {"add", "index", "offset", "remove"},
                                    function(____, item) return ST:populate(
                                        #list,
                                        function() return item end
                                    ) end
                                )
                            end,
                            position = {x = 0, y = 0},
                            from = function(self, ____self, target)
                                if target == "rooms" then
                                    ____self.position.x = 0
                                    ____self.position.y = 0
                                end
                            end,
                            prev = function(self)
                                atlas:switch("rooms")
                            end,
                            next = function(self)
                                local selection = atlas:selection()
                                repeat
                                    local ____switch25 = selection
                                    local ____cond25 = ____switch25 == "add"
                                    if ____cond25 then
                                        if inputs.ctrl.held then
                                            local neighbors = editor:room().neighbors
                                            local ____editor_insert_11 = editor.insert
                                            local ____atlas_navigators_neighbors_position_x_10 = atlas.navigators.neighbors.position.x
                                            local ____ST_8 = ST
                                            local ____ST_decode_9 = ST.decode
                                            local ____ST_6 = ST
                                            local ____ST_encode_7 = ST.encode
                                            local ____atlas_navigators_neighbors_position_3, ____x_4 = atlas.navigators.neighbors.position, "x"
                                            local ____atlas_navigators_neighbors_position_x_5 = ____atlas_navigators_neighbors_position_3[____x_4]
                                            ____atlas_navigators_neighbors_position_3[____x_4] = ____atlas_navigators_neighbors_position_x_5 + 1
                                            ____editor_insert_11(
                                                editor,
                                                neighbors,
                                                ____atlas_navigators_neighbors_position_x_10,
                                                ____ST_decode_9(
                                                    ____ST_8,
                                                    ____ST_encode_7(____ST_6, neighbors[____atlas_navigators_neighbors_position_x_5 + 1])
                                                )
                                            )
                                        else
                                            local ____editor_insert_16 = editor.insert
                                            local ____table_neighbors_15 = editor:room().neighbors
                                            local ____atlas_navigators_neighbors_position_12, ____x_13 = atlas.navigators.neighbors.position, "x"
                                            local ____atlas_navigators_neighbors_position_x_14 = ____atlas_navigators_neighbors_position_12[____x_13]
                                            ____atlas_navigators_neighbors_position_12[____x_13] = ____atlas_navigators_neighbors_position_x_14 + 1
                                            ____editor_insert_16(editor, ____table_neighbors_15, ____atlas_navigators_neighbors_position_x_14, {0, 0, 0})
                                        end
                                        editor:refresh()
                                        break
                                    end
                                    ____cond25 = ____cond25 or ____switch25 == "offset"
                                    if ____cond25 then
                                        atlas:switch("point")
                                        break
                                    end
                                    ____cond25 = ____cond25 or ____switch25 == "remove"
                                    if ____cond25 then
                                        do
                                            local room = editor:room()
                                            local neighbors = room.neighbors
                                            if #neighbors > 1 then
                                                local index = atlas.navigators.neighbors.position.x
                                                __TS__ArraySplice(neighbors, index, 1)
                                                editor:refresh()
                                                if index == #neighbors then
                                                    local ____atlas_navigators_neighbors_position_17, ____x_18 = atlas.navigators.neighbors.position, "x"
                                                    ____atlas_navigators_neighbors_position_17[____x_18] = ____atlas_navigators_neighbors_position_17[____x_18] - 1
                                                end
                                            else
                                                editor:room().neighbors = nil
                                                editor:refresh()
                                                atlas:switch("rooms")
                                            end
                                            break
                                        end
                                    end
                                until true
                            end
                        },
                        object = {
                            grid = function(self)
                                return {{0, 1, 2}}
                            end,
                            position = {x = 0, y = 0},
                            next = function(self)
                                local ____type = atlas:selection()
                                local objects = editor:room().objects
                                local ano = atlas.navigators.objects
                                if #objects == 0 then
                                    ano.position.x = 0
                                end
                                local ____temp_22
                                if editor.atlas_prev == "objects" then
                                    local ____ano_position_19, ____x_20 = ano.position, "x"
                                    local ____ano_position_x_21 = ____ano_position_19[____x_20]
                                    ____ano_position_19[____x_20] = ____ano_position_x_21 + 1
                                    ____temp_22 = ____ano_position_x_21
                                else
                                    ____temp_22 = #objects - 1
                                end
                                local index = ____temp_22
                                editor:insert(objects, index, ____type == 0 and ({type = ____type}) or (____type == 1 and ({type = ____type, image = ""}) or ({type = ____type, frames = ""})))
                                editor:refresh()
                                atlas:switch("objects")
                                ano.position.x = index + 1
                                ano.position.y = math.min(
                                    ano.position.y,
                                    #ano:grid(ano) - 1
                                )
                            end,
                            from = function(self, ____self, target)
                                if target == "rooms" or target == "objects" then
                                    ____self.position.x = 0
                                    ____self.position.y = 0
                                    editor.atlas_prev = target
                                end
                            end,
                            prev = function(self)
                                atlas:switch(editor.atlas_prev)
                            end
                        },
                        objects = {
                            grid = function(self)
                                local list = editor:room().objects
                                local ____type = list[atlas.navigators.objects.position.x + 1].type
                                local ____array_23 = __TS__SparseArrayNew(
                                    "add",
                                    "anchor",
                                    "autosort",
                                    "position",
                                    "rotation",
                                    "priority",
                                    "scale",
                                    "tags",
                                    unpack(____type == 0 and ({
                                        "interactable",
                                        "obstacle",
                                        "script",
                                        "size",
                                        "walkable"
                                    }) or (____type == 1 and ({"crop_min", "crop_max", "image"}) or ({
                                        "crop_min",
                                        "crop_max",
                                        "direction",
                                        "duration",
                                        "frame",
                                        "frames",
                                        "step"
                                    })))
                                )
                                __TS__SparseArrayPush(____array_23, "remove")
                                return __TS__ArrayMap(
                                    {__TS__SparseArraySpread(____array_23)},
                                    function(____, item) return ST:populate(
                                        #list,
                                        function() return item end
                                    ) end
                                )
                            end,
                            position = {x = 0, y = 0},
                            from = function(self, ____self, target)
                                if target == "rooms" then
                                    ____self.position.x = 0
                                    ____self.position.y = 0
                                elseif target == "object" then
                                    ____self.position.y = 0
                                end
                            end,
                            prev = function(self)
                                atlas:switch("rooms")
                            end,
                            next = function(self)
                                local selection = atlas:selection()
                                repeat
                                    local ____switch46 = selection
                                    local ____cond46 = ____switch46 == "add"
                                    if ____cond46 then
                                        if inputs.ctrl.held then
                                            local objects = editor:room().objects
                                            local ano = atlas.navigators.objects
                                            local ____editor_insert_32 = editor.insert
                                            local ____ano_position_x_31 = ano.position.x
                                            local ____ST_29 = ST
                                            local ____ST_decode_30 = ST.decode
                                            local ____ST_27 = ST
                                            local ____ST_encode_28 = ST.encode
                                            local ____ano_position_24, ____x_25 = ano.position, "x"
                                            local ____ano_position_x_26 = ____ano_position_24[____x_25]
                                            ____ano_position_24[____x_25] = ____ano_position_x_26 + 1
                                            ____editor_insert_32(
                                                editor,
                                                objects,
                                                ____ano_position_x_31,
                                                ____ST_decode_30(
                                                    ____ST_29,
                                                    ____ST_encode_28(____ST_27, objects[____ano_position_x_26 + 1])
                                                )
                                            )
                                            ano.position.y = math.min(
                                                ano.position.y,
                                                #ano:grid(ano) - 1
                                            )
                                            editor:refresh()
                                        else
                                            atlas:switch("object")
                                        end
                                        break
                                    end
                                    ____cond46 = ____cond46 or ____switch46 == "tags"
                                    if ____cond46 then
                                        do
                                            local object = editor:room().objects[atlas.navigators.objects.position.x + 1]
                                            if object.tags == nil then
                                                object.tags = {""}
                                                editor:refresh()
                                            end
                                            atlas:switch("list")
                                            break
                                        end
                                    end
                                    ____cond46 = ____cond46 or ____switch46 == "script"
                                    if ____cond46 then
                                        do
                                            local object = editor:room().objects[atlas.navigators.objects.position.x + 1]
                                            if object.script == nil then
                                                object.script = {""}
                                                editor:refresh()
                                            end
                                            atlas:switch("list")
                                            break
                                        end
                                    end
                                    ____cond46 = ____cond46 or (____switch46 == "anchor" or ____switch46 == "position" or ____switch46 == "scale" or ____switch46 == "size" or ____switch46 == "crop_min" or ____switch46 == "crop_max")
                                    if ____cond46 then
                                        atlas:switch("point")
                                        break
                                    end
                                    ____cond46 = ____cond46 or (____switch46 == "image" or ____switch46 == "frames")
                                    if ____cond46 then
                                        atlas:switch("string")
                                        break
                                    end
                                    ____cond46 = ____cond46 or ____switch46 == "remove"
                                    if ____cond46 then
                                        do
                                            local room = editor:room()
                                            local objects = room.objects
                                            if #objects > 1 then
                                                local ano = atlas.navigators.objects
                                                local index = ano.position.x
                                                __TS__ArraySplice(objects, index, 1)
                                                editor:refresh()
                                                if index == #objects then
                                                    local ____ano_position_33, ____x_34 = ano.position, "x"
                                                    ____ano_position_33[____x_34] = ____ano_position_33[____x_34] - 1
                                                end
                                                ano.position.y = math.min(
                                                    ano.position.y,
                                                    #ano:grid(ano) - 1
                                                )
                                            else
                                                __TS__ArraySplice(
                                                    editor:room().objects,
                                                    0
                                                )
                                                editor:refresh()
                                                atlas:switch("rooms")
                                            end
                                            break
                                        end
                                    end
                                until true
                            end
                        },
                        point = {
                            grid = function(self)
                                return {{}}
                            end,
                            position = {x = 0, y = 0},
                            from = function(self, ____self, target)
                                editor.atlas_prev = target
                            end
                        },
                        rooms = {
                            grid = function(self)
                                local list = data.rooms
                                return __TS__ArrayMap(
                                    {
                                        "add",
                                        "camera_min",
                                        "camera_max",
                                        "neighbors",
                                        "objects",
                                        "score",
                                        "remove"
                                    },
                                    function(____, item) return ST:populate(
                                        #list,
                                        function() return item end
                                    ) end
                                )
                            end,
                            position = {x = 0, y = 0},
                            next = function(self)
                                local selection = atlas:selection()
                                repeat
                                    local ____switch63 = selection
                                    local ____cond63 = ____switch63 == "add"
                                    if ____cond63 then
                                        if inputs.ctrl.held then
                                            local ____editor_insert_45 = editor.insert
                                            local ____data_rooms_43 = data.rooms
                                            local ____atlas_navigators_rooms_position_x_44 = atlas.navigators.rooms.position.x
                                            local ____ST_41 = ST
                                            local ____ST_decode_42 = ST.decode
                                            local ____ST_39 = ST
                                            local ____ST_encode_40 = ST.encode
                                            local ____data_rooms_38 = data.rooms
                                            local ____atlas_navigators_rooms_position_35, ____x_36 = atlas.navigators.rooms.position, "x"
                                            local ____atlas_navigators_rooms_position_x_37 = ____atlas_navigators_rooms_position_35[____x_36]
                                            ____atlas_navigators_rooms_position_35[____x_36] = ____atlas_navigators_rooms_position_x_37 + 1
                                            ____editor_insert_45(
                                                editor,
                                                ____data_rooms_43,
                                                ____atlas_navigators_rooms_position_x_44,
                                                ____ST_decode_42(
                                                    ____ST_41,
                                                    ____ST_encode_40(____ST_39, ____data_rooms_38[____atlas_navigators_rooms_position_x_37 + 1])
                                                )
                                            )
                                        else
                                            local ____editor_insert_50 = editor.insert
                                            local ____data_rooms_49 = data.rooms
                                            local ____atlas_navigators_rooms_position_46, ____x_47 = atlas.navigators.rooms.position, "x"
                                            local ____atlas_navigators_rooms_position_x_48 = ____atlas_navigators_rooms_position_46[____x_47]
                                            ____atlas_navigators_rooms_position_46[____x_47] = ____atlas_navigators_rooms_position_x_48 + 1
                                            ____editor_insert_50(editor, ____data_rooms_49, ____atlas_navigators_rooms_position_x_48, {objects = {}})
                                        end
                                        editor:refresh()
                                        break
                                    end
                                    ____cond63 = ____cond63 or (____switch63 == "camera_min" or ____switch63 == "camera_max")
                                    if ____cond63 then
                                        atlas:switch("point")
                                        break
                                    end
                                    ____cond63 = ____cond63 or ____switch63 == "neighbors"
                                    if ____cond63 then
                                        do
                                            local room = editor:room()
                                            if room.neighbors == nil then
                                                room.neighbors = {{0, 0, 0}}
                                                editor:refresh()
                                            end
                                            atlas:switch("neighbors")
                                            break
                                        end
                                    end
                                    ____cond63 = ____cond63 or ____switch63 == "objects"
                                    if ____cond63 then
                                        if #editor:room().objects == 0 then
                                            atlas:switch("object")
                                        else
                                            atlas:switch("objects")
                                        end
                                        break
                                    end
                                    ____cond63 = ____cond63 or ____switch63 == "score"
                                    if ____cond63 then
                                        do
                                            local room = editor:room()
                                            if room.score == nil then
                                                room.score = {daemon = ""}
                                                editor:refresh()
                                            end
                                            atlas:switch("score")
                                            break
                                        end
                                    end
                                    ____cond63 = ____cond63 or ____switch63 == "remove"
                                    if ____cond63 then
                                        if #data.rooms > 1 then
                                            local index = atlas.navigators.rooms.position.x
                                            __TS__ArraySplice(data.rooms, index, 1)
                                            editor:refresh()
                                            if index == #data.rooms then
                                                local ____atlas_navigators_rooms_position_51, ____x_52 = atlas.navigators.rooms.position, "x"
                                                ____atlas_navigators_rooms_position_51[____x_52] = ____atlas_navigators_rooms_position_51[____x_52] - 1
                                            end
                                        else
                                            __TS__ArraySplice(data.rooms, 0)
                                            editor:save()
                                            atlas:switch(nil)
                                            screen:detach(editor.display)
                                            love.event.quit()
                                        end
                                        break
                                    end
                                until true
                            end
                        },
                        score = {
                            grid = function(self)
                                return {
                                    {"daemon"},
                                    {"distance"},
                                    {"gain"},
                                    {"rate"},
                                    {"remove"}
                                }
                            end,
                            position = {x = 0, y = 0},
                            from = function(self, ____self, target)
                                if target == "rooms" then
                                    ____self.position.x = 0
                                    ____self.position.y = 0
                                end
                            end,
                            next = function(self)
                                repeat
                                    local ____switch79 = atlas:selection()
                                    local ____cond79 = ____switch79 == "daemon"
                                    if ____cond79 then
                                        atlas:switch("string")
                                        break
                                    end
                                    ____cond79 = ____cond79 or ____switch79 == "remove"
                                    if ____cond79 then
                                        editor:room().score = nil
                                        atlas:switch("rooms")
                                        break
                                    end
                                until true
                            end,
                            prev = function(self)
                                atlas:switch("rooms")
                            end
                        },
                        string = {
                            grid = function(self)
                                return {{}}
                            end,
                            position = {x = 0, y = 0},
                            from = function(self, ____self, target)
                                if target == "list" then
                                    editor.atlas_list = true
                                else
                                    editor.atlas_list = false
                                    editor.atlas_prev = target
                                end
                            end
                        }
                    }
                )
                local outline = outlineShader({color = {red = 0, green = 0, blue = 0}, alpha = 0.5, thickness = 1})
                editor = {
                    atlas_list = false,
                    atlas_prev = nil,
                    charmap = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789$_",
                    display = __TS__New(
                        STText,
                        {
                            anchor = {y = 1},
                            scale = 0.75,
                            font = __TS__New(STFont, "fonts/helloplayer.csv", "fonts/helloplayer.png"),
                            position = {x = -115, y = 85},
                            spacing = {y = -0.5}
                        }
                    ):addTicker(function(self)
                        repeat
                            local ____switch86 = atlas.target
                            local ____cond86 = ____switch86 == "list"
                            if ____cond86 then
                                do
                                    local list = editor:list()
                                    self.content = editor:render(
                                        {
                                            atlas.navigators.objects.position.y == 7 and "Tags" or "Script",
                                            unpack(__TS__ArrayMap(
                                                list,
                                                function(____, value) return ("> \"" .. value) .. "\"" end
                                            ))
                                        },
                                        atlas.navigators.list.position.y + 1,
                                        function() return 16776960 end
                                    )
                                    break
                                end
                            end
                            ____cond86 = ____cond86 or ____switch86 == "neighbors"
                            if ____cond86 then
                                do
                                    local index = atlas.navigators.neighbors.position.x
                                    local neighbors = editor:room().neighbors
                                    local neighbor = neighbors[index + 1]
                                    self.content = editor:render(
                                        {
                                            (("Neighbor " .. tostring(index)) .. " / ") .. tostring((neighbors and #neighbors) - 1),
                                            ("Index (" .. tostring(neighbor[1])) .. ")",
                                            ((("Offset (" .. tostring(neighbor[2])) .. ", ") .. tostring(neighbor[3])) .. ")",
                                            "Remove"
                                        },
                                        atlas.navigators.neighbors.position.y,
                                        function(index) return index == 0 and 8355839 or (index == 3 and 16727871 or 16776960) end
                                    )
                                    break
                                end
                            end
                            ____cond86 = ____cond86 or ____switch86 == "object"
                            if ____cond86 then
                                do
                                    self.content = ("Object (" .. ({"Hitbox", "Sprite", "Animation"})[atlas.navigators.object.position.x + 1]) .. ")"
                                    break
                                end
                            end
                            ____cond86 = ____cond86 or ____switch86 == "objects"
                            if ____cond86 then
                                do
                                    local index = atlas.navigators.objects.position.x
                                    local objects = editor:room().objects
                                    local object = objects[index + 1]
                                    local ____array_108 = __TS__SparseArrayNew(((((("Object " .. tostring(index)) .. " / ") .. tostring(#objects - 1)) .. " (") .. (object.type == 0 and "Hitbox" or (object.type == 1 and "Sprite" or "Animation"))) .. ")")
                                    local ____opt_55 = object.anchor
                                    local ____temp_59 = ____opt_55 and ____opt_55.x or 0
                                    local ____opt_57 = object.anchor
                                    __TS__SparseArrayPush(
                                        ____array_108,
                                        ((("Anchor (" .. tostring(____temp_59)) .. ", ") .. tostring(____opt_57 and ____opt_57.y or 0)) .. ")"
                                    )
                                    local ____object_autosort_60 = object.autosort
                                    if ____object_autosort_60 == nil then
                                        ____object_autosort_60 = false
                                    end
                                    __TS__SparseArrayPush(
                                        ____array_108,
                                        ("Autosort (" .. tostring(____object_autosort_60)) .. ")"
                                    )
                                    local ____opt_61 = object.position
                                    local ____temp_65 = ____opt_61 and ____opt_61.x or 0
                                    local ____opt_63 = object.position
                                    __TS__SparseArrayPush(
                                        ____array_108,
                                        ((("Position (" .. tostring(____temp_65)) .. ", ") .. tostring(____opt_63 and ____opt_63.y or 0)) .. ")",
                                        ("Rotation (" .. tostring(object.rotation or 0)) .. ")",
                                        ("Priority (" .. tostring(object.priority or 0)) .. ")"
                                    )
                                    local ____opt_66 = object.scale
                                    local ____temp_70 = ____opt_66 and ____opt_66.x or 1
                                    local ____opt_68 = object.scale
                                    __TS__SparseArrayPush(
                                        ____array_108,
                                        ((("Scale (" .. tostring(____temp_70)) .. ", ") .. tostring(____opt_68 and ____opt_68.y or 1)) .. ")"
                                    )
                                    local ____opt_71 = object.tags
                                    __TS__SparseArrayPush(
                                        ____array_108,
                                        ("Tags [" .. tostring(____opt_71 and #____opt_71 or 0)) .. "]"
                                    )
                                    local ____temp_107
                                    if object.type == 0 then
                                        local ____object_interactable_73 = object.interactable
                                        if ____object_interactable_73 == nil then
                                            ____object_interactable_73 = false
                                        end
                                        local ____array_83 = __TS__SparseArrayNew(("Interactable (" .. tostring(____object_interactable_73)) .. ")")
                                        local ____object_obstacle_74 = object.obstacle
                                        if ____object_obstacle_74 == nil then
                                            ____object_obstacle_74 = false
                                        end
                                        __TS__SparseArrayPush(
                                            ____array_83,
                                            ("Obstacle (" .. tostring(____object_obstacle_74)) .. ")"
                                        )
                                        local ____opt_75 = object.script
                                        __TS__SparseArrayPush(
                                            ____array_83,
                                            ("Script [" .. tostring(____opt_75 and #____opt_75 or 0)) .. "]"
                                        )
                                        local ____opt_77 = object.size
                                        local ____temp_81 = ____opt_77 and ____opt_77.x or 0
                                        local ____opt_79 = object.size
                                        __TS__SparseArrayPush(
                                            ____array_83,
                                            ((("Size (" .. tostring(____temp_81)) .. ", ") .. tostring(____opt_79 and ____opt_79.y or 0)) .. ")"
                                        )
                                        local ____object_walkable_82 = object.walkable
                                        if ____object_walkable_82 == nil then
                                            ____object_walkable_82 = false
                                        end
                                        __TS__SparseArrayPush(
                                            ____array_83,
                                            ("Walkable (" .. tostring(____object_walkable_82)) .. ")"
                                        )
                                        ____temp_107 = {__TS__SparseArraySpread(____array_83)}
                                    else
                                        local ____temp_106
                                        if object.type == 1 then
                                            local ____opt_84 = object.crop
                                            local ____temp_88 = ____opt_84 and ____opt_84.top or 0
                                            local ____opt_86 = object.crop
                                            local ____temp_94 = ((("Crop Top Left <" .. tostring(____temp_88)) .. ", ") .. tostring(____opt_86 and ____opt_86.left or 0)) .. ">"
                                            local ____opt_89 = object.crop
                                            local ____temp_93 = ____opt_89 and ____opt_89.bottom or 0
                                            local ____opt_91 = object.crop
                                            ____temp_106 = {
                                                ____temp_94,
                                                ((("Crop Bottom Right <" .. tostring(____temp_93)) .. ", ") .. tostring(____opt_91 and ____opt_91.right or 0)) .. ">",
                                                ("Image \"" .. object.image) .. "\""
                                            }
                                        else
                                            local ____opt_95 = object.crop
                                            local ____temp_99 = ____opt_95 and ____opt_95.top or 0
                                            local ____opt_97 = object.crop
                                            local ____temp_105 = ((("Crop Top Left <" .. tostring(____temp_99)) .. ", ") .. tostring(____opt_97 and ____opt_97.left or 0)) .. ">"
                                            local ____opt_100 = object.crop
                                            local ____temp_104 = ____opt_100 and ____opt_100.bottom or 0
                                            local ____opt_102 = object.crop
                                            ____temp_106 = {
                                                ____temp_105,
                                                ((("Crop Bottom Right <" .. tostring(____temp_104)) .. ", ") .. tostring(____opt_102 and ____opt_102.right or 0)) .. ">",
                                                ("Direction (" .. tostring(object.direction or 0)) .. ")",
                                                ("Duration (" .. tostring(object.duration or 0)) .. ")",
                                                ("Frame (" .. tostring(object.frame or 0)) .. ")",
                                                ("Frames \"" .. object.frames) .. "\"",
                                                ("Step (" .. tostring(object.step or 0)) .. ")"
                                            }
                                        end
                                        ____temp_107 = ____temp_106
                                    end
                                    __TS__SparseArrayPush(
                                        ____array_108,
                                        unpack(____temp_107)
                                    )
                                    __TS__SparseArrayPush(____array_108, "Remove")
                                    local lines = {__TS__SparseArraySpread(____array_108)}
                                    self.content = editor:render(
                                        lines,
                                        atlas.navigators.objects.position.y,
                                        function(index) return index == 0 and 8355839 or (index == #lines - 1 and 16727871 or 16776960) end
                                    )
                                    break
                                end
                            end
                            ____cond86 = ____cond86 or ____switch86 == "point"
                            if ____cond86 then
                                do
                                    local value = editor:point()
                                    self.content = ((((("{color=0x7f7fff}" .. (editor.atlas_prev == "neighbors" and "Offset" or (editor.atlas_prev == "objects" and (atlas.navigators.objects.position.y == 1 and "Anchor" or (atlas.navigators.objects.position.y == 3 and "Position" or (atlas.navigators.objects.position.y == 6 and "Scale" or (atlas.navigators.objects.position.y == 8 and "Crop Top Left" or (atlas.navigators.objects.position.y == 9 and "Crop Bottom Right" or "Size"))))) or (atlas.navigators.rooms.position.y == 1 and "Camera Min" or "Camera Max")))) .. " (") .. tostring(value.x)) .. ", ") .. tostring(value.y)) .. ")"
                                    break
                                end
                            end
                            ____cond86 = ____cond86 or ____switch86 == "rooms"
                            if ____cond86 then
                                do
                                    local index = atlas.navigators.rooms.position.x
                                    local room = data.rooms[index + 1]
                                    local ____editor_render_124 = editor.render
                                    local ____array_123 = __TS__SparseArrayNew((("Room " .. tostring(index)) .. " / ") .. tostring(#data.rooms - 1))
                                    local ____opt_109 = room.camera_min
                                    local ____temp_113 = ____opt_109 and ____opt_109.x or 0
                                    local ____opt_111 = room.camera_min
                                    __TS__SparseArrayPush(
                                        ____array_123,
                                        ((("Camera Min (" .. tostring(____temp_113)) .. ", ") .. tostring(____opt_111 and ____opt_111.y or 0)) .. ")"
                                    )
                                    local ____opt_114 = room.camera_max
                                    local ____temp_118 = ____opt_114 and ____opt_114.x or 0
                                    local ____opt_116 = room.camera_max
                                    __TS__SparseArrayPush(
                                        ____array_123,
                                        ((("Camera Max (" .. tostring(____temp_118)) .. ", ") .. tostring(____opt_116 and ____opt_116.y or 0)) .. ")"
                                    )
                                    local ____opt_119 = room.neighbors
                                    __TS__SparseArrayPush(
                                        ____array_123,
                                        ("Neighbors [" .. tostring(____opt_119 and #____opt_119 or 0)) .. "]"
                                    )
                                    local ____opt_121 = room.objects
                                    __TS__SparseArrayPush(
                                        ____array_123,
                                        ("Objects [" .. tostring(____opt_121 and #____opt_121 or 0)) .. "]",
                                        "Score " .. (room.score == nil and "" or ((((((("<" .. room.score.daemon) .. ", ") .. tostring(room.score.distance or 0)) .. ", ") .. tostring(room.score.gain or 1)) .. ", ") .. tostring(room.score.rate or 1)) .. ">"),
                                        "Remove"
                                    )
                                    self.content = ____editor_render_124(
                                        editor,
                                        {__TS__SparseArraySpread(____array_123)},
                                        atlas.navigators.rooms.position.y,
                                        function(index) return index == 0 and 8355839 or (index == 6 and 16727871 or 16776960) end
                                    )
                                    break
                                end
                            end
                            ____cond86 = ____cond86 or ____switch86 == "score"
                            if ____cond86 then
                                do
                                    local index = atlas.navigators.score.position.y
                                    local score = editor:room().score
                                    self.content = editor:render(
                                        {
                                            ("Daemon \"" .. score.daemon) .. "\"",
                                            ("Distance (" .. tostring(score.distance or 0)) .. ")",
                                            ("Gain (" .. tostring(score.gain or 1)) .. ")",
                                            ("Rate (" .. tostring(score.rate or 1)) .. ")",
                                            "Remove"
                                        },
                                        index,
                                        function(index) return index == 4 and 16727871 or 16776960 end
                                    )
                                    break
                                end
                            end
                            ____cond86 = ____cond86 or ____switch86 == "string"
                            if ____cond86 then
                                do
                                    local value = editor:string()
                                    local index = atlas.navigators.objects.position.y
                                    local object = editor:room().objects[atlas.navigators.objects.position.x + 1]
                                    local ____temp_125
                                    if editor.atlas_prev == "objects" then
                                        ____temp_125 = index == 7 or index == 10 and (object.type ~= 1 or images[value] ~= nil) or framess[value] ~= nil
                                    else
                                        ____temp_125 = daemons[value] ~= nil
                                    end
                                    self.content = ((((("{color=" .. tostring(____temp_125 and 8355839 or 16727871)) .. "}") .. (editor.atlas_prev == "objects" and (index == 7 and (("Tag " .. tostring(atlas.navigators.list.position.y)) .. " / ") .. tostring(#editor:list() - 1) or (index == 10 and (object.type == 1 and "Image" or (("Script " .. tostring(atlas.navigators.list.position.y)) .. " / ") .. tostring(#editor:list() - 1)) or "Frames")) or "Daemon")) .. " \"") .. value) .. "\""
                                    break
                                end
                            end
                        until true
                    end):addDrawer(outline.drawer),
                    mouse = {click = {x = 0, y = 0}, value_camera = {x = 0, y = 0}},
                    generate = function(self)
                        map.rooms = __TS__ArrayMap(
                            data.rooms,
                            function(____, room) return {
                                neighbors = room.neighbors,
                                physical = function(self)
                                    return {
                                        {unpack(__TS__ArrayMap(
                                            __TS__ArrayFilter(
                                                __TS__ArrayMap(
                                                    room.objects,
                                                    function(____, object, index) return {object, index} end
                                                ),
                                                function(____, ____bindingPattern0)
                                                    local object
                                                    object = ____bindingPattern0[1]
                                                    return object.type == 0
                                                end
                                            ),
                                            function(____, ____bindingPattern0)
                                                local index
                                                local object
                                                object = ____bindingPattern0[1]
                                                index = ____bindingPattern0[2]
                                                local result = __TS__New(STRectangle, {
                                                    anchor = object.anchor,
                                                    position = object.position,
                                                    priority = object.priority,
                                                    rotation = object.rotation,
                                                    size = object.size,
                                                    scale = object.scale,
                                                    color = {red = object.obstacle and 255 or 31, green = object.interactable and 255 or 31, blue = object.walkable and 255 or 31}
                                                }):addTicker(function(self)
                                                    self.alpha.value = (atlas.target == "objects" or atlas.target == "object" or editor.atlas_prev == "objects") and atlas.navigators.objects.position.x == index and 0.7 or ((object.obstacle or object.interactable or object.walkable) and 0.35 or 0.175)
                                                end):addDrawer(function(self)
                                                    return function()
                                                        if self.size.x ~= 0 and self.size.y ~= 0 then
                                                            love.graphics.rectangle(
                                                                "line",
                                                                self.offset.x + self.size.x * -self.anchor.x,
                                                                self.offset.y + self.size.y * -self.anchor.y,
                                                                self.size.x,
                                                                self.size.y
                                                            )
                                                        end
                                                        if atlas.target ~= "objects" and atlas.target ~= "object" and editor.atlas_prev ~= "objects" or atlas.navigators.objects.position.x ~= index then
                                                            return
                                                        end
                                                        love.graphics.circle("line", 0, 0, 2)
                                                        love.graphics.line(0, 0, self.size.x + self.size.x * self.anchor.x, 0)
                                                    end
                                                end)
                                                if object.autosort then
                                                    result:addTicker(function(self)
                                                        self.priority = self.position.y
                                                    end)
                                                end
                                                return result
                                            end
                                        ))},
                                        function()
                                        end
                                    }
                                end,
                                camera_max = room.camera_max,
                                camera_min = room.camera_min,
                                score = room.score ~= nil and daemons[room.score.daemon] ~= nil and ({gain = room.score.gain or 1, rate = room.score.rate or 1, distance = room.score.distance or 0, daemon = daemons[room.score.daemon]}) or nil,
                                visual = function(self, values, sheet, index1)
                                    return {
                                        {
                                            __TS__New(STAnimation, {frames = sheet, frame = index1, priority = -1}),
                                            unpack(__TS__ArrayMap(
                                                __TS__ArrayFilter(
                                                    __TS__ArrayMap(
                                                        room.objects,
                                                        function(____, object, index2) return {object, index2} end
                                                    ),
                                                    function(____, ____bindingPattern0)
                                                        local object
                                                        object = ____bindingPattern0[1]
                                                        return object.type ~= 0
                                                    end
                                                ),
                                                function(____, ____bindingPattern0)
                                                    local index2
                                                    local object
                                                    object = ____bindingPattern0[1]
                                                    index2 = ____bindingPattern0[2]
                                                    local result
                                                    if object.type == 2 then
                                                        local ____STAnimation_132 = STAnimation
                                                        local ____object_anchor_127 = object.anchor
                                                        local ____object_crop_128 = object.crop
                                                        local ____object_direction_129 = object.direction
                                                        local ____object_duration_130 = object.duration
                                                        local ____object_frame_131 = object.frame
                                                        local ____temp_126
                                                        if framess[object.frames] ~= nil then
                                                            ____temp_126 = framess[object.frames]
                                                        else
                                                            ____temp_126 = nil
                                                        end
                                                        result = __TS__New(____STAnimation_132, {
                                                            anchor = ____object_anchor_127,
                                                            crop = ____object_crop_128,
                                                            direction = ____object_direction_129,
                                                            duration = ____object_duration_130,
                                                            frame = ____object_frame_131,
                                                            frames = ____temp_126,
                                                            position = object.position,
                                                            priority = object.priority,
                                                            rotation = object.rotation,
                                                            scale = object.scale,
                                                            step = object.step
                                                        })
                                                    else
                                                        local ____STSprite_136 = STSprite
                                                        local ____object_anchor_134 = object.anchor
                                                        local ____object_crop_135 = object.crop
                                                        local ____temp_133
                                                        if images[object.image] ~= nil then
                                                            ____temp_133 = images[object.image]
                                                        else
                                                            ____temp_133 = nil
                                                        end
                                                        result = __TS__New(____STSprite_136, {
                                                            anchor = ____object_anchor_134,
                                                            crop = ____object_crop_135,
                                                            image = ____temp_133,
                                                            position = object.position,
                                                            priority = object.priority,
                                                            rotation = object.rotation,
                                                            scale = object.scale
                                                        })
                                                    end
                                                    if atlas.navigators.rooms.position.x == index1 then
                                                        result:addTicker(function(self)
                                                            self.alpha.value = atlas.navigators.objects.position.x == index2 and 1 or 0.5
                                                        end)
                                                    else
                                                        result.alpha.value = 0.5
                                                    end
                                                    if object.autosort then
                                                        result:addTicker(function(self)
                                                            self.priority = self.position.y
                                                        end)
                                                    end
                                                    return result
                                                end
                                            ))
                                        },
                                        function()
                                        end
                                    }
                                end
                            } end
                        )
                    end,
                    insert = function(self, list, position, value)
                        local ____list_138 = list
                        local ____array_137 = __TS__SparseArrayNew(
                            0,
                            #list,
                            unpack(__TS__ArraySlice(list, 0, position + 1))
                        )
                        __TS__SparseArrayPush(
                            ____array_137,
                            value,
                            unpack(__TS__ArraySlice(list, position + 1))
                        )
                        __TS__ArraySplice(
                            ____list_138,
                            __TS__SparseArraySpread(____array_137)
                        )
                    end,
                    list = function(self)
                        if atlas.navigators.objects.position.y == 7 then
                            return editor:room().objects[atlas.navigators.objects.position.x + 1].tags
                        else
                            return editor:room().objects[atlas.navigators.objects.position.x + 1].script
                        end
                    end,
                    point = function(self)
                        repeat
                            local ____switch132 = editor.atlas_prev
                            local ____cond132 = ____switch132 == "neighbors"
                            if ____cond132 then
                                do
                                    local neighbor = editor:room().neighbors[atlas.navigators.neighbors.position.x + 1]
                                    return __TS__New(
                                        EXPoint,
                                        function() return neighbor[2] end,
                                        function() return neighbor[3] end,
                                        function(v)
                                            local ____v_139 = v
                                            neighbor[2] = ____v_139
                                            return ____v_139
                                        end,
                                        function(v)
                                            local ____v_140 = v
                                            neighbor[3] = ____v_140
                                            return ____v_140
                                        end
                                    )
                                end
                            end
                            ____cond132 = ____cond132 or ____switch132 == "objects"
                            if ____cond132 then
                                do
                                    local object = editor:room().objects[atlas.navigators.objects.position.x + 1]
                                    repeat
                                        local ____switch139 = atlas.navigators.objects.position.y
                                        local ____cond139 = ____switch139 == 1
                                        if ____cond139 then
                                            return __TS__New(
                                                EXPoint,
                                                function() return (object.anchor or ({})).x or 0 end,
                                                function() return (object.anchor or ({})).y or 0 end,
                                                function(v)
                                                    local ____object_141, ____anchor_142 = object, "anchor"
                                                    if ____object_141[____anchor_142] == nil then
                                                        ____object_141[____anchor_142] = {}
                                                    end
                                                    local ____v_144 = v
                                                    object.anchor.x = ____v_144
                                                    return ____v_144
                                                end,
                                                function(v)
                                                    local ____object_145, ____anchor_146 = object, "anchor"
                                                    if ____object_145[____anchor_146] == nil then
                                                        ____object_145[____anchor_146] = {}
                                                    end
                                                    local ____v_148 = v
                                                    object.anchor.y = ____v_148
                                                    return ____v_148
                                                end
                                            )
                                        end
                                        ____cond139 = ____cond139 or ____switch139 == 3
                                        if ____cond139 then
                                            return __TS__New(
                                                EXPoint,
                                                function() return (object.position or ({})).x or 0 end,
                                                function() return (object.position or ({})).y or 0 end,
                                                function(v)
                                                    local ____object_149, ____position_150 = object, "position"
                                                    if ____object_149[____position_150] == nil then
                                                        ____object_149[____position_150] = {}
                                                    end
                                                    local ____v_152 = v
                                                    object.position.x = ____v_152
                                                    return ____v_152
                                                end,
                                                function(v)
                                                    local ____object_153, ____position_154 = object, "position"
                                                    if ____object_153[____position_154] == nil then
                                                        ____object_153[____position_154] = {}
                                                    end
                                                    local ____v_156 = v
                                                    object.position.y = ____v_156
                                                    return ____v_156
                                                end
                                            )
                                        end
                                        ____cond139 = ____cond139 or ____switch139 == 6
                                        if ____cond139 then
                                            return __TS__New(
                                                EXPoint,
                                                function() return (object.scale or ({})).x or 1 end,
                                                function() return (object.scale or ({})).y or 1 end,
                                                function(v)
                                                    local ____object_157, ____scale_158 = object, "scale"
                                                    if ____object_157[____scale_158] == nil then
                                                        ____object_157[____scale_158] = {}
                                                    end
                                                    local ____v_160 = v
                                                    object.scale.x = ____v_160
                                                    return ____v_160
                                                end,
                                                function(v)
                                                    local ____object_161, ____scale_162 = object, "scale"
                                                    if ____object_161[____scale_162] == nil then
                                                        ____object_161[____scale_162] = {}
                                                    end
                                                    local ____v_164 = v
                                                    object.scale.y = ____v_164
                                                    return ____v_164
                                                end
                                            )
                                        end
                                        ____cond139 = ____cond139 or ____switch139 == 8
                                        if ____cond139 then
                                            do
                                                local ____object_165, ____crop_166 = object, "crop"
                                                if ____object_165[____crop_166] == nil then
                                                    ____object_165[____crop_166] = {bottom = 0, left = 0, right = 0, top = 0}
                                                end
                                                local crop = object.crop
                                                return __TS__New(
                                                    EXPoint,
                                                    function() return crop.left end,
                                                    function() return crop.top end,
                                                    function(v)
                                                        local ____v_168 = v
                                                        crop.left = ____v_168
                                                        return ____v_168
                                                    end,
                                                    function(v)
                                                        local ____v_169 = v
                                                        crop.top = ____v_169
                                                        return ____v_169
                                                    end
                                                )
                                            end
                                        end
                                        ____cond139 = ____cond139 or ____switch139 == 9
                                        if ____cond139 then
                                            do
                                                local ____object_170, ____crop_171 = object, "crop"
                                                if ____object_170[____crop_171] == nil then
                                                    ____object_170[____crop_171] = {bottom = 0, left = 0, right = 0, top = 0}
                                                end
                                                local crop = object.crop
                                                return __TS__New(
                                                    EXPoint,
                                                    function() return crop.right end,
                                                    function() return crop.bottom end,
                                                    function(v)
                                                        local ____v_173 = v
                                                        crop.right = ____v_173
                                                        return ____v_173
                                                    end,
                                                    function(v)
                                                        local ____v_174 = v
                                                        crop.bottom = ____v_174
                                                        return ____v_174
                                                    end
                                                )
                                            end
                                        end
                                        do
                                            return __TS__New(
                                                EXPoint,
                                                function() return (object.size or ({})).x or 0 end,
                                                function() return (object.size or ({})).y or 0 end,
                                                function(v)
                                                    local ____object_175, ____size_176 = object, "size"
                                                    if ____object_175[____size_176] == nil then
                                                        ____object_175[____size_176] = {}
                                                    end
                                                    local ____v_178 = v
                                                    object.size.x = ____v_178
                                                    return ____v_178
                                                end,
                                                function(v)
                                                    local ____object_179, ____size_180 = object, "size"
                                                    if ____object_179[____size_180] == nil then
                                                        ____object_179[____size_180] = {}
                                                    end
                                                    local ____v_182 = v
                                                    object.size.y = ____v_182
                                                    return ____v_182
                                                end
                                            )
                                        end
                                    until true
                                end
                            end
                            do
                                if atlas.navigators.rooms.position.y == 1 then
                                    return __TS__New(
                                        EXPoint,
                                        function() return (editor:room().camera_min or ({})).x or 0 end,
                                        function() return (editor:room().camera_min or ({})).y or 0 end,
                                        function(v)
                                            local ____temp_183, ____camera_min_184 = editor:room(), "camera_min"
                                            if ____temp_183[____camera_min_184] == nil then
                                                ____temp_183[____camera_min_184] = {}
                                            end
                                            local ____v_186 = v
                                            editor:room().camera_min.x = ____v_186
                                            return ____v_186
                                        end,
                                        function(v)
                                            local ____temp_187, ____camera_min_188 = editor:room(), "camera_min"
                                            if ____temp_187[____camera_min_188] == nil then
                                                ____temp_187[____camera_min_188] = {}
                                            end
                                            local ____v_190 = v
                                            editor:room().camera_min.y = ____v_190
                                            return ____v_190
                                        end
                                    )
                                else
                                    return __TS__New(
                                        EXPoint,
                                        function() return (editor:room().camera_max or ({})).x or 0 end,
                                        function() return (editor:room().camera_max or ({})).y or 0 end,
                                        function(v)
                                            local ____temp_191, ____camera_max_192 = editor:room(), "camera_max"
                                            if ____temp_191[____camera_max_192] == nil then
                                                ____temp_191[____camera_max_192] = {}
                                            end
                                            local ____v_194 = v
                                            editor:room().camera_max.x = ____v_194
                                            return ____v_194
                                        end,
                                        function(v)
                                            local ____temp_195, ____camera_max_196 = editor:room(), "camera_max"
                                            if ____temp_195[____camera_max_196] == nil then
                                                ____temp_195[____camera_max_196] = {}
                                            end
                                            local ____v_198 = v
                                            editor:room().camera_max.y = ____v_198
                                            return ____v_198
                                        end
                                    )
                                end
                            end
                        until true
                    end,
                    prev = function(self)
                        if atlas.target == "point" then
                            atlas:switch(editor.atlas_prev)
                        elseif atlas.target == "string" then
                            atlas:switch(editor.atlas_list and "list" or editor.atlas_prev)
                        else
                            atlas:prev()
                        end
                    end,
                    refresh = function(self)
                        editor:save()
                        editor:generate()
                        local ____opt_199 = map.task
                        if ____opt_199 ~= nil then
                            ____opt_199.complete(atlas.navigators.rooms.position.x)
                        end
                    end,
                    render = function(self, lines, menuIndex, highlight)
                        return table.concat(
                            __TS__ArrayMap(
                                lines,
                                function(____, line, index) return (index == menuIndex and ("{color=" .. tostring(highlight(index))) .. "}" or "{color=0xffffff}") .. line end
                            ),
                            "\n"
                        )
                    end,
                    rewrite = function(self, char)
                        if atlas.target ~= "string" then
                            return
                        end
                        local value = editor:string()
                        if char == nil then
                            local length = utf8.len(value)
                            if length > 0 then
                                value = __TS__StringSlice(
                                    value,
                                    0,
                                    utf8.offset(value, length) - 1
                                )
                            else
                                return
                            end
                        else
                            value = value .. char
                        end
                        if editor.atlas_prev == "objects" then
                            local index = atlas.navigators.objects.position.y
                            repeat
                                local ____switch190 = index
                                local ____cond190 = ____switch190 == 7 or ____switch190 == 10
                                if ____cond190 then
                                    do
                                        local object = editor:room().objects[atlas.navigators.objects.position.x + 1]
                                        if index == 10 and object.type == 1 then
                                            object.image = value
                                        else
                                            editor:list()[atlas.navigators.list.position.y + 1] = value
                                        end
                                        break
                                    end
                                end
                                do
                                    editor:room().objects[atlas.navigators.objects.position.x + 1].frames = value
                                end
                            until true
                        else
                            editor:room().score.daemon = value
                        end
                        editor:refresh()
                    end,
                    room = function(self)
                        return data.rooms[atlas.navigators.rooms.position.x + 1]
                    end,
                    round = function(self, value)
                        return math.floor(value * 1000 + 0.5) / 1000
                    end,
                    save = function(self)
                        for ____, room in ipairs(data.rooms) do
                            if room.camera_max ~= nil then
                                if room.camera_max.x == 0 then
                                    __TS__Delete(room.camera_max, "x")
                                end
                                if room.camera_max.y == 0 then
                                    __TS__Delete(room.camera_max, "y")
                                end
                                if room.camera_max.x == nil and room.camera_max.y == nil then
                                    __TS__Delete(room, "camera_max")
                                end
                            end
                            if room.camera_min ~= nil then
                                if room.camera_min.x == 0 then
                                    __TS__Delete(room.camera_min, "x")
                                end
                                if room.camera_min.y == 0 then
                                    __TS__Delete(room.camera_min, "y")
                                end
                                if room.camera_min.x == nil and room.camera_min.y == nil then
                                    __TS__Delete(room, "camera_min")
                                end
                            end
                            for ____, object in ipairs(room.objects) do
                                if object.anchor ~= nil then
                                    if object.anchor.x == 0 then
                                        __TS__Delete(object.anchor, "x")
                                    end
                                    if object.anchor.y == 0 then
                                        __TS__Delete(object.anchor, "y")
                                    end
                                    if object.anchor.x == nil and object.anchor.y == nil then
                                        __TS__Delete(object, "anchor")
                                    end
                                end
                                if object.autosort == false then
                                    __TS__Delete(object, "autosort")
                                end
                                if object.position ~= nil then
                                    if object.position.x == 0 then
                                        __TS__Delete(object.position, "x")
                                    end
                                    if object.position.y == 0 then
                                        __TS__Delete(object.position, "y")
                                    end
                                    if object.position.x == nil and object.position.y == nil then
                                        __TS__Delete(object, "position")
                                    end
                                end
                                if object.priority == 0 then
                                    __TS__Delete(object, "priority")
                                end
                                if object.rotation == 0 then
                                    __TS__Delete(object, "rotation")
                                end
                                if object.scale ~= nil then
                                    if object.scale.x == 1 then
                                        __TS__Delete(object.scale, "x")
                                    end
                                    if object.scale.y == 1 then
                                        __TS__Delete(object.scale, "y")
                                    end
                                    if object.scale.x == nil and object.scale.y == nil then
                                        __TS__Delete(object, "scale")
                                    end
                                end
                                repeat
                                    local ____switch223 = object.type
                                    local ____cond223 = ____switch223 == 0
                                    if ____cond223 then
                                        if object.interactable == false then
                                            __TS__Delete(object, "interactable")
                                        end
                                        if object.obstacle == false then
                                            __TS__Delete(object, "obstacle")
                                        end
                                        if object.size ~= nil then
                                            if object.size.x == 0 then
                                                __TS__Delete(object.size, "x")
                                            end
                                            if object.size.y == 0 then
                                                __TS__Delete(object.size, "y")
                                            end
                                            if object.size.x == nil and object.size.y == nil then
                                                __TS__Delete(object, "size")
                                            end
                                        end
                                        if object.walkable == false then
                                            __TS__Delete(object, "walkable")
                                        end
                                        break
                                    end
                                    ____cond223 = ____cond223 or ____switch223 == 1
                                    if ____cond223 then
                                        local ____opt_201 = object.crop
                                        if (____opt_201 and ____opt_201.bottom) == 0 and object.crop.left == 0 and object.crop.right == 0 and object.crop.top == 0 then
                                            __TS__Delete(object, "crop")
                                        end
                                        break
                                    end
                                    ____cond223 = ____cond223 or ____switch223 == 2
                                    if ____cond223 then
                                        local ____opt_203 = object.crop
                                        if (____opt_203 and ____opt_203.bottom) == 0 and object.crop.left == 0 and object.crop.right == 0 and object.crop.top == 0 then
                                            __TS__Delete(object, "crop")
                                        end
                                        if object.direction == 0 then
                                            __TS__Delete(object, "direction")
                                        end
                                        if object.duration == 0 then
                                            __TS__Delete(object, "duration")
                                        end
                                        if object.frame == 0 then
                                            __TS__Delete(object, "frame")
                                        end
                                        if object.step == 0 then
                                            __TS__Delete(object, "step")
                                        end
                                        break
                                    end
                                until true
                            end
                            if room.score ~= nil then
                                if room.score.distance == 0 then
                                    __TS__Delete(room.score, "distance")
                                end
                                if room.score.gain == 1 then
                                    __TS__Delete(room.score, "gain")
                                end
                                if room.score.rate == 1 then
                                    __TS__Delete(room.score, "rate")
                                end
                            end
                        end
                        love.filesystem.write(
                            file,
                            ST:encode(data)
                        )
                    end,
                    string = function(self)
                        if editor.atlas_prev == "objects" then
                            local index = atlas.navigators.objects.position.y
                            repeat
                                local ____switch245 = index
                                local ____cond245 = ____switch245 == 7 or ____switch245 == 10
                                if ____cond245 then
                                    do
                                        local object = editor:room().objects[atlas.navigators.objects.position.x + 1]
                                        if index == 10 and object.type == 1 then
                                            return object.image
                                        else
                                            return editor:list()[atlas.navigators.list.position.y + 1]
                                        end
                                    end
                                end
                                do
                                    return editor:room().objects[atlas.navigators.objects.position.x + 1].frames
                                end
                            until true
                        else
                            return editor:room().score.daemon
                        end
                    end,
                    unit = function(self)
                        return inputs.shift.held and (inputs.ctrl.held and 10 or 1) or (inputs.ctrl.held and 100 or 10)
                    end
                }
                inputs.left:addDown(function()
                    repeat
                        local ____switch252 = atlas.target
                        local ____cond252 = ____switch252 == "list"
                        if ____cond252 then
                            do
                                local list = editor:list()
                                if #list > 1 then
                                    local index = atlas.navigators.list.position.y
                                    __TS__ArraySplice(list, index, 1)
                                    editor:refresh()
                                    if index == #list then
                                        local ____atlas_navigators_list_position_205, ____y_206 = atlas.navigators.list.position, "y"
                                        ____atlas_navigators_list_position_205[____y_206] = ____atlas_navigators_list_position_205[____y_206] - 1
                                    end
                                else
                                    if atlas.navigators.objects.position.y == 7 then
                                        __TS__Delete(
                                            editor:room().objects[atlas.navigators.objects.position.x + 1],
                                            "tags"
                                        )
                                    else
                                        __TS__Delete(
                                            editor:room().objects[atlas.navigators.objects.position.x + 1],
                                            "script"
                                        )
                                    end
                                    editor:refresh()
                                    atlas:prev()
                                end
                                break
                            end
                        end
                        ____cond252 = ____cond252 or ____switch252 == "neighbors"
                        if ____cond252 then
                            if atlas.navigators.neighbors.position.y == 1 then
                                local neighbor = editor:room().neighbors[atlas.navigators.neighbors.position.x + 1]
                                if neighbor[1] > 0 then
                                    neighbor[1] = neighbor[1] - 1
                                    editor:refresh()
                                end
                            end
                            break
                        end
                        ____cond252 = ____cond252 or ____switch252 == "objects"
                        if ____cond252 then
                            do
                                local object = editor:room().objects[atlas.navigators.objects.position.x + 1]
                                repeat
                                    local ____switch262 = atlas.navigators.objects.position.y
                                    local ____cond262 = ____switch262 == 2
                                    if ____cond262 then
                                        object.autosort = object.autosort ~= true
                                        editor:refresh()
                                        break
                                    end
                                    ____cond262 = ____cond262 or ____switch262 == 4
                                    if ____cond262 then
                                        if object.rotation == nil then
                                            object.rotation = 0
                                        end
                                        object.rotation = object.rotation - editor:unit()
                                        editor:refresh()
                                        break
                                    end
                                    ____cond262 = ____cond262 or ____switch262 == 5
                                    if ____cond262 then
                                        if object.priority == nil then
                                            object.priority = 0
                                        end
                                        object.priority = object.priority - editor:unit()
                                        editor:refresh()
                                        break
                                    end
                                    ____cond262 = ____cond262 or ____switch262 == 8
                                    if ____cond262 then
                                        if object.type == 0 then
                                            object.interactable = object.interactable ~= true
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond262 = ____cond262 or ____switch262 == 9
                                    if ____cond262 then
                                        if object.type == 0 then
                                            object.obstacle = object.obstacle ~= true
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond262 = ____cond262 or ____switch262 == 10
                                    if ____cond262 then
                                        if object.type == 2 then
                                            object.direction = ({1, -1, 0})[(object.direction or 0) + 1 + 1]
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond262 = ____cond262 or ____switch262 == 11
                                    if ____cond262 then
                                        if object.type == 2 then
                                            if object.duration == nil then
                                                object.duration = 0
                                            end
                                            if object.duration > 0 then
                                                object.duration = object.duration - 1
                                                editor:refresh()
                                            end
                                        end
                                        break
                                    end
                                    ____cond262 = ____cond262 or ____switch262 == 12
                                    if ____cond262 then
                                        if object.type == 0 then
                                            object.walkable = object.walkable ~= true
                                            editor:refresh()
                                        elseif object.type == 2 then
                                            if object.frame == nil then
                                                object.frame = 0
                                            end
                                            if object.frame > 0 then
                                                object.frame = object.frame - 1
                                                editor:refresh()
                                            end
                                        end
                                        break
                                    end
                                    ____cond262 = ____cond262 or ____switch262 == 14
                                    if ____cond262 then
                                        if object.type == 2 then
                                            if object.step == nil then
                                                object.step = 0
                                            end
                                            if object.step > 0 then
                                                object.step = object.step - 1
                                                editor:refresh()
                                            end
                                        end
                                        break
                                    end
                                until true
                                break
                            end
                        end
                        ____cond252 = ____cond252 or ____switch252 == "rooms"
                        if ____cond252 then
                            if atlas.navigators.rooms.position.y == 0 then
                                local ____opt_207 = map.task
                                if ____opt_207 ~= nil then
                                    ____opt_207.complete(atlas.navigators.rooms.position.x)
                                end
                            end
                            break
                        end
                        ____cond252 = ____cond252 or ____switch252 == "score"
                        if ____cond252 then
                            do
                                local score = editor:room().score
                                repeat
                                    local ____switch275 = atlas.navigators.score.position.y
                                    local ____cond275 = ____switch275 == 1
                                    if ____cond275 then
                                        if score.distance == nil then
                                            score.distance = 0
                                        end
                                        if score.distance > 0 then
                                            score.distance = math.max(
                                                editor:round(score.distance - 1 / editor:unit()),
                                                0
                                            )
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond275 = ____cond275 or ____switch275 == 2
                                    if ____cond275 then
                                        if score.gain == nil then
                                            score.gain = 1
                                        end
                                        if score.gain > 0 then
                                            score.gain = math.max(
                                                editor:round(score.gain - 1 / editor:unit()),
                                                0
                                            )
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond275 = ____cond275 or ____switch275 == 3
                                    if ____cond275 then
                                        if score.rate == nil then
                                            score.rate = 1
                                        end
                                        if score.rate > 0 then
                                            score.rate = math.max(
                                                editor:round(score.rate - 1 / editor:unit()),
                                                0
                                            )
                                            editor:refresh()
                                        end
                                        break
                                    end
                                until true
                                break
                            end
                        end
                    until true
                end)
                inputs.right:addDown(function()
                    repeat
                        local ____switch280 = atlas.target
                        local ____cond280 = ____switch280 == "list"
                        if ____cond280 then
                            do
                                if inputs.ctrl.held then
                                    local list = editor:list()
                                    local ____editor_insert_213 = editor.insert
                                    local ____atlas_navigators_list_position_y_212 = atlas.navigators.list.position.y
                                    local ____atlas_navigators_list_position_209, ____y_210 = atlas.navigators.list.position, "y"
                                    local ____atlas_navigators_list_position_y_211 = ____atlas_navigators_list_position_209[____y_210]
                                    ____atlas_navigators_list_position_209[____y_210] = ____atlas_navigators_list_position_y_211 + 1
                                    ____editor_insert_213(editor, list, ____atlas_navigators_list_position_y_212, list[____atlas_navigators_list_position_y_211 + 1])
                                else
                                    local ____editor_insert_218 = editor.insert
                                    local ____temp_217 = editor:list()
                                    local ____atlas_navigators_list_position_214, ____y_215 = atlas.navigators.list.position, "y"
                                    local ____atlas_navigators_list_position_y_216 = ____atlas_navigators_list_position_214[____y_215]
                                    ____atlas_navigators_list_position_214[____y_215] = ____atlas_navigators_list_position_y_216 + 1
                                    ____editor_insert_218(editor, ____temp_217, ____atlas_navigators_list_position_y_216, "")
                                end
                                editor:refresh()
                                break
                            end
                        end
                        ____cond280 = ____cond280 or ____switch280 == "neighbors"
                        if ____cond280 then
                            if atlas.navigators.neighbors.position.y == 1 then
                                local ____table_neighbors_index_219, ____1_220 = editor:room().neighbors[atlas.navigators.neighbors.position.x + 1], 1
                                ____table_neighbors_index_219[____1_220] = ____table_neighbors_index_219[____1_220] + 1
                                editor:refresh()
                            end
                            break
                        end
                        ____cond280 = ____cond280 or ____switch280 == "objects"
                        if ____cond280 then
                            do
                                local object = editor:room().objects[atlas.navigators.objects.position.x + 1]
                                repeat
                                    local ____switch286 = atlas.navigators.objects.position.y
                                    local ____cond286 = ____switch286 == 2
                                    if ____cond286 then
                                        object.autosort = object.autosort ~= true
                                        editor:refresh()
                                        break
                                    end
                                    ____cond286 = ____cond286 or ____switch286 == 4
                                    if ____cond286 then
                                        if object.rotation == nil then
                                            object.rotation = 0
                                        end
                                        object.rotation = object.rotation + editor:unit()
                                        editor:refresh()
                                        break
                                    end
                                    ____cond286 = ____cond286 or ____switch286 == 5
                                    if ____cond286 then
                                        if object.priority == nil then
                                            object.priority = 0
                                        end
                                        object.priority = object.priority + editor:unit()
                                        editor:refresh()
                                        break
                                    end
                                    ____cond286 = ____cond286 or ____switch286 == 8
                                    if ____cond286 then
                                        if object.type == 0 then
                                            object.interactable = object.interactable ~= true
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond286 = ____cond286 or ____switch286 == 9
                                    if ____cond286 then
                                        if object.type == 0 then
                                            object.obstacle = object.obstacle ~= true
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond286 = ____cond286 or ____switch286 == 10
                                    if ____cond286 then
                                        if object.type == 2 then
                                            object.direction = ({0, 1, -1})[(object.direction or 0) + 1 + 1]
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond286 = ____cond286 or ____switch286 == 11
                                    if ____cond286 then
                                        if object.type == 2 then
                                            if object.duration == nil then
                                                object.duration = 0
                                            end
                                            object.duration = object.duration + 1
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond286 = ____cond286 or ____switch286 == 12
                                    if ____cond286 then
                                        if object.type == 0 then
                                            object.walkable = object.walkable ~= true
                                            editor:refresh()
                                        elseif object.type == 2 then
                                            if object.frame == nil then
                                                object.frame = 0
                                            end
                                            object.frame = object.frame + 1
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond286 = ____cond286 or ____switch286 == 14
                                    if ____cond286 then
                                        if object.type == 2 then
                                            if object.step == nil then
                                                object.step = 0
                                            end
                                            object.step = object.step + 1
                                            editor:refresh()
                                        end
                                        break
                                    end
                                until true
                                break
                            end
                        end
                        ____cond280 = ____cond280 or ____switch280 == "score"
                        if ____cond280 then
                            do
                                local score = editor:room().score
                                repeat
                                    local ____switch295 = atlas.navigators.score.position.y
                                    local ____cond295 = ____switch295 == 1
                                    if ____cond295 then
                                        if score.distance == nil then
                                            score.distance = 0
                                        end
                                        if score.distance < 1 then
                                            score.distance = math.min(
                                                editor:round(score.distance + 1 / editor:unit()),
                                                1
                                            )
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond295 = ____cond295 or ____switch295 == 2
                                    if ____cond295 then
                                        if score.gain == nil then
                                            score.gain = 1
                                        end
                                        if score.gain < 1 then
                                            score.gain = math.min(
                                                editor:round(score.gain + 1 / editor:unit()),
                                                1
                                            )
                                            editor:refresh()
                                        end
                                        break
                                    end
                                    ____cond295 = ____cond295 or ____switch295 == 3
                                    if ____cond295 then
                                        if score.rate == nil then
                                            score.rate = 1
                                        end
                                        if score.rate < 1 then
                                            score.rate = math.min(
                                                editor:round(score.rate + 1 / editor:unit()),
                                                1
                                            )
                                            editor:refresh()
                                        end
                                        break
                                    end
                                until true
                                break
                            end
                        end
                    until true
                end)
                love.mousepressed = function(x, y, b)
                    repeat
                        local ____switch300 = b
                        local ____cond300 = ____switch300 == 1
                        if ____cond300 then
                            if inputs.shift.held and atlas.target == "objects" then
                                local objects = editor:room().objects
                                if #objects < 2 then
                                    break
                                end
                                local cc = map:cam_clamped()
                                local win_width, win_height = love.window.getMode()
                                local scale = width / height < win_width / win_height and win_height / height or win_width / width
                                local rx = cc.x + (x - win_width / 2) / scale / wrapper.scale.x
                                local ry = cc.y + (y - win_height / 2) / scale / wrapper.scale.y
                                local cb = __TS__New(STHitbox, {anchor = 0.5, size = 1, position = {x = rx, y = ry}})
                                local ano = atlas.navigators.objects
                                local cur = ano.position.x
                                local idx = cur
                                while true do
                                    idx = idx + 1
                                    if not (idx ~= cur) then
                                        break
                                    end
                                    if idx == #objects then
                                        idx = 0
                                        if cur == 0 then
                                            break
                                        end
                                    end
                                    local object = objects[idx + 1]
                                    local ____STHitbox_230 = STHitbox
                                    local ____object_anchor_229 = object.anchor
                                    local ____temp_228
                                    if object.size ~= nil then
                                        ____temp_228 = object.size
                                    else
                                        local ____temp_227
                                        if object.frames ~= nil then
                                            local ____STAnimation_223 = STAnimation
                                            local ____object_frame_222 = object.frame
                                            local ____temp_221
                                            if framess[object.frames] ~= nil then
                                                ____temp_221 = framess[object.frames]
                                            else
                                                ____temp_221 = nil
                                            end
                                            ____temp_227 = __TS__New(____STAnimation_223, {frame = ____object_frame_222, frames = ____temp_221}):getSize() or 0
                                        else
                                            local ____temp_226
                                            if object.image ~= nil then
                                                local ____STSprite_225 = STSprite
                                                local ____temp_224
                                                if images[object.image] ~= nil then
                                                    ____temp_224 = images[object.image]
                                                else
                                                    ____temp_224 = nil
                                                end
                                                ____temp_226 = __TS__New(____STSprite_225, {image = ____temp_224}):getSize() or 0
                                            else
                                                ____temp_226 = 0
                                            end
                                            ____temp_227 = ____temp_226
                                        end
                                        ____temp_228 = ____temp_227
                                    end
                                    local ob = __TS__New(____STHitbox_230, {
                                        anchor = ____object_anchor_229,
                                        size = ____temp_228,
                                        position = object.position,
                                        scale = object.scale,
                                        rotation = object.rotation
                                    })
                                    cb:calculate()
                                    ob:calculate()
                                    if cb:test(ob) then
                                        ano.position.x = idx
                                        ano.position.y = math.min(
                                            ano.position.y,
                                            #ano:grid(ano) - 1
                                        )
                                        break
                                    end
                                end
                            else
                                atlas:next()
                            end
                            break
                        end
                        ____cond300 = ____cond300 or ____switch300 == 4
                        if ____cond300 then
                            editor:prev()
                            break
                        end
                    until true
                end
                love.keypressed = function(key)
                    if key == "backspace" then
                        editor:rewrite(nil)
                    end
                end
                love.textinput = function(text)
                    editor:rewrite(text)
                end
                love.wheelmoved = function(x, y)
                    if love.mouse.isDown(3) then
                        wrapper.scale:set(y < 0 and wrapper.scale.x / 2 ^ (1 / 4) or wrapper.scale.x * 2 ^ (1 / 4))
                    else
                        local ex = love.mouse.isDown(2)
                        if atlas.target == "point" then
                            local value = editor:unit() * (y < 0 and 1 or -1)
                            if editor.atlas_prev == "objects" and atlas.navigators.objects.position.y == 1 then
                                local point = editor:point()
                                point[ex and "x" or "y"] = editor:round(point[ex and "x" or "y"] + 1 / value)
                            else
                                local ____temp_231, ____temp_232 = editor:point(), ex and "x" or "y"
                                ____temp_231[____temp_232] = ____temp_231[____temp_232] + value
                            end
                            editor:refresh()
                        else
                            atlas:seek(ex and (y < 0 and STFacing.RIGHT or STFacing.LEFT) or (y < 0 and STFacing.DOWN or STFacing.UP))
                            if ex then
                                repeat
                                    local ____switch319 = atlas.target
                                    local ____cond319 = ____switch319 == "rooms"
                                    if ____cond319 then
                                        local ____opt_233 = map.task
                                        if ____opt_233 ~= nil then
                                            ____opt_233.complete(atlas.navigators.rooms.position.x)
                                        end
                                        break
                                    end
                                    ____cond319 = ____cond319 or ____switch319 == "objects"
                                    if ____cond319 then
                                        do
                                            local ano = atlas.navigators.objects
                                            ano.position.y = math.min(
                                                ano.position.y,
                                                #ano:grid(ano) - 1
                                            )
                                            break
                                        end
                                    end
                                until true
                            end
                        end
                    end
                end
                map:addTicker(function()
                    local width, height = love.window.getMode()
                    local x = love.mouse.getX() * (ST.width / width)
                    local y = love.mouse.getY() * (ST.height / height)
                    if love.mouse.isDown(3) then
                        map.camera.x = ST:clamp(editor.mouse.value_camera.x - (x - editor.mouse.click.x) / wrapper.scale.x, map.camera_min.x, map.camera_max.x)
                        map.camera.y = ST:clamp(editor.mouse.value_camera.y - (y - editor.mouse.click.y) / wrapper.scale.y, map.camera_min.y, map.camera_max.y)
                    else
                        editor.mouse.value_camera.x = map.camera.x
                        editor.mouse.value_camera.y = map.camera.y
                        editor.mouse.click.x = x
                        editor.mouse.click.y = y
                    end
                end)
                if #data.rooms == 0 then
                    local ____data_rooms_235 = data.rooms
                    ____data_rooms_235[#____data_rooms_235 + 1] = {objects = {}}
                end
                atlas:switch("rooms")
                editor:generate()
                screen:attach(editor.display)
                __TS__Await(map:view(atlas.navigators.rooms.position.x))
                return ____awaiter_resolve(
                    nil,
                    function()
                        outline:release()
                    end
                )
            end)
        end
    )
end
return ____exports
