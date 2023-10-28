-- I couldn't think of another way to arrange them so they're just ordered
-- alphabetically.

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

EnvelopeManager = {
    AddFloatEnvelope = function(...) end,
    AddColourEnvelope = function(...) end,
    AddVector2Envelope = function(...) end
}

FontManager = {
    RegisterFont = function(...) end
}

ManifestManager = {
    AddFileToModManifest = function(...) end,
    FileExistsInMod = function(...) end,
    LoadModManifest = function(...) end,
    UnloadModManifest = function(...) end
}

RoadManager = {
    GenerateQuadTree = function(...) end,
    AddControlPoint = function(...) end,
    SetStripEffect = function(...) end,
    GenerateVB = function(...) end,
    IsOnRoad = function(...) end,
    SetStripTextures = function(...) end,
    SetStripWrapMode = function(...) end,
    BeginRoad = function(...) end,
    SetStripUVAnimStep = function(...) end,
    AddSmoothedControlPoint = function(...) end
}


ShadowManager = {
    SetTexture = function(...) end, 
    GenerateStaticShadows = function(...) end
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
