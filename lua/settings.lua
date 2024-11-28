

settings = settings or {}

settings.simion_is_available = type(simion) == "table"

settings.scale                     = 0.01  -- mm/gu
settings.diaphragm_half_width      = 10    -- mm

-- NOTA BENE: both of these are requred to be true because of how the octupole code is written
settings.symmetry =
{ 
        x = true,
        y = true
}

return settings
