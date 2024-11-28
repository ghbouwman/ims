create = create or {}

-- all units in grid units
function create.diaphragm(x_pos, y_pos, z_pos, voltage, thickness, begin_radius, end_radius, half_width)

        -- loop ranges
        local z_begin = z_pos
        local z_end = z_begin + thickness - 1

        local x_begin = x_pos - half_width
        local x_end = x_pos + half_width

        local y_begin = y_pos - half_width
        local y_end = y_pos + half_width

        -- loop over all the gridpoints
        for z = z_begin, z_end do

                for x = x_begin, x_end do

                        for y = y_begin, y_end do
                                
                                -- check bounds when using symmetry
                                if settings.symmetry.x and x < 0 then
                                        goto continue
                                end

                                if settings.symmetry.y and y < 0 then
                                        goto continue
                                end
                                
                                -- linear interpolation between the beginning and end radius
                                local hole_radius = begin_radius + (end_radius - begin_radius) * (z - z_begin) / thickness

                                -- set the point as an electrode
                                if (x - x_pos)^2 + (y - y_pos)^2 > hole_radius^2 then
                                        create.electrode(x, y, z, voltage)
                                end

                                ::continue::
                        end
                end
        end
end

return create
