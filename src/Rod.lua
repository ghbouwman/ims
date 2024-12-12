local BaseClass = require("BaseClass")
local utils = require("utils")

local Rod = setmetatable({}, BaseClass)
Rod.__index = Rod

function Rod:new(pos, elec, geom)

        local instance = BaseClass.new(self, pos, elec, geom)

        instance.ranges = 
        {       
                x_min = instance.pos.x - instance.geom.radius,
                x_max = instance.pos.x + instance.geom.radius,
                y_min = instance.pos.y - instance.geom.radius,
                y_max = instance.pos.y + instance.geom.radius,
                z_min = instance.pos.z,
                z_max = instance.pos.z + instance.geom.length
        }

        instance.ranges_gu = utils.convert(instance.ranges)
        
        instance.predicate = function(x, y, z)

                local dx = x - instance.pos_gu.x
                local dy = y - instance.pos_gu.y
                local dz = z - instance.pos_gu.z

                local inside_radius = dx^2 + dy^2 <= (instance.geom_gu.radius)^2
                -- local inside_length = 0 <= dz and dz <= instance.geom_gu.length

                return inside_radius --and inside_length
        end

        return instance
end

return Rod

