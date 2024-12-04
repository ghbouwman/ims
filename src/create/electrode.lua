-- simion api wrapper to control print statements and mock calls to the library


create = create or {}

local settings = require("settings")

if settings.simion_is_available then
        function real_electrode_creation(x, y, z, voltage)
                id = simion.pas:set_point_type(x, y, z, "electrode", voltage)
                return id
        end

        create.electrode = real_electrode_creation
else
        function mock_electrode_creation(x, y, z, voltage)
                print(string.format("mock construction: x=%d, y=%d, z=%d, V=%.2f", x, y, z, voltage))
                return nil
        end

        create.electrode = mock_electrode_creation
end


return create
