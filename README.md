# BSc Project IMS

## library for Simion octupole simulations written in Lua


### TODO
- add better typing to electrical components
- distinguish between geometric and electrical properties of the components
- how to find the index of an electrical component in the simion software?
- adjusting is a pain; perhaps an object oriented approach would work best?

idea:

setup is an array of components
component has x, y, z maxs and mins which indicate a rectangular boundry box
static or dynamic electrical properties

constructor args: x, y and z-pos (more...)
provide shape as predicate function
provide inital and updating function for voltage
static -> voltage value
dynamic -> voltage function


setup tasks:
store symmetry
(simple loop:)
initialised all components
update all components

component tasks:
find xyz min/max (keep in mind symmetry)
create the geometry with a predicate function (with static value)
store all electrodes in a list (for dynamic values)
update value for a given point in time each timestep





component gets: position, geom params, electrical params
creates: predicate function, ranges, position/geom/ranges in gu
constructs geometry




pseudocode:


statc: voltage
dynamic: function

func(pos, elec, geom)

        func(pos, geom, elec)

        rv = {pos, geom, elec}
        rv.ranges = func(...)
        rv.pred = func(...)

        # modify geom and 

        # conditionally include the static voltage
        rv.ids = build(ranges, pred)

        return rv

how do we delegate to sub-components?


ims.octupole     = create.octupole(position, geometry, electrical.sinusoidal(350/2, 700000, 0))
ims.inlet        = create.inlet(0, 0, 0)
...




object may be:
made of other objects
an electrode
according to a predicate

define subobjects
construct subobjects relative to current position
adjust subobjects


function octupole:new()
        rod()
        rod()
        rod()
end



subobjects datamember





obj = blah:new(pos, elec, geom)
add more to geom
pos-gu
geom-gu
ids = {}
obj:init()
        for-loop with subobjects
        from_predicate()
obj:update(t)
        for-loop with subobjects




function octupole:new(pos, elec, geom)
        rod:new(pos + {},  elec, geom.length, geom.rod_diamter)
        rod:new(pos + {}, -elec, geom.length, geom.rod_diamter)
        rod:new(pos + {},  elec, geom.length, geom.rod_diamter)
end


---------------------------------------------
elec objs: overloads


every obj:

takes: pos, geom, elec

pos_gu
geom_gm

init function
update function that takes the current time
















