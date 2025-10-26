local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local window = library.Window("All in One")

local xd = "https://raw.githubusercontent.com/phatanwr333/script/refs/heads/main/Miscellaneous/"

local support = xd .. "Support/"
local anti = xd .. "Anti/"

window:Button("Save Instance", function()
    setclipboard(support .. "SaveIntances.lua")
end)

window:Button("Copy CFrame", function()
    local plr = game.Players.LocalPlayer.Character
    if plr and plr:FindFirstChild("HumanoidRootPart") then
        local pos = plr.HumanoidRootPart.CFrame.Position
        setclipboard(string.format("CFrame.new(%f, %f, %f)", pos.X, pos.Y, pos.Z))
    else
        warn("humanoidRootPart not found")
    end
end)

window:Button("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

window:Button("Fly", function()
    loadstring(game:HttpGet(support .. "Fly.lua"))()
end)

window:Button("Dex Explorer", function()
    loadstring(game:HttpGet(support .. "DexExplorer.lua"))()
end)

window:Button("Remote Spy", function()
    loadstring(game:HttpGet(support .. "RemoteSpy.lua"))()
end)

window:Button("Turtle Spy", function()
    loadstring(game:HttpGet(support .. "TurtleSpy.lua"))()
end)

window:Button("Anti AFK", function()
    loadstring(game:HttpGet(anti .. "AntiAFK.lua"))()
end)
