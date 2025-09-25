local LibraryName = "Notification Library"
local TweenService = game:GetService("TweenService")

local CoreGui = nil
pcall(function()
    CoreGui = cloneref(game:GetService("CoreGui"))
end)
if not CoreGui then
    CoreGui = game:GetService("CoreGui")
end

local NotificationLibrary = {}
local library
local templateFolder
local canvas

local function ensureLibraryLoaded()
    local existing = CoreGui:FindFirstChild(LibraryName)
    if existing then
        library = existing
    else
        local ok, res = pcall(function()
            return game:GetObjects("rbxassetid://15133757123")[1]
        end)
        if not ok or not res then
            warn("[NotificationLibrary] Failed to load library asset (rbxassetid://15133757123).")
            return false
        end

        library = res
        library.Name = LibraryName
        library.Parent = CoreGui
    end

    templateFolder = library:FindFirstChild("Templates") or library:WaitForChild("Templates", 5)
    canvas = library:FindFirstChild("list") or library:WaitForChild("list", 5)

    if not templateFolder or not canvas then
        warn("[NotificationLibrary] Library missing required children: Templates or list.")
        return false
    end

    return true
end

local function safeWaitFor(parent, name, timeout)
    timeout = timeout or 5
    local ok, child = pcall(function() return parent:WaitForChild(name, timeout) end)
    if ok then return child end
    return nil
end

function NotificationLibrary:Load()
    local ok = ensureLibraryLoaded()
    if not ok then
        error("[NotificationLibrary] Could not load notification library.")
    end
end

local function getTemplate(mode)
    if not templateFolder then return nil end
    local template = templateFolder:FindFirstChild(mode) or safeWaitFor(templateFolder, mode, 2)
    return template
end

function NotificationLibrary:SendNotification(Mode, Text, Duration)
    Mode = tostring(Mode or "Info")
    Text = tostring(Text or "")
    Duration = tonumber(Duration) or 3

    local loaded = ensureLibraryLoaded()
    if not loaded then
        warn("[NotificationLibrary] Library not loaded, aborting SendNotification.")
        return
    end

    local template = getTemplate(Mode)
    if not template then
        warn(("[NotificationLibrary] Invalid theme: %s"):format(tostring(Mode)))
        return
    end

    task.spawn(function()
        local success, err = pcall(function()
            local Notification = template:Clone()
            if not Notification then error("Clone failed") end

            local filler = Notification:FindFirstChild("Filler") or Notification:WaitForChild("Filler", 2)
            local bar = Notification:FindFirstChild("bar") or Notification:WaitForChild("bar", 2)
            local header = Notification:FindFirstChild("Header") or Notification:FindFirstChildWhichIsA("TextLabel")

            if not filler or not bar or not header then
                error("Template missing required children (Filler/bar/Header).")
            end

            header.Text = Text

            Notification.Visible = true
            Notification.Parent = canvas

            Notification.Size = UDim2.new(0, 0, 0.087, 0)
            filler.Size = UDim2.new(1, 0, 1, 0)
            bar.Size = UDim2.new(0, 0, 0.05, 0)

            local openTween = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local progressTween = TweenInfo.new(Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
            local closeTween = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

            TweenService:Create(Notification, openTween, {Size = UDim2.new(1, 0, 0.087, 0)}):Play()
            task.wait(0.2)

            TweenService:Create(filler, closeTween, {Size = UDim2.new(0.011, 0, 1, 0)}):Play()

            TweenService:Create(bar, progressTween, {Size = UDim2.new(1, 0, 0.05, 0)}):Play()

            task.wait(Duration)

            TweenService:Create(filler, openTween, {Size = UDim2.new(1, 0, 1, 0)}):Play()
            task.wait(0.25)
            TweenService:Create(Notification, closeTween, {Size = UDim2.new(0, 0, 0.087, 0)}):Play()
            task.wait(0.25)

            if Notification and Notification.Parent then
                Notification:Destroy()
            end
        end)

        if not success then
            warn("[NotificationLibrary] Error while creating notification:", err)
        end
    end)
end

return NotificationLibrary
