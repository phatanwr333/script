local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local btn_up = Instance.new("TextButton")
local btn_down = Instance.new("TextButton")
local btn_toggle = Instance.new("TextButton")
local lbl_title = Instance.new("TextLabel")
local btn_plus = Instance.new("TextButton")
local lbl_speed = Instance.new("TextLabel")
local btn_minus = Instance.new("TextButton")
local btn_close = Instance.new("TextButton")
local btn_minimize = Instance.new("TextButton")
local btn_restore = Instance.new("TextButton")

gui.Name = "fly_gui"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false

frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
frame.Position = UDim2.new(0.1, 0, 0.38, 0)
frame.Size = UDim2.new(0, 190, 0, 57)
frame.Active = true
frame.Draggable = true

btn_up.Parent = frame
btn_up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
btn_up.Size = UDim2.new(0, 44, 0, 28)
btn_up.Font = Enum.Font.SourceSans
btn_up.Text = "UP"
btn_up.TextColor3 = Color3.new(0, 0, 0)
btn_up.TextSize = 14

btn_down.Parent = frame
btn_down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
btn_down.Position = UDim2.new(0, 0, 0.49, 0)
btn_down.Size = UDim2.new(0, 44, 0, 28)
btn_down.Font = Enum.Font.SourceSans
btn_down.Text = "DOWN"
btn_down.TextColor3 = Color3.new(0, 0, 0)
btn_down.TextSize = 14

btn_toggle.Parent = frame
btn_toggle.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
btn_toggle.Position = UDim2.new(0.7, 0, 0.49, 0)
btn_toggle.Size = UDim2.new(0, 56, 0, 28)
btn_toggle.Font = Enum.Font.SourceSans
btn_toggle.Text = "fly"
btn_toggle.TextColor3 = Color3.new(0, 0, 0)
btn_toggle.TextSize = 14

lbl_title.Parent = frame
lbl_title.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
lbl_title.Position = UDim2.new(0.47, 0, 0, 0)
lbl_title.Size = UDim2.new(0, 100, 0, 28)
lbl_title.Font = Enum.Font.SourceSans
lbl_title.Text = "Fly Script"
lbl_title.TextColor3 = Color3.new(0, 0, 0)
lbl_title.TextScaled = true
lbl_title.TextWrapped = true

btn_plus.Parent = frame
btn_plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
btn_plus.Position = UDim2.new(0.23, 0, 0, 0)
btn_plus.Size = UDim2.new(0, 45, 0, 28)
btn_plus.Font = Enum.Font.SourceSans
btn_plus.Text = "+"
btn_plus.TextColor3 = Color3.new(0, 0, 0)
btn_plus.TextScaled = true

lbl_speed.Parent = frame
lbl_speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
lbl_speed.Position = UDim2.new(0.47, 0, 0.49, 0)
lbl_speed.Size = UDim2.new(0, 44, 0, 28)
lbl_speed.Font = Enum.Font.SourceSans
lbl_speed.Text = "1"
lbl_speed.TextColor3 = Color3.new(0, 0, 0)
lbl_speed.TextScaled = true

btn_minus.Parent = frame
btn_minus.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
btn_minus.Position = UDim2.new(0.23, 0, 0.49, 0)
btn_minus.Size = UDim2.new(0, 45, 0, 29)
btn_minus.Font = Enum.Font.SourceSans
btn_minus.Text = "-"
btn_minus.TextColor3 = Color3.new(0, 0, 0)
btn_minus.TextScaled = true

btn_close.Parent = frame
btn_close.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
btn_close.Font = Enum.Font.SourceSans
btn_close.Size = UDim2.new(0, 45, 0, 28)
btn_close.Text = "X"
btn_close.TextSize = 30
btn_close.Position = UDim2.new(0, 0, -1, 27)

btn_minimize.Parent = frame
btn_minimize.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
btn_minimize.Font = Enum.Font.SourceSans
btn_minimize.Size = UDim2.new(0, 45, 0, 28)
btn_minimize.Text = "-"
btn_minimize.TextSize = 40
btn_minimize.Position = UDim2.new(0, 44, -1, 27)

