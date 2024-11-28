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



func(pos, geom, elec)
        rv = {pos, geom, elec}
        rv.ranges = func(...)
        rv.pred = func(...)

        # modify geom and 

        # conditionally include the static voltage
        rv.ids = build()

        return rv




ims.octupole     = create.octupole(position, geometry, electrical.sinusoidal(350/2, 700000, 0))
ims.inlet        = create.inlet(0, 0, 0)
...








