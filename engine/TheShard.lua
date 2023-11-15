-- Methods for differentiating shards for servers, e.g. servers that have
-- both Forest and Caves enabled, or even 4-shard Island Adventures.
TheShard = {
    SetSecondaryLoading = function(...) end,
    StartMigration = function(...) end,
    GetSecondaryShardPlayerCounts = function(...) end,
}

-- Returns `true` if you're an in-game player, otherwise false (e.g. dedicated server).
function TheShard:IsPlayer()
    return true
end

-- Returns `true` if the current instance of `TheShard` is the master simulation.
-- e.g. Forest is typically the master shard.
function TheShard:IsMaster() 
    return true 
end

-- All non-master server shards are considered to be secondary shards.
-- e.g. Caves shard is secondary, while Forest shard is the master.
function TheShard:IsSecondary() 
    return not TheShard:IsMaster()
end

-- Seems to return `1` for master shards. Perhaps with 2+ shards there are more IDs.
function TheShard:GetShardId()
    return 1
end

-- Unsure what this does.
function TheShard:GetDefaultShardEnabled()
    return true 
end

-- See `SinkholeSpawner:UpdateTarget` (`scripts/components/sinkholespawner.lua:85`).
-- 
-- Also note Vito's comment: `"TheShard:IsMigrating(userid) only works on master shard"`
-- 
-- This probably has to do with Antlion?
---@param userid string Klei user ID of a player.
function TheShard:IsMigrating(userid)
    print(userid, "is migrating shards.")
end
