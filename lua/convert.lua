


local settings = require("settings")
local scale = setting.scale

function deep_copy(obj)
        if type(obj) ~= "table" then
                return obj
        end

        local copy = {}
        for k, v in pairs(obj) do
                copy[k] = deep_copy(v)
        end
        return copy
end

function to_gu(component)

        local copy = deep_copy(component)

        for key, value in pairs(copy.geometry) do
                copy.geometry[key] = value / scale
        end

        return copy
end



