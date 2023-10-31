-- Shorthand for `TheSimulation`.
--
-- For all functions that have the `self` parameter, this indicates that they
-- can be called with colon notation to implicitly pass the caller as the first param.
--
-- e.g. `TheSim:FindEntities(...)` is equivalent to `TheSim.FindEntities(TheSim, ...)`.
---@class TheSim
TheSim = {
    ----------------------------------------------------------------------------
    ------------------------- GENERIC FUNCTIONS  -------------------------------
    ----------------------------------------------------------------------------

    -- TODO: Test client side first, then server.
    Quit = function(self, ...) end,
    -- The actual Lua `print` function resides here. It writes to `client_log.txt`
    -- but not to the ingame console.
    ---@param self TheSim
    ---@param ... any
    LuaPrint = function(self, ...) 
        print(...)
    end,
    QueryServer = function(self, ...) end,
    -- Can't wait to find out what this does!
    Crash = function(...) end,
    Reset = function(...) end,
    Step = function(...) end,
    Hook = function(...) end,
    DebugPause = function(...) end,
    IsDebugPaused = function(...) end,
    ToggleDebugPause = function(...) end,

    DebugPushJsonMessage = function(...) end,

    -- Called to determine to value of the global boolean `DEBUGGER_ENABLED`,
    -- in `scripts/main.lua:73`.
    --
    -- I'm guessing Klei has an in-house debugger called `debuggee.lua`, 
    -- which why the check for `DEBUGGER_ENABLED` to be true includes:
    -- 1. We are not on a Console Platform.
    -- 2. `CONFIGURATION` is not equal to the string literal `"PRODUCTION"`.
    -- 3. We are not on a dedicated server.
    ShouldInitDebugger = function(self) 
        return false
    end,

    ----------------------------------------------------------------------------
    ----------------------- GENERIC FILE FUNCTIONS  ----------------------------
    ----------------------------------------------------------------------------
    -- ? `LoadUserFile` is in USER/PLAYER functions and settings.

    PauseFileExistsAsync = function(...) end,
    StartFileExistsAsync = function(...) end,
    ClearFileSystemAliases = function(...) end,
    AbortFileExistsAsync = function(...) end,
    VerifyFileExistsAsync = function(...) end,
    LoadKlumpFile = function(...) end,
    PreloadFile = function(...) end,
    GetFileModificationTime = function(self, ...) end,
    
    ----------------------------------------------------------------------------
    -------------------- SAVE-FILE/SAVE-DATA FUNCTIONS  ------------------------
    ----------------------------------------------------------------------------
    -- Unsure if these ALL have to do with save files specifically.

    GetSaveFiles = function(...) end,
    GetSaveString = function(...) end,
    InitSaveString = function(...) end,
    OpenSaveFolder = function(...) end,
    AppendSaveString = function(...) end,
    FinalizeSaveString = function(...) end,
    GetNextCloudSaveSlot = function(...) end,
    GetFolderForCloudSaveSlot = function(...) end,
    RemoveLastCommaSaveString = function(...) end,

    ----------------------------------------------------------------------------
    ------------------------- MAIN MENU FUNCTIONS  -----------------------------
    ----------------------------------------------------------------------------
    
    GetMOTDQueryURL = function(...) end,
    SetMOTDTarget = function(...) end,
    HasMOTDImage = function(...) end,
    LoadMOTDImage = function(...) end,
    DownloadMOTDImages = function(...) end,
    DownloadMOTDImage = function(...) end,
    
    ----------------------------------------------------------------------------
    --------------------------- STRING FUNCTIONS  ------------------------------
    ----------------------------------------------------------------------------
    -- TODO: Probably sort these into topics like "Savedata Functions"

    GetPersistentStringInClusterSlot = function(...) end,
    SetPersistentStringInClusterSlot = function(...) end,
    LoadKlumpString = function(...) end,
    ZipAndEncodeString = function(...) end,
    GetPersistentString = function(...) end,
    SetPersistentString = function(...) end,
    DecodeAndUnzipString = function(...) end,

    
    ----------------------------------------------------------------------------
    ------------------------- ENTITY FUNCTIONS  --------------------------------
    ----------------------------------------------------------------------------

    -- Only referenced in the Lua sided `CreateEntity` function in `scripts/main.lua`.
    --
    -- We see a reference to `ent:GetGUID` which is only found in the `Entity` table.
    --
    -- The `Entity` table, likewise, also consists of C-sided functions.
    --
    -- So perhaps there's metatable business (faux inheritance).
    -- TODO: Figure out if all DST entities have one giant common metatable.
    ---@param self TheSim
    CreateEntity = function(self)
        return setmetatable({}, Entity)
    end,

    -- Returns a table of currently loaded entities. 
    -- It is based on the the given coordinates and its search range is `radius`.
    --
    -- For sample usages of the `_tags` parameters
    --  see `scripts/brains/slurtlebrain.lua:71`.
    -- 
    -- Basically, if you provide them, they help control which entities are included.
    ---@param self TheSim
    ---@param x number 
    ---@param y number 
    ---@param z number
    ---@param radius number Up to how far to check for loaded entites.
    ---@param must_tags? string[]
    ---@param cant_tags? string[]
    ---@param oneof_tags? string[]
    ---@return table
    FindEntities = function(self, x, y, z, radius, must_tags, cant_tags, oneof_tags) 
        return {} 
    end,
    FindFirstEntityWithTag = function(...) end,
    FindEntities_Registered = function(...) end,
    CountEntities = function(...) end,
    GetNumberOfEntities = function(...) end,
    ReskinEntity = function(...) end,
    GetEntitiesAtScreenPoint = function(...) end,
    HideAnimOnEntitiesWithTag = function(...) end,
    ShowAnimOnEntitiesWithTag = function(...) end,

    ----------------------------------------------------------------------------
    ------------------------- PREFAB FUNCTIONS  --------------------------------
    ----------------------------------------------------------------------------

    -- It seems the Lua sided global `SpawnPrefab` (`scripts/mainfunctions.lua:389`) 
    -- is just a wrapper around `TheSim:SpawnPrefab`. 
    --
    -- `TheSim:SpawnPrefab` returns a GUID we is used to index into the global 
    -- `Ents` table.
    ---@param self TheSim
    ---@param name string
    ---@param skin? string
    ---@param skin_id? any
    ---@param creator? any
    SpawnPrefab = function(self, name, skin, skin_id, creator)
        return 123456
    end,
    LoadPrefabs = function(...) end,
    UnloadPrefabs = function(...) end,
    RegisterPrefab = function(...) end,
    UnloadAllPrefabs = function(...) end,
    UnregisterPrefabs = function(...) end,
    UnregisterAllPrefabs = function(...) end,
    
    ----------------------------------------------------------------------------
    ------------------------ SOUNDS/SFX FUNCTIONS  -----------------------------
    ----------------------------------------------------------------------------

    -- Sample usage in `scripts/main.lua:94`
    ---@param self TheSim
    ---@param preset string|"default"
    SetReverbPreset = function(self, preset) 
        print("Setting reverb preset to ", preset)
    end,

    TurnOffReverb = function(...) end,
    GetSoundVolume = function(self, ...) end,
    SetSoundVolume = function(...) end,
    RemapSoundEvent = function(...) end,
    StopAllSounds = function(...) end,

    ----------------------------------------------------------------------------
    ------------------------- TICK/TIME FUNCTIONS  -----------------------------
    ----------------------------------------------------------------------------

    -- Sets the speed for everything, hence we speed up or slow down the "simulation".
    -- `1` is the normal speed. 
    --
    -- ! WARNING: DO NOT CALL `TheSim:SetTimeScale(0)` UNLESS YOU WANNA FREEZE LMAO
    ---@param multiplier number
    SetTimeScale = function(self, multiplier)
        -- zero and negative multipliers (probably) kill your game
        if multiplier <= 0 then
            print("gg")
        else
            print("Simulation is now at speed ", multiplier)
        end
    end,

    -- Retrieves the current tick rate. I believe DST's default is 15/second?
    GetTickTime = function(self, ...) 
        return 15
    end,

    -- Retrives the current time scale, typically as previously set by 
    -- `TheSim:SetTimeScale`. See `engine/TheSim.lua`.
    GetTimeScale = function(self)
        return 1 
    end,
    GetRealTime = function(self, ...) end,
    GetTick = function(...) end,
    GetStaticTick = function(...) end,

    ----------------------------------------------------------------------------
    -------------------- USER/PLAYER FUNCTIONS AND SETTINGS  -------------------
    ----------------------------------------------------------------------------
    
    ---@param self TheSim
    ---@param ... any
    GetUsersName = function(self, ...) end,
    GetUserHasLicenseForApp = function(self, ...) end,
    UserChooseDirectory = function(self, ...) end,
    LoadUserFile = function(self, ...) end,
    GetUserPresetFiles = function(self, ...) end,
    IsLoggedOn = function(self, ...) end,
    IsDLCEnabled = function(self, ...) end,
    IsKeyDown = function(self, ...) end,
    IsPlaying = function(self, ...) end,
    RequestPlayerID = function(self, ...) end,
    IsBorrowed = function(self, ...) end,
    IsDLCInstalled = function(self, ...) end,
    IsDataCollectionDisabled = function(self, ...) end,
    Profile = function(self, ...) end,
    SendProfileStats = function(self, ...) end,
    ProfilerPush = function(self, ...) end,
    ProfilerPop = function(self, ...) end,
    ToggleDataProfiler = function(self, ...) end,
    ToggleFrameProfiler = function(self, ...) end,
    
    ---- PERFORMANCE
    IsNetbookMode = function(self, ...) end,
    SetNetbookMode = function(self, ...) end,
    ---- STEAM
    IsSteamChinaClient = function(self, ...) end,
    GetSteamAppID = function(self, ...) end,
    GetSteamBetaBranchName = function(self, ...) end,
    GetSteamIDNumber = function(self, ...) end,
    
    ----------------------------------------------------------------------------
    -------------------------- SCREEN FUNCTIONS --------------------------------
    ----------------------------------------------------------------------------

    GetScreenSize = function(...) end,
    GetScreenPos = function(...) end,
    ProjectScreenPos = function(...) end,
    DebugStringScreen = function(...) end,
    GetEntityAtScreenPoint = function(...) end,

    ----------------------------------------------------------------------------
    -------------------------- CAMERA FUNCTIONS --------------------------------
    ----------------------------------------------------------------------------
    -- TODO: Determine differences between this and the Lua sided `TheCamera`.

    -- See `FollowCamera:Apply` (`scripts/followcamera.lua:218`) for sample usage.
    SetCameraUp = function(...) end,
    SetCameraFOV = function(...) end,
    -- See `FollowCamera:Apply` (`scripts/followcamera.lua:205`) for sample usage.
    SetCameraDir = function(...) end,
    -- See `FollowCamera:Apply` (`scripts/followcamera.lua:200`) for sample usage.
    SetCameraPos = function(...) end,
    SetDebugCameraRotation = function(...) end,
    SetDebugCameraTarget = function(...) end,
    ToggleDebugCamera = function(...) end,

    ----------------------------------------------------------------------------
    -------------------------- RENDER FUNCTIONS --------------------------------
    ----------------------------------------------------------------------------

    RenderOneFrame = function(...) end,
    SetRenderPassDefaultEffect = function(...) end,
    GetDebugRenderEnabled = function(...) end,
    SetDebugRenderEnabled = function(...) end,
    UpdateRenderExtents = function(...) end,
    GetDebugPhysicsRenderEnabled = function(...) end,
    SetDebugPhysicsRenderEnabled = function(...) end,

    ----------------------------------------------------------------------------
    -------------------------- TEXTURE FUNCTIONS -------------------------------
    ----------------------------------------------------------------------------

    AddTextureToStreamingGroup = function(...) end,
    PrintTextureInfo = function(...) end,
    SetHoloTexture = function(...) end,
    SetErosionTexture = function(...) end,
    ToggleDebugTexture = function(...) end,
    UpdateDebugTexture = function(...) end,

    ----------------------------------------------------------------------------
    ------------------------ WORKSHOP AND MOD FUNCTIONS  -----------------------
    ----------------------------------------------------------------------------

    UpdateWorkshopMod = function(...) end,
    GetWorkshopVersion = function(...) end,
    StartWorkshopQuery = function(...) end,
    ---- MOD DIRECTORIES
    TryLockModDir = function(...) end,
    LockModDir = function(...) end,
    UnlockModDir = function(...) end,
    -- Returns a list of mod names. Probably as strings?
    -- I think these are of ALL installed mods, both local and workshop.
    ---@param self TheSim
    ---@return string[]
    GetModDirectoryNames = function(self) 
        return {}
    end,
    VerifyModVersions = function(...) end,
    QueryTopMods = function(...) end,
    CleanAllMods = function(...) end,
    GetClientModsDownloading = function(...) end,
    GetServerModsDownloading = function(...) end,
    ShouldWarnModsLoaded = function(...) end,
    SubscribeToMod = function(...) end,
    StartDownloadTempMods = function(...) end,
    GetWorkshopVersionCompatible = function(...) end,
    QueryWorkshopModName = function(self, ...) end,
    QueueDownloadTempMod = function(...) end,
    
    ----------------------------------------------------------------------------
    ------------------------- MEMORY FUNCTIONS  --------------------------------
    ----------------------------------------------------------------------------

    MemTrackerPush = function(...) end,
    MemTrackerPop = function(...) end,
    DumpMemInfo = function(...) end,
    SetMemInfoTrackingInterval = function(...) end,
    SetMemoryTracking = function(...) end,
    DumpMemoryStats = function(...) end,
    ValidateHeap = function(...) end,

    ----------------------------------------------------------------------------
    -------------------- UNCATEGORIZED GETTER FUNCTIONS ------------------------
    ----------------------------------------------------------------------------
    -- TODO: Organize these further, there may be ones we can "group" together.

    -- Self-explanatory, but still need to find a category for it.
    GetFPS = function(self, ...) 
        return 30
    end,

    -- `c_remote` (`scripts/consolecommands.lua:201`)
    --
    -- Seems to return `x, y, z` coordinates of some kind.
    --
    -- TODO: How different is this from `Transform.GetWorldPosition`?
    GetPosition = function(self, ...) 
        return 129.37, 341.90, 100.89
    end,

    GetLightAtPoint = function(...) end,
    GetAmbientColour = function(...) end,
    GetStep = function(...) end,
    GetStashedPlayInstance = function(...) end,
    GetSetting = function(...) end,
    GetBuildDate = function(...) end,
    GetAnalogControl = function(...) end,

    GetDigitalControl = function(...) end,
    GetWindowSize = function(...) end,
    GetLocalSetting = function(...) end,
    GetClipboardData = function(...) end,
    GetMouseButtonState = function(...) end,
    GetDataCollectionSetting = function(...) end,
    GetGroundViewDirection = function(...) end,
    GetGameID = function(...) end,

    ----------------------------------------------------------------------------
    -------------------- UNCATEGORIZED SETTER FUNCTIONS ------------------------
    ----------------------------------------------------------------------------
    
    SetupFontFallbacks = function(...) end,
    SetAmbientColour = function(...) print('../mods/BrighterDusk/modmain.lua:11') end,
    SetLowPassFilter = function(...) end,
    SetInstanceParameters = function(...) end,
    SetSetting = function(...) end,
    SetUIRoot = function(...) end,
    SetHighPassFilter = function(...) end,
    SetListener = function(...) end,
    SetDataCollectionSetting = function(...) end,
    SetActiveAreaCenterpoint = function(...) end,
    SetDLCEnabled = function(...) end,

    -- TODO: Organize everything below into categories, somehow...

    ClearDSP = function(...) end,
    CanReadConfigurationDirectory = function(...) end,
    HasEnoughFreeDiskSpace = function(...) end,
    DuplicateSlot = function(...) end,
    WorldPointInPoly = function(...) end,
    LogBulkMetric = function(...) end,
    SendHardwareStats = function(...) end,
    UpdateDeviceCaps = function(...) end,
    CanWriteConfigurationDirectory = function(...) end,
    UnloadFont = function(...) end,
    AddBatchVerifyFileExists = function(...) end,
    SetVisualAmbientColour = function(...) print('../mods/BrighterDusk/modmain.lua:19') end,
    GetNumLaunches = function(...) end,
    ApplyLocalWordFilter = function(...) end,
    GenerateNewWorld = function(...) end,
    SendUITrigger = function(...) end,
    ErasePersistentString = function(...) end,
    ForceAbort = function(...) end,
    HasValidLogFile = function(...) end,
    LoadFont = function(...) end,
    StashPlayInstance = function(...) end,
    ConvertSlotToCloudOrLocal = function(...) end,
    CheckPersistentStringExists = function(...) end,
    CopyLegacySessionToSlot = function(...) end,
    ShouldPlayIntroMovie = function(...) end,
    AdjustFontAdvance = function(...) end,
    PrintLoadedTextureInfo = function(...) end,
    AtlasContains = function(...) end,
    SendGameStat = function(...) end,
    RegisterFindTags = function(...) end,
    ReportAction = function(...) end,
    TogglePerfGraph = function(...) end,
    DecodeKleiData = function(...) end,
    ClearInput = function(...) end,
    ClearAllDSP = function(...) end,
    EnsureShardIndexPathExists = function(...) end,
    HasWindowFocus = function(...) end,
    OnAssetPathResolve = function(...) end,
    HasPlayerSkeletons = function(...) end,
    SendJSMessage = function(...) end,
    OpenDocumentsFolder = function(...) end,
    ResetError = function(...) end,
}
-- TheSim = Sim  
