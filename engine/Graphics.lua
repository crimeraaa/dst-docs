-- Although not all of these names have one thing in common, I think that
-- conceptually they all aim to achieve similar things?
-- i.e. Shadows, Waves and VFX all have to do with ingame graphics I feel.

GraphicsOptions = {
    IsFullScreenEnabled = function(...) end,
    GetNumDisplayModes = function(...) end,
    GetNumRefreshRates = function(...) end,
    GetFullscreenDisplayRefreshRate = function(...) end,
    GetDisplayName = function(...) end,
    DisableLightMapComponent = function(...) end,
    ToggleFullScreen = function(...) end,
    SetDisplayMode = function(...) end,
    GetRefreshRate = function(...) end,
    SetFullScreen = function(...) end,
    GetDisplayMode = function(...) end,
    GetNumDisplays = function(...) end,
    GetCurrentDisplayModeID = function(...) end,
    IsFullScreen = function(...) end,
    EnableStencil = function(...) end,
    SetSmallTexturesMode = function(...) end,
    DisableStencil = function(...) end,
    EnableLightMapComponent = function(...) end,
    IsSmallTexturesMode = function(...) end,
    GetSmallTexturesModeSettingValue = function(...) end,
    GetFullscreenDisplayID = function(...) end
}


DynamicShadow = {
    SetSize = function(...) end, 
    Enable = function(...) end
}

StaticShadow = {
    SetSize = function(...) end
}

WaveComponent = {
    SetWaveParams = function(...) end,
    SetWaveEffect = function(...) end,
    Init = function(...) end,
    SetWaveMotion = function(...) end,
    SetWaveTexture = function(...) end,
    SetWaveSize = function(...) end
}

VFXEffect = {
    SetLayer = function(...) end,
    AddRotatingParticleUV = function(...) end,
    SetAcceleration = function(...) end,
    SetKillOnEntityDeath = function(...) end,
    EnableDepthWrite = function(...) end,
    SetSortOrder = function(...) end,
    SetBlendMode = function(...) end,
    SetDragCoefficient = function(...) end,
    SetUVFrameSize = function(...) end,
    AddRotatingParticle = function(...) end,
    SetMaxNumParticles = function(...) end,
    SetMaxLifetime = function(...) end,
    ClearAllParticles = function(...) end,
    SetRenderResources = function(...) end,
    SetColourEnvelope = function(...) end,
    SetWorldSpaceEmitter = function(...) end,
    AddParticle = function(...) end,
    SetGroundPhysics = function(...) end,
    SetSortOffset = function(...) end,
    SetRotateOnVelocity = function(...) end,
    EnableBloomPass = function(...) end,
    SetAngularAcceleration = function(...) end,
    SetFollowEmitter = function(...) end,
    SetAngularDragCoefficient = function(...) end,
    GetNumLiveParticles = function(...) end,
    EnableDepthTest = function(...) end,
    SetScaleEnvelope = function(...) end,
    SetIsTrailEmitter = function(...) end,
    AddParticleUV = function(...) end,
    SetRotationStatus = function(...) end,
    SetSpawnVectors = function(...) end,
    InitEmitters = function(...) end,
    SetRadius = function(...) end,
    FastForward = function(...) end
}
