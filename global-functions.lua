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
-- This is Klei Entertainment's custom implementation of Lua 5.1.4.
-- Source:  https://forums.kleientertainment.com/forums/topic/68404-lua-version/
--
-- Contained in this file are functions defined from the C/C++ side of things,
-- that is these functions are probably defined in the DST Engine itself.
--
-- This file specifically contains functions that can be called directly within
-- the global environment, such as `tostring`, `type`. 
-- It also contains the mostly-Lua-standard libaries such as `os`, `math`, etc.
-- Note that since this is a custom implementation, these libraries don't 100% 
-- line up with Lua's default.
--
-- Lastly, as a disclaimer, the DST Engine is closed source and proprietary.
-- So the best we can do is to infer what these functions do by testing.
--------------------------------------------------------------------------------


-------- GLOBAL FUNCTIONS ------------------------------------------------------
-- Functions here can be called directly from the global environment.
-- Unless the implementation of these is drastically different, I'll omit most
-- of the ones you can already find references for.
--
--
--------------------------------------------------------------------------------
-- For the definition of print, please see `debugprint.lua` as DST doesn't use
-- the default Lua print functions due to the concept of "print loggers".
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
------- DEBUG LIBRARY (the `debug` table) --------------------------------------
-- Most of it is still available.
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


---- KLEI FUNCTIONS ----------------------------------------------------------
-- TODO figure these out...
-- These are function not part of any Lua standard libary, so I'm assuming that 
-- most (if not all!) of these are Klei specific functions.
------------------------------------------------------------------------------

-- I'm unsure what it does, but it returns a function based on `filepath`. 
-- That's all I know. There are 2 optional arguments but I'm not sure what they do.
-- See `main.lua`, `mods.lua`, `modindex.lua` for sample usages.
---@param filepath string
kleiloadlua = function(filepath, ...) 
    print('function: 0000000010626790')
    return function()
    end
end

kleifileexists = function(...) print('function: 00000000106267C0') end
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

