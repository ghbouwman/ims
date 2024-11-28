
-- test
local convert = require("convert")

local setups = require("setups")
local setup = setups.ims

for k, v in pairs(setup) do
        print(convert.to_gu(v))
end



-- create the setup





-- main loop





local total_time = 1    -- total simulation time in seconds

local f      = setup.octupole.freq        
local A      = setup.octupole.Vamplitude 
local offset = setup.octupole.offset      

local function calculate_voltage(t)
    return offset + A * math.sin(2 * math.pi * f * t)
end

-- Loop to update voltages
local time = 0
while time <= total_time do

    local voltage = calculate_voltage(time)

    simion.pas:set_electrode_voltage(2, voltage)

    -- debug
    print(string.format("Time: %.2f s, Voltage: %.2f V", time, voltage))

    -- timestep
    time = time + time_step
end
