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
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__PromiseAll = ____lualib.__TS__PromiseAll
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__Spread = ____lualib.__TS__Spread
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__PromiseRace = ____lualib.__TS__PromiseRace
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST = ____storyteller.ST
local STAnimation = ____storyteller.STAnimation
local STAtlas = ____storyteller.STAtlas
local STAudio = ____storyteller.STAudio
local STBlend = ____storyteller.STBlend
local STContainer = ____storyteller.STContainer
local STDaemon = ____storyteller.STDaemon
local STFacing = ____storyteller.STFacing
local STFrames = ____storyteller.STFrames
local STHitbox = ____storyteller.STHitbox
local STImage = ____storyteller.STImage
local STPager = ____storyteller.STPager
local STRectangle = ____storyteller.STRectangle
local STSprite = ____storyteller.STSprite
local STText = ____storyteller.STText
local STValue = ____storyteller.STValue
local ____utils = require("code.engine.utils")
local bb_standard = ____utils.bb_standard
local ezecho = ____utils.ezecho
local rainGen = ____utils.rainGen
local standardSplitter = ____utils.standardSplitter
local ____global = require("code.global")
local accessor = ____global.accessor
local random = ____global.random
local ____bloom = require("code.shaders.bloom")
local bloomShader = ____bloom.default
local ____hsv = require("code.shaders.hsv")
local hsvShader = ____hsv.default
local ____outline = require("code.shaders.outline")
local outlineShader = ____outline.default
local ____common = require("code.maps.common")
local commonAreaGen = ____common.commonAreaGen
local commonResourcesGen = ____common.commonResourcesGen
function ____exports.resourcesGen(music, sound)
    local cr = commonResourcesGen(music, sound)
    return {
        daemons = __TS__ObjectAssign(
            {},
            cr.daemons,
            { crickets = __TS__New(STDaemon, "sounds/crickets.ogg", { mixer = sound, loop = true, gain = 0.75 }) }
        ),
        file = "maps/home.json",
        framess = __TS__ObjectAssign(
            {},
            cr.framess,
            {
                door = __TS__New(STFrames, "images/objects/home/door.json", "images/objects/home/door.png"),
                door_side = __TS__New(STFrames, "images/objects/home/door_side.json", "images/objects/home/door_side.png"),
                bed_frame = __TS__New(STFrames, "images/objects/home/bed_frame.json", "images/objects/home/bed_frame.png"),
                broom_box = __TS__New(STFrames, "images/objects/home/broom_box.json", "images/objects/home/broom_box.png"),
                shovel_pot = __TS__New(STFrames, "images/objects/home/shovel_pot.json",
                    "images/objects/home/shovel_pot.png"),
                basket = __TS__New(STFrames, "images/objects/home/basket.json", "images/objects/home/basket.png"),
                fridge = __TS__New(STFrames, "images/objects/home/fridge.json", "images/objects/home/fridge.png"),
                fridge_door = __TS__New(STFrames, "images/objects/home/fridge_door.json",
                    "images/objects/home/fridge_door.png"),
                bed_cover = __TS__New(STFrames, "images/objects/home/bed_cover.json", "images/objects/home/bed_cover.png"),
                fusebox = __TS__New(STFrames, "images/objects/home/fusebox.json", "images/objects/home/fusebox.png"),
                toy = __TS__New(STFrames, "images/objects/home/toy.json", "images/objects/home/toy.png"),
                counter = __TS__New(STFrames, "images/objects/home/counter.json", "images/objects/home/counter.png"),
                counter_extras = __TS__New(STFrames, "images/objects/home/counter_extras.json",
                    "images/objects/home/counter_extras.png"),
                telecomm = __TS__New(STFrames, "images/objects/home/telecomm.json", "images/objects/home/telecomm.png"),
                screwbox = __TS__New(STFrames, "images/objects/home/screwbox.json", "images/objects/home/screwbox.png")
            }
        ),
        images = __TS__ObjectAssign(
            {},
            cr.images,
            {
                desk = __TS__New(STImage, "images/objects/home/desk.png"),
                bed = __TS__New(STImage, "images/objects/home/bed.png"),
                bed_table = __TS__New(STImage, "images/objects/home/bed_table.png"),
                chair = __TS__New(STImage, "images/objects/home/chair.png"),
                dresser = __TS__New(STImage, "images/objects/home/dresser.png"),
                drill = __TS__New(STImage, "images/objects/home/drill.png"),
                mattress = __TS__New(STImage, "images/objects/home/mattress.png"),
                bin = __TS__New(STImage, "images/objects/home/bin.png"),
                entertainment0 = __TS__New(STImage, "images/objects/home/entertainment0.png"),
                entertainment1 = __TS__New(STImage, "images/objects/home/entertainment1.png"),
                entertainment2 = __TS__New(STImage, "images/objects/home/entertainment2.png"),
                lamp = __TS__New(STImage, "images/objects/home/lamp.png"),
                table = __TS__New(STImage, "images/objects/home/table.png"),
                chair_table = __TS__New(STImage, "images/objects/home/chair_table.png"),
                stove = __TS__New(STImage, "images/objects/home/stove.png"),
                board = __TS__New(STImage, "images/objects/home/board.png"),
                nook = __TS__New(STImage, "images/objects/home/nook.png"),
                void_shine1 = __TS__New(STImage, "images/objects/home/void_shine1.png"),
                void_shine2 = __TS__New(STImage, "images/objects/home/void_shine2.png"),
                extrabook = __TS__New(STImage, "images/objects/home/extrabook.png"),
                bowl = __TS__New(STImage, "images/objects/home/bowl.png"),
                night_living0 = __TS__New(STImage, "images/objects/home/night_living0.png"),
                night_living1 = __TS__New(STImage, "images/objects/home/night_living1.png"),
                night_living2 = __TS__New(STImage, "images/objects/home/night_living2.png"),
                night_living3 = __TS__New(STImage, "images/objects/home/night_living3.png"),
                night_living4 = __TS__New(STImage, "images/objects/home/night_living4.png"),
                night_living5 = __TS__New(STImage, "images/objects/home/night_living5.png"),
                night_kitchen0 = __TS__New(STImage, "images/objects/home/night_kitchen0.png"),
                night_kitchen1 = __TS__New(STImage, "images/objects/home/night_kitchen1.png"),
                night_kitchen2 = __TS__New(STImage, "images/objects/home/night_kitchen2.png"),
                night_kitchen3 = __TS__New(STImage, "images/objects/home/night_kitchen3.png"),
                night_kitchen4 = __TS__New(STImage, "images/objects/home/night_kitchen4.png"),
                sippytable = __TS__New(STImage, "images/objects/home/sippytable.png"),
                telescope1 = __TS__New(STImage, "images/objects/home/telescope1.png"),
                telescope2 = __TS__New(STImage, "images/objects/home/telescope2.png"),
                telescope_overlay = __TS__New(STImage, "images/objects/home/telescope_overlay.png"),
                fuseknob = __TS__New(STImage, "images/objects/home/fuseknob.png"),
                fusebox_overlay = __TS__New(STImage, "images/objects/home/fusebox_overlay.png"),
                fusebox_overlay_switch = __TS__New(STImage, "images/objects/home/fusebox_overlay_switch.png"),
                rock = __TS__New(STImage, "images/objects/home/rock.png"),
                powbar = __TS__New(STImage, "images/objects/home/powbar.png"),
                bed_frame_top = __TS__New(STImage, "images/objects/home/bed_frame_top.png"),
                rope = __TS__New(STImage, "images/objects/home/rope.png")
            }
        ),
        sheet = __TS__New(STFrames, "images/maps/home.json", "images/maps/home.png")
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
                ["ic$player$right_sit"] = __TS__New(STImage, "images/characters/player/right_sit.png"),
                ["ic$player$right_sit_plush"] = __TS__New(STImage, "images/characters/player/right_sit_plush.png"),
                ["ic$player$slippinjimmy"] = __TS__New(STFrames, "images/characters/player/slippinjimmy.json",
                    "images/characters/player/slippinjimmy.png"),
                ["ic$player$slippinjimmy_plush"] = __TS__New(STFrames, "images/characters/player/slippinjimmy_plush.json",
                    "images/characters/player/slippinjimmy_plush.png"),
                ["m$home"] = __TS__New(STDaemon, "music/home.ogg", { mixer = music, gain = 1, loop = true }),
                ["m$home_full"] = __TS__New(STDaemon, "music/home_full.ogg", { mixer = music, gain = 1, loop = true }),
                ["s$archangel"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/archangel.ogg"),
                    { mixer = sound, gain = 0.25, loop = true }
                ),
                ["s$basketpickup"] = __TS__New(STDaemon, "sounds/basketpickup.ogg", { mixer = sound, gain = 1 }),
                ["s$basketputdown"] = __TS__New(STDaemon, "sounds/basketputdown.ogg", { mixer = sound, gain = 1 }),
                ["s$blankets"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/blankets.ogg"),
                    { mixer = sound, gain = 0.25 }
                ),
                ["s$bowlgrab"] = __TS__New(STDaemon, "sounds/bowlgrab.ogg", { mixer = sound, gain = 1 }),
                ["s$breaker_close"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/breaker_close.ogg"),
                    { mixer = sound, gain = 0.5 }
                ),
                ["s$breaker_navigate"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/breaker_navigate.ogg"),
                    { mixer = sound, gain = 0.2 }
                ),
                ["s$breaker_open"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/breaker_open.ogg"),
                    { mixer = sound, gain = 0.5 }
                ),
                ["s$breaker_switch"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/breaker_switch.ogg"),
                    { mixer = sound, gain = 0.5 }
                ),
                ["s$bucketpickup"] = __TS__New(STDaemon, "sounds/bucketpickup.ogg", { mixer = sound, gain = 0.3 }),
                ["s$bucketputdown"] = __TS__New(STDaemon, "sounds/bucketputdown.ogg", { mixer = sound, gain = 0.7 }),
                ["s$chargethrow"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/chargethrow.ogg"),
                    { mixer = sound, loop = true }
                ),
                ["s$clicky"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/clicky.ogg"),
                    { mixer = sound, gain = 0.5 }
                ),
                ["s$door_close"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/door_close.ogg"),
                    { mixer = sound, gain = 1, rate = 0.9 }
                ),
                ["s$door_open"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/door_open.ogg"),
                    { mixer = sound, gain = 0.23 }
                ),
                ["s$duffellift"] = __TS__New(STDaemon, "sounds/duffellift.ogg", { mixer = sound, gain = 0.75 }),
                ["s$faucet_distant"] = __TS__New(STDaemon, "sounds/faucet_distant.ogg",
                    { mixer = sound, loop = true, gain = 0.3 }),
                ["s$faucet"] = __TS__New(STDaemon, "sounds/faucet.ogg", { mixer = sound, loop = true }),
                ["s$fridge_close"] = __TS__New(STDaemon, "sounds/fridge_close.ogg", { mixer = sound, gain = 0.6 }),
                ["s$fridge_open"] = __TS__New(STDaemon, "sounds/fridge_open.ogg", { mixer = sound, gain = 0.75 }),
                ["s$platformwarble"] = __TS__New(STDaemon, "sounds/platformwarble.ogg", { mixer = sound, gain = 0.5 }),
                ["s$ratchetloop"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/ratchetloop.ogg"),
                    { mixer = sound, gain = 0.6, loop = true }
                ),
                ["s$rockbounce"] = __TS__New(STDaemon, "sounds/rockbounce.ogg", { mixer = sound, gain = 0.8, rate = 1.2 }),
                ["s$shovelchnf"] = __TS__New(STDaemon, "sounds/shovelchnf.ogg", { mixer = sound, gain = 0.35 }),
                ["s$shovelshing"] = __TS__New(STDaemon, "sounds/shovelshing.ogg", { mixer = sound, gain = 0.25 }),
                ["s$spoongrab"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "sounds/spoongrab.ogg"),
                    { mixer = sound }
                ),
                ["s$tripod"] = __TS__New(STDaemon, "sounds/tripod.ogg", { mixer = sound, gain = 0.9, rate = 0.8 }),
                ["v$messenger"] = __TS__New(
                    STDaemon,
                    __TS__New(STAudio, "voices/messenger.ogg"),
                    { mixer = sound, gain = 0.6 }
                )
            }
        end,
        ____exports.resourcesGen
    )
