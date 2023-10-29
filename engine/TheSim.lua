-- For all functions that have the `self` parameter, this indicates that they
-- can be called with colon notation to implicitly pass the caller as the first param.
--
-- e.g. `TheSim:FindEntities(...)` is equivalent to `TheSim.FindEntities(TheSim, ...)`.
---@class TheSim
TheSim = {
    -- Only referenced in the Lua sided `CreateEntity` function in `main.lua`.
    -- We see a reference to `ent:GetGUID` is only found in the C facing `Entity` table.
    -- So perhaps there's metatable business (faux inheritance).
    -- TODO: Figure out if all DST entities have one giant common metatable.
    ---@param self TheSim
    CreateEntity = function(self)
        return setmetatable({}, Entity)
    end,

    -- Returns a list of mod names. Probably as strings?
    -- I think these are of ALL installed mods, both local and workshop.
    ---@param self TheSim
    ---@return string[]
    GetModDirectoryNames = function(self) 
        return {}
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

    -- The actual Lua `print` function resides here. It prints to `client_log.txt`
    -- but not to the ingame console.
    ---@param self TheSim
    ---@param ... any
    LuaPrint = function(self, ...) 
    end,

    -- Only referenced in `scripts/mainfunctions.lua:389`.
    -- It seems the Lua sided global `SpawnPrefab` is just a wrapper around 
    -- `TheSim:SpawnPrefab`.
    ---@param self TheSim
    ---@param name string
    ---@param skin? string
    ---@param skin_id? any
    ---@param creator? any
    SpawnPrefab = function(self, name, skin, skin_id, creator)
        -- don't mind me just writing out my scripts here because yeah
        local fn_name, fn_proper
        
        -- Need to poke at GetAllItemCategories since it's an upvalue
        for i = 1, debug.getinfo(_G.IsItemId).nups do
            ---@type string, fun():table
            fn_name, fn_proper = debug.getupvalue(_G.IsItemId, i)
            if fn_name == "GetAllItemCategories" then
                break
            end
        end

        if not fn_proper then
            return
        end

        local item_categories = fn_proper()
        -- category #4 is the shortest at 14 elems, #1 has like 5900 xd
        for k, v in pairs(item_categories[4]) do
            print(k, type(k), "\t", v, type(v))
        end
    end,

    -- Sets the speed for everything, hence we speed up or slow down the "simulation".
    -- WARNING: DO NOT CALL `TheSim:SetTimeScale(0)` UNLESS YOU WANNA FREEZE LMAO
    ---@param multiplier number
    SetTimeScale = function(self, multiplier)
        if multiplier == 0 then
            print("gg")
        else
            if multiplier > 0 then
                print("Speeding up simulation by", multiplier, "times...")
            else
                print("Slowing down simulation by", multiplier, "times...")
            end
        end
    end,

    -- Retrives the current time scale, typically as previously set by 
    -- `TheSim:SetTimeScale`. See `engine/TheSim.lua:53`.
    GetTimeScale = function(self)
        return 1 
    end,

    -------- UNDOCUMENTED ------------------------------------------------------
    -- TODO: you know, actually document these...

    GetSoundVolume = function(...) end,
    SetMOTDTarget = function(...) end,
    ClearDSP = function(...) end,
    IsDLCEnabled = function(...) end,
    CanReadConfigurationDirectory = function(...) end,
    SetNetbookMode = function(...) end,
    GetFileModificationTime = function(...) end,
    SetupFontFallbacks = function(...) end,
    GetLightAtPoint = function(...) end,
    RenderOneFrame = function(...) end,
    GetClientModsDownloading = function(...) end,
    ReskinEntity = function(...) end,
    Crash = function(...) end,
    SetMemInfoTrackingInterval = function(...) end,
    VerifyModVersions = function(...) end,
    SetAmbientColour = function(...) print('../mods/BrighterDusk/modmain.lua:11') end,
    SetRenderPassDefaultEffect = function(...) end,
    QueryWorkshopModName = function(...) end,
    UnloadAllPrefabs = function(...) end,
    SetDebugPhysicsRenderEnabled = function(...) end,
    HasEnoughFreeDiskSpace = function(...) end,
    GetEntitiesAtScreenPoint = function(...) end,
    LoadKlumpString = function(...) end,
    GetAmbientColour = function(...) end,
    DuplicateSlot = function(...) end,
    PrintTextureInfo = function(...) end,
    ToggleDebugTexture = function(...) end,
    AppendSaveString = function(...) end,
    GetTickTime = function(...) end,
    WorldPointInPoly = function(...) end,
    LogBulkMetric = function(...) end,
    GetDebugPhysicsRenderEnabled = function(...) end,
    DumpMemInfo = function(...) end,
    ZipAndEncodeString = function(...) end,
    FindEntities_Registered = function(...) end,
    SendProfileStats = function(...) end,
    SetLowPassFilter = function(...) end,
    MemTrackerPush = function(...) end,
    SendHardwareStats = function(...) end,
    SetInstanceParameters = function(...) end,
    IsLoggedOn = function(...) end,
    UpdateDeviceCaps = function(...) end,
    GetMOTDQueryURL = function(...) end,
    SetCameraUp = function(...) end,
    GetStep = function(...) end,
    GetStashedPlayInstance = function(...) end,
    GetSteamAppID = function(...) end,
    LockModDir = function(...) end,
    SetCameraFOV = function(...) end,
    CountEntities = function(...) end,
    GetPersistentStringInClusterSlot = function(...) end,
    CanWriteConfigurationDirectory = function(...) end,
    GetNextCloudSaveSlot = function(...) end,
    ValidateHeap = function(...) end,
    UpdateRenderExtents = function(...) end,
    GetFPS = function(...) end,
    FindFirstEntityWithTag = function(...) end,
    IsDebugPaused = function(...) end,
    UnloadFont = function(...) end,
    SetSetting = function(...) end,
    UnregisterAllPrefabs = function(...) print('../mods/HuaWenZhongS/modmain.lua:64') end,
    ToggleDebugCamera = function(...) end,
    AddBatchVerifyFileExists = function(...) end,
    GetSetting = function(...) end,
    GetBuildDate = function(...) end,
    SetVisualAmbientColour = function(...) print('../mods/BrighterDusk/modmain.lua:19') end,
    IsKeyDown = function(...) end,
    GetNumLaunches = function(...) end,
    UnregisterPrefabs = function(...) end,
    DownloadMOTDImages = function(...) end,
    ApplyLocalWordFilter = function(...) end,
    GenerateNewWorld = function(...) end,
    DumpMemoryStats = function(...) end,
    SendUITrigger = function(...) end,
    GetPersistentString = function(...) end,
    GetTick = function(...) end,
    DebugPause = function(...) end,
    UnloadPrefabs = function(...) end,
    Profile = function(...) end,
    ErasePersistentString = function(...) end,
    ForceAbort = function(...) end,
    DebugPushJsonMessage = function(...) end,
    StartWorkshopQuery = function(...) end,
    StartDownloadTempMods = function(...) end,
    IsDLCInstalled = function(...) end,
    Reset = function(...) end,
    GetEntityAtScreenPoint = function(...) end,
    GetScreenSize = function(...) end,
    HasValidLogFile = function(...) end,
    ToggleDataProfiler = function(...) end,
    SetUIRoot = function(...) end,
    LoadFont = function(...) end,
    GetSaveFiles = function(...) end,
    ToggleFrameProfiler = function(...) end,
    GetNumberOfEntities = function(...) end,
    QueryServer = function(...) end,
    RegisterPrefab = function(...) end,
    StashPlayInstance = function(...) end,
    SetPersistentString = function(...) end,
    LoadMOTDImage = function(...) end,
    GetAnalogControl = function(...) end,
    PauseFileExistsAsync = function(...) end,
    ConvertSlotToCloudOrLocal = function(...) end,
    CheckPersistentStringExists = function(...) end,
    IsBorrowed = function(...) end,
    GetSaveString = function(...) end,
    CopyLegacySessionToSlot = function(...) end,
    ShouldPlayIntroMovie = function(...) end,
    GetFolderForCloudSaveSlot = function(...) end,
    AdjustFontAdvance = function(...) end,
    SetHighPassFilter = function(...) end,
    SetListener = function(...) end,
    DownloadMOTDImage = function(...) end,
    IsPlaying = function(...) end,
    StopAllSounds = function(...) end,
    UserChooseDirectory = function(...) end,
    GetRealTime = function(...) end,
    SetDataCollectionSetting = function(...) end,
    SetCameraDir = function(...) end,
    GetDigitalControl = function(...) end,
    PrintLoadedTextureInfo = function(...) end,
    LoadUserFile = function(...) end,
    AtlasContains = function(...) end,
    Step = function(...) end,
    TurnOffReverb = function(...) end,
    GetScreenPos = function(...) end,
    LoadPrefabs = function(...) end,
    GetWindowSize = function(...) end,
    GetMouseButtonState = function(...) end,
    UnlockModDir = function(...) end,
    GetLocalSetting = function(...) end,
    GetClipboardData = function(...) end,
    SetReverbPreset = function(...) end,
    FinalizeSaveString = function(...) end,
    ProjectScreenPos = function(...) end,
    Hook = function(...) end,
    SubscribeToMod = function(...) end,
    GetDataCollectionSetting = function(...) end,
    SetActiveAreaCenterpoint = function(...) end,
    SendGameStat = function(...) end,
    GetSteamBetaBranchName = function(...) end,
    RegisterFindTags = function(...) end,
    DecodeAndUnzipString = function(...) end,
    TryLockModDir = function(...) end,
    OpenSaveFolder = function(...) end,
    AddTextureToStreamingGroup = function(...) end,
    ReportAction = function(...) end,
    UpdateWorkshopMod = function(...) end,
    IsDataCollectionDisabled = function(...) end,
    TogglePerfGraph = function(...) end,
    GetWorkshopVersion = function(...) end,
    ToggleDebugPause = function(...) end,
    StartFileExistsAsync = function(...) end,
    QueryTopMods = function(...) end,
    ClearFileSystemAliases = function(...) end,
    SetErosionTexture = function(...) end,
    GetDebugRenderEnabled = function(...) end,
    ProfilerPop = function(...) end,
    DecodeKleiData = function(...) end,
    ProfilerPush = function(...) end,
    SetPersistentStringInClusterSlot = function(...) end,
    ClearInput = function(...) end,
    HasMOTDImage = function(...) end,
    ClearAllDSP = function(...) end,
    SetHoloTexture = function(...) end,
    
    RemapSoundEvent = function(...) end,
    UpdateDebugTexture = function(...) end,
    SetDebugRenderEnabled = function(...) end,
    GetServerModsDownloading = function(...) end,
    EnsureShardIndexPathExists = function(...) end,
    HasWindowFocus = function(...) end,
    MemTrackerPop = function(...) end,
    CleanAllMods = function(...) end,
    GetUsersName = function(...) end,
    SetDebugCameraRotation = function(...) end,
    LoadKlumpFile = function(...) end,
    SetCameraPos = function(...) end,
    HideAnimOnEntitiesWithTag = function(...) end,
    GetSteamIDNumber = function(...) end,
    GetGroundViewDirection = function(...) end,
    OnAssetPathResolve = function(...) end,
    VerifyFileExistsAsync = function(...) end,
    RequestPlayerID = function(...) end,
    SetDebugCameraTarget = function(...) end,
    GetStaticTick = function(...) end,
    SetMemoryTracking = function(...) end,
    ShouldInitDebugger = function(...) end,
    GetUserPresetFiles = function(...) end,
    SetDLCEnabled = function(...) end,
    DebugStringScreen = function(...) end,
    InitSaveString = function(...) end,
    HasPlayerSkeletons = function(...) end,
    QueueDownloadTempMod = function(...) end,
    IsNetbookMode = function(...) end,
    Quit = function(...) end,
    GetUserHasLicenseForApp = function(...) end,
    SendJSMessage = function(...) end,
    AbortFileExistsAsync = function(...) end,
    SetSoundVolume = function(...) end,
    OpenDocumentsFolder = function(...) end,
    GetWorkshopVersionCompatible = function(...) end,
    ShouldWarnModsLoaded = function(...) end,
    ResetError = function(...) end,
    RemoveLastCommaSaveString = function(...) end,
    GetGameID = function(...) end,
    IsSteamChinaClient = function(...) end,
    GetPosition = function(...) end,
    PreloadFile = function(...) end,
    ShowAnimOnEntitiesWithTag = function(...) end
}
-- TheSim = Sim  
