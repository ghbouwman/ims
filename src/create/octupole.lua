function math.round(value)
        return math.floor(value + 0.5)
end

create = create or {}

-- all units in grid units
function create.octupole(pos, length, rod_centers_radius, rod_radius)     
-- uses x- and y-plane symmetry to create a computationally efficient octupole
        
        local diag_pos = math.round(math.sqrt(0.5) * rod_centers_radius)

        -- 0 degrees rod
        rod1 = create_rod({pos.x + rod_centers_radius, pos.y,                      pos.z}, voltage, length, rod_radius)

        -- 45 degrees rod
        rod2 = create_rod({pos.x + diag_pos,           pos.y + diag_pos,           pos.z}, voltage, length, rod_radius)

        -- 90 degrees rod
        rod3 = create_rod({pos.x,                      pos.y + rod_centers_radius, pos.z}, voltage, length, rod_radius)

        -- other rods we get by symmetry
end

return create
