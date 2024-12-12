

local settings = require("settings")
local Ims = require("Ims")


if settings.simion_is_available then
        simion.workbench_program()
end



local setup = Ims:new({x=0,y=0,z=0}, {}, {})

setup:init()

local t
if settings.simion_is_available then
        segment.other_actions = function()
                t = simion.time
                setup:update(t)
        end
else
        local t_max = 1e-6
        local dt = 1e-9
        
        t = 0
        while t < t_max do
                setup:update(t)
                t = t + dt
        end
end
