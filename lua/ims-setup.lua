



ims_setup = 
{
        -- distances between components
        inlet_to_octupole_distance      = 2 -- mm
        octupole_to_outlet_distance     = 1 -- mm

        inlet = 
        {
                z_begin         = 0     -- mm (from origin)
                thickness       = 2     -- mm 
                begin_diameter  = 2     -- mm
                end_diameter    = 6     -- mm
                voltage         = 0     -- Volts
        
                -- don't modify:
                z_end           = z_begin + thickness   -- mm (from origin)
        }
        
        
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
                z_begin                 = inlet.z_end + inlet_to_octupole_distance      -- mm (from origin)
                z_end                   = z_begin + length                              -- mm (from origin)
                rod_radius              = rod_diameter / 2                              -- mm
                rod_centers_diameter    = inscribed_diameter + rod_diameter             -- mm
                rod_centers_radius      = rod_centers_diameter / 2                      -- mm
                Vamplitude              = Vpp / 2                                       -- V
        }
        
        outlet = 
        {
                thickness       = 2     -- mm 
                begin_diameter  = 0.6   -- mm
                end_diameter    = 0.6   -- mm (probably not the actual value, but that doesn't matter)
                voltage         = -30   -- Volts
                
                -- don't modify:
                z_begin         = octupole.z_end + octupole_to_outlet_distance  -- mm (from origin)
                z_end           = z_begin + thickness                           -- mm (from origin) (this value is not used)
        }
        
        diaphragms = 
        {
                inlet, outlet
        }
}        
        
