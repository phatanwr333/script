-- open source for skidder
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
local cfg = _G.Config
local RunService = g:GetService("RunService")

t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0

l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"

function Optimize(v)
	if cfg.Disabled.Parts then
		if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") 
		or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = Enum.Material.SmoothPlastic
			v.Reflectance = 0
		end
	end

	if cfg.DecalsHidden and v:IsA("Decal") then
		v.Transparency = 1
	end

	if cfg.Disabled.Particles then
		if v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		end
        if v:IsA("Explosion") then
		    v.BlastPressure = 1
		    v.BlastRadius = 1
	    end
	end

	if cfg.Disabled.VisualEffects then
		if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") 
		or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") 
		or v:IsA("DepthOfFieldEffect") then
			v.Enabled = false
		end
	end
end

for _, v in ipairs(g:GetDescendants()) do
	pcall(Optimize, v)
end

g.DescendantAdded:Connect(function(v)
	pcall(Optimize, v)
end)

if cfg.FullBright then
	l.FogColor = Color3.fromRGB(255, 255, 255)
	l.FogEnd = math.huge
	l.FogStart = math.huge
	l.Ambient = Color3.fromRGB(255, 255, 255)
	l.Brightness = 4
	l.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
	l.ColorShift_Top = Color3.fromRGB(255, 255, 255)
	l.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
	pcall(function() l.Outlines = true end)
end

RunService.WindowFocused:Connect(function()
	setfpscap(cfg.FPS[1])
end)

RunService.WindowFocusReleased:Connect(function()
	setfpscap(cfg.FPS[2])
end)
