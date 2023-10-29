-- Is of type `userdata` ingame.
---@class TheNet
TheNet = {

    ----------------------------------------------------------------------------
    ----------------------- GENERAL PURPOSE FUNCTIONS --------------------------
    ----------------------------------------------------------------------------

    -- Sends a message to chat, e.g. `TheNet:say("Hi mom!")` will be sent to global chat.
    -- The message will come from your account because your instance of TheNet
    -- will use your Klei ID.
    ---@param self TheNet
    ---@param msg string
    ---@param do_whisper? boolean Pass `true` to whisper. Omit or pass `false` for global chat.
    Say = function(self, msg, do_whisper, ...)
        -- `nil` or `false`
        if not do_whisper then
            print("whispering:", msg)
        else 
            print("global chat:", msg)
        end
    end,

    -- Sends a message to global chat but shows it as coming from the server
    -- rather than any one player.
    --
    -- If you want to do a periodic announce please see `c_announce`
    -- as defined in `scripts/consolecommands.lua`.
    ---@param self any
    ---@param msg string
    ---@param unknown1? any See `scripts/consolecommands.lua:59`.
    ---@param unknown2? any I can't figure out why these 2 are here.
    ---@param category? string The command only checks for the string "system".
    Announce = function(self, msg, unknown1, unknown2, category) 
        print("Server Announcement: ", msg)
        print("Got", unknown1, unknown2, category)
    end,

    -- Note that you cannot kick server admins.
    -- TODO: Determine if need index into `AllPlayers` or Klei ID.
    Kick = function(self, userid)
        print("Kicked", userid, "from the game.") 
    end,

    -- Note that you cannot ban server admins.
    Ban = function(self, userid) 
        print("Banned", userid, "from the game.") 
    end,

    ----------------------------------------------------------------------------
    ------------ GETTER FUNCTIONS (`Get` prefixed functions) -------------------
    ----------------------------------------------------------------------------

    -- Returns `true` for the current session if:
    --
    --1.) You are hosting a world directly from DST and playing on it.
    --
    --2.) You ran this command on the primary/master shard's dedicated server terminal.
    --
    -- Otherwise, you'll get back `false`.
    GetIsMasterSimulation = function(self) 
        return true
    end,

    GetLocalUserName = function(self) 
        return "(your username)"
    end,

    -- Returns a table of players and some basic information about them.
    -- Only returns a non-empty table when currently in a world.
    -- Note that the dedicated server itself may also be included here.
    -- TODO: Figure out the differences between remote and local invocations.
    GetClientTable = function(self) 
        return {
            -- Sample table of a dedicated server. If you're using a dedicated
            -- server, then the "player" named "[Host]" will always come first.
            [1] = {
                name = "[Host]",
                prefab = "",
                userflags = 0,
                userid = "KU_########",
                muted = false,
                admin = true,
                equip = {},
                eventlevel = 0,
                friend = false,
                lobbycharacter = "",
                performance = 0,
                playerage = 0,
                skillselection = {0},
                vanity = {},
                colour = {
                    0.8039,
                    0.3098,
                    0.2235,
                    1
                }
            },
            -- Sample table of me playing as Wigfrid.
            [2] = {
                name = "Crimeraaa",
                prefab = "wathgrithr",
                lobbycharacter = "",
                -- You can mute people from the player list, 
                -- press the `TAB` key to see your options.
                muted = false,
                netid = 123456789,
                userid = "Ku_########",
                admin = true,
                base_skin = "wathgrithr_yule",
                body_skin = "body_willow_yule",
                feet_skin = "feet_willow_ice",
                -- [1] = background portrait, [2] = profile icon.
                vanity = {
                    "playerportrait_bg_panflutean",
                    "profileflair_spider"
                },

                -- Probably RGBA values, I'm fairly certain [4] = alpha channel
                colour = {
                    0.8039, 
                    0.3098, 
                    0.2235, 
                    1       -- makes sense for 1 to mean 100% (opacity)
                },

                --[1]: backpack slot, 
                --[2]: head clothing
                --[3]: I don't know what this is used for, 
                --[3]: equipped hand item
                equip = {
                    "krampus_sack",
                    "rainhat_flopper",
                    "",
                    "cane_ancient"
                },

                -- I assume this has to do with skill trees.
                skillselection = {0},

                -- What could this be doing?
                eventlevel = 0,
                userflags = 0,
                friend = true,

            },
        }
    end,

    -- See `c_netstats()` defined in `scripts/consolecommands.lua` for sample usage.
    -- Other than that, I have no idea what this does. It just returns an empty table
    -- regardless if I'm ingame or not, or on a dedicated server or not.
    GetNetworkStatistics = function(self) 
        return {}
    end,

    ----------------------------------------------------------------------------
    ------------ SETTER FUNCTIONS (`Set` prefixed functions) -------------------
    ----------------------------------------------------------------------------

    ---- UNDOCUMENTED ----------------------------------------------------------
    -- TODO: You know, actually figure out what these take and what they return...

    GetServerLANOnly = function(...) end,
    SetAllowNewPlayersToConnect = function(...) end,
    SetIsWorldSaving = function(...) end,
    GetDefaultMaxPlayers = function(...) end,
    SetIsMatchStarting = function(...) end,
    ServerModSetup = function(...) end,
    PrintNetwork = function(...) end,
    SetDefaultMaxPlayers = function(...) end,
    StartWorldSave = function(...) end,
    SetDefaultGameMode = function(...) end,
    GetClientMetricsForUser = function(...) end,
    GetServerIsClientHosted = function(...) end,
    TruncateSnapshotsInClusterSlot = function(...) end,
    SystemMessage = function(...) end,
    GetChildProcessError = function(...) end,
    SendRPCToClient = function(...) end,
    DownloadServerDetails = function(...) end,
    GetCurrentSnapshot = function(...) end,
    SearchLANServers = function(...) end,
    GetDefaultGameMode = function(...) end,
    Disconnect = function(...) end,
    GetDefaultServerName = function(...) end,
    GetAveragePing = function(...) end,
    IsSearchingServers = function(...) end,
    IsClanIDValid = function(...) end,
    GetUserSessionFileInClusterSlot = function(...) end,
    SearchServers = function(...) end,
    DeleteUserSession = function(...) end,
    BeginSession = function(...) end,
    GetNetIdForUser = function(...) end,
    GetDefaultEncodeUserPath = function(...) end,
    CallShardRPC = function(...) end,
    SetDefaultLANOnlyServer = function(...) end,
    Talker = function(...) end,
    GetServerListings = function(...) end,
    StartServer = function(...) end,
    SetServerPaused = function(...) end,
    DownloadServerMods = function(...) end,
    GetCloudServerId = function(...) end,
    EndWorldSave = function(...) end,
    GetUserID = function(...) end,
    GetLanguageCode = function(...) end,
    OldJoinServerResponse = function(...) print('../mods/workshop-2650755381/modmain.lua:157') end,
    IsWhiteListed = function(...) end,
    AutoJoinLanServer = function(...) end,
    GetWorldSessionFileInClusterSlot = function(...) end,

    SetServerPlaystyle = function(...) end,
    NotifyAuthenticationFailure = function(...) end,
    SetCloudServerInitiatorUserId = function(...) end,
    GetBlacklist = function(...) end,
    GetServerListingReadDirty = function(...) end,
    SendModRPCToServer = function(...) end,
    GetPlayerSaveLocationInClusterSlot = function(...) end,
    SendWorldResetRequestToServer = function(...) end,
    HasPendingConnection = function(...) end,
    SendWorldSaveRequestToMaster = function(...) end,
    GetIsHosting = function(...) end,
    SetBlacklist = function(...) end,
    GetDefaultClanAdmins = function(...) end,
    CleanupSessionCache = function(...) end,
    IsDedicated = function(...) end,
    SetDefaultServerIntention = function(...) end,
    StartClient = function(...) end,
    GetAutosaverEnabled = function(...) end,
    SetDefaultServerName = function(...) end,
    SendRemoteExecute = function(...) end,
    GetDefaultServerDescription = function(...) end,
    SpawnSeamlessPlayerReplacement = function(...) end,
    GetServerClanID = function(...) end,
    StartCloudServerRequestProcess = function(...) end,
    AdvanceFrame = function(...) end,
    AnnounceDeath = function(...) end,
    SetPartyServer = function(...) end,
    GetServerHasPassword = function(...) end,
    StopSearchingServers = function(...) end,
    GetDefaultPvpSetting = function(...) end,
    GetServerClanOnly = function(...) end,
    
    GetDefaultLANOnlyServer = function(...) end,
    
    SetDefaultServerLanguage = function(...) end,
    SetServerTags = function(...) end,
    GetAllowNewPlayersToConnect = function(...) end,
    GetWorldSessionFile = function(...) end,
    CancelCloudServerRequest = function(...) end,
    AllowConnections = function(...) end,
    GetCountryCode = function(...) end,
    SendSlashCmdToServer = function(...) end,
    JoinParty = function(...) end,
    GetServerPVP = function(...) end,
    GetServerDescription = function(...) end,
    GetSessionIdentifier = function(...) end,
    RemoveFromWhiteList = function(...) end,
    SendSpawnRequestToServer = function(...) end,
    SetDefaultPvpSetting = function(...) end,
    GetNetUpdates = function(...) end,
    SetLobbyCharacter = function(...) end,
    SetIsClientInWorld = function(...) end,
    GetPlayerCount = function(...) end,
    SetDefaultServerPassword = function(...) end,
    SetPlayerMuted = function(...) end,
    SetServerPassword = function(...) end,
    SetIsWorldResetting = function(...) end,
    GetFriendsList = function(...) end,
    SetWorldGenData = function(...) end,
    GetIsClient = function(...) end,
    GetDefaultServerLanguage = function(...) end,
    GetDefaultFriendsOnlyServer = function(...) end,
    SetDefaultServerDescription = function(...) end,
    ServerModsDownloadCompleted = function(...) end,
    SerializeUserSession = function(...) end,
    SendRPCToServer = function(...) end,
    SetDefaultClanInfo = function(...) end,
    Vote = function(...) end,
    GetPVPEnabled = function(...) end,
    ServerModCollectionSetup = function(...) end,
    StartVote = function(...) end,
    AnnounceResurrect = function(...) end,
    GetServerFriendsOnly = function(...) end,
    GetServerPlaystyle = function(...) end,
    SendRPCToShard = function(...) end,
    BeginServerModSetup = function(...) end,
    DeleteCluster = function(...) end,
    AnnounceVoteResult = function(...) end,
    GetPing = function(...) end,
    SetAllowIncomingConnections = function(...) end,
    ListSnapshots = function(...) end,
    DeleteSession = function(...) end,
    SendLobbyCharacterRequestToServer = function(...) end,
    CallRPC = function(...) end,
    GetIsServerAdmin = function(...) end,
    ViewNetFriends = function(...) end,
    GetServerGameMode = function(...) end,
    OnPlayerHistoryUpdated = function(...) end,
    ToggleLANDebugging = function(...) end,
    ViewNetProfile = function(...) end,
    GetDefaultVoteEnabled = function(...) end,
    GetItemsBranch = function(...) end,
    SerializeWorldSession = function(...) end,
    DeserializeUserSession = function(...) end,
    StopBroadcastingServer = function(...) end,
    DeserializeUserSessionInClusterSlot = function(...) end,
    LoadPermissionLists = function(...) end,
    GetServerModNames = function(...) end,
    IsDedicatedOfflineCluster = function(...) end,
    DiceRoll = function(...) end,
    IsNetIDPlatformValid = function(...) end,
    GetUserSessionFile = function(...) end,
    TryDefaultEncodeUserPath = function(...) end,
    GetIsServer = function(...) end,
    GetServerModsDescription = function(...) end,
    JoinServerResponse = function(...) print('../mods/workshop-2059140073/modmain.lua:143') end,
    SetCurrentSnapshot = function(...) end,
    GetIsServerOwner = function(...) end,
    CallClientRPC = function(...) end,
    IncrementSnapshot = function(...) end,
    TruncateSnapshots = function(...) end,
    ListSnapshotsInClusterSlot = function(...) end,
    GetCloudServerRequestState = function(...) end,
    DeserializeAllLocalUserSessions = function(...) end,
    BanForTime = function(...) print('../mods/workshop-1290774114/modmain.lua:116') end,
    GetPartyTable = function(...) end,
    GetDefaultClanOnly = function(...) end,
    EncodeUserPath = function(...) end,
    SetSeason = function(...) end,
    GetServerListingFromActualIndex = function(...) end,
    GetChildProcessStatus = function(...) end,
    SetClientCacheSessionIdentifier = function(...) end,
    GetClientTableForUser = function(...) end,
    GetAllowIncomingConnections = function(...) end,
    GetServerName = function(...) end,
    SetGameData = function(...) end,
    LeaveParty = function(...) end,
    SendWorldRollbackRequestToServer = function(...) end,
    GetServerListing = function(...) end,
    IsNetOverlayEnabled = function(...) end,
    GetDefaultClanID = function(...) end,
    GetServerModsEnabled = function(...) end,
    GetServerIntention = function(...) end,
    GetDefaultServerIntention = function(...) end,
    GenerateClusterToken = function(...) end,
    GetDefaultServerPassword = function(...) end,
    NotifyLoadingState = function(...) end,
    HasCachedUserID = function(...) end,
    GetServerHasPresentAdmin = function(...) end,
    StopVote = function(...) end,
    SetDeferredServerShutdownRequested = function(...) end,
    SetCheckVersionOnQuery = function(...) end,
    GetDeferredServerShutdownRequested = function(...) end,
    IsConsecutiveMatchForPlayer = function(...) end,
    SetAutopaused = function(...) end,
    DoneLoadingMap = function(...) end,
    GetServerIsDedicated = function(...) end,
    SendModRPCToShard = function(...) end,
    ReportListing = function(...) end,
    SetDefaultFriendsOnlyServer = function(...) end,
    IsVoiceActive = function(...) end,
    IsOnlineMode = function(...) end,
    SendResumeRequestToServer = function(...) end,
    GetServerMaxPlayers = function(...) end,
    PartyChat = function(...) end,
    GetLocalClientUserSessionFile = function(...) end,
    GetPartyChatHistory = function(...) end,
    SendModRPCToClient = function(...) end,
    InviteToParty = function(...) end,
    UpdatePlayingWithFriends = function(...) end,
    AddToWhiteList = function(...) end,
    IsServerPaused = function(...) end
}
