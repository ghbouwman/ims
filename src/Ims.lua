
local BaseClass = require("BaseClass")
local Octupole = require("Octupole")
local Diaphragm = require("Diaphragm")

Ims = setmetatable({}, BaseClass)
Ims.__index = Ims

function Ims:new(pos, elec, geom)

        local instance = BaseClass.new(self, pos, elec, geom)

        -- octupole
        local Vpp = 350
        local offset = 4
        local freq = 700000
        
        local function positive(t)
                return offset + Vpp/2 * math.sin(2 * math.pi * freq * t)
        end

        local function negative(t)
                return offset - Vpp/2 * math.sin(2 * math.pi * freq * t)
        end

        local octupole_elec = {pos=positive, neg=negative}
        instance.subobjs.octupole = Octupole:new({x=0,y=0,z=0}, octupole_elec, {length=250, rod_centers_radius=(13.44+5.0)/2, rod_radius=2.5})

        -- diaphragms
        instance.subobjs.inlet = Diaphragm:new({x=0,y=0,z=-4},    function() return 0   end, {half_width=20,thickness=2,begin_radius=2,end_radius=6})
        instance.subobjs.outlet = Diaphragm:new({x=0,y=0,z=251},  function() return -30 end, {half_width=20,thickness=2,begin_radius=0.6,end_radius=0.6})
     
        

        return instance
end

return Ims









