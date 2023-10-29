-------- FILE INFORMATION ------------------------------------------------------
-- File:    engine-global-constants.lua
-- Author:  crimeraaa
--
-------- INTRODUCTION ----------------------------------------------------------
-- This file contains Global Environment constants that are defined by the engine.
-- ...at least I *think* they are! There's a bit of funny business going on with
-- a function called `global` that sets the global environment's `__index` metamethod
-- which basically says "hey, the provided parameter is a valid key for `_G`."
-- So yeah, have fun.
--
-- NOTE: I assigned sample values to all of these for my convinience.
--------------------------------------------------------------------------------

-- I'm assuming that we, the players, will never have access to the dev branch.
---@type "release"|"dev"|"staging"
BRANCH = "release"

-- I can't tell yet what the other possible values could be. The scripts only
-- ever check for `"PRODUCTION"`. 
-- Based on testing, even my own installation has this set to `"PRODUCTION"`.
---@type "PRODUCTION"
CONFIGURATION = "PRODUCTION"

-- The current working directory of Don't Starve Together.
-- The actual value is set by your installation of the game.
CWD = "C:/Program Files (x86)/Steam/steamapps/common/Don't Starve Together/data"

-- Location of DST mods based on your installation. Used to determine where to
-- load mods from. See `scripts/mods.lua` and `scripts/modutil.lua`.
--
-- The actual value is set by your installation of the game.
-- It seems that this is based on `CWD`, and since `CWD` is the data/ folder,
-- we have to go back one folder to be able to poke at the mods directory.
MODS_ROOT = "../mods"

-- I'm assuming that since `ModWrangler:LoadServerModsFile` checks for `"Rail"`,
-- this is the platform where you got DST from. The other is probably `"Steam"`?
-- see `mods.lua`.
---@type "Steam"|"Rail"
DIST_PLATFORM = "Steam"

-- Your operating system + distribution platform, I think.
-- See `createstringspo.lua`.
-- Find all occurences via regex: \bPLATFORM\b
---@type "WIN32_STEAM"|"LINUX_STEAM"|"OSX_STEAM"|"WIN32_RAIL"|"PS4"|"XBL"
PLATFORM = "WIN32_STEAM"

IS_STEAM_DECK = false

-- This is only `true` when you start up the game. After you load into a world,
-- it's set to `false` presumably to prevent reloading a whole bunch of stuff.
RUN_GLOBAL_INIT = false

-- See `scripts/gamelogic.lua:1037` and `scripts/gamelogic.lua:1235`.
PRINT_TEXTURE_INFO = false