btn_restore.Parent = frame
btn_restore.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
btn_restore.Font = Enum.Font.SourceSans
btn_restore.Size = UDim2.new(0, 45, 0, 28)
btn_restore.Text = "+"
btn_restore.TextSize = 40
btn_restore.Position = UDim2.new(0, 44, -1, 57)
btn_restore.Visible = false

local fly_enabled = false
local move_speed = 1
local player = game.Players.LocalPlayer
local tpwalk_active = false

function set_humanoid_state(state, enabled)
    local hum = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
    if hum then
        hum:SetStateEnabled(state, enabled)
    end
end

function enable_all_states()
    for _, state in pairs(Enum.HumanoidStateType:GetEnumItems()) do
        set_humanoid_state(state, true)
    end
end

function disable_all_states()
    for _, state in pairs(Enum.HumanoidStateType:GetEnumItems()) do
        set_humanoid_state(state, false)
    end
end

function start_tpwalk()
    tpwalk_active = true
    spawn(function()
        local hb = game:GetService("RunService").Heartbeat
        while tpwalk_active and hb:Wait() do
            local chr = player.Character
            local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
            if hum and hum.MoveDirection.Magnitude > 0 then
                chr:TranslateBy(hum.MoveDirection)
            end
        end
    end)
end

function stop_tpwalk()
    tpwalk_active = false
end

btn_toggle.MouseButton1Click:Connect(function()
    fly_enabled = not fly_enabled
    if not fly_enabled then
        enable_all_states()
        stop_tpwalk()
        player.Character.Animate.Disabled = false
        if player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.PlatformStand = false
        end
        return
    end

    disable_all_states()
    player.Character.Animate.Disabled = true
    if player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.PlatformStand = true
    end
    start_tpwalk()
end)

btn_plus.MouseButton1Click:Connect(function()
    move_speed += 1
    lbl_speed.Text = tostring(move_speed)
    if fly_enabled then
        stop_tpwalk()
        start_tpwalk()
    end
end)

btn_minus.MouseButton1Click:Connect(function()
    if move_speed > 1 then
        move_speed -= 1
        lbl_speed.Text = tostring(move_speed)
        if fly_enabled then
            stop_tpwalk()
            start_tpwalk()
        end
    else
        lbl_speed.Text = "min 1"
        task.wait(1)
        lbl_speed.Text = tostring(move_speed)
    end
end)

btn_close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

btn_minimize.MouseButton1Click:Connect(function()
    btn_up.Visible = false
    btn_down.Visible = false
    btn_toggle.Visible = false
    btn_plus.Visible = false
    lbl_speed.Visible = false
    btn_minus.Visible = false
    btn_minimize.Visible = false
    btn_restore.Visible = true
    frame.BackgroundTransparency = 1
    btn_close.Position = UDim2.new(0, 0, -1, 57)
end)

btn_restore.MouseButton1Click:Connect(function()
    btn_up.Visible = true
    btn_down.Visible = true
    btn_toggle.Visible = true
    btn_plus.Visible = true
    lbl_speed.Visible = true
    btn_minus.Visible = true
    btn_minimize.Visible = true
    btn_restore.Visible = false
    frame.BackgroundTransparency = 0
    btn_close.Position = UDim2.new(0, 0, -1, 27)
end)

local hold_up = false
local hold_down = false

btn_up.MouseButton1Down:Connect(function()
    hold_up = true
    while hold_up do
        task.wait()
        player.Character.HumanoidRootPart.CFrame *= CFrame.new(0, 1, 0)
    end
end)

btn_up.MouseButton1Up:Connect(function()
    hold_up = false
end)

btn_down.MouseButton1Down:Connect(function()
    hold_down = true
    while hold_down do
        task.wait()
        player.Character.HumanoidRootPart.CFrame *= CFrame.new(0, -1, 0)
    end
end)

btn_down.MouseButton1Up:Connect(function()
    hold_down = false
end)

player.CharacterAdded:Connect(function(char)
    task.wait(0.7)
    local hum = char:FindFirstChildWhichIsA("Humanoid")
    if hum then
        hum.PlatformStand = false
    end
    char:WaitForChild("Animate").Disabled = false
end)
