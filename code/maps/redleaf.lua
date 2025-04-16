local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Promise = ____lualib.__TS__Promise
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__Number = ____lualib.__TS__Number
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__PromiseAll = ____lualib.__TS__PromiseAll
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__ArrayFlat = ____lualib.__TS__ArrayFlat
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local ST_SEMITONE = ____storyteller.ST_SEMITONE
local STAnimation = ____storyteller.STAnimation
local STAudio = ____storyteller.STAudio
local STDaemon = ____storyteller.STDaemon
local STFrames = ____storyteller.STFrames
local STHitbox = ____storyteller.STHitbox
local STImage = ____storyteller.STImage
local STObject = ____storyteller.STObject
local STPager = ____storyteller.STPager
local STPoint = ____storyteller.STPoint
local STRectangle = ____storyteller.STRectangle
local STSprite = ____storyteller.STSprite
local STText = ____storyteller.STText
local STValue = ____storyteller.STValue
local STValueRandom = ____storyteller.STValueRandom
local ____utils = require("code.engine.utils")
local bb_standard = ____utils.bb_standard
local ezchar = ____utils.ezchar
local ____global = require("code.global")
local accessor = ____global.accessor
local init = ____global.init
local random = ____global.random
local ____bloom = require("code.shaders.bloom")
local bloomShader = ____bloom.default
local ____common = require("code.maps.common")
local commonAreaGen = ____common.commonAreaGen
local commonCharactersGen = ____common.commonCharactersGen
local commonResourcesGen = ____common.commonResourcesGen
local function charactersGen()
    return __TS__ObjectAssign(
        {},
        commonCharactersGen(),
        {
            hacker = {
                down = __TS__New(STFrames, "images/characters/hacker/down.json", "images/characters/hacker/down.png"),
                left = __TS__New(STFrames, "images/characters/hacker/left.json", "images/characters/hacker/left.png"),
                right = __TS__New(STFrames, "images/characters/hacker/right.json", "images/characters/hacker/right.png"),
                up = __TS__New(STFrames, "images/characters/hacker/up.json", "images/characters/hacker/up.png")
            },
            mechanic = {
                down = __TS__New(STFrames, "images/characters/mechanic/down.json", "images/characters/mechanic/down.png"),
                left = __TS__New(STFrames, "images/characters/mechanic/left.json", "images/characters/mechanic/left.png"),
                right = __TS__New(STFrames, "images/characters/mechanic/right.json",
                    "images/characters/mechanic/right.png"),
                up = __TS__New(STFrames, "images/characters/mechanic/up.json", "images/characters/mechanic/up.png")
            },
            thicc = {
                down = __TS__New(STFrames, "images/characters/thicc/down.json", "images/characters/thicc/down.png"),
                left = __TS__New(STFrames, "images/characters/thicc/left.json", "images/characters/thicc/left.png"),
                right = __TS__New(STFrames, "images/characters/thicc/right.json", "images/characters/thicc/right.png"),
                up = __TS__New(STFrames, "images/characters/thicc/up.json", "images/characters/thicc/up.png")
            }
        }
    )
end
function ____exports.resourcesGen(music, sound)
    local cr = commonResourcesGen(music, sound)
    return {
        daemons = __TS__ObjectAssign({}, cr.daemons),
        file = "maps/redleaf.json",
        framess = __TS__ObjectAssign(
            {},
            cr.framess,
            {
                tree = __TS__New(STFrames, "images/objects/redleaf/tree.json", "images/objects/redleaf/tree.png"),
                treetop = __TS__New(STFrames, "images/objects/redleaf/treetop.json", "images/objects/redleaf/treetop.png"),
                leaf = __TS__New(STFrames, "images/objects/redleaf/leaf.json", "images/objects/redleaf/leaf.png"),
                leaf_small = __TS__New(STFrames, "images/objects/redleaf/leaf_small.json",
                    "images/objects/redleaf/leaf_small.png"),
                grass = __TS__New(STFrames, "images/objects/redleaf/grass.json", "images/objects/redleaf/grass.png"),
                bush = __TS__New(STFrames, "images/objects/redleaf/bush.json", "images/objects/redleaf/bush.png"),
                gate1 = __TS__New(STFrames, "images/objects/redleaf/gate1.json", "images/objects/redleaf/gate1.png"),
                gate2 = __TS__New(STFrames, "images/objects/redleaf/gate2.json", "images/objects/redleaf/gate2.png"),
                sapcan = __TS__New(STFrames, "images/objects/redleaf/sapcan.json", "images/objects/redleaf/sapcan.png"),
                sapcano = __TS__New(STFrames, "images/objects/redleaf/sapcano.json", "images/objects/redleaf/sapcano.png"),
                pipe = __TS__New(STFrames, "images/objects/redleaf/pipe.json", "images/objects/redleaf/pipe.png"),
                pipeh = __TS__New(STFrames, "images/objects/redleaf/pipeh.json", "images/objects/redleaf/pipeh.png"),
                pipeo = __TS__New(STFrames, "images/objects/redleaf/pipeo.json", "images/objects/redleaf/pipeo.png"),
                pipeho = __TS__New(STFrames, "images/objects/redleaf/pipeho.json", "images/objects/redleaf/pipeho.png"),
                jbbutton = __TS__New(STFrames, "images/objects/redleaf/jbbutton.json",
                    "images/objects/redleaf/jbbutton.png"),
                jbdoor = __TS__New(STFrames, "images/objects/redleaf/jbdoor.json", "images/objects/redleaf/jbdoor.png"),
                junctionbox = __TS__New(STFrames, "images/objects/redleaf/junctionbox.json",
                    "images/objects/redleaf/junctionbox.png"),
                valve = __TS__New(STFrames, "images/objects/redleaf/valve.json", "images/objects/redleaf/valve.png"),
                gauge = __TS__New(STFrames, "images/objects/redleaf/gauge.json", "images/objects/redleaf/gauge.png"),
                noncano = __TS__New(STFrames, "images/objects/redleaf/noncano.json", "images/objects/redleaf/noncano.png"),
                signextra = __TS__New(STFrames, "images/objects/redleaf/signextra.json",
                    "images/objects/redleaf/signextra.png"),
                barrelgrass = __TS__New(STFrames, "images/objects/redleaf/barrelgrass.json",
                    "images/objects/redleaf/barrelgrass.png"),
                treegrass = __TS__New(STFrames, "images/objects/redleaf/treegrass.json",
                    "images/objects/redleaf/treegrass.png"),
                treeroot = __TS__New(STFrames, "images/objects/redleaf/treeroot.json",
                    "images/objects/redleaf/treeroot.png"),
                treebranch = __TS__New(STFrames, "images/objects/redleaf/treebranch.json",
                    "images/objects/redleaf/treebranch.png"),
                cannery = __TS__New(STFrames, "images/objects/redleaf/cannery.json", "images/objects/redleaf/cannery.png"),
                cannerytop = __TS__New(STFrames, "images/objects/redleaf/cannerytop.json",
                    "images/objects/redleaf/cannerytop.png")
            }
        ),
        images = __TS__ObjectAssign(
            {},
            cr.images,
            {
                fencepiece1 = __TS__New(STImage, "images/objects/redleaf/fencepiece1.png"),
                fencepiece2 = __TS__New(STImage, "images/objects/redleaf/fencepiece2.png"),
                fencepiece3 = __TS__New(STImage, "images/objects/redleaf/fencepiece3.png"),
                fencepiece4 = __TS__New(STImage, "images/objects/redleaf/fencepiece4.png"),
                powertower = __TS__New(STImage, "images/objects/redleaf/powertower.png"),
                pipec1 = __TS__New(STImage, "images/objects/redleaf/pipec1.png"),
                pipec2 = __TS__New(STImage, "images/objects/redleaf/pipec2.png"),
                pipec3 = __TS__New(STImage, "images/objects/redleaf/pipec3.png"),
                pipec4 = __TS__New(STImage, "images/objects/redleaf/pipec4.png"),
                jbpipe = __TS__New(STImage, "images/objects/redleaf/jbpipe.png"),
                jbpipec = __TS__New(STImage, "images/objects/redleaf/jbpipec.png"),
                jbpipex = __TS__New(STImage, "images/objects/redleaf/jbpipex.png"),
                pipel = __TS__New(STImage, "images/objects/redleaf/pipel.png"),
                pipels = __TS__New(STImage, "images/objects/redleaf/pipels.png"),
                pipehl = __TS__New(STImage, "images/objects/redleaf/pipehl.png"),
                pipehls = __TS__New(STImage, "images/objects/redleaf/pipehls.png"),
                struttop = __TS__New(STImage, "images/objects/redleaf/struttop.png"),
                strutmid = __TS__New(STImage, "images/objects/redleaf/strutmid.png"),
                strutbot = __TS__New(STImage, "images/objects/redleaf/strutbot.png"),
                strutuno = __TS__New(STImage, "images/objects/redleaf/strutuno.png"),
                sidecano = __TS__New(STImage, "images/objects/redleaf/sidecano.png"),
                saplid = __TS__New(STImage, "images/objects/redleaf/saplid.png"),
                sign = __TS__New(STImage, "images/objects/redleaf/sign.png"),
                signpost = __TS__New(STImage, "images/objects/redleaf/signpost.png"),
                workglove = __TS__New(STImage, "images/objects/redleaf/workglove.png"),
                workboot = __TS__New(STImage, "images/objects/redleaf/workboot.png"),
                worktable = __TS__New(STImage, "images/objects/redleaf/worktable.png"),
                gate1ex1 = __TS__New(STImage, "images/objects/redleaf/gate1ex1.png"),
                gate1ex2 = __TS__New(STImage, "images/objects/redleaf/gate1ex2.png"),
                gate1ex3 = __TS__New(STImage, "images/objects/redleaf/gate1ex3.png"),
                gate1ex4 = __TS__New(STImage, "images/objects/redleaf/gate1ex4.png"),
                gate1ex5 = __TS__New(STImage, "images/objects/redleaf/gate1ex5.png"),
                gate2ex1 = __TS__New(STImage, "images/objects/redleaf/gate2ex1.png"),
                gate2ex2 = __TS__New(STImage, "images/objects/redleaf/gate2ex2.png"),
                gate2ex3 = __TS__New(STImage, "images/objects/redleaf/gate2ex3.png"),
                gate2ex4 = __TS__New(STImage, "images/objects/redleaf/gate2ex4.png"),
                gate2ex5 = __TS__New(STImage, "images/objects/redleaf/gate2ex5.png"),
                gate2ex6 = __TS__New(STImage, "images/objects/redleaf/gate2ex6.png")
            }
        ),
        sheet = __TS__New(STFrames, "images/maps/redleaf.json", "images/maps/redleaf.png")
    }
end

local function areaGen()
    return commonAreaGen(
        function(____bindingPattern0)
            local sound
            local music
            music = ____bindingPattern0.music
            sound = ____bindingPattern0.sound
            return {
                ["ic$hacker$werein"] = __TS__New(STImage, "images/characters/hacker/werein.png"),
                ["ic$player$electrocuted"] = __TS__New(STFrames, "images/characters/player/electrocuted.json",
                    "images/characters/player/electrocuted.png"),
                ["ic$player$electrocuted_plush"] = __TS__New(STFrames, "images/characters/player/electrocuted_plush.json",
                    "images/characters/player/electrocuted_plush.png"),
                ["ic$player$slippintimmy"] = __TS__New(STFrames, "images/characters/player/slippintimmy.json",
                    "images/characters/player/slippintimmy.png"),
                ["ic$player$slippintimmy_plush"] = __TS__New(STFrames, "images/characters/player/slippintimmy_plush.json",
                    "images/characters/player/slippintimmy_plush.png"),
                ["if$hacker$annoyed"] = __TS__New(STImage, "images/faces/hacker/annoyed.png"),
                ["if$hacker$happi"] = __TS__New(STImage, "images/faces/hacker/happi.png"),
                ["if$hacker$default"] = __TS__New(STImage, "images/faces/hacker/default.png"),
                ["if$hacker$pensive"] = __TS__New(STImage, "images/faces/hacker/pensive.png"),
                ["if$hacker$surprise"] = __TS__New(STImage, "images/faces/hacker/surprise.png"),
                ["if$hacker$sweat"] = __TS__New(STImage, "images/faces/hacker/sweat.png"),
                ["if$hacker$sweat2"] = __TS__New(STImage, "images/faces/hacker/sweat2.png"),
                ["if$mechanic$angry"] = __TS__New(STImage, "images/faces/mechanic/angry.png"),
                ["if$mechanic$default"] = __TS__New(STImage, "images/faces/mechanic/default.png"),
                ["if$mechanic$sad"] = __TS__New(STImage, "images/faces/mechanic/sad.png"),
                ["if$mechanic$side"] = __TS__New(STImage, "images/faces/mechanic/side.png"),
                ["if$mechanic$sigh"] = __TS__New(STImage, "images/faces/mechanic/sigh.png"),
                ["if$mechanic$surprise"] = __TS__New(STImage, "images/faces/mechanic/surprise.png"),
                ["if$mechanic$suspicious"] = __TS__New(STImage, "images/faces/mechanic/suspicious.png"),
                ["if$mechanic$what"] = __TS__New(STImage, "images/faces/mechanic/what.png"),
                ["if$thicc$confused"] = __TS__New(STImage, "images/faces/thicc/confused.png"),
                ["if$thicc$default"] = __TS__New(STImage, "images/faces/thicc/default.png"),
                ["if$thicc$happi"] = __TS__New(STImage, "images/faces/thicc/happi.png"),
                ["if$thicc$laugh"] = __TS__New(STImage, "images/faces/thicc/laugh.png"),
                ["if$thicc$sad"] = __TS__New(STImage, "images/faces/thicc/sad.png"),
                ["if$thicc$side"] = __TS__New(STImage, "images/faces/thicc/side.png"),
                ["if$thicc$sigh"] = __TS__New(STImage, "images/faces/thicc/sigh.png"),
                ["if$thicc$sleep"] = __TS__New(STImage, "images/faces/thicc/sleep.png"),
                ["if$thicc$what"] = __TS__New(STImage, "images/faces/thicc/what.png"),
                ["ig$pipewerx$connection_a"] = __TS__New(STImage, "images/games/pipewerx/connection_a.png"),
                ["ig$pipewerx$connection_b"] = __TS__New(STImage, "images/games/pipewerx/connection_b.png"),
                ["ig$pipewerx$connection_c"] = __TS__New(STImage, "images/games/pipewerx/connection_c.png"),
                ["ig$pipewerx$overlay"] = __TS__New(STImage, "images/games/pipewerx/overlay.png"),
                ["ig$pipewerx$pipe"] = __TS__New(STImage, "images/games/pipewerx/pipe.png"),
                ["ig$pipewerx$pipe_corner"] = __TS__New(STImage, "images/games/pipewerx/pipe_corner.png"),
                ["ig$pipewerx$screen"] = __TS__New(STImage, "images/games/pipewerx/screen.png"),
                ["ig$pipewerx$tool_cursor"] = __TS__New(STImage, "images/games/pipewerx/tool_cursor.png"),
                ["m$hacker"] = __TS__New(STDaemon, "music/hacker.ogg", { loop = true, mixer = music }),
                ["m$redleaf"] = __TS__New(STDaemon, "music/redleaf.ogg",
                    { mixer = music, gain = 1, loop = true, rate = 0.9 }),
                ["m$iver"] = __TS__New(STDaemon, "music/iver.ogg", { loop = true, mixer = music }),
                ["m$pipewerx"] = __TS__New(STDaemon, "music/pipewerx.ogg", { loop = true, mixer = music }),
                ["s$latch"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/latch.ogg"),
                    { mixer = sound, gain = 0.25 }
                ),
                ["s$metalsnip1"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/metalsnip1.ogg"),
                    { mixer = sound, gain = 0.25 }
                ),
                ["s$metalsnip2"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/metalsnip2.ogg"),
                    { mixer = sound, gain = 0.25 }
                ),
                ["s$vcr"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/vcr.ogg"),
                    { mixer = sound }
                ),
                ["s$zap"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/zap.ogg"),
                    { mixer = sound }
                ),
                ["v$hacker1"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "voices/hacker1.ogg"),
                    { gain = 0.65, rate = ST_SEMITONE ^ 3, mixer = sound }
                ),
                ["v$hacker2"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "voices/hacker2.ogg"),
                    { gain = 0.65, rate = ST_SEMITONE ^ 3, mixer = sound }
                ),
                ["v$hacker3"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "voices/hacker3.ogg"),
                    { gain = 0.65, rate = ST_SEMITONE ^ 3, mixer = sound }
                ),
                ["v$hacker4"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "voices/hacker4.ogg"),
                    { gain = 0.65, rate = ST_SEMITONE ^ 3, mixer = sound }
                ),
                ["v$mechanic"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "voices/mechanic.ogg"),
                    { mixer = sound, gain = 0.55 }
                ),
                ["v$thicc"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "voices/thicc.ogg"),
                    { mixer = sound, gain = 1 }
                )
            }
        end,
        ____exports.resourcesGen
    )
