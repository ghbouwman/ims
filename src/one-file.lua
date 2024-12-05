
Octupole = {}
Octupole.__index = Octupole

function math.round(value)
        return math.floor(value + 0.5)
end

function convert(set)
       
        local rv = {}

        for key, value in pairs(set) do
                rv[key] = value / scale        
        end

        return rv
end

function find_max(set)

        local min = nil
        local max = nil

        for _, value in ipairs(set) do

                if min == nil or value < min then
                        min = value
                end

                if max == nil or value > max then
                        max = value
                end
        end

        if -min > max then
                max = -min
        end

        return max
end

function get_ranges(pos, geom)
        
        local feature_size = 3.5 * find_max(geom)

        local rv = 
        {
                x_min = pos.x - feature_size
                x_max = pos.x + feature_size
                y_min = pos.y - feature_size
                y_max = pos.y + feature_size
                z_min = pos.z - feature_size
                z_max = pos.z + feature_size
        }

        return rv
end

-- factory function
function base(pos, elec, geom)

        local instance = {}

        instance.pos = pos
        instance.elec = elec
        instance.geom = geom
        instance.ids = {}
        instance.subobjs = {}
        instance.predicate = nil -- function
        instance.ranges = get_ranges(pos, geom)
        instance.pos_gu = convert(instance.pos)
        instance.geom_gu = convert(instance.geom)
        instance.ranges_gu = convert(instance.ranges)

        return instance
end

-- boiler plate
function Octupole:init()
        
        for _, obj in ipairs(self.subobjs) do
                obj.init()
        end

        self.ids = from_predicate(self.predicate, self.ranges_gu)
end

function Octupole:update(t)
        
        for _, obj in ipairs(self.subobjs) do
                obj.update(t)
        end
        
        for _, id in ipairs(self.ids) do
                local voltage = elec(t)
                update_electrode(id, voltage)
        end
end

-- actual class

function Octupole:new(pos, elec, geom)

        local instance = base(pos, elec, geom)

        local diag_pos = math.round(math.sqrt(0.5) * self.rod_centers_radius)
        
        -- Rod is also a class
        self.subobjs.right   = Rod:new(self.pos + {self.rod_center_radius, 0, 0}, self.elec, {self.geom.length, self.geom.rod_diam})
        self.subobjs.diag    = Rod:new(self.pos + {diag_pos, diag_pos, 0},       -self.elec, {self.geom.length, self.geom.rod_diam})
        self.subobjs.top     = Rod:new(self.pos + {0, self.rod_center_radius, 0}, self.elec, {self.geom.length, self.geom.rod_diam})

        return instance
end

return Octupole

