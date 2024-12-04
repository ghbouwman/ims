create = create or {}

-- all units in grid units
function create.rod(pos, voltage, length, radius)

        -- loop ranges
        local ranges = {}

        local ranges.x_min = pos.x - radius
        local ranges.x_max = pos.x + radius
        local ranges.y_min = pos.y - radius
        local ranges.y_max = pos.y + radius
        local ranges.z_min = pos.z
        local ranges.z_max = pos.z + length - 1

        function predicate(x, y, z)
                return (x - x_pos)^2 + (y - y_pos)^2 <= radius^2
        end

        ids = create.from_predicate(ranges, predicate, voltage)
        return ids
end

return create