end
local function textGen(pager)
    return {
        item_book = {
            name = "Book",
            info = function()
                return ({ {
"<p:none>\"The Jensen Paradox, third installment in the Jensen series.\"",
"<p:none>\"How will they escape last time?\""
}, {
"<p:none>\"Surface Tension, the hotel nobody ever leaves.\"",
"<p:none>\"An endless maze of hallways, doors, swimming pools and libraries...\""
}, {
"<p:none>\"Astrae Symphonia, a tale of intrigue, emotion, and music.\"",
"<p:none>\"Follow this rogue starship to the edge of the galaxy!\""
} })[accessor.choice_home_book + 1]
            end
        },
        item_rock = { name = "Rocks" },
        item_batteries = {
            name = "Batteries",
            info = {
"<p:player>(Type four batteries. Good for small devices and tools.)"
}
        },
        item_cover = {
            name = function() return accessor.item_scissors and "Blanket Rope" or "Blanket" end,
            info = function()
                return accessor.item_scissors and ({
"<p:player>(A makeshift \"rope\" made from pieces of a blanket.)"
}) or ({
"<p:player>(A comfortable blanket. Haven't found something to cut it with yet.)"
})
            end
        },
        item_crowbar = {
            name = "Metal Bar",
            info = {
"<p:player>(One bar of pure bed frame.)",
"<p:player><f:sweat4>(It's really heavy.)"
}
        },
        ponder_book = pager:create(0, {
"<p:none>(You ponder why you're still awake.)",
"<p:none>(You realize you don't have a book to read in bed.)"
}, {
"<p:none>(You ponder what kind of book you'd like to read.)",
"<p:none>(You're realize you're in the mood for something novel.)"
}),
        ponder_sleep = {
"<p:none>(You ponder why you're still awake.)",
"<p:none>(You realize you should probably go to bed now.)"
},
        ponder_hello = {
"<p:player>...",
"<p:player>(I don't really know where I am.)",
"<p:player><f:sigh>(Exploring might give me a better idea...)"
},
        ponder_outside = pager:create(
            0,
            {
"<p:player><f:sweat>...",
"<p:player><f:sweat>(This... house... doesn't make any sense.)",
"<p:player><f:confused>(How is it just... floating?)",
"<p:player><f:confused>(Why is there nothing else out there?)",
"<p:player><f:side>(If I could find something to \"test\" this place...)",
"<p:player>(... it might give me a clue how to escape it.)"
},
            function()
                return { "<p:player><f:sweat>(I'm looking for a way to escape.)",
                    "<p:player><f:sweat5>(To do that, I need to know what this place's limits are.)",
                    "<p:player><f:side>(I can't risk walking off the edge myself, so...)", accessor.item_rock and
                "<p:player>(... maybe I could throw those rocks off instead.)" or
                "<p:player>(... maybe I could throw something else off instead.)" }
            end
        ),
        ponder_platform = function()
            return accessor.item_cover and (accessor.item_scissors and ({
"<p:player>(So far, I've cut this blanket and made it into a rope.)",
"<p:player><f:side>(Now, I just need something to hold it in place for the climb...)",
"<p:player>(... something strong and sturdy, like metal.)"
}) or ({
"<p:player>(So far, I've found a blanket, which I can make into a rope.)",
"<p:player><f:sigh>(I still need something to cut it with.)"
})) or ({
"<p:player><f:determined>(I need to find a way down to that platform.)",
"<p:player>(It's too far to jump, so I'll have to try something else.)",
"<p:player><f:side>(A rope would do the trick...)"
})
        end,
        ponder_exit = pager:create(0, {
"<p:player><f:sigh>...",
"<p:player><f:sigh>(It's strange... omething about this house is comfortable.)",
"<p:player><f:side>(In another life, I could see myself living here...)"
}, {
"<p:player>(There's nothing else for me to do here.)",
"<p:player><f:sigh>(It's time to go.)"
}),
        overworld = {
            start1 = "WARNING",
            start2 =
            "This game features tons of cute characters and heartfelt moments, presented in a simple visual style.",
            start3 =
            "If you're looking for violence, fancy graphics, or even a game over screen, you won't find any of those here.",
            tutorial1 = "Press [↑] [↓] [←] [→] to move.",
            tutorial2 = "Press [Z] to check objects.",
            tutorial3 = "按下[Z]推进对话。",
            tutorial4 = "Press [↑] [↓] to select.\nPress [Z] to confirm.",
            tutorial5 = "Press [C] to toggle the menu.\n{color=0x7f7f7f}Try every menu function.",
            tutorial6 = "Press [X] to exit.",
            tutorial7 = "Hold [Z], then release.",
            tutorial8 = "Press [←] [→] to climb.",
            blocker1 = {
"<p:none>(You'll be safer indoors this late at night.)"
},
            blocker2 = {
"<p:none>(You're forgetting something.)"
},
            blocker3 = {
"<p:none>Go upstairs and complete the tutorial?"
},
            blocker4 = {
"Go Upstairs",
"Not Yet"
},
            blocker5 = {
"<p:none>Go outside and climb down to the golden platform?"
},
            blocker6 = {
"Go Outside",
"Not Yet"
},
            bookshelf1 = {
"<p:none>Get a book?"
},
            bookshelf2 = {
"The Jensen Paradox (Action)",
"Surface Tension (Surreal)",
"Astrae Symphonia (Space)",
"Not Yet"
},
            bookshelf3 = {
"<h:a><p:none>(You got the Book.)"
},
            bookshelf4 = {
"<p:none>(You decide not to get a book.)"
},
            hello1 = {
"<p:player><f:sweat>...",
"<p:player><f:sweat>(This isn't my bed.)"
},
            hello2 = {
"<p:player><f:sweat5>(... maybe I slept on the wrong antenna...)"
},
            hello3 = {
"<p:player><f:what>(No, no... this isn't my home at all.)",
"<p:player><f:confused>(How did I get here? Did someone... kidnap me?)"
},
            hello4 = {
"<p:player><f:side>(I don't remember being taken...)"
},
            goatplush0 = "Plushie",
            goatplush1 = pager:create(
                0,
                function()
                    return { "<p:player><f:surprise>(Hey, this is MY plushie!)", accessor.plot < 1.1 and
                    "<p:player><f:confused>(Maybe this is my room after all...?)" or
                    "<p:player><f:confused>(... did you follow me here, to this strange place?)", "<p:none>Pick them up?" }
                end,
                {
"<p:none>Pick them up?"
}
            ),
            goatplush2 = {
"Yes",
"No"
},
            goatplush3 = {
"<p:player><f:sigh>Come here, you.",
"<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Plushie.",
"<p:player><f:side>...",
"<p:player>(Maybe I should hold onto this for a while.)"
},
            fusebox1 = function()
                return {
                    "<p:player><f:side>(An electric routing box...)",
                    unpack(accessor.plot < 2 and ({
"<p:player><f:sodesuka>(Maybe I can get main power back on.)"
}) or ({}))
                }
            end,
            fusebox2 = "KITCHEN",
            fusebox3 = "HALLWAY",
            fusebox4 = "FAMILY",
            fusebox5 = "BEDROOMS",
            fusebox6 = "E.CENTER",
            fusebox7 = "OUTSIDE",
            fusebox8 = "ON",
            fusebox9 = "OFF",
            lightswitch = {
"<p:player><f:sigh>(No power.)"
},
            telecomm1 = function()
                return {
                    "<p:player>(A comms device. Must be battery-powered.)",
                    unpack(accessor.plot < 2 and ({
"<p:player><f:confused>(Only two receivers on the contact list...?)"
}) or ({}))
                }
            end,
            telecomm2 = {
"<p:none>What will you do?"
},
            telecomm3a = {
"Call Work",
"Call Neighbors",
"Play Back Message",
"Never Mind"
},
            telecomm3b = {
"Call Work",
"Call Neighbors",
"Never Mind"
},
            telecomm4 = { {
"<p:none>(Calling... Work.)"
}, {
"<p:none>(Calling... Neighbors.)"
} },
            telecomm5 = {
"<p:none>(That Receiver Does Not Exist.)"
},
            telecomm6 = function()
                return {
                    "<p:none>(Beginning Playback...)",
                    "<p:messenger>Jerry's Dabo club, Morn speakin.'",
                    "<p:messenger>... hello? Anyone there?",
                    "<p:messenger>Hmph. Call us back if you'd like to claim your refund.",
                    unpack(accessor.state_home_telecomm_message == 0 and ({
                        "<h:a><p:player><f:annoyed>(Oh. It's just a scam.)",
                        unpack(accessor.event_home_outside and ({
"<p:player><f:sweat5>(I'd delete the message, if it wasn't for the small possibility...)",
"<p:player><f:sweat>(... that this might be the last other person's voice I hear.)"
}) or ({
"<p:player><f:sigh>(Nobody would mind if I deleted this, would they?)",
"<h:b><p:none>(Message Deleted.)"
}))
                    }) or ({}))
                }
            end,
            fridge1 = pager:create(
                0,
                function()
                    return { accessor.plot < 2 and "<p:player><f:sweat4>(You know what? I'm starving...)" or
                    "<p:player><f:sweat3>(Actually, before I go...)", "<p:none>Eat something from the fridge?" }
                end,
                {
"<p:none>Eat something from the fridge?"
}
            ),
            fridge2 = {
"Boka Fruit",
"Tenzka Tracks Ice Cream",
"Morning Leftovers",
"Never Mind"
},
            fridge3 = { {
"<p:player><f:annoyed>(These better be home-grown.)"
}, {
"<p:player><f:surprise>(My favorite food! I must be lucky.)"
}, {
"<p:player>(... it's better than nothing.)"
}, {
"<p:player><f:sweat5>..."
} },
            fridge4 = { {
"<p:player><f:sodesuka>(Huh. Those were actually pretty good.)"
}, {
"<p:player><f:sweat4>(... might've eaten too much.)"
}, {
"<p:player>..."
} },
            fridge5 = function()
                return accessor.plot < 2 and ({
"<p:player><f:sweat>(Oh... right.)",
"<p:player><f:sweat5>(I'm still trying to get out of here.)"
}) or ({
"<p:player>(... time to get back to what I was doing.)"
})
            end,
            outside1 = {
"<p:player><f:what>(What the...)",
"<p:player><f:what>..."
},
            outside2 = {
"<p:player><f:upset2>(What IS this?)",
"<p:player><f:sad>(W... where am I?)"
},
            outside3 = {
"<p:player><f:sweat5>(It's everywhere.)",
"<p:player><f:sweat3>(Everywhere I turn, it's just...)"
},
            outside4 = {
"<p:player><f:sweat5>(I... I have to get out of here...)"
},
            telescope1 = {
"<p:player><f:side>(The telescope...)"
},
            telescope2 = {
"<p:player>(Maybe I'll spot something in the distance.)"
},
            basket1a = {
"<p:player>...",
"<h:a><p:player><f:side>(Wait, that box on the bookshelf...)",
"<h:a><p:player><f:surprise>(It's the lockbox from the note!)"
},
            basket1b = {
"<p:player><f:side>(Hm...)"
},
            basket2 = {
"<p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Library Card.",
"<p:player><f:surprise>(There!)"
},
            basket3 = {
"<p:player><f:confused>(A library card...?)"
},
            bucket1 = function()
                return accessor.plot < 3 and
                    (accessor.item_cover and accessor.item_scissors and not accessor.item_crowbar and ({
"<p:player><f:side>(A rusty shovel. I'd use this as an anchor, but...)"
}) or ({
"<p:player><f:side>(A rusty shovel. Looks like it's...)"
})) or ({
"<p:player><f:side>(A rusty shovel...)"
})
            end,
            bucket2 = function()
                return {
                    "<p:player>(Wait.)",
                    unpack(accessor.plot < 2 and ({
"<p:player><f:confused>(What about the pail?)"
}) or ({
"<p:player><f:sigh>(That pail might be come in handy.)"
}))
                }
            end,
            bucket3 = function()
                local ____array_0 = __TS__SparseArrayNew(unpack(accessor.plot < 2 and ({
"<p:player><f:confused>(... how could it be raining when there's nothing else outside?)",
"<p:player><f:side>(Maybe I can learn something by collecting it, and...)",
"<p:player><f:sweat>(Studying it, I guess.)",
"<p:player><f:sigh>(... sounds stupid when I think about it like that, but still.)"
}) or ({
"<p:player>(Just in case.)"
})))
                __TS__SparseArrayPush(____array_0, "<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Pail.")
                return { __TS__SparseArraySpread(____array_0) }
            end,
            bucket4 = {
"<p:player><f:sodesuka>(Don't think I can collect any rain from here.)"
},
            rain1 = {
"<p:player><f:side>..."
},
            rain2 = {
"<p:player><f:side>(That's weird...)",
"<p:player><f:side>(The rain's definitely going inside, but...)",
"<p:player><f:sodesuka>(It's... not filling up.)"
},
            rain3 = {
"<p:player><f:what>(Freaky.)",
"<p:player><f:sigh>(... guess I can't learn anything from this, though.)"
},
            rope1 = function()
                return { "<p:player>(It's a rope. There's not much of it left.)", accessor.plot == 2 and
                "<p:player><f:sigh>(Doubt it's enough to reach the platform, but I'll take it anyway.)" or
                "<p:player><f:sigh>(Still might be useful, though.)",
                    "<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Rope." }
            end,
            rope2 = {
"<p:player><f:sodesuka>(No use for this indoors.)"
},
            dangle1 = {
"<p:player><f:side>(Hm...)"
},
            dangle2 = {
"<p:player><f:sigh>(No, it's nowhere NEAR long enough to get me down there.)"
},
            dangle3 = function()
                return accessor.item_cover and ({
"<p:player>(... the blanket plan will have to do.)"
}) or ({
"<p:player>(... maybe there's something else I could make a rope out of.)"
})
            end,
            drill = {
"<p:player>(A heavy-duty electric drill. Might be useful.)",
"<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Drill.",
"<p:player><f:sigh>(Good thing these batteries were included.)"
},
            drill_tooltip = "Drill",
            broombox1 = {
"<p:player><f:sigh>(A box of old collector's rocks...)",
"<p:player>(... doubt they're important, so instead, I could try throwing them.)",
"<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Rock.",
"<p:player>(Off the edge.)",
"<h:b><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Rock.",
"<p:player>(To see what happens.)",
"<h:c><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Rock."
},
            broombox2 = {
"<p:player><f:sigh>(It's worth a try.)"
},
            broombox3 = {
"<p:player><f:sweat>(Throwing these indoors won't tell me anything.)"
},
            golden1 = {
"<p:player>(... right.)"
},
            golden2 = {
"<p:player><f:sigh>...",
"<h:a><p:player><f:surprise>(Get ready...!)"
},
            golden3 = {
"<p:player><f:sweat3>...",
"<p:player><f:sweat3>(Maybe I didn't throw it far enough.)"
},
            golden4 = {
"<p:player><f:sigh>(Here we go...)",
"<h:a><p:player><f:surprise>(... again!)"
},
            golden5 = {
"<p:player><f:sad>...",
"<p:player><f:sad>(Nothing...)"
},
            golden6 = {
"<p:player><f:sigh>...",
"<p:player><f:sigh>(... what if I just...)"
},
            golden7 = {
"<p:player><f:what>..."
},
            golden8 = {
"<p:player><f:what>(That's new.)"
},
            golden9 = {
"<p:player><f:side>...",
"<p:player><f:side>(Doesn't look like part of the house...)",
"<p:player><f:confused>(Could that be what's behind all of this?)",
"<p:player><f:sweat3>...",
"<p:player><f:sweat3>(Maybe it's silly, but if...)",
"<p:player><f:sweat>(If I could get down there somehow...)"
},
            golden10 = {
"<p:player><f:determined>(... I might just be able to escape!)"
},
            scissors1 = function()
                local ____array_1 = __TS__SparseArrayNew(unpack(accessor.item_cover and ({
"<p:player><f:surprise>(Scissors! For the blanket!)"
}) or ({
"<p:player><f:side>(Scissors...)",
"<p:player>(Could be good to have these on hand.)"
})))
                __TS__SparseArrayPush(
                    ____array_1,
                    "<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Scissors.",
                    unpack(accessor.item_cover and ({
"<p:player><f:sweat4>(Sorry, little blanket...)"
}) or ({}))
                )
                return { __TS__SparseArraySpread(____array_1) }
            end,
            scissors2 = function()
                return {
                    "<p:player><f:side>(... that's that taken care of...)",
                    unpack(accessor.item_crowbar and ({
"<p:player><f:surprise>(Oh! And I can use the bed frame as an anchor!)"
}) or ({
"<p:player><f:sweat>(Now I need something to anchor the \"rope\" to once I'm outside.)"
}))
                }
            end,
            bed1 = {
"<p:player><f:side>(The bed...)",
"<p:player><f:sweat5>(... no...)"
},
            bed2 = function()
                return {
                    "<p:player><f:surprise>(The covers!)",
                    "<p:player><f:side>(If I cut the blanket into pieces, I can tie those together...)",
                    "<p:player><f:surprise>(... and make a rope out of it!)",
                    "<h:a><p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Blanket.",
                    unpack(accessor.item_scissors and ({
"<p:player><f:sweat4>(Sorry, little blanket...)"
}) or ({}))
                }
            end,
            bed3 = function()
                return not accessor.item_scissors and ({
"<p:player><f:sweat>(I'll need something to cut it with, though.)"
}) or (not accessor.item_crowbar and ({
"<p:player><f:sweat>(Now I need something to anchor the \"rope\" to once I'm outside.)"
}) or ({
"<p:player><f:surprise>(Oh! And I can use the bed frame as an anchor!)"
}))
            end,
            framer1 = function()
                return {
                    "<p:player><f:side>(A metal bed frame. I wonder if I could take it apart...)",
                    unpack(accessor.item_drill and ({
"<p:player>(... the drill should do nicely!)"
}) or ({
"<p:player>(... not by hand, that's for sure.)"
}))
                }
            end,
            framer2 = function()
                return {
                    "<p:none>{color=0xa289dc}Dysu{color=0xffffff} got the Metal Bar.",
                    unpack(accessor.item_cover and accessor.item_scissors and ({
"<p:player><f:side>..."
}) or ({
"<p:player><f:surprise>(Nice!)"
}))
                }
            end,
            framer3 = {
"<p:player><f:surprise>(... wait! That's it!)",
"<p:player><f:side>(I'll attach the \"rope\" to the bar, place it behind the doorway...)",
"<p:player><f:determined2>(... and climb my way down to the platform!)"
},
            done1 = {
"<p:player><f:side>(I'll attach the \"rope\" to it, place it behind the doorway...)",
"<p:player><f:determined2>(... and climb my way down to the platform!)"
},
            done2 = {
"<p:player><f:sweat5>(About time...)"
},
            exit1 = {
"<p:player><f:side>(Well, that should do it...)"
},
            exit2 = {
"<p:player><f:sweat>(Don't look down.)"
},
            exit3 = {
"<p:player><f:surprise>... I made it! I'm here!",
"<h:a><p:player><f:side>I'm actually..."
},
            exit4 = {
"<p:player><f:what>(What the-)"
}
        },
        trivia = {
            window = function()
                return accessor.plot < 1 and ({
"<p:none>(You peer through the window, observing the outdoor nightlife.)"
}) or (accessor.plot < 2 and (not accessor.event_home_outside and ({
"<p:player><f:side>(That's weird...)",
"<p:player>(... can't see anything out there.)"
}) or ({
"<p:player><f:sweat>..."
})) or ({
"<p:player><f:determined>..."
}))
            end,
            bed = function()
                return not accessor.item_cover and ({
"<p:player><f:sweat4>(A surprisingly comfortable bed.)"
}) or (accessor.plot < 3 and ({
"<p:player><f:sweat4>(Probably not as comfortable anymore.)"
}) or ({
"<p:player>(A bed.)"
}))
            end,
            computer = function()
                return {
                    "<p:player>(A computer.)",
                    unpack(not accessor.event_home_outside and ({
"<p:player><f:sigh>(The neural input looks worn out. Must have seen a lot of use.)"
}) or (accessor.plot < 3 and ({
"<p:player><f:sigh>(Without any power, it's just a box.)"
}) or ({})))
                }
            end,
            chair = function()
                return accessor.plot < 3 and ({
"<p:player>(Just a chair.)"
}) or ({
"<p:player><f:sigh>(Despite everything, it's still just a chair.)"
})
            end,
            dresser1 = function()
                return accessor.plot < 2 and ({
"<p:player>(Lots of toys and trinkets in these drawers.)"
}) or (accessor.plot < 3 and ({
"<p:player><f:sigh>(Now's not the time for souvenirs.)"
}) or ({
"<p:player><f:sigh>(Toys and trinkets.)"
}))
            end,
            dresser2 = function()
                return accessor.plot < 2 and ({
"<p:player>(Nothing but antenna warmers in these drawers.)"
}) or (accessor.plot < 3 and ({
"<p:player><f:sigh>(Antenna warmers won't help me reach the platform.)"
}) or ({
"<p:player><f:sigh>(Antenna warmers.)"
}))
            end,
            book = function()
                return accessor.plot < 3 and ({ ({
"<p:player><f:side>(\"The Jensen Paradox...\")",
"<p:player><f:side>(\"Surface Tension...\")",
"<p:player><f:side>(\"Astrae Symphonia...\")"
})[accessor.choice_home_book + 1], accessor.plot < 2 and "<p:player>(Not a bad choice.)" or "<p:player><f:sweat>(... part of this story might be coming true.)" }) or
                    ({ {
"<p:player>(\"The Jensen Paradox.\")"
}, {
"<p:player>(\"Surface Tension.\")"
}, {
"<p:player>(\"Astrae Symphonia.\")"
} })[accessor.choice_home_book + 1]
            end,
            cutetunnel = function()
                return accessor.plot < 2 and ({
"<p:player>(Painting of a wild arkette staring down a corridor.)"
}) or ({
"<p:player><f:sigh>(... you and me both, little arkette.)"
})
            end,
            toy = function()
                return accessor.plot < 2 and ({
"<p:player><f:confused>(A perpetual motion toy?)",
"<p:player><f:sodesuka>(Wonder how long it's been going...)"
}) or (accessor.plot < 3 and ({
"<p:player><f:confused>(Wait, wasn't this toy doing something earlier?)"
}) or ({
"<p:player>(A simple toy.)"
}))
            end,
            plant = function()
                return {
                    "<p:player>(Baby boka tree.)",
                    unpack(accessor.plot < 2 and ({
"<p:player><f:sweat3>(Seems like it's almost ready to be planted...)"
}) or (accessor.plot < 3 and ({
"<p:player><f:sigh>(Shame there's nowhere to plant this.)"
}) or ({})))
                }
            end,
            shovel = function()
                return accessor.item_bucket and ({
"<p:player><f:sigh>(A rusty shovel with a great big hole in it.)"
}) or
                    (accessor.plot < 3 and (accessor.item_cover and accessor.item_scissors and not accessor.item_crowbar and ({
"<p:player><f:side>(A rusty shovel. I'd use this as an anchor...)",
"<p:player><f:sweat>(... if it wasn't such a piece of junk.)"
}) or ({
"<p:player>(A rusty shovel. Looks like it's about to fall apart.)"
})) or ({
"<p:player>(Useless shovel.)"
}))
            end,
            broombox = function()
                return accessor.item_rock and ({
"<p:player><f:sigh>(An old broom with a broken handle.)"
}) or ({
"<p:player>(An old broom and some fancy rocks. The broom's handle is broken.)"
})
            end,
            dresserdrawer1 = {
"<p:player><f:sigh>(An empty dresser drawer.)"
},
            dresserdrawer2 = {
"<p:player><f:sigh>(An empty dresser drawer. It's stuck open.)"
},
            dresserpaper = function()
                return {
                    "<p:player>\"After much deliberation, we have come to an agreement.\"",
                    "<p:player>\"For your continued effort, a promotion is in order.\"",
                    "<p:player>\"Accept it at any time by bringing this envelope to work with you.\"",
                    "<p:player>\"Sincerely, the board.\"",
                    accessor.plot < 3 and "<p:player><f:side>..." or "<p:player><f:sigh>..."
                }
            end,
            mattress = function()
                return accessor.plot < 3 and ({
"<p:player><f:sigh>(Don't think this mattress has ever been slept on.)"
}) or ({
"<p:player>(Unused mattress.)"
})
            end,
            bin = {
"<p:player>(An empty bin with a cleaning towel draped over the side.)"
},
            bedframe = function()
                return accessor.plot < 2 and ({
"<p:player>(A metal bed frame. The most dangerous object in the universe.)"
}) or ({
"<p:player>(A metal bed frame, with one side removed.)",
"<p:player><f:sweat3>(If anything, this makes it MORE dangerous...)"
})
            end,
            fusebox = {
"<p:none>(The box emits a faint hum of electricity.)"
},
            lightswitch = {
"<p:none>（灯的开关。）"
},
            lamp = function()
                return accessor.plot < 1 and ({
"<p:none>(Favoring darkness's allure, you'd rather keep the lamp off.)"
}) or ({
                    "<p:player>(A lamp.)",
                    unpack(accessor.plot < 3 and ({
"<p:player><f:sigh>(... not something I use very often.)"
}) or ({}))
                })
            end,
            telescope = function()
                return accessor.plot < 1 and ({
"<p:none>(A telescope, still in its bag. You'll get it out eventually.)"
}) or ({
"<p:player><f:side>(A bagged-up telescope. That's a shame...)"
})
            end,
            bookshelf = function()
                return accessor.plot < 1 and ({
"<p:none>(In your opinion, books are the ideal medium for fiction.)"
}) or (not accessor.event_home_secret and ({
"<p:player><f:what>(This is a very good bookshelf. Almost makes me want to stay...)"
}) or (accessor.event_home_bookshelf < 1 and ({
"<p:player><f:side>(There's a broken lockbox up there, alright...)"
}) or (accessor.event_home_bookshelf < 2 and ({
"<p:player><f:sigh>(The box is too high for me to reach it.)"
}) or ({
"<p:player>(A gateway to reading, in more ways than one.)"
}))))
            end,
            couch = function()
                return accessor.plot < 1 and ({
"<p:none>(The couch. You wonder if you'll fall asleep here again.)"
}) or (accessor.plot < 2 and ({
"<p:player><f:sweat5>(Someone's been sleeping on this couch, haven't they?)"
}) or ({
"<p:player><f:confused>(Would a couch cushion soften the landing from a big jump?)",
"<p:player><f:sweat>(... no, too risky.)"
}))
            end,
            entertainment = function()
                return accessor.plot < 1 and ({
"<p:none>(The family entertainment center, an essential part of any home.)"
}) or (accessor.plot < 2 and ({
"<p:player>(A deluxe-edition family entertainment center.)"
}) or ({
"<p:player>(Family entertainment center.)"
}))
            end,
            SIPPY = function()
                return accessor.plot < 1 and ({
"<p:none>(A set of cups from a local consignment store.)"
}) or (accessor.plot < 2 and ({
"<p:player><f:sweat3>(Weird cups, full of... weird space fluid, or something.)",
"<p:player><f:sweat>(It's hard to tell.)"
}) or ({
"<p:player><f:sigh>(Better leave these where they are.)"
}))
            end,
            basket = function()
                return accessor.plot < 1 and ({
"<p:none>（一个空篮子。）",
"<p:none>（你肯定是把你最好的朋友\n落在楼上了。）"
}) or
                    (accessor.item_goatplush and ({ "<p:player><f:side>(Somehow, I'm tempted to put the plushie in this basket...)", accessor.floof and "<p:player><f:sweat4>(... of course, I'd still rather keep it on my head.)" or "<p:player><f:sweat4>(... of course, I'd still rather keep it with me.)" }) or ({
"<p:player>(Feels like something's missing here.)"
}))
            end,
            flipbasket = {
"<p:player><f:sodesuka>(The basket has become the stool.)"
},
            telecomm = {
"<p:none>(A portable comms device. One new message has been received.)",
"<p:none>(You'll play it back once you're not so sleepy.)"
},
            diningchair1 = function()
                return accessor.plot < 1 and ({
"<p:none>(Your dining chair.)"
}) or (accessor.plot < 2 and ({
"<p:player>(Just a dining chair.)"
}) or ({
"<p:player><f:sigh>(No matter what happens, it'll always be a dining chair.)"
}))
            end,
            diningchair2 = function()
                return accessor.plot < 1 and ({
"<p:none>(A dining chair. You don't have anywhere else to put it.)"
}) or (accessor.plot < 2 and ({
"<p:player><f:sigh>(... there's something weird about this dining chair.)"
}) or ({
"<p:player>(This really doesn't belong here.)"
}))
            end,
            sink = function()
                return accessor.plot < 1 and ({
"<p:none>(A leaky faucet. You'd like to fix this as soon as possible.)"
}) or (accessor.plot < 2 and ({
"<p:player><f:sweat5>(If this was MY house, I'd fix this on the spot.)"
}) or ({
"<p:player><f:sweat3>(The water's stopped...)"
}))
            end,
            jars = function()
                return accessor.plot < 1 and ({
"<p:none>(Jars with spices used in fancier meals. They're full to the brim.)"
}) or (accessor.plot < 2 and ({
"<p:player><f:sweat>(Never open a stranger's spice jars. Learned that the hard way.)"
}) or ({
"<p:player>(Spice jars.)"
}))
            end,
            plate = function()
                return accessor.plot < 1 and ({
"<p:none>(The only dinner plate you'll ever need.)"
}) or (accessor.plot < 2 and ({
"<p:player>(A dinner plate. Looks like it's part of a set.)"
}) or ({
"<p:player>(A dinner plate.)"
}))
            end,
            silverware = function()
                return accessor.plot < 1 and ({
"<p:none>(Kitchen utensils. You see no reason to replace them.)"
}) or (accessor.plot < 2 and ({
"<p:player><f:sodesuka>(These utensils seem a little old-fashioned...)"
}) or ({
"<p:player>(Kitchen utensils.)"
}))
            end,
            behindfridge = function()
                return accessor.plot < 1 and ({
"<p:none>(Plates and bowls stacked neatly in a pile. You don't use these.)"
}) or (accessor.plot < 2 and ({
"<p:player>(A pile of freshly-washed dishes.)"
}) or ({
"<p:player>(Clean dishes.)"
}))
            end,
            fridge = function()
                return accessor.plot < 1 and ({
"<p:none>(The fridge. You'd eat something if it wasn't so late.)"
}) or ({
"<p:player><f:sweat4>(Hope my... er, kidnapper doesn't mind me eating their food.)"
})
            end,
            stove = function()
                return accessor.plot < 1 and ({
"<p:none>(A laser-action stove and oven combination. It's very clean.)"
}) or (accessor.plot < 2 and ({
"<p:player><f:side>(This laser stove looks brand new...)",
"<p:player><f:sodesuka>(Guess I'm not the only one who doesn't know how to cook.)"
}) or ({
"<p:player><f:sodesuka>(Laser stove.)"
}))
            end,
            bowl_extra = function()
                return accessor.event_home_food and ({
"<p:player><f:sigh>(Just an empty bowl now.)"
}) or ({})
            end,
            rope = {
"<p:none>(A length of rope. It's been useful over the years.)"
},
            scissors = {
"<p:none>(A pair of scissors, good for cutting ropes.)"
},
            pantry = function()
                return accessor.plot < 1 and ({
"<p:none>(A well-stocked pantry. With this, you'll be ready for doomsday.)"
}) or (accessor.plot < 2 and ({
"<p:player>(Pantry food. My worst nightmare.)"
}) or ({
"<p:player>(Pantry food.)"
}))
            end,
            board = function()
                return accessor.plot < 1 and ({
"<p:none>(You feel this is exactly where it belongs.)"
}) or ({
                    "<p:player>(A large piece of wood.)",
                    unpack(accessor.plot < 2 and ({
"<p:player><f:side>(Looks like an extension for that dining table...)"
}) or ({}))
                })
            end,
            secret = function()
                local ____temp_3
                if accessor.plot < 1 then
                    ____temp_3 = {
"<p:none>(A tackboard with important notes.)"
}
                else
                    local ____array_2 = __TS__SparseArrayNew(unpack(not accessor.event_home_secret and ({
"<p:player><f:side>(There's a series of notes on this tackboard...)"
}) or ({})))
                    __TS__SparseArrayPush(
                        ____array_2,
                        "<p:player>(\"Plant boka tree tomorrow\")",
                        "<p:player>(\"Download new entertainment center programs\")",
                        "<p:player>(\"Fix broken lockbox\")",
                        unpack(not accessor.event_home_secret and
                            ({ "<p:player><f:confused>(Wait. A lockbox?)", accessor.event_home_bookshelf == 0.1 and "<p:player><f:side>(I swear there was a box like that in the living room somewhere...)" or "<p:player><f:confused>(Was there a lockbox around here somewhere?)" }) or
                            (accessor.event_home_bookshelf < 1 and ({
"<p:player><f:sigh>(... still haven't found the lockbox.)"
}) or (accessor.event_home_bookshelf < 2 and ({
"<p:player><f:sweat5>(... I've found the lockbox, but I can't reach it...)"
}) or ({
"<p:player><f:sodesuka>(... weird how a library card needed a locked box.)"
}))))
                    )
                    ____temp_3 = { __TS__SparseArraySpread(____array_2) }
                end
                return ____temp_3
            end
        },
        trivia_tooltip = {
            window = "Window",
            bed = "Bed",
            computer = "Computer",
            chair = "Chair",
            dresser1 = "Dresser Drawer",
            dresser2 = "Dresser Drawer",
            book = "Book",
            cutetunnel = "Painting",
            toy = "Toy",
            plant = "Plant",
            shovel = "Shovel",
            broombox = "Dusty Box",
            dresserdrawer1 = "Dresser Drawer",
            dresserdrawer2 = "Dresser Drawer",
            dresserpaper = "Envelope",
            mattress = "Mattress",
            bin = "Bin",
            bedframe = "Bed Frame",
            fusebox = "Junction Box",
            lightswitch = "Light Switch",
            lamp = "Lamp",
            telescope = "Telescope Bag",
            bookshelf = "Bookshelf",
            couch = "Couch",
            entertainment = "Entertainment Center",
            SIPPY = "Cups",
            basket = "Basket",
            flipbasket = "Flipped Basket",
            telecomm = "Comms",
            diningchair1 = "Dining Chair",
            diningchair2 = "Dining Chair",
            sink = "Sink",
            jars = "Jars",
            plate = "Plate",
            silverware = "Silverware",
            behindfridge = "Plates and Bowls",
            fridge = "Fridge",
            stove = "Stove",
            bowl_extra = "Bowl",
            rope = "Rope",
            scissors = "Scissors",
            pantry = "Pantry",
            board = "Leaflet",
            secret = "Tackboard"
        }
    }