DynamicShadow = {
  SetSize = function(...) end, 
  Enable = function(...) end
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
EnvelopeManager = {
  AddFloatEnvelope = function(...) end,
  AddColourEnvelope = function(...) end,
  AddVector2Envelope = function(...) end
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
FontManager = {
  RegisterFont = function(...) end
}
coroutine = {
  resume = function(...) end,
  yield = function(...) end,
  status = function(...) end,
  wrap = function(...) end,
  create = function(...) end,
  running = function(...) end
}

StaticShadow = {SetSize = function(...) end}
PhysicsWaker = {
  StartWakeTests = function(...) end,
  StopWakeTests = function(...) end,
  SetTimeBetweenWakeTests = function(...) end,
  SetMaxPhysicsRadius = function(...) end
}
WaveComponent = {
  SetWaveParams = function(...) end,
  SetWaveEffect = function(...) end,
  Init = function(...) end,
  SetWaveMotion = function(...) end,
  SetWaveTexture = function(...) end,
  SetWaveSize = function(...) end
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
TextEditWidget = {
  EnableScrollEditWindow = function(...) end,
  OnTextInput = function(...) end,
  SetForceUpperCase = function(...) end,
  OnKeyDown = function(...) end,
  SetString = function(...) end,
  OnKeyUp = function(...) end,
  SetPassword = function(...) end,
  GetString = function(...) end,
  GetEditCursorPos = function(...) end,
  SetEditCursorPos = function(...) end
}

bit = {
  band = function(...) end,
  rshift = function(...) end,
  bor = function(...) end,
  bnot = function(...) end,
  bxor = function(...) end,
  lshift = function(...) end
}
TextWidget = {
  EnableWordWrap = function(...) end,
  SetColour = function(...) end,
  SetVAnchor = function(...) end,
  ShowEditCursor = function(...) end,
  HasOverflow = function(...) end,
  SetFont = function(...) end,
  SetHAnchor = function(...) end,
  GetString = function(...) end,
  SetRegionSize = function(...) end,
  GetRegionSize = function(...) end,
  SetString = function(...) end,
  SetEditCursorColour = function(...) end,
  SetSize = function(...) end,
  SetHorizontalSqueeze = function(...) end,
  EnableWhitespaceWrap = function(...) end,
  ResetRegionSize = function(...) end
}
TheLeaderboards = {}
TheItems = ItemServerProxy
ImageWidget = {
  SetUVScale = function(...) end,
  EnableEffectParams2 = function(...) end,
  SetHAnchor = function(...) end,
  SetAlphaRange = function(...) end,
  SetTint = function(...) end,
  SetSize = function(...) end,
  GetSize = function(...) end,
  SetBlendMode = function(...) end,
  SetVAnchor = function(...) end,
  SetTexture = function(...) end,
  SetTextureHandle = function(...) end,
  SetRadiusForRayTraces = function(...) end,
  SetUVMode = function(...) end,
  SetEffect = function(...) end,
  EnableEffectParams = function(...) end,
  SetEffectParams = function(...) end,
  SetEffectParams2 = function(...) end
}
ShadowManager = {
  SetTexture = function(...) end, 
  GenerateStaticShadows = function(...) end
}
UITransform = {
  SetScale = function(...) end,
  SetVAnchor = function(...) end,
  GetWorldPosition = function(...) end,
  SetFacing = function(...) end,
  GetRotation = function(...) end,
  GetLocalPosition = function(...) end,
  GetScale = function(...) end,
  SetPosition = function(...) end,
  SetMaxPropUpscale = function(...) end,
  SetRotation = function(...) end,
  UpdateTransform = function(...) end,
  SetHAnchor = function(...) end,
  ClearScissor = function(...) end,
  SetScissor = function(...) end,
  SetScaleMode = function(...) end
}
Light = {
  SetFalloff = function(...) end,
  GetRadius = function(...) end,
  SetColour = function(...) end,
  Enable = function(...) end,
  GetFalloff = function(...) end,
  GetColour = function(...) end,
  SetIntensity = function(...) end,
  SetRadius = function(...) end,
  SetDisableOnSceneRemoval = function(...) end,
  IsEnabled = function(...) end,
  GetIntensity = function(...) end,
  GetCalculatedRadius = function(...) end,
  GetDisableOnSceneRemoval = function(...) end,
  EnableClientModulation = function(...) end
}
ManifestManager = {
  AddFileToModManifest = function(...) end,
  FileExistsInMod = function(...) end,
  LoadModManifest = function(...) end,
  UnloadModManifest = function(...) end
}
MapExplorer = {
  RecordMap = function(...) end,
  ActivateLocalMiniMap = function(...) end,
  IsTileSeeable = function(...) end,
  IsTileVisited = function(...) end,
  EnableUpdate = function(...) end,
  DeactivateLocalMiniMap = function(...) end,
  RevealArea = function(...) end,
  RecordAllMaps = function(...) end,
  LearnAllMaps = function(...) end,
  LearnRecordedMap = function(...) end
}
TheGameService = {
  AwardAchievement = function(...) end, 
  RegisterAchievement = function(...) end
}
GroundCreepEntity = {SetRadius = function(...) end}
VideoWidget = {
  GetSize = function(...) end,
  SetVAnchor = function(...) end,
  IsDone = function(...) end,
  SetHAnchor = function(...) end,
  Stop = function(...) end,
  SetSize = function(...) end,
  Play = function(...) end,
  Pause = function(...) end,
  Load = function(...) end
}
MapGenSim = {
  DestroyWorld = function(...) end,
  CreateBox = function(...) end,
  CreateCircle = function(...) end,
  UpdateSim = function(...) end,
  GetNodePosition = function(...) end,
  CreateWorld = function(...) end,
  CreateConstraint = function(...) end,
  GetMinimumRadius = function(...) end
}
AccountManager = {
  HasAuthToken = function(...) end,
  VisitAccountPage = function(...) end,
  IsWaitingForResponse = function(...) end,
  RecoverPassword = function(...) end,
  HasSteamTicket = function(...) end,
  CommunicationSucceeded = function(...) end,
  TokenPurpose = function(...) end,
  GetToken = function(...) end,
  CancelLogin = function(...) end,
  MustUpgradeClient = function(...) end,
  AddGameKeyToAccount = function(...) end,
  CreateAccount = function(...) end,
  ValidateToken = function(...) end,
  GetUsername = function(...) end,
  Logout = function(...) end,
  IsBanned = function(...) end,
  Login = function(...) end
}
MapLayerManager = {
  SetPrimaryColor = function(...) end,
  SetSecondaryColor = function(...) end,
  CreateRenderLayer = function(...) end,
  SetSampleStyle = function(...) end,
  SetMinimapColor = function(...) end,
  SetSecondaryColorDusk = function(...) end,
  ReleaseRenderLayer = function(...) end
}
GroundCreep = {
  GetAsString = function(...) end,
  SetUpdateInterval = function(...) end,
  TriggerCreepSpawners = function(...) end,
  GetTriggeredCreepSpawners = function(...) end,
  SetMaxRadius = function(...) end,
  SetFromString = function(...) end,
  AddRenderLayer = function(...) end,
  OnCreep = function(...) end,
  FastForward = function(...) end
}
LightWatcher = {
  SetMinLightThresh = function(...) end,
  SetDarkThresh = function(...) end,
  GetTimeInLight = function(...) end,
  SetLightThresh = function(...) end,
  GetLightValue = function(...) end,
  GetTimeInDark = function(...) end,
  GetLightAngle = function(...) end,
  IsInLight = function(...) end
}
Follower = {
  FollowSymbol = function(...) end, 
  StopFollowing = function(...) end, 
  SetOffset = function(...) end
}
TileGroupManager = {
  SetIsNoiseTileGroup = function(...) end,
  IsImpassableTile = function(...) print('scripts/tilegroups.lua:27') end,
  SetInvalidTile = function(...) end,
  IsInvalidTile = function(...) print('scripts/tilegroups.lua:43') end,
  RemoveInvalidTile = function(...) end,
  SetIsOceanTileGroup = function(...) end,
  AddTileGroup = function(...) end,
  RemoveValidTile = function(...) end,
  SetValidTileRange = function(...) end,
  IsNoiseTile = function(...) print('scripts/tilegroups.lua:51') end,
  SetIsTransparentOceanTileGroup = function(...) end,
  SetIsLandTileGroup = function(...) end,
  AddInvalidTile = function(...) end,
  AddValidTile = function(...) end,
  SetIsImpassableTileGroup = function(...) end,
  IsLandTile = function(...) print('scripts/tilegroups.lua:3') end,
  IsOceanTile = function(...) print('scripts/tilegroups.lua:15') end,
  SetFakeGroundTile = function(...) end,
  SetIsInvalidTileGroup = function(...) end,
  SetDefaultImpassableTile = function(...) end
}
GameService = TheGameService
Account = debug
