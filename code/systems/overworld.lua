--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____batch = require("code.shaders.batch")
local batchShader = ____batch.default
local ____acquit = require("code.systems.acquit")
local acquitSystem = ____acquit.default
local ____assets = require("code.systems.assets")
local assetsSystem = ____assets.default
local ____atlas = require("code.systems.atlas")
local atlasSystem = ____atlas.default
local ____debug = require("code.systems.debug")
local debugSystem = ____debug.default
local ____game = require("code.systems.game")
local gameSystem = ____game.default
local ____inputs = require("code.systems.inputs")
local inputsSystem = ____inputs.default
local ____inventory = require("code.systems.inventory")
local inventorySystem = ____inventory.default
local ____mixer = require("code.systems.mixer")
local mixerSystem = ____mixer.default
local ____player = require("code.systems.player")
local playerSystem = ____player.default
local ____reader = require("code.systems.reader")
local readerSystem = ____reader.default
local ____screen = require("code.systems.screen")
local screenSystem = ____screen.default
local function overworld(extras)
    local batch = batchShader()
    local game = gameSystem()
    local screen = screenSystem()
    local mixer = mixerSystem()
    local assets = assetsSystem(
        extras(mixer),
        mixer
    )
    local ____debug = debugSystem(assets)
    local player = playerSystem(assets, batch, game)
    local inventory = inventorySystem(game, player)
    local atlas = atlasSystem(
        assets,
        batch,
        ____debug,
        game,
        inventory,
        mixer,
        player,
        screen
    )
    local reader = readerSystem(
        assets,
        atlas,
        batch,
        game,
        screen
    )
    local inputs = inputsSystem(
        assets,
        atlas,
        ____debug,
        game,
        inventory,
        mixer,
        reader
    )
    local acquit = acquitSystem(
        assets,
        atlas,
        batch,
        ____debug,
        screen
    )
    return {
        acquit = acquit,
        assets = assets,
        atlas = atlas,
        batch = batch,
        debug = ____debug,
        game = game,
        inputs = inputs,
        inventory = inventory,
        mixer = mixer,
        player = player,
        reader = reader,
        screen = screen
    }
end
____exports.default = overworld
return ____exports
