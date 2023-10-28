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
---@type "RELEASE"|"PRODUCTION"
CONFIGURATION = "RELEASE"

-- The current working directory of Don't Starve Together.
-- The actual value is set by your installation of the game.
CWD = "C:/Program Files (x86)/Steam/steamapps/common/Don't Starve Together/data"

-- Location of DST mods based on your installation. 
-- The actual value is set by your installation of the game.
MODS_ROOT = "C:/Program Files (x86)/Steam/steamapps/common/Don't Starve Together/mods"

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
