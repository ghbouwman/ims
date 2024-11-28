

create = create or {}

function create.from_predicate(ranges, predicate, voltage)
        
        local ids = {}

        for x in ranges.x_min, ranges.x_max do
                for y in ranges.y_min, ranges.y_max do
                        for z in ranges.z_min, ranges.z_max do
                                if predicate(x, y, z) then
                                        id = create.electrode(x, y, z, voltage)
                                        ids[#ids + 1] = id
                                end

                        end
                end
        end

        return ids
end

return create
