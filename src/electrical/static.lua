
electrical = electrical or {}

function electrical.static(value)
        local rv = {}
        rv.kind = "static"
        rv.voltage = value
        return rv
end

return electrical
