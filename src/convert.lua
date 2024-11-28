
convert = convert or {}

local settings = require("settings")
local scale = settings.scale

function convert.mm_to_gu(component)

        component.geometry_in_gu = {}

        for key, value in pairs(copy.geometry) do
                copy.geometry_in_gu[key] = value / scale
        end
end

return convert
