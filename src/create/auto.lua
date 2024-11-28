


create = create or {}

-- automatically download 
function create.auto(component)
        
        local kind = component.kind

        if kind == "diaphragm" then
                create.octupole() 
                goto ::end::
        end

        if kind == "octupole" then
                create.octupole() 
                goto ::end::
        end

        print("error: kind of component could not matched' kind: ", kind) 
        return nil

        ::end::

        return component_index
end


return create
