-------- FILE INFORMATION ------------------------------------------------------
-- File:    engine-global-functions.lua
-- Author:  Rickzzs
--          This file was originally called "engine.lua".
--          All credit goes to them.
--          I am merely subdividing things into different files and adding comments.
-- Forum:   "Mods and Tools/Tutorials and Guides/"
-- Topic:   "[Documentation] List of all Engine Functions" by Hornet
-- When:    2023, March 5
-- Source:  https://forums.kleientertainment.com/forums/topic/126774-documentation-list-of-all-engine-functions/?do=findComment&comment=1623545
--------------------------------------------------------------------------------


-------- INTRODUCTION ----------------------------------------------------------
-- Klei uses a custom implementation of Lua 5.1.4.
-- Source:  https://forums.kleientertainment.com/forums/topic/68404-lua-version/
--
-- Lua, being an interpreted language, requires another, lower level program to
-- actually execute the code. The standard interpreter is designed to be compiled
-- by a standards-compliant C89 compiler, however C++ is supported.
--
-- For our case, the Don't Starve Together executable is our "interpreter".
-- 
-- From the C side, many primitive functions and libraries are defined.
-- `print`, for example, is one of them. I believe there's a dedicated `print.c`
-- source file in the Lua source code.
-- the functions of the `string` and `table` libraries are defined from the 
-- C side as well.
--
-- This means that Klei's implementation is no different in spirit: they decided
-- to define  functions from their C++ engine and then just expose these functions
-- to the Lua side. However, since the engine is not available to us 
-- (and probably illegal to poke at!), we can't directly look at the source code 
-- to see their exact implementations. What we can do are:
--      1.) Look at DST's Lua scripts to see possible usage. 
--          We can infer parameters and return types, although we have to keep
--          in mind that sometimes, Lua function params can be optional.
--      2.) Test them out ingame.
--          Some engine functions are easily exposed, such as the ones in the
--          `Transform` table. For example, `ThePlayer` has a `Transform` field
--          which is really just the `__index` metamethod which points to the 
--          main `Transform` table. This is sort of object oriented "inheritance".
--
-- So contained in this file are the list of functions defined from C. 
-- The definitions that I *did* fill out are, at best, smart guesses. 
-- Some of them I did test in the past but it can get very tedious to do so.
--
-- This file specifically contains functions that can be called directly within
-- the global environment, such as `tostring`, `type`. 
--
-- For brevity, I won't list out already standard libraries like `os`, `math`, 
-- `string`, `table`, etc. However, these libraries may not 100% line up with
-- Lua 5.1's defaults so I'll try to note where Klei deviates from here.
--
--------------------------------------------------------------------------------


-------- GLOBAL FUNCTIONS ------------------------------------------------------
-- Functions here can be called directly from the global environment.
-- Unless the implementation of these is drastically different, I'll omit most
-- of the ones you can already find references for, like `type`, `tostring`, etc.
--
--
--------------------------------------------------------------------------------
-- For the definition of print, please see `scripts/debugprint.lua` as DST doesn't
-- use the default Lua print functions due to the concept of "print loggers".
--
--
------- OS LIBRARY (the `os` table) --------------------------------------------
-- Only `os.difftime`, `os.date`, `os.time` and `os.clock` are available.
-- Others, like `os.exit` and `os.execute` are not available.
--
--
------- I/O Library (the `io` table) -------------------------------------------
-- We can't make much use of `io.stdout` because DST makes use of different file streams.
-- e.g. `io.stdout:write("message")` won't work properly.
-- It does exist but I think that `stdout` only applies to terminal programs,
-- which clearly DST is not.
--
--
-------- MATH LIBRARY (the `math` table) ---------------------------------------
-- Klei didn't remove any of the `math` methods to my knowledge.
-- They did add some in `scripts/mathutil.lua`:
-- math.diff
-- math.range
-- math.clamp
--
--
-------- STRINGS LIBRARY (the `string` table) ----------------------------------
-- Mostly unchanged but Klei made some additions. See `scripts/util.lua`.
--
--
--------------------------------------------------------------------------------


---- GLOBAL ENGINE FUNCTIONS ---------------------------------------------------
-- TODO figure these out...
-- These functions are not part of any Lua standard libary, so I'm assuming that 
-- most (if not all!) of everything from this point on are Klei specific functions.
--------------------------------------------------------------------------------

-- I'm unsure what it does exactly, but it returns a function based on `filepath`. 
-- That's all I know. There are 2 optional arguments but I'm not sure what they do.
-- See `main.lua`, `mods.lua`, `modindex.lua` for sample usages.
---@param filepath string
kleiloadlua = function(filepath, ...) 
    return function()
        print("Loading", filepath)
    end
end

