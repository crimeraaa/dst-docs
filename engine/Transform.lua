-- C-sided functions exposed in Lua tables that have the word "Transform" in them.
-- `Transform`
-- `UITransform`
-- Note that it is most likely these tables are part of entities' metatables,
-- as you always see stuff like `inst.Transform:GetWorldPosition(x, y, z, radius)`,
-- rather than seeing `Transform.GetWorldPosition(inst, x, y, z, radius)`.

Transform = {
    -- Returns the x, y and z coordinates of the caller. 
    -- Note that we have 3 values, rather than a table.
    -- Also note that typically it's used along with colon notation.
    ---@return number, number, number
    GetWorldPosition = function(inst) 
        return 0, 0, 0 
    end,
    SetTwoFaced = function(...) end,
    ClearPredictedFacingModel = function(...) end,
    SetPredictedSixFaced = function(...) end,
    SetPredictedTwoFaced = function(...) end,
    GetScale = function(...) end,
    SetEightFaced = function(...) end,
    SetPosition = function(...) end,
    GetFacing = function(...) end,
    LoadRotation = function(...) end,
    OffsetPosition = function(...) end,
    SetPredictedNoFaced = function(...) end,
    GetHistoryData = function(...) end,
    GetPredictionPosition = function(...) end,
    SetScale = function(...) end,
    SetSixFaced = function(...) end,
    GetRotation = function(...) end,
    GetFacingRotation = function(...) end,
    SetIsOnPlatform = function(...) end,
    GetLocalPosition = function(...) end,
    SetPredictedFourFaced = function(...) end,
    SetRotation = function(...) end,
    SetNoFaced = function(...) end,
    SetPredictedEightFaced = function(...) end,
    UpdateTransform = function(...) end,
    SetFromProxy = function(...) end,
    SetFourFaced = function(...) end,
    SetInterpolateRotation = function(...) end
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
