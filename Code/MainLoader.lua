local ScriptUrl = "https://api.junkie-development.de/api/v1/luascripts/public/4dfe5763b0c0c46fcadb29cdd8ebdc771e340dd8ebb75478f3c10d5695207ecc/download"

if getgenv().SCRIPT_KEY == nil then getgenv().SCRIPT_KEY = "" end

function Execute(url)
    local Success, Response = pcall(function()
        return game:HttpGet(url)
    end)

    if Success and Response then
        local LoadSuccess, err = pcall(function()
            loadstring(Response)()
        end)

        if not LoadSuccess then
            warn("Failed to execute script, reason: " .. tostring(err))
        end
    end
end

Execute(ScriptUrl)