end
local function textGen(pager)
    return {
        item_gloves = {
            name = function() return accessor.item_glove1 and accessor.item_glove2 and "Work Gloves" or "Work Glove" end,
            info = function()
                return accessor.item_glove1 and accessor.item_glove2 and ({
                    "<p:player>(An insulated glove. Good for handling dangerous items.)"
                }) or ({
                    "<p:player>(A pair of insulated gloves. Good for handling dangerous items.)"
                })
            end
        },
        item_boots = {
            name = function() return accessor.item_boot1 and accessor.item_boot2 and "Work Boots" or "Work Boot" end,
            info = function()
                return accessor.item_boot1 and accessor.item_boot2 and ({
                    "<p:player>(A sturdy, high-topped boot. Good for traversing hazards.)"
                }) or ({
                    "<p:player>(A pair of sturdy, high-topped boots. Good for traversing hazards.)"
                })
            end
        },
        ponder_arrival = pager:create(0, {
            "<p:player><f:sad>...",
            "<p:player><f:sad>(The forest is beautiful...)"
        }, {
            "<p:player><f:sad>...",
            "<p:player><f:sigh>(I have to keep going...)",
            "<p:player>(Standing around won't get me any closer to home.)"
        }),
        ponder_chase = pager:create(0, {
            "<p:player><f:side>(If I could just talk to them...)",
            "<p:player><f:determined2>(... there's no time to lose!)"
        }, {
            "<p:player><f:determined>(... I've got to catch up to them!)"
        }),
        ponder_gate = {
            "<p:player><f:side>...",
            "<p:player><f:side>(I need a closer look at that gate...)"
        },
        ponder_shock = function()
            return {
                "<p:player><f:side>(... hm...)",
                unpack(accessor.item_glove1 and accessor.item_glove2 and accessor.item_boot1 and accessor.item_boot2 and
                    ({
                        "<p:player><f:side>(I have these gloves... and these boots...)",
                        "<p:player>(Oh! I can use these to climb the gate safely!)"
                    }) or
                    (accessor.item_glove1 and accessor.item_glove2 and ((accessor.item_boot1 or accessor.item_boot2) and ({
                        "<p:player><f:side>(I have these gloves... and this boot...)",
                        "<p:player>(With one more boot, I could climb the gate safely.)"
                    }) or ({
                        "<p:player><f:side>(I have these gloves...)",
                        "<p:player>(If I had something to protect my feet, I could climb the gate safely.)"
                    })) or (accessor.item_boot1 and accessor.item_boot2 and ((accessor.item_glove1 or accessor.item_glove2) and ({
                        "<p:player><f:side>(I have these boots... and this glove...)",
                        "<p:player>(With one more glove, I could climb the gate safely.)"
                    }) or ({
                        "<p:player><f:side>(I have these boots...)",
                        "<p:player>(If I had something to protect my hands, I could climb the gate safely.)"
                    })) or ((accessor.item_glove1 or accessor.item_glove2) and ((accessor.item_boot1 or accessor.item_boot2) and ({
                        "<p:player><f:side>(I have this glove... and this boot...)",
                        "<p:player>(If only I could duplicate them, I could climb the gate safely.)"
                    }) or ({
                        "<p:player><f:side>(I have this glove...)",
                        "<p:player><f:side>(If I had another glove, and something to protect my feet...)",
                        "<p:player>(... I could climb the gate safely.)"
                    })) or ((accessor.item_boot1 or accessor.item_boot2) and ({
                        "<p:player><f:side>(I have this boot...)",
                        "<p:player><f:side>(If I had another boot, and something to protect my hands...)",
                        "<p:player>(... I could climb the gate safely.)"
                    }) or ({
                        "<p:player><f:side>(If I had some extra gear to protect myself...)",
                        "<p:player>(... I could climb the gate safely.)"
                    }))))))
            }
        end,
        ponder_gear = {
            "<p:player><f:side>(... I think, with this extra gear I've found...)",
            "<p:player>(... climbing the gate should be safe.)"
        },
        ponder_unlock = {
            "<p:player>(... hm.)",
            "<p:player><f:sigh>(Better get going before someone closes the gate again.)"
        },
        ponder_factory = pager:create(0, {
            "<p:player><f:side>(... if I had to guess, I'd say this was a syrup factory...)",
            "<p:player>(Definitely a factory of some kind, anyway.)",
            "<p:player><f:confused>(Shouldn't there be tons of people working here?)"
        }, {
            "<p:player>...",
            "<p:player><f:sweat4>(... maybe the workers are all on vacation.)"
        }),
        overworld = {
            tutorial1 = "Press [X] while moving\nto sprint.",
            tutorial2 = "Press [←] [→] to climb.",
            pipewerx1 = "(Press [↑] [↓] [←] [→] to move.)\n(Press [Z] to select a pipe.)",
            pipewerx2 = "(Press [C] to rotate the pipe.)",
            pipewerx3 = "(Arrange the pipes to connect\nthe two endpoints.)",
            pipewerx4 = "(Press [X] to exit.)",
            system1 = {
                "Platform Engaged.",
                "Selecting Mode: Transit",
                "Selecting Destination: CRIMSON",
                "Transit In Progress..."
            },
            system2 = "`~1!2@3#4$5%6^7&8*9(0)-_=+[]\\|;:'\",<.>/?",
            arrival1 = {
                "<p:player><f:sweat>..."
            },
            arrival2 = {
                "<p:player><f:side>(It's the same as before...)",
                "<p:player><f:sweat4>(... guess I... didn't really know what I was expecting.)"
            },
            arrival3 = {
                "<p:player><f:what>Whoa."
            },
            arrival4 = {
                "<p:player><f:what>That's big."
            },
            arrival5 = {
                "<p:player><f:sigh>(Well, it's not home.)",
                "<p:player>(But it's... also not that weird house.)",
                "<p:player><f:side>(So that's good.)"
            },
            arrival6 = {
                "<p:player><f:sad>(... I wish...)",
                "<p:player><f:sigh>(... I had an umbrella.)"
            },
            stowaway1 = {
                "<p:player><f:sweat>...",
                "<p:player><f:sweat3>H... hello?"
            },
            stowaway2 = {
                "<p:player><f:sad2>Wait, don't go! I..."
            },
            stowaway3 = {
                "<p:player><f:determined>... get back here!"
            },
            stowaway4 = {
                "<p:player><f:determined2>Hey, you!"
            },
            stowaway5 = {
                "<p:player><f:sweat3>(There's nothing to be afraid of...)"
            },
            stowaway6 = {
                "<p:player><f:upset2>No, no, no!"
            },
            stowaway7 = {
                "<p:player><f:annoyed>(... slam the gate on me, why don't you...)"
            },
            bushitem1 = {
                "<p:player><f:side>(There's something buried in here...)",
                "<p:none>Pick it up?"
            },
            bushitem2 = {
                "Yes",
                "No"
            },
            glover0 = "Work Glove",
            glover1 = {
                "<p:player><f:surprise>(A glove!)",
                "<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Work Glove.",
                "<p:player><f:sodesuka>(Feels... tough.)"
            },
            glover2 = {
                "<p:player><f:surprise>(Another glove!)",
                "<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Work Glove."
            },
            glovey1 = {
                "<p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Work Glove.",
                "<p:player><f:surprise>(A glove!)",
                "<p:player><f:sodesuka>(Feels... tough.)"
            },
            glovey2 = {
                "<p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Work Glove.",
                "<p:player><f:surprise>(Another glove!)"
            },
            bootey1 = {
                "<p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Work Boot.",
                "<p:player>(... a single boot.)",
                "<p:player><f:sigh>(Surely there's another one around, right?)"
            },
            bootey2 = {
                "<p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Work Boot.",
                "<p:player><f:sigh>(Ah, there it is.)"
            },
            booter0 = "Work Boot",
            booter1 = {
                "<p:player>(... a single boot.)",
                "<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Work Boot.",
                "<p:player><f:sigh>(Surely there's another one around, right?)"
            },
            booter2 = {
                "<p:player><f:sigh>(Ah, there it is.)",
                "<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Work Boot."
            },
            drillie1 = pager:create(0, {
                "<p:player><f:sigh>(I could just use this drill to open the gate...)",
                "<p:player>(... but in doing so, its batteries would be completely drained.)",
                "<p:player><f:confused>(Would I be able to replace them?)"
            }, {
                "<p:player><f:confused>(Should I use the drill to open the gate, or save it for later?)"
            }),
            drillie2 = {
                "Use The Drill",
                "Find Another Way"
            },
            drillie3 = {
                "<p:player>..."
            },
            drillie4 = {
                "<p:player><f:sigh>(... that did the trick.)"
            },
            gateclimb0 = "Gate",
            gateclimb1 = {
                "<p:player><f:side>...",
                "<p:player><f:surprise>(Ah! Of course!)",
                "<p:player><f:determined2>(I'll just climb over it!)"
            },
            gateclimb2a = {
                "<p:player><f:annoyed>... ugh..."
            },
            gateclimb2b = {
                "<p:player><f:sweat5>(... guess I'll have to find something else.)"
            },
            gateclimb2c = {
                "<p:player><f:side>(Wait. I have these gloves and boots...)",
                "<p:player>(I could try again with the extra gear to protect myself.)",
                "<p:none>Climb over the gate?"
            },
            gateclimb3 = {
                "<p:player><f:sweat>(It's electrically charged.)"
            },
            gateclimb4 = {
                "<p:player><f:sigh>(Can't climb over the gate without extra gear.)"
            },
            gateclimb5 = pager:create(
                0,
                function()
                    local ____array_0 = __TS__SparseArrayNew(unpack(accessor.event_redleaf_gateclimb == 2 and ({
                        "<p:player>(I have the extra gear I need to protect myself.)"
                    }) or ({
                        "<p:player><f:side>(Wait. I have these gloves and boots now...)",
                        "<p:player>(I could try again with the extra gear to protect myself.)"
                    })))
                    __TS__SparseArrayPush(____array_0, "<p:none>Climb over the gate?")
                    return { __TS__SparseArraySpread(____array_0) }
                end,
                {
                    "<p:none>Climb over the gate?"
                }
            ),
            gateclimb6 = {
                "Yes",
                "No"
            },
            gateclimb7 = {
                "<p:player><f:sigh>(Third climb's the charm. placeholder :3)"
            },
            gateclimb8 = {
                "<p:player><f:determined2>(Alright!)"
            },
            gateclimb9 = {
                "<p:player><f:confused>(Is this... a factory?)"
            },
            gateclimb10 = {
                "<p:player><f:sodesuka>(Time to find out what that rascal was up to.)"
            }
        },
        trivia = {
            tree = {
                "<p:player><f:surprise>It's a tree! (placeholder :3)"
            },
            barrel = {
                "<p:player><f:side>Barrel barrel barrel- (placeholder :3)"
            },
            lid = {
                "<p:player><f:annoyed>A lid. (placeholder :3)"
            },
            facsign = {
                "<p:player>\"REDLEAF INDUSTRIES\"\n\"Factory Grounds Nearby\""
            },
            sapsign = {
                "<p:player>\"Kotokura Syrup Exports\"\n\"Redleaf Industries\""
            },
            carsign = pager:create(0, {
                "<p:player><f:sweat>\"Danger: Industrial Vehicles\"",
                "<p:player><f:side>(Guess I should be careful...)"
            }, {
                "<p:player><f:sweat>\"Danger: Industrial Vehicles\""
            }),
            powertower = {
                "<p:player><f:confused>A powertower? (placeholder :3)"
            },
            placeholder2 = pager:create(0, {
                "<p:player>placeholder :3"
            })
        },
        trivia_tooltip = {
            tree = "Tree",
            barrel = "Barrel",
            lid = "Barrel Lid",
            facsign = "Signpost",
            sapsign = "Signpost",
            carsign = "Signpost",
            powertower = "Electrical Tower"
        }
    }
