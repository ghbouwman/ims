local BaseClass = require("BaseClass")
local Rod = require("Rod")

Octupole = setmetatable({}, BaseClass)
Octupole.__index = Octupole

function Octupole:new(pos, elec, geom)

        local instance = BaseClass.new(self, pos, elec, geom)

        local diag_pos = utils.round(math.sqrt(0.5) * geom.rod_centers_radius)

        local pos_right = {x = instance.pos.x + geom.rod_centers_radius, y = instance.pos.y,                           z = instance.pos.z}
        local pos_diag  = {x = instance.pos.x + diag_pos,                y = instance.pos.y + diag_pos,                z = instance.pos.z}
        local pos_top   = {x = instance.pos.x,                           y = instance.pos.y + geom.rod_centers_radius, z = instance.pos.z}

        instance.subobjs.right = Rod:new(pos_right, elec.pos, {length = geom.length, radius = geom.rod_radius})
        instance.subobjs.diag  = Rod:new(pos_diag,  elec.neg, {length = geom.length, radius = geom.rod_radius})
        instance.subobjs.top   = Rod:new(pos_top,   elec.pos, {length = geom.length, radius = geom.rod_radius})

        return instance
end

return Octupole

