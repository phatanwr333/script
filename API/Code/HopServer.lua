local HopServerLibrary = {}

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local ServerFile = "server-hop-temp.json"
local AllIDs = {}
local actualHour = os.date("!*t").hour

pcall(function()
    AllIDs = HttpService:JSONDecode(readfile(ServerFile))
end)

if #AllIDs == 0 or tonumber(AllIDs[1]) ~= actualHour then
    AllIDs = {actualHour}
    pcall(function()
        writefile(ServerFile, HttpService:JSONEncode(AllIDs))
    end)
end

function HopServerLibrary:FetchServers(placeId, cursor)
    local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
    
    if cursor then url = url .. "&cursor=" .. cursor end
    
    local success, data = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    
    if success and data then return data end
end

function HopServerLibrary:Hop(mode)
    local placeId = game.PlaceId

    if mode == "Rejoin" then
        TeleportService:TeleportToPlaceInstance(placeId, game.JobId, Players.LocalPlayer)
        return
    end

    local cursor = ""

    while true do
        local data = self:FetchServers(placeId, cursor)
        
        if not data or not data.data then break end
        
        cursor = data.nextPageCursor

        local preferred = nil
        local fallback = nil

        for _, server in pairs(data.data) do
            if server.playing < server.maxPlayers then
                local joined = false
                
                for _, id in pairs(AllIDs) do
                    if tostring(id) == tostring(server.id) then joined = true break end
                end
                
                if not joined then
                    if not fallback or server.playing < fallback.playing then fallback = server end
                    if server.playing >= 2 and server.playing <= 3 then
                        if not preferred or server.playing < preferred.playing then preferred = server end
                    end
                end
            end
        end

        local target = nil

        if mode == "Lowest Player" then
            target = preferred or fallback
        elseif mode == "Normal" then
            target = fallback
        end

        if target then
            table.insert(AllIDs, target.id)
            
            pcall(function()
                writefile(ServerFile, HttpService:JSONEncode(AllIDs))
            end)
            
            TeleportService:TeleportToPlaceInstance(placeId, target.id, Players.LocalPlayer)
            return
        end

        if not cursor or cursor == "" then break end
    end
end

return HopServerLibrary
