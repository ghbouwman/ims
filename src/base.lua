Base = {}
Base.__index = Base

-- Base constructor
function Base:initialize(pos, geom)
        self.pos = pos
        self.geom = geom

        -- Convert pos to grid units
        self.pos_gu = {
                x = pos.x / scale,
                y = pos.y / scale,
                z = pos.z / scale
        }

        -- Convert geom to grid units
        self.geom_gu = {}
        for key, value in pairs(geom) do
                self.geom_gu[key] = value / scale
        end
end

-- Utility function for debugging
function Base:print_base_status()
        print("Position (GU):", self.pos_gu.x, self.pos_gu.y, self.pos_gu.z)
        print("Geometry (GU):")
        for k, v in pairs(self.geom_gu) do
                print(string.format("  %s: %.2f", k, v))
        end
end

return Base

