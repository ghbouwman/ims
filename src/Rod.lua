local BaseClass = require("BaseClass")

local Rod = setmetatable({}, BaseClass)
Rod.__index = Rod

function Rod:new(pos, elec, geom)

        local instance = BaseClass.new(self, pos, elec, geom)
        
        instance.predicate = function(x, y, z)

                local dx = x - instance.pos_gu.x
                local dy = y - instance.pos_gu.y
                local dz = z - instance.pos_gu.z

                local inside_radius = dx^2 + dy^2 <= (instance.geom_gu.radius)^2
                local inside_length = 0 <= dz and dz <= instance.geom_gu.length

                return inside_radius and inside_length
        end

        return instance
end

return Rod

