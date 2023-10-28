-- C-sided functions exposed in Lua tables that have the word "Light" in them.
-- `Light`
-- `LightWatcher`

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
