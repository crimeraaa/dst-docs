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
    GetMOTDQueryURL = function(...) end,
    Crash = function(...) end,
    Reset = function(...) end,
    Step = function(...) end,
    Hook = function(...) end,

    ----------------------------------------------------------------------------
    ------------------------- ENTITY FUNCTIONS  --------------------------------
    ----------------------------------------------------------------------------

    -- Only referenced in the Lua sided `CreateEntity` function in `main.lua`.
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
    -- For sample usages of the `_tags` parameters, see `scripts/brains/slurtlebrain.lua:71`.
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

    -- Only referenced in `scripts/mainfunctions.lua:389`.
    --
    -- It seems the Lua sided global `SpawnPrefab` is just a wrapper around 
    -- `TheSim:SpawnPrefab`. `TheSim:SpawnPrefab` seems to return a GUID 
    -- which is used to index into the global `Ents` table.
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
    ------------------------------ TIME FUNCTIONS  -----------------------------
    ----------------------------------------------------------------------------

    -- Sets the speed for everything, hence we speed up or slow down the "simulation".
    -- `1` is the normal speed. 
    --
    -- ! WARNING: DO NOT CALL `TheSim:SetTimeScale(0)` UNLESS YOU WANNA FREEZE LMAO
    ---@param multiplier number
    SetTimeScale = function(self, multiplier)
        if multiplier <= 0 then
            print("gg")
        else
            print("Simulation is now at speed ", multiplier)
        end
    end,
    GetTickTime = function(self, ...) end,
    -- Retrives the current time scale, typically as previously set by 
    -- `TheSim:SetTimeScale`. See `engine/TheSim.lua`.
    GetTimeScale = function(self)
        return 1 
    end,
    GetRealTime = function(self, ...) end,
    GetFileModificationTime = function(self, ...) end,

    ----------------------------------------------------------------------------
    -------------------- USER/PLAYER FUNCTIONS AND SETTINGS  --------------------------
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
    -------------------------- DEBUG FUNCTIONS  --------------------------------
    ----------------------------------------------------------------------------

    DebugStringScreen = function(...) end,
    DebugPushJsonMessage = function(...) end,
    ShouldInitDebugger = function(...) end,
    
    ---- DEBUG RENDER
    GetDebugRenderEnabled = function(...) end,
    SetDebugRenderEnabled = function(...) end,

    ---- DEBUG PAUSE
    DebugPause = function(...) end,
    IsDebugPaused = function(...) end,
    ToggleDebugPause = function(...) end,

    ---- DEBUG CAMERA
    SetDebugCameraRotation = function(...) end,
    SetDebugCameraTarget = function(...) end,
    ToggleDebugCamera = function(...) end,

    ---- DEBUG TEXTURES
    ToggleDebugTexture = function(...) end,
    UpdateDebugTexture = function(...) end,

    ---- DEBUG PHYSICS RENDER
    GetDebugPhysicsRenderEnabled = function(...) end,
    SetDebugPhysicsRenderEnabled = function(...) end,
    
    ----------------------------------------------------------------------------
    ------------------------- MEMORY FUNCTIONS  --------------------------------
    ----------------------------------------------------------------------------

    MemTrackerPush = function(...) end,
    MemTrackerPop = function(...) end,
    DumpMemInfo = function(...) end,
    SetMemInfoTrackingInterval = function(...) end,
    SetMemoryTracking = function(...) end,
    DumpMemoryStats = function(...) end,

    ----------------------------------------------------------------------------
    ------------ GENERIC GETTER FUNCTIONS (`Get` prefixed functions) -----------
    ----------------------------------------------------------------------------

    GetSoundVolume = function(self, ...) 
        print("TheSim:GetSoundVolume")
    end,
    GetFPS = function(self, ...) 
        return 30
    end,
    GetPosition = function(self, ...) 
    end,
    GetLightAtPoint = function(...) end,
    GetAmbientColour = function(...) end,
    GetStep = function(...) end,
    GetStashedPlayInstance = function(...) end,
    GetSetting = function(...) end,
    GetBuildDate = function(...) end,
    GetPersistentString = function(...) end,
    GetTick = function(...) end,
    GetScreenSize = function(...) end,
    GetSaveFiles = function(...) end,
    GetAnalogControl = function(...) end,
    GetSaveString = function(...) end,
    GetFolderForCloudSaveSlot = function(...) end,
    GetDigitalControl = function(...) end,
    GetScreenPos = function(...) end,
    GetWindowSize = function(...) end,
    GetLocalSetting = function(...) end,
    GetClipboardData = function(...) end,
    GetMouseButtonState = function(...) end,
    GetDataCollectionSetting = function(...) end,
    GetGroundViewDirection = function(...) end,
    GetStaticTick = function(...) end,
    GetGameID = function(...) end,
    GetNextCloudSaveSlot = function(...) end,
    GetEntityAtScreenPoint = function(...) end,

    ----------------------------------------------------------------------------
    ------------ SETTER FUNCTIONS (`Set` prefixed functions) -------------------
    ----------------------------------------------------------------------------

    SetMOTDTarget = function(...) end,
    SetupFontFallbacks = function(...) end,
    SetAmbientColour = function(...) print('../mods/BrighterDusk/modmain.lua:11') end,
    SetRenderPassDefaultEffect = function(...) end,
    SetLowPassFilter = function(...) end,
    SetInstanceParameters = function(...) end,
    SetCameraUp = function(...) end,
    SetCameraFOV = function(...) end,
    SetSetting = function(...) end,
    SetUIRoot = function(...) end,
    SetPersistentString = function(...) end,
    SetHighPassFilter = function(...) end,
    SetListener = function(...) end,
    SetDataCollectionSetting = function(...) end,
    SetCameraDir = function(...) end,
    SetReverbPreset = function(...) end,
    SetActiveAreaCenterpoint = function(...) end,
    SetErosionTexture = function(...) end,
    SetPersistentStringInClusterSlot = function(...) end,
    SetHoloTexture = function(...) end,
    SetCameraPos = function(...) end,
    SetDLCEnabled = function(...) end,
    SetSoundVolume = function(...) end,

    ----------------------------------------------------------------------------
    ------------------------------- UNDOCUMENTED -------------------------------
    ----------------------------------------------------------------------------
    -- TODO #1: Organize into categories based on name. Should help ease the workload.
    -- TODO #2: you know, actually document these...

    ClearDSP = function(...) end,
    CanReadConfigurationDirectory = function(...) end,
    RenderOneFrame = function(...) end,
    HasEnoughFreeDiskSpace = function(...) end,
    LoadKlumpString = function(...) end,
    DuplicateSlot = function(...) end,
    PrintTextureInfo = function(...) end,
    AppendSaveString = function(...) end,
    WorldPointInPoly = function(...) end,
    LogBulkMetric = function(...) end,
    ZipAndEncodeString = function(...) end,
    SendHardwareStats = function(...) end,
    UpdateDeviceCaps = function(...) end,
    GetPersistentStringInClusterSlot = function(...) end,
    CanWriteConfigurationDirectory = function(...) end,
    ValidateHeap = function(...) end,
    UpdateRenderExtents = function(...) end,
    UnloadFont = function(...) end,
    AddBatchVerifyFileExists = function(...) end,
    SetVisualAmbientColour = function(...) print('../mods/BrighterDusk/modmain.lua:19') end,
    GetNumLaunches = function(...) end,
    DownloadMOTDImages = function(...) end,
    ApplyLocalWordFilter = function(...) end,
    GenerateNewWorld = function(...) end,
    SendUITrigger = function(...) end,
    ErasePersistentString = function(...) end,
    ForceAbort = function(...) end,
    HasValidLogFile = function(...) end,
    LoadFont = function(...) end,
    StashPlayInstance = function(...) end,
    LoadMOTDImage = function(...) end,
    PauseFileExistsAsync = function(...) end,
    ConvertSlotToCloudOrLocal = function(...) end,
    CheckPersistentStringExists = function(...) end,
    CopyLegacySessionToSlot = function(...) end,
    ShouldPlayIntroMovie = function(...) end,
    AdjustFontAdvance = function(...) end,
    DownloadMOTDImage = function(...) end,
    StopAllSounds = function(...) end,
    PrintLoadedTextureInfo = function(...) end,
    AtlasContains = function(...) end,
    TurnOffReverb = function(...) end,
    FinalizeSaveString = function(...) end,
    ProjectScreenPos = function(...) end,
    SendGameStat = function(...) end,
    RegisterFindTags = function(...) end,
    DecodeAndUnzipString = function(...) end,
    OpenSaveFolder = function(...) end,
    AddTextureToStreamingGroup = function(...) end,
    ReportAction = function(...) end,
    TogglePerfGraph = function(...) end,
    StartFileExistsAsync = function(...) end,
    ClearFileSystemAliases = function(...) end,
    DecodeKleiData = function(...) end,
    ClearInput = function(...) end,
    HasMOTDImage = function(...) end,
    ClearAllDSP = function(...) end,
    RemapSoundEvent = function(...) end,
    EnsureShardIndexPathExists = function(...) end,
    HasWindowFocus = function(...) end,
    LoadKlumpFile = function(...) end,
    OnAssetPathResolve = function(...) end,
    VerifyFileExistsAsync = function(...) end,
    InitSaveString = function(...) end,
    HasPlayerSkeletons = function(...) end,
    SendJSMessage = function(...) end,
    AbortFileExistsAsync = function(...) end,
    OpenDocumentsFolder = function(...) end,
    ResetError = function(...) end,
    RemoveLastCommaSaveString = function(...) end,
    PreloadFile = function(...) end,
}
-- TheSim = Sim  
