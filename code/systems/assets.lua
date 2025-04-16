local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local ____exports = {}
local ____storyteller = require("code.engine.storyteller")
local ST_SEMITONE = ____storyteller.ST_SEMITONE
local STAudio = ____storyteller.STAudio
local STDaemon = ____storyteller.STDaemon
local STFont = ____storyteller.STFont
local STFrames = ____storyteller.STFrames
local STImage = ____storyteller.STImage
local function assets(extras, ____bindingPattern0)
    local sound
    local music
    music = ____bindingPattern0.music
    sound = ____bindingPattern0.sound
    local menu_select = __TS__New(STAudio, "sounds/menu_select.ogg")
    return __TS__ObjectAssign(
        {
            ["f$fives"] = __TS__New(STFont, "fonts/fives.csv", "fonts/fives.png"),
            ["f$helloplayer"] = __TS__New(STFont, "fonts/helloplayer.csv", "fonts/helloplayer.png"),
            ["ic$player$down"] = __TS__New(STFrames, "images/characters/player/down.json", "images/characters/player/down.png"),
            ["ic$player$down_plush"] = __TS__New(STFrames, "images/characters/player/down_plush.json", "images/characters/player/down_plush.png"),
            ["ic$player$left"] = __TS__New(STFrames, "images/characters/player/left.json", "images/characters/player/left.png"),
            ["ic$player$left_plush"] = __TS__New(STFrames, "images/characters/player/left_plush.json", "images/characters/player/left_plush.png"),
            ["ic$player$right"] = __TS__New(STFrames, "images/characters/player/right.json", "images/characters/player/right.png"),
            ["ic$player$right_plush"] = __TS__New(STFrames, "images/characters/player/right_plush.json", "images/characters/player/right_plush.png"),
            ["ic$player$sleep"] = __TS__New(STFrames, "images/characters/player/sleep.json", "images/characters/player/sleep.png"),
            ["ic$player$up"] = __TS__New(STFrames, "images/characters/player/up.json", "images/characters/player/up.png"),
            ["ic$player$up_plush"] = __TS__New(STFrames, "images/characters/player/up_plush.json", "images/characters/player/up_plush.png"),
            ["ic$player$what_side"] = __TS__New(STImage, "images/characters/player/what_side.png"),
            ["ic$player$what_side_plush"] = __TS__New(STImage, "images/characters/player/what_side_plush.png"),
            ["ie$confused"] = __TS__New(STImage, "images/expressions/confused.png"),
            ["ie$ellipsis"] = __TS__New(STImage, "images/expressions/ellipsis.png"),
            ["ie$five"] = __TS__New(STImage, "images/expressions/five.png"),
            ["ie$four"] = __TS__New(STImage, "images/expressions/four.png"),
            ["ie$heart"] = __TS__New(STImage, "images/expressions/heart.png"),
            ["ie$note"] = __TS__New(STImage, "images/expressions/note.png"),
            ["ie$one"] = __TS__New(STImage, "images/expressions/one.png"),
            ["ie$surprise"] = __TS__New(STImage, "images/expressions/surprise.png"),
            ["ie$three"] = __TS__New(STImage, "images/expressions/three.png"),
            ["ie$two"] = __TS__New(STImage, "images/expressions/two.png"),
            ["ie$xicon"] = __TS__New(STImage, "images/expressions/xicon.png"),
            ["if$common$mystery"] = __TS__New(STImage, "images/faces/common/mystery.png"),
            ["if$player$annoyed"] = __TS__New(STImage, "images/faces/player/annoyed.png"),
            ["if$player$annoyed_large"] = __TS__New(STImage, "images/faces/player/annoyed_large.png"),
            ["if$player$confused"] = __TS__New(STImage, "images/faces/player/confused.png"),
            ["if$player$confused_large"] = __TS__New(STImage, "images/faces/player/confused_large.png"),
            ["if$player$cry"] = __TS__New(STFrames, "images/faces/player/cry.json", "images/faces/player/cry.png"),
            ["if$player$cry_large"] = __TS__New(STFrames, "images/faces/player/cry_large.json", "images/faces/player/cry_large.png"),
            ["if$player$default"] = __TS__New(STImage, "images/faces/player/default.png"),
            ["if$player$default_large"] = __TS__New(STImage, "images/faces/player/default_large.png"),
            ["if$player$determined"] = __TS__New(STImage, "images/faces/player/determined.png"),
            ["if$player$determined_large"] = __TS__New(STImage, "images/faces/player/determined_large.png"),
            ["if$player$determined2"] = __TS__New(STImage, "images/faces/player/determined2.png"),
            ["if$player$determined2_large"] = __TS__New(STImage, "images/faces/player/determined2_large.png"),
            ["if$player$happi"] = __TS__New(STImage, "images/faces/player/happi.png"),
            ["if$player$happi_large"] = __TS__New(STImage, "images/faces/player/happi_large.png"),
            ["if$player$happi2"] = __TS__New(STFrames, "images/faces/player/happi2.json", "images/faces/player/happi2.png"),
            ["if$player$happi2_large"] = __TS__New(STFrames, "images/faces/player/happi2_large.json", "images/faces/player/happi2_large.png"),
            ["if$player$sad"] = __TS__New(STImage, "images/faces/player/sad.png"),
            ["if$player$sad_large"] = __TS__New(STImage, "images/faces/player/sad_large.png"),
            ["if$player$sad2"] = __TS__New(STImage, "images/faces/player/sad2.png"),
            ["if$player$sad2_large"] = __TS__New(STImage, "images/faces/player/sad2_large.png"),
            ["if$player$side"] = __TS__New(STImage, "images/faces/player/side.png"),
            ["if$player$side_large"] = __TS__New(STImage, "images/faces/player/side_large.png"),
            ["if$player$sigh"] = __TS__New(STImage, "images/faces/player/sigh.png"),
            ["if$player$sigh_large"] = __TS__New(STImage, "images/faces/player/sigh_large.png"),
            ["if$player$sleep"] = __TS__New(STImage, "images/faces/player/sleep.png"),
            ["if$player$sleep_large"] = __TS__New(STImage, "images/faces/player/sleep_large.png"),
            ["if$player$sodesuka"] = __TS__New(STImage, "images/faces/player/sodesuka.png"),
            ["if$player$sodesuka_large"] = __TS__New(STImage, "images/faces/player/sodesuka_large.png"),
            ["if$player$surprise"] = __TS__New(STImage, "images/faces/player/surprise.png"),
            ["if$player$surprise_large"] = __TS__New(STImage, "images/faces/player/surprise_large.png"),
            ["if$player$sweat"] = __TS__New(STImage, "images/faces/player/sweat.png"),
            ["if$player$sweat_large"] = __TS__New(STImage, "images/faces/player/sweat_large.png"),
            ["if$player$sweat2"] = __TS__New(STImage, "images/faces/player/sweat2.png"),
            ["if$player$sweat2_large"] = __TS__New(STImage, "images/faces/player/sweat2_large.png"),
            ["if$player$sweat3"] = __TS__New(STImage, "images/faces/player/sweat3.png"),
            ["if$player$sweat3_large"] = __TS__New(STImage, "images/faces/player/sweat3_large.png"),
            ["if$player$sweat4"] = __TS__New(STImage, "images/faces/player/sweat4.png"),
            ["if$player$sweat4_large"] = __TS__New(STImage, "images/faces/player/sweat4_large.png"),
            ["if$player$sweat5"] = __TS__New(STImage, "images/faces/player/sweat5.png"),
            ["if$player$sweat5_large"] = __TS__New(STImage, "images/faces/player/sweat5_large.png"),
            ["if$player$upset"] = __TS__New(STImage, "images/faces/player/upset.png"),
            ["if$player$upset_large"] = __TS__New(STImage, "images/faces/player/upset_large.png"),
            ["if$player$upset2"] = __TS__New(STImage, "images/faces/player/upset2.png"),
            ["if$player$upset2_large"] = __TS__New(STImage, "images/faces/player/upset2_large.png"),
            ["if$player$what"] = __TS__New(STImage, "images/faces/player/what.png"),
            ["if$player$what_large"] = __TS__New(STImage, "images/faces/player/what_large.png"),
            ["if$player$wink"] = __TS__New(STImage, "images/faces/player/wink.png"),
            ["if$player$wink_large"] = __TS__New(STImage, "images/faces/player/wink_large.png"),
            ["if$player$xeyes"] = __TS__New(STImage, "images/faces/player/xeyes.png"),
            ["if$player$xeyes_large"] = __TS__New(STImage, "images/faces/player/xeyes_large.png"),
            ["ig$rhythm$backdrop"] = __TS__New(STImage, "images/games/rhythm/backdrop.png"),
            ["ig$rhythm$circle"] = __TS__New(STImage, "images/games/rhythm/circle.png"),
            ["ig$rhythm$emotion_anxiety"] = __TS__New(STFrames, "images/games/rhythm/emotion_anxiety.json", "images/games/rhythm/emotion_anxiety.png"),
            ["ig$rhythm$emotion_depression"] = __TS__New(STFrames, "images/games/rhythm/emotion_depression.json", "images/games/rhythm/emotion_depression.png"),
            ["ig$rhythm$expand_middle"] = __TS__New(STImage, "images/games/rhythm/expand_middle.png"),
            ["ig$rhythm$expand_side"] = __TS__New(STImage, "images/games/rhythm/expand_side.png"),
            ["ig$rhythm$flare"] = __TS__New(STFrames, "images/games/rhythm/flare.json", "images/games/rhythm/flare.png"),
            ["ig$rhythm$flare_diag"] = __TS__New(STFrames, "images/games/rhythm/flare_diag.json", "images/games/rhythm/flare_diag.png"),
            ["ig$rhythm$joystick_cardinal1"] = __TS__New(STFrames, "images/games/rhythm/joystick_cardinal1.json", "images/games/rhythm/joystick_cardinal1.png"),
            ["ig$rhythm$joystick_cardinal2"] = __TS__New(STFrames, "images/games/rhythm/joystick_cardinal2.json", "images/games/rhythm/joystick_cardinal2.png"),
            ["ig$rhythm$joystick_cardinal3"] = __TS__New(STFrames, "images/games/rhythm/joystick_cardinal3.json", "images/games/rhythm/joystick_cardinal3.png"),
            ["ig$rhythm$joystick_cardinal4"] = __TS__New(STFrames, "images/games/rhythm/joystick_cardinal4.json", "images/games/rhythm/joystick_cardinal4.png"),
            ["ig$rhythm$joystick_cardinal5"] = __TS__New(STFrames, "images/games/rhythm/joystick_cardinal5.json", "images/games/rhythm/joystick_cardinal5.png"),
            ["ig$rhythm$joystick_cardinal6"] = __TS__New(STFrames, "images/games/rhythm/joystick_cardinal6.json", "images/games/rhythm/joystick_cardinal6.png"),
            ["ig$rhythm$joystick_diagonal1"] = __TS__New(STFrames, "images/games/rhythm/joystick_diagonal1.json", "images/games/rhythm/joystick_diagonal1.png"),
            ["ig$rhythm$joystick_diagonal2"] = __TS__New(STFrames, "images/games/rhythm/joystick_diagonal2.json", "images/games/rhythm/joystick_diagonal2.png"),
            ["ig$rhythm$joystick_diagonal3"] = __TS__New(STFrames, "images/games/rhythm/joystick_diagonal3.json", "images/games/rhythm/joystick_diagonal3.png"),
            ["ig$rhythm$joystick_diagonal4"] = __TS__New(STFrames, "images/games/rhythm/joystick_diagonal4.json", "images/games/rhythm/joystick_diagonal4.png"),
            ["ig$rhythm$joystick_diagonal5"] = __TS__New(STFrames, "images/games/rhythm/joystick_diagonal5.json", "images/games/rhythm/joystick_diagonal5.png"),
            ["ig$rhythm$joystick_diagonal6"] = __TS__New(STFrames, "images/games/rhythm/joystick_diagonal6.json", "images/games/rhythm/joystick_diagonal6.png"),
            ["ig$rhythm$joystick_neutral1"] = __TS__New(STFrames, "images/games/rhythm/joystick_neutral1.json", "images/games/rhythm/joystick_neutral1.png"),
            ["ig$rhythm$joystick_neutral2"] = __TS__New(STFrames, "images/games/rhythm/joystick_neutral2.json", "images/games/rhythm/joystick_neutral2.png"),
            ["ig$rhythm$joystick_neutral3"] = __TS__New(STFrames, "images/games/rhythm/joystick_neutral3.json", "images/games/rhythm/joystick_neutral3.png"),
            ["ig$rhythm$joystick_neutral4"] = __TS__New(STFrames, "images/games/rhythm/joystick_neutral4.json", "images/games/rhythm/joystick_neutral4.png"),
            ["ig$rhythm$joystick_neutral5"] = __TS__New(STFrames, "images/games/rhythm/joystick_neutral5.json", "images/games/rhythm/joystick_neutral5.png"),
            ["ig$rhythm$joystick_neutral6"] = __TS__New(STFrames, "images/games/rhythm/joystick_neutral6.json", "images/games/rhythm/joystick_neutral6.png"),
            ["im$ch_dropdown"] = __TS__New(STImage, "images/menu/ch_dropdown.png"),
            ["im$dl_box"] = __TS__New(STImage, "images/menu/dl_box.png"),
            ["im$dl_circle"] = __TS__New(STImage, "images/menu/dl_circle.png"),
            ["im$dl_corner"] = __TS__New(STImage, "images/menu/dl_corner.png"),
            ["im$dl_edge"] = __TS__New(STImage, "images/menu/dl_edge.png"),
            ["im$logo"] = __TS__New(STFrames, "images/menu/logo.json", "images/menu/logo.png"),
            ["im$ov_bubble"] = __TS__New(STFrames, "images/menu/ov_bubble.json", "images/menu/ov_bubble.png"),
            ["im$ov_modal"] = __TS__New(STImage, "images/menu/ov_modal.png"),
            ["im$ov_toast"] = __TS__New(STImage, "images/menu/ov_toast.png"),
            ["im$tt_edge"] = __TS__New(STImage, "images/menu/tt_edge.png"),
            ["im$tt_side"] = __TS__New(STImage, "images/menu/tt_side.png"),
            ["im$volume"] = __TS__New(STFrames, "images/menu/volume.json", "images/menu/volume.png"),
            ["m$mainmenu"] = __TS__New(STDaemon, "music/mainmenu.ogg", {mixer = music, gain = 0.6, loop = true}),
            ["s$awaken"] = __TS__New(STDaemon, "sounds/awaken.ogg", {mixer = sound, gain = 0.6}),
            ["s$beep_error"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/beep_error.ogg"),
                {mixer = sound}
            ),
            ["s$beep_power"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/beep_power.ogg"),
                {mixer = sound, gain = 0.8}
            ),
            ["s$beep_sustain"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/beep_sustain.ogg"),
                {mixer = sound}
            ),
            ["s$driller"] = __TS__New(STDaemon, "sounds/driller.ogg", {mixer = sound, gain = 0.35, rate = 1.2}),
            ["s$itemget"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/itemget.ogg"),
                {mixer = sound}
            ),
            ["s$itemuse"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/itemuse.ogg"),
                {mixer = sound}
            ),
            ["s$menu_navigate"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/menu_navigate.ogg"),
                {mixer = sound, gain = 0.9}
            ),
            ["s$menu_select_huge"] = __TS__New(STDaemon, "sounds/menu_select_huge.ogg", {mixer = sound, gain = 0.6}),
            ["s$menu_select"] = __TS__New(STDaemon, menu_select, {mixer = sound, gain = 0.6}),
            ["s$menu_select$music"] = __TS__New(STDaemon, menu_select, {mixer = music, gain = 0.6}),
            ["s$noise"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/noise.ogg"),
                {mixer = sound, gain = 0.4}
            ),
            ["s$reload_ex"] = __TS__New(STDaemon, "sounds/reload_ex.ogg", {mixer = sound}),
            ["s$reload"] = __TS__New(STDaemon, "sounds/reload.ogg", {mixer = sound}),
            ["s$ry_bounce"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/ry_bounce.ogg"),
                {mixer = sound, gain = 0.5}
            ),
            ["s$ry_split"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/ry_split.ogg"),
                {mixer = sound, gain = 0.8}
            ),
            ["s$scissors"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/scissors.ogg"),
                {mixer = sound, rate = 0.75}
            ),
            ["s$step_bush"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_bush.ogg"),
                {mixer = sound, gain = 0.3}
            ),
            ["s$step_carpet"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_carpet.ogg"),
                {mixer = sound, gain = 1}
            ),
            ["s$step_ceramic"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_ceramic.ogg"),
                {mixer = sound, gain = 0.25}
            ),
            ["s$step_concrete"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_concrete.ogg"),
                {mixer = sound, gain = 0.8, rate = 1.2}
            ),
            ["s$step_glass"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_glass.ogg"),
                {mixer = sound, gain = 0.6}
            ),
            ["s$step_grass"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_grass.ogg"),
                {mixer = sound, gain = 0.2}
            ),
            ["s$step_gravel"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_gravel.ogg"),
                {mixer = sound, gain = 0.5}
            ),
            ["s$step_metal"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_metal.ogg"),
                {mixer = sound, gain = 0.5, rate = ST_SEMITONE ^ 2}
            ),
            ["s$step_plastic"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/step_plastic.ogg"),
                {mixer = sound, gain = 1, rate = 0.8}
            ),
            ["s$warp_in"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/warp_in.ogg"),
                {mixer = sound}
            ),
            ["s$warp_out"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/warp_out.ogg"),
                {mixer = sound}
            ),
            ["s$warp_speed"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "sounds/warp_speed.ogg"),
                {mixer = sound, loop = true}
            ),
            ["v$player"] = __TS__New(
                STDaemon,
                __TS__New(STAudio, "voices/player.ogg"),
                {mixer = sound, gain = 0.7}
            )
        },
        extras
    )
end
____exports.default = assets
return ____exports
