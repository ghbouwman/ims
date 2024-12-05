

local Octupole = require("Octupole")
local settings = require("settings")

local elec = {}

local Vpp = 350
local offset = 4
local freq = 700000

local function positive(t)
        return offset + Vpp/2 * math.sin(2 * math.pi * freq * t)
end


local function negative(t)
        return offset - Vpp/2 * math.sin(2 * math.pi * freq * t)
end

local elec = {pos=positive, neg=negative}

local ims_octupole = Octupole:new({x=0,y=0,z=0}, elec, {length=350, rod_centers_radius=(13.44+5.0)/2, rod_radius=2.5})

ims_octupole:init()



local t
if settings.simion_is_available then
        segment.other_actions = function()
                t = simion.time
                ims_octupole:update(t)
        end
else
        local t_max = 1e-6
        local dt = 1e-9
        
        t = 0
        while t < t_max do
                ims_octupole:update(t)
                t = t + dt
        end
end
