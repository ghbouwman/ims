-- bit of a mess because implicitly using precompiled value is a bit of a bitch :(

setups = setups or {}

setups.ims = 
{
        inlet = 
        {
                geometry =
                {
                        thickness       = 2,
                        begin_diameter  = 2,
                        end_diameter    = 6,
                        z_begin         = 0,     -- distance from origin
                        z_end           = 0 + 2 -- distance from origin
        
                },
                voltage = 0     -- Volts

        },
        
        
        octupole =
        {
                geometry =
                {
                        length                  = 250,          
                        rod_diameter            = 5.0,          
                        inscribed_diameter      = 13.44,        
                        z_begin                 = 0 + 2 + 2,            -- distance from origin
                        z_end                   = 0 + 2 + 2 + 250,      -- distance from origin
                        rod_radius              = 5.0 / 2,         
                        rod_centers_diameter    = 13.44 + 5.0,     
                        rod_centers_radius      = (13.44 + 5.0) / 2
                },
        
                -- electronics
                Vpp             = 350,          -- V
                freq            = 700,          -- kHz
                offset          = 4,            -- V
                Vamplitude      = 350 / 2       -- V
        },
        
        outlet = 
        {
                geometry =
                {
                        thickness       = 2,
                        begin_diameter  = 0.6,
                        end_diameter    = 0.6,  -- probably not the actual value, but that doesn't matter
                        z_begin         = 0 + 2 + 2 + 2 + 250 + 1,      -- distance from origin
                        z_end           = 0 + 2 + 2 + 2 + 250 + 1 + 1   -- distance from origin 
                },

                -- electronics
                voltage = -30   -- V
        }
}        

return setups
