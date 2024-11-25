
dofile("create-rod.lua")


function math.round(value)
        return math.floor(value + 0.5)
end


-- all units in grid units
function create_octupole(length, rod_centers_radius, rod_radius, z_start)     
-- uses x- and y-plane symmetry to create a computationally efficient octupole
        
        -- default value
        z_start = z_start or 0

        local diag_pos = math.round(math.sqrt(0.5) * rod_centers_radius)

        -- 0 degrees rod
        create_rod(rod_centers_radius, 0, rod_radius, length, z_start, false, true)

        -- 45 degrees rod
        create_rod(diag_pos, diag_pos, rod_radius, length, z_start)

        -- 90 degrees rod
        create_rod(0, rod_centers_radius, rod_radius, length, z_start, true, false)

        -- other rods we get by symmetry
end

