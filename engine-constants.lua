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

-- Branch the current version and build of the game is at. Generally, it's set to
-- `"release"` for us players.
--
-- In `scripts/main.lua:91`, it's used to index into the local `servers` table.
-- However I'm guessing those links are internal? We can't access them it seems.
---@type "release"|"dev"|"staging"
BRANCH = "release"

-- Based on testing, my own installation has this set to `"PRODUCTION"`.
--
-- If there are other possible values, I've yet to see them, All the scripts that
-- used this only ever checked for the string literal `"PRODUCTION"`.
---@type "PRODUCTION"
CONFIGURATION = "PRODUCTION"

-- The current working directory of Don't Starve Together.
--
-- This where the data bundles, assets, sounds, and such are loaded from.
CWD = "C:/Program Files (x86)/Steam/steamapps/common/Don't Starve Together/data"

-- Location of DST mods based on your installation. 
-- Goes back one folder from `CWD` to be able to poke at the mods directory.
--
-- See `scripts/mods.lua` and `scripts/modutil.lua`.
MODS_ROOT = "../mods"

-- String of the Distribution Platform you got DST from.
-- See `ModWrangler:LoadServerModsFile` from `scripts/mods.lua`.
---@type "Steam"|"Rail"
DIST_PLATFORM = "Steam"

-- Your operating system + distribution platform, I think. See `scripts/createstringspo.lua`.
--
-- Find all occurences via regex: `\bPLATFORM\b`
---@type "WIN32_STEAM"|"LINUX_STEAM"|"OSX_STEAM"|"WIN32_RAIL"|"PS4"|"XBL"|"NACL"
PLATFORM = "WIN32_STEAM"

IS_STEAM_DECK = false

-- Only `true` when you start up the game. After you load into a world,
-- is `false` presumably to prevent reloading a whole bunch of stuff.
RUN_GLOBAL_INIT = false

-- See `scripts/gamelogic.lua:1037` and `scripts/gamelogic.lua:1235`.
PRINT_TEXTURE_INFO = false
