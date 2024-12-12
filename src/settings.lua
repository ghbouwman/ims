

settings = settings or {}

settings.simion_is_available = type(simion) == "table"

settings.scale                     = 1   -- mm/gu

-- NOTA BENE: both of these are requred to be true because of how the octupole code is written
settings.symmetry =
{ 
        x = true,
        y = true
}

return settings
