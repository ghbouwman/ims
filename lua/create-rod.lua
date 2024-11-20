
-- all units in grid units
function create_rod(x_pos, y_pos, radius, length, z_begin, restrict_to_right, restrict_to_upper)

        -- default values
        z_begin = z_begin or 0

        restrict_to_right = restrict_to_right or false
        restrict_to_upper = restrict_to_upper or false

        -- loop ranges
        local z_end = z_begin + length - 1

        local x_begin = x_pos - radius
        local x_end = x_pos + radius

        local y_begin = y_pos - radius
        local y_end = y_pos + radius

        -- loop over all the gridpoints
        for z = z_begin, z_end do

                for x = x_begin, x_end do

                        for y = y_begin, y_end do
                                
                                -- check bounds when using symmetry
                                if restrict_to_right and x <= 0 then
                                        goto continue
                                end

                                if restrict_to_upper and y <= 0 then
                                        goto continue
                                end

                                -- set the point as an electrode
                                if (x - x_pos)^2 + (y - y_pos)^2 <= radius^2 then
                                        simion.pas:set_point_type(x, y, z, "electrode")
                                end

                                ::continue::
                        end
                end
        end
end

