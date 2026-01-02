local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local plr = game:GetService("Players").LocalPlayer

UserInputService.WindowFocusReleased:Connect(function()
    RunService.Stepped:Wait()
    if firesignal then
        pcall(firesignal, UserInputService.WindowFocused)
    end
end)

plr.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
