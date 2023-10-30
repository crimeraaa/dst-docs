-- Shorthand for `TheNetwork`, but there's also a global table called `Network`.
--
-- Is of type `userdata` ingame.
---@class TheNet
TheNet = {

    ----------------------------------------------------------------------------
    ------------------------- MODERATION FUNCTIONS -----------------------------
    ----------------------------------------------------------------------------

    -- Kicks the player associated with the Klei ID `userid` from the game.
    -- Note that you cannot kick server admins.
    ---@param self TheNet
    ---@param userid string
    Kick = function(self, userid)
        print("Kicked", userid, "from the game.") 
    end,

    -- Bans the player associated with the Klei ID `userid` from the game.
    -- Note that you cannot ban server admins.
    ---@param self TheNet
    ---@param userid string
    Ban = function(self, userid) 
        print("Banned", userid, "from the game.") 
    end,

    ----------------------------------------------------------------------------
    ----------------------------- CHAT FUNCTIONS -------------------------------
    ----------------------------------------------------------------------------

    -- Sends a message to chat, defaults to global chat.
    -- The message will come from your account because your instance of TheNet
    -- will use your Klei ID.
    --
    -- `scripts/builtinusercommands:70`, there's to be 3rd non-self parameter.
    -- TODO: Find out what that does.
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
    -- See `c_announce` (`scripts/consolecommands.lua`) for sample usage.
    --
    -- `scripts/consolecommands.lua:59`: there are 3 more parameters.
    --
    -- `category` creates the display string `"["..category.."Announcement]"`
    --
    -- The first letter is also capitalized. Sample usages:
    --
    ---```lua
    ----- [Announcement] Hello everyone!
    ---TheNet:Announce("Hello everyone!")
    ---
    ----- [System Announcement] Hello!
    ---TheNet:Announce("Hello!", nil, nil "system")
    ---
    ----- [Server Announcement] Shutting down...
    ---TheNet:Announce("Shutting down...", nil, nil, "server") 
    ---```
    ---@param self any
    ---@param msg string
    ---@param unknown1? any
    ---@param unknown2? any
    ---@param category? string
    Announce = function(self, msg, unknown1, unknown2, category) 
        print("Server Announcement: ", msg)
        print("Got", unknown1, unknown2, category)
    end,

    
    ----------------------------------------------------------------------------
    ------------------- USER/SERVER INFORMATION FUNCTIONS ----------------------
    ----------------------------------------------------------------------------

    -- Returns `cluster_name` from `cluster.ini` for this particular server.
    ---@param self TheNet
    GetServerName = function(self) 
        return "My Server"
    end,

    -- Returns the username of the host.
    --
    -- If dedicated server, returns "[Host]",
    -- otherwise returns the hosting player's ingame name.
    ---@return "[Host]"|"(your username)"
    GetLocalUserName = function(self) 
        if TheNet:GetServerIsDedicated() then
            return "[Host]"
        else
            return "(your username)"
        end
    end,
    
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
    
    GetClientMetricsForUser = function(...) end,
    GetServerIsClientHosted = function(...) end,

    -- Returns a table of players and some basic information about them.
    -- Only returns a non-empty table when currently in a world.
    -- Note that the dedicated server itself may also be included here.
    -- TODO: Are there differences between remote and local invocations?
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

    -- Creates a string array of the folder names of each mod.
    -- These are not the display names seen on the workshop.
    ---@return string[]
    GetServerModNames = function(self) 
        return {
            "some-local-mod-directory",
            "workshop-############",
        }
    end,

    -- Returns `true` for dedicated servers themselves,
    -- probably also `true` for hosting players.
    --
    -- Probably `false` for everybody else.
    GetIsServer = function(self) 
        return true
    end,

    -- Returns a single string containing all the names of the
    -- currently enabled mods. Each name is separated by a comma.
    --
    -- TODO: Verify if no mods enabled, returns an empty string.
    ---@return string
    GetServerModsDescription = function(self) 
        return "Mod #1 (workshop), Mod #2 (local)"
    end,

    -- See `c_netstats()` defined in `scripts/consolecommands.lua` for sample usage.
    -- Other than that, I am not sure what this does.
    --
    -- It just returns an empty table regardless if I'm ingame or not, 
    -- or on a dedicated server or not. Perhaps I'm missing something.
    GetNetworkStatistics = function(self) 
        return {}
    end,

    GetPartyTable = function(...) end,
    GetDefaultClanOnly = function(...) end,
    GetServerListingFromActualIndex = function(...) end,
    GetClientTableForUser = function(...) end,
    GetAllowIncomingConnections = function(...) end,

    -- Returns a table of information that's shown when other players
    -- hover over this server when searching.
    --
    -- See the sample return value in `engine/TheNet.lua` for more information.
    GetServerListing = function(self) 
        -- Here's a sample for my dedicated testing server.
        return {
            allow_new_players = true,
            belongs_to_clan = false,
            clan_only = false,
            clan_server = false,
            client_mods_disabled = false,
            current_players = 0,
            dedicated = true,
            description = "There's nothing here! Go away.",
            friend = false,
            friend_playing = false,
            friends_only = false,
            game_data = {
                day = 17,
                dayselapsedinseason = 16,
                daysleftinseason = 10000
            },
            -- I thought this was a number but I guess not!
            guid = "81232181143196297781",
            has_details = true,
            has_password = true,
            ip = "",
            klei_official = false,
            lan_only = false,
            max_players = 6,
            mode = "survival",
            -- I believe this just the contents of your `modoverrides.lua`.
            mods_config_data = "return { [\"0002-custom-console-cmds\"]={} }",
            mods_description = {
                [1] = {
                    all_clients_require_mod = true,
                    mod_name = "0002-custom-console-cmds",
                    modinfo_name = "Custom Console Command (Local)",
                    version = "1.0.0",
                    version_compatible = "1.0.0"
                },
                [2] = {
                    all_clients_require_mod = false,
                    mod_name = "workshop-29345800090",
                    modinfo_name = "Ultra Creative/Godmode",
                    version = "1.1.0",
                    version_compatible = "1.1.0"
                }
            },
            mods_enabled = true,
            mods_failed_deserialization = false,
            name = "Tartarus",
            nat = 7,
            offline = false,
            owner = true,
            ping = -1,
            players_data = "return {}",
            playstyle = "endless",
            port = 11000,
            pvp = false,
            -- String of base-16/hexadecimal digits.
            row = "f921eed42de2d5ee6c8ff16e",
            season = "autumn",
            serverpaused = false,
            -- String of base-16/hexadecimal digits.
            session = "123456789ABCDEF",
            steamnat = true,
            -- String of base-10/decimal digits only.
            steamnatstr = "123456789",
            tags = "english,survival,vote",
            version = 578580,
            -- Some really really big hashed value goes here. 
            -- Probably base-64 or even higher.
            world_gen_data = "return {str=\"0123456789abcdefg!@#$%^&*()_!?\"}"
        }
    end,

    -- (probably) returns the ID of the steam group/s associated with the server.
    -- I don't like my servers to any so I don't know how this works.
    --
    -- If steam groups, returns an empty string.
    GetDefaultClanID = function(self) 
        return ""
    end,
    
    -- Returns `true` if any mods, whether local or workshop, are enabled.
    -- Otherwise returns `false`.
    ---@param self TheNet
    GetServerModsEnabled = function(self) 
        return true
    end,

    -- I believe this was for the time when servers could only be set to the 
    -- game modes "Survival", "Endless" and "Wilderness".
    ---@param self TheNet
    ---@deprecated
    GetServerIntention = function(self) 
        print("GetServerIntention - Server intention is deprecated!")
        return ""
    end,

    -- I believe this was for the time when servers could only be set to the 
    -- game modes "Survival", "Endless" and "Wilderness".
    ---@param self TheNet
    ---@deprecated 
    GetDefaultServerIntention = function(self) 
        print("GetDefaultServerIntention - Server intention is deprecated!")
        return ""
    end,

    -- Returns the plaintext server password. Be careful with this!
    --
    -- Here's a fun experiment: try passing the return value of this to
    -- the global engine functions `hash` or `smallhash`!
    GetDefaultServerPassword = function(self) 
        return "password1234"
    end,
    HasCachedUserID = function(...) end,
    GetServerHasPresentAdmin = function(...) end,

    -- Only returns `true` for dedicated servers, duh.
    --
    -- Note that if you host a forest + caves world ingame, that's also considered
    -- as a dedicated server.
    GetServerIsDedicated = function(self) 
        return false
    end,

    -- Returns the configured maximum number of players for this server.
    -- The default is `6`.
    --
    -- See `max_players` integer config from your `cluster.ini`.
    GetServerMaxPlayers = function(...) 
        return 6
    end,

    -- Returns `true` is server is paused, else false.
    -- Note that servers can be configured to be paused or not when nobody is on.
    --
    -- See `pause_when_empty` boolean config in your `cluster.ini`.
    IsServerPaused = function(self) 
        return false
    end,

    -- Returns the default values for `max_players`, which is `6` I beleive.
    --
    -- This is separate from the actual configured value.
    GetDefaultMaxPlayers = function(self) 
        return 6
    end,

    -- Returns `true` if your server is only set up on a Local Access Network (LAN).
    -- Otherwise, returns false. 
    GetServerLANOnly = function(self) 
        return false
    end,

    ----------------------------------------------------------------------------
    ------------------------ UNCATEGORIZED FUNCTIONS ---------------------------
    ----------------------------------------------------------------------------

    SetAllowNewPlayersToConnect = function(...) end,
    SetIsWorldSaving = function(...) end,
    SetIsMatchStarting = function(...) end,
    ServerModSetup = function(...) end,
    PrintNetwork = function(...) end,
    SetDefaultMaxPlayers = function(...) end,
    StartWorldSave = function(...) end,
    SetDefaultGameMode = function(...) end,
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
    IsDedicatedOfflineCluster = function(...) end,
    DiceRoll = function(...) end,
    IsNetIDPlatformValid = function(...) end,
    GetUserSessionFile = function(...) end,
    TryDefaultEncodeUserPath = function(...) end,
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
    EncodeUserPath = function(...) end,
    SetSeason = function(...) end,
    GetChildProcessStatus = function(...) end,
    SetClientCacheSessionIdentifier = function(...) end,
    SetGameData = function(...) end,
    LeaveParty = function(...) end,
    SendWorldRollbackRequestToServer = function(...) end,
    IsNetOverlayEnabled = function(...) end,
    GenerateClusterToken = function(...) end,
    NotifyLoadingState = function(...) end,
    StopVote = function(...) end,
    SetDeferredServerShutdownRequested = function(...) end,
    SetCheckVersionOnQuery = function(...) end,
    GetDeferredServerShutdownRequested = function(...) end,
    IsConsecutiveMatchForPlayer = function(...) end,
    SetAutopaused = function(...) end,
    DoneLoadingMap = function(...) end,
    SendModRPCToShard = function(...) end,
    ReportListing = function(...) end,
    SetDefaultFriendsOnlyServer = function(...) end,
    IsVoiceActive = function(...) end,
    IsOnlineMode = function(...) end,
    SendResumeRequestToServer = function(...) end,
    PartyChat = function(...) end,
    GetLocalClientUserSessionFile = function(...) end,
    GetPartyChatHistory = function(...) end,
    SendModRPCToClient = function(...) end,
    InviteToParty = function(...) end,
    UpdatePlayingWithFriends = function(...) end,
    AddToWhiteList = function(...) end,
}