-- See `kleiloadlua` in `engine-functions.lua`, it seems similar.
---@param filepath string
kleifileexists = function(filepath, ...) 
    print("Checking if", filepath, "exists...")
    return true
end
tracked_assert = function(...) print('function: 0000000010622F50') end
string_search_subwords = function(...) print('function: 0000000010626F10') end

-- Probably have to do with internationalization?
utf8strtoupper = function(...) print('function: 0000000010626910') end
utf8strlen = function(...) print('function: 0000000010626A90') end
utf8strtolower = function(...) print('function: 0000000010626B50') end
utf8substr = function(...) print('function: 0000000010626D60') end

-- be funny if this wasn literally just `function() return {} end`
createTable = function(...) print('function: 0000000010626AC0') end
walltime = function(...) print('function: 00000000106265B0') end
requireeventfile = function(...) print('function: 0000000010626C70') end
toarray = function(...) print('function: 0000000010626C10') end
toarrayornil = function(...) print('function: 0000000010627000') end
perlin = function(...) print('function: 0000000010626940') end
anglediff = function(...) print('function: 0000000010626E80') end
smallhash = function(...) print('function: 0000000010626880') end
newproxy = function(...) print('function: 0000000007460FE0') end
VisitURL = function(...) print('function: 0000000010626CD0') end
hash = function(...) print('function: 0000000010626A00') end
utf8char = function(...) print('function: 0000000010626BE0') end

---- GLOBAL ENGINE TABLES ------------------------------------------------------
-- TODO figure these out...
-- In a similar vein to the Lua standard libaries, Klei packages some C-sided
-- functions into global environment Lua tables.
--
-- The ones you see below are quite short. Other, longer/verbose/complicated ones 
-- (or those that fit into a category) go into separate files. Otherwise, I just
-- cram them in here until I have a good reason not to.
--------------------------------------------------------------------------------

-- Bit manipulation. It's surprisingly useful but Lua 5.1 has out-of-the-box ones.
bit = {
    -- bitwise AND.
    -- I'm guessing we only accept ints, as you can only do sane 
    -- bitwise operations with unsigned integers.
    ---@param a integer
    ---@param b integer
    band = function(a, b) 
        return 0
    end,

    -- Bitwise OR.
    bor = function(...) end,

    -- Bitwise NOT. Just returns all the flipped bits of input `value`.
    bnot = function(value) 
        return 1
    end,
    -- Bitwise XOR.
    bxor = function(...) end,
    rshift = function(...) end,
    lshift = function(value, offset) 
        return 0
    end
}

-- There's `TheNet` and there's `Network`. Okay...
Network = {
    GetUserID = function(...) end,
    IsServerAdmin = function(...) end,
    GetPlayerColour = function(...) end,
    IsPlayingWithFriends = function(...) end,
    SetPlayerSkin = function(...) end,
    SetPlayerAge = function(...) end,
    SetClassifiedTarget = function(...) end,
    GetNetworkID = function(...) end,
    GetUserFlags = function(...) end,
    IsBorrowed = function(...) end,
    GetClientName = function(...) end,
    AddUserFlag = function(...) end,
    SetPlayerEquip = function(...) end,
    GetPlayerAge = function(...) end,
    SetConsecutiveMatch = function(...) end,
    RemoveUserFlag = function(...) end,
    IsConsecutiveMatch = function(...) end
}

Label = {
    SetUIOffset = function(...) end,
    SetText = function(...) end,
    SetColour = function(...) end,
    Enable = function(...) end,
    SetFont = function(...) end,
    SetWorldOffset = function(...) end,
    SetFontSize = function(...) end
}
  
Follower = {
    FollowSymbol = function(...) end, 
    StopFollowing = function(...) end, 
    SetOffset = function(...) end
}


DebugRender = {
    SetZ = function(...) end,
    String = function(...) end,
    Flush = function(...) end,
    Box = function(...) end,
    Line = function(...) end,
    Poly = function(...) end,
    Circle = function(...) end,
    SetRenderLoop = function(...) end,
    Triangle = function(...) end
}

ShadeRenderer = {
    Update = function(...) end,
    SetShadeScaleSpeed = function(...) end,
    Enable = function(...) end,
    SetShadeTexture = function(...) end,
    SetShadeTranslationSpeed = function(...) end,
    RemoveShade = function(...) end,
    SetShadeMaxTranslation = function(...) end,
    SetShadeStrength = function(...) end,
    SetShadeMaxScale = function(...) end,
    SetShadeRotationSpeed = function(...) end,
    CreateShadeType = function(...) end,
    SetShadeMaxRotation = function(...) end,
    SetShadeEnabled = function(...) end,
    SpawnShade = function(...) end
}

