-- This file contains all the C-sided functions exposed in Lua-sided tables.
-- `TextWidget`
-- `TextEditWidget`
-- `ImageWidget`
-- `VideoWidget`

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
