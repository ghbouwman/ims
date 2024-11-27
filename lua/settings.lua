



simion_is_available = type(simion) == "table"

scale                     = 0.01  -- mm/gu
diaphragm_half_width      = 10    -- mm

-- NOTA BENE: both of these are requred to be true because of how the octupole code is written
symmetry =
{ 
        x = true
        y = true
}
