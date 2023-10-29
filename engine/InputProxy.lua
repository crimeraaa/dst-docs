-- TODO determine if the one starting with `The` is the correct one to reference.

-- `InputProxy` is of type `table` while `TheInputProxy` is of type `userdata`.
--
-- Apparently these 3 are different:
---```txt
---TheInput:
---     table:      0000000014B6EB80 
---     does makes sense since it's Lua sided)
---
---InputProxy:
---     table:      0000000011895150
---
---TheInputProxy:
---     userdata:   00000000076E1940
---```
---
InputProxy = {
    GetInputDeviceCount = function(...) end,
    GetInputDeviceName = function(...) end,
    LoadControls = function(...) end,
    CloseVirtualKeyboard = function(...) end,
    SetCursorVisible = function(...) end,
    IsAnyControllerActive = function(...) end,
    IsAnyControllerConnected = function(...) end,
    LoadDefaultControlMapping = function(...) end,
    IsInputDeviceEnabled = function(...) end,
    FlushInput = function(...) end,
    GetLocalizedControl = function(...) end,
    StopMappingControls = function(...) end,
    GetOSCursorPos = function(...) end,
    OpenVirtualKeyboard = function(...) end,
    EnableVibration = function(...) end,
    CancelMapping = function(...) end,
    IsAnyInputDeviceConnected = function(...) end,
    IsInputDeviceConnected = function(...) end,
    StartMappingControls = function(...) end,
    HasMappingChanged = function(...) end,
    EnableInputDevice = function(...) end,
    AddVibration = function(...) end,
    UnMapControl = function(...) end,
    GetInputDeviceType = function(...) end,
    SetOSCursorPos = function(...) end,
    RemoveVibration = function(...) end,
    ApplyControlMapping = function(...) end,
    StopVibration = function(...) end,
    SaveControls = function(...) end,
    MapControl = function(...) end,
    LoadCurrentControlMapping = function(...) end,
    GetLastActiveControllerIndex = function(...) end
}
TheInputProxy = InputProxy
