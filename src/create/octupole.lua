function math.round(value)
        return math.floor(value + 0.5)
end

create = create or {}

-- all units in grid units
function create.octupole(x_pos, y_pos, z_pos, length, rod_centers_radius, rod_radius)     
-- uses x- and y-plane symmetry to create a computationally efficient octupole
        
        local diag_pos = math.round(math.sqrt(0.5) * rod_centers_radius)

        -- 0 degrees rod
        create_rod(x_pos + rod_centers_radius, y_pos, rod_radius, length, z_start, false, true)

        -- 45 degrees rod
        create_rod(x_pos + diag_pos, y_pos + diag_pos, rod_radius, length, z_start)

        -- 90 degrees rod
        create_rod(x_pos, y_pos + rod_centers_radius, rod_radius, length, z_start, true, false)

        -- other rods we get by symmetry
end

return create
