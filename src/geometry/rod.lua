


function predicate_constructor()
        
        

        function predicate(x, y, z)
                return (x - x_pos)^2 + (y - y_pos)^2 <= radius^2
        end     

        return predicate
end


function create()
        
        for x in x_min, x_max do
                for x in x_min, x_max do
                        for x in x_min, x_max do
                                if pred(x, y, z) then
                                        id = create_electrode
                                        -- append id or whatever
                                end

                        end
                end
        end