SoundEmitter = {
    SetMute = function(...) end,
    PlaySoundWithParams = function(...) end,
    SetParameter = function(...) end,
    KillSound = function(...) end,
    GetEntity = function(...) end,
    PlayingSound = function(...) end,
    PlaySound = function(...) end,
    SetVolume = function(...) end,
    OverrideVolumeMultiplier = function(...) end,
    KillAllSounds = function(...) end
}

ParticleEmitter = {
    SetLayer = function(...) end,
    AddParticle = function(...) end,
    AddRotatingParticleUV = function(...) end,
    SetAcceleration = function(...) end,
    EnableBloomPass = function(...) end,
    SetColourEnvelope = function(...) end,
    GetNumLiveParticles = function(...) end,
    SetSortOrder = function(...) end,
    SetBlendMode = function(...) end,
    SetDragCoefficient = function(...) end,
    SetScaleEnvelope = function(...) end,
    SetUVFrameSize = function(...) end,
    AddRotatingParticle = function(...) end,
    SetMaxNumParticles = function(...) end,
    EnableDepthTest = function(...) end,
    SetSpawnVectors = function(...) end,
    AddParticleUV = function(...) end,
    SetMaxLifetime = function(...) end,
    SetRotationStatus = function(...) end,
    ClearAllParticles = function(...) end,
    SetRenderResources = function(...) end,
    SetRadius = function(...) end,
    FastForward = function(...) end
}

Pathfinder = {
    GetPathTileIndexFromPoint = function(...) end,
    AddWall = function(...) end,
    SubmitSearch = function(...) end,
    KillSearch = function(...) end,
    IsClear = function(...) end,
    HasWall = function(...) end,
    GetSearchResult = function(...) end,
    RemoveWall = function(...) end,
    GetSearchStatus = function(...) end
}

PostProcessor = {
    SetTextureSamplerState = function(...) end,
    SetLunacyEnabled = function(...) print('scripts/postprocesseffects.lua:94') end,
    EnablePostProcessEffect = function(...) end,
    SetDistortionEffectTime = function(...) print('scripts/postprocesseffects.lua:57') end,
    SetEffectUniformVariables = function(...) end,
    SetOverlayBlend = function(...) print('scripts/postprocesseffects.lua:53') end,
    IsDistortionEnabled = function(...) print('scripts/postprocesseffects.lua:90') end,
    AddUniformVariable = function(...) end,
    SetMoonPulseParams = function(...) print('scripts/postprocesseffects.lua:110') end,
    SetDistortionFactor = function(...) print('scripts/postprocesseffects.lua:61') end,
    SetMoonPulseGradingParams = function(...) print('scripts/postprocesseffects.lua:114') end,
    SetColourCubeLerp = function(...) print('scripts/postprocesseffects.lua:35') end,
    SetColourCubeSamplerEffect = function(...) end,
    AddSampler = function(...) end,
    IsBloomEnabled = function(...) print('scripts/postprocesseffects.lua:76') end,
    SetColourModifier = function(...) print('scripts/postprocesseffects.lua:49') end,
    SetBloomSamplerParams = function(...) end,
    AddSamplerEffect = function(...) end,
    SetBasePostProcessEffect = function(...) end,
    SetColourCubeData = function(...) print('scripts/postprocesseffects.lua:22') end,
    SetPostProcessEffectAfter = function(...) end,
    SetSamplerEffectState = function(...) end,
    SetDistortionEnabled = function(...) print('scripts/postprocesseffects.lua:83') end,
    AddPostProcessEffect = function(...) end,
    SetTextureSamplerFilter = function(...) end,
    SetLunacyIntensity = function(...) print('scripts/postprocesseffects.lua:101') end,
    SetBloomEnabled = function(...) print('scripts/postprocesseffects.lua:71') end,
    SetZoomBlurEnabled = function(...) print('scripts/postprocesseffects.lua:106') end,
    SetSamplerEffectFilter = function(...) end,
    SetPostProcessingEnabled = function(...) end,
    SetOverlayTex = function(...) print('scripts/postprocesseffects.lua:45') end,
    SetDistortionRadii = function(...) print('scripts/postprocesseffects.lua:65') end,
    SetUniformVariable = function(...) end,
    SetTextureSampler = function(...) end,
    SetPostProcessEffectBefore = function(...) end,
    AddTextureSampler = function(...) end
}

TwitchOptions = {
    GetChannelName = function(...) end,
    IsInitialized = function(...) end,
    SetBroadcastingEnabled = function(...) end,
    Login = function(...) end,
    SupportedByPlatform = function(...) end,
    Forget = function(...) end,
    SetVisibleChatEnabled = function(...) end,
    GetUserName = function(...) end,
    IsStreaming = function(...) end,
    GetStreamingStateString = function(...) end,
    IsPastInitializedState = function(...) end,
    SaveSettings = function(...) end,
    ToggleStreaming = function(...) end,
    Stop = function(...) end,
    GetBroadcastingEnabled = function(...) end,
    Start = function(...) end,
    GetChannelURL = function(...) end,
    GetVisibleChatEnabled = function(...) end,
    GetStreamingState = function(...) end
}


