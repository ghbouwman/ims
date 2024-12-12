local utils = require("utils")

local BaseClass = {}
BaseClass.__index = BaseClass

-- Constructor for BaseClass
function BaseClass:new(pos, elec, geom)
        assert(type(pos) == "table", "pos must be a table")
        assert(type(elec) == "function" or type(elec) == "table", "elec must be a function or a table")
        assert(type(geom) == "table", "geom must be a table")

        local instance = setmetatable({}, self)

        -- Assign basic properties
        instance.pos = pos
        instance.elec = elec
        instance.geom = geom
        instance.ids = nil
        instance.subobjs = {}
        instance.predicate = nil
        instance.ranges = utils.get_ranges(pos, geom)
        instance.pos_gu = utils.convert(pos)
        instance.geom_gu = utils.convert(geom)
        instance.ranges_gu = utils.convert(instance.ranges)
        instance.pa = nil

        return instance
end

-- Initialization method
function BaseClass:init()
        
        for _, obj in pairs(self.subobjs or {}) do
                
                if obj.init then
                        obj:init()
                end
        end
        if self.predicate then
                self.pa = simion.pas:open()
                self.pa.size(300, 25, 25)
                utils.from_predicate(self.predicate, self.ranges_gu, self.pa)
                -- ids = pa:points()
        end
end

-- Update method
function BaseClass:update(t)

        for _, obj in pairs(self.subobjs or {}) do
                if obj.update then
                        obj:update(t)
                end
        end
        if self.ids then
                for _, id in pairs(self.ids) do
                        local voltage = self.elec(t)
                        if voltage then
                                utils.update_electrode(id, voltage)
                        end
                end
        end
end

return BaseClass