end
function ____exports.default()
    local state
    local ____areaGen_result_4 = areaGen()
    local activators = ____areaGen_result_4.activators
    local hide = ____areaGen_result_4.hide
    local hintGen = ____areaGen_result_4.hintGen
    local map = ____areaGen_result_4.map
    local overworld = ____areaGen_result_4.overworld
    local resources = ____areaGen_result_4.resources
    local reveal = ____areaGen_result_4.reveal
    local pstop = ____areaGen_result_4.pstop
    local shaderSetup = ____areaGen_result_4.shaderSetup
    local stepSFX = ____areaGen_result_4.stepSFX
    local temp = ____areaGen_result_4.temp
    local tooltip = ____areaGen_result_4.tooltip
    local unfailer = ____areaGen_result_4.unfailer
    local ____overworld_5 = overworld
    local assets = ____overworld_5.assets
    local atlas = ____overworld_5.atlas.atlas
    local save = ____overworld_5.atlas.save
    local save_hooks = ____overworld_5.atlas.save_hooks
    local batch = ____overworld_5.batch
    local game = ____overworld_5.game
    local inputs = ____overworld_5.inputs
    local items = ____overworld_5.inventory.items
    local update = ____overworld_5.inventory.update
    local player = ____overworld_5.player.player
    local player_move = ____overworld_5.player.player_move
    local player_walk = ____overworld_5.player.player_walk
    local reader = ____overworld_5.reader.reader
    local object = ____overworld_5.screen.object
    local objects = ____overworld_5.screen.objects
    local screen = ____overworld_5.screen.screen
    local ____resources_6 = resources
    local daemons = ____resources_6.daemons
    local framess = ____resources_6.framess
    local images = ____resources_6.images
    local pager = __TS__New(
        STPager,
        random,
        ST:decode(accessor.pager_home)
    )
    local text = textGen(pager)
    local function hintDialogue()
        return __TS__New(
            __TS__Promise,
            function(____, resolve)
                ST:when(function()
                    if atlas.target == "reader" and reader.next_task ~= nil then
                        local hint2 = hintGen(text.overworld.tutorial3, 2, 60)
                        local ____self_7 = reader.next_task
                        ____self_7["then"](
                            ____self_7,
                            function()
                                hint2()
                                resolve(nil)
                            end
                        )
                        return true
                    end
                    return false
                end)
            end
        )
    end
    local function hintInter()
        return __TS__New(
            __TS__Promise,
            function(____, resolve)
                local hint1 = hintGen(text.overworld.tutorial2, 1, 360)
                ST:when(function()
                    if atlas.target == "reader" and not state.blocker then
                        hint1()
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
            for ____, inst in ipairs(assets["s$faucet"].instances) do
                state.faucet_time = inst.position.value
                local ____self_8 = inst.gain:automate(7, 0)
                ____self_8["then"](
                    ____self_8,
                    function()
                        inst:stop()
                    end
                )
            end
            for ____, inst in ipairs(assets["s$faucet_distant"].instances) do
                state.faucet_time = inst.position.value
                local ____self_9 = inst.gain:automate(7, 0)
                ____self_9["then"](
                    ____self_9,
                    function()
                        inst:stop()
                    end
                )
            end
            __TS__Await(fader.alpha:automate(7, 1))
            player.position.x = __TS__Number(x)
            player.position.y = __TS__Number(y)
            game.cutscene = game.cutscene - 1
            local ____opt_10 = map.task
            if ____opt_10 ~= nil then
                ____opt_10.complete(r)
            end
            local ____self_12 = fader.alpha:automate(7, 0)
            ____self_12["then"](
                ____self_12,
                function()
                    screen:detach(fader)
                end
            )
        end)
    end
    local function trans3(r, x, y, tag)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            pstop()
            local door = object(tag).self
            if door.frame == 0 then
                door.frame = 1
                assets["s$door_open"]:instance()
            end
            door.metadata.lock = true
            __TS__Await(trans2(r, x, y))
            __TS__Await(ST:pause(4))
            local meta = object("doorcontrol").self.metadata
            if meta.lock then
                return ____awaiter_resolve(nil)
            end
            meta.lock = true
            assets["s$door_close"]:instance()
        end)
    end
    local function trivia(key)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            local entry = text.trivia[key]
            __TS__Await(reader:text(type(entry) == "function" and entry() or entry))
        end)
    end
    state = { blocker = false, faucet_time = 0, mapcolor = { hue = 0, saturation = 1, value = 1 } }
    local scripts = {
        trans = function(test, args)
            local ____opt_13 = map.task
            if ____opt_13 ~= nil then
                ____opt_13.complete(__TS__Number(args[1]))
            end
        end,
        trans2 = function(test, args)
            trans2(
                __TS__Number(args[1]),
                __TS__Number(args[2]),
                __TS__Number(args[3])
            )
        end,
        trans3 = function(test, args)
            trans3(
                __TS__Number(args[1]),
                __TS__Number(args[2]),
                __TS__Number(args[3]),
                args[4]
            )
        end,
        trans4 = function(test, args)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                local meta = object("doorcontrol").self.metadata
                if meta.lock then
                    assets["s$door_open"]:instance()
                else
                    meta.lock = true
                end
                __TS__Await(trans2(
                    __TS__Number(args[1]),
                    __TS__Number(args[2]),
                    __TS__Number(args[3])
                ))
                local door = object(args[4]).self
                door.frame = 1
                local ____self_15 = ST:pause(4)
                __TS__Await(____self_15["then"](
                    ____self_15,
                    function()
                        if door.metadata.lock then
                            return
                        end
                        door.frame = 0
                        assets["s$door_close"]:instance()
                    end
                ))
            end)
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
        stairs = function(test, args)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if player.position.x < __TS__Number(args[1]) or player.position.x > __TS__Number(args[2]) then
                    return ____awaiter_resolve(nil)
                end
                if game.c_left or game.c_right then
                    if accessor.plot < 0.4 then
                        pstop()
                        state.blocker = true
                        __TS__Await(reader:text(text.overworld.blocker2))
                        state.blocker = false
                        return ____awaiter_resolve(nil)
                    elseif accessor.plot < 1 then
                        game.cutscene = game.cutscene + 1
                        pstop()
                        state.blocker = true
                        __TS__Await(reader:text(text.overworld.blocker3))
                        state.blocker = false
                        __TS__Await(reader:choice(text.overworld.blocker4))
                        if game.r_choice == 1 then
                            game.cutscene = game.cutscene - 1
                            return ____awaiter_resolve(nil)
                        end
                        accessor.plot = 1
                        local fd = __TS__New(STRectangle, {
                            alpha = 0,
                            priority = 1000,
                            color = 0,
                            size = { x = 240, y = 180 },
                            anchor = 0.5
                        })
                        screen:attach(fd)
                        local cinst = daemons.crickets.instances
                        local ____array_16 = __TS__SparseArrayNew(
                            fd.alpha:automate(90, 1),
                            unpack(__TS__ArrayMap(
                                cinst,
                                function(____, instance)
                                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                        __TS__Await(instance.gain:automate(90, 0))
                                    end)
                                end
                            ))
                        )
                        __TS__SparseArrayPush(
                            ____array_16,
                            unpack(__TS__ArrayMap(
                                assets["s$faucet_distant"].instances,
                                function(____, instance)
                                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                        __TS__Await(instance.gain:automate(90, 0))
                                        instance:stop()
                                    end)
                                end
                            ))
                        )
                        __TS__Await(__TS__PromiseAll({ __TS__SparseArraySpread(____array_16) }))
                        local up
                        up = function()
                            map:removeUpdater(up)
                            map.autoplay = false
                        end
                        map:addUpdater(up)
                        local ____opt_17 = map.task
                        if ____opt_17 ~= nil then
                            ____opt_17.complete(0)
                        end
                        player.alpha.value = 0
                        state.mapcolor.saturation = 1
                        state.mapcolor.value = 1
                        player.stance = "down"
                        update()
                        __TS__Await(ST:pause(30))
                        assets["s$awaken"]:instance()
                        local fd2 = __TS__New(STRectangle, {
                            alpha = 0,
                            color = 12500670,
                            priority = 1001,
                            size = { x = 240, y = 180 },
                            anchor = 0.5
                        })
                        screen:attach(fd2)
                        __TS__Await(fd2.alpha:automate(150, 1))
                        screen:detach(fd)
                        for ____, obj in __TS__Iterator(objects("night")) do
                            obj:destroy()
                        end
                        local spr = __TS__New(STAnimation, {
                            position = { x = 28, y = 109 },
                            anchor = { x = 0.5, y = 1 },
                            frames = assets["ic$player$sleep"],
                            priority = 103,
                            color = 10652124
                        })
                        map:attach(spr)
                        local cover = object("cover").self
                        cover.frame = 1
                        map:play(map.rooms[1].score)
                        map.music.gain.value = 0
                        map.music.gain:automate(7, 1)
                        __TS__Await(fd2.alpha:automate(150, 0))
                        screen:detach(fd2)
                        __TS__Await(ST:pause(60))
                        spr.frame = 1
                        __TS__Await(ST:pause(45))
                        __TS__Await(reader:text(text.overworld.hello1))
                        __TS__Await(ST:pause(30))
                        assets["s$blankets"]:instance()
                        __TS__Await(ST:pause(1))
                        map:detach(spr)
                        player.alpha.value = 1
                        player.position.x = 30
                        player.position.y = 130
                        cover.frame = 0
                        __TS__Await(player_walk(0.5, { y = 140 }))
                        __TS__Await(ST:pause(45))
                        __TS__Await(reader:text(text.overworld.hello2))
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    local lx = player.metadata.last_x
                    local ly = player.metadata.last_y
                    player_move(-lx, -ly)
                    local hitboxes = { __TS__Spread(screen:scan(function(container)
                        return __TS__InstanceOf(container,
                            STHitbox) and type(container.metadata) == "table" and container.metadata.scan == true
                    end)) }
                    player_move(
                        lx,
                        ly + lx,
                        false,
                        false,
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
                        )
                    )
                end
            end)
        end,
        drilltable = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if not accessor.item_drill then
                    if test then
                        tooltip(text.overworld.drill_tooltip)
                        return ____awaiter_resolve(nil)
                    end
                    accessor.item_drill = true
                    update()
                    local ____reader_headers_21 = reader.headers
                    ____reader_headers_21[#____reader_headers_21 + 1] = {
                        "a",
                        function()
                            assets["s$itemget"]:instance()
                            local ____opt_19 = object("driller")
                            if ____opt_19 ~= nil then
                                ____opt_19:destroy()
                            end
                        end
                    }
                    __TS__Await(reader:text(text.overworld.drill))
                end
            end)
        end,
        shovelpot = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if test then
                    tooltip(text.trivia_tooltip.shovel)
                    return ____awaiter_resolve(nil)
                end
                if accessor.event_home_outside and not accessor.item_bucket then
                    accessor.item_bucket = true
                    update()
                    game.cutscene = game.cutscene + 1
                    __TS__Await(reader:text(text.overworld.bucket1()))
                    __TS__Await(ST:pause(30))
                    __TS__Await(reader:text(text.overworld.bucket2()))
                    __TS__Await(ST:pause(20))
                    local anim = object("harry").self
                    anim.frame = 1
                    assets["s$shovelshing"]:instance()
                    __TS__Await(ST:pause(40))
                    anim.frame = 2
                    assets["s$shovelchnf"]:instance()
                    __TS__Await(ST:pause(60))
                    local ____reader_headers_24 = reader.headers
                    ____reader_headers_24[#____reader_headers_24 + 1] = {
                        "a",
                        function()
                            assets["s$itemget"]:instance()
                            anim.frame = 3
                            local ____opt_22 = object("bucketbox1")
                            if ____opt_22 ~= nil then
                                ____opt_22:destroy()
                            end
                            local bb2 = object("bucketbox2").self
                            bb2.position.y = bb2.metadata.y
                        end
                    }
                    __TS__Await(reader:text(text.overworld.bucket3()))
                    game.cutscene = game.cutscene - 1
                else
                    trivia("shovel")
                end
            end)
        end,
        broombox = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if test then
                    tooltip(text.trivia_tooltip.broombox)
                    return ____awaiter_resolve(nil)
                end
                if accessor.event_home_outside and not accessor.item_rock then
                    game.cutscene = game.cutscene + 1
                    accessor.item_rock = true
                    update()
                    local anim = object("SWEEPSWEEPSWEEP").self
                    local ____reader_headers_25 = reader.headers
                    ____reader_headers_25[#____reader_headers_25 + 1] = {
                        "a",
                        function()
                            assets["s$itemget"]:instance()
                            anim.frame = 1
                        end
                    }
                    local ____reader_headers_26 = reader.headers
                    ____reader_headers_26[#____reader_headers_26 + 1] = {
                        "b",
                        function()
                            assets["s$itemget"]:instance()
                            anim.frame = 2
                        end
                    }
                    local ____reader_headers_27 = reader.headers
                    ____reader_headers_27[#____reader_headers_27 + 1] = {
                        "c",
                        function()
                            assets["s$itemget"]:instance()
                            anim.frame = 3
                        end
                    }
                    __TS__Await(reader:text(text.overworld.broombox1))
                    __TS__Await(ST:pause(45))
                    __TS__Await(reader:text(text.overworld.broombox2))
                    game.cutscene = game.cutscene - 1
                else
                    trivia("broombox")
                end
            end)
        end,
        bedframe = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if test then
                    tooltip(text.trivia_tooltip.bedframe)
                    return ____awaiter_resolve(nil)
                end
                if 2 <= accessor.plot and not accessor.item_crowbar then
                    game.cutscene = game.cutscene + 1
                    local can = accessor.item_drill
                    if can then
                        accessor.item_crowbar = true
                        update()
                    end
                    __TS__Await(reader:text(text.overworld.framer1()))
                    if not can then
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    __TS__Await(ST:pause(25))
                    if player.position.x > 30 then
                        __TS__Await(player_walk(1.5, { x = 30 }))
                    end
                    if player.position.y < 95 then
                        __TS__Await(player_walk(1.5, { y = 80 }))
                    else
                        __TS__Await(player_walk(1.5, { y = 115 }))
                    end
                    if player.position.x < 30 then
                        __TS__Await(player_walk(1.5, { x = 30 }))
                    else
                        player.stance = "right"
                    end
                    __TS__Await(ST:pause(30))
                    bb_standard(player, assets["ie$surprise"])
                    assets["s$driller"]:instance()
                    __TS__Await(ST:pause(45))
                    if player.position.y < 95 then
                        __TS__Await(player_walk(1.5, { y = 115 }))
                    else
                        __TS__Await(player_walk(1.5, { y = 80 }))
                    end
                    player.stance = "right"
                    __TS__Await(ST:pause(20))
                    bb_standard(player, assets["ie$surprise"])
                    assets["s$driller"]:instance()
                    __TS__Await(ST:pause(35))
                    __TS__Await(player_walk(1.5, { y = 95 }))
                    player.stance = "right"
                    __TS__Await(ST:pause(25))
                    assets["s$itemget"]:instance()
                    local ____opt_28 = object("framebox")
                    if ____opt_28 ~= nil then
                        ____opt_28:destroy()
                    end
                    object("rogerrabbit").self.frame = 1
                    __TS__Await(reader:text(text.overworld.framer2()))
                    if accessor.item_cover and accessor.item_scissors then
                        __TS__Await(ST:pause(30))
                        __TS__Await(reader:text(text.overworld.framer3))
                        __TS__Await(ST:pause(15))
                        __TS__Await(bb_standard(player, assets["ie$note"]))
                        __TS__Await(ST:pause(15))
                        __TS__Await(reader:text(text.overworld.done2))
                        accessor.plot = 3
                    end
                    game.cutscene = game.cutscene - 1
                else
                    trivia("bedframe")
                end
            end)
        end,
        goatplush = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.item_goatplush then
                    return ____awaiter_resolve(nil)
                end
                if test then
                    tooltip(text.overworld.goatplush0)
                    return ____awaiter_resolve(nil)
                end
                __TS__Await(reader:text(text.overworld.goatplush1("overworld/goatplush1")))
                __TS__Await(reader:choice(text.overworld.goatplush2))
                if game.r_choice == 1 then
                    return ____awaiter_resolve(nil)
                end
                accessor.item_goatplush = true
                update()
                local ____reader_headers_34 = reader.headers
                ____reader_headers_34[#____reader_headers_34 + 1] = {
                    "a",
                    function()
                        assets["s$itemget"]:instance()
                        local ____opt_30 = object("goatplush")
                        if ____opt_30 ~= nil then
                            ____opt_30:destroy()
                        end
                        local ____opt_32 = object("goatplush")
                        if ____opt_32 ~= nil then
                            ____opt_32:destroy()
                        end
                    end
                }
                __TS__Await(reader:text(text.overworld.goatplush3))
            end)
        end,
        basket = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if test then
                    tooltip(text.trivia_tooltip.basket)
                    return ____awaiter_resolve(nil)
                end
                if not accessor.event_home_secret then
                    trivia("basket")
                else
                    game.cutscene = game.cutscene + 1
                    local early = accessor.event_home_bookshelf < 1
                    accessor.event_home_bookshelf = 2
                    update()
                    if early then
                        local ____reader_headers_35 = reader.headers
                        ____reader_headers_35[#____reader_headers_35 + 1] = {
                            "a",
                            function()
                                player.stance = "left"
                            end
                        }
                    end
                    __TS__Await(reader:text(early and text.overworld.basket1a or text.overworld.basket1b))
                    __TS__Await(ST:pause(45))
                    if player.position.x < 125 then
                        player.stance = "right"
                    else
                        player.stance = "up"
                    end
                    __TS__Await(ST:pause(25))
                    local ____opt_36 = object("basket")
                    if ____opt_36 ~= nil then
                        ____opt_36:destroy()
                    end
                    local ____opt_38 = object("basket")
                    if ____opt_38 ~= nil then
                        ____opt_38:destroy()
                    end
                    assets["s$basketpickup"]:instance()
                    __TS__Await(ST:pause(30))
                    if math.abs(player.position.y - 85) > 6 then
                        __TS__Await(player_walk(1.5, { y = 85 }))
                    end
                    __TS__Await(player_walk(1.5, { x = 105 }))
                    __TS__Await(ST:pause(15))
                    reveal("flipbasket")
                    assets["s$basketputdown"]:instance()
                    __TS__Await(ST:pause(45))
                    local y = player.position.y
                    __TS__Await(player.position:step(1, { x = 88, y = 72 }))
                    __TS__Await(ST:pause(10))
                    player.stance = "up"
                    __TS__Await(ST:pause(20))
                    object("screwbox").self.frame = 1
                    assets["s$itemget"]:instance()
                    __TS__Await(reader:text(text.overworld.basket2))
                    __TS__Await(ST:pause(20))
                    player.stance = "right"
                    __TS__Await(ST:pause(30))
                    __TS__Await(player.position:step(1, { x = 105, y = y }))
                    __TS__Await(ST:pause(45))
                    player.stance = "down"
                    __TS__Await(reader:text(text.overworld.basket3))
                    game.cutscene = game.cutscene - 1
                end
            end)
        end,
        fridge = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if player.stance ~= "left" then
                    return ____awaiter_resolve(nil)
                end
                if test then
                    tooltip(text.trivia_tooltip.fridge)
                    return ____awaiter_resolve(nil)
                end
                if not accessor.event_home_food and 1 <= accessor.plot then
                    game.cutscene = game.cutscene + 1
                    __TS__Await(reader:text(text.overworld.fridge1("overworld/fridge1")))
                    __TS__Await(reader:choice(text.overworld.fridge2))
                    if game.r_choice ~= 3 then
                        accessor.event_home_food = true
                        accessor.choice_home_food = game.r_choice
                    end
                    __TS__Await(reader:text(text.overworld.fridge3[game.r_choice + 1]))
                    if game.r_choice == 3 then
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    __TS__Await(player_walk(1.5, { y = 125 }, { x = 45 }))
                    player.stance = "left"
                    local dory = object("cold").self
                    assets["s$fridge_open"]:instance()
                    local ____self_40 = ST:pause(2)
                    ____self_40["then"](
                        ____self_40,
                        function()
                            dory.frame = 1
                        end
                    )
                    __TS__Await(ST:pause(45))
                    __TS__Await(player_walk(1.5, { y = 77 }, { x = 39 }))
                    __TS__Await(ST:pause(15))
                    local counter = object("counter")
                    counter.self.frame = 1
                    assets["s$bowlgrab"]:instance()
                    __TS__Await(ST:pause(15))
                    __TS__Await(player_walk(1.5, { y = 91 }, { x = 36 }))
                    __TS__Await(ST:pause(15))
                    assets["s$spoongrab"]:instance()
                    local ____self_41 = ST:pause(3)
                    ____self_41["then"](
                        ____self_41,
                        function()
                            counter:destroy()
                        end
                    )
                    __TS__Await(ST:pause(45))
                    __TS__Await(player_walk(1.5, { x = 45 }, { y = 125 }))
                    player.stance = "left"
                    __TS__Await(ST:pause(30))
                    assets["s$fridge_close"]:instance()
                    local ____self_42 = ST:pause(3)
                    ____self_42["then"](
                        ____self_42,
                        function()
                            dory.frame = 0
                        end
                    )
                    __TS__Await(ST:pause(30))
                    player_walk(1.5, { y = 175 }, { x = 114 })
                    __TS__Await(ST:pause(45))
                    local fd = __TS__New(STRectangle, {
                        alpha = 0,
                        color = 0,
                        size = { x = 240, y = 180 },
                        anchor = 0.5,
                        priority = 1000
                    })
                    screen:attach(fd)
                    __TS__Await(__TS__PromiseAll({
                        fd.alpha:automate(30, 1),
                        __TS__ArrayMap(
                            daemons.thunder.instances,
                            function(____, inst) return inst.gain:automate(30, 0) end
                        )
                    }))
                    player_walk()
                    __TS__Await(ST:pause(90))
                    player.alpha.value = 0
                    local spr = __TS__New(STSprite, {
                        position = { x = 115, y = 162 },
                        anchor = { x = 0.5, y = 1 },
                        image = accessor.floof and assets["ic$player$right_sit_plush"] or assets["ic$player$right_sit"],
                        priority = 180,
                        color = 10652124
                    })
                    map:attach(spr)
                    object("bowl").self.alpha.value = 1
                    __TS__Await(__TS__PromiseAll({
                        fd.alpha:automate(30, 0),
                        __TS__ArrayMap(
                            daemons.crickets.instances,
                            function(____, inst) return inst.gain:automate(30, 1) end
                        )
                    }))
                    screen:detach(fd)
                    __TS__Await(ST:pause(60))
                    __TS__Await(reader:text(text.overworld.fridge4[game.r_choice + 1]))
                    __TS__Await(ST:pause(15))
                    map:detach(spr)
                    player.alpha.value = 1
                    __TS__Await(player_walk(1.5, { y = 185 }, { x = 90 }))
                    __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                    __TS__Await(ST:pause(45))
                    __TS__Await(reader:text(text.overworld.fridge5()))
                    game.cutscene = game.cutscene - 1
                else
                    trivia("fridge")
                end
            end)
        end,
        bookshelf = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if player.stance ~= "up" then
                    return ____awaiter_resolve(nil)
                end
                if test then
                    tooltip(text.trivia_tooltip.bookshelf)
                    return ____awaiter_resolve(nil)
                end
                if accessor.plot < 0.4 then
                    game.cutscene = game.cutscene + 1
                    __TS__Await(reader:text(text.overworld.bookshelf1))
                    local ____accessor_tutorial_choice_43
                    if accessor.tutorial_choice then
                        ____accessor_tutorial_choice_43 = nil
                    else
                        ____accessor_tutorial_choice_43 = hintGen(text.overworld.tutorial4, 3, 240, 0)
                    end
                    local hint1 = ____accessor_tutorial_choice_43
                    __TS__Await(reader:choice(text.overworld.bookshelf2))
                    if hint1 ~= nil then
                        hint1()
                    end
                    if game.r_choice ~= 3 then
                        accessor.plot = 0.4
                        accessor.choice_home_book = game.r_choice
                        update()
                        if math.abs(player.position.x - 113) > 6 then
                            __TS__Await(player_walk(1.5, { x = 113 }))
                            player.stance = "up"
                        end
                        local ____reader_headers_48 = reader.headers
                        ____reader_headers_48[#____reader_headers_48 + 1] = {
                            "a",
                            function()
                                assets["s$itemget"]:instance()
                                local ____opt_46 = object("extrabook")
                                if ____opt_46 ~= nil then
                                    ____opt_46:destroy()
                                end
                            end
                        }
                    end
                    if game.r_choice == 3 then
                        __TS__Await(reader:text(text.overworld.bookshelf4))
                        accessor.tutorial_choice = true
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    __TS__Await(reader:text(text.overworld.bookshelf3))
                    local hint2 = hintGen(text.overworld.tutorial5, 0, 15)
                    local downListener1
                    downListener1 = function()
                        return __TS__AsyncAwaiter(function(____awaiter_resolve)
                            inputs.tertiary:removeDown(downListener1)
                            hint2()
                            atlas:switch("menu")
                            game.cutscene = game.cutscene - 1
                        end)
                    end
                    inputs.tertiary:addDown(downListener1)
                else
                    trivia("bookshelf")
                    if not accessor.event_home_secret then
                        accessor.event_home_bookshelf = 0.1
                    elseif accessor.event_home_bookshelf < 1 then
                        accessor.event_home_bookshelf = 1
                    end
                end
            end)
        end,
        scissors = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.plot < 1 then
                    if test then
                        tooltip(text.trivia_tooltip.scissors)
                        return ____awaiter_resolve(nil)
                    end
                    trivia("scissors")
                elseif not accessor.item_scissors then
                    if test then
                        tooltip(text.trivia_tooltip.scissors)
                        return ____awaiter_resolve(nil)
                    end
                    game.cutscene = game.cutscene + 1
                    accessor.item_scissors = true
                    update()
                    local ____reader_headers_49 = reader.headers
                    ____reader_headers_49[#____reader_headers_49 + 1] = {
                        "a",
                        function()
                            assets["s$itemget"]:instance()
                            object("hot").self.frame = accessor.item_rope and 3 or 1
                        end
                    }
                    __TS__Await(reader:text(text.overworld.scissors1()))
                    if accessor.item_cover then
                        player.stance = "up"
                        bb_standard(player, assets["ie$ellipsis"])
                        assets["s$scissors"]:instance()
                        __TS__Await(ST:pause(75))
                        local ____reader_51 = reader
                        local ____reader_text_52 = reader.text
                        local ____array_50 = __TS__SparseArrayNew(unpack(text.overworld.scissors2()))
                        __TS__SparseArrayPush(
                            ____array_50,
                            unpack(accessor.item_crowbar and text.overworld.done1 or ({}))
                        )
                        __TS__Await(____reader_text_52(
                            ____reader_51,
                            { __TS__SparseArraySpread(____array_50) }
                        ))
                        if accessor.item_crowbar then
                            __TS__Await(ST:pause(15))
                            __TS__Await(bb_standard(player, assets["ie$note"]))
                            __TS__Await(ST:pause(15))
                            __TS__Await(reader:text(text.overworld.done2))
                            accessor.plot = 3
                        end
                    end
                    game.cutscene = game.cutscene - 1
                end
            end)
        end,
        behindstove = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if test then
                    tooltip(text.trivia_tooltip.secret)
                    return ____awaiter_resolve(nil)
                end
                __TS__Await(trivia("secret"))
                if 1 <= accessor.plot and not accessor.event_home_secret then
                    accessor.event_home_secret = true
                end
            end)
        end,
        outside = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.plot < 1 or accessor.plot == 3 then
                    pstop()
                    local door = object("door4").self
                    local ____door_metadata_53, ____inter_54 = door.metadata, "inter"
                    if ____door_metadata_53[____inter_54] == nil then
                        ____door_metadata_53[____inter_54] = 0
                    end
                    local ____door_metadata_55, ____inter_56 = door.metadata, "inter"
                    local ____door_metadata_inter_57 = ____door_metadata_55[____inter_56] + 1
                    ____door_metadata_55[____inter_56] = ____door_metadata_inter_57
                    local inter = ____door_metadata_inter_57
                    if door.frame == 0 then
                        door.frame = 1
                        assets["s$door_open"]:instance()
                    end
                    state.blocker = true
                    if accessor.plot < 1 then
                        __TS__Await(reader:text(text.overworld.blocker1))
                    else
                        __TS__Await(reader:text(text.overworld.blocker5))
                        __TS__Await(reader:choice(text.overworld.blocker6))
                        if game.r_choice == 0 then
                            state.blocker = false
                            game.cutscene = game.cutscene + 1
                            accessor.plot = 3.1
                            local fd = __TS__New(STRectangle, {
                                alpha = 0,
                                size = { x = 240, y = 180 },
                                anchor = 0.5,
                                color = 0,
                                priority = 1000
                            })
                            screen:attach(fd)
                            __TS__Await(fd.alpha:automate(15, 1))
                            __TS__Await(ST:pause(75))
                            player.position.x = 45
                            player.position.y = 110
                            player.stance = "down"
                            local ____opt_58 = map.task
                            if ____opt_58 ~= nil then
                                ____opt_58.complete(7)
                            end
                            local roper = __TS__New(STSprite,
                                { image = images.rope, position = { y = 103 }, priority = 125 })
                            map:attach(roper)
                            __TS__Await(fd.alpha:automate(15, 0))
                            screen:detach(fd)
                            __TS__Await(ST:pause(60))
                            local ____reader_headers_60 = reader.headers
                            ____reader_headers_60[#____reader_headers_60 + 1] = {
                                "a",
                                function()
                                    player.stance = "left"
                                    return "left"
                                end
                            }
                            __TS__Await(reader:text(text.overworld.exit1))
                            __TS__Await(ST:pause(45))
                            __TS__Await(player_walk(1, { y = 135 }, { x = 51 }))
                            __TS__Await(ST:pause(30))
                            __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                            __TS__Await(ST:pause(15))
                            __TS__Await(reader:text(text.overworld.exit2))
                            __TS__Await(ST:pause(45))
                            __TS__Await(player_walk(0.5, { y = 145 }))
                            player.alpha.value = 0
                            local diff = player.position.y - 150
                            local climber = __TS__New(STAnimation, {
                                anchor = { x = 0.5, y = 1 },
                                priority = 500,
                                color = 10652124,
                                frames = accessor.floof and assets["ic$player$slippinjimmy_plush"] or
                                    assets["ic$player$slippinjimmy"],
                                position = { x = 50.5, y = 150 }
                            }):addTicker(function(self)
                                player.position.y = self.position.y + diff
                            end)
                            map:attach(climber)
                            assets["s$step_carpet"]:instance({ rate = 1.5 })
                            local htext = __TS__New(STText,
                                {
                                    anchor = 0.5,
                                    font = assets["f$helloplayer"],
                                    color = 8355711,
                                    content = text
                                        .overworld.tutorial8
                                })
                            local circler = __TS__New(STSprite,
                                { alpha = 0, image = images.jusant_circle, anchor = 0.5, metadata = 0 }):addTicker(function(
                                self)
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
                                            local ____self_61 = htext.alpha:automate(7, 0)
                                            ____self_61["then"](
                                                ____self_61,
                                                function()
                                                    jusant:detach(htext)
                                                end
                                            )
                                        end
                                        repeat
                                            local ____switch210 = grabbing
                                            local ____cond210 = ____switch210 == 0
                                            if ____cond210 then
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
                                            ____cond210 = ____cond210 or ____switch210 == 1
                                            if ____cond210 then
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
                                            ____cond210 = ____cond210 or ____switch210 == 2
                                            if ____cond210 then
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
                                            local ____switch232 = grabbing
                                            local ____cond232 = ____switch232 == 0
                                            if ____cond232 then
                                                circler.metadata = side == 0 and 80 or -80
                                                circler.scale.x = side == 0 and -1 or 1
                                                circler.color.red = 255
                                                circler.color.green = 255
                                                circler.color.blue = 255
                                                break
                                            end
                                            ____cond232 = ____cond232 or ____switch232 == 1
                                            if ____cond232 then
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
                                            ____cond232 = ____cond232 or ____switch232 == 2
                                            if ____cond232 then
                                                circler.metadata = side == 0 and -80 or 80
                                                circler.scale.x = side == 0 and -1 or 1
                                                circler.color.red = 127
                                                circler.color.green = 127
                                                circler.color.blue = 127
                                                break
                                            end
                                        until true
                                        if step ~= 0 then
                                            local ____climber_position_62, ____y_63 = climber.position, "y"
                                            ____climber_position_62[____y_63] = ____climber_position_62[____y_63] +
                                                step * 2
                                            if grabbing ~= 2 then
                                                climber.frame = 1 - climber.frame
                                            end
                                            assets["s$step_carpet"]:instance({ rate = 1.5 })
                                            if 330 <= climber.position.y then
                                                side = 2
                                                resolve(nil)
                                            end
                                        end
                                    end)
                                end
                            ))
                            local ____self_64 = jusant.alpha:automate(15, 0)
                            ____self_64["then"](
                                ____self_64,
                                function()
                                    screen:detach(jusant)
                                end
                            )
                            climber.gravity.y = 0.25
                            __TS__Await(ST:when(function() return 348 <= climber.position.y end))
                            map:detach(climber)
                            player.position.x = 51
                            player.position.y = 350
                            player.stance = "up"
                            player.alpha.value = 1
                            assets["s$step_glass"]:instance()
                            __TS__Await(ST:pause(45))
                            local ____reader_headers_65 = reader.headers
                            ____reader_headers_65[#____reader_headers_65 + 1] = {
                                "a",
                                function()
                                    player.stance = "down"
                                    return "down"
                                end
                            }
                            __TS__Await(reader:text(text.overworld.exit3))
                            local golden = object("golden").self
                            golden.direction = 1
                            golden:addTicker(function(self)
                                return function()
                                    if self.frame == 23 then
                                        self.frame = 14
                                    end
                                end
                            end)
                            __TS__Await(ST:pause(30))
                            assets["s$platformwarble"]:instance()
                            __TS__Await(bb_standard(player, assets["ie$confused"]))
                            __TS__Await(ST:pause(13))
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
                            map:cam_free()
                            local camY = cam.y
                            local myY = camY
                            local intensity = __TS__New(STValue)
                            local function screenTicker()
                                opt.intensity = intensity.value * 3
                                opt.ysamples = 1 + math.floor(intensity.value * 7 + 0.5) * 2
                                local cyc = ST:bezier(intensity.value, 5, 1, 1)
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
                            fd.color.red = 190
                            fd.color.green = 190
                            fd.color.blue = 190
                            screen:attach(fd)
                            local ____self_66 = ST:pause(2)
                            local ____self_66_then_result_68 = ____self_66["then"](
                                ____self_66,
                                function()
                                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                        player.stance = "left"
                                        __TS__Await(ST:pause(30))
                                        player.stance = "right"
                                        __TS__Await(ST:pause(45))
                                        player.stance = "down"
                                        __TS__Await(ST:pause(60))
                                        reader:text(text.overworld.exit4)
                                    end)
                                end
                            )
                            local ____self_67 = ST:pause(110)
                            __TS__Await(__TS__PromiseAll({
                                ____self_66_then_result_68,
                                ____self_67["then"](
                                    ____self_67,
                                    function()
                                        assets["s$warp_in"]:instance_forced()
                                    end
                                ),
                                fd.alpha:automate(200, 0, 1),
                                intensity:automate(200, 1),
                                unpack(__TS__ArrayMap(
                                    assets["m$home_full"].instances,
                                    function(____, inst)
                                        return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                            __TS__Await(inst.gain:automate(150, 0))
                                            inst:stop()
                                        end)
                                    end
                                ))
                            }))
                            bloom:release()
                            accessor.location_map = "redleaf"
                            accessor.location_idx = 0
                            accessor.location_pos_x = 60
                            accessor.location_pos_y = 130
                            accessor.location_stance = "right"
                            local ____opt_69 = map.task
                            if ____opt_69 ~= nil then
                                ____opt_69.complete(nil)
                            end
                            return ____awaiter_resolve(nil)
                        end
                    end
                    state.blocker = false
                    __TS__Await(ST:pause(4))
                    if door.frame == 1 and door.metadata.inter == inter then
                        door.frame = 0
                        assets["s$door_close"]:instance()
                    end
                else
                    trans3(7, 10, 100, "door4")
                end
            end)
        end,
        telecomm = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if test then
                    tooltip(text.trivia_tooltip.telecomm)
                    return ____awaiter_resolve(nil)
                end
                if 1 <= accessor.plot then
                    game.cutscene = game.cutscene + 1
                    if not accessor.event_home_telecomm then
                        accessor.event_home_telecomm = true
                        __TS__Await(reader:text(text.overworld.telecomm1()))
                        __TS__Await(ST:pause(15))
                    end
                    local anim = object("telecomm").self
                    anim.direction = 0
                    anim.frame = 1
                    assets["s$beep_power"]:instance()
                    __TS__Await(reader:text(text.overworld.telecomm2))
                    local deleted = accessor.state_home_telecomm_message == 2
                    __TS__Await(reader:choice(deleted and text.overworld.telecomm3b or text.overworld.telecomm3a))
                    if game.r_choice == (deleted and 2 or 3) then
                        if accessor.state_home_telecomm_message ~= 2 then
                            anim.direction = 1
                            anim.frame = 0
                        else
                            anim.direction = 0
                            anim.duration = 0
                            anim.frame = 0
                            anim.step = 0
                        end
                        game.cutscene = game.cutscene - 1
                        return ____awaiter_resolve(nil)
                    end
                    if game.r_choice ~= 2 then
                        anim.direction = 1
                        anim.duration = 2
                        anim.frame = 0
                        anim.step = 0
                        local c = assets["s$archangel"]:instance_forced()
                        __TS__Await(reader:text(text.overworld.telecomm4[game.r_choice + 1]))
                        __TS__Await(ST:pause(90))
                        anim.direction = 0
                        anim.duration = 0
                        anim.frame = 0
                        anim.step = 0
                        c:stop()
                        assets["s$noise"]:instance()
                        __TS__Await(reader:text(text.overworld.telecomm5))
                    else
                        anim.direction = 1
                        anim.duration = 4
                        anim.frame = 0
                        anim.step = 0
                        local ____reader_headers_71 = reader.headers
                        ____reader_headers_71[#____reader_headers_71 + 1] = {
                            "a",
                            function()
                                anim.direction = 0
                                anim.duration = 0
                                anim.frame = 0
                                anim.step = 0
                            end
                        }
                        if accessor.state_home_telecomm_message == 0 and not accessor.event_home_outside then
                            local ____reader_headers_72 = reader.headers
                            ____reader_headers_72[#____reader_headers_72 + 1] = {
                                "b",
                                function()
                                    assets["s$beep_error"]:instance()
                                end
                            }
                        end
                        __TS__Await(reader:text(text.overworld.telecomm6()))
                        if accessor.state_home_telecomm_message == 0 then
                            accessor.state_home_telecomm_message = accessor.event_home_outside and 1 or 2
                        end
                    end
                    if accessor.state_home_telecomm_message ~= 2 then
                        anim.direction = 1
                        anim.frame = 0
                    end
                    game.cutscene = game.cutscene - 1
                else
                    trivia("telecomm")
                end
            end)
        end,
        lightswitch = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if test then
                    tooltip(text.trivia_tooltip.lightswitch)
                    return ____awaiter_resolve(nil)
                end
                if 1 <= accessor.plot then
                    game.cutscene = game.cutscene + 1
                    assets["s$clicky"]:instance()
                    __TS__Await(ST:pause(30))
                    __TS__Await(reader:text(text.overworld.lightswitch))
                    game.cutscene = game.cutscene - 1
                else
                    trivia("lightswitch")
                end
            end)
        end,
        telescope = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.event_home_telescope and player.stance ~= "up" then
                    return ____awaiter_resolve(nil)
                end
                if test then
                    tooltip(text.trivia_tooltip.telescope)
                    return ____awaiter_resolve(nil)
                end
                if accessor.event_home_outside then
                    game.cutscene = game.cutscene + 1
                    if not accessor.event_home_telescope then
                        accessor.event_home_telescope = true
                        __TS__Await(reader:text(text.overworld.telescope1))
                        __TS__Await(ST:pause(15))
                        local ____opt_73 = object("telescope")
                        if ____opt_73 ~= nil then
                            ____opt_73:destroy()
                        end
                        local ____opt_75 = object("telescope")
                        if ____opt_75 ~= nil then
                            ____opt_75:destroy()
                        end
                        assets["s$duffellift"]:instance()
                        __TS__Await(ST:pause(30))
                        __TS__Await(player_walk(1.5, { y = 80 }, { x = 50 }))
                        __TS__Await(ST:pause(15))
                        player.stance = "up"
                        __TS__Await(ST:pause(15))
                        reveal("tscope2")
                        assets["s$tripod"]:instance()
                        __TS__Await(ST:pause(30))
                        __TS__Await(reader:text(text.overworld.telescope2))
                    end
                    local done = false
                    local fd = __TS__New(STRectangle, {
                        alpha = 0,
                        size = { x = 240, y = 180 },
                        anchor = 0.5,
                        color = 0,
                        priority = 1001
                    })
                    screen:attach(fd)
                    __TS__Await(fd.alpha:automate(7, 1))
                    local overlay = __TS__New(STSprite, {
                        image = images.telescope_overlay,
                        anchor = 0.5,
                        position = { x = accessor.state_home_telescope_x, y = accessor.state_home_telescope_y },
                        metadata = nil,
                        priority = 1
                    }):addTicker(function(self)
                        if done then
                            return
                        end
                        local x = self.position.x
                        local y = self.position.y
                        if inputs.up.held then
                            self.position.y = math.max(self.position.y - 2, -75)
                        elseif inputs.down.held then
                            self.position.y = math.min(self.position.y + 2, 75)
                        end
                        if inputs.left.held then
                            self.position.x = math.max(self.position.x - 2, -105)
                        elseif inputs.right.held then
                            self.position.x = math.min(self.position.x + 2, 105)
                        end
                        local m = x ~= self.position.x or y ~= self.position.y
                        if self.metadata == nil then
                            if m then
                                self.metadata = assets["s$ratchetloop"]:instance_forced({ gain = 0.5, rate = 0.8 })
                            end
                        elseif not m then
                            self.metadata:stop()
                            self.metadata = nil
                        end
                    end)
                    local out = outlineShader({ color = { red = 0, green = 0, blue = 0 }, alpha = 0.75, thickness = 1 })
                    local voidpsr = __TS__New(
                        STSprite,
                        {
                            image = images.void,
                            anchor = 0.5,
                            children = {
                                rainGen(),
                                overlay,
                                __TS__New(STText, {
                                    priority = 2,
                                    anchor = 0.5,
                                    position = { y = 80 },
                                    font = assets["f$helloplayer"],
                                    alpha = 0.75,
                                    content = text.overworld.tutorial6
                                }):addDrawer(out.drawer)
                            },
                            priority = 1000
                        }
                    )
                    screen:attach(voidpsr)
                    __TS__Await(fd.alpha:automate(7, 0))
                    screen:detach(fd)
                    __TS__Await(__TS__New(
                        __TS__Promise,
                        function(____, resolve)
                            local downer
                            downer = function()
                                inputs.secondary:removeDown(downer)
                                resolve(nil)
                            end
                            inputs.secondary:addDown(downer)
                        end
                    ))
                    done = true
                    screen:attach(fd)
                    local ____opt_77 = overlay.metadata
                    if ____opt_77 ~= nil then
                        ____opt_77:stop()
                    end
                    __TS__Await(fd.alpha:automate(7, 1))
                    screen:detach(voidpsr)
                    out:release()
                    accessor.state_home_telescope_x = overlay.position.x
                    accessor.state_home_telescope_y = overlay.position.y
                    game.cutscene = game.cutscene - 1
                    __TS__Await(fd.alpha:automate(7, 0))
                    screen:detach(fd)
                else
                    trivia("telescope")
                end
            end)
        end,
        fusebox = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if player.stance ~= "up" then
                    return ____awaiter_resolve(nil)
                end
                if test then
                    tooltip(text.trivia_tooltip.fusebox)
                    return ____awaiter_resolve(nil)
                end
                if 1 <= accessor.plot then
                    game.cutscene = game.cutscene + 1
                    local first = not accessor.event_home_fusebox
                    if first then
                        accessor.event_home_fusebox = true
                        __TS__Await(reader:text(text.overworld.fusebox1()))
                    end
                    if math.abs(player.position.x - 176) > 6 then
                        __TS__Await(player_walk(1.5, { x = 176 }))
                        player.stance = "up"
                    end
                    if first then
                        __TS__Await(ST:pause(15))
                    end
                    assets["s$breaker_open"]:instance()
                    local anim = object("thevibe").self
                    anim.frame = 1
                    local states = ST:populate(
                        6,
                        function(i) return ST:unstack(2, accessor.state_home_fusebox, 5 - i) end
                    )
                    local knobs = ST:populate(
                        6,
                        function(i)
                            return __TS__New(
                                STSprite,
                                {
                                    image = images.fuseknob,
                                    position = { y = 7 + math.floor(i / 2) * 5 }
                                }
                            ):addTicker(function(self)
                                self.position.x = 14 + i % 2 * 8 + states[i + 1] * 4
                            end)
                        end
                    )
                    local knobSystem = __TS__New(
                        STAtlas,
                        {
                            main = {
                                grid = function() return { { 0, 1 }, { 2, 3 }, { 4, 5 } } end,
                                position = { x = 0, y = 0 }
                            }
                        }
                    )
                    local function keyListener(self)
                        repeat
                            local ____switch302 = self
                            local ____cond302 = ____switch302 == inputs.down
                            if ____cond302 then
                                knobSystem:seek(STFacing.DOWN)
                                assets["s$breaker_navigate"]:instance()
                                break
                            end
                            ____cond302 = ____cond302 or ____switch302 == inputs.up
                            if ____cond302 then
                                knobSystem:seek(STFacing.UP)
                                assets["s$breaker_navigate"]:instance()
                                break
                            end
                            ____cond302 = ____cond302 or ____switch302 == inputs.left
                            if ____cond302 then
                                knobSystem:seek(STFacing.LEFT)
                                assets["s$breaker_navigate"]:instance()
                                break
                            end
                            ____cond302 = ____cond302 or ____switch302 == inputs.right
                            if ____cond302 then
                                knobSystem:seek(STFacing.RIGHT)
                                assets["s$breaker_navigate"]:instance()
                                break
                            end
                            ____cond302 = ____cond302 or ____switch302 == inputs.primary
                            if ____cond302 then
                                do
                                    local i = knobSystem:selection()
                                    states[i + 1] = 1 - states[i + 1]
                                    assets["s$breaker_switch"]:instance()
                                    break
                                end
                            end
                        until true
                    end
                    local keys = {
                        inputs.down,
                        inputs.up,
                        inputs.left,
                        inputs.right,
                        inputs.primary
                    }
                    for ____, key in ipairs(keys) do
                        key:addDown(keyListener)
                    end
                    anim:attach(unpack(knobs))
                    knobSystem:switch("main")
                    local out = outlineShader({ color = { red = 0, green = 0, blue = 0 }, alpha = 0.75, thickness = 1 })
                    local overlay = __TS__New(
                        STContainer,
                        {
                            alpha = 0,
                            children = {
                                __TS__New(STRectangle, {
                                    alpha = 0.25,
                                    anchor = 0.5,
                                    size = { x = 240, y = 180 },
                                    color = 0,
                                    priority = -1
                                }),
                                __TS__New(
                                    STSprite,
                                    {
                                        anchor = 0.5,
                                        alpha = 0.75,
                                        position = { y = -35 },
                                        image = images.fusebox_overlay,
                                        children = { unpack(ST:populate(
                                            6,
                                            function(i)
                                                return __TS__New(
                                                    STContainer,
                                                    {
                                                        priority = 1,
                                                        position = {
                                                            x = 23 * (-1 + i % 2 * 2),
                                                            y = -23 + math.floor(i / 2) * 23
                                                        },
                                                        children = {
                                                            __TS__New(STText,
                                                                {
                                                                    anchor = { x = 1 - i % 2, y = 0.5 },
                                                                    font = assets["f$fives"],
                                                                    position = { x = 32 * (-1 + i % 2 * 2) },
                                                                    content = ({
                                                                        text.overworld.fusebox2,
                                                                        text.overworld.fusebox3,
                                                                        text.overworld.fusebox4,
                                                                        text.overworld.fusebox5,
                                                                        text.overworld.fusebox6,
                                                                        text.overworld.fusebox7
                                                                    })[i + 1]
                                                                }),
                                                            __TS__New(STSprite,
                                                                { anchor = 0.5, image = images.fusebox_overlay_switch })
                                                                :addTicker(function(self)
                                                                    self.scale.x = 1 - states[i + 1] * 2
                                                                end),
                                                            __TS__New(STText,
                                                                { anchor = 0.5, font = assets["f$fives"], priority = 1 })
                                                                :addTicker(function(self)
                                                                    self.content = states[i + 1] == i % 2 and
                                                                        text.overworld.fusebox8 or
                                                                        text.overworld.fusebox9
                                                                    self.position.x = 4 - states[i + 1] * 8
                                                                end)
                                                        }
                                                    }
                                                ):addTicker(function(self)
                                                    if knobSystem:selection() == i then
                                                        self.color.red = 255
                                                        self.color.green = 255
                                                        self.color.blue = 255
                                                    else
                                                        self.color.red = 127
                                                        self.color.green = 127
                                                        self.color.blue = 127
                                                    end
                                                end)
                                            end
                                        )) }
                                    }
                                ),
                                __TS__New(STText, {
                                    priority = 1,
                                    anchor = 0.5,
                                    position = { y = 80 },
                                    font = assets["f$helloplayer"],
                                    alpha = 0.75,
                                    content = text.overworld.tutorial6
                                }):addDrawer(out.drawer)
                            },
                            priority = 1000,
                            metadata = true
                        }
                    ):addTicker(function(self)
                        if self.metadata then
                            local ____temp_82 = self.alpha.value < 1
                            if ____temp_82 then
                                local ____self_alpha_79, ____value_80 = self.alpha, "value"
                                local ____self_alpha_value_81 = ____self_alpha_79[____value_80] + 1 / 7
                                ____self_alpha_79[____value_80] = ____self_alpha_value_81
                                ____temp_82 = ____self_alpha_value_81 > 1
                            end
                            if ____temp_82 then
                                self.alpha.value = 1
                            end
                        else
                            local ____temp_86 = self.alpha.value > 0
                            if ____temp_86 then
                                local ____self_alpha_83, ____value_84 = self.alpha, "value"
                                local ____self_alpha_value_85 = ____self_alpha_83[____value_84] - 1 / 7
                                ____self_alpha_83[____value_84] = ____self_alpha_value_85
                                ____temp_86 = ____self_alpha_value_85 <= 0
                            end
                            if ____temp_86 then
                                screen:detach(self)
                                out:release()
                            end
                        end
                    end):addDrawer(batch.drawer)
                    screen:attach(overlay)
                    __TS__Await(__TS__New(
                        __TS__Promise,
                        function(____, resolve)
                            local downer
                            downer = function()
                                inputs.secondary:removeDown(downer)
                                resolve(nil)
                            end
                            inputs.secondary:addDown(downer)
                        end
                    ))
                    knobSystem:switch(nil)
                    for ____, direcKey in ipairs(keys) do
                        direcKey:removeDown(keyListener)
                    end
                    anim:detach(unpack(knobs))
                    anim.frame = 0
                    assets["s$breaker_close"]:instance()
                    accessor.state_home_fusebox = ST:stack(2, states)
                    game.cutscene = game.cutscene - 1
                    overlay.metadata = false
                else
                    trivia("fusebox")
                end
            end)
        end,
        bed = function(test)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if test then
                    tooltip(text.trivia_tooltip.bed)
                    return ____awaiter_resolve(nil)
                end
                if accessor.plot < 2 or accessor.item_cover then
                    trivia("bed")
                else
                    game.cutscene = game.cutscene + 1
                    accessor.item_cover = true
                    update()
                    __TS__Await(reader:text(text.overworld.bed1))
                    __TS__Await(ST:pause(15))
                    __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                    __TS__Await(ST:pause(15))
                    local ____reader_headers_89 = reader.headers
                    ____reader_headers_89[#____reader_headers_89 + 1] = {
                        "a",
                        function()
                            assets["s$itemget"]:instance()
                            local ____opt_87 = object("cover")
                            if ____opt_87 ~= nil then
                                ____opt_87:destroy()
                            end
                        end
                    }
                    __TS__Await(reader:text(text.overworld.bed2()))
                    if accessor.item_scissors then
                        player.stance = "up"
                        bb_standard(player, assets["ie$ellipsis"])
                        assets["s$scissors"]:instance()
                        __TS__Await(ST:pause(75))
                    else
                        __TS__Await(ST:pause(45))
                    end
                    local ____reader_91 = reader
                    local ____reader_text_92 = reader.text
                    local ____array_90 = __TS__SparseArrayNew(unpack(text.overworld.bed3()))
                    __TS__SparseArrayPush(
                        ____array_90,
                        unpack(accessor.item_scissors and accessor.item_crowbar and text.overworld.done1 or ({}))
                    )
                    __TS__Await(____reader_text_92(
                        ____reader_91,
                        { __TS__SparseArraySpread(____array_90) }
                    ))
                    if accessor.item_scissors and accessor.item_crowbar then
                        __TS__Await(ST:pause(15))
                        __TS__Await(bb_standard(player, assets["ie$note"]))
                        __TS__Await(ST:pause(15))
                        __TS__Await(reader:text(text.overworld.done2))
                        accessor.plot = 3
                    end
                    game.cutscene = game.cutscene - 1
                end
            end)
        end,
        book = function(test)
            if player.stance == "left" then
                if test then
                    tooltip(text.trivia_tooltip.book)
                    return
                end
                trivia("book")
            else
                if test then
                    tooltip(text.trivia_tooltip.lamp)
                    return
                end
                trivia("lamp")
            end
        end,
        rope = function(test)
            if accessor.plot < 1 then
                if test then
                    tooltip(text.trivia_tooltip.rope)
                    return
                end
                trivia("rope")
            elseif not accessor.item_rope then
                if test then
                    tooltip(text.trivia_tooltip.rope)
                    return
                end
                accessor.item_rope = true
                update()
                local ____reader_headers_93 = reader.headers
                ____reader_headers_93[#____reader_headers_93 + 1] = {
                    "a",
                    function()
                        assets["s$itemget"]:instance()
                        object("hot").self.frame = accessor.item_scissors and 3 or 2
                    end
                }
                reader:text(text.overworld.rope1())
            end
        end
    }
    local scripts_ex = {
        roper = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.plot < 2 or accessor.event_home_rope or 3 <= accessor.plot then
                    return ____awaiter_resolve(nil, false)
                end
                if map.room == 7 then
                    game.cutscene = game.cutscene + 1
                    accessor.event_home_rope = true
                    __TS__Await(reader:text(text.overworld.dangle1))
                    __TS__Await(ST:pause(15))
                    if player.position.x < 30 then
                        __TS__Await(player_walk(1.5, { x = 30, y = player.position.y + (30 - player.position.x) }))
                    end
                    __TS__Await(player_walk(1.5, { x = 35 }, { y = 135 }))
                    __TS__Await(ST:pause(10))
                    local cam = map:cam_clamped()
                    map.camera = cam
                    local rg = map:cam_free()
                    __TS__Await(cam:automate(90, { y = 300 }))
                    __TS__Await(ST:pause(60))
                    __TS__Await(reader:text(text.overworld.dangle2))
                    __TS__Await(ST:pause(45))
                    __TS__Await(cam:automate(90, { y = 135 }))
                    map:cam_restore(unpack(rg))
                    map.camera = player.position
                    __TS__Await(ST:pause(60))
                    __TS__Await(reader:text(text.overworld.dangle3()))
                    game.cutscene = game.cutscene - 1
                else
                    __TS__Await(reader:text(text.overworld.rope2))
                end
            end)
        end,
        buckey = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.event_home_bucket or 2 <= accessor.plot then
                    return ____awaiter_resolve(nil, false)
                end
                if map.room == 7 then
                    game.cutscene = game.cutscene + 1
                    accessor.event_home_bucket = true
                    __TS__Await(reader:text(text.overworld.rain1))
                    __TS__Await(ST:pause(15))
                    if player.position.x < 30 then
                        __TS__Await(player_walk(1.5, { x = 30, y = player.position.y + (30 - player.position.x) }))
                    end
                    __TS__Await(player_walk(1.5, { x = 35 }))
                    if math.abs(player.position.y - 110) > 6 then
                        __TS__Await(ST:pause(15))
                        __TS__Await(player_walk(1.5, { y = 110 }))
                    end
                    player.stance = "right"
                    __TS__Await(ST:pause(30))
                    local buckey = __TS__New(STAnimation, {
                        anchor = { x = 0.5, y = 1 },
                        position = { x = 50, y = 113 },
                        frames = framess.shovel_pot,
                        frame = 4,
                        priority = 113
                    })
                    map:attach(buckey)
                    assets["s$bucketputdown"]:instance()
                    __TS__Await(ST:pause(120))
                    __TS__Await(bb_standard(player, assets["ie$confused"]))
                    __TS__Await(ST:pause(30))
                    __TS__Await(reader:text(text.overworld.rain2))
                    __TS__Await(ST:pause(30))
                    __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                    __TS__Await(ST:pause(30))
                    __TS__Await(reader:text(text.overworld.rain3))
                    map:detach(buckey)
                    assets["s$bucketpickup"]:instance()
                    game.cutscene = game.cutscene - 1
                else
                    __TS__Await(reader:text(text.overworld.bucket4))
                end
            end)
        end,
        ponder = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                game.cutscene = game.cutscene + 1
                __TS__Await(ST:pause(10))
                __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                if accessor.plot < 0.4 then
                    __TS__Await(reader:text(text.ponder_book("ponder_book")))
                elseif accessor.plot < 1 then
                    __TS__Await(reader:text(text.ponder_sleep))
                elseif not accessor.event_home_outside then
                    __TS__Await(reader:text(text.ponder_hello))
                elseif accessor.plot < 2 then
                    __TS__Await(reader:text(text.ponder_outside("ponder_outside")))
                elseif accessor.plot < 3 then
                    __TS__Await(reader:text(text.ponder_platform()))
                else
                    __TS__Await(reader:text(text.ponder_exit("ponder_exit")))
                end
                game.cutscene = game.cutscene - 1
            end)
        end
    }
    local updaters = {
        [0] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.item_goatplush then
                    local ____opt_94 = object("goatplush")
                    if ____opt_94 ~= nil then
                        ____opt_94:destroy()
                    end
                    local ____opt_96 = object("goatplush")
                    if ____opt_96 ~= nil then
                        ____opt_96:destroy()
                    end
                end
                if accessor.item_cover then
                    local ____opt_98 = object("cover")
                    if ____opt_98 ~= nil then
                        ____opt_98:destroy()
                    end
                end
            end)
        end,
        [1] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if 2 <= accessor.plot then
                    local toy = object("toy").self
                    toy.direction = 0
                    toy.frame = 3
                end
                if physical and accessor.plot < 0.1 then
                    game.cutscene = game.cutscene + 1
                    local fd = __TS__New(STRectangle,
                        { color = 0, anchor = 0.5, priority = 1000, size = { x = 240, y = 180 } })
                    screen:attach(fd)
                    __TS__Await(ST:pause(37))
                    local innerText = __TS__New(
                        STText,
                        {
                            font = assets["f$helloplayer"],
                            anchor = 0.5,
                            justify = 0.5,
                            position = { y = 15 },
                            color = 10652124,
                            content = assets["f$helloplayer"]:wrap(
                                text.overworld.start2,
                                function() return 230 end,
                                standardSplitter
                            )
                        }
                    )
                    local startText = __TS__New(
                        STContainer,
                        {
                            alpha = 0,
                            priority = 1001,
                            children = {
                                __TS__New(STText, {
                                    font = assets["f$helloplayer"],
                                    anchor = 0.5,
                                    position = { y = -25 },
                                    justify = 0.5,
                                    scale = 2,
                                    content = text.overworld.start1
                                }),
                                innerText
                            }
                        }
                    )
                    screen:attach(startText)
                    __TS__Await(startText.alpha:automate(30, 1))
                    __TS__Await(__TS__PromiseRace({
                        ST:pause(150),
                        ST:when(function() return inputs.tertiary.held end)
                    }))
                    __TS__Await(innerText.alpha:automate(30, 0))
                    innerText.content = assets["f$helloplayer"]:wrap(
                        text.overworld.start3,
                        function() return 230 end,
                        standardSplitter
                    )
                    __TS__Await(innerText.alpha:automate(30, 1))
                    __TS__Await(__TS__PromiseRace({
                        ST:pause(150),
                        ST:when(function() return inputs.tertiary.held end)
                    }))
                    __TS__Await(startText.alpha:automate(30, 0))
                    screen:detach(startText)
                    __TS__Await(ST:pause(30))
                    screen:detach(fd)
                    daemons.crickets:instance_forced({ gain = 0 }).gain:automate(120, 1)
                    __TS__Await(unfailer())
                    accessor.plot = 0.1
                    accessor.tutorial_choice = false
                    accessor.tutorial_dialogue = false
                    local ____self_100 = hintDialogue()
                    ____self_100["then"](
                        ____self_100,
                        function()
                            accessor.tutorial_dialogue = true
                        end
                    )
                    game.cutscene = game.cutscene - 1
                    save()
                end
                if physical and accessor.plot < 0.2 then
                    local hint = hintGen(text.overworld.tutorial1, 0, 90)
                    __TS__Await(ST:when(function()
                        return math.abs(player.metadata.last_x) ~= 0 or
                            math.abs(player.metadata.last_y) ~= 0
                    end))
                    accessor.plot = 0.2
                    hint()
                    local ____self_101 = hintInter()
                    ____self_101["then"](
                        ____self_101,
                        function()
                            accessor.plot = 0.3
                        end
                    )
                end
                if physical and accessor.plot == 1 then
                    accessor.plot = 1.1
                    game.cutscene = game.cutscene + 1
                    __TS__Await(ST:pause(15))
                    __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                    __TS__Await(ST:pause(15))
                    player.stance = "left"
                    __TS__Await(ST:pause(30))
                    player.stance = "right"
                    __TS__Await(ST:pause(45))
                    __TS__Await(reader:text(text.overworld.hello3))
                    __TS__Await(ST:pause(55))
                    player.stance = "down"
                    __TS__Await(reader:text(text.overworld.hello4))
                    game.cutscene = game.cutscene - 1
                end
            end)
        end,
        [2] = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.item_crowbar then
                    local ____opt_102 = object("framebox")
                    if ____opt_102 ~= nil then
                        ____opt_102:destroy()
                    end
                    object("rogerrabbit").self.frame = 1
                end
            end)
        end,
        [3] = function()
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if accessor.item_drill then
                    local ____opt_104 = object("driller")
                    if ____opt_104 ~= nil then
                        ____opt_104:destroy()
                    end
                end
                if accessor.item_rock then
                    object("SWEEPSWEEPSWEEP").self.frame = 3
                end
                if accessor.item_bucket then
                    object("harry").self.frame = 3
                    local ____opt_106 = object("bucketbox1")
                    if ____opt_106 ~= nil then
                        ____opt_106:destroy()
                    end
                elseif accessor.event_home_outside then
                    local bb2 = object("bucketbox2").self
                    bb2.metadata.y = bb2.position.y
                    bb2.position.y = 1000
                else
                    local ____opt_108 = object("bucketbox2")
                    if ____opt_108 ~= nil then
                        ____opt_108:destroy()
                    end
                end
            end)
        end,
        [4] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if physical and accessor.plot < 2 then
                    assets["s$faucet_distant"]:instance({ position = state.faucet_time, gain = 0.4 })
                end
                if accessor.event_home_telescope then
                    local ____opt_110 = object("telescope")
                    if ____opt_110 ~= nil then
                        ____opt_110:destroy()
                    end
                    local ____opt_112 = object("telescope")
                    if ____opt_112 ~= nil then
                        ____opt_112:destroy()
                    end
                elseif 1 <= accessor.plot then
                    hide("tscope2")
                else
                    local ____opt_114 = object("tscope2")
                    if ____opt_114 ~= nil then
                        ____opt_114:destroy()
                    end
                    local ____opt_116 = object("tscope2")
                    if ____opt_116 ~= nil then
                        ____opt_116:destroy()
                    end
                    local ____opt_118 = object("tscope2")
                    if ____opt_118 ~= nil then
                        ____opt_118:destroy()
                    end
                end
                if accessor.event_home_bookshelf == 2 then
                    local ____opt_120 = object("basket")
                    if ____opt_120 ~= nil then
                        ____opt_120:destroy()
                    end
                    local ____opt_122 = object("basket")
                    if ____opt_122 ~= nil then
                        ____opt_122:destroy()
                    end
                    object("screwbox").self.frame = 1
                elseif accessor.event_home_secret then
                    hide("flipbasket")
                else
                    local ____opt_124 = object("flipbasket")
                    if ____opt_124 ~= nil then
                        ____opt_124:destroy()
                    end
                    local ____opt_126 = object("flipbasket")
                    if ____opt_126 ~= nil then
                        ____opt_126:destroy()
                    end
                end
                if 0.4 <= accessor.plot then
                    local ____opt_128 = object("extrabook")
                    if ____opt_128 ~= nil then
                        ____opt_128:destroy()
                    end
                end
                if physical and accessor.plot < 1 then
                    object("night0").self:addTicker(function(self)
                        self.offset.y = -10 + ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) -
                            map.camera_min.y
                    end)
                    object("night1").self:addTicker(function(self)
                        self.offset.y = -10 +
                            math.floor((ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) - map.camera_min.y) /
                                8 +
                                0.5)
                    end)
                    object("night2").self:addTicker(function(self)
                        self.offset.y = -10 +
                            math.floor((ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) - map.camera_min.y) /
                                16 +
                                0.5)
                    end)
                    object("night3").self.offset.y = -10
                    object("night4").self:addTicker(function(self)
                        self.offset.y = -8 -
                            math.floor((ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) - map.camera_min.y) /
                                16 +
                                0.5)
                    end)
                    object("night5").self:addTicker(function(self)
                        self.offset.y = -6 -
                            math.floor((ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) - map.camera_min.y) /
                                32 +
                                0.5)
                    end)
                end
            end)
        end,
        [5] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if not accessor.event_home_food then
                    object("bowl").self.alpha.value = 0
                else
                    local ____opt_130 = object("counter")
                    if ____opt_130 ~= nil then
                        ____opt_130:destroy()
                    end
                end
                if accessor.state_home_telecomm_message == 2 then
                    local anim = object("telecomm").self
                    anim.direction = 0
                    anim.duration = 0
                    anim.frame = 0
                    anim.step = 0
                end
                if physical and accessor.plot < 2 then
                    local fau = assets["s$faucet"]:instance_forced({ position = state.faucet_time })
                    object("leaker").self:addTicker(function(self)
                        self.frame = math.floor(fau.position.value * 30) % 60
                    end)
                end
                if accessor.item_scissors or accessor.item_rope then
                    object("hot").self.frame = (accessor.item_scissors and 1 or 0) + (accessor.item_rope and 2 or 0)
                end
                if physical and accessor.plot < 1 then
                    object("night0").self:addTicker(function(self)
                        self.offset.y = -10 + ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) -
                            map.camera_min.y
                    end)
                    object("night1").self:addTicker(function(self)
                        self.offset.y = -10 +
                            math.floor((ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) - map.camera_min.y) /
                                8 +
                                0.5)
                    end)
                    object("night2").self.offset.y = -10
                    object("night3").self:addTicker(function(self)
                        self.offset.y = -9 -
                            math.floor((ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) - map.camera_min.y) /
                                16 +
                                0.5)
                    end)
                    object("night4").self:addTicker(function(self)
                        self.offset.y = -8 -
                            math.floor((ST:clamp(map.camera.y, map.camera_min.y, map.camera_max.y) - map.camera_min.y) /
                                32 +
                                0.5)
                    end)
                end
            end)
        end,
        [6] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if physical and accessor.plot < 2 then
                    assets["s$faucet_distant"]:instance({ position = state.faucet_time, gain = 0.4 })
                end
            end)
        end,
        [7] = function(from, physical)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if physical and not accessor.event_home_outside then
                    accessor.event_home_outside = true
                    game.cutscene = game.cutscene + 1
                    __TS__Await(ST:pause(25))
                    local silly = __TS__New(STSprite, {
                        anchor = { x = 0.5, y = 1 },
                        position = player.position,
                        color = 10652124,
                        priority = player.position.y,
                        image = accessor.floof and assets["ic$player$what_side_plush"] or assets["ic$player$what_side"]
                    })
                    map:attach(silly)
                    player.alpha.value = 0
                    __TS__Await(bb_standard(silly, assets["ie$surprise"]))
                    __TS__Await(ST:pause(15))
                    __TS__Await(reader:text(text.overworld.outside1))
                    __TS__Await(ST:pause(30))
                    assets["m$home"]:instance()
                    player.alpha.value = 1
                    map:detach(silly)
                    __TS__Await(player_walk(1.5, { x = 30, y = 120 }, { x = 45 }))
                    __TS__Await(ST:pause(45))
                    __TS__Await(reader:text(text.overworld.outside2))
                    __TS__Await(ST:pause(30))
                    player.stance = "up"
                    __TS__Await(ST:pause(40))
                    player.stance = "down"
                    __TS__Await(ST:pause(50))
                    player.stance = "right"
                    __TS__Await(ST:pause(60))
                    __TS__Await(reader:text(text.overworld.outside3))
                    __TS__Await(ST:pause(45))
                    __TS__Await(bb_standard(player, assets["ie$xicon"]))
                    __TS__Await(ST:pause(30))
                    player.stance = "down"
                    __TS__Await(reader:text(text.overworld.outside4))
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
                local ____TS__Await_result_132 = __TS__Await(scripts_ex[name]())
                if ____TS__Await_result_132 == nil then
                    ____TS__Await_result_132 = true
                end
                return ____awaiter_resolve(nil, ____TS__Await_result_132)
            end
            return ____awaiter_resolve(nil, false)
        end)
    end
    __TS__ArrayPush(
        items,
        {
            name = function(self)
                return text.item_book.name
            end,
            priority = 100,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    __TS__Await(reader:text(text.item_book.info()))
                end)
            end,
            show = function(self)
                return accessor.plot == 0.4
            end
        },
        {
            name = function(self)
                return text.item_rock.name
            end,
            priority = 101,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    if map.room == 7 then
                        game.cutscene = game.cutscene + 1
                        accessor.plot = 2
                        update()
                        __TS__Await(reader:text(text.overworld.golden1))
                        if player.position.x < 30 then
                            __TS__Await(player_walk(1.5, { x = 30, y = player.position.y + (30 - player.position.x) }))
                        end
                        if player.position.x > 30 then
                            __TS__Await(player_walk(1.5, { x = 30 }))
                        end
                        if player.position.y < 115 and math.abs(player.position.y - 115) > 6 then
                            __TS__Await(player_walk(1.5, { y = 115 }))
                        elseif player.position.y > 125 and math.abs(player.position.y - 125) > 6 then
                            __TS__Await(player_walk(1.5, { y = 125 }))
                        end
                        player.stance = "right"
                        __TS__Await(ST:pause(45))
                        local cam = map:cam_clamped()
                        map.camera = cam
                        local rg = map:cam_free()
                        local i = 0
                        while i < 2 do
                            local ____self_133 = reader:header("a")
                            local ____self_133_then_result_135 = ____self_133["then"](
                                ____self_133,
                                function()
                                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                        cam:automate(30, { x = 175 })
                                        __TS__Await(bb_standard(player, assets["ie$surprise"]))
                                    end)
                                end
                            )
                            local ____self_134 = reader:text(({ text.overworld.golden2, text.overworld.golden4 })[i + 1])
                            __TS__Await(__TS__PromiseAll({
                                ____self_133_then_result_135,
                                ____self_134["then"](
                                    ____self_134,
                                    function() return ST:pause(15) end
                                )
                            }))
                            local power = __TS__Await(__TS__New(
                                __TS__Promise,
                                function(____, resolve)
                                    local d = false
                                    local ac = inputs.primary.held and -1 or 0
                                    local fx = nil
                                    local function pow(n)
                                        return ST:linear(
                                            n / 90,
                                            0,
                                            0.5,
                                            1,
                                            0
                                        )
                                    end
                                    local rec = __TS__New(STRectangle,
                                        { position = { x = 194 / -2 }, anchor = { y = 0.5 }, size = { y = 24 }, priority = 1 })
                                    local htext = __TS__New(STText, {
                                        content = text.overworld.tutorial7,
                                        priority = 2,
                                        position = { y = 1 },
                                        anchor = 0.5,
                                        font = assets["f$helloplayer"],
                                        color = 8355711
                                    })
                                    local powbar = __TS__New(
                                        STContainer,
                                        {
                                            alpha = 0,
                                            metadata = 0,
                                            children = {
                                                __TS__New(STSprite, { anchor = 0.5, image = images.powbar }),
                                                rec,
                                                htext
                                            },
                                            priority = 1000
                                        }
                                    ):addTicker(function(self)
                                        if d then
                                            local ____temp_139 = self.alpha.value > 0
                                            if ____temp_139 then
                                                local ____self_alpha_136, ____value_137 = self.alpha, "value"
                                                local ____self_alpha_value_138 = ____self_alpha_136[____value_137] -
                                                    0.75 / 7
                                                ____self_alpha_136[____value_137] = ____self_alpha_value_138
                                                ____temp_139 = ____self_alpha_value_138 <= 0
                                            end
                                            if ____temp_139 then
                                                screen:detach(self)
                                            end
                                            return
                                        else
                                            local ____temp_143 = self.alpha.value < 0.75
                                            if ____temp_143 then
                                                local ____self_alpha_140, ____value_141 = self.alpha, "value"
                                                local ____self_alpha_value_142 = ____self_alpha_140[____value_141] +
                                                    0.75 / 7
                                                ____self_alpha_140[____value_141] = ____self_alpha_value_142
                                                ____temp_143 = ____self_alpha_value_142 > 0.75
                                            end
                                            local ____temp_143_144 = ____temp_143
                                            if ____temp_143_144 then
                                                self.alpha.value = 0.75
                                                ____temp_143_144 = 0.75
                                            end
                                        end
                                        repeat
                                            local ____switch437 = ac
                                            local ____cond437 = ____switch437 == -1
                                            if ____cond437 then
                                                if not inputs.primary.held then
                                                    ac = 0
                                                end
                                                break
                                            end
                                            ____cond437 = ____cond437 or ____switch437 == 0
                                            if ____cond437 then
                                                if inputs.primary.held then
                                                    ac = 1
                                                elseif self.metadata ~= 0 then
                                                    self.metadata = self.metadata - 1
                                                end
                                                break
                                            end
                                            ____cond437 = ____cond437 or ____switch437 == 1
                                            if ____cond437 then
                                                local ____temp_148 = not inputs.primary.held
                                                if not ____temp_148 then
                                                    local ____self_145, ____metadata_146 = self, "metadata"
                                                    local ____self_metadata_147 = ____self_145[____metadata_146] + 1
                                                    ____self_145[____metadata_146] = ____self_metadata_147
                                                    ____temp_148 = ____self_metadata_147 == 90
                                                end
                                                if ____temp_148 then
                                                    if self.metadata < 10 then
                                                        ac = 0
                                                        break
                                                    end
                                                    d = true
                                                    local p = pow(self.metadata)
                                                    self.scale:automate(7, 1 + p ^ 3 * 2)
                                                    resolve(nil, p)
                                                    if fx ~= nil then
                                                        ezecho(
                                                            fx,
                                                            10,
                                                            0.4 + p * 0.2,
                                                            0.25 + p * 0.2,
                                                            0.001
                                                        )
                                                    end
                                                    return
                                                end
                                                break
                                            end
                                        until true
                                        rec.size.x = ST:remap(
                                            self.metadata,
                                            0,
                                            194,
                                            0,
                                            90
                                        )
                                        htext.alpha.value = 1 - math.min(self.metadata / 10, 1)
                                        local v = pow(self.metadata)
                                        local s = v ^ 5
                                        self.position.x = (math.random() - 0.5) * s * 2
                                        self.position.y = 60 + (math.random() - 0.5) * s * 2
                                        local c = ST:remap(v ^ 3, 127, 255)
                                        rec.color.red = c
                                        rec.color.green = c
                                        rec.color.blue = c
                                        if fx == nil and 10 <= self.metadata then
                                            fx = assets["s$chargethrow"]:instance_forced()
                                        end
                                    end):addDrawer(batch.drawer)
                                    screen:attach(powbar)
                                end
                            ))
                            __TS__Await(__TS__New(
                                __TS__Promise,
                                function(____, resolve)
                                    local rock
                                    rock = __TS__New(
                                        STSprite,
                                        {
                                            image = images.rock,
                                            anchor = 0.5,
                                            metadata = 0,
                                            velocity = ST:ray(
                                                -30,
                                                ST:remap(power, 5, 10)
                                            ),
                                            gravity = { y = 0.25 },
                                            position = { x = 30, y = player.position.y - 10 },
                                            priority = 500
                                        }
                                    ):addTicker(function(self)
                                        map:attach(__TS__New(
                                            STSprite,
                                            {
                                                alpha = ST:remap(power, 0, 0.3),
                                                image = images.rock,
                                                anchor = 0.5,
                                                scale = { x = self.scale.x },
                                                rotation = self.rotation.value,
                                                position = self.position,
                                                priority = 500
                                            }
                                        ):addTicker(function(self)
                                            local ____self_alpha_149, ____value_150 = self.alpha, "value"
                                            local ____self_alpha_value_151 = ____self_alpha_149[____value_150] - 0.1
                                            ____self_alpha_149[____value_150] = ____self_alpha_value_151
                                            if ____self_alpha_value_151 <= 0 then
                                                map:detach(self)
                                            end
                                        end))
                                        return function()
                                            if self.position.y > cam.y + 100 then
                                                map:detach(rock)
                                                resolve(nil)
                                            else
                                                local ____self_152, ____metadata_153 = self, "metadata"
                                                local ____self_metadata_154 = ____self_152[____metadata_153] + 1
                                                ____self_152[____metadata_153] = ____self_metadata_154
                                                repeat
                                                    local ____switch452 = ____self_metadata_154
                                                    local ____cond452 = ____switch452 == 3
                                                    if ____cond452 then
                                                        self.rotation.value = 90
                                                        self.scale.x = -1
                                                        break
                                                    end
                                                    ____cond452 = ____cond452 or ____switch452 == 6
                                                    if ____cond452 then
                                                        self.metadata = 0
                                                        self.rotation.value = 0
                                                        self.scale.x = 1
                                                        break
                                                    end
                                                until true
                                            end
                                        end
                                    end)
                                    map:attach(rock)
                                end
                            ))
                            __TS__Await(ST:pause(60))
                            __TS__Await(cam:automate(45, { x = 120 }))
                            __TS__Await(ST:pause(30))
                            __TS__Await(reader:text(({ text.overworld.golden3, text.overworld.golden5 })[i + 1]))
                            local ____i_155 = i
                            i = ____i_155 + 1
                            if ____i_155 == 0 then
                                __TS__Await(ST:pause(15))
                                player.stance = "up"
                                __TS__Await(ST:pause(30))
                                player.stance = "down"
                                __TS__Await(ST:pause(45))
                                player.stance = "right"
                                __TS__Await(ST:pause(60))
                            end
                        end
                        __TS__ArrayMap(
                            assets["m$home"].instances,
                            function(____, inst)
                                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                    __TS__Await(inst.gain:automate(90, 0))
                                    inst:stop()
                                end)
                            end
                        )
                        __TS__Await(ST:pause(60))
                        __TS__Await(bb_standard(player, assets["ie$ellipsis"]))
                        __TS__Await(ST:pause(15))
                        __TS__Await(reader:text(text.overworld.golden6))
                        __TS__Await(ST:pause(45))
                        __TS__Await(player_walk(0.5, { y = 135 }))
                        __TS__Await(ST:pause(10))
                        local task = ST:task()
                        cam:automate(90, { y = 300 })
                        local ____self_164 = ST:pause(60)
                        __TS__Await(__TS__PromiseAll({
                            ____self_164["then"](
                                ____self_164,
                                function()
                                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                        __TS__Await(__TS__New(
                                            __TS__Promise,
                                            function(____, resolve)
                                                local b = false
                                                local rock
                                                rock = __TS__New(STSprite, {
                                                    image = images.rock,
                                                    anchor = 0.5,
                                                    metadata = 0,
                                                    gravity = { y = 0.25 },
                                                    velocity = { x = 0.5 },
                                                    position = { x = 30, y = player.position.y - 10 },
                                                    priority = 500
                                                }):addTicker(function(self)
                                                    if not b then
                                                        map:attach(__TS__New(
                                                            STSprite,
                                                            {
                                                                alpha = ST:remap_clamped(
                                                                    self.velocity.y,
                                                                    0,
                                                                    0.15,
                                                                    0,
                                                                    10
                                                                ),
                                                                image = images.rock,
                                                                anchor = 0.5,
                                                                scale = { x = self.scale.x },
                                                                rotation = self.rotation.value,
                                                                position = self.position,
                                                                priority = 500
                                                            }
                                                        ):addTicker(function(self)
                                                            local ____self_alpha_156, ____value_157 = self.alpha, "value"
                                                            local ____self_alpha_value_158 = ____self_alpha_156
                                                                [____value_157] - 0.1
                                                            ____self_alpha_156[____value_157] = ____self_alpha_value_158
                                                            if ____self_alpha_value_158 <= 0 then
                                                                map:detach(self)
                                                            end
                                                        end))
                                                    end
                                                    return function()
                                                        if not b and 340 <= self.position.y then
                                                            b = true
                                                            self.position.y = 340
                                                            local ____self_velocity_159, ____y_160 = self.velocity, "y"
                                                            ____self_velocity_159[____y_160] = ____self_velocity_159
                                                                [____y_160] * -0.4
                                                            self.velocity.x = 1.5
                                                            assets["s$rockbounce"]:instance()
                                                            task.complete()
                                                        elseif self.position.y > 390 then
                                                            map:detach(rock)
                                                            resolve(nil)
                                                        else
                                                            local ____self_161, ____metadata_162 = self, "metadata"
                                                            local ____self_metadata_163 = ____self_161[____metadata_162] +
                                                                1
                                                            ____self_161[____metadata_162] = ____self_metadata_163
                                                            repeat
                                                                local ____switch465 = ____self_metadata_163
                                                                local ____cond465 = ____switch465 == 6
                                                                if ____cond465 then
                                                                    self.rotation.value = 90
                                                                    self.scale.x = -1
                                                                    break
                                                                end
                                                                ____cond465 = ____cond465 or ____switch465 == 12
                                                                if ____cond465 then
                                                                    self.metadata = 0
                                                                    self.rotation.value = 0
                                                                    self.scale.x = 1
                                                                    break
                                                                end
                                                            until true
                                                        end
                                                    end
                                                end)
                                                map:attach(rock)
                                            end
                                        ))
                                        __TS__Await(ST:pause(60))
                                    end)
                                end
                            ),
                            task["then"](
                                task,
                                function()
                                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                        __TS__Await(ST:pause(60))
                                        __TS__Await(reader:text(text.overworld.golden7))
                                        __TS__Await(ST:pause(45))
                                    end)
                                end
                            )
                        }))
                        __TS__Await(cam:automate(90, { y = 135 }))
                        map:cam_restore(unpack(rg))
                        map.camera = player.position
                        __TS__Await(ST:pause(60))
                        __TS__Await(reader:text(text.overworld.golden8))
                        __TS__Await(ST:pause(45))
                        __TS__Await(reader:text(text.overworld.golden9))
                        __TS__Await(ST:pause(15))
                        player.stance = "right"
                        __TS__Await(ST:pause(30))
                        player.stance = "up"
                        __TS__Await(ST:pause(45))
                        player.stance = "down"
                        __TS__Await(ST:pause(60))
                        __TS__Await(reader:text(text.overworld.golden10))
                        assets["m$home_full"]:instance()
                        game.cutscene = game.cutscene - 1
                    else
                        __TS__Await(reader:text(text.overworld.broombox3))
                    end
                end)
            end,
            show = function(self)
                return accessor.item_rock and accessor.plot < 2
            end
        },
        {
            name = function(self)
                return text.item_cover.name()
            end,
            priority = 102,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    __TS__Await(reader:text(text.item_cover.info()))
                end)
            end,
            show = function(self)
                return accessor.item_cover
            end
        },
        {
            name = function(self)
                return text.item_crowbar.name
            end,
            priority = 103,
            script = function(self, reader)
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    __TS__Await(reader:text(text.item_crowbar.info))
                end)
            end,
            show = function(self)
                return accessor.item_crowbar
            end
        }
    )
    map:addUpdater(function(self, from, to, physical, x, y)
        return __TS__AsyncAwaiter(function(____awaiter_resolve)
            if to == nil then
                return ____awaiter_resolve(nil)
            end
            if physical then
                for key in pairs(pager.storage) do
                    if __TS__StringIncludes(key, "#") then
                        pager.storage[key] = 0
                    end
                end
                if accessor.plot < 1 then
                    map.autoplay = false
                    for ____, obj in __TS__Iterator(objects("void_window")) do
                        obj:destroy()
                    end
                    local rect = __TS__New(STRectangle, {
                        color = 1052688,
                        size = { x = 240, y = 180 },
                        anchor = 0.5,
                        priority = 500,
                        blend = STBlend.SUBTRACT
                    }):addTicker(function(self)
                        self.position.x = x - map.position.x / map.scale.x
                        self.position.y = y - map.position.y / map.scale.y
                        self.scale.x = 1 / map.scale.x
                        self.scale.y = 1 / map.scale.y
                    end)
                    temp[#temp + 1] = rect
                    map:attach(rect)
                else
                    for ____, obj in __TS__Iterator(objects("night")) do
                        obj:destroy()
                    end
                end
            end
            if physical and from == nil then
                if not accessor.tutorial_dialogue then
                    local ____self_165 = hintDialogue()
                    ____self_165["then"](
                        ____self_165,
                        function()
                            accessor.tutorial_dialogue = true
                        end
                    )
                end
                repeat
                    local ____switch491 = accessor.plot
                    local ____cond491 = ____switch491 == 0.2
                    if ____cond491 then
                        local ____self_166 = hintInter()
                        ____self_166["then"](
                            ____self_166,
                            function()
                                accessor.plot = 0.3
                            end
                        )
                    end
                    ____cond491 = ____cond491 or (____switch491 == 0.1 or ____switch491 == 0.2 or ____switch491 == 0.3)
                    if ____cond491 then
                        local ____opt_167 = daemons.crickets:instance({ gain = 0 })
                        if ____opt_167 ~= nil then
                            ____opt_167.gain:automate(7, 1)
                        end
                        break
                    end
                    ____cond491 = ____cond491 or (____switch491 == 1 or ____switch491 == 1.1)
                    if ____cond491 then
                        if accessor.event_home_outside then
                            local ____opt_169 = assets["m$home"]:instance({ gain = 0 })
                            if ____opt_169 ~= nil then
                                ____opt_169.gain:automate(7, 1)
                            end
                        end
                        break
                    end
                    ____cond491 = ____cond491 or (____switch491 == 2 or ____switch491 == 3)
                    if ____cond491 then
                        local ____opt_171 = assets["m$home_full"]:instance({ gain = 0 })
                        if ____opt_171 ~= nil then
                            ____opt_171.gain:automate(7, 1)
                        end
                        break
                    end
                until true
                if accessor.plot < 1 then
                    state.mapcolor.saturation = 0.4
                    state.mapcolor.value = 0.8
                end
            end
            if updaters[to] ~= nil then
                local p = updaters[to](from, physical, x, y)
                if p ~= nil then
                    __TS__Await(p)
                end
            end
        end)
    end)
    player:addDrawer(stepSFX)
    reader.presets.messenger = {
        color = 16777215,
        chunk = 2,
        faces = {},
        font = assets["f$helloplayer"],
        interval = 2,
        voices = { default = { { assets["v$messenger"], 1 } } }
    }
    save_hooks[#save_hooks + 1] = function()
        accessor.location_idx = map.room
        accessor.pager_home = ST:encode(pager.storage)
    end
    local shaderCleanup = shaderSetup()
    local hsv = hsvShader(state.mapcolor)
    map:addDrawer(hsv.drawer)
    return {
        map = map,
        overworld = overworld,
        cleanup = function(self)
            shaderCleanup()
            hsv:release()
        end
    }
end

return ____exports
