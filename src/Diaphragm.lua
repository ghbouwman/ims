
local BaseClass = require("BaseClass")
local utils = require("utils") -- Assuming utils contains conversion and predicate utilities

local Diaphragm = setmetatable({}, BaseClass)
Diaphragm.__index = Diaphragm

-- Constructor
function Diaphragm:new(pos, elec, geom)

        local instance = BaseClass.new(self, pos, elec, geom)

        instance.ranges = 
        {       
                x_min = instance.pos.x - instance.geom.half_width,
                x_max = instance.pos.x + instance.geom.half_width,
                y_min = instance.pos.y - instance.geom.half_width,
                y_max = instance.pos.y + instance.geom.half_width,
                z_min = instance.pos.z,
                z_max = instance.pos.z + instance.geom.thickness
        }

        instance.ranges_gu = utils.convert(instance.ranges)

        instance.predicate = function(x, y, z)
                local dx = x - instance.pos_gu.x
                local dy = y - instance.pos_gu.y
                local dz = z - instance.pos_gu.z

                -- Linear interpolation for the hole radius
                local progress = dz / instance.geom_gu.thickness
                local dr = instance.geom_gu.end_radius - instance.geom_gu.begin_radius
                local hole_radius = instance.geom_gu.begin_radius + dr * progress
                local outside_hole = dx^2 + dy^2 > hole_radius^2

                --local within_box_x = 0 < dx and dx < instance.geom_gu.half_width
                --local within_box_y = 0 < dy and dy < instance.geom_gu.half_width
                --local within_box_z = 0 < dz and dz < instance.geom_gu.thickness
                --local within_box = within_box_x and within_box_y and within_box_z

                return outside_hole --and within box
        end

        return instance
end


return Diaphragm







