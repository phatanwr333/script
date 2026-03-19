local ScriptUrl = "https://api.jnkie.com/api/v1/luascripts/public/4dfe5763b0c0c46fcadb29cdd8ebdc771e340dd8ebb75478f3c10d5695207ecc/download"

function Execute(url)
    local Response
    repeat
        task.wait(2)
        print("Attempting to fetch loader script...")
        
        pcall(function()
            Response = game:HttpGet(url)
        end)
    until Response and Response ~= ""

    print("Loader fetched successfully! Executing...")
    
    local LoadSuccess, err = pcall(function()
        loadstring(Response)()
    end)

    if not LoadSuccess then
        warn("Failed to execute script, reason: " .. tostring(err))
    end
end

Execute(ScriptUrl)