end
function ____exports.default()
    local ____areaGen_result_1 = areaGen()
    local activators = ____areaGen_result_1.activators
    local failer = ____areaGen_result_1.failer
    local hide = ____areaGen_result_1.hide
    local hintGen = ____areaGen_result_1.hintGen
    local overworld = ____areaGen_result_1.overworld
    local map = ____areaGen_result_1.map
    local resources = ____areaGen_result_1.resources
    local reveal = ____areaGen_result_1.reveal
    local shaderSetup = ____areaGen_result_1.shaderSetup
    local stepSFX = ____areaGen_result_1.stepSFX
    local temp = ____areaGen_result_1.temp
    local tooltip = ____areaGen_result_1.tooltip
    local unfailer = ____areaGen_result_1.unfailer
    local ____overworld_2 = overworld
    local assets = ____overworld_2.assets
    local save_hooks = ____overworld_2.atlas.save_hooks
    local game = ____overworld_2.game
    local player = ____overworld_2.player.player
    local player_walk = ____overworld_2.player.player_walk
    local player_hitbox = ____overworld_2.player.player_hitbox
    local player_walkbox = ____overworld_2.player.player_walkbox
    local reader = ____overworld_2.reader.reader
    local object = ____overworld_2.screen.object
    local objects = ____overworld_2.screen.objects
    local screen = ____overworld_2.screen.screen
    local items = ____overworld_2.inventory.items
    local update = ____overworld_2.inventory.update
    local inputs = ____overworld_2.inputs
    local batch = ____overworld_2.batch
    local ____resources_3 = resources
    local images = ____resources_3.images
    local framess = ____resources_3.framess
    local pager = __TS__New(
        STPager,
        random,
        ST:decode(accessor.pager_redleaf)
    )
    local text = textGen(pager)
    local function hintSprint()
        return __TS__New(
            __TS__Promise,
            function(____, resolve)
                player.metadata.last_x = 0
                player.metadata.last_y = 0
                local hint = hintGen(
                    text.overworld.tutorial1,
                    0,
                    30,
                    0,
                    60,
                    0.5
                )
                ST:when(function()
                    if map.room == 4 or math.abs(player.metadata.last_x) == 3 or math.abs(player.metadata.last_y) == 3 then
                        hint()
                        resolve(nil)
                        return true
                    end
                    return false
                end)
            end
        )
    end
    local function trans2(r, x, y)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            game.cutscene = game.cutscene + 1
            local fader = __TS__New(STRectangle, {
                alpha = 0,
                color = 0,
                size = { x = 240, y = 180 },
                anchor = 0.5,
                priority = 1000
            })
            screen:attach(fader)
            __TS__Await(fader.alpha:automate(7, 1))
            player.position.x = __TS__Number(x)
            player.position.y = __TS__Number(y)
            game.cutscene = game.cutscene - 1
            local ____opt_4 = map.task
            if ____opt_4 ~= nil then
                ____opt_4.complete(r)
            end
            local ____self_6 = fader.alpha:automate(7, 0)
            ____self_6["then"](
                ____self_6,
                function()
                    screen:detach(fader)
                end
            )
        end)
    end
    local function trivia(key)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            local entry = text.trivia[key]
            __TS__Await(reader:text(type(entry) == "function" and entry("#trivia/" .. key) or entry))
        end)
    end
    local function genLeaf(ap, startTime, ____bindingPattern0)
        local ltype
        local lduration
        local lcycles
        local lradius
        local lsway
        local ly
        local lx
        lx = ____bindingPattern0[1]
        ly = ____bindingPattern0[2]
        lsway = ____bindingPattern0[3]
        lradius = ____bindingPattern0[4]
        lcycles = ____bindingPattern0[5]
        lduration = ____bindingPattern0[6]
        local lcooldown = ____bindingPattern0[7]
        ltype = ____bindingPattern0[8]
        local startPos = ap:subtract(0, 265):add(lx, ly / 2)
        local endY = ap.y + ly / 2
        local dist = endY - startPos.y
        local function leafTicker(self)
            local tick = ST.time - startTime
            if tick < lduration + (ltype == 0 and 90 or 45) then
                local tickClamped = math.min(tick, lduration)
                self.frame = math.floor(tickClamped / (ltype == 0 and 9 or 3)) % 6
                local p = tickClamped / lduration
                local q = ST:bezier(p, 0, 1, 1)
                local r = ST:remap(
                    ST:wave(p * lcycles),
                    -1,
                    1
                ) * lsway
                self.rotation.value = math.floor((r - 45) / 15 + 0.5) * 15
                self.position:set(startPos:add(q * (dist / -2), q * dist - lradius):add(ST:ray(90 + r, lradius)):round())
                self.priority = endY - 4
                self.alpha.value = 1 -
                    math.max(tick - (lduration + (ltype == 0 and 30 or 15)), 0) / (ltype == 0 and 60 or 30)
            else
                map:detach(self)
                local i = __TS__ArrayIndexOf(temp, self)
                if i ~= -1 then
                    __TS__ArraySplice(temp, i, 1)
                end
            end
        end
        local leaf = __TS__New(STAnimation,
            { frames = ({ framess.leaf, framess.leaf_small })[ltype + 1], anchor = 0.5, priority = endY }):addTicker(
            leafTicker)
        leafTicker(leaf)
        map:attach(leaf)
        temp[#temp + 1] = leaf
    end
    local function sprayLeaf(ap)
        local i = 0
        local limit = 1 + math.floor(math.random() ^ 2 * 2)
        while i < limit do
            local depth = ap.y + (math.random() * 2 - 1) * 5
            local position = ap:add(
                (math.random() * 2 - 1) * 5,
                -5 - math.random() * 25
            )
            local leaf = __TS__New(
                STAnimation,
                {
                    position = position,
                    frames = framess.leaf_small,
                    anchor = 0.5,
                    priority = depth,
                    gravity = { y = 0.125 },
                    direction = 1,
                    velocity = __TS__New(
                        STPoint,
                        ST:ray(
                            ap:angle(position) + (math.random() * 2 - 1) * 15,
                            1 + math.random()
                        )
                    ),
                    spin = math.random() * 6 - 2,
                    metadata = -1
                }
            ):addTicker(function(self)
                if self.metadata ~= -1 then
                    local ____self_8, ____metadata_9 = self, "metadata"
                    local ____self_metadata_10 = ____self_8[____metadata_9] + 1
                    ____self_8[____metadata_9] = ____self_metadata_10
                    if ____self_metadata_10 == 45 then
                        map:detach(self)
                        local i = __TS__ArrayIndexOf(temp, self)
                        if i ~= -1 then
                            __TS__ArraySplice(temp, i, 1)
                        end
                        return
                    end
                    self.alpha.value = 1 - math.max(self.metadata - 15, 0) / 30
                    return
                end
                return function()
                    if depth <= self.position.y then
                        self.position.y = depth
                        self.metadata = 0
                        self.gravity.x = 0
                        self.gravity.y = 0
                        self.velocity.x = 0
                        self.velocity.y = 0
                        self.direction = 0
                        self.spin.value = 0
                    end
                end
            end):addDrawer(function(self)
                local ____self_position_7 = self.position
                local x = ____self_position_7.x
                local y = ____self_position_7.y
                self.position.x = math.floor(x + 0.5)
                self.position.y = math.floor(y + 0.5)
                local r = self.rotation.value
                self.rotation.value = math.floor(self.rotation.value / 15 + 0.5) * 15
                return function()
                    self.position.x = x
                    self.position.y = y
                    self.rotation.value = r
                end
            end)
            map:attach(leaf)
            temp[#temp + 1] = leaf
            i = i + 1
        end
    end
    local state = { bushprompt = false }
    local characters = charactersGen()
    local scripts = {
        trans = function(test, args)
            local ____opt_11 = map.task
            if ____opt_11 ~= nil then
                ____opt_11.complete(__TS__Number(args[1]))
            end
        end,
        trans2 = function(test, args)
            trans2(
                __TS__Number(args[1]),
                __TS__Number(args[2]),
                __TS__Number(args[3])
            )
        end,
        trivia = function(test, args)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if not (text.trivia[args[1]] ~= nil) then
                    return ____awaiter_resolve(nil)
                end
                local facings = __TS__ArraySlice(args, 1)
                if #facings == 0 or __TS__ArrayIncludes(facings, player.stance) then
                    if test then
                        if text.trivia_tooltip[args[1]] ~= nil then
                            tooltip(text.trivia_tooltip[args[1]])
                        end
                        return ____awaiter_resolve(nil)
                    end
                    __TS__Await(trivia(args[1]))
                end
            end)
        end,
        fastvert = function()
            if game.c_up then
                local ____player_position_13, ____y_14 = player.position, "y"
                ____player_position_13[____y_14] = ____player_position_13[____y_14] - 1
            elseif game.c_down then
                local ____player_position_15, ____y_16 = player.position, "y"
                ____player_position_15[____y_16] = ____player_position_15[____y_16] + 1
            end
        end,
        stowaway1 = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.plot < 5 then
                    accessor.plot = 5
                    game.cutscene = game.cutscene + 1
                    local position = assets["m$redleaf"].instances[1].position.value
                    assets["m$redleaf"]:stop()
                    __TS__Await(ST:pause(5))
                    local stowbush = object("stowbush").self
                    stowbush.metadata.funny()
                    local stowaway = ezchar({
                        stances = characters.stowaway,
                        stance = "left",
                        position = stowbush.position:subtract(25, 5),
                        color = 15501672
                    }):addDrawer(stepSFX)
                    sprayLeaf(stowaway.position)
                    map:attach(stowaway)
                    assets["s$step_bush"]:instance({ rate = 1.25, gain = 0.4 })
                    local ____self_17 = stowaway:walk(2, { x = 130 })
                    local ____self_17_then_result_23 = ____self_17["then"](
                        ____self_17,
                        function() return bb_standard(stowaway, assets["ie$surprise"]) end
                    )
                    local ____self_22 = ST:pause(5)
                    __TS__Await(__TS__PromiseAll({
                        ____self_17_then_result_23,
                        ____self_22["then"](
                            ____self_22,
                            function()
                                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                    player.stance = "right"
                                    __TS__Await(bb_standard(player, assets["ie$surprise"]))
                                    __TS__Await(ST:pause(15))
                                    local ____temp_19
                                    if math.abs(player.position.y - 75) > 30 then
                                        local ____self_18 = player_walk(1.5, { y = 75 })
                                        ____temp_19 = { ____self_18["then"](
                                            ____self_18,
                                            function()
                                                player.stance = "right"
                                            end
                                        ) }
                                    else
                                        ____temp_19 = {}
                                    end
                                    local ____array_21 = __TS__SparseArrayNew(unpack(____temp_19))
                                    local ____self_20 = ST:pause(20)
                                    __TS__SparseArrayPush(
                                        ____array_21,
                                        ____self_20["then"](
                                            ____self_20,
                                            function()
                                                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                                    __TS__Await(reader:text(text.overworld.stowaway1))
                                                end)
                                            end
                                        )
                                    )
                                    __TS__Await(__TS__PromiseAll({ __TS__SparseArraySpread(____array_21) }))
                                end)
                            end
                        )
                    }))
                    __TS__Await(ST:pause(45))
                    __TS__Await(bb_standard(stowaway, assets["ie$ellipsis"]))
                    __TS__Await(ST:pause(30))
                    local ____self_24 = stowaway:walk(2.5, { x = 120 }, { y = 0 })
                    local ____self_24_then_result_28 = ____self_24["then"](
                        ____self_24,
                        function()
                            map:detach(stowaway)
                        end
                    )
                    local ____self_27 = ST:pause(15)
                    __TS__Await(__TS__PromiseAll({
                        ____self_24_then_result_28,
                        ____self_27["then"](
                            ____self_27,
                            function()
                                local ____temp_26 = reader:text(text.overworld.stowaway2)
                                local ____self_25 = ST:pause(10)
                                return __TS__PromiseAll({
                                    ____temp_26,
                                    ____self_25["then"](
                                        ____self_25,
                                        function()
                                            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                                __TS__Await(player_walk(2.5, { x = 110 - (player.position.y - 50) },
                                                    { x = 110, y = 50 }))
                                                player.stance = "up"
                                            end)
                                        end
                                    )
                                })
                            end
                        )
                    }))
                    __TS__Await(ST:pause(60))
                    __TS__Await(reader:text(text.overworld.stowaway3))
                    assets["m$redleaf"]:instance_forced({ position = position, rate = 1.2 })
                    game.cutscene = game.cutscene - 1
                    local ____self_29 = hintSprint()
                    ____self_29["then"](
                        ____self_29,
                        function()
                            accessor.tutorial_sprint = false
                        end
                    )
                end
            end)
        end,
        glover = function(test)
            if test then
                tooltip(text.overworld.glover0)
                return
            end
            accessor.item_glove1 = true
            update()
            local ____reader_headers_34 = reader.headers
            ____reader_headers_34[#____reader_headers_34 + 1] = {
                "a",
                function()
                    assets["s$itemget"]:instance()
                    local ____opt_30 = object("glover")
                    if ____opt_30 ~= nil then
                        ____opt_30:destroy()
                    end
                    local ____opt_32 = object("glover")
                    if ____opt_32 ~= nil then
                        ____opt_32:destroy()
                    end
                end
            }
            reader:text(accessor.item_glove2 and text.overworld.glover2 or text.overworld.glover1)
        end,
        glovey = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if state.bushprompt then
                    return ____awaiter_resolve(nil)
                end
                __TS__Await(reader:text(text.overworld.bushitem1))
                __TS__Await(reader:choice(text.overworld.bushitem2))
                if game.r_choice == 1 then
                    state.bushprompt = true
                    return ____awaiter_resolve(nil)
                end
                accessor.item_glove2 = true
                update()
                assets["s$itemget"]:instance()
                local ____opt_35 = object("glovey")
                if ____opt_35 ~= nil then
                    ____opt_35:destroy()
                end
                __TS__Await(reader:text(accessor.item_glove1 and text.overworld.glovey2 or text.overworld.glovey1))
            end)
        end,
        booter = function(test)
            if test then
                tooltip(text.overworld.booter0)
                return
            end
            accessor.item_boot1 = true
            update()
            local ____reader_headers_41 = reader.headers
            ____reader_headers_41[#____reader_headers_41 + 1] = {
                "a",
                function()
                    assets["s$itemget"]:instance()
                    local ____opt_37 = object("booter")
                    if ____opt_37 ~= nil then
                        ____opt_37:destroy()
                    end
                    local ____opt_39 = object("booter")
                    if ____opt_39 ~= nil then
                        ____opt_39:destroy()
                    end
                end
            }
            reader:text(accessor.item_boot2 and text.overworld.booter2 or text.overworld.booter1)
        end,
        bootey = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if state.bushprompt then
                    return ____awaiter_resolve(nil)
                end
                __TS__Await(reader:text(text.overworld.bushitem1))
                __TS__Await(reader:choice(text.overworld.bushitem2))
                if game.r_choice == 1 then
                    state.bushprompt = true
                    return ____awaiter_resolve(nil)
                end
                accessor.item_boot2 = true
                update()
                assets["s$itemget"]:instance()
                local ____opt_42 = object("bootey")
                if ____opt_42 ~= nil then
                    ____opt_42:destroy()
                end
                __TS__Await(reader:text(accessor.item_boot1 and text.overworld.bootey2 or text.overworld.bootey1))
            end)
        end,
        gateclimb = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if player.stance ~= "right" or accessor.state_redleaf_gate ~= 0 then
                    return ____awaiter_resolve(nil)
                end
                if test then
                    tooltip(text.overworld.gateclimb0)
                    return ____awaiter_resolve(nil)
                end
                game.cutscene = game.cutscene + 1
                if accessor.event_redleaf_gateclimb == 0 then
                    accessor.event_redleaf_gateclimb = 1
                    __TS__Await(reader:text(text.overworld.gateclimb1))
                    __TS__Await(player_walk(1, { x = 208 }))
                    if math.abs(player.position.y - 90) > 6 then
                        __TS__Await(player_walk(1.5, { y = 90 }))
                    end
                    __TS__Await(ST:pause(25))
                    player.stance = "left"
                    __TS__Await(ST:pause(35))
                    player.stance = "right"
                    __TS__Await(ST:pause(40))
                    local prio = player.position.y
                    __TS__Await(player.position:step(0.5, { x = 213, y = prio - 3 }))
                    local electro = __TS__New(STAnimation,
                        {
                            frames = accessor.floof and assets["ic$player$electrocuted_plush"] or
                                assets["ic$player$electrocuted"],
                            anchor = { x = 0.5, y = 1 },
                            priority = 51,
                            position = player
                                .position
                        }):addDrawer(function(self)
                        if self.frame == 0 then
                            self.color.red = 162
                            self.color.green = 137
                            self.color.blue = 220
                        else
                            self.color.red = 255
                            self.color.green = 255
                            self.color.blue = 255
                        end
                    end)
                    player.alpha.value = 0
                    map:attach(electro)
                    assets["m$redleaf"]:stop()
                    assets["s$step_metal"]:instance({ rate = 1.5 })
                    local zaps = 0
                    while zaps < 6 do
                        assets["s$zap"]:instance()
                        __TS__Await(ST:pause(3))
                        electro.frame = 1
                        __TS__Await(ST:pause(3))
                        electro.frame = 0
                        zaps = zaps + 1
                    end
                    local spin = 0.1
                    __TS__Await(__TS__New(
                        __TS__Promise,
                        function(____, resolve)
                            electro:addTicker(function(self)
                                local ____self_rotation_44, ____value_45 = self.rotation, "value"
                                ____self_rotation_44[____value_45] = ____self_rotation_44[____value_45] - spin
                                spin = spin * 1.1
                                if self.rotation.value <= -90 then
                                    resolve(nil)
                                end
                            end)
                        end
                    ))
                    map:detach(electro)
                    local v = __TS__New(STValue, -0.5)
                    local p = electro.position:add(-17, 8)
                    local y = __TS__New(STValue, p.y)
                    local weresodead = __TS__New(STAnimation, {
                        anchor = { x = 0.5, y = 1 },
                        position = p,
                        frames = assets["ic$player$sleep"],
                        priority = prio,
                        color = 10652124
                    }):addTicker(function(self)
                        p.x = p.x + v.value
                        self.position.x = math.floor(p.x + 0.5)
                        self.position.y = math.floor(y.value + 0.5)
                    end)
                    map:attach(weresodead)
                    v:automate(20, 0)
                    y:automate(5, y.value - 2, y.value - 2, y.value)
                    local plusher = nil
                    if accessor.floof then
                        local pv = __TS__New(STValue, -1.7)
                        local pp = weresodead.position:subtract(12, 0)
                        local py = __TS__New(STValue, p.y)
                        plusher = __TS__New(STSprite, {
                            image = images.goatplush,
                            anchor = { x = 0.5, y = 1 },
                            position = pp,
                            priority = prio + 0.1,
                            color = 10652124
                        }):addTicker(function(self)
                            pp.x = pp.x + pv.value
                            self.position.x = math.floor(pp.x + 0.5)
                            self.position.y = math.floor(py.value + 0.5)
                        end)
                        map:attach(plusher)
                        pv:automate(35, 0)
                        py:automate(15, py.value - 7, py.value - 7, py.value)
                    end
                    local sh = __TS__New(STValue, 2)
                    local function shTicker()
                        screen.position.x = (math.random() - 0.5) * sh.value
                        screen.position.y = (math.random() - 0.5) * sh.value
                    end
                    map:addTicker(shTicker)
                    local ____self_46 = sh:automate(15, 0)
                    ____self_46["then"](
                        ____self_46,
                        function()
                            screen.position.x = 0
                            screen.position.y = 0
                            map:removeTicker(shTicker)
                        end
                    )
                    __TS__Await(ST:pause(120))
                    weresodead.frame = 1
                    __TS__Await(ST:pause(30))
                    __TS__Await(reader:text(text.overworld.gateclimb2a))
                    __TS__Await(ST:pause(20))
                    local musi = assets["m$redleaf"]:instance_forced({ gain = 0 })
                    musi.gain:automate(60, 1)
                    __TS__Await(ST:pause(30))
                    map:detach(weresodead)
                    player.position.x = weresodead.position.x
                    player.position.y = weresodead.position.y
                    player.alpha.value = 1
                    if accessor.floof then
                        player.metadata.floof = false
                    end
                    player.stance = "right"
                    if accessor.floof then
                        __TS__Await(ST:pause(30))
                        __TS__Await(player_walk(1.5, { x = plusher.position.x + 15 }))
                        __TS__Await(ST:pause(25))
                        map:detach(plusher)
                        player.metadata.floof = true
                    end
                    __TS__Await(ST:pause(45))
                    player.stance = "down"
                    if accessor.item_glove1 and accessor.item_glove2 and accessor.item_boot1 and accessor.item_boot2 then
                        __TS__Await(reader:text(text.overworld.gateclimb2c))
                        __TS__Await(reader:choice(text.overworld.gateclimb6))
                        if game.r_choice == 1 then
                            game.cutscene = game.cutscene - 1
                            return ____awaiter_resolve(nil)
                        end
                    else
                        __TS__Await(reader:text(text.overworld.gateclimb2b))
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    __TS__Await(player_walk(1, { x = 208 }))
                    __TS__Await(ST:pause(30))
                else
                    if accessor.item_glove1 and accessor.item_glove2 and accessor.item_boot1 and accessor.item_boot2 then
                        __TS__Await(reader:text(text.overworld.gateclimb5("overworld/gateclimb5")))
                        __TS__Await(reader:choice(text.overworld.gateclimb6))
                        if game.r_choice == 1 then
                            game.cutscene = game.cutscene - 1
                            return ____awaiter_resolve(nil)
                        end
                    elseif accessor.event_redleaf_gateclimb == 2 then
                        __TS__Await(reader:text(text.overworld.gateclimb4))
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    else
                        __TS__Await(reader:text(text.overworld.gateclimb3))
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    __TS__Await(player_walk(1, { x = 208 }))
                    if math.abs(player.position.y - 90) > 6 then
                        __TS__Await(player_walk(1.5, { y = 90 }))
                        player.stance = "right"
                        __TS__Await(ST:pause(30))
                    end
                end
                accessor.event_redleaf_gateclimb = 2
                __TS__Await(reader:text(text.overworld.gateclimb7))
                local prio = player.position.y
                __TS__Await(player.position:step(0.5, { x = 213, y = prio - 3 }))
                local climber = __TS__New(STAnimation, {
                    frames = accessor.floof and assets["ic$player$slippintimmy_plush"] or
                        assets["ic$player$slippintimmy"],
                    anchor = { x = 0.5, y = 1 },
                    priority = 51,
                    position = player.position,
                    color = 10652124
                })
                player.alpha.value = 0
                map:attach(climber)
                assets["s$step_metal"]:instance({ rate = 1.5 })
                local r = 0
                while r < 2 do
                    local htext = __TS__New(STText,
                        {
                            anchor = 0.5,
                            font = assets["f$helloplayer"],
                            color = 8355711,
                            content = text.overworld
                                .tutorial2
                        })
                    local circler = __TS__New(STSprite,
                        { alpha = 0, image = images.jusant_circle, anchor = 0.5, metadata = 0 }):addTicker(function(self)
                        self.position.x = (self.position.x + self.metadata * 2) / 3
                    end)
                    local jusant = __TS__New(STSprite, {
                        alpha = 0,
                        anchor = 0.5,
                        image = images.jusant,
                        position = { y = 60 },
                        priority = 1000,
                        children = { htext, circler }
                    }):addDrawer(batch.drawer)
                    local side = -1
                    local grabbing = 0
                    local sticky = false
                    screen:attach(jusant)
                    jusant.alpha:automate(15, 0.75)
                    __TS__Await(__TS__New(
                        __TS__Promise,
                        function(____, resolve)
                            jusant:addTicker(function(self)
                                if side == 2 then
                                    return
                                end
                                local step = 0
                                if side == -1 then
                                    if inputs.left.held then
                                        side = 0
                                        circler.position.x = 80
                                    elseif inputs.right.held then
                                        side = 1
                                        circler.position.x = -80
                                    else
                                        return
                                    end
                                    grabbing = 1
                                    step = 1
                                    circler.alpha:automate(7, 1)
                                    local ____self_47 = htext.alpha:automate(7, 0)
                                    ____self_47["then"](
                                        ____self_47,
                                        function()
                                            jusant:detach(htext)
                                        end
                                    )
                                end
                                repeat
                                    local ____switch106 = grabbing
                                    local ____cond106 = ____switch106 == 0
                                    if ____cond106 then
                                        if side == 0 then
                                            if inputs.left.held then
                                                grabbing = 1
                                                step = 1
                                                if inputs.right.held then
                                                    sticky = true
                                                end
                                            end
                                        elseif inputs.right.held then
                                            grabbing = 1
                                            step = 1
                                            if inputs.left.held then
                                                sticky = true
                                            end
                                        end
                                        break
                                    end
                                    ____cond106 = ____cond106 or ____switch106 == 1
                                    if ____cond106 then
                                        if side == 0 then
                                            if not inputs.left.held then
                                                grabbing = 0
                                                step = -1
                                                sticky = false
                                            elseif inputs.right.held then
                                                if not sticky then
                                                    grabbing = 2
                                                    step = 1
                                                end
                                            elseif sticky then
                                                sticky = false
                                            end
                                        elseif not inputs.right.held then
                                            grabbing = 0
                                            step = -1
                                            sticky = false
                                        elseif inputs.left.held then
                                            if not sticky then
                                                grabbing = 2
                                                step = 1
                                            end
                                        elseif sticky then
                                            sticky = false
                                        end
                                        break
                                    end
                                    ____cond106 = ____cond106 or ____switch106 == 2
                                    if ____cond106 then
                                        if side == 0 then
                                            if not inputs.left.held then
                                                side = 1
                                                if inputs.right.held then
                                                    grabbing = 1
                                                    step = 1
                                                else
                                                    grabbing = 0
                                                end
                                            end
                                        elseif not inputs.right.held then
                                            side = 0
                                            if inputs.left.held then
                                                grabbing = 1
                                                step = 1
                                            else
                                                grabbing = 0
                                            end
                                        end
                                        break
                                    end
                                until true
                                repeat
                                    local ____switch128 = grabbing
                                    local ____cond128 = ____switch128 == 0
                                    if ____cond128 then
                                        circler.metadata = side == 0 and 80 or -80
                                        circler.scale.x = side == 0 and -1 or 1
                                        circler.color.red = 255
                                        circler.color.green = 255
                                        circler.color.blue = 255
                                        break
                                    end
                                    ____cond128 = ____cond128 or ____switch128 == 1
                                    if ____cond128 then
                                        circler.metadata = side == 0 and 0 or 0
                                        circler.scale.x = side == 0 and 1 or -1
                                        if sticky then
                                            circler.color.red = 127
                                            circler.color.green = 127
                                            circler.color.blue = 127
                                        else
                                            circler.color.red = 255
                                            circler.color.green = 255
                                            circler.color.blue = 255
                                        end
                                        break
                                    end
                                    ____cond128 = ____cond128 or ____switch128 == 2
                                    if ____cond128 then
                                        circler.metadata = side == 0 and -80 or 80
                                        circler.scale.x = side == 0 and -1 or 1
                                        circler.color.red = 127
                                        circler.color.green = 127
                                        circler.color.blue = 127
                                        break
                                    end
                                until true
                                if step ~= 0 then
                                    if r == 0 then
                                        local ____climber_position_48, ____y_49 = climber.position, "y"
                                        ____climber_position_48[____y_49] = ____climber_position_48[____y_49] - step * 2
                                    else
                                        local ____climber_position_50, ____y_51 = climber.position, "y"
                                        ____climber_position_50[____y_51] = ____climber_position_50[____y_51] + step * 2
                                    end
                                    if grabbing ~= 2 then
                                        climber.frame = 1 - climber.frame
                                    end
                                    assets["s$step_metal"]:instance({ rate = 1.5 })
                                    if r == 0 then
                                        if climber.position.y <= prio - 30 then
                                            side = 2
                                            resolve(nil)
                                        end
                                    else
                                        if prio - 3 <= climber.position.y then
                                            side = 2
                                            resolve(nil)
                                        end
                                    end
                                end
                            end)
                        end
                    ))
                    local ____self_52 = jusant.alpha:automate(15, 0)
                    ____self_52["then"](
                        ____self_52,
                        function()
                            screen:detach(jusant)
                        end
                    )
                    climber.priority = 86
                    __TS__Await(ST:pause(60))
                    if r == 0 then
                        climber.position.x = 223
                        climber.scale.x = -1
                        local cby = climber.position.y
                        climber:addTicker(function(self)
                            self.priority = self.position.y <= cby and 86 or 51
                        end)
                    end
                    r = r + 1
                end
                climber.velocity.x = 1.2
                climber.velocity.y = -0.7
                climber.gravity.y = 0.25
                __TS__Await(ST:when(function() return prio <= climber.position.y end))
                map:detach(climber)
                player.position.x = math.floor(climber.position.x + 0.5)
                player.position.y = prio
                player.stance = "left"
                player.alpha.value = 1
                assets["s$step_gravel"]:instance()
                __TS__Await(ST:pause(30))
                __TS__Await(reader:text(text.overworld.gateclimb8))
                __TS__Await(ST:pause(20))
                player.stance = "right"
                __TS__Await(ST:pause(30))
                local cam = map:cam_clamped()
                map.camera = cam
                local camX = cam.x
                local reg = map:cam_free()
                __TS__Await(cam:automate(75, { x = 320 }))
                __TS__Await(ST:pause(55))
                __TS__Await(reader:text(text.overworld.gateclimb9))
                __TS__Await(ST:pause(35))
                __TS__Await(cam:automate(75, { x = camX }))
                map:cam_restore(unpack(reg))
                map.camera = player.position
                __TS__Await(ST:pause(45))
                player.stance = "down"
                __TS__Await(reader:text(text.overworld.gateclimb10))
                game.cutscene = game.cutscene - 1
            end)
        end
    }
    local scripts_ex = {
        drillie = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if map.room ~= 6 or accessor.state_redleaf_gate ~= 0 then
                    return ____awaiter_resolve(nil, false)
                end
                __TS__Await(reader:text(text.overworld.drillie1("overworld/drillie1")))
                __TS__Await(reader:choice(text.overworld.drillie2))
                if game.r_choice == 1 then
                    return ____awaiter_resolve(nil)
                end
                game.cutscene = game.cutscene + 1
                __TS__Await(reader:text(text.overworld.drillie3))
                __TS__Await(ST:pause(30))
                if player.position.x > 25 and player.position.y < (player.position.x < 100 and 46 or 63) then
                    if player.position.x < 80 then
                        __TS__Await(player_walk(1.5, { x = 50 }))
                    elseif player.position.x < 140 then
                        __TS__Await(player_walk(1.5, { x = 120 }))
                    else
                        __TS__Await(player_walk(1.5, { x = 190 }))
                    end
                    __TS__Await(player_walk(1.5, { y = 70 }))
                elseif player.position.x > 208 then
                    __TS__Await(player_walk(1.5, { x = 205 }))
                end
                __TS__Await(player_walk(1.5, { x = 205, y = 90 }))
                if player.stance ~= "right" then
                    __TS__Await(ST:pause(20))
                    player.stance = "right"
                end
                __TS__Await(ST:pause(20))
                bb_standard(player, assets["ie$surprise"])
                assets["s$driller"]:instance()
                __TS__Await(ST:pause(35))
                __TS__Await(player_walk(1.5, { y = 80 }))
                player.stance = "right"
                __TS__Await(ST:pause(15))
                bb_standard(player, assets["ie$surprise"])
                assets["s$driller"]:instance()
                __TS__Await(ST:pause(30))
                __TS__Await(player_walk(1.5, { y = 100 }))
                player.stance = "right"
                __TS__Await(ST:pause(15))
                bb_standard(player, assets["ie$surprise"])
                assets["s$driller"]:instance()
                __TS__Await(ST:pause(30))
                __TS__Await(player_walk(1.5, { y = 90 }))
                player.stance = "right"
                __TS__Await(ST:pause(40))
                accessor.state_redleaf_gate = 1
                local ____opt_53 = object("wallbox")
                if ____opt_53 ~= nil then
                    ____opt_53:destroy()
                end
                reveal("gatebox")
                local gate1 = object("gate1").self
                gate1.frame = 1
                gate1:addTicker(function(self)
                    if player.position.x < 212 then
                        self.priority = 85
                    else
                        self.priority = 77
                    end
                end)
                local gate2 = object("gate2").self
                gate2.frame = 1
                gate2:addTicker(function(self)
                    if player.position.x < 200 then
                        self.priority = 112
                    else
                        self.priority = 121
                    end
                end)
                __TS__Await(ST:pause(30))
                __TS__Await(reader:text(text.overworld.drillie4))
                game.cutscene = game.cutscene - 1
            end)
        end,
        ponder = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                game.cutscene = game.cutscene + 1
                __TS__Await(ST:pause(10))
                __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                if accessor.plot < 5 then
                    __TS__Await(reader:text(text.ponder_arrival("ponder_arrival")))
                elseif accessor.plot < 7 then
                    __TS__Await(reader:text(text.ponder_chase("ponder_chase")))
                elseif accessor.event_redleaf_gateclimb == 0 then
                    __TS__Await(reader:text(text.ponder_gate))
                elseif accessor.event_redleaf_gateclimb == 1 then
                    __TS__Await(reader:text(text.ponder_shock()))
                    if accessor.item_glove1 and accessor.item_glove2 and accessor.item_boot1 and accessor.item_boot2 then
                        accessor.event_redleaf_gateclimb = 2
                    end
                elseif map.room < 7 then
                    if accessor.state_redleaf_gate == 0 then
                        __TS__Await(reader:text(text.ponder_gear))
                    else
                        __TS__Await(reader:text(text.ponder_unlock))
                    end
                else
                    __TS__Await(reader:text(text.ponder_factory("ponder_factory")))
                end
                game.cutscene = game.cutscene - 1
            end)
        end
    }
    local updaters = {
        [0] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.item_glove1 then
                    local ____opt_55 = object("glover")
                    if ____opt_55 ~= nil then
                        ____opt_55:destroy()
                    end
                    local ____opt_57 = object("glover")
                    if ____opt_57 ~= nil then
                        ____opt_57:destroy()
                    end
                end
                if physical and accessor.plot < 4 then
                    game.cutscene = game.cutscene + 1
                    accessor.plot = 4
                    map.autoplay = false
                    local fd = __TS__New(STRectangle,
                        { color = 12500670, priority = 1000, size = { x = 240, y = 180 }, anchor = 0.5 })
                    screen:attach(fd)
                    local speed = assets["s$warp_speed"]:instance_forced({ gain = 0 })
                    __TS__Await(speed.gain:automate(60, 1))
                    local c = ""
                    local gchar = text.overworld.system2
                    local system = __TS__New(STText, {
                        anchor = 0.5,
                        font = assets["f$helloplayer"],
                        color = 0,
                        priority = 1001,
                        metadata = 0
                    }):addTicker(function(self)
                        local arf = self.metadata
                        if arf ~= 0 then
                            self.metadata = self.metadata - 1
                        end
                        self.content = ""
                        for ____, char in __TS__Iterator(c) do
                            if math.random() < arf / 6 then
                                self.content = self.content .. __TS__StringAccess(
                                    gchar,
                                    math.floor(math.random() * #gchar)
                                )
                            else
                                self.content = self.content .. char
                            end
                        end
                    end)
                    for ____, line in ipairs(text.overworld.system1) do
                        assets["s$vcr"]:instance()
                        screen:attach(system)
                        c = line
                        system.metadata = 7
                        __TS__Await(ST:pause(60))
                        screen:detach(system)
                        __TS__Await(ST:pause(45))
                    end
                    local opt = {
                        threshold = 0,
                        intensity = 0,
                        xsamples = 1,
                        ysamples = 1,
                        limit = 1,
                        bleed = 0,
                        absorb = 0,
                        enabled = function() return accessor["$option_shaders"] ~= 0 end
                    }
                    local bloom = bloomShader(opt)
                    map:addDrawer(bloom.drawer)
                    local sh = 0
                    local flip = false
                    local cam = map:cam_clamped()
                    map.camera = cam
                    local rg = map:cam_free()
                    local camY = cam.y
                    local myY = camY
                    local intensity = __TS__New(STValue, 1)
                    local function screenTicker()
                        opt.intensity = intensity.value * 3
                        opt.ysamples = 1 + math.floor(intensity.value * 7 + 0.5) * 2
                        local cyc = ST:bezier(intensity.value, 5, 5, 1)
                        sh = sh + 1
                        if cyc <= sh then
                            sh = 0
                            if flip then
                                flip = false
                                myY = camY - intensity.value * 3
                            else
                                flip = true
                                myY = camY + intensity.value * 3
                            end
                        end
                        cam.y = (cam.y + myY * 3) / 4
                    end
                    screen:addTicker(screenTicker)
                    local ____self_59 = fd.alpha:automate(120, 0, 0)
                    ____self_59["then"](
                        ____self_59,
                        function()
                            screen:detach(fd)
                        end
                    )
                    local ____self_60 = intensity:automate(120, 0)
                    ____self_60["then"](
                        ____self_60,
                        function()
                            map:removeDrawer(bloom.drawer)
                            bloom:release()
                            screen:removeTicker(screenTicker)
                            map.camera = player.position
                            map:cam_restore(unpack(rg))
                        end
                    )
                    map:play(map.rooms[1].score)
                    map.music.gain.value = 0
                    map.music.gain:automate(120, 1)
                    assets["s$warp_out"]:instance()
                    local ____self_61 = ST:pause(15)
                    ____self_61["then"](
                        ____self_61,
                        function()
                            speed:stop()
                        end
                    )
                    local sleeper = __TS__New(STAnimation, {
                        anchor = { x = 0.5, y = 1 },
                        position = player.position,
                        frames = assets["ic$player$sleep"],
                        priority = player.position.y,
                        color = 10652124
                    })
                    map:attach(sleeper)
                    player.alpha.value = 0
                    local plusher = nil
                    if accessor.floof then
                        plusher = __TS__New(STSprite, {
                            image = images.goatplush,
                            anchor = { x = 0.5, y = 1 },
                            position = { x = 70, y = 115 },
                            priority = 115,
                            color = 10652124
                        })
                        map:attach(plusher)
                    end
                    __TS__Await(ST:pause(175))
                    sleeper.frame = 1
                    __TS__Await(ST:pause(40))
                    __TS__Await(reader:text(text.overworld.arrival1))
                    __TS__Await(ST:pause(50))
                    player.alpha.value = 1
                    if accessor.floof then
                        player.metadata.floof = false
                    end
                    map:detach(sleeper)
                    player.stance = "right"
                    __TS__Await(ST:pause(25))
                    player.stance = "down"
                    __TS__Await(ST:pause(55))
                    __TS__Await(player_walk(1, { y = 140 }, { x = 35 }))
                    __TS__Await(ST:pause(35))
                    __TS__Await(reader:text(text.overworld.arrival2))
                    __TS__Await(ST:pause(25))
                    player.stance = "right"
                    __TS__Await(ST:pause(35))
                    local silly = __TS__New(STSprite, {
                        anchor = { x = 0.5, y = 1 },
                        position = player.position,
                        color = 10652124,
                        priority = player.position.y,
                        image = assets["ic$player$what_side"]
                    })
                    map:attach(silly)
                    player.alpha.value = 0
                    __TS__Await(bb_standard(silly, assets["ie$surprise"]))
                    __TS__Await(ST:pause(15))
                    __TS__Await(reader:text(text.overworld.arrival3))
                    assets["m$redleaf"]:instance()
                    __TS__Await(ST:pause(25))
                    cam:set(map:cam_clamped())
                    map.camera = cam
                    local camX = cam.x
                    __TS__Await(cam:automate(100, { x = map.camera_max.x }))
                    __TS__Await(ST:pause(55))
                    __TS__Await(reader:text(text.overworld.arrival4))
                    map:detach(silly)
                    player.alpha.value = 1
                    __TS__Await(ST:pause(35))
                    __TS__Await(cam:automate(100, { x = camX }))
                    map.camera = player.position
                    if accessor.floof then
                        __TS__Await(ST:pause(15))
                        __TS__Await(player_walk(1.5, { x = 70 }, { y = 120 }))
                        __TS__Await(ST:pause(25))
                        map:detach(plusher)
                        player.metadata.floof = true
                        __TS__Await(ST:pause(35))
                        player.stance = "right"
                    end
                    __TS__Await(ST:pause(60))
                    __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                    __TS__Await(ST:pause(15))
                    __TS__Await(reader:text(text.overworld.arrival5))
                    __TS__Await(ST:pause(55))
                    player.stance = "down"
                    __TS__Await(reader:text(text.overworld.arrival6))
                    game.cutscene = game.cutscene - 1
                end
            end)
        end,
        [2] = function(from, physical)
            if accessor.item_boot2 then
                local ____opt_62 = object("bootey")
                if ____opt_62 ~= nil then
                    ____opt_62:destroy()
                end
            end
            if physical then
                if accessor.plot < 5 then
                    local stowbush = object("stowbush").self
                    local sx = stowbush.scale.x
                    stowbush.scale.x = sx / 1.05
                    stowbush.scale.y = 1.05
                    stowbush.metadata.funny = function()
                        stowbush.scale:automate(5, { x = 1.05 * sx, y = 1 / 1.05 }, { x = sx, y = 1 })
                    end
                elseif accessor.tutorial_sprint then
                    local ____self_64 = hintSprint()
                    ____self_64["then"](
                        ____self_64,
                        function()
                            accessor.tutorial_sprint = false
                        end
                    )
                end
            end
        end,
        [4] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if physical and accessor.plot < 6 then
                    accessor.plot = 6
                    game.cutscene = game.cutscene + 1
                    local stowaway = ezchar({ stances = characters.stowaway, stance = "left", position = { x = 165, y = 85 }, color = 15501672 })
                        :addDrawer(stepSFX)
                    map:attach(stowaway)
                    __TS__Await(stowaway:walk(2, { x = 180 }))
                    __TS__Await(ST:pause(20))
                    stowaway.stance = "down"
                    __TS__Await(ST:pause(40))
                    player.position.x = math.min(
                        math.max(player.position.x, 80),
                        160
                    )
                    local ____temp_66 = reader:text(text.overworld.stowaway4)
                    local ____player_walk_result_67 = player_walk(1.5, { y = 160 }, { x = 160, y = 120 })
                    local ____self_65 = ST:pause(20)
                    __TS__Await(__TS__PromiseAll({
                        ____temp_66,
                        ____player_walk_result_67,
                        ____self_65["then"](
                            ____self_65,
                            function()
                                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                    __TS__Await(stowaway:walk(2.5, { x = 260 }))
                                    map:detach(stowaway)
                                end)
                            end
                        )
                    }))
                    __TS__Await(ST:pause(45))
                    __TS__Await(reader:text(text.overworld.stowaway5))
                    game.cutscene = game.cutscene - 1
                end
            end)
        end,
        [5] = function()
            if accessor.item_glove2 then
                local ____opt_68 = object("glovey")
                if ____opt_68 ~= nil then
                    ____opt_68:destroy()
                end
            end
        end,
        [6] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.item_boot1 then
                    local ____opt_70 = object("booter")
                    if ____opt_70 ~= nil then
                        ____opt_70:destroy()
                    end
                    local ____opt_72 = object("booter")
                    if ____opt_72 ~= nil then
                        ____opt_72:destroy()
                    end
                end
                if accessor.state_redleaf_gate ~= 0 then
                    local ____opt_74 = object("wallbox")
                    if ____opt_74 ~= nil then
                        ____opt_74:destroy()
                    end
                    local gate1 = object("gate1").self
                    gate1.frame = 1
                    gate1:addTicker(function(self)
                        if player.position.x < 212 then
                            self.priority = 85
                        else
                            self.priority = 77
                        end
                    end)
                    local gate2 = object("gate2").self
                    gate2.frame = 1
                    gate2:addTicker(function(self)
                        if player.position.x < 200 then
                            self.priority = 112
                        else
                            self.priority = 121
                        end
                    end)
                else
                    hide("gatebox")
                end
                if physical and accessor.plot < 7 then
                    accessor.plot = 7
                    game.cutscene = game.cutscene + 1
                    local gate1 = object("gate1").self
                    local gate2 = object("gate2").self
                    gate1.frame = 1
                    gate2.frame = 1
                    local stowaway = ezchar({ stances = characters.stowaway, stance = "left", position = { x = 140, y = 100 }, color = 15501672 })
                        :addDrawer(stepSFX)
                    map:attach(stowaway)
                    __TS__Await(ST:pause(10))
                    __TS__Await(bb_standard(stowaway, assets["ie$surprise"]))
                    __TS__Await(ST:pause(5))
                    local ____self_76 = ST:when(function() return 230 <= stowaway.position.x end)
                    local ____self_76_then_result_79 = ____self_76["then"](
                        ____self_76,
                        function()
                            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                gate1.frame = 0
                                gate2.frame = 0
                                __TS__Await(ST:pause(20))
                                __TS__Await(reader:text(text.overworld.stowaway6))
                            end)
                        end
                    )
                    local ____self_77 = stowaway:walk(2.5, { x = 260 })
                    local ____self_77_then_result_80 = ____self_77["then"](
                        ____self_77,
                        function()
                            map:detach(stowaway)
                        end
                    )
                    local ____self_78 = ST:pause(15)
                    __TS__Await(__TS__PromiseAll({
                        ____self_76_then_result_79,
                        ____self_77_then_result_80,
                        ____self_78["then"](
                            ____self_78,
                            function() return player_walk(2, { x = 180, y = 90 }) end
                        )
                    }))
                    __TS__Await(ST:pause(45))
                    player.stance = "down"
                    __TS__Await(reader:text(text.overworld.stowaway7))
                    game.cutscene = game.cutscene - 1
                end
            end)
        end
    }
    activators[#activators + 1] = function(test, name, ...)
        local args = { ... }
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            if game.cutscene ~= 0 then
                return ____awaiter_resolve(nil)
            end
            if scripts[name] ~= nil then
                local p = scripts[name](test, args)
                if p ~= nil then
                    __TS__Await(p)
                end
            end
        end)
    end
    game.script = function(name)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            if scripts_ex[name] ~= nil then
                local ____TS__Await_result_81 = __TS__Await(scripts_ex[name]())
                if ____TS__Await_result_81 == nil then
                    ____TS__Await_result_81 = true
                end
                return ____awaiter_resolve(nil, ____TS__Await_result_81)
            end
            return ____awaiter_resolve(nil, false)
        end)
    end
    __TS__ArrayPush(
        items,
        {
            name = function(self)
                return text.item_gloves.name()
            end,
            priority = 100,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    __TS__Await(reader:text(text.item_gloves.info()))
                end)
            end,
            show = function(self)
                return accessor.item_glove1 or accessor.item_glove2
            end
        },
        {
            name = function(self)
                return text.item_boots.name()
            end,
            priority = 101,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    __TS__Await(reader:text(text.item_boots.info()))
                end)
            end,
            show = function(self)
                return accessor.item_boot1 or accessor.item_boot2
            end
        }
    )
    map:addUpdater(function(self, from, to, physical, x, y, last)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            if to == nil then
                return ____awaiter_resolve(nil)
            end
            for ____, obj in __TS__Iterator(objects("bush")) do
                do
                    local anim = obj.self
                    if anim.metadata.room ~= to then
                        goto __continue231
                    end
                    local ap = anim.position:clone()
                    anim.priority = anim.position.y - 0.6
                    local leafRs = nil
                    local leafRand = __TS__New(
                        STValueRandom,
                        (ap.x - x) * 1000,
                        (ap.y - y) * 1000,
                        function() return leafRs end,
                        function(state)
                            leafRs = state
                            return leafRs
                        end
                    )
                    anim.frame = leafRand:int(2)
                    anim.scale.x = leafRand:next() < 0.5 and -1 or 1
                    if physical then
                        local sx = anim.scale.x
                        local hbox
                        hbox = __TS__New(
                            STHitbox,
                            {
                                position = ap:subtract(0, 3),
                                metadata = {
                                    active = false,
                                    scan = true,
                                    walkable = true,
                                    tags = { "nograss" },
                                    script = function(self)
                                        if hbox.metadata.active then
                                            if game.c_up then
                                                local ____player_position_82, ____y_83 = player.position, "y"
                                                ____player_position_82[____y_83] = ____player_position_82[____y_83] + 1
                                            elseif game.c_down then
                                                local ____player_position_84, ____y_85 = player.position, "y"
                                                ____player_position_84[____y_85] = ____player_position_84[____y_85] - 1
                                            end
                                            if game.c_left then
                                                local ____player_position_86, ____x_87 = player.position, "x"
                                                ____player_position_86[____x_87] = ____player_position_86[____x_87] + 1
                                            elseif game.c_right then
                                                local ____player_position_88, ____x_89 = player.position, "x"
                                                ____player_position_88[____x_89] = ____player_position_88[____x_89] - 1
                                            end
                                        else
                                            hbox.metadata.active = true
                                            anim.scale:automate(5, { x = sx / 1.1, y = 1.1 }, { x = sx / 1.05, y = 1.05 })
                                            sprayLeaf(player.position)
                                            player.alpha.value = 0
                                            assets["s$step_bush"]:instance()
                                        end
                                    end
                                },
                                anchor = { x = 0.5, y = 1 },
                                size = { x = 30, y = 7 }
                            }
                        ):addTicker(function(self)
                            if self.metadata.active then
                                self:calculate()
                                player_hitbox:calculate()
                                if not player_hitbox:test(self) then
                                    self.metadata.active = false
                                    anim.scale:automate(5, { x = 1.05 * sx, y = 1 / 1.05 }, { x = sx, y = 1 })
                                    sprayLeaf(player.position)
                                    player.alpha.value = 1
                                    assets["s$step_bush"]:instance({ rate = 1.25, gain = 0.5 })
                                    state.bushprompt = false
                                end
                            end
                        end)
                        map:attach(hbox)
                        temp[#temp + 1] = hbox
                    else
                        local hbox = __TS__New(
                            STHitbox,
                            {
                                position = ap:subtract(0, 3),
                                metadata = { tags = { "nograss" } },
                                anchor = { x = 0.5, y = 1 },
                                size = { x = 30, y = 7 }
                            }
                        )
                        map:attach(hbox)
                    end
                end
                ::__continue231::
            end
            for ____, obj in __TS__Iterator(objects("tree")) do
                do
                    local anim = obj.self
                    if anim.metadata.room ~= to then
                        goto __continue248
                    end
                    local ap = anim.position:clone()
                    local ____anim_position_90, ____y_91 = anim.position, "y"
                    ____anim_position_90[____y_91] = ____anim_position_90[____y_91] - 5
                    local ____anim_offset_92, ____y_93 = anim.offset, "y"
                    ____anim_offset_92[____y_93] = ____anim_offset_92[____y_93] + 5
                    local leafRs = nil
                    local leafRand = __TS__New(
                        STValueRandom,
                        (ap.x - x) * 1000,
                        (ap.y - y) * 1000,
                        function() return leafRs end,
                        function(state)
                            leafRs = state
                            return leafRs
                        end
                    )
                    anim.frame = leafRand:int(2)
                    anim.scale.x = leafRand:next() < 0.5 and -1 or 1
                    local hit = physical or __TS__ArrayIncludes(anim.metadata.tags, "forcebox")
                    anim:attach(__TS__New(
                        STAnimation,
                        {
                            anchor = { x = 0.5, y = 1 },
                            scale = { x = leafRand:next() < 0.5 and -1 or 1 },
                            position = { y = 5 },
                            frame = leafRand:int(6),
                            frames = framess.treegrass
                        }
                    ))
                    local roots = ({ { 2, 6 }, { 2, 7 }, { 3, 6 }, { 3, 7 } })[leafRand:int(4) + 1]
                    local pool1 = { 0, 1 }
                    local pool2 = { 4, 5 }
                    local left = leafRand:next() < 0.5
                    local total = 1 + leafRand:int(2)
                    while total ~= 0 do
                        local pool = left and pool1 or pool2
                        roots[#roots + 1] = __TS__ArraySplice(
                            pool,
                            leafRand:int(#pool),
                            1
                        )[1]
                        left = not left
                        total = total - 1
                    end
                    local rooter = __TS__ArrayMap(
                        roots,
                        function(____, root)
                            local frame = root % 4
                            return __TS__New(
                                STAnimation,
                                {
                                    anchor = { x = 0.5, y = 1 },
                                    scale = { x = root < 4 and -1 or 1 },
                                    position = {
                                        x = ap.x + (frame < 2 and leafRand:int(5) - 2 or leafRand:int(3) - 1),
                                        y = ap.y + (8 + leafRand:int(3))
                                    },
                                    frame = frame,
                                    frames = framess.treeroot,
                                    priority = anim.position.y + 2 + frame / 1000
                                }
                            )
                        end
                    )
                    map:attach(unpack(rooter))
                    __TS__ArrayPushArray(temp, rooter)
                    local btop = 215
                    local bleft = leafRand:next() < 0.5
                    local bigbranches = ST:populate(
                        1 + leafRand:int(2),
                        function()
                            bleft = not bleft
                            btop = btop - (15 + leafRand:int(31))
                            return {
                                x = (8 + leafRand:int(2)) * (bleft and -1 or 1),
                                y = -btop
                            }
                        end
                    )
                    btop = 230
                    bleft = leafRand:next() < 0.5
                    local smallbranches = ST:populate(
                        3 + leafRand:int(4),
                        function()
                            bleft = not bleft
                            btop = btop - (10 + leafRand:int(21))
                            return {
                                x = (7 + leafRand:int(3)) * (bleft and -1 or 1),
                                y = -btop
                            }
                        end
                    )
                    local bi = #smallbranches
                    while bi ~= 0 do
                        bi = bi - 1
                        local branch1 = smallbranches[bi + 1]
                        for ____, branch2 in ipairs(bigbranches) do
                            if branch1.x < 0 == (branch2.x < 0) and math.abs(branch1.y - branch2.y) < 10 then
                                __TS__ArraySplice(smallbranches, bi, 1)
                            end
                        end
                    end
                    for ____, bigbranch in ipairs(bigbranches) do
                        anim:attach(__TS__New(
                            STAnimation,
                            {
                                priority = 2,
                                scale = { x = bigbranch.x < 0 and -1 or 1 },
                                position = bigbranch,
                                frame = leafRand:int(2),
                                anchor = { y = 1 },
                                frames = framess.treebranch
                            }
                        ))
                    end
                    for ____, smallbranch in ipairs(smallbranches) do
                        anim:attach(__TS__New(
                            STAnimation,
                            {
                                priority = 1,
                                scale = { x = smallbranch.x < 0 and -1 or 1 },
                                position = smallbranch,
                                frame = 2 + leafRand:int(4),
                                anchor = { y = 1 },
                                frames = framess.treebranch
                            }
                        ))
                    end
                    if hit then
                        for ____, root in ipairs(rooter) do
                            local frame = root.frame
                            root:attach(__TS__New(
                                STHitbox,
                                {
                                    position = { x = ({ -12, -8, -23, -22 })[frame + 1], y = ({ -9, -10, -14, -12 })[frame + 1] },
                                    size = { x = ({ 4, 5, 4, 5 })[frame + 1], y = 3 },
                                    metadata = {
                                        scan = true,
                                        interactable = true,
                                        obstacle = true,
                                        walkable = true,
                                        tags = { "nograss" },
                                        script = function(self, test)
                                            if test then
                                                tooltip(text.trivia_tooltip.tree)
                                                return
                                            end
                                            trivia("tree")
                                        end
                                    }
                                }
                            ))
                        end
                        local hbox = __TS__New(
                            STHitbox,
                            {
                                position = ap,
                                metadata = {
                                    scan = true,
                                    interactable = true,
                                    obstacle = true,
                                    walkable = true,
                                    tags = { "nograss" },
                                    script = function(self, test)
                                        if test then
                                            tooltip(text.trivia_tooltip.tree)
                                            return
                                        end
                                        trivia("tree")
                                    end
                                },
                                anchor = { x = 0.5, y = 1 },
                                size = { x = 36, y = 14 }
                            }
                        )
                        map:attach(hbox)
                        temp[#temp + 1] = hbox
                    else
                        local hbox = __TS__New(STHitbox,
                            { position = ap, metadata = { tags = { "nograss" } }, anchor = { x = 0.5, y = 1 }, size = { x = 38, y = 15 } })
                        map:attach(hbox)
                    end
                    if __TS__ArrayIncludes(anim.metadata.tags, "top") then
                        local top = __TS__New(
                            STAnimation,
                            {
                                frame = leafRand:int(2),
                                anchor = { x = 0.5, y = 1 },
                                frames = framess.treetop,
                                priority = ap.y + 25,
                                scale = { x = leafRand:next() < 0.5 and -1 or 1 },
                                position = ap
                            }
                        )
                        map:attach(top)
                        temp[#temp + 1] = top
                    end
                    local delay = 30 + leafRand:int(90)
                    local leafPool = ST:populate(
                        10 + leafRand:int(10),
                        function()
                            local pos = ST:ray(
                                leafRand:next() * 360,
                                15 + leafRand:next() * 35
                            )
                            return {
                                pos.x,
                                pos.y,
                                8 + leafRand:next() * 5,
                                10 + leafRand:next() * 5,
                                6 + leafRand:int(2),
                                180 + leafRand:int(60),
                                30 + leafRand:int(90),
                                leafRand:int(2)
                            }
                        end
                    )
                    local leafLoop = 0
                    local leafLoopPoints = {}
                    for ____, props in ipairs(leafPool) do
                        leafLoopPoints[#leafLoopPoints + 1] = leafLoop
                        leafLoop = leafLoop + props[7]
                    end
                    local pre = ST.time
                    local baseCheck = pre - leafLoop
                    while pre > baseCheck do
                        local loopTime = (pre + leafLoop * 2 - delay) % leafLoop
                        local leafPoolIndex = __TS__ArrayIndexOf(leafLoopPoints, loopTime)
                        if leafPoolIndex ~= -1 then
                            local props = leafPool[leafPoolIndex + 1]
                            if ST.time - pre < props[6] + (props[8] == 0 and 90 or 45) then
                                genLeaf(ap, pre, props)
                            end
                        end
                        pre = pre - 1
                    end
                    anim:addTicker(function(self)
                        local loopTime = (ST.time + leafLoop - delay) % leafLoop
                        local leafPoolIndex = __TS__ArrayIndexOf(leafLoopPoints, loopTime)
                        if leafPoolIndex ~= -1 then
                            genLeaf(ap, ST.time, leafPool[leafPoolIndex + 1])
                        end
                    end)
                end
                ::__continue248::
            end
            if last then
                for ____, obj in ipairs(__TS__ArraySlice(map.children)) do
                    if __TS__InstanceOf(obj, STSprite) then
                        repeat
                            local ____switch285 = obj.image
                            local ____cond285 = ____switch285 == images.pipec1 or ____switch285 == images.pipec2 or
                                ____switch285 == images.pipec3 or ____switch285 == images.pipec4 or
                                ____switch285 == images.pipel or ____switch285 == images.pipels or
                                ____switch285 == images.pipehl or ____switch285 == images.pipehls
                            if ____cond285 then
                                do
                                    local rise = obj.priority
                                    local scay = obj.scale.y
                                    obj.scale.y = 1
                                    if obj.image == images.pipehl then
                                        local dupes = ST:populate(
                                            scay - 1,
                                            function(i)
                                                local dupey = obj.position.y + 10 + i * 10
                                                return __TS__New(STSprite,
                                                    {
                                                        image = images.pipehl,
                                                        position = { x = obj.position.x, y = dupey },
                                                        priority =
                                                            dupey + 10 + rise * 10.01
                                                    })
                                            end
                                        )
                                        map:attach(unpack(dupes))
                                        __TS__ArrayPushArray(temp, dupes)
                                    end
                                    obj.priority = obj.position.y + 10 + rise * 10.01
                                    if rise < 3 then
                                        local walkable = rise == 0
                                        repeat
                                            local ____switch290 = obj.image
                                            local ____cond290 = ____switch290 == images.pipec1
                                            if ____cond290 then
                                                obj:attach(
                                                    __TS__New(STHitbox,
                                                        { position = { x = 2, y = rise * 10 }, size = { x = 6, y = 2 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } }),
                                                    __TS__New(STHitbox,
                                                        { position = { y = rise * 10 + 2 }, size = { x = 8, y = 6 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } })
                                                )
                                                break
                                            end
                                            ____cond290 = ____cond290 or ____switch290 == images.pipec2
                                            if ____cond290 then
                                                obj:attach(
                                                    __TS__New(STHitbox,
                                                        { position = { x = 2, y = rise * 10 }, size = { x = 6, y = 2 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } }),
                                                    __TS__New(STHitbox,
                                                        { position = { x = 2, y = rise * 10 + 2 }, size = { x = 8, y = 6 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } })
                                                )
                                                break
                                            end
                                            ____cond290 = ____cond290 or ____switch290 == images.pipec3
                                            if ____cond290 then
                                                obj:attach(
                                                    __TS__New(STHitbox,
                                                        { position = { x = 2, y = rise * 10 + 8 }, size = { x = 6, y = 2 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } }),
                                                    __TS__New(STHitbox,
                                                        { position = { x = 2, y = rise * 10 + 2 }, size = { x = 8, y = 6 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } })
                                                )
                                                break
                                            end
                                            ____cond290 = ____cond290 or ____switch290 == images.pipec4
                                            if ____cond290 then
                                                obj:attach(
                                                    __TS__New(STHitbox,
                                                        { position = { x = 2, y = rise * 10 + 8 }, size = { x = 6, y = 2 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } }),
                                                    __TS__New(STHitbox,
                                                        { position = { y = rise * 10 + 2 }, size = { x = 8, y = 6 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } })
                                                )
                                                break
                                            end
                                            ____cond290 = ____cond290 or ____switch290 == images.pipel
                                            if ____cond290 then
                                                obj:attach(__TS__New(STHitbox,
                                                    { position = { y = rise * 10 + 2 }, size = { x = 10, y = 6 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } }))
                                                break
                                            end
                                            ____cond290 = ____cond290 or ____switch290 == images.pipehl
                                            if ____cond290 then
                                                obj:attach(__TS__New(STHitbox,
                                                    { position = { x = 2, y = rise * 10 }, size = { x = 6, y = scay * 10 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } }))
                                                break
                                            end
                                        until true
                                    end
                                    if obj.image == images.pipels or obj.image == images.pipehls then
                                        local tags = obj.metadata.tags
                                        obj.priority = obj.priority + 0.005
                                        local ____STObject_105 = STObject
                                        local ____obj_position_103 = obj.position
                                        local ____obj_priority_104 = obj.priority
                                        local ____temp_96
                                        if rise == 0 then
                                            ____temp_96 = {}
                                        else
                                            local ____temp_95
                                            if rise == 1 then
                                                ____temp_95 = { images.strutuno }
                                            else
                                                local ____array_94 = __TS__SparseArrayNew(
                                                    images.struttop,
                                                    unpack(ST:populate(
                                                        rise - 2,
                                                        function() return images.strutmid end
                                                    ))
                                                )
                                                __TS__SparseArrayPush(____array_94, images.strutbot)
                                                ____temp_95 = { __TS__SparseArraySpread(____array_94) }
                                            end
                                            ____temp_96 = ____temp_95
                                        end
                                        local ____array_102 = __TS__SparseArrayNew(unpack(__TS__ArrayMap(
                                            ____temp_96,
                                            function(____, img, idx)
                                                return __TS__New(STSprite,
                                                    { image = img, position = { y = 10 + idx * 10 } })
                                            end
                                        )))
                                        __TS__SparseArrayPush(
                                            ____array_102,
                                            __TS__New(STHitbox,
                                                { position = { y = rise * 10 + 3 }, size = { x = 10, y = 7 }, metadata = { scan = true, obstacle = true, walkable = true, tags = { "nograss" } } })
                                        )
                                        local ____tags_includes_result_101
                                        local ____opt_97 = tags
                                        if ____opt_97 ~= nil then
                                            ____opt_97 = __TS__ArrayIncludes(tags, "valve")
                                        end
                                        if ____opt_97 then
                                            ____tags_includes_result_101 = {
                                                __TS__New(STAnimation,
                                                    { frames = framess.valve, anchor = 0.5, position = { x = 5, y = rise * 10 - 5 }, priority = 1 }),
                                                __TS__New(
                                                    STHitbox,
                                                    {
                                                        position = { x = 5 - 6, y = rise * 10 + 5 },
                                                        size = { x = 12, y = 3 },
                                                        metadata = {
                                                            scan = true,
                                                            obstacle = true,
                                                            interactable = true,
                                                            tags = { "nograss" },
                                                            script = function(self)
                                                                print("valve")
                                                            end
                                                        }
                                                    }
                                                )
                                            }
                                        else
                                            local ____opt_99 = tags
                                            if ____opt_99 ~= nil then
                                                ____opt_99 = __TS__ArrayIncludes(tags, "gauge")
                                            end
                                            ____tags_includes_result_101 = ____opt_99 and ({
                                                __TS__New(STAnimation, { frames = framess.gauge, anchor = 0.5, position = { x = 5, y = rise * 10 - 5 }, priority = 1 }),
                                                __TS__New(
                                                    STHitbox,
                                                    {
                                                        position = { x = 5 - 8, y = rise * 10 + 5 },
                                                        size = { x = 16, y = 3 },
                                                        metadata = {
                                                            scan = true,
                                                            obstacle = true,
                                                            interactable = true,
                                                            tags = { "nograss" },
                                                            script = function(self)
                                                                print("gauge")
                                                            end
                                                        }
                                                    }
                                                )
                                            }) or ({})
                                        end
                                        __TS__SparseArrayPush(
                                            ____array_102,
                                            unpack(____tags_includes_result_101)
                                        )
                                        local xtra = __TS__New(
                                            ____STObject_105,
                                            {
                                                position = ____obj_position_103,
                                                priority = ____obj_priority_104,
                                                children = { __TS__SparseArraySpread(____array_102) }
                                            }
                                        )
                                        map:attach(xtra)
                                        temp[#temp + 1] = xtra
                                    end
                                    break
                                end
                            end
                            ____cond285 = ____cond285 or ____switch285 == images.powertower
                            if ____cond285 then
                                do
                                    obj.priority = obj.position.y - 20
                                    obj:attach(__TS__New(
                                        STHitbox,
                                        {
                                            anchor = { x = 0.5, y = 1 },
                                            size = { x = 36, y = 22 },
                                            metadata = {
                                                scan = true,
                                                obstacle = true,
                                                walkable = true,
                                                interactable = true,
                                                tags = { "nograss" },
                                                script = function(self, test)
                                                    if test then
                                                        tooltip(text.trivia_tooltip.powertower)
                                                        return
                                                    end
                                                    trivia("powertower")
                                                end
                                            }
                                        }
                                    ))
                                    break
                                end
                            end
                            ____cond285 = ____cond285 or ____switch285 == images.sidecano
                            if ____cond285 then
                                do
                                    local tags = obj.metadata.tags
                                    local ____opt_106 = tags
                                    if ____opt_106 ~= nil then
                                        ____opt_106 = __TS__ArrayIncludes(tags, "noh")
                                    end
                                    if ____opt_106 then
                                        break
                                    end
                                    obj:attach(__TS__New(
                                        STHitbox,
                                        {
                                            anchor = { x = 0.5, y = 1 },
                                            size = { x = 21, y = 15 },
                                            metadata = {
                                                scan = true,
                                                obstacle = true,
                                                interactable = true,
                                                script = function(self, test)
                                                    if test then
                                                        tooltip(text.trivia_tooltip.barrel)
                                                        return
                                                    end
                                                    trivia("barrel")
                                                end
                                            }
                                        }
                                    ))
                                    break
                                end
                            end
                            ____cond285 = ____cond285 or ____switch285 == images.saplid
                            if ____cond285 then
                                do
                                    local tags = obj.metadata.tags
                                    local ____opt_108 = tags
                                    if ____opt_108 ~= nil then
                                        ____opt_108 = __TS__ArrayIncludes(tags, "noh")
                                    end
                                    if ____opt_108 then
                                        break
                                    end
                                    obj:attach(__TS__New(
                                        STHitbox,
                                        {
                                            anchor = { x = 0.5, y = 1 },
                                            size = { x = 20, y = 11 },
                                            metadata = {
                                                scan = true,
                                                interactable = true,
                                                walkable = true,
                                                tags = { "stepbox", "s$step_glass" },
                                                script = function(self, test)
                                                    if test then
                                                        tooltip(text.trivia_tooltip.lid)
                                                        return
                                                    end
                                                    trivia("lid")
                                                end
                                            }
                                        }
                                    ))
                                    break
                                end
                            end
                        until true
                    elseif __TS__InstanceOf(obj, STAnimation) then
                        repeat
                            local ____switch308 = obj.frames
                            local ____cond308 = ____switch308 == framess.pipe or ____switch308 == framess.pipeh
                            if ____cond308 then
                                do
                                    local rise = obj.priority
                                    local real = rise == 0 or rise == 1 or rise == 2
                                    repeat
                                        local ____switch310 = obj.frames
                                        local ____cond310 = ____switch310 == framess.pipe
                                        if ____cond310 then
                                            obj.priority = obj.position.y + 5 + rise * 10.01 + 0.005
                                            if real then
                                                local walkable = rise == 0
                                                obj:attach(__TS__New(STHitbox,
                                                    { position = { x = -8, y = rise * 10 - 5 }, size = { x = 16, y = 10 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } }))
                                            end
                                            break
                                        end
                                        ____cond310 = ____cond310 or ____switch310 == framess.pipeh
                                        if ____cond310 then
                                            obj.priority = obj.position.y + 10 + rise * 10.01 + 0.005
                                            if real then
                                                local walkable = rise == 0
                                                obj:attach(__TS__New(STHitbox,
                                                    { position = { x = -5, y = rise * 10 - 8 }, size = { x = 10, y = 16 }, metadata = { scan = true, obstacle = true, walkable = walkable, tags = walkable and ({ "nograss" }) or nil } }))
                                            end
                                            break
                                        end
                                    until true
                                    break
                                end
                            end
                            ____cond308 = ____cond308 or ____switch308 == framess.junctionbox
                            if ____cond308 then
                                do
                                    obj.priority = obj.position.y
                                    obj:attach(
                                        __TS__New(STAnimation, { frames = framess.jbdoor, anchor = { x = 0.5, y = 1 } }),
                                        __TS__New(
                                            STHitbox,
                                            {
                                                anchor = { x = 0.5, y = 1 },
                                                size = { x = 40, y = 15 },
                                                metadata = {
                                                    scan = true,
                                                    obstacle = true,
                                                    interactable = true,
                                                    script = function(self)
                                                        print("jbdoor")
                                                    end
                                                }
                                            }
                                        )
                                    )
                                    break
                                end
                            end
                            ____cond308 = ____cond308 or ____switch308 == framess.noncano
                            if ____cond308 then
                                do
                                    local leafRs = nil
                                    local leafRand = __TS__New(
                                        STValueRandom,
                                        (obj.position.x - x) * 1000,
                                        (obj.position.y - y) * 1000,
                                        function() return leafRs end,
                                        function(state)
                                            leafRs = state
                                            return leafRs
                                        end
                                    )
                                    obj.frame = leafRand:int(3)
                                    obj.scale.x = leafRand:next() < 0.5 and -1 or 1
                                end
                            end
                            ____cond308 = ____cond308 or
                                (____switch308 == framess.sapcan or ____switch308 == framess.sapcano)
                            if ____cond308 then
                                do
                                    local tags = obj.metadata.tags
                                    local ____opt_110 = tags
                                    if ____opt_110 ~= nil then
                                        ____opt_110 = __TS__ArrayIncludes(tags, "noh")
                                    end
                                    if ____opt_110 then
                                        break
                                    end
                                    if obj.priority == 0 then
                                        obj.priority = obj.position.y + obj.position.x / 1000000
                                    end
                                    obj:attach(
                                        __TS__New(
                                            STHitbox,
                                            {
                                                anchor = { x = 0.5, y = 1 },
                                                size = { x = 14, y = 11 },
                                                metadata = {
                                                    scan = true,
                                                    obstacle = true,
                                                    interactable = true,
                                                    script = function(self, test)
                                                        if test then
                                                            tooltip(text.trivia_tooltip.barrel)
                                                            return
                                                        end
                                                        trivia("barrel")
                                                    end
                                                }
                                            }
                                        ),
                                        __TS__New(
                                            STHitbox,
                                            {
                                                anchor = { x = 0.5, y = 1 },
                                                position = { y = -2 },
                                                size = { x = 20, y = 7 },
                                                metadata = {
                                                    scan = true,
                                                    obstacle = true,
                                                    interactable = true,
                                                    script = function(self, test)
                                                        if test then
                                                            tooltip(text.trivia_tooltip.barrel)
                                                            return
                                                        end
                                                        trivia("barrel")
                                                    end
                                                }
                                            }
                                        )
                                    )
                                    local ____opt_112 = tags
                                    if ____opt_112 ~= nil then
                                        ____opt_112 = __TS__ArrayIncludes(tags, "nog")
                                    end
                                    if ____opt_112 then
                                        break
                                    end
                                    local leafRs = nil
                                    local leafRand = __TS__New(
                                        STValueRandom,
                                        (obj.position.x - obj.metadata.x) * 1000,
                                        (obj.position.y - obj.metadata.y) * 1000,
                                        function() return leafRs end,
                                        function(state)
                                            leafRs = state
                                            return leafRs
                                        end
                                    )
                                    obj:attach(__TS__New(
                                        STAnimation,
                                        {
                                            anchor = { x = 0.5, y = 1 },
                                            scale = { x = leafRand:next() < 0.5 and -1 or 1 },
                                            frame = leafRand:int(6),
                                            frames = framess.barrelgrass
                                        }
                                    ))
                                    break
                                end
                            end
                        until true
                    end
                end
                local tile = 10
                local distrib = 0.1
                local grasses = {}
                local nograss = {}
                local getYerOwnDamnGrassTwat = object("grass")
                if getYerOwnDamnGrassTwat ~= nil then
                    for ____, obj in __TS__Iterator(objects("nograss")) do
                        local other = obj.self
                        other:calculate()
                        nograss[#nograss + 1] = other
                        if other.metadata.obstacle ~= true and other.metadata.interactable ~= true and other.metadata.walkable ~= true then
                            local tags = other.metadata.tags
                            if not __TS__ArrayIncludes(tags, "stepbox") then
                                obj:destroy()
                            end
                        end
                    end
                    local leafRs = nil
                    grasses[#grasses + 1] = {
                        getYerOwnDamnGrassTwat.self,
                        __TS__New(
                            STValueRandom,
                            (100 - map.room) * 1000,
                            map.room * 1000,
                            function() return leafRs end,
                            function(state)
                                leafRs = state
                                return leafRs
                            end
                        )
                    }
                    getYerOwnDamnGrassTwat:destroy()
                end
                for ____, neighbor in ipairs(map.rooms[map.room + 1].neighbors or ({})) do
                    local ____this_115
                    ____this_115 = map.rooms[neighbor[1] + 1]
                    local ____opt_114 = ____this_115.physical
                    local ____temp_116 = ____opt_114 and ____opt_114(____this_115)
                    if ____temp_116 == nil then
                        ____temp_116 = {
                            {},
                            function()
                            end
                        }
                    end
                    local containers, cleanup = unpack(____temp_116)
                    for ____, container in ipairs(containers) do
                        do
                            if not __TS__InstanceOf(container, STHitbox) then
                                goto __continue338
                            end
                            if type(container.metadata) ~= "table" then
                                goto __continue338
                            end
                            local tags = container.metadata.tags
                            if type(tags) ~= "table" then
                                goto __continue338
                            end
                            if __TS__ArrayIncludes(tags, "grass") then
                                local ____container_position_117, ____x_118 = container.position, "x"
                                ____container_position_117[____x_118] = ____container_position_117[____x_118] +
                                    neighbor[2]
                                local ____container_position_119, ____y_120 = container.position, "y"
                                ____container_position_119[____y_120] = ____container_position_119[____y_120] +
                                    neighbor[3]
                                local leafRs = nil
                                grasses[#grasses + 1] = {
                                    container,
                                    __TS__New(
                                        STValueRandom,
                                        (100 - neighbor[1]) * 1000,
                                        neighbor[1] * 1000,
                                        function() return leafRs end,
                                        function(state)
                                            leafRs = state
                                            return leafRs
                                        end
                                    )
                                }
                                goto __continue338
                            end
                            if __TS__ArrayIncludes(tags, "nograss") then
                                local ____container_position_121, ____x_122 = container.position, "x"
                                ____container_position_121[____x_122] = ____container_position_121[____x_122] +
                                    neighbor[2]
                                local ____container_position_123, ____y_124 = container.position, "y"
                                ____container_position_123[____y_124] = ____container_position_123[____y_124] +
                                    neighbor[3]
                                map:attach(container)
                                container:calculate()
                                map:detach(container)
                                nograss[#nograss + 1] = container
                            end
                        end
                        ::__continue338::
                    end
                    cleanup()
                end
                for ____, ____value in ipairs(grasses) do
                    local grass = ____value[1]
                    local leafRand = ____value[2]
                    local placements = {}
                    local pool = __TS__ArrayFlat(ST:populate(
                        math.floor(grass.size.x / tile + 0.5),
                        function(x)
                            return ST:populate(
                                math.floor(grass.size.y / tile + 0.5),
                                function(y) return { x, y } end
                            )
                        end
                    ))
                    local tries = 0
                    local total = math.floor(#pool * distrib + 0.5)
                    while tries < total do
                        local xy = __TS__ArraySplice(
                            pool,
                            leafRand:int(#pool),
                            1
                        )[1]
                        local position = grass.position:add(
                            xy[1] * tile + leafRand:int(tile),
                            xy[2] * tile + leafRand:int(tile)
                        )
                        local sx = leafRand:next() < 0.5 and -1 or 1
                        local frame = leafRand:int(6)
                        local valid = true
                        for ____, placement in ipairs(placements) do
                            if math.abs(position.x - placement.x) < 20 and math.abs(position.y - placement.y) < 10 then
                                valid = false
                                break
                            end
                        end
                        if valid then
                            local grassbox = __TS__New(STHitbox,
                                { size = { x = 10, y = 1 }, anchor = { x = 0.5, y = 1 }, position = position })
                            map:attach(grassbox)
                            grassbox:calculate()
                            for ____, nog in ipairs(nograss) do
                                if grassbox:test(nog) then
                                    valid = false
                                    break
                                end
                            end
                            map:detach(grassbox)
                        end
                        if valid then
                            placements[#placements + 1] = position
                            local anim = __TS__New(STAnimation, {
                                frames = framess.grass,
                                scale = { x = sx },
                                frame = frame,
                                position = position,
                                priority = position.y - 0.4,
                                anchor = { x = 0.5, y = 1 }
                            })
                            map:attach(anim)
                            temp[#temp + 1] = anim
                        end
                        tries = tries + 1
                    end
                end
                for key in pairs(pager.storage) do
                    if __TS__StringIncludes(key, "#") then
                        pager.storage[key] = 0
                    end
                end
            end
            if physical and from == nil then
                repeat
                    local ____switch365 = accessor.plot
                    local ____cond365 = ____switch365 == 4
                    if ____cond365 then
                        assets["m$redleaf"]:instance()
                        break
                    end
                    ____cond365 = ____cond365 or (____switch365 == 5 or ____switch365 == 6 or ____switch365 == 7)
                    if ____cond365 then
                        assets["m$redleaf"]:instance({ rate = accessor.event_redleaf_gateclimb == 0 and 1.2 or 1 })
                        break
                    end
                until true
            end
            if updaters[to] ~= nil then
                local p = updaters[to](from, physical, x, y)
                if p ~= nil then
                    __TS__Await(p)
                end
            end
            if physical and from == nil and init.reload then
                init.reload = false
                unfailer()
            end
        end)
    end)
    player:addDrawer(stepSFX)
    reader.presets.hacker = {
        color = 15476262,
        chunk = 1,
        faces = {
            annoyed = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$hacker$annoyed"] }) end,
            default = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$hacker$default"] }) end,
            happi = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$hacker$happi"] }) end,
            mystery = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$common$mystery"] }) end,
            pensive = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$hacker$pensive"] }) end,
            surprise = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$hacker$surprise"] }) end,
            sweat = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$hacker$sweat"] }) end,
            sweat2 = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$hacker$sweat2"] }) end
        },
        font = assets["f$helloplayer"],
        interval = 1,
        voices = { default = { { assets["v$hacker1"], 2 }, { assets["v$hacker2"], 4 }, { assets["v$hacker3"], 4 }, { assets["v$hacker4"], 1 } } }
    }
    reader.presets.mechanic = {
        color = 2055321,
        chunk = 1,
        faces = {
            mystery = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$common$mystery"] }) end,
            angry = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$mechanic$angry"] }) end,
            default = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$mechanic$default"] }) end,
            sad = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$mechanic$sad"] }) end,
            side = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$mechanic$side"] }) end,
            sigh = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$mechanic$sigh"] }) end,
            surprise = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$mechanic$surprise"] }) end,
            suspicious = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$mechanic$suspicious"] }) end,
            what = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$mechanic$what"] }) end
        },
        font = assets["f$helloplayer"],
        interval = 1,
        voices = { default = { { assets["v$mechanic"], 1 } } }
    }
    reader.presets.thicc = {
        color = 15389279,
        chunk = 2,
        faces = {
            confused = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$confused"] }) end,
            default = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$default"] }) end,
            happi = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$happi"] }) end,
            laugh = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$laugh"] }) end,
            sad = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$sad"] }) end,
            side = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$side"] }) end,
            sigh = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$sigh"] }) end,
            sleep = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$sleep"] }) end,
            what = function() return __TS__New(STSprite, { anchor = 0.5, image = assets["if$thicc$what"] }) end
        },
        font = assets["f$helloplayer"],
        interval = 2,
        voices = { default = { { assets["v$thicc"], 1 } } }
    }
    save_hooks[#save_hooks + 1] = function()
        accessor.location_idx = map.room
        accessor.pager_redleaf = ST:encode(pager.storage)
    end
    local shaderCleanup = shaderSetup()
    return {
        map = map,
        overworld = overworld,
        cleanup = function(self)
            shaderCleanup()
        end
    }
end

return ____exports
