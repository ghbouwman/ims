-- bit of a mess because implicitly using precompiled value is a bit of a bitch :(

setups = setups or {}

-- explanation:
-- a setup is made up of components, each component has two fields:
-- the geometry (including positioning) and the electrical properties
-- all geometry units are in milimeters; all electrical properties in SI (V, Hz, s, etc.)

setups.ims = 
{
        inlet = 
        {
                geometry =
                {
                        kind            = "diaphragm",
                        thickness       = 2,
                        begin_diameter  = 2,
                        end_diameter    = 6,
                        z_begin         = 0,    -- distance from origin
                        z_end           = 0 + 2 -- distance from origin
        
                },
                electrical =
                {
                        kind    = "static",
                        voltage = 0     
                }

        },
        octupole =
        {
                geometry =
                {
                        kind                    = "octupole",
                        length                  = 250,          
                        rod_diameter            = 5.0,          
                        inscribed_diameter      = 13.44,        
                        z_begin                 = 0 + 2 + 2,            -- distance from origin
                        z_end                   = 0 + 2 + 2 + 250,      -- distance from origin
                        rod_radius              = 5.0 / 2,         
                        rod_centers_diameter    = 13.44 + 5.0,     
                        rod_centers_radius      = (13.44 + 5.0) / 2
                },
                electrical =
                {
                        kind            = "sinusoidal",
                        Vpp             = 350,          
                        freq            = 700_000,      
                        offset          = 4,            
                        Vamplitude      = 350 / 2,      
                        phase           = 0             
                }
        
        },
        outlet = 
        {
                geometry =
                {
                        kind            = "diaphragm",
                        thickness       = 2,
                        begin_diameter  = 0.6,
                        end_diameter    = 0.6,  -- probably not the actual value, but that doesn't matter
                        z_begin         = 0 + 2 + 2 + 2 + 250 + 1,      -- distance from origin
                        z_end           = 0 + 2 + 2 + 2 + 250 + 1 + 1   -- distance from origin 
                },
                electrical =
                {
                        kind    = "static",
                        voltage = -30  
                }
        }
}        

return setups
