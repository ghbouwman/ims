create = create or {}

require("settings")

-- all units in grid units
function create.diaphragm(pos, electrical, thickness, begin_radius, end_radius) -- geom?

        ranges = {}

        local ranges.x.min = pos.x - settings.diaphragm_half_width
        local ranges.x.max = pos.x + settings.diaphragm_half_width
        local ranges.y.min = pos.y - settings.diaphragm_half_width
        local ranges.y.max = pos.y + settings.diaphragm_half_width
        local ranges.z.min = pos.z
        local ranges.z.max = pos.z + thickness - 1

        ranges_gu = convert.mm_to_gu(ranges)
        pos_gu = convert.mm_to_gu(pos)

        function predicate(x, y, z)

                -- linear interpolation between the beginning and end radius
                local hole_radius = begin_radius + (end_radius - begin_radius) * (z - z_begin) / thickness

                return (x - x_pos)^2 + (y - y_pos)^2 > hole_radius^2
        end
        
        function init()
                ids = create.from_predicate(ranges, predicate, electrical)

        
        
end

return create


-- send S-number to Thomas