-- Contains all tables that have "The" in them but are also less than
-- 100 (non blank) lines of code.

TheSystemService = {
    StopDedicatedServers = function(...) end,
    IsStorageAvailable = function(...) end,
    StartDedicatedServers = function(...) end,
    AdjustDisplaySafeArea = function(...) end,
    EnableStorage = function(...) end,
    DidBugReportSucceed = function(...) end,
    EnableAutosave = function(...) end,
    PrepareStorage = function(...) end,
    GetBugReportUserCode = function(...) end,
    ClearLastOperation = function(...) end,
    GotoStorePageROG = function(...) end,
    IsStorageEnabled = function(...) end,
    RetryOperation = function(...) end,
    IsDisplaySafeAreaAdjusted = function(...) end,
    GetLastOperation = function(...) end,
    IsBugReportRunning = function(...) end,
    IsAutosaveEnabled = function(...) end,
    HasFocus = function(...) end,
    OverwriteStorage = function(...) end,
    SetStalling = function(...) end,
    FileBugReport = function(...) end
}

TheGameService = {
    AwardAchievement = function(...) end, 
    RegisterAchievement = function(...) end
}

ItemServerProxy = {
    RedeemCode = function(...) end,
    GetBarterBuyPrice = function(...) end,
    SwapItems = function(...) end,
    BarterLoseItem = function(...) end,
    ReportCrowKidGame = function(...) end,
    ReportRedbirdGame = function(...) end,
    BarterLoseDuplicateItems = function(...) end,
    ReportCrowGame = function(...) end,
    OpenBox = function(...) end,
    GetLevelForWXP = function(...) end,
    StartPurchase = function(...) end,
    GetBarterSellPrice = function(...) end,
    BarterGainItem = function(...) end,
    GetWXPForLevel = function(...) end,
    GetEventStatus = function(...) end,
    GetIAPDefs = function(...) end,
    ReportSnowbirdGame = function(...) end
}

TheInventory = {
    GetLocalCookBook = function(...) end,
    GetVirtualIAPCurrencyAmount = function(...) end,
    GetKleiPointsAmount = function(...) end,
    AddSkinLinkInput = function(...) end,
    ForceLoadOfflineCache = function(...) end,
    ValidateWithSignature = function(...) end,
    LookupSkinname = function(...) end,
    AddSkinDLCInput = function(...) end,
    SetGenericKVValue = function(...) end,
    SetAchievementTempUnlocked = function(...) end,
    GetUnopenedItems = function(...) end,
    StartGetAllItems = function(...) end,
    CheckOwnershipGetLatest = function(...) end,
    GetAllUnlockedAchievements = function(...) end,
    ClearSkinsDataset = function(...) end,
    GetAutoBoxItem = function(...) end,
    GetFullInventory = function(...) end,
    SetCookBookValue = function(...) end,
    AddEmoji = function(...) end,
    AddPlantRegistryKey = function(...) end,
    SetItemOpened = function(...) end,
    GetUnopenedEntitlementItems = function(...) end,
    AddGenericKVKey = function(...) end,
    GetOwnedItemCount = function(...) end,
    HasDownloadedInventory = function(...) end,
    GetWXP = function(...) end,
    SetPlantRegistryValue = function(...) end,
    IsDownloadingInventory = function(...) end,
    AddRestrictedBuildFromLua = function(...) end,
    CancelGetAllItems = function(...) end,
    AddCookBookKey = function(...) end,
    SetLocalVanityItems = function(...) end,
    HasSupportForOfflineSkins = function(...) end,
    GetWXPLevel = function(...) end,
    CheckClientOwnership = function(...) end,
    IsAchievementUnlocked = function(...) end,
    GetLocalPlantRegistry = function(...) end,
    GetCurrencyAmount = function(...) end,
    GetClientGiftCount = function(...) end,
    CheckOwnership = function(...) end,
    GetLocalGenericKV = function(...) end,
    GetOwnedItemCountForCommerce = function(...) end,
    AddSkinSetInput = function(...) end
}

TheShard = {
    IsPlayer = function(...) end,
    IsMigrating = function(...) end,
    IsSecondary = function(...) end,
    SetSecondaryLoading = function(...) end,
    IsMaster = function(...) end,
    GetDefaultShardEnabled = function(...) end,
    StartMigration = function(...) end,
    GetSecondaryShardPlayerCounts = function(...) end,
    GetShardId = function(...) end
}



-- ? Seems to not be referenced anywhere at all.
-- TheLeaderboards = {}

-- Is this actually used? It's present in Rickzzs's `engine.lua` file but I 
-- don't see it used anywhere.
-- Account = debug

