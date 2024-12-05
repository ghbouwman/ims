local settings = require("settings")

utils = utils or {}

local function table_max(t)
        local max_value = -math.huge
        for _, value in pairs(t) do
                if value > max_value then
                        max_value = value
                end
        end
        return max_value
end

local function table_min(t)
        local min_value = math.huge
        for _, value in pairs(t) do
                if value < min_value then
                        min_value = value
                end
        end
        return min_value
end

function utils.round(value)
        return math.floor(value + 0.5)
end

function utils.convert(set)
        local rv = {}
        for key, value in pairs(set) do
                rv[key] = utils.round(value / settings.scale)
        end
        return rv
end

function utils.get_ranges(pos, geom)
        local feature_size = 2 * math.max(table_max(geom), -table_min(geom))
        local rv = {
                x_min = pos.x - feature_size,
                x_max = pos.x + feature_size,
                y_min = pos.y - feature_size,
                y_max = pos.y + feature_size,
                z_min = pos.z - feature_size,
                z_max = pos.z + feature_size
        }
        -- local rv = {
        --         x_min = pos.x - geom.radius or 1.5 * geom.rod_centers_radius,
        --         x_max = pos.x + geom.radius or 1.5 * geom.rod_centers_radius,
        --         y_min = pos.y - geom.radius or 1.5 * geom.rod_centers_radius,
        --         y_max = pos.y + geom.radius or 1.5 * geom.rod_centers_radius,
        --         z_min = pos.z,
        --         z_max = pos.z + geom.length
        -- }
        return rv
end

-- conditionally define a function
if settings.simion_is_available then
        local function real_init(x, y, z, voltage)
                id = simion.pas:set_point_type(x, y, z, "electrode", voltage)
                return id
        end

        utils.init_electrode = real_init
else
        index = 0 -- mock index

        local function mock_init(x, y, z, voltage)
                print("mock construction: ", x, y, z, voltage)
                index = index + 1
                return index
        end

        utils.init_electrode = mock_init
end

function utils.from_predicate(predicate, ranges) -- , electrical)

        local voltage = nil
        local ids = {}

        for x = ranges.x_min, ranges.x_max do
                for y = ranges.y_min, ranges.y_max do
                        for z = ranges.z_min, ranges.z_max do
                                if predicate(x, y, z) then
                                        id = utils.init_electrode(x, y, z, voltage)
                                        ids[#ids + 1] = id
                                end

                        end
                end
        end

        return ids
end

-- conditionally define a function
if settings.simion_is_available then
        local function real_update(id, voltage)
                simion.pas:set_electrode_voltage(id, voltage)
        end

        utils.update_electrode = real_update
else
        function mock_update(id, voltage)
                print("mock update: ", id, voltage)
        end

        utils.update_electrode = mock_update
end


















return utils
