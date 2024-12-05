
local BaseClass = require("BaseClass")
local utils = require("utils") -- Assuming utils contains conversion and predicate utilities

local Diaphragm = setmetatable({}, BaseClass)
Diaphragm.__index = Diaphragm

-- Constructor
function Diaphragm:new(pos, elec, geom)

        local instance = BaseClass.new(self, pos, elec, geom)

        instance.predicate = function(x, y, z)
                local dx = x - instance.pos_gu.x
                local dy = y - instance.pos_gu.y
                local dz = z - instance.pos_gu.z

                -- Linear interpolation for the hole radius
                local progress = dz / instance.geom_gu.thickness
                local dr = instance.geom_gu.end_radius - instance.geom_gu.begin_radius
                local hole_radius = instance.geom_gu.begin_radius + dr * progress
                local outside_hole = dx^2 + dy^2 > hole_radius^2

                local within_box_x = 0 < dx and dx < instance.geom_gu.half_width
                local within_box_y = 0 < dy and dy < instance.geom_gu.half_width
                local within_box_z = 0 < dz and dz < instance.geom_gu.thickness
                local with_box = within_box_x and within_box_y and within_box_z

                return within_box and outside_hole
        end

        return instance
end


return Diaphragm







