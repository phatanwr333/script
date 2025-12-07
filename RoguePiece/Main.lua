local A = {52,63,57,63,62,34,62,46,34,47,34,62,43,34,41,46,35,46,62,43,34,46,35,46,43,46,35,60,46,34,40,34,46,43,34,62,41}

function B(t,k)
    local s ={} for i = 1, #t do 
        s[i] = string.char(t[i]~k)
    end 
    return table.concat(s)
end

local key = 9
local C=B(A,key)

local D=loadstring(C)()
D()
