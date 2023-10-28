Transform = {
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
    SetInterpolateRotation = function(...) end,
  
    -- Returns the x, y and z coordinates of the caller. 
    -- Note that we have 3 values, rather than a table.
    ---@return number, number, number
    GetWorldPosition = function(...) return 0, 0, 0 end
  }
