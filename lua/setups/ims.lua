-- bit of a mess because implicitly using precompiled value is a bit of a bitch :(

setups = setups or {}

setups.ims = 
{
        -- distances between components
        inlet_to_octupole_distance      = 2 -- mm
        octupole_to_outlet_distance     = 1 -- mm

        -- components
        
        inlet = 
        {
                thickness       = 2     -- mm 
                begin_diameter  = 2     -- mm
                end_diameter    = 6     -- mm
                voltage         = 0     -- Volts

                z_begin         = 0     -- mm (from origin)
        
                -- don't modify:
                z_end           = 0 + 2   -- mm (from origin)
        },
        
        
        octupole =
        {
                -- geometry:
                length                  = 250           -- mm
                rod_diameter            = 5.0           -- mm
                inscribed_diameter      = 13.44         -- mm
        
                -- electronics:
                Vpp                     = 350           -- Volts
                freq                    = 700           -- kHz
                offset                  = 4             -- Volts
        
                -- don't modify:
                z_begin                 = 0 + 2 + 2      -- mm (from origin)
                z_end                   = 0 + 2 + 2 + 250                              -- mm (from origin)
                rod_radius              = 5.0 / 2                              -- mm
                rod_centers_diameter    = 13.44 + 5.0             -- mm
                rod_centers_radius      = (13.44 + 5.0) / 2                      -- mm
                Vamplitude              = 350 / 2                                       -- V
        },
        
        outlet = 
        {
                thickness       = 2     -- mm 
                begin_diameter  = 0.6   -- mm
                end_diameter    = 0.6   -- mm (probably not the actual value, but that doesn't matter)
                voltage         = -30   -- Volts
                
                -- don't modify:
                z_begin         = 0 + 2 + 2 + 2 + 250 + 1  -- mm (from origin)
                z_end           = 0 + 2 + 2 + 2 + 250 + 2                           -- mm (from origin) (this value is not used)
        }
        
        -- auxiliary member
        -- diaphragms = 
        -- {
        --         inlet, outlet
        -- }
}        

return setups
