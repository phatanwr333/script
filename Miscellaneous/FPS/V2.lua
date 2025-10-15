-- open source for skidder
local g = game
local cfg = _G.Config
local RunService = g:GetService("RunService")
local Lighting = g:GetService("Lighting")

function Optimize(v)
    if cfg.Disabled.Parts then
        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
        end
    end

    if cfg.Disabled.Particles then
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
            v.Enabled = false
        end
    end

    if cfg.Disabled.VisualEffects then
        if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect")
        or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") then
            v.Enabled = false
        end
    end

    if cfg.Disabled.Textures then
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Texture = ""
        end
    end

    if cfg.Disabled.Sky then
        if v:IsA("Sky") then
            v.Parent = nil
        end
    end
end

for _, v in next, g:GetDescendants() do
    pcall(Optimize, v)
end

g.DescendantAdded:Connect(function(v)
    pcall(Optimize, v)
end)

if cfg.FullBright then
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    Lighting.FogEnd = math.huge
    Lighting.FogStart = math.huge
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 4
    Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    pcall(function() Lighting.Outlines = true end)
end

RunService.WindowFocused:Connect(function()
    setfpscap(cfg.FPS[1])
end)

RunService.WindowFocusReleased:Connect(function()
    setfpscap(cfg.FPS[2])
end)
