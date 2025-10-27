local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runServices = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

local pl = players.LocalPlayer
local mouse = pl:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)

print([[

╔═══════════════════════════════════════╗
║ ██╗  ██╗███████╗██╗  ██╗██╗   ██╗███████╗║
║ ███╗ ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝║
║ ██╔╝██╔╝█████╗   ╚███╔╝ ██║   ██║███████╗║
║ ██║ ██║ ██╔══╝   ██╔██╗ ██║   ██║╚════██║║
║ ██║ ██║ ███████╗██╔╝ ██╗╚██████╔╝███████║║
║ ╚═╝ ╚═╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝║
║          by trinyx | v4.0.0             ║
╚═══════════════════════════════════════╝
]])

local Library = {}

local fontall = Enum.Font.Gotham
local fontSize = 20

--local fontone = "rbxassetid://12187365364"
--fontall = Font.new("rbxasset://fonts/GothamSSm-Bold.otf", Enum.FontWeight.Regular, Enum.FontStyle.Normal);

local Themes = {

	DarkBlue = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(15, 24, 32),

		ButtonColor = Color3.fromRGB(22, 36, 49),
		ButtonInputStrokeColor = Color3.fromRGB(97, 97, 97),
		--dropdown
		DropDownColor = Color3.fromRGB(22, 36, 49),
		DropDownOptionsColor = Color3.fromRGB(46, 77, 104),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(97, 97, 97),
		DropDownInputStrokeColor = Color3.fromRGB(97, 97, 97),
		--label
		LabelColor = Color3.fromRGB(22, 36, 49),
		LabelInputStrokeColor = Color3.fromRGB(10, 91, 97),
		--slider
		SliderColor = Color3.fromRGB(22, 36, 49),
		SliderBackColor = Color3.fromRGB(14, 21, 33),
		SliderFillColor = Color3.fromRGB(39, 59, 91),
		SliderStrokeAll = Color3.fromRGB(97, 97, 97),
		--toggle
		ToggleColor = Color3.fromRGB(22, 36, 49),
		ToggleCheckColorInactive = Color3.fromRGB(15, 24, 33),
		ToggleCheckColor = Color3.fromRGB(42, 128, 136),
		--not naming this shit
		TopBar = Color3.fromRGB(),
		TopBarInputStrokeColor = Color3.fromRGB(10, 16, 22),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(150, 182, 182),
		DockColor = Color3.fromRGB(15, 24, 32),
		TextColor = Color3.fromRGB(255,255,255),
		--Pops Ups
		PopUpColor = Color3.fromRGB(22, 36, 48),
		PopUpButtonColor = Color3.fromRGB(36, 60, 98),
		PopUpStroke = Color3.fromRGB(86, 86, 86),
		InputStrokeColor = Color3.fromRGB(97, 97, 97),

		TextInputColor = Color3.fromRGB(22, 36, 49),
		TabColor = Color3.fromRGB(134, 134, 134),
		NotificationColor = Color3.fromRGB(22, 36, 48),
		NotificationInputStrokeColor = Color3.fromRGB(199, 138, 16),
		NotificationSeperatorColor = Color3.fromRGB(42, 56, 68),
		
		SeperatorColor = Color3.fromRGB(22, 36, 49),
		SeperatorStrokeColor= Color3.fromRGB(75, 75, 75)
	},
	NexusTheme = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(26, 15, 32),

		ButtonColor = Color3.fromRGB(49, 27, 65),
		ButtonInputStrokeColor = Color3.fromRGB(0, 0, 0),
		--dropdown
		DropDownColor = Color3.fromRGB(49, 27, 65),
		DropDownOptionsColor = Color3.fromRGB(83, 46, 111),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(0,0,0),
		DropDownInputStrokeColor = Color3.fromRGB(0,0,0),
		--label
		LabelColor = Color3.fromRGB(32, 18, 43),
		LabelInputStrokeColor = Color3.fromRGB(66, 18, 138),
		--slider
		SliderColor = Color3.fromRGB(49, 27, 65),
		SliderBackColor = Color3.fromRGB(14, 21, 33),
		SliderFillColor = Color3.fromRGB(105, 59, 141),
		SliderStrokeAll = Color3.fromRGB(120,120,120),
		--toggle
		ToggleColor = Color3.fromRGB(49, 27, 65),
		ToggleCheckColorInactive = Color3.fromRGB(33, 18, 44),
		ToggleCheckColor = Color3.fromRGB(118, 66, 158),
		--not naming this shit
		TopBar = Color3.fromRGB(47, 37, 70),
		TopBarInputStrokeColor = Color3.fromRGB(10, 16, 22),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(150, 182, 182),
		DockColor = Color3.fromRGB(26, 15, 32),
		TextColor = Color3.fromRGB(255,255,255),
		InputStrokeColor = Color3.fromRGB(0, 0, 0),
		--Pops Ups
		PopUpColor = Color3.fromRGB(34, 19, 45),
		PopUpButtonColor = Color3.fromRGB(91, 51, 121),
		PopUpStroke = Color3.fromRGB(120, 103, 140),
		TextInputColor = Color3.fromRGB(49, 27, 65),
		TabColor = Color3.fromRGB(134, 134, 134),

		NotificationColor = Color3.fromRGB(40, 21, 48),
		NotificationInputStrokeColor = Color3.fromRGB(161, 9, 199),
		NotificationSeperatorColor = Color3.fromRGB(60, 41, 68),
		
		SeperatorColor = Color3.fromRGB(49, 27, 65),
		SeperatorStrokeColor= Color3.fromRGB(0, 0, 0)
	},
	DarkGreen = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(20, 30, 20),

		ButtonColor = Color3.fromRGB(30, 45, 30),
		
		SeperatorColor = Color3.fromRGB(30, 45, 30),
		SeperatorStrokeColor= Color3.fromRGB(97, 97, 97),
		
		ButtonInputStrokeColor = Color3.fromRGB(97, 97, 97),
		TextInputColor = Color3.fromRGB(30, 45, 30),
		InputStrokeColor = Color3.fromRGB(97, 97, 97),
		--dropdown
		DropDownColor = Color3.fromRGB(30, 45, 30),
		DropDownOptionsColor = Color3.fromRGB(50, 80, 50),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(90, 90, 90),
		DropDownInputStrokeColor = Color3.fromRGB(97, 97, 97),
		--label
		LabelColor = Color3.fromRGB(30, 45, 30),
		LabelInputStrokeColor = Color3.fromRGB(20, 80, 20),
		--slider
		SliderColor = Color3.fromRGB(30, 45, 30),
		SliderBackColor = Color3.fromRGB(20, 30, 20),
		SliderFillColor = Color3.fromRGB(40, 60, 40),
		SliderStrokeAll = Color3.fromRGB(97, 97, 97),
		--toggle
		ToggleColor = Color3.fromRGB(30, 45, 30),
		ToggleCheckColorInactive = Color3.fromRGB(20, 30, 20),
		ToggleCheckColor = Color3.fromRGB(50, 150, 50),
		--not naming this shit
		TopBar = Color3.fromRGB(10, 20, 10),
		TopBarInputStrokeColor = Color3.fromRGB(10, 20, 10),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(150, 182, 182),
		DockColor = Color3.fromRGB(20, 30, 20),
		TextColor = Color3.fromRGB(255,255,255),
		PopUpColor = Color3.fromRGB(25, 39, 18),
		PopUpButtonColor = Color3.fromRGB(35, 98, 40),PopUpStroke = Color3.fromRGB(70, 86, 60),
		TabColor = Color3.fromRGB(134, 134, 134),

		NotificationColor = Color3.fromRGB(34, (72-5), 30),
		NotificationInputStrokeColor = Color3.fromRGB(159, 199, 16),
		NotificationSeperatorColor = Color3.fromRGB(54, 87, 50),
	},
	DarkRed = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(32, 15, 15),

		ButtonColor = Color3.fromRGB(49, 22, 22),
		SeperatorColor = Color3.fromRGB(49, 22, 22),
		SeperatorStrokeColor= Color3.fromRGB(97, 50, 50),
		
		TextInputColor = Color3.fromRGB(49, 22, 22),
		ButtonInputStrokeColor = Color3.fromRGB(97, 50, 50),
		InputStrokeColor = Color3.fromRGB(97, 50, 50),
		--dropdown
		DropDownColor = Color3.fromRGB(49, 22, 22),
		DropDownOptionsColor = Color3.fromRGB(104, 46, 46),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(97, 50, 50),
		DropDownInputStrokeColor = Color3.fromRGB(97, 50, 50),
		--label
		LabelColor = Color3.fromRGB(49, 22, 22),
		LabelInputStrokeColor = Color3.fromRGB(97, 50, 50),
		--slider
		SliderColor = Color3.fromRGB(49, 22, 22),
		SliderBackColor = Color3.fromRGB(33, 14, 14),
		SliderFillColor = Color3.fromRGB(91, 39, 39),
		SliderStrokeAll = Color3.fromRGB(97, 50, 50),
		--toggle
		ToggleColor = Color3.fromRGB(49, 22, 22),
		ToggleCheckColorInactive = Color3.fromRGB(33, 15, 15),
		ToggleCheckColor = Color3.fromRGB(136, 42, 42),
		--not naming this shit
		TopBar = Color3.fromRGB(22, 10, 10),
		TopBarInputStrokeColor = Color3.fromRGB(22, 10, 10),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(182, 150, 150),
		DockColor = Color3.fromRGB(32, 15, 15),
		TextColor = Color3.fromRGB(255,255,255),
		PopUpColor = Color3.fromRGB(56, 26, 26),
		PopUpButtonColor = Color3.fromRGB(130, 38, 38),
		PopUpStroke = Color3.fromRGB(148, 33, 33),
		TabColor = Color3.fromRGB(134, 134, 134),
		NotificationColor = Color3.fromRGB(32, 15, 15),
		NotificationInputStrokeColor = Color3.fromRGB(199, 138, 16),
		NotificationSeperatorColor = Color3.fromRGB(32+20, 15+20, 15+20),
	},
	LightYellow = {
		isDark = false,
		BackgroundColor = Color3.fromRGB(234, 234, 173),

		ButtonColor = Color3.fromRGB(240, 240, 200),
		SeperatorColor = Color3.fromRGB(240,240,200),
		SeperatorStrokeColor= Color3.fromRGB(210, 210, 170),
		TextInputColor = Color3.fromRGB(240, 240, 200),
		ButtonInputStrokeColor = Color3.fromRGB(210, 210, 170),
		InputStrokeColor = Color3.fromRGB(210, 210, 170),
		--dropdown
		DropDownColor = Color3.fromRGB(240, 240, 200),
		DropDownOptionsColor = Color3.fromRGB(220, 220, 190),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(210, 210, 170),
		DropDownInputStrokeColor = Color3.fromRGB(210, 210, 170),
		--label
		LabelColor = Color3.fromRGB(240, 240, 200),
		LabelInputStrokeColor = Color3.fromRGB(210, 210, 170),
		--slider
		SliderColor = Color3.fromRGB(240, 240, 200),
		SliderBackColor = Color3.fromRGB(255, 255, 220),
		SliderFillColor = Color3.fromRGB(230, 230, 190),
		SliderStrokeAll = Color3.fromRGB(210, 210, 170),
		--toggle
		ToggleColor = Color3.fromRGB(240, 240, 200),
		ToggleCheckColorInactive = Color3.fromRGB(255, 255, 220),
		ToggleCheckColor = Color3.fromRGB(200, 200, 160),
		--not naming this shit
		TopBar = Color3.fromRGB(220, 220, 180),
		TopBarInputStrokeColor = Color3.fromRGB(220, 220, 180),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(182, 182, 150),
		DockColor = Color3.fromRGB(255, 255, 220),
		TextColor = Color3.fromRGB(0,0,0),
		PopUpColor = Color3.fromRGB(218, 218, 162),
		PopUpButtonColor = Color3.fromRGB(158, 156, 132),
		PopUpStroke = Color3.fromRGB(182, 175, 76),
		TabColor = Color3.fromRGB(67, 67, 67),
		NotificationColor = Color3.fromRGB(234, 234, 173),
		NotificationInputStrokeColor = Color3.fromRGB(199, 138, 16),
		NotificationSeperatorColor = Color3.fromRGB(254, 254, 193),
	},
	LightBlue = {
		isDark = false,
		BackgroundColor = Color3.fromRGB(194, 227, 255),

		ButtonColor = Color3.fromRGB(200, 220, 240),
		SeperatorColor = Color3.fromRGB(200,220,240),
		SeperatorStrokeColor= Color3.fromRGB(170, 190, 210),
		TextInputColor = Color3.fromRGB(200, 220, 240),
		ButtonInputStrokeColor = Color3.fromRGB(170, 190, 210),
		InputStrokeColor = Color3.fromRGB(170, 190, 210),
		--dropdown
		DropDownColor = Color3.fromRGB(200, 220, 240),
		DropDownOptionsColor = Color3.fromRGB(190, 210, 230),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(140, 160, 180),
		DropDownInputStrokeColor = Color3.fromRGB(140, 160, 180),
		--label
		LabelColor = Color3.fromRGB(200, 220, 240),
		LabelInputStrokeColor = Color3.fromRGB(150, 170, 190),
		--slider
		SliderColor = Color3.fromRGB(200, 220, 240),
		SliderBackColor = Color3.fromRGB(220, 230, 255),
		SliderFillColor = Color3.fromRGB(190, 210, 230),
		SliderStrokeAll = Color3.fromRGB(130,150,170),
		--toggle
		ToggleColor = Color3.fromRGB(200, 220, 240),
		ToggleCheckColorInactive = Color3.fromRGB(220, 230, 255),
		ToggleCheckColor = Color3.fromRGB(160, 180, 200),
		--not naming this shit
		TopBar = Color3.fromRGB(180, 200, 220),
		TopBarInputStrokeColor = Color3.fromRGB(180, 200, 220),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(150, 150, 182),
		DockColor = Color3.fromRGB(208, 227, 255),
		TextColor = Color3.fromRGB(0,0,0),
		PopUpColor = Color3.fromRGB(194, 218, 255),
		PopUpButtonColor = Color3.fromRGB(175, 199, 255),
		PopUpStroke = Color3.fromRGB(176, 176, 176),
		TabColor = Color3.fromRGB(67, 67, 67),
		NotificationColor = Color3.fromRGB(194, 227, 255),
		NotificationInputStrokeColor = Color3.fromRGB(199, 138, 16),
		NotificationSeperatorColor = Color3.fromRGB(194-20, 227-20, 255-20),
	},
	Black = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(32, 32, 32),

		ButtonColor = Color3.fromRGB(49, 49, 49),
		SeperatorColor = Color3.fromRGB(49, 49, 49),
		SeperatorStrokeColor= Color3.fromRGB(97, 97, 97),

		TextInputColor = Color3.fromRGB(49, 49, 49),
		ButtonInputStrokeColor = Color3.fromRGB(97, 97, 97),
		InputStrokeColor = Color3.fromRGB(97, 97, 97),
		--dropdown
		DropDownColor = Color3.fromRGB(49, 49, 49),
		DropDownOptionsColor = Color3.fromRGB(104, 104, 104),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(97, 97, 97),
		DropDownInputStrokeColor = Color3.fromRGB(97, 97, 97),
		--label
		LabelColor = Color3.fromRGB(49, 49, 49),
		LabelInputStrokeColor = Color3.fromRGB(97, 97, 97),
		--slider
		SliderColor = Color3.fromRGB(49, 49, 49),
		SliderBackColor = Color3.fromRGB(33, 33, 33),
		SliderFillColor = Color3.fromRGB(91, 91, 91),
		SliderStrokeAll = Color3.fromRGB(97, 97, 97),
		--toggle
		ToggleColor = Color3.fromRGB(49, 49, 49),
		ToggleCheckColorInactive = Color3.fromRGB(33, 33, 33),
		ToggleCheckColor = Color3.fromRGB(136, 136, 136),
		--not naming this shit
		TopBar = Color3.fromRGB(22, 22, 22),
		TopBarInputStrokeColor = Color3.fromRGB(22, 22, 22),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(182, 182, 182),
		DockColor = Color3.fromRGB(32, 32, 32),
		TextColor = Color3.fromRGB(255, 255, 255),
		PopUpColor = Color3.fromRGB(185, 185, 185),
		PopUpButtonColor = Color3.fromRGB(130, 130, 130),
		PopUpStroke = Color3.fromRGB(108, 108, 108),
		TabColor = Color3.fromRGB(134, 134, 134),
		NotificationColor = Color3.fromRGB(32, 32, 32),
		NotificationInputStrokeColor = Color3.fromRGB(199, 199, 199),
		NotificationSeperatorColor = Color3.fromRGB(52, 52, 52),
	}

}

local Theme = Themes.DarkBlue
local AnimationStatus = true

function Library:Validate(defaults,options)

	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end
function Library:tween(object, goal, time, easeStyle,EaseDirection, callback)
	if AnimationStatus then
		local tweenInfo = TweenInfo.new(
			time or 0.15,
			easeStyle or Enum.EasingStyle.Back,
			EaseDirection or Enum.EasingDirection.Out
		)
		local tween = tweenService:Create(object, tweenInfo, goal)
		tween.Completed:Connect(callback or function() end)
		tween:Play()
	else
		for property, value in pairs(goal) do
			object[property] = value
		end
		if callback ~= nil then
			callback()
		end
	end
end

local allthings = {}

function Library:new(options)
	options = Library:Validate({
		name = "Default",
		Style = "Bottom",
		Theme = "Dark",
		DockPos = nil,
		ToggleKey = Enum.KeyCode.RightShift,
		KeySystemConfig = {
			KeySystem = true,
			Key = "",
			KeyLink = "https://discord.gg/uusn8yjs2z",
			KeySystemText = {
				Text = "Text",
				Title = "Title",
				--deprecated/removed
				SmallTitle = nil
			}
		},
	},options or {})
	
	if options.DockPos ~= nil then
		options.Style = options.DockPos
	end
	--Themes
do
	if options.Theme == "Dark" then
		Theme = Themes.Black
	elseif options.Theme == "LightBlue" then
		Theme = Themes.LightBlue
	elseif options.Theme == "LightYellow" then
		Theme = Themes.LightYellow
	elseif options.Theme == "DarkGreen" then
		Theme = Themes.DarkGreen
	elseif options.Theme == "DarkRed" then
		Theme = Themes.DarkRed
	elseif options.Theme == "DarkBlue" then
		Theme = Themes.DarkBlue
	elseif options.Theme == "Nexus" then
		Theme = Themes.NexusTheme
	else
		Theme = Themes.Black
	end
end
	local CurrentTheme = Themes.DarkBlue

	local GUI = {
		Active = false,
		CurrentTab = nil,
		Visibility = not options.KeySystemConfig.KeySystem,
		HasKeyBeenInputed = not options.KeySystemConfig.KeySystem,
		IsAPopUpCreated = false,
		currentKey = options.ToggleKey,
		Style = options.Style
	}

	export type Asset = {
		IconName: string, -- "icon-name"
		Id: number, -- 123456789
		Url: string, -- "rbxassetid://123456789"
		ImageRectSize: Vector2, -- Vector2.new(48, 48)
		ImageRectOffset: Vector2, -- Vector2.new(648, 266)
	}
	
	local function addColors(color1, color2)
		return Color3.new(
			math.min(color1.R + color2.R, 1),
			math.min(color1.G + color2.G, 1),
			math.min(color1.B + color2.B, 1)
		)
	end
	--LUCIDE

	local Icons = loadstring(game:HttpGet("https://pastebin.com/raw/JuJMrK3F"))()
	local VersionInfo = {
		PackageVersion = "0.1.3", -- The version of this `lucide-roblox` package
		LucideVersion = "0.363.0" -- The version of the Lucide icon set itself the package ver noted above is on
	}
	
	local Type = typeof or type
	local function CheckArgTypes(funcName: string, inputArgs: {any}, typeEntries: {[number]: {string}})
		for ArgIndex, TypeEntryArray in typeEntries do
			local ArgName = TypeEntryArray[1]
			local ExpectedType = TypeEntryArray[2]
			
			local InputArg = inputArgs[ArgIndex]
			local InputArgType = Type(InputArg)
	
			if InputArgType ~= ExpectedType then
				error(funcName .. ": Argument " .. ArgIndex .. " (" .. ArgName .. "): expected type `" .. ExpectedType .. "`, got `" .. InputArgType .. "`", 3)
			end
		end
	end
	
	local function TrimIconIdentifier(inputIconIdentifier: string): string
		return string.match(string.lower(inputIconIdentifier), "^%s*(.*)%s*$") :: string
	end
	
	local function ApplyToInstance(object: Instance, properties: {[string]: any}): Instance
		if properties then
			for Property, Value in properties do
				if Property ~= "Parent" then
					object[Property] = Value
				end
			end
	
			if properties.Parent then
				object.Parent = properties.Parent
			end
		end
	
		return object
	end
	
	-- See /version-info.luau
	local Lucide = {
		PackageVersion = VersionInfo.PackageVersion,
		LucideVersion = VersionInfo.LucideVersion,
	}
	
	-- Add all icon names to an array
	do
		local IconNames: {string} = {}
		local _, FirstIconIndex = next(Icons) -- If it's actually `{}`, we're in trouble..
		FirstIconIndex = FirstIconIndex or {}
	
		for IconName in FirstIconIndex do
			table.insert(IconNames, IconName)
		end
	
		table.sort(IconNames)
		table.freeze(IconNames)
		Lucide.IconNames = IconNames
	end
	
	--[[
		Attempts to retrieve and wrap an asset object from a specified icon name, with
		an optional target icon size argument, fetching the closest to what's supported
	
		*Will* throw an error if the icon name provided is invalid/not found
	
		*Example:*
		```lua
		local Asset = Lucide.GetAsset("server", 48) -- iconSize will default to `256` if not provided
		assert(Asset, "Failed to fetch asset!")
	
		print(Asset.IconName) -- "server"
		print(Asset.Id) -- 15269177520
		print(Asset.Url) -- "rbxassetid://15269177520"
		print(Asset.ImageRectSize) -- Vector2.new(48, 48)
		print(Asset.ImageRectOffset) -- Vector2.new(0, 771)
		```
	]]
	function Lucide.GetAsset(iconName: string, iconSize: number?): Asset
		local IconSize = if iconSize == nil then 256 else iconSize
	
		CheckArgTypes("Lucide.GetAsset", {iconName, IconSize}, {
			[1] = {"iconName", "string"},
			[2] = {"iconSize", "number"},
		})
	
		local IconName = TrimIconIdentifier(iconName)
	
		-- If reading directly from a UI obj w/ a negative size..?
		if IconSize < 0 then
			IconSize = -IconSize
		end
	
		local RealSizeIndex = if IconSize <= 48 then "48px" else "256px"
		local IconIndexDict = Icons[RealSizeIndex]
	
		if not IconIndexDict then
			error("Lucide.GetAsset: Internal error: Failed to find icon index for specified size")
		end
	
		local RawAsset = IconIndexDict[IconName]
		local RawAsset = IconIndexDict[IconName]
if not RawAsset then
    return {
        IconName = "blank",
        Id = 10709790468, -- your fallback icon id
        Url = "rbxassetid://10709790468",
        ImageRectSize = Vector2.new(48, 48),
        ImageRectOffset = Vector2.new(0, 0)
    }
end
	
		local Id = RawAsset[1]
		local RawImageRectSize = RawAsset[2]
		local RawImageRectOffset = RawAsset[3]
	
		if type(Id) ~= "number" or type(RawImageRectSize) ~= "table" or type(RawImageRectOffset) ~= "table" then
			error("Lucide.GetAsset: Internal error: Invalid auto-generated asset entry")
		end
	
		local Url = "rbxassetid://" .. Id
		local ImageRectSize = Vector2.new(RawImageRectSize[1], RawImageRectSize[2])
		local ImageRectOffset = Vector2.new(RawImageRectOffset[1], RawImageRectOffset[2])
	
		local Asset: Asset = {
			IconName = IconName,
			Id = Id,
			Url = Url,
			ImageRectSize = ImageRectSize,
			ImageRectOffset = ImageRectOffset,
		}
	
		return Asset
	end
	




	
	function Lucide.GetAllAssets(inputSize: number?): {Asset}
		local InputSize = if inputSize == nil then 256 else inputSize
	
		CheckArgTypes("Lucide.GetAllAssets", {InputSize}, {
			[1] = {"inputSize", "number"},
		})
	
		local Assets = {}
	
		for _, IconName in Lucide.IconNames do
			local Asset = Lucide.GetAsset(IconName, InputSize)
			if Asset then
				table.insert(Assets, Asset)
			end
		end
	
		-- `Lucide.IconNames` is already pre-sorted
		return Assets
	end
	
	--[[
		Wrapper around `Lucide.GetAsset()` that fetches asset info for the specified
		icon name and size, anc creates an `ImageLabel` Instance. Accepts an additional
		optional argument for providing a table of properties to automatically apply
		after the asset has been applied to said `ImageLabel`
	
		Without providing any extra property overrides, the icon is colored to its
		default of #FFFFFF, and theinput from the `imageSize` argument is the
		offset value of `ImageLabel.Size`
	
		Throws an error under the same terms as `Lucide.GetAsset()`
	
		*Example:*
		```lua
		local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
		local ScreenGui = Instance.new("ScreenGui")
	
		Lucide.ImageLabel("server-crash", 256, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
	
			Parent = ScreenGui,
		})
	
		ScreenGui.Parent = PlayerGui
		```
	]]
	function Lucide.ImageLabel(iconName: string, imageSize: number?, propertyOverrides: {[string]: any}?): ImageLabel
		local ImageSize = if imageSize == nil then 256 else imageSize
		local PropertyOverrides = if propertyOverrides == nil then {} else propertyOverrides
	
		CheckArgTypes("Lucide.ImageLabel", {iconName, imageSize, propertyOverrides}, {
			[1] = {"iconName", "string"},
			[2] = {"imageSize", "number"},
			[3] = {"propertyOverrides", "table"}
		})
	
		local Asset = Lucide.GetAsset(iconName, ImageSize)
	
		local ImageLabel = ApplyToInstance(Instance.new("ImageLabel"), {
			Name = Asset.IconName,
	
			Size = UDim2.fromOffset(ImageSize, ImageSize),
	
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
	
			Image = Asset.Url,
			ImageRectSize = Asset.ImageRectSize,
			ImageRectOffset = Asset.ImageRectOffset,
			ImageColor3 = Color3.new(1, 1, 1), -- #FFFFFF
			ScaleType = Enum.ScaleType.Fit,
		})
	
		-- Apply any provided overrides
		ApplyToInstance(ImageLabel, PropertyOverrides)
	
		return ImageLabel
	end
	
	table.freeze(Lucide)
	
	--return Lucide
	--END LUCIDE 
	
	--[[REFERENCES FOR THEMES AND FONTS WHICH ARENT USED]]
	--Dock
	local TabTextRef = {}
	local TabRef = {}
	local tabcur = nil
	
	-- Button references
	local buttonRef = {}
	local TextAllref = {}
	local buttonStrokeRef = {}

	-- Slider references
	local sliderRef = {}
	local sliderStrokeRef = {}

	-- Toggle references
	local toggleRef = {}
	local toggleCheckMarkRef = {}
	local toggleThirdRef = {}
	local toggleStrokeRef = {}

	-- Dropdown references
	local dropdownRef = {}
	local dropdownStrokeRef ={}

	-- Separator references
	local separatorRef = {}
	local separatorStrokeRef = {}

	-- Text input references
	local textInputRef = {}
	local textInputStrokeRef = {}

	-- Key input references
	local keyInputRef = {}
	local keyInputStrokeRef = {}

	-- Notification references
	local notificationRef = {}
	local notificationStrokeRef = {}

	-- Popup references
	local popupRef = {}
	local popupStrokeRef = {}

	
	--[[End group]]	
	
	local parent = identifyexecutor and ((gethui and gethui()) or game.CoreGui) or game.Players.LocalPlayer.PlayerGui

	for _, existing in ipairs(parent:GetChildren()) do
		if existing.Name == [[UxiLib]] then
			existing:Destroy()
		end
	end

	GUI["1"] = Instance.new("ScreenGui", pl.PlayerGui or game.StarterGui);
	GUI["1"].Parent = identifyexecutor and ((gethui and gethui()) or game.CoreGui) or game.Players.LocalPlayer.PlayerGui
	GUI["1"]["Name"] = [[UxiLib]];
	GUI["1"]["IgnoreGuiInset"] = true
	GUI["1"].ResetOnSpawn = false
	
	local isFixed = false
	if options.Style == "Fixed" then
		isFixed = true
	end
	
	GUI["2"] = Instance.new("Frame", GUI["1"]);
	GUI["2"]["BorderSizePixel"] = 0;
	GUI["2"]["BackgroundColor3"] = Theme.BackgroundColor;
	GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	
	local GUI2PosLOl
	if isFixed then
		GUI2PosLOl = UDim2.new(0, 601.5, 0, 450);
	elseif GUI.Style == "Classic" then
		GUI2PosLOl= UDim2.new(0, 461, 0, 300);
	else
		GUI2PosLOl= UDim2.new(0, 401, 0, 300);
	end
	
	GUI["2"]["Size"] = GUI2PosLOl;
	
	--visibility
	GUI.Visibility =  options.KeySystemConfig.KeySystem
	
	-- StartUpWhenNoKey
	GUI["2"]["Position"] = UDim2.new(0.5,0,2,0)

	local Pos = UDim2.new(0.5,0,0.5,0)

	Library:tween(GUI["2"], {Position = Pos}, 1.7,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)

	function GUI:Move()

		GUI["2"]["Position"] = UDim2.new(0.5,0,2,0)

		local Pos = UDim2.new(0.5,0,0.5,0)

		Library:tween(GUI["2"], {Position = Pos}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
	end

	GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	GUI["2"]["Name"] = [[Main]];
	GUI["2"].Transparency = 0.05


	GUI["3"] = Instance.new("UICorner", GUI["2"]);
	GUI["3"]["CornerRadius"] = UDim.new(0, 12);

	GUI["54"] = Instance.new("Frame", GUI["2"]);
	GUI["54"]["ZIndex"] = 0;
	GUI["54"]["BorderSizePixel"] = 0;
	GUI["54"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["54"]["Name"] = [[DropShadowHolder]];
	GUI["54"]["BackgroundTransparency"] = 1;

	local Transparency = GUI["2"].Transparency

	local isAnimating = false
	local Position = nil

	uis.InputBegan:Connect(function(input, gameProcessed)
		if input.KeyCode == GUI.currentKey and not gameProcessed and not GUI.IsKeySystemOn then
			GUI:_ToggleVisibility()
			
		end
	end)

	function GUI:_Destroy()
		local currentPos = GUI["2"].Position
		local viewport = workspace.CurrentCamera.ViewportSize

		GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Library:tween(GUI["2"], {Position = UDim2.new( GUI["2"].Position.X.Scale,GUI["2"].Position.X.Offset,2,0)}, 1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		if isFixed then
			for _, child in ipairs(GUI["1"]:GetChildren()) do
				if child.Name:match("^Navigation") then -- checks if name starts with "Notification"
					Library:tween(child, {Position =UDim2.new(0.5,0,1, 60)}, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				end
			end
		end

		local sound = Instance.new("Sound")  -- its SoundId not soundID
		sound.Volume = 1 -- add volume property
		sound.Parent = game:GetService("SoundService")
		sound.SoundId = "rbxassetid://1524543584"

		sound:Play()

		sound.Ended:Connect(function()
			GUI["2"]:Destroy()
			GUI["1"]:Destroy()
			script:Destroy()
		end)
	end

	--shadow
	do
		GUI["55"] = Instance.new("ImageLabel", GUI["54"]);
		GUI["55"]["ZIndex"] = 0;
		GUI["55"]["BorderSizePixel"] = 0;
		GUI["55"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["55"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["55"]["ImageTransparency"] = 0.5;
		GUI["55"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["55"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["55"]["Image"] = [[rbxassetid://6014261993]];
		GUI["55"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["55"]["BackgroundTransparency"] = 1;
		GUI["55"]["Name"] = [[DropShadow]];
		GUI["55"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		GUI["55"]["ImageColor3"] = Color3.fromRGB(0,0,0);
	end

	--Top Bar
	do
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundColor3"] = Theme.TopBar;
		GUI["4"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4"]["Name"] = [[TopBar]];

		GUI["5"] = Instance.new("UICorner", GUI["4"]);
		GUI["5"]["CornerRadius"] = UDim.new(0, 12);

		-- StarterGui.UxiLib.Main.TopBar.Extention
		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Theme.TopBar;
		GUI["6"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["6"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[Extention]];


		-- StarterGui.UxiLib.Main.TopBar.Title
		GUI["7"] = Instance.new("TextLabel", GUI["4"]);
		GUI["7"]["BorderSizePixel"] = 0;
		GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["TextSize"] = 21;
		GUI["7"]["Font"] = Enum.Font.Gotham;
		GUI["7"]["TextColor3"] = Theme.TextColor;
		GUI["7"]["BackgroundTransparency"] = 1;
		GUI["7"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["7"]["Text"] = options["Name"];
		GUI["7"]["Name"] = [[Title]];


		-- StarterGui.UxiLib.Main.TopBar.Title.UIPadding
		GUI["8"] = Instance.new("UIPadding", GUI["7"]);
		GUI["8"]["PaddingTop"] = UDim.new(0, 1);
		GUI["8"]["PaddingLeft"] = UDim.new(0, 8);


		-- StarterGui.UxiLib.Main.TopBar.Exit


		-- StarterGui.UxiLib.Main.TopBar.line
		GUI["a"] = Instance.new("Frame", GUI["4"]);
		GUI["a"]["ZIndex"] = 2;
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Theme.TopBarInputStrokeColor;
		GUI["a"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["a"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["a"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["a"]["Name"] = [[line]];
	end

	--topbar logic
	do
		local topbar = GUI["4"]
		local draggableFrame = GUI["2"]
		local isDragging = false
		local dragStart = nil
		local startPos = nil
		local currentTween = nil

		local function smoothMove(targetPosition)
			if currentTween then currentTween:Cancel() end
			currentTween = Library:tween(draggableFrame, {Position = targetPosition}, 0.80, Enum.EasingStyle.Exponential)
		end

		topbar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				isDragging = true
				dragStart = input.Position
				startPos = draggableFrame.Position
			end
		end)

		uis.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				isDragging = false
			end
		end)

		uis.InputChanged:Connect(function(input)
			if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				local mouseOffset = input.Position - dragStart
				local targetPosition = UDim2.new(
					startPos.X.Scale, startPos.X.Offset + mouseOffset.X,
					startPos.Y.Scale, startPos.Y.Offset + mouseOffset.Y
				)
				smoothMove(targetPosition)
			end
		end)
	end
	--main content
	do
		GUI["14"] = Instance.new("Frame", GUI["2"]);
		GUI["14"]["BorderSizePixel"] = 0;
		GUI["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		if GUI.Style == "Classic" then
			GUI["14"]["Size"] = UDim2.new(1,-60,1,-30);
			GUI["14"]["Position"] = UDim2.new(0, 60, 0, 30);
		else
			GUI["14"]["Size"] = UDim2.new(1,0,1,-30);
			GUI["14"]["Position"] = UDim2.new(0, 0, 0, 30);
		end
		
		
		GUI["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["14"]["Name"] = [[MainContent]];
		GUI["14"]["BackgroundTransparency"] = 1;
	end
	--make the dock
	do
		if options.Style == "Bottom" then
			Position = UDim2.new(0, 0,0, 350)
		elseif options.Style == "Top" then
			Position = UDim2.new(0, 0,0,-100)
		elseif options.Style == "Fixed" then
			isFixed = true
			Position = UDim2.new(0.5,0,1, 60);
		else
			Position = UDim2.new(0.5,0,1,-50)
		end
	end
	
	-- Navigation
	do
		
		if GUI.Style ~= "Classic"  then
			GUI["b"] = Instance.new("Frame", isFixed and GUI["1"] or GUI["2"])
			GUI["b"]["Name"] = "Navigation"
			GUI["b"]["BorderSizePixel"] = 0
			GUI["b"]["BackgroundColor3"] = Theme.DockColor
			GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			GUI["b"]["BackgroundTransparency"] = 0.05
			GUI["b"]["Position"] = Position
			GUI["b"]["Size"] = isFixed and UDim2.new(0, 650, 0, 60) or UDim2.new(1, 0, 0, 60)
			GUI["b"]["AnchorPoint"] = isFixed and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
			
			GUI["c"] = Instance.new("ScrollingFrame", GUI["b"]);
			GUI["c"]["BorderSizePixel"] = 0;
			GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			GUI["c"]["Size"] = UDim2.new(1,-80,1,0);
			GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			GUI["c"]["Name"] = [[Button Holder]];
			GUI["c"]["BackgroundTransparency"] = 1;
			GUI["c"]["ScrollBarThickness"] = 0;
			GUI["c"].ScrollBarImageColor3 = addColors(Theme.BackgroundColor, Color3.fromRGB(95,82,101))
			--CHANG
			GUI["c"].AutomaticCanvasSize = Enum.AutomaticSize.X
			GUI["c"]["Visible"] = true;
			GUI["c"].CanvasSize = UDim2.new(1,0,1,-80)
			GUI["c"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.None;
			GUI["c"].ScrollingDirection = Enum.ScrollingDirection.X
			
			GUI["d"] = Instance.new("UIPadding", GUI["c"]);
			GUI["d"]["PaddingTop"] = UDim.new(0, 7);
			GUI["d"]["PaddingLeft"] = UDim.new(0, 15);
			GUI["d"]["PaddingBottom"] = UDim.new(0, 5);
			GUI["d"]["PaddingRight"] = UDim.new(0, 15);
			-- StarterGui.UxiLib.Main.Navigation.Button Holder.UIListLayout
			GUI["e"] = Instance.new("UIListLayout", GUI["c"]);
			GUI["e"]["Padding"] = UDim.new(0, 10);
			GUI["e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			GUI["e"]["FillDirection"] = Enum.FillDirection.Horizontal;
			
			GUI["13"] = Instance.new("UICorner", GUI["b"]);
			GUI["13"]["CornerRadius"] = UDim.new(0,20);
			
			GUI["Time"] = Instance.new("TextLabel", GUI["b"])
			GUI["Time"]["BorderSizePixel"] = 0
			GUI["Time"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			GUI["Time"]["Size"] = UDim2.new(0, 80, 1, 0)
			GUI["Time"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			GUI["Time"]["Name"] = "Time"
			GUI["Time"]["BackgroundTransparency"] = 1
			GUI["Time"]["TextColor3"] = Theme.TextColor
			GUI["Time"]["Position"] = UDim2.new(1, 0, 0, 0)
			GUI["Time"]["AnchorPoint"] = Vector2.new(1, 0)
			GUI["Time"]["Text"] = os.date("%H:%M")
			GUI["Time"].TextSize = fontSize
			GUI["Time"]["Font"] = fontall
		else
			GUI["b"] = Instance.new("Frame",GUI["2"])

			GUI["b"]["Name"] = "Navigation"
			GUI["b"]["BorderSizePixel"] = 0
			GUI["b"]["BackgroundColor3"] = Theme.DockColor
			GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			GUI["b"]["BackgroundTransparency"] = 0
			GUI["2"].Transparency = 0
			GUI["b"]["Position"] = UDim2.new(0,0,0,30)
			GUI["b"]["Size"] = UDim2.new(0, 60, 1,-30)
			GUI["b"]["AnchorPoint"] = Vector2.new(0, 0)
			GUI["b"]["ZIndex"] = 0
			
			GUI["4"]["Size"] = UDim2.new(1, 0,0, 30);
			GUI["4"]["Position"] = UDim2.new(0,0,0,0);
			
			GUI["c"] = Instance.new("ScrollingFrame", GUI["b"]);
			GUI["c"]["BorderSizePixel"] = 0;
			GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			GUI["c"]["Size"] = UDim2.new(1,0,1,-40);
			GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			GUI["c"]["Name"] = [[Button Holder]];
			GUI["c"]["BackgroundTransparency"] = 1;
			GUI["c"]["ScrollBarThickness"] = 0;
			GUI["c"].ScrollBarImageColor3 = addColors(Theme.BackgroundColor, Color3.fromRGB(95,82,101))
			GUI["c"].AutomaticCanvasSize = Enum.AutomaticSize.Y
			GUI["c"]["Visible"] = true;
			GUI["c"].CanvasSize = UDim2.new(1,0,1,-80)
			GUI["c"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.None;
			GUI["c"].ScrollingDirection = Enum.ScrollingDirection.Y
			
			GUI["d"] = Instance.new("UIPadding", GUI["c"]);
			GUI["d"]["PaddingTop"] = UDim.new(0, 10);
			GUI["d"]["PaddingLeft"] = UDim.new(0, 10);
			GUI["d"]["PaddingBottom"] = UDim.new(0, 10);
			GUI["d"]["PaddingRight"] = UDim.new(0, 5);

			-- StarterGui.UxiLib.Main.Navigation.Button Holder.UIListLayout
			GUI["e"] = Instance.new("UIListLayout", GUI["c"]);
			GUI["e"]["Padding"] = UDim.new(0, 10);
			GUI["e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			GUI["e"]["FillDirection"] = Enum.FillDirection.Vertical;
			
			GUI["13"] = Instance.new("UICorner", GUI["b"]);
			GUI["13"]["CornerRadius"] = UDim.new(0,12);
			
			GUI["Time"] = Instance.new("TextLabel", GUI["b"])
			GUI["Time"]["BorderSizePixel"] = 0
			GUI["Time"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			GUI["Time"]["Size"] = UDim2.new(1, 0, 0, 40)
			GUI["Time"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			GUI["Time"]["Name"] = "Time"
			GUI["Time"]["BackgroundTransparency"] = 1
			GUI["Time"]["TextColor3"] = Theme.TextColor
			GUI["Time"]["Position"] = UDim2.new(0, 0, 1, 0)
			GUI["Time"]["AnchorPoint"] = Vector2.new(0,1)
			GUI["Time"]["Text"] = os.date("%H:%M")
			GUI["Time"].TextSize = fontSize
			GUI["Time"]["Font"] = fontall
			GUI["Time"].TextXAlignment = Enum.TextXAlignment.Center
			GUI["Time"].TextYAlignment = Enum.TextYAlignment.Center
			
			GUI["Ext"] = Instance.new("Frame", GUI["b"])
			GUI["Ext"].Size = UDim2.new(0, 20, 0, 10)
			GUI["Ext"].Position = UDim2.new(1, 10, 1, 0)
			GUI["Ext"]["AnchorPoint"] = Vector2.new(1, 1)
			GUI["Ext"].BackgroundColor3 = Theme.BackgroundColor
			GUI["Ext"].BackgroundTransparency = 0
			GUI["Ext"].BorderSizePixel = 0
			
			GUI["Sep"] = Instance.new("Frame", GUI["b"])
			GUI["Sep"].Size = UDim2.new(0, 2, 1, 0)
			GUI["Sep"].Position = UDim2.new(1, 5, 1, 0)
			GUI["Sep"]["AnchorPoint"] = Vector2.new(1, 1)
			GUI["Sep"].BackgroundColor3 = Theme.TopBar
			GUI["Sep"].BackgroundTransparency = 0
			GUI["Sep"].BorderSizePixel = 0
			GUI["Sep"].Name = [[Seperator]]
		end
		
		task.spawn(function()
			while task.wait(60 - tonumber(os.date("%S"))) do
				GUI["Time"]["Text"] = os.date("%H:%M")
			end
		end)
	end	
	
	function GUI:_ToggleVisibility()
		if not GUI.HasKeyBeenInputed then
			GUI.Visibility = false
			GUI["2"].Visible = false
		elseif GUI.Visibility == true and GUI.HasKeyBeenInputed and not isAnimating then	
			isAnimating = true
			if GUI.Style == "Classic" then
			GUI.Visibility = not GUI.Visibility
				Library:tween(GUI["2"], {Size = UDim2.new(0,0,0,0)}, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In,function()
					GUI["2"]["Visible"] = false
					isAnimating = false
				end)
			end
			if isFixed then
				for _, child in ipairs(GUI["1"]:GetChildren()) do
					if child.Name:match("^Navigation") then -- checks if name starts with "Notification"
						Library:tween(child, {Position = UDim2.new(0.5,0,1, 60)}, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
					end
				end
				isAnimating = true
				--GUI["2"].ClipsDescendants = true
				
			elseif GUI.Style ~= "Classic" then
				isAnimating = true
				for _, child in ipairs(GUI["b"]:GetChildren()) do
					if child.Name:match("^Settings") then 
						Library:tween(child, {Position = UDim2.new(0.9,0,0.5,0)}, 0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out,function()
							GUI["b"].ClipsDescendants = true
							Library:tween(GUI["b"], {Position = UDim2.new(0,0,1,0)}, 0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
							Library:tween(GUI["b"], {Size = UDim2.new(1,0,0,0)}, 0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
							GUI.Visibility = not GUI.Visibility
							Library:tween(GUI["2"], {Size = UDim2.new(0,0,0,0)}, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In,function()

								GUI["2"]["Visible"] = false
								isAnimating = false
							end)
							wait(0.4)
							GUI["2"].ClipsDescendants = true
						end)
						Library:tween(child, {Size = UDim2.new(0,0,0,0)}, 0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
					end
				end
				
			end
			
		elseif GUI.Visibility == false and GUI.HasKeyBeenInputed and not isAnimating then
			isAnimating = true
			GUI["2"]["Visible"] = true 
			GUI.Visibility = not GUI.Visibility
			GUI["2"].ClipsDescendants = false
			Library:tween(GUI["2"], {Size = GUI2PosLOl}, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out,function()
				
				isAnimating = false
			end)
			if isFixed then
				for _, child in ipairs(GUI["1"]:GetChildren()) do
					if child.Name:match("^Navigation") then 
						Library:tween(child, {Position =UDim2.new(0.5,0,1, -60)}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
					end
				end
			elseif GUI.Style ~= "Classic" then
				GUI["b"].Size = UDim2.new(1, 0, 0, 1)
				Library:tween(GUI["b"], {Position = Position}, 0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In,function()
					Library:tween(GUI["b"], {Size = UDim2.new(1, 0, 0, 60)}, 0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out,function()
						for _, child in ipairs(GUI["b"]:GetChildren()) do
							if child.Name:match("^Settings") then 
								GUI["b"].ClipsDescendants = false
								Library:tween(child, {Position = UDim2.new(1, 10, 0.5, 0)}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
								Library:tween(child, {Size = UDim2.new(0,45,0,45)}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
							end
						end
					end)
				end)
				
			end
		end
	end
	
	GUI:_ToggleVisibility()
	--NotifHokder
	local NotificationHolder = Instance.new("Frame")
	
	do

		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = GUI["1"]
		NotificationHolder.AnchorPoint = Vector2.new(1, 1)
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationHolder.BackgroundTransparency = 1.000
		NotificationHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolder.BorderSizePixel = 0
		NotificationHolder.Position = UDim2.new(1, 0, 1, 0)
		NotificationHolder.Size = UDim2.new(0.22, 0, 1, 0)

		local UIPadding = Instance.new("UIPadding")

		UIPadding.Parent = NotificationHolder
		UIPadding.PaddingBottom = UDim.new(0, 40)
		UIPadding.PaddingRight = UDim.new(0, 40)
		UIPadding.PaddingTop = UDim.new(0, 40)
	end
	
	local NotifTransparency = 0.3
	local PopUpTransparency = 0.02
	local firstCreated = nil
	local isFirstCreated = false
	
	function GUI:CreateTab(options)
		options = Library:Validate({
			Icon = "rbxassetid://121088157314410",
			Text = "Tab"
		},options or {})
		
		local Tab = {
			Hover = false,
			Active = false,
		}
		--render
		do
			Tab["11"] = Instance.new("TextButton", GUI["c"]);
			Tab["11"]["BorderSizePixel"] = 0;
			Tab["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["11"]["Size"] = UDim2.new(0, 45, 0, 45);
			Tab["11"]["Position"] = UDim2.new(0.65, 0, 0.5, 0);
			Tab["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["11"]["Name"] = [[Inactive]];
			Tab["11"]["BackgroundTransparency"] = 1;
			Tab["11"]["Text"] = [[]]
			Tab["11"].AutoButtonColor = false

			-- StarterGui.ScreenGui.Activetext.UICorner
			Tab["12"] = Instance.new("UICorner", Tab["11"]);
			Tab["12"]["CornerRadius"] = UDim.new(0, 20);

			-- StarterGui.ScreenGui.Activetext.Icon
			Tab["4"] = Instance.new("ImageLabel", Tab["11"]);
			Tab["4"]["BorderSizePixel"] = 0;
			Tab["4"]["BackgroundColor3"] = Color3.fromRGB(15, 24, 32);
			Tab["4"]["AnchorPoint"] = Vector2.new(0.56, 0);
			Tab["4"]["ImageColor3"] = addColors(Theme.TextColor, Color3.fromRGB(-50,-50,-50));
			if string.find(options.Icon, "rbxassetid") then
				Tab["4"]["Image"] = options.Icon
			else
				local Asset = Lucide.GetAsset(options.Icon, 30)
				assert(Asset, "Failed to fetch asset!")
				Tab["4"]["Image"] = Asset.Url
				Tab["4"]["ImageRectSize"] = Asset.ImageRectSize
			Tab["4"]["ImageRectOffset"] = Asset.ImageRectOffset
				end
			TabRef[#TabRef + 1] = Tab["4"]
			Tab["4"]["Size"] = UDim2.new(0, 30, 0, 30);
			Tab["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["4"]["BackgroundTransparency"] = 1;
			Tab["4"]["Name"] = [[Icon]];
			Tab["4"]["Position"] = UDim2.new(0.5, 2, 0, 0);

			-- StarterGui.ScreenGui.Activetext.TextLabel
			Tab["6"] = Instance.new("TextLabel", Tab["11"]);
			Tab["6"]["TextWrapped"] = true;
			Tab["6"]["BorderSizePixel"] = 0;
			Tab["6"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["6"]["TextSize"] = 16;
			Tab["6"]["Font"] =fontall;
			TabTextRef[#TabTextRef + 1] = Tab["6"]
			Tab["6"]["TextColor3"] = Theme.TextColor
			Tab["6"]["BackgroundTransparency"] = 1;
			Tab["6"]["AnchorPoint"] = Vector2.new(0, 1);
			Tab["6"]["Size"] = UDim2.new(1, 0, 0.3, 0);
			Tab["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["6"]["Text"] = options.Text;
			Tab["6"]["Position"] = UDim2.new(0, 0, 1, 0);
			Tab["6"]["Name"] = "Text"
			Tab["6"].TextXAlignment = Enum.TextXAlignment.Center

			Tab["15"] = Instance.new("ScrollingFrame", GUI["14"]);
			Tab["15"]["BorderSizePixel"] = 0;
			Tab["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["15"]["Name"] = [[HomeTab]];
			Tab["15"]["Selectable"] = false;
			Tab["15"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["15"]["ScrollBarThickness"] = 10;
			Tab["15"].ScrollBarImageColor3 = addColors(Theme.BackgroundColor, Color3.fromRGB(95,95,95))
			--CHANGEDX
			Tab["15"].AutomaticCanvasSize = Enum.AutomaticSize.Y
			Tab["15"]["BackgroundTransparency"] = 1;
			Tab["15"]["Visible"] = true;
			Tab["15"].CanvasSize = UDim2.new(1,0,1.6,0)
			Tab["15"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always;
			Tab["15"].ScrollingDirection = Enum.ScrollingDirection.Y

			Tab["99"] = Instance.new("UIPadding", Tab["15"]);
			Tab["99"]["PaddingTop"] = UDim.new(0, 6);
			local OffsetBar = 5
			Tab["99"]["PaddingRight"] = UDim.new(0,(Tab["15"].ScrollBarThickness + OffsetBar));
			Tab["99"]["PaddingLeft"] = UDim.new(0, 13);
			Tab["99"]["PaddingBottom"] = UDim.new(0, 1);

			Tab["88"] = Instance.new("UIListLayout", Tab["15"]);
			Tab["88"]["Padding"] = UDim.new(0, 12);
			Tab["88"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	
			Tab["Fade"] = Instance.new("Frame", GUI["14"]);
			Tab["Fade"]["ZIndex"] = 10;
			Tab["Fade"]["BorderSizePixel"] = 0;
			Tab["Fade"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["Fade"]["Size"] = UDim2.new(1, 0, 0, 45);
			Tab["Fade"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["Fade"]["Name"] = [[fade]]; 
			Tab["Fade"].Visible = false
			Tab["Fade"].ClipsDescendants = true
			Tab["FadeGradient"] = Instance.new("UIGradient", Tab["Fade"]);
			Tab["FadeGradient"]["Rotation"] = 90;
			Tab["FadeGradient"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(0.463, 0.275),NumberSequenceKeypoint.new(1.000, 1)};
			Tab["FadeGradient"]["Color"] =  ColorSequence.new{ColorSequenceKeypoint.new(0.000, Theme.BackgroundColor),ColorSequenceKeypoint.new(1.000, Theme.BackgroundColor)};
			
			
			if Tab["15"].CanvasPosition.Y == 0 then
				Tab["Fade"].Position = UDim2.new(0, 0,-0.5,0)
				GUI["14"].ClipsDescendants = true
			end
			
		end
		do
			local ActivatedColor = Theme.TextColor
			local HoveredColor = Theme.TextColor
			local InactivatedColor = Theme.TextColor
			local isFirstTime = true
			local WaitTime = 0.2
			
			function Tab:Deactivate()
				if Tab.Active then
					Tab.Active = false
					Tab.Hover = false
					if not isFirstTime then
						if Theme.isDark == false then Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(100,100,100))},0.1) else Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-100,-100,-100))},0.1)end
						Tab["15"].ScrollBarThickness = 0
						Library:tween(Tab["15"], {Size = UDim2.new(0, 0, 1, 0)},WaitTime,Enum.EasingStyle.Linear, Enum.EasingDirection.Out,function()
							Tab["15"].Visible = false
						end)
					else
						if Theme.isDark == false then Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(100,100,100))},0.1) else Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-100,-100,-100))},0.1)end
						Tab["15"].ScrollBarThickness = 0
						Tab["15"].Visible = false
						Tab["15"].Size = UDim2.new(0, 0, 1, 0)
					end

					if Tab["15"].CanvasPosition.Y == 0 then
						Tab["Fade"].Position = UDim2.new(0, 0,-0.5,0)
						GUI["14"].ClipsDescendants = true
					end
				end
			end
			--methods
			function Tab:Activate()
				if not Tab.Active then
					if GUI.CurrentTab ~= nil then
						GUI.CurrentTab:Deactivate()
					end
					if not isFirstTime  then
						wait(WaitTime / 2)
						Tab.Active = true
						Tab["15"].Visible = true
						if Theme.isDark == false then Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(10,10,10))},0.1) else Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-10,-10,-10))},0.1)end
						Library:tween(Tab["15"], {Size = UDim2.new(1, 0, 1, 0)},WaitTime,Enum.EasingStyle.Linear, Enum.EasingDirection.Out,function()
							Library:tween(Tab["15"], {ScrollBarThickness = 10},0.5,Enum.EasingStyle.Back, Enum.EasingDirection.Out)
						end)
					else
						Tab.Active = true
						Tab["15"].Visible = true
						if Theme.isDark == false then Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(10,10,10))},0.1) else Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-10,-10,-10))},0.1)end
						Tab["15"].Size = UDim2.new(1, 0, 1, 0)
						Tab["15"].ScrollBarThickness = 10
					end

					GUI.CurrentTab = Tab
					if Tab["15"].CanvasPosition.Y == 0 then
						Tab["Fade"].Position = UDim2.new(0, 0,-0.5,0)
						GUI["14"].ClipsDescendants = true
					end
				end
			end
			
			--I MANAGED TO MAKE THIS AFTER 4 UPDATES 
			if isFirstCreated == false then
				firstCreated = table.clone(Tab)
				isFirstCreated = true
			else
				Tab:Activate()
				task.spawn(function()
					task.wait(WaitTime + 0.001)
					firstCreated:Activate()
				end)
			end
			isFirstTime = true
			
			if not GUI.CurrentTab then
				Tab:Deactivate()
			end
			isFirstTime = false
			
			
			Tab["15"]:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				if Tab["15"].CanvasPosition.Y > 32 then
					Library:tween(Tab["Fade"], {Position = UDim2.new(0, 0,0,0)},0.15,Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
				else
					--Library:tween(Tab["Fade"], {Size = UDim2.new(1, 0,0, 0)},0.1,Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
					Library:tween(Tab["Fade"], {Position = UDim2.new(0, 0,-0.5,0)},0.15 / 2,Enum.EasingStyle.Cubic, Enum.EasingDirection.In)
				end
			end)
			--logic
			do
				Tab["11"].MouseEnter:Connect(function()
					if not Tab.Active then
						if Theme.isDark == false then Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(40,40,40))},0.1) else Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-40,-40,-40))},0.1)end
					end
				end)

				Tab["11"].MouseLeave:Connect(function()

					if not Tab.Active then
						if Theme.isDark == false then Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(80,80,80))},0.1) else Library:tween(Tab["4"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-80,-80,-80))},0.1)end
					end

				end)
				
				Tab["11"].MouseButton1Down:Connect(function() 
					Tab:Activate()
				end)
			end
			function Tab:Button(options)
				options = Library:Validate({
					Name = "Button",
					callback = function() end
				},options or {})

				local Button = {
					Hover = false,
					MouseDown = false
				}

				--make button
				do
					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button
					Button["16"] = Instance.new("TextButton", Tab["15"])
					buttonRef[#buttonRef + 1] = Button["16"]
					Button["16"]["BorderSizePixel"] = 0
					Button["16"]["BackgroundColor3"] = Theme.ButtonColor
					Button["16"]["AnchorPoint"] = Vector2.new(0.5, 0)
					if GUI.Style == "Classic" then
						Button["16"]["Size"] = UDim2.new(1/1.15, 0, 0, 40/1.1)
					else
						Button["16"]["Size"] = UDim2.new(1, 0, 0, 40)
					end

					Button["16"]["Position"] = UDim2.new(0.5, 0, 0, 0)
					Button["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
					Button["16"]["Name"] = "Button"
					Button["16"].AutoButtonColor = false
					Button["16"].TextTransparency = 1

					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.UICorner
					Button["X"] = Instance.new("UICorner", Button["16"]);



					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.UIStroke
					Button["18"] = Instance.new("UIStroke", Button["16"]);
					Button["18"]["Color"] = Theme.ButtonInputStrokeColor;
					Button["18"]["Thickness"] = 2
					Button["18"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					buttonStrokeRef[#buttonStrokeRef + 1] = Button["18"]


					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.Title
					Button["19"] = Instance.new("TextLabel", Button["16"]);
					Button["19"]["BorderSizePixel"] = 0;
					Button["19"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Button["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["19"]["TextSize"] = fontSize;
					Button["19"]["Font"] =fontall;
					Button["19"]["TextColor3"] = Theme.TextColor;
					TextAllref[#TextAllref + 1] = Button["19"]
					Button["19"]["BackgroundTransparency"] = 1;
					Button["19"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["19"]["Text"] = options.Name;
					Button["19"]["Name"] = [[Title]];


					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.UIPadding
					Button["1x"] = Instance.new("UIPadding", Button["16"]);
					Button["1x"]["PaddingTop"] = UDim.new(0, 6);
					Button["1x"]["PaddingRight"] = UDim.new(0, 8);
					Button["1x"]["PaddingLeft"] = UDim.new(0, 6);
					Button["1x"]["PaddingBottom"] = UDim.new(0, 6);


					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.Icon
					Button["1b"] = Instance.new("ImageLabel", Button["16"]);
					Button["1b"]["BorderSizePixel"] = 0;
					Button["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["1b"]["AnchorPoint"] = Vector2.new(1, 1);
					Button["1b"]["Image"] = [[rbxassetid://80129646188870]];
					Button["1b"]["ImageColor3"] = Theme.TextColor;
					Button["1b"]["Size"] = UDim2.new(0, 25, 0, 25);
					Button["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["1b"]["BackgroundTransparency"] = 1;
					Button["1b"]["Name"] = [[Icon]];
					Button["1b"]["Position"] = UDim2.new(1, 0, 1, 0);
				end

				Button["16"].MouseEnter:Connect(function()
					if Theme.isDark then
						Library:tween(Button["18"], {Color = addColors(Theme.ButtonInputStrokeColor, Color3.fromRGB(15,15,15))},0.3)
					else
						Library:tween(Button["18"], {Color = addColors(Theme.ButtonInputStrokeColor, Color3.fromRGB(-15,-15,-15))},0.3)
					end
					Button.Hover = true

				end)

				Button["16"].MouseLeave:Connect(function()
					Button.Hover = false
					if not Button.MouseDown then
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor})
					else
						
					end
				end)

				Button["16"].MouseButton1Down:Connect(function()
					Button.MouseDown = true
					Library:tween(Button["16"], {BackgroundColor3 = addColors(Theme.ButtonColor, Color3.fromRGB(30,30,30))},0.3)
					Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.5)
					options.callback()
				end)

				Button["16"].MouseButton1Up:Connect(function()
					Button.MouseDown = false
					if Button.Hover then
						Library:tween(Button["16"], {BackgroundColor3 = Theme.ButtonColor},0.3)
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.3)
					else
						Library:tween(Button["16"], {BackgroundColor3 = Theme.ButtonColor},0.3)
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.3)
					end
				end)

				--Methods
				do
					function Button:SetText(text)
						Button["19"].Text = text
					end

					function Button:SetCallBack(fn)
						options.callback = fn
					end
				end

				return Button

			end

			function Tab:Toggle(options)
				options = Library:Validate({
					Name = "Toogle",
					callback = function() end
				},options or {})

				local Toggle = {
					Hover = false,
					MouseDown = false,
					State = false
				}

				do
					Toggle["1t"] = Instance.new("Frame", Tab["15"]);
					Toggle["1t"]["BorderSizePixel"] = 0;
					toggleRef[#toggleRef + 1] = Toggle["1t"]
					Toggle["1t"]["BackgroundColor3"] = Theme.ToggleColor;
					Toggle["1t"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Toggle["1t"]["Size"] = UDim2.new(1, 0, 0, 40);
					Toggle["1t"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Toggle["1t"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1t"]["Name"] = [[ToggleInactive]];
					
					
					if GUI.Style == "Classic" then
						Toggle["1t"]["Size"] = UDim2.new(1/1.15, 0, 0, 40/1.1)
					else
						Toggle["1t"]["Size"] = UDim2.new(1, 0, 0, 40)
					end

					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UICorner
					Toggle["dx"] = Instance.new("UICorner", Toggle["1t"]);

					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UIStroke
					Toggle["3x"] = Instance.new("UIStroke", Toggle["1t"]);
					Toggle["3x"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					Toggle["3x"]["Color"] = Theme.ButtonInputStrokeColor;
					toggleStrokeRef[#toggleStrokeRef + 1] = Toggle["3x"]
					Toggle["3x"]["Thickness"] = 2;


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.Title
					Toggle["2x"] = Instance.new("TextLabel", Toggle["1t"]);
					Toggle["2x"]["BorderSizePixel"] = 0;
					Toggle["2x"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["2x"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2x"]["TextSize"] = fontSize;
					TextAllref[#TextAllref + 1] = Toggle["2x"]
					Toggle["2x"]["Font"] =fontall;
					Toggle["2x"]["TextColor3"] = Theme.TextColor;
					Toggle["2x"]["BackgroundTransparency"] = 1;
					Toggle["2x"]["Size"] = UDim2.new(1, -120, 1, 0);
					Toggle["2x"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2x"]["Text"] = options.Name;
					Toggle["2x"]["Name"] = [[Title]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UIPadding
					Toggle["4x"] = Instance.new("UIPadding", Toggle["1t"]);
					Toggle["4x"]["PaddingTop"] = UDim.new(0, 5);
					Toggle["4x"]["PaddingRight"] = UDim.new(0, 8);
					Toggle["4x"]["PaddingLeft"] = UDim.new(0, 6);
					Toggle["4x"]["PaddingBottom"] = UDim.new(0, 5);


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder
					Toggle["1z"] = Instance.new("Frame", Toggle["1t"]);
					Toggle["1z"]["BorderSizePixel"] = 0;
					Toggle["1z"]["BackgroundColor3"] = Theme.ToggleCheckColorInactive;
					Toggle["1z"]["AnchorPoint"] = Vector2.new(1, 0.5);
					toggleCheckMarkRef[#toggleCheckMarkRef + 1] = Toggle["1z"]
					Toggle["1z"]["Size"] = UDim2.new(0, 20, 0, 20);
					Toggle["1z"]["Position"] = UDim2.new(1, -5, 0.5,0);
					Toggle["1z"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1z"]["Name"] = [[CheckMarkHolder]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.checkmark
					Toggle["1e"] = Instance.new("ImageLabel", Toggle["1z"]);
					Toggle["1e"]["BorderSizePixel"] = 0;
					Toggle["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["1e"]["ImageTransparency"] = 1;
					Toggle["1e"]["Image"] = [[rbxassetid://129387373527527]];
					Toggle["1e"]["ImageColor3"]  = Theme.TextColor;
					toggleThirdRef[#toggleThirdRef + 1] = Toggle["1e"]
					Toggle["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
					Toggle["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1e"]["BackgroundTransparency"] = 1;
					Toggle["1e"]["Name"] = [[checkmark]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.UIStroke
					Toggle["1v"] = Instance.new("UIStroke", Toggle["1z"]);
					Toggle["1v"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.UICorner
					Toggle["1r"] = Instance.new("UICorner", Toggle["1z"]);
					Toggle["1r"]["CornerRadius"] = UDim.new(0, 4);
				end
				--methods
				do
					function Toggle:UpdateToggle(b)
						if b == nil then
							Toggle.State = not Toggle.State
						else
							Toggle.State = b
						end

						if Toggle.State then
							Library:tween(Toggle["1z"], {BackgroundColor3 = Theme.ToggleCheckColor},0.1)
							Library:tween(Toggle["1e"], {ImageTransparency = 0},0.1)
						else
							Library:tween(Toggle["1z"], {BackgroundColor3 = Theme.ToggleCheckColorInactive},0.1)
							Library:tween(Toggle["1e"], {ImageTransparency = 1},0.1)
						end

						options.callback(Toggle.State)
					end



				end
				--logic
				do
					Toggle["1t"].MouseEnter:Connect(function()
						Toggle.Hover = true

						Library:tween(Toggle["3x"], {Color =Theme.ButtonInputStrokeColor},0.5)

					end)

					Toggle["1t"].MouseLeave:Connect(function()
						Toggle.Hover = false

						if not Toggle.MouseDown then
							Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
						end
					end)

					uis.InputBegan:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
							Toggle.MouseDown = true
							Library:tween(Toggle["1t"], {BackgroundColor3 =  addColors(Theme.ToggleColor, Color3.fromRGB(30,30,30))},0.5)
							Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
							Toggle:UpdateToggle()
						end

					end)

					uis.InputEnded:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Toggle.MouseDown = false
							if Toggle.Hover then
								Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
								Library:tween(Toggle["1t"], {BackgroundColor3 = Theme.ToggleColor},0.5)
							else
								Library:tween(Toggle["1t"], {BackgroundColor3 = Theme.ToggleColor},0.5)
								Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
							end
						end

					end)

				end
				return Toggle
			end

			function Tab:Label(options)
				options = Library:Validate({
					Name = "Label"
				},options or {})

				local Label = {}

				--render
				do
					Label["36"] = Instance.new("Frame", Tab["15"]);
					Label["36"]["BorderSizePixel"] = 0;
					Label["36"]["BackgroundColor3"] = Theme.LabelColor;
					Label["36"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Label["36"]["Size"] = UDim2.new(1, 0, 0, 40);
					Label["36"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Label["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["36"]["Name"] = [[Label]];

					if GUI.Style == "Classic" then
						Label["36"]["Size"] = UDim2.new(1/1.15, 0, 0, 40/1.1)
					else
						Label["36"]["Size"]  = UDim2.new(1, 0, 0, 40)
					end
					
					-- StarterGui.s.Main.MainContent.HomeTab.Label.UICorner
					Label["37"] = Instance.new("UICorner", Label["36"]);



					-- StarterGui.s.Main.MainContent.HomeTab.Label.UIStroke
					Label["38"] = Instance.new("UIStroke", Label["36"]);
					Label["38"]["Thickness"] = 2;
					Label["38"]["Color"] = Theme.LabelInputStrokeColor;


					-- StarterGui.s.Main.MainContent.HomeTab.Label.Title
					Label["39"] = Instance.new("TextLabel", Label["36"]);
					Label["39"]["BorderSizePixel"] = 0;
					Label["39"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Label["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Label["39"]["TextSize"] = fontSize;
					Label["39"]["Font"] =fontall;
					Label["39"]["TextColor3"] = Theme.TextColor;
					Label["39"]["BackgroundTransparency"] = 1;
					Label["39"]["Size"] = UDim2.new(1, 0, 1, 0);
					Label["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["39"]["Text"] = options.Name;
					Label["39"]["Name"] = [[Title]];
					Label["39"]["TextWrapped"] = true;
					Label["39"]["TextYAlignment"] = Enum.TextYAlignment.Top;

					-- StarterGui.s.Main.MainContent.HomeTab.Label.UIPadding
					Label["3a"] = Instance.new("UIPadding", Label["36"]);
					Label["3a"]["PaddingTop"] = UDim.new(0, 6);
					Label["3a"]["PaddingRight"] = UDim.new(0, 8);
					Label["3a"]["PaddingLeft"] = UDim.new(0, 6);
					Label["3a"]["PaddingBottom"] = UDim.new(0, 8);
				end


				--methods
				function Label:SetText(text)
					options.Name = text
					Label:_update()
				end

				function Label:_update()
					Label["39"]["Text"] = options.Name

					Label["39"].Size = UDim2.new(Label["39"].Size.X.Scale, Label["39"].Size.X.Offset, 0, math.huge)
					Label["39"].Size = UDim2.new(Label["39"].Size.X.Scale, Label["39"].Size.X.Offset, 0, Label["39"].TextBounds.Y)
					Library:tween(Label["36"], {Size = UDim2.new(Label["36"].Size.X.Scale, Label["36"].Size.X.Offset, 0,Label["39"].TextBounds.Y + 14)},0.5)
				end


				Label:_update()
				return Label
			end

			function Tab:Slider(options)
				options = Library:Validate({
					Name = "Slider",
					min = 0,
					max = 100,
					Default = 50,
					callback = function(v) end
				},options or {})

				local Slider = {
					MouseDown = false,
					Hover = false,
					Connection = nil

				}
				--make slider
				do

					Slider["2a"] = Instance.new("Frame", Tab["15"]);
					Slider["2a"]["BorderSizePixel"] = 0;
					Slider["2a"]["BackgroundColor3"] = Theme.SliderColor;
					Slider["2a"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Slider["2a"]["Size"] = UDim2.new(1, 0, 0, 50);
					Slider["2a"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Slider["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["2a"]["Name"] = [[Slider]];
					sliderRef[#sliderRef + 1] = Slider["2a"]
					
					
					if GUI.Style == "Classic" then
						Slider["2a"]["Size"] = UDim2.new(1/1.15, 0, 0, 50)
					else
						Slider["2a"]["Size"] = UDim2.new(1, 0, 0, 50)
					end
					
					
					-- StarterGui.s.Main.MainContent.HomeTab.Slider.UICorner
					Slider["2b"] = Instance.new("UICorner", Slider["2a"]);



					-- StarterGui.s.Main.MainContent.HomeTab.Slider.UIStroke
					Slider["2c"] = Instance.new("UIStroke", Slider["2a"]);
					Slider["2c"].Color = Theme.SliderStrokeAll
					Slider["2c"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					Slider["2c"].Thickness = 2

					-- StarterGui.s.Main.MainContent.HomeTab.Slider.Title
					Slider["2d"] = Instance.new("TextLabel", Slider["2a"]);
					Slider["2d"]["BorderSizePixel"] = 0;
					Slider["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["2d"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					Slider["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["2d"]["TextSize"] = fontSize;
					Slider["2d"]["Font"] =fontall;
					Slider["2d"]["TextColor3"] =Theme.TextColor;
					Slider["2d"]["BackgroundTransparency"] = 1;
					Slider["2d"]["Size"] = UDim2.new(0, 310, 1, -5);
					Slider["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["2d"]["Text"] = options.Name;
					Slider["2d"]["Name"] = [[Title]];


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.UIPadding
					Slider["2e"] = Instance.new("UIPadding", Slider["2a"]);
					Slider["2e"]["PaddingTop"] = UDim.new(0, 6);
					Slider["2e"]["PaddingRight"] = UDim.new(0, 8);
					Slider["2e"]["PaddingLeft"] = UDim.new(0, 6);
					Slider["2e"]["PaddingBottom"] = UDim.new(0, 6);


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.Value
					Slider["2f"] = Instance.new("TextLabel", Slider["2a"]);
					Slider["2f"]["BorderSizePixel"] = 0;
					Slider["2f"]["TextYAlignment"] = Enum.TextYAlignment.Center;
					Slider["2f"]["TextScaled"] = true;
					Slider["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["2f"]["TextSize"] = 21;
					Slider["2f"]["Font"] =fontall;
					Slider["2f"]["TextColor3"] = Theme.TextColor;
					Slider["2f"]["BackgroundTransparency"] = 1;
					Slider["2f"]["AnchorPoint"] = Vector2.new(1, 0);
					Slider["2f"]["Size"] = UDim2.new(0, 44, 0, 24);
					Slider["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["2f"]["Text"] = tostring(options.Default);
					Slider["2f"]["Name"] = [[Value]];
					Slider["2f"]["Position"] = UDim2.new(1, 0, 0, 0);


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack
					Slider["30"] = Instance.new("Frame", Slider["2a"]);
					Slider["30"]["BorderSizePixel"] = 0;
					Slider["30"]["BackgroundColor3"] = Theme.SliderBackColor;
					Slider["30"]["AnchorPoint"] = Vector2.new(0, 1);
					Slider["30"]["Size"] = UDim2.new(1, 0, 0, 13);
					Slider["30"]["Position"] = UDim2.new(0, 0, 1, 0);
					Slider["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["30"]["Name"] = [[SliderBack]];


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.UICorner
					Slider["31"] = Instance.new("UICorner", Slider["30"]);



					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.UIStroke
					Slider["32"] = Instance.new("UIStroke", Slider["30"]);
					Slider["32"]["Color"] = Color3.fromRGB(73, 73, 73);


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.Fill
					Slider["33"] = Instance.new("Frame", Slider["30"]);
					Slider["33"]["BorderSizePixel"] = 0;
					Slider["33"]["BackgroundColor3"] = Theme.SliderFillColor;
					Slider["33"]["Size"] = UDim2.new(0.5, 0, 1, 0);
					Slider["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["33"]["Name"] = [[Fill]];


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.Fill.UICorner
					Slider["34"] = Instance.new("UICorner", Slider["33"]);



					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.Fill.UIStroke
					Slider["35"] = Instance.new("UIStroke", Slider["33"]);
					Slider["35"]["Color"] = Color3.fromRGB(73, 73, 73);
				end
				do  --Methods

					function Slider:SetValue(v)
						if v ==  nil then
							local precentage = math.clamp((mouse.X - Slider["30"].AbsolutePosition.X) / (Slider["30"].AbsoluteSize.X), 0, 1)
							local value = math.floor(((options.max - options.min) * precentage) + options.min)

							Slider["2f"].Text = tostring(value)
							Library:tween(Slider["33"], {Size =UDim2.fromScale(precentage,1)},.6, Enum.EasingStyle.Back,Enum.EasingDirection.Out)
						else
							Slider["2f"].Text = tostring(v)

							Library:tween(Slider["33"], {Size =UDim2.fromScale(((v -options.min) / (options.max - options.min)),1) },1)
						end
						options.callback(Slider:GetValue())
					end

					function Slider:GetValue()
						return tonumber(Slider["2f"].Text)
					end

					--function Slider:_Checkvalue()
					--	if options.Default > options.max  then
					--		Slider:SetValue()
					--	end
					--end	

				end
--[[
				Button["16"].MouseEnter:Connect(function()
					if Theme.isDark then
						Library:tween(Button["18"], {Color = addColors(Theme.ButtonInputStrokeColor, Color3.fromRGB(15,15,15))},0.3)
					else
						Library:tween(Button["18"], {Color = addColors(Theme.ButtonInputStrokeColor, Color3.fromRGB(-15,-15,-15))},0.3)
					end
					Button.Hover = true

				end)

				Button["16"].MouseLeave:Connect(function()
					Button.Hover = false
					if not Button.MouseDown then
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor})
					else
						
					end
				end)

				Button["16"].MouseButton1Down:Connect(function()
					Button.MouseDown = true
					Library:tween(Button["16"], {BackgroundColor3 = addColors(Theme.ButtonColor, Color3.fromRGB(30,30,30))},0.3)
					Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.5)
					options.callback()
				end)

				Button["16"].MouseButton1Up:Connect(function()
					Button.MouseDown = false
					if Button.Hover then
						Library:tween(Button["16"], {BackgroundColor3 = Theme.ButtonColor},0.3)
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.3)
					else
						Library:tween(Button["16"], {BackgroundColor3 = Theme.ButtonColor},0.3)
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.3)
					end
				end)
]]



				do -- logic
					Slider["2a"].MouseEnter:Connect(function()
						Slider.Hover = true

						if Theme.isDark then
							Library:tween(Slider["2c"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
							Library:tween(Slider["32"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
							Library:tween(Slider["35"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
						else
							Library:tween(Slider["2c"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(-38,-38,-38))},0.5)
							Library:tween(Slider["32"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(-38,-38,-38))},0.5)
							Library:tween(Slider["35"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(-38,-38,-38))},0.5)
						end
					end)

					Slider["2a"].MouseLeave:Connect(function()
						Slider.Hover = false

						if not Slider.MouseDown then
							
							Library:tween(Slider["2c"], {Color = Theme.SliderStrokeAll},0.5)
							Library:tween(Slider["32"], {Color = Theme.SliderStrokeAll},0.5)
							Library:tween(Slider["35"], {Color = Theme.SliderStrokeAll},0.5)
						end
					end)

					uis.InputBegan:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
							Slider.MouseDown = true

						if Theme.isDark then
							Library:tween(Slider["2a"], {BackgroundColor3 = addColors(Theme.SliderColor, Color3.fromRGB(20,20,20))},0.5)
							Library:tween(Slider["2c"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(68,68,68))},0.5)
							Library:tween(Slider["32"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(68,68,68))},0.5)
							Library:tween(Slider["35"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(68,68,68))},0.5)
						else
							Library:tween(Slider["2a"], {BackgroundColor3 = addColors(Theme.SliderColor, Color3.fromRGB(-20,-20,-20))},0.5)
							Library:tween(Slider["2c"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(-68,-68,-68))},0.5)
							Library:tween(Slider["32"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(-68,-68,-68))},0.5)
							Library:tween(Slider["35"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(-68,-68,-68))},0.5)
						end
							if  not Slider.Connection then
								Slider.Connection = runServices.RenderStepped:Connect(function()
									Slider:SetValue()
								end)
							end
						end

					end)

					uis.InputEnded:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Slider.MouseDown = false
							if Slider.Hover then
								if Theme.isDark then
									Library:tween(Slider["2c"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
									Library:tween(Slider["32"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
									Library:tween(Slider["35"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
								else
									Library:tween(Slider["2c"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(-38,-38,-38))},0.5)
									Library:tween(Slider["32"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(-38,-38,-38))},0.5)
									Library:tween(Slider["35"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(-38,-38,-38))},0.5)
								end
							else
								
								Library:tween(Slider["2c"], {Color = Theme.SliderStrokeAll},0.5)
								Library:tween(Slider["32"], {Color = Theme.SliderStrokeAll},0.5)
								Library:tween(Slider["35"], {Color = Theme.SliderStrokeAll},0.5)
							end
							Library:tween(Slider["2a"], {BackgroundColor3 = Theme.SliderColor},0.5)

							if Slider.Connection then Slider.Connection:Disconnect() end
							Slider.Connection = nil
						end

					end)


				end
				return Slider
			end

			function Tab:DropDown(options)

				options = Library:Validate({
					Name = "DropDown",
					callback = function(v) end,
					items = {}
				},options or {})

				local DropDown = {
					Items = {
						["id"] = {
							--instance = {},
							"value"
						},

					},
					open = false,
					MouseDown = false,
					Hover = false,
					hoveringItem = false,
					--Connection = nil

				}
				--make Dropdown
				do
					DropDown["3b"] = Instance.new("TextButton", Tab["15"]);
					DropDown["3b"]["BorderSizePixel"] = 0;
					DropDown["3b"]["BackgroundColor3"] = Theme.DropDownColor;
					DropDown["3b"]["AnchorPoint"] = Vector2.new(0.5, 0);
					DropDown["3b"]["ClipsDescendants"] = true;
					DropDown["3b"]["Size"] = UDim2.new(1, 0, 0, 40);
					DropDown["3b"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					DropDown["3b"]["BorderColor3"] = Theme.DropDownColor
					DropDown["3b"]["Name"] = [[DropDown]];
					DropDown["3b"]["TextTransparency"] = 1
					DropDown["3b"]["TextStrokeTransparency"] = 1
					DropDown["3b"]["AutoButtonColor"] = false

					if GUI.Style == "Classic" then
						DropDown["3b"]["Size"] = UDim2.new(1/1.15, 0, 0, 50/1.1)
					else
						DropDown["3b"]["Size"] = UDim2.new(1, 0, 0, 50)
					end
					
					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UICorner
					DropDown["3c"] = Instance.new("UICorner", DropDown["3b"]);



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UIStroke
					DropDown["3d"] = Instance.new("UIStroke", DropDown["3b"]);
					DropDown["3d"].Color = Theme.DropDownInputStrokeColor;
					DropDown["3d"].Thickness = 2;
					DropDown["3d"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					--DropDown["3d"].Thickness = 1;



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.Title
					DropDown["3e"] = Instance.new("TextLabel", DropDown["3b"]);
					DropDown["3e"]["BorderSizePixel"] = 0;
					DropDown["3e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					DropDown["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["3e"]["TextSize"] = fontSize;
					DropDown["3e"]["Font"] =fontall;
					DropDown["3e"]["TextColor3"] = Theme.TextColor;
					DropDown["3e"]["BackgroundTransparency"] = 1;
					DropDown["3e"]["Size"] = UDim2.new(1, -26, 0, 25);
					DropDown["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["3e"]["Text"] = options.Name;
					DropDown["3e"]["Name"] = [[Title]];


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UIPadding
					DropDown["3f"] = Instance.new("UIPadding", DropDown["3b"]);
					DropDown["3f"]["PaddingTop"] = UDim.new(0, 6);
					DropDown["3f"]["PaddingRight"] = UDim.new(0, 8);
					DropDown["3f"]["PaddingLeft"] = UDim.new(0, 6);
					DropDown["3f"]["PaddingBottom"] = UDim.new(0, 6);


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.Icon
					DropDown["40"] = Instance.new("ImageLabel", DropDown["3b"]);
					DropDown["40"]["BorderSizePixel"] = 0;
					DropDown["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["40"]["ScaleType"] = Enum.ScaleType.Fit;
					DropDown["40"]["AnchorPoint"] = Vector2.new(1, 1);
					DropDown["40"]["Image"] = [[rbxassetid://136506872237179]];
					DropDown["40"]["ImageColor3"]  = Theme.TextColor;
					DropDown["40"]["Size"] = UDim2.new(0, 30, 0, 30);
					DropDown["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["40"]["BackgroundTransparency"] = 1;
					DropDown["40"]["Name"] = [[Icon]];
					DropDown["40"]["Position"] = UDim2.new(1, 0, 0, 30);


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder
					DropDown["41"] = Instance.new("Frame", DropDown["3b"]);
					DropDown["41"]["Visible"] = false;
					DropDown["41"]["BorderSizePixel"] = 0;
					DropDown["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["41"]["Size"] = UDim2.new(1, 0, 1, -24);
					DropDown["41"]["Position"] = UDim2.new(0, 0, 0, 30);
					DropDown["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["41"]["Name"] = [[OptionHolder]];
					DropDown["41"]["BackgroundTransparency"] = 1;



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.UIListLayout
					DropDown["42"] = Instance.new("UIListLayout", DropDown["41"]);
					DropDown["42"]["Padding"] = UDim.new(0, 9);
					DropDown["42"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption	

				end
				--logic
				do
					function DropDown:Add(id,value)

						local item = {
							Hover = false,
							MouseDown = false
						}
						DropDown.Items[id] = {
							instance = {},
							value = value
						}
						DropDown.Items[id].instance["43"] = Instance.new("TextButton", DropDown["41"]);
						DropDown.Items[id].instance["43"]["TextWrapped"] = true;
						DropDown.Items[id].instance["43"]["BorderSizePixel"] = 0;
						DropDown.Items[id].instance["43"]["BackgroundColor3"] = Theme.DropDownOptionsColor;
						DropDown.Items[id].instance["43"]["TextSize"] = 21;
						DropDown.Items[id].instance["43"]["Font"] =fontall;
						DropDown.Items[id].instance["43"]["TextColor3"] = Theme.TextColor;
						DropDown.Items[id].instance["43"]["Size"] = UDim2.new(1, 0, 0, 28);
						DropDown.Items[id].instance["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						DropDown.Items[id].instance["43"]["Text"] = id;
						DropDown.Items[id].instance["43"]["Name"] = [[inactiveOption]];
						DropDown.Items[id].instance["43"]["AutoButtonColor"] = false;

						-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption.UIStroke
						DropDown.Items[id].instance["44"] = Instance.new("UIStroke", DropDown.Items[id].instance["43"]);
						DropDown.Items[id].instance["44"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						DropDown.Items[id].instance["44"]["Color"] = Theme.DropDownOptionsInputStrokeColor;


						-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption.UICorner
						DropDown.Items[id].instance["45"] = Instance.new("UICorner", DropDown.Items[id].instance["43"]);
						DropDown.Items[id].instance["45"]["CornerRadius"] = UDim.new(0, 10);						


						DropDown.Items[id].instance["43"].MouseEnter:Connect(function()
							if Theme.isDark then
								Library:tween(DropDown.Items[id].instance["44"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(20,20,20))}, 0.3, Enum.EasingStyle.Quint)
							else
								Library:tween(DropDown.Items[id].instance["44"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(-20,-20,-20))}, 0.3, Enum.EasingStyle.Quint)
							end

						end)

						DropDown.Items[id].instance["43"].MouseLeave:Connect(function()
							Library:tween(DropDown.Items[id].instance["44"], {Color = Theme.DropDownInputStrokeColor}, 0.3, Enum.EasingStyle.Quint)
						end)

						DropDown.Items[id].instance["43"].MouseButton1Down:Connect(function()
							Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = addColors(Theme.DropDownOptionsColor, Color3.fromRGB(20,20,20))}, 0.2, Enum.EasingStyle.Quint)
							options.callback(id)
							DropDown:Toggle()
						end)

						DropDown.Items[id].instance["43"].MouseButton1Up:Connect(function()
							Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = Theme.DropDownOptionsColor}, 0.2, Enum.EasingStyle.Quint)
						end)

					end

					function DropDown:Remove(id)
						if DropDown.Items[id] ~= nil then
							if DropDown.Items[id].instance ~= nil then
								for i, v in pairs(DropDown.Items[id].instance) do
									v:Destroy()
								end
							end
							DropDown.Items[id] = nil
						end
					end
					function DropDown:Clear()
						for i, v in pairs(DropDown.Items) do
							DropDown:Remove(i)
						end
					end

					function DropDown:Toggle()
						if DropDown.debounce then return end
						DropDown.debounce = true
						
						if DropDown["40"].Rotation == 0 then
							Library:tween(DropDown["40"], {Rotation = 180},0.5) 
						else
							Library:tween(DropDown["40"], {Rotation = 0},0.5) 
						end
						
						if DropDown.open then
							Library:tween(DropDown["3b"], {Size = UDim2.new(DropDown["3b"].Size.X.Scale,0,0,40)}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, function()
								DropDown.open = false

								DropDown.debounce = false
							end)
							wait(0.25)
							DropDown["41"].Visible = false
						else
							local count = 0
							for i,v in pairs(DropDown.Items) do
								if v ~= nil then
									count += 1
								end
							end

							Library:tween(DropDown["3b"], {Size = UDim2.new(DropDown["3b"].Size.X.Scale,0,0,40 +(count *(68-40)) + 14)}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, function()
								DropDown.open = true
								DropDown.debounce = false
							end)
							DropDown["41"].Visible = true
						end
					end
				end

				--METHODS
				do


					DropDown["3b"].MouseEnter:Connect(function()
						if Theme.isDark then
							Library:tween(DropDown["3d"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(20,20,20))}, 0.3, Enum.EasingStyle.Quint)
						else
							Library:tween(DropDown["3d"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(-20,-20,-20))}, 0.3, Enum.EasingStyle.Quint)
						end

					end)

					DropDown["3b"].MouseLeave:Connect(function()
						Library:tween(DropDown["3d"], {Color = Theme.DropDownInputStrokeColor}, 0.3, Enum.EasingStyle.Quint)
					end)

					DropDown["3b"].MouseButton1Down:Connect(function()
						Library:tween(DropDown["3b"], {BackgroundColor3 = addColors(Theme.DropDownColor, Color3.fromRGB(20,20,20))}, 0.2, Enum.EasingStyle.Quint)
						
							
					end)

					DropDown["3b"].MouseButton1Up:Connect(function()
						Library:tween(DropDown["3b"], {BackgroundColor3 = Theme.DropDownColor}, 0.2, Enum.EasingStyle.Quint)
						--options.callback()
						if not DropDown.hoveringItem then
							DropDown:Toggle()
						end
					end)


				end
				return DropDown
			end	
			
			function Tab:CreatePopUp(options)
					options = Library:Validate({
						ButtonLeftText = "Left_Button",
						ButtonRightText = "Right_Button",
						TitleText = "Tilte",
						Text = "Text",
						callbackButtonRight = function() end,
						callbackButtonLeft = function() end,

					},options or {})
					
				if not GUI.IsAPopUpCreated  then
					GUI.IsAPopUpCreated = true
					do
						local PopUp = Instance.new("Frame")
						local PopUpUiCorner = Instance.new("UICorner")
						local PopUpUIStroke = Instance.new("UIStroke")
						local ButtonHolder = Instance.new("Frame")
						local Button1 = Instance.new("TextButton")
						local Button1UICorner = Instance.new("UICorner")
						local UIListLayout = Instance.new("UIListLayout")
						local Button2 = Instance.new("TextButton")
						local UICorner = Instance.new("UICorner")
						local TextHolder = Instance.new("Frame")
						local Maintext = Instance.new("TextLabel")
						local MainTextUICorner = Instance.new("UICorner")
						local MainTextUIPadding = Instance.new("UIPadding")
						local Title = Instance.new("TextLabel")
						local TitleUICorner = Instance.new("UICorner")
						local TitleUIPadding = Instance.new("UIPadding")
						local Seperator = Instance.new("Frame")

						-- Properties

						PopUp.Name = "PopUp"
						PopUp.Parent = GUI["14"]
						PopUp.AnchorPoint = Vector2.new(0.5, 0.5)
						PopUp.BackgroundColor3 = Color3.fromRGB(200,200,200)
						PopUp.BorderColor3 = Color3.fromRGB(0, 0, 0)
						PopUp.BorderSizePixel = 0
						
						local UIGradient = Instance.new("UIGradient")
						
						local startColor = nil
						if Theme.isDark then
							startColor = ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0))
						else
							startColor = ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255))
						end

						UIGradient.Color = ColorSequence.new{startColor,
							ColorSequenceKeypoint.new(0.73, addColors(Theme.PopUpColor,Color3.fromRGB(-10,-10,-10))),
							ColorSequenceKeypoint.new(1.00, Theme.PopUpColor)}
						UIGradient.Parent = PopUp
						
						if isFixed  then
							PopUp.Size = UDim2.new(0, 350, 0, 260)
						else
							if GUI.Style == "Classic" then
								PopUp.Size = UDim2.new(0, 350, 0, 225) -  UDim2.new(0, 60, 0, 60) 
							else
							PopUp.Size = UDim2.new(0, 350, 0, 225) -  UDim2.new(0, 50, 0, 50) 
							end	
						end
						
						if GUI.Style == "Classic" then
							PopUp.Position = UDim2.new(0.4, 0, 0.5, 0)
						else
							PopUp.Position = UDim2.new(0.5, 0, 0.5, 0)
						end
						
						PopUp.Transparency = 1
						
						Library:tween(PopUp, {Transparency = PopUpTransparency},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)

						PopUpUIStroke.Name = "PopUpUIPadding"
						PopUpUIStroke.Parent = PopUp
						PopUpUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						PopUpUIStroke.Color = Color3.fromRGB(200,200,200)
						PopUpUIStroke.LineJoinMode = Enum.LineJoinMode.Round
						PopUpUIStroke.Thickness = 0
						Library:tween(PopUpUIStroke, {Thickness = 4},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
						local UIGradient = Instance.new("UIGradient")
						
						local startColor = nil
						if Theme.isDark then
							startColor = ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0))
						else
							startColor = ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255))
						end

						UIGradient.Color = ColorSequence.new{startColor,
							ColorSequenceKeypoint.new(0.73, addColors(Theme.PopUpStroke,Color3.fromRGB(-10,-10,-10))),
							ColorSequenceKeypoint.new(1.00, Theme.PopUpColor)}
						UIGradient.Parent = PopUpUIStroke


						Seperator.Name = "Seperator"
						Seperator.Parent = PopUp
						Seperator.AnchorPoint = Vector2.new(0, 1)
						Seperator.BackgroundColor3 = addColors(Theme.PopUpColor, Color3.fromRGB(10,10,10))
						Seperator.BackgroundTransparency = 1.000
						Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Seperator.BorderSizePixel = 0
						Seperator.Position = UDim2.new(0, 0, 0, 40)
						Seperator.Size = UDim2.new(1, 0, 0, 5)
						Seperator.Transparency = 1
						Seperator.Visible = false

						Library:tween(Seperator, {Transparency = 0},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)

						PopUpUiCorner.CornerRadius = UDim.new(0.05, 10)
						PopUpUiCorner.Name = "PopUpUiCorner"
						PopUpUiCorner.Parent = PopUp

						ButtonHolder.Name = "Button Holder"
						ButtonHolder.Parent = PopUp
						ButtonHolder.AnchorPoint = Vector2.new(0, 1)
						ButtonHolder.BackgroundColor3 = Theme.PopUpButtonColor
						ButtonHolder.BackgroundTransparency = 1.000
						ButtonHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
						ButtonHolder.BorderSizePixel = 0
						ButtonHolder.Position = UDim2.new(0, 0, 1, -10)
						ButtonHolder.Size = UDim2.new(1, 0, 0.25999999, 0)

						Button1.Name = "Button1"
						Button1.Parent = ButtonHolder
						Button1.AnchorPoint = Vector2.new(0.5, 1)
						Button1.BackgroundColor3 = Theme.PopUpButtonColor
						Button1.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Button1.BorderSizePixel = 0
						Button1.Position = UDim2.new(0.5, -30, 1, -10)
						Button1.Size = UDim2.new(0, 50, 0, 50)
						Button1["Font"] =fontall;
						Button1.Text = options.ButtonLeftText
						Button1.TextColor3 = Theme.TextColor
						Button1.TextSize = 20.000
						Button1.TextWrapped = true
						Button1.Transparency = 1
						Library:tween(Button1, {Transparency = 0},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)

						Button1UICorner.CornerRadius = UDim.new(0.100000001, 8)
						Button1UICorner.Name = "Button1UICorner"
						Button1UICorner.Parent = Button1

						UIListLayout.Parent = ButtonHolder
						UIListLayout.FillDirection = Enum.FillDirection.Horizontal
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout.Padding = UDim.new(0, 10)

						Button2.Name = "Button2"
						Button2.Parent = ButtonHolder
						Button2.AnchorPoint = Vector2.new(0.5, 1)
						Button2.BackgroundColor3 = Theme.PopUpButtonColor
						Button2.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Button2.BorderSizePixel = 0
						Button2.Position = UDim2.new(0.5, -30, 1, -10)
						Button2.Size = UDim2.new(0, 50, 0, 50)
						Button2["Font"] =fontall;
						Button2.Text = options.ButtonRightText
						Button2.TextColor3 = Theme.TextColor
						Button2.TextSize = 20.000
						Button2.TextWrapped = true
						Button2.Transparency = 1
						Library:tween(Button2, {Transparency = 0},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)

						UICorner.CornerRadius = UDim.new(0.100000001, 8)
						UICorner.Parent = Button2

						TextHolder.Name = "TextHolder"
						TextHolder.Parent = PopUp
						TextHolder.BackgroundColor3 = Color3.fromRGB(12, 20, 27)
						TextHolder.BackgroundTransparency = 1.000
						TextHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
						TextHolder.BorderSizePixel = 0
						TextHolder.Size = UDim2.new(1, 0, 0.649999976, 0)

						Maintext.Name = "Main text"
						Maintext.Parent = TextHolder
						Maintext.BackgroundColor3 = Theme.TextColor
						Maintext.BackgroundTransparency = 1.000
						Maintext.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Maintext.BorderSizePixel = 0
						Maintext.Position = UDim2.new(0, 0, 0.289999992, 0)
						Maintext.Size = UDim2.new(1, 0, 1.18461537, -50)
						Maintext["Font"] =fontall;
						Maintext.Text = options.Text
						Maintext.TextColor3 = Theme.TextColor
						Maintext.TextSize = 21.000
						Maintext.TextWrapped = true
						Maintext.TextXAlignment = Enum.TextXAlignment.Left
						Maintext.TextYAlignment = Enum.TextYAlignment.Top

						MainTextUICorner.CornerRadius = UDim.new(0.100000001, 8)
						MainTextUICorner.Name = "MainTextUICorner"
						MainTextUICorner.Parent = Maintext

						MainTextUIPadding.Name = "MainTextUIPadding"
						MainTextUIPadding.Parent = Maintext
						MainTextUIPadding.PaddingBottom = UDim.new(0, 20)
						MainTextUIPadding.PaddingLeft = UDim.new(0, 20)
						MainTextUIPadding.PaddingRight = UDim.new(0, 20)
						MainTextUIPadding.PaddingTop = UDim.new(0, 20)

						Title.Name = "Title"
						Title.Parent = TextHolder
						Title.BackgroundColor3 = Theme.TextColor
						Title.BackgroundTransparency = 1.000
						Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Title.BorderSizePixel = 0
						Title.Size = UDim2.new(1, 0, 0, 40)
						Title["Font"] =fontall;
						Title.Text = options.TitleText
						Title.TextColor3 = Theme.TextColor
						Title.TextSize = 30.000
						Title.TextWrapped = true

						TitleUICorner.CornerRadius = UDim.new(0.100000001, 8)
						TitleUICorner.Name = "TitleUICorner"
						TitleUICorner.Parent = Title

						TitleUIPadding.Name = "TitleUIPadding"
						TitleUIPadding.Parent = Title
						TitleUIPadding.PaddingBottom = UDim.new(0, 20)
						TitleUIPadding.PaddingLeft = UDim.new(0, 20)
						TitleUIPadding.PaddingRight = UDim.new(0, 20)
						TitleUIPadding.PaddingTop = UDim.new(0, 20)

						local function Destroy()
							Library:tween(PopUp, {Transparency = 1},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
							Library:tween(Button1, {Transparency = 1},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
							Library:tween(Button2, {Transparency = 1},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
							Library:tween(Title, {Transparency = 1},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
							Library:tween(Maintext, {Transparency = 1},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
							Library:tween(PopUpUIStroke, {Thickness = 0},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
							Library:tween(Seperator, {Transparency = 1},0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
							task.wait(0.3)
							PopUp:Destroy()
						end


						Button1.MouseButton1Click:Connect(function()
							options.callbackButtonLeft()
							GUI.IsAPopUpCreated = false
							Destroy()
						end)

						Button2.MouseButton1Click:Connect(function()
							Destroy()
							GUI.IsAPopUpCreated = false
							options.callbackButtonRight()
						end)

						-- Button event listeners

					end
				end
			end
			
			function Tab:TextInput(options)
				options = Library:Validate({
					PlaceHolderText = "",
					Title = "",
					CallBack = function(v) print(v) end -- Default callback
				}, options or {})

				-- Create a table to store the components
				local TextInput = {}
				do
					TextInput["2"] = Instance.new("TextLabel", Tab["15"]);
					TextInput["2"]["Active"] = true;
					TextInput["2"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					TextInput["2"]["BorderSizePixel"] = 0;
					TextInput["2"]["BackgroundColor3"] = Theme.TextInputColor
					TextInput["2"]["TextSize"] = 21;
					TextInput["2"]["Font"] =fontall;
					TextInput["2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					TextInput["2"]["Size"] = UDim2.new(1, 0, 0, 60);
					if GUI.Style == "Classic" then
						TextInput["2"]["Size"] = UDim2.new(1/1.15, 0, 0, 60)
					else
						TextInput["2"]["Size"] = UDim2.new(1, 0, 0, 60)
					end
					TextInput["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextInput["2"]["Text"] = [[]];
					TextInput["2"]["Selectable"] = true;
					TextInput["2"]["Name"] = [[TextInput]];
					TextInput["2"].ClipsDescendants = true

					-- StarterGui.ScreenGui.TextInput.UICorner
					TextInput["3"] = Instance.new("UICorner", TextInput["2"]);



					-- StarterGui.ScreenGui.TextInput.UIPadding
					TextInput["4"] = Instance.new("UIPadding", TextInput["2"]);
					TextInput["4"]["PaddingTop"] = UDim.new(0, 22);
					TextInput["4"]["PaddingRight"] = UDim.new(0, 10);
					TextInput["4"]["PaddingLeft"] = UDim.new(0, 10);
					TextInput["4"]["PaddingBottom"] = UDim.new(0, 8);


					-- StarterGui.ScreenGui.TextInput.UIStroke
					TextInput["5"] = Instance.new("UIStroke", TextInput["2"]);
					TextInput["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					TextInput["5"]["Color"] = Theme.InputStrokeColor
					TextInput["5"]["Thickness"] = 2


					-- StarterGui.ScreenGui.TextInput.Title
					TextInput["6"] = Instance.new("TextLabel", TextInput["2"]);
					TextInput["6"]["BorderSizePixel"] = 0;
					TextInput["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					TextInput["6"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					TextInput["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextInput["6"]["TextSize"] = fontSize;
					TextInput["6"]["Font"] =fontall;
					TextInput["6"]["TextColor3"] = Theme.TextColor;
					TextInput["6"]["BackgroundTransparency"] = 1;
					TextInput["6"]["Size"] = UDim2.new(0, 310, 1, -5);
					TextInput["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextInput["6"]["Name"] = ("TextInput " .. options.Title);
					TextInput["6"]["Position"] = UDim2.new(0, 0, 0, -15);
					TextInput["6"]["Text"] = options.Title


					-- StarterGui.ScreenGui.TextInput.Icon
					TextInput["7"] = Instance.new("ImageLabel", TextInput["2"]);
					TextInput["7"]["BorderSizePixel"] = 0;
					TextInput["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextInput["7"]["Image"] = [[rbxassetid://138353157704539]];
					TextInput["7"]["Size"] = UDim2.new(0, 30, 0, 30);
					TextInput["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextInput["7"]["BackgroundTransparency"] = 1;
					TextInput["7"]["Name"] = [[Icon]];
					TextInput["7"]["Position"] = UDim2.new(1, -25, 0, -25);
					TextInput["7"]["ImageColor3"] = Theme.TextColor


					-- StarterGui.ScreenGui.TextInput.TextBox
					TextInput["8"] = Instance.new("TextBox", TextInput["2"]);
					TextInput["8"]["TextColor3"] = Theme.TextColor;
					TextInput["8"]["BorderSizePixel"] = 0;
					TextInput["8"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					TextInput["8"]["TextSize"] = 21;
					if Theme.isDark then
						TextInput["8"]["BackgroundColor3"] = addColors(Theme.TextInputColor, Color3.fromRGB(15,15,15));
					else
						TextInput["8"]["BackgroundColor3"] = addColors(Theme.TextInputColor, Color3.fromRGB(-15,-15,-15));
					end

					TextInput["8"]["Font"] = fontall
					TextInput["8"]["AutomaticSize"] = Enum.AutomaticSize.X;
					TextInput["8"]["AnchorPoint"] = Vector2.new(1, 0);
					TextInput["8"]["Size"] = UDim2.new(0, 10, 0, 25);
					TextInput["8"]["Position"] = UDim2.new(0.99, 0, 0, 10);
					TextInput["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextInput["8"]["Text"] = [[]];
					TextInput["8"]["PlaceholderText"] = options.PlaceHolderText
					if Theme.isDark then
						TextInput["8"]["PlaceholderColor3"] = addColors(Theme.TextColor, Color3.fromRGB(-70,-70,-70));
					else
						TextInput["8"]["PlaceholderColor3"] = addColors(Theme.TextColor, Color3.fromRGB(70,70,70));
					end
					-- StarterGui.ScreenGui.TextInput.TextBox.UICorner
					TextInput["9"] = Instance.new("UICorner", TextInput["8"]);
					-- StarterGui.ScreenGui.TextInput.TextBox.UIPadding
					TextInput["a"] = Instance.new("UIPadding", TextInput["8"]);
					TextInput["a"]["PaddingTop"] = UDim.new(0, 7);
					TextInput["a"]["PaddingRight"] = UDim.new(0, 7);
					TextInput["a"]["PaddingLeft"] = UDim.new(0, 7);
					TextInput["a"]["PaddingBottom"] = UDim.new(0, 7);

				end

				function TextInput:SetText(Txt)
					TextInput["8"].Text = Txt
					options.CallBack(TextInput["8"].Text)
				end

				-- Set up the callback for text change
				TextInput["8"].FocusLost:Connect(function(enterPressed)
					if enterPressed then
						if TextInput["8"].Text == nil then
							return
						else
							options.CallBack(TextInput["8"].Text)
						end
					end
				end)

				return TextInput
			end
			
			function Tab:KeyBind(options)
				options = Library:Validate({
					Title = "KeyBind",
					KeyBind = Enum.KeyCode.N,
					CallBack = function() end
				}, options or {})

				-- Create a table to store the components
				local KeyBind = {
					CurrentKeyBind = nil
				}
				--make
				do
					KeyBind["2"] = Instance.new("TextLabel", Tab["15"]);
					KeyBind["2"]["Active"] = true;
					KeyBind["2"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					KeyBind["2"]["BorderSizePixel"] = 0;
					KeyBind["2"]["BackgroundColor3"] = Theme.TextInputColor
					KeyBind["2"]["TextSize"] = 21;
					KeyBind["2"]["Font"] =fontall;
					KeyBind["2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					KeyBind["2"]["Size"] = UDim2.new(1, 0, 0, 60);
					if GUI.Style == "Classic" then
						KeyBind["2"]["Size"] = UDim2.new(1/1.15, 0, 0, 60)
					else
						KeyBind["2"]["Size"] = UDim2.new(1, 0, 0, 60)
					end
					KeyBind["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					KeyBind["2"]["Text"] = [[]];
					KeyBind["2"]["Selectable"] = true;
					KeyBind["2"]["Name"] = [[TextInput]];
					KeyBind["2"].ClipsDescendants = true

					-- StarterGui.ScreenGui.TextInput.UICorner
					KeyBind["3"] = Instance.new("UICorner", KeyBind["2"]);



					-- StarterGui.ScreenGui.TextInput.UIPadding
					KeyBind["4"] = Instance.new("UIPadding", KeyBind["2"]);
					KeyBind["4"]["PaddingTop"] = UDim.new(0, 22);
					KeyBind["4"]["PaddingRight"] = UDim.new(0, 10);
					KeyBind["4"]["PaddingLeft"] = UDim.new(0, 10);
					KeyBind["4"]["PaddingBottom"] = UDim.new(0, 8);


					-- StarterGui.ScreenGui.TextInput.UIStroke
					KeyBind["5"] = Instance.new("UIStroke", KeyBind["2"]);
					KeyBind["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					KeyBind["5"]["Color"] = Theme.InputStrokeColor
					KeyBind["5"]["Thickness"] = 2


					-- StarterGui.ScreenGui.TextInput.Title
					KeyBind["6"] = Instance.new("TextLabel", KeyBind["2"]);
					KeyBind["6"]["BorderSizePixel"] = 0;
					KeyBind["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					KeyBind["6"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					KeyBind["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					KeyBind["6"]["TextSize"] = fontSize;
					KeyBind["6"]["Font"] =fontall;
					KeyBind["6"]["TextColor3"] = Theme.TextColor;
					KeyBind["6"]["BackgroundTransparency"] = 1;
					KeyBind["6"]["Size"] = UDim2.new(0, 310, 1, -5);
					KeyBind["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					KeyBind["6"]["Name"] = ("TextInput " .. options.Title);
					KeyBind["6"]["Position"] = UDim2.new(0, 0, 0, -15);
					KeyBind["6"]["Text"] = options.Title

					-- StarterGui.ScreenGui.TextInput.Icon
					KeyBind["7"] = Instance.new("ImageLabel", KeyBind["2"]);
					KeyBind["7"]["BorderSizePixel"] = 0;
					KeyBind["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					KeyBind["7"]["Image"] = [[rbxassetid://80945819041010]];
					KeyBind["7"]["Size"] = UDim2.new(0, 30, 0, 30);
					KeyBind["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					KeyBind["7"]["BackgroundTransparency"] = 1;
					KeyBind["7"]["Name"] = options.KeyBind.Name;
					KeyBind["7"]["Position"] = UDim2.new(1, -30, 0, -22);
					KeyBind["7"]["ImageColor3"] = Theme.TextColor


					-- StarterGui.ScreenGui.TextInput.TextBox
					KeyBind["8"] = Instance.new("TextBox", KeyBind["2"]);
					KeyBind["8"]["TextColor3"] = Theme.TextColor;
					KeyBind["8"]["BorderSizePixel"] = 0;
					KeyBind["8"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					KeyBind["8"]["TextSize"] = 21;
					if Theme.isDark then
						KeyBind["8"]["BackgroundColor3"] = addColors(Theme.TextInputColor, Color3.fromRGB(15,15,15));
					else
						KeyBind["8"]["BackgroundColor3"] = addColors(Theme.TextInputColor, Color3.fromRGB(-15,-15,-15));
					end

					KeyBind["8"]["Font"] =fontall;
					KeyBind["8"]["AutomaticSize"] = Enum.AutomaticSize.X;
					KeyBind["8"]["AnchorPoint"] = Vector2.new(1, 0);
					KeyBind["8"]["Size"] = UDim2.new(0, 10, 0, 25);
					KeyBind["8"]["Position"] = UDim2.new(0.99, 0, 0, 10);
					KeyBind["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					KeyBind["8"]["Text"] = [[]];
					KeyBind["8"]["PlaceholderText"] = [[KeyBind]]
					if Theme.isDark then
						KeyBind["8"]["PlaceholderColor3"] = addColors(Theme.TextColor, Color3.fromRGB(-70,-70,-70));
					else
						KeyBind["8"]["PlaceholderColor3"] = addColors(Theme.TextColor, Color3.fromRGB(70,70,70));
					end

					-- StarterGui.ScreenGui.TextInput.TextBox.UICorner
					KeyBind["9"] = Instance.new("UICorner", KeyBind["8"]);
					-- StarterGui.ScreenGui.TextInput.TextBox.UIPadding
					KeyBind["a"] = Instance.new("UIPadding", KeyBind["8"]);
					KeyBind["a"]["PaddingTop"] = UDim.new(0, 7);
					KeyBind["a"]["PaddingRight"] = UDim.new(0, 7);
					KeyBind["a"]["PaddingLeft"] = UDim.new(0, 7);
					KeyBind["a"]["PaddingBottom"] = UDim.new(0, 7);

				end
				--logic
				do
				
				KeyBind.CurrentKeyBind = options.KeyBind
				KeyBind["8"].Text = "Keybind:" .. KeyBind.CurrentKeyBind.Name
				KeyBind["8"].TextEditable = false
				
				function KeyBind:SetKeyBind(Txt)
					KeyBind["8"].Text = Txt.Name
					--options.CallBack()
				end
				
				KeyBind["8"].Focused:Connect(function()
					--print("ListeningForInput")
					KeyBind["8"].Text = "..."
					local connection
					connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.KeyCode ~= GUI.currentKey and input.KeyCode ~= Enum.KeyCode.Unknown then
							KeyBind["8"].Text = "Keybind:" .. input.KeyCode.Name
							KeyBind.CurrentKeyBind = input.KeyCode
							KeyBind["8"]:ReleaseFocus()
							connection:Disconnect()
						end
					end)
				end)
					
				uis.InputBegan:Connect(function(input)
					if input.KeyCode == KeyBind.CurrentKeyBind then
						options.CallBack()
					end
				end)
				end	
				
				return KeyBind
			end

			function Tab:Notification(options)
				options = Library:Validate({
					Text = "Text",
					Title = "Title",
					ActiveTime = 5
				},options or {})

				local Notificaton = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local MainText = Instance.new("TextLabel")
				local UICorner_2 = Instance.new("UICorner")
				local Seperator = Instance.new("Frame")
				local UiAll = Instance.new("Frame")
				local UIPadding = Instance.new("UIPadding")
				local UIStrokeNotif = Instance.new("UIStroke")
				local Title = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local UICorner_3 = Instance.new("UICorner")
				local Icon = Instance.new("ImageLabel")
				local UIPadding_3 = Instance.new("UIPadding")

				if not _G.ActiveNotifications then
					_G.ActiveNotifications = {}
				end

				local offset = 0
				for _, notification in ipairs(_G.ActiveNotifications) do
					if notification.Parent then
						offset = offset + 100
					end
				end
				
				local sound = Instance.new("Sound")
				sound.SoundId = "rbxassetid://6518811702"
				-- replace with your sound id
				sound.Parent = game:GetService("SoundService")
				sound:Play()

				Notificaton.Size = UDim2.new(0, (350/1.15), 0, (100/1.15))
				Notificaton.Name = "Notification"
				Notificaton.Parent = NotificationHolder
				Notificaton.BackgroundColor3 = Color3.new(200,200,200)
				Notificaton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Notificaton.BorderSizePixel = 0
				Notificaton.AnchorPoint = Vector2.new(1, 1)
				Notificaton.Position = UDim2.new(1, -30, 1, 120 + offset)
				table.insert(_G.ActiveNotifications, Notificaton)
				Notificaton.BackgroundTransparency = NotifTransparency
				-- animate to final position
				Library:tween(Notificaton, {Position = UDim2.new(1, -30, 1, -10 - offset)}, 1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
				table.insert(allthings, Notificaton)

                local UIGradient = Instance.new("UIGradient")
						
						local startColor = nil
						if Theme.isDark then
							startColor = ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0))
						else
							startColor = ColorSequenceKeypoint.new(0.00, Color3.fromRGB(200, 200, 200))
						end
						UIGradient.Color = ColorSequence.new{startColor,
							ColorSequenceKeypoint.new(0.73, Theme.NotificationColor),
							ColorSequenceKeypoint.new(1.00, Theme.PopUpColor)}
						UIGradient.Parent = Notificaton

				UIStrokeNotif.Name = "PopUpUIPadding"
				UIStrokeNotif.Parent = Notificaton
				UIStrokeNotif.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStrokeNotif.Color = Theme.NotificationInputStrokeColor
				UIStrokeNotif.LineJoinMode = Enum.LineJoinMode.Round
				UIStrokeNotif.Thickness = 0

				UiAll.Name = "UiAll"
				UiAll.Parent = Notificaton
				UiAll.BorderColor3 = Color3.fromRGB(0, 0, 0)
				UiAll.BorderSizePixel = 0
				UiAll.Transparency = 1
				UiAll.AnchorPoint = Vector2.new(0, 0)
				UiAll.Position = UDim2.new(0,0,0,0)
				UiAll.Size = UDim2.new(1,0,1,0)

				UICorner.CornerRadius = UDim.new(0.100000001, 8)
				UICorner.Parent = Notificaton

				MainText.Name = "Main Text"
				MainText.Parent = UiAll
				MainText.Active = true
				MainText.AnchorPoint = Vector2.new(1, 1)
				MainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				MainText.BackgroundTransparency = 1.000
				MainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				MainText.BorderSizePixel = 0
				MainText.Position = UDim2.new(1, 0, 1.07000005, 0)
				MainText.Selectable = true
				MainText.Size = UDim2.new(1, 0, 0.99000001, -20)
				MainText.Font = fontall
				MainText.Text = options.Text
				MainText.TextColor3 = Theme.TextColor
				MainText.TextSize = 20.000
				MainText.TextWrapped = true
				MainText.TextXAlignment = Enum.TextXAlignment.Left
				MainText.TextYAlignment = Enum.TextYAlignment.Top

				Seperator.Name = "Seperator"
				Seperator.Parent = Notificaton
				Seperator.BackgroundColor3 = Theme.NotificationSeperatorColor
				Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Seperator.BorderSizePixel = 0
				Seperator.Position = UDim2.new(0, 0,0.3, 0)
				Seperator.AnchorPoint = Vector2.new(0,0)
				Seperator.Size = UDim2.new(1, 0, 0,3)
				Seperator.Visible = false

				Seperator.BackgroundColor3 = Theme.NotificationSeperatorColor
				Seperator.BorderColor3 = Color3.fromRGB(42, 56, 68)
				Seperator.BorderSizePixel = 0
				Seperator.Position = UDim2.new(0, 0, 0.3, 0)
				Seperator.Size = UDim2.new(1, 0, 0, 3)

				UICorner_2.CornerRadius = UDim.new(0.100000001, 8)
				UICorner_2.Parent = MainText

				UIPadding.Parent = UiAll
				UIPadding.PaddingBottom = UDim.new(0, 5)
				UIPadding.PaddingLeft = UDim.new(0, 1)
				UIPadding.PaddingRight = UDim.new(0, 1)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Title.Name = "Title"
				Title.Parent = UiAll
				Title.Active = true
				Title.AnchorPoint = Vector2.new(1, 0)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(1, 0, 0, 0)
				Title.Selectable = true
				Title.Size = UDim2.new(1, 0, 0.100000001, 20)
				Title["Font"] =fontall;
				Title.Text = options.Title
				Title.TextColor3 = Theme.TextColor
				Title.TextSize = 30.000
				Title.TextWrapped = true
				Title.TextYAlignment = Enum.TextYAlignment.Bottom

				UIPadding_2.Parent = Title
				UIPadding_2.PaddingBottom = UDim.new(0, 10)
				UIPadding_2.PaddingLeft = UDim.new(0, 10)
				UIPadding_2.PaddingRight = UDim.new(0, 10)
				UIPadding_2.PaddingTop = UDim.new(0, 30)

				UICorner_3.CornerRadius = UDim.new(0.100000001, 8)
				UICorner_3.Parent = Title

				Icon.Name = "Icon"
				Icon.Parent = UiAll
				Icon.AnchorPoint = Vector2.new(1, 0)
				Icon.BackgroundTransparency = 1.000
				Icon.Position = UDim2.new(0, 20,0, 0)
				Icon.Size = UDim2.new(0, 25, 0, 25)
				Icon.Image = "rbxassetid://137847593094125"
				Icon.ImageColor3 = Theme.TextColor

				UIPadding_3.Parent = Notificaton
				UIPadding_3.PaddingBottom = UDim.new(0, 4)
				UIPadding_3.PaddingLeft = UDim.new(0, 15)
				UIPadding_3.PaddingRight = UDim.new(0, 15)
				UIPadding_3.PaddingTop = UDim.new(0, 4)
				
				--logic
				local function CloseNotification()
					local delay = 0.55
					wait(options.ActiveTime)
					Library:tween(Notificaton, {BackgroundTransparency = 1}, delay)
					for _, v in pairs(Notificaton:GetDescendants()) do
						if v:IsA("Frame") then
							Library:tween(v, {BackgroundTransparency = 1}, delay)
						elseif v:IsA("TextLabel") or v:IsA("TextButton") then
							Library:tween(v, {TextTransparency = 1}, delay)
						elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
							Library:tween(v, {ImageTransparency = 1}, delay)
						elseif v:IsA("UIStroke") then
							Library:tween(v, {Thickness = 0}, delay)
						end
					end
					wait(delay)
					Notificaton:Destroy()
					table.remove(_G.ActiveNotifications, table.find(_G.ActiveNotifications, Notificaton))
					for i, notification in ipairs(_G.ActiveNotifications) do
						Library:tween(notification, {Position = UDim2.new(1, -30, 1, -10 - ((i-1) * 100))}, 0.5)
					end
				end
				CloseNotification()
			end
			
			function Tab:Seperator()
				local Seperator = {}
				Seperator["2"] = Instance.new("Frame", Tab["15"]);
				Seperator["2"]["BorderSizePixel"] = 0;
				Seperator["2"]["BackgroundColor3"] = Theme.SeperatorColor;
				Seperator["2"]["Size"] = UDim2.new(1, 0, 0, 5);
				if GUI.Style == "Classic" then
					Seperator["2"].Size = UDim2.new(1/1.15, 0, 0, 5)
				else
					Seperator["2"].Size = UDim2.new(1, 0, 0, 5)
				end
				Seperator["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Seperator["2"]["Name"] = [[Seperator]];

				Seperator["3"] = Instance.new("UIPadding", Seperator["2"]);
				Seperator["3"]["PaddingTop"] = UDim.new(0, 100);
				Seperator["3"]["PaddingRight"] = UDim.new(0, 100);
				Seperator["3"]["PaddingLeft"] = UDim.new(0, 100);
				Seperator["3"]["PaddingBottom"] = UDim.new(0, 100);

				Seperator["4"] = Instance.new("UICorner", Seperator["2"]);

				Seperator["5"] = Instance.new("UIStroke", Seperator["2"]);
				Seperator["5"]["Color"] = Theme.SeperatorStrokeColor;
				return Seperator
				
			end
			
			--Exit and minimise
			do
				--exit
				do
				local Exit = Instance.new("ImageButton")

				Exit.Name = "Exit"
				Exit.Parent = GUI["4"]
				Exit.Active = false
				Exit.AnchorPoint = Vector2.new(1, 0.5)
				Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Exit.BackgroundTransparency = 1.000
				Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Exit.BorderSizePixel = 0
				Exit.Position = UDim2.new(1, -6, 0.5, 0)
				Exit.Selectable = false
					Exit.Size = UDim2.new(0, 22, 0, 22)
					
				Exit.Image = "rbxassetid://101632078875960"
				Exit.ImageColor3 = Theme.TextColor
					
				local Hover = false
				local IsClicked = false
				Exit.MouseButton1Click:Connect(function()
					if not IsClicked then
						IsClicked = true
						Tab:CreatePopUp({
							ButtonLeftText = "Confirm",
							ButtonRightText = "Go Back",
							TitleText = "Warning",
							Text = "Do you Want to UnLoad The Library",
							callbackButtonLeft = function()
								GUI:_Destroy()
							end,
							callbackButtonRight = function()
								IsClicked = false
							end
						})
					end

					end)
				end
				--Minimise
				do
					local Minimise = Instance.new("ImageButton")

					Minimise.Name = "Minimise"
					Minimise.Parent = GUI["4"]
					Minimise.Active = false
					Minimise.AnchorPoint = Vector2.new(1, 0.5)
					Minimise.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Minimise.BackgroundTransparency = 1.000
					Minimise.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Minimise.BorderSizePixel = 0
					Minimise.Position = UDim2.new(1, -29, 0.5, 0)
					Minimise.Selectable = false
					Minimise.Size = UDim2.new(0, 22, 0, 22)
					Minimise.Image = "rbxassetid://98939068367813"
					Minimise.ImageColor3 = Theme.TextColor
					
					local IsClicked = false
					
					Minimise.MouseButton1Click:Connect(function()
						GUI:_ToggleVisibility()
					end)
				end
			end
			
			return Tab
		end

	end
	
	--make settings
	function GUI:_MakeSettings()
		local Settings = {
			isToggled = false,
			MouseDown = false,
			IsHovering = false,
			CoolDown = false
		}
		--make settings button
		do
			Settings["1"] = Instance.new("ImageButton", GUI["b"]);
			if GUI.Style == "Classic" then
				Settings["1"].Parent = GUI["4"]
			end
			Settings["1"]["BorderSizePixel"] = 0;
			Settings["1"]["BackgroundColor3"] = Theme.DockColor;
			if GUI.Style ~= "Classic" then
				Settings["1"]["AnchorPoint"] = Vector2.new(0, 0.5);
			else
				Settings["1"]["AnchorPoint"] = Vector2.new(1, 0.5);
			end
			
			Settings["1"]["Image"] = [[]];
			if GUI.Style == "Classic" then
				Settings["1"]["Size"] = UDim2.new(0, 22, 0, 22);
			else
				if not isFixed then
					Settings["1"]["Size"] = UDim2.new(0, 45, 0, 45);
				else
					Settings["1"]["Size"] = UDim2.new(0, 45, 0, 45);
				end
				
			end
			
			Settings["1"]["HoverImage"] = [[]];
			Settings["1"]["Name"] = [[Settings]];
			Settings["1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			if GUI.Style ~= "Classic" then
				Settings["1"]["Position"] = UDim2.new(1, 10, 0.5, 0);
			else
				Settings["1"].Position = UDim2.new(1, -58, 0.5, 0)
			end
			if GUI.Style ~= "Classic" then
				Settings["1"]["BackgroundTransparency"] = 0.2
			else
				Settings["1"]["BackgroundTransparency"] = 1
			end
			
			Settings["1"].AutoButtonColor = false
			
			Settings["1"].ImageColor3 = Theme.TextColor
			
			

			Settings["2"] = Instance.new("UICorner", Settings["1"]);
			Settings["2"]["CornerRadius"] = UDim.new(0, 20);
			
			Settings["icon"] = Instance.new("ImageLabel", Settings["1"]);
			Settings["icon"]["BorderSizePixel"] = 0;
			if GUI.Style == "Classic" then
				Settings["icon"]["BackgroundColor3"] = Theme.TopBar ;
			else
				Settings["icon"]["BackgroundColor3"] = Theme.DockColor;
			end
			
			Settings["icon"]["AnchorPoint"] = Vector2.new(0, 0);
			Settings["icon"]["Image"] = [[rbxassetid://138554176123976]];
			Settings["icon"]["Size"] = UDim2.new(1,0,1,0);
			--Settings["icon"]["HoverImage"] = [[rbxassetid://138554176123976]];
			Settings["icon"]["Name"] = [[Settings]];
			Settings["icon"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Settings["icon"]["Position"] = UDim2.new(0,0,0,0);
			
			if GUI.Style ~= "Classic" then
				Settings["icon"]["BackgroundTransparency"] = 1
			else
				Settings["icon"]["BackgroundTransparency"] = 1
			end
			
			--Settings["icon"].AutoButtonColor = false
			Settings["icon"].ImageColor3 = Theme.TextColor

			Settings["icons"] = Instance.new("UICorner", Settings["icon"]);
			Settings["icons"]["CornerRadius"] = UDim.new(0, 20);
		end

		--make settings panel
		do
			Settings["3"] = Instance.new("Frame", GUI["2"]);
			Settings["3"]["ZIndex"] = 0;
			Settings["3"]["BorderSizePixel"] = 0;
			Settings["3"]["BackgroundColor3"] = Theme.BackgroundColor
			Settings["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Settings["3"]["ClipsDescendants"] = true;
			Settings["3"]["Size"] = UDim2.new(0, 0, 1, 0);
			Settings["3"]["Position"] = UDim2.new(1, 0,0.5, 0);
			Settings["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Settings["3"]["Name"] = [[Settings]];
			Settings["3"]["Visible"] = false
			Settings["3"].Transparency = GUI["2"].Transparency
			Settings["3"].ZIndex = 0

			-- StarterGui.ScreenGui.Settings.Scrollable
			Settings["Scrollable"] = Instance.new("ScrollingFrame", Settings["3"]);
			Settings["Scrollable"]["BorderSizePixel"] = 0;
			Settings["Scrollable"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Settings["Scrollable"]["Name"] = [[Scrollable]];
			Settings["Scrollable"]["Selectable"] = false;
			--Settings["Scrollable"]["ClipsDescendants"] = false;
			Settings["Scrollable"]["Size"] = UDim2.new(1, 0, 1, -30);
			Settings["Scrollable"]["ScrollBarImageColor3"] = Color3.fromRGB(112, 112, 112);
			Settings["Scrollable"]["Position"] = UDim2.new(0, 0, 0.1, 0);
			Settings["Scrollable"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Settings["Scrollable"]["ScrollBarThickness"] = 10;
			Settings["Scrollable"]["BackgroundTransparency"] = 1;
			Settings["Scrollable"].ZIndex = 0
			Settings["Scrollable"].CanvasSize = UDim2.new(1,0,1,0)
			Settings["Scrollable"].AutomaticCanvasSize = Enum.AutomaticSize.Y
			Settings["Scrollable"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always;
			Settings["Scrollable"].ScrollingDirection = Enum.ScrollingDirection.Y
			
			Settings["ScrollableL"] = Instance.new("UIListLayout", Settings["Scrollable"]);
			Settings["ScrollableL"]["Padding"] = UDim.new(0, 11);
			Settings["ScrollableL"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			Settings["ScrollableP"] = Instance.new("UIPadding", Settings["Scrollable"]);
			Settings["ScrollableP"]["PaddingRight"] = UDim.new(0, 20);
			Settings["ScrollableP"]["PaddingBottom"] = UDim.new(0, 10);
			Settings["ScrollableP"]["PaddingLeft"] = UDim.new(0, 14);
			Settings["ScrollableP"]["PaddingTop"] = UDim.new(0, 10);

			-- StarterGui.ScreenGui.Settings.UICorner
			Settings["4"] = Instance.new("UICorner", Settings["3"]);
			Settings["4"]["CornerRadius"] = UDim.new(0, 10);

			-- StarterGui.ScreenGui.Settings.TopBar
			Settings["5"] = Instance.new("Frame", Settings["3"]);
			Settings["5"]["BorderSizePixel"] = 0;
			Settings["5"]["BackgroundColor3"] = Theme.TopBar;
			Settings["5"]["Size"] = UDim2.new(1, 0, 0, 30);
			Settings["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Settings["5"]["Name"] = [[TopBar]];
			Settings["5"].ZIndex = 0;

			-- StarterGui.ScreenGui.Settings.TopBar.Extension
			Settings["6"] = Instance.new("Frame", Settings["5"]);
			Settings["6"]["BorderSizePixel"] = 0;
			Settings["6"]["BackgroundColor3"] = Theme.TopBar;
			Settings["6"]["AnchorPoint"] = Vector2.new(0, 1);
			Settings["6"]["Size"] = UDim2.new(1, 0, 0.3, 0);
			Settings["6"]["Position"] = UDim2.new(0, 0, 1, 0);
			Settings["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Settings["6"]["Name"] = [[Extension]];
			Settings["6"].ZIndex = 0;

			-- StarterGui.ScreenGui.Settings.TopBar.UICorner
			Settings["7"] = Instance.new("UICorner", Settings["5"]);
			Settings["7"]["CornerRadius"] = UDim.new(0, 10);

			-- StarterGui.ScreenGui.Settings.TopBar.TextLabel
			Settings["8"] = Instance.new("TextLabel", Settings["5"]);
			Settings["8"]["BorderSizePixel"] = 0;
			Settings["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Settings["8"]["TextSize"] = 21;
			Settings["8"]["Font"] =fontall;
			Settings["8"]["TextColor3"] = Theme.TextColor
			Settings["8"]["BackgroundTransparency"] = 1;
			Settings["8"]["Size"] = UDim2.new(1, 0, 1, 0);
			Settings["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Settings["8"]["Text"] = [[Settings]];
			Settings["8"].ZIndex = 0;

			-- StarterGui.ScreenGui.Settings.UIPadding
			Settings["9"] = Instance.new("UIPadding", Settings["3"]);
			Settings["9"]["PaddingRight"] = UDim.new(0, 3);
			Settings["9"]["PaddingBottom"] = UDim.new(0, 3);
		end

		do
			--Reusable Toggle
			function Settings:Toggle(options)
				options = Library:Validate({
					Name = "Toogle",
					callback = function() end
				},options or {})

				local Toggle = {
					Hover = false,
					MouseDown = false,
					State = false
				}

				do
					Toggle["1t"] = Instance.new("Frame", Settings["Scrollable"]);
					Toggle["1t"]["BorderSizePixel"] = 0;
					Toggle["1t"]["BackgroundColor3"] = Theme.ToggleColor;
					Toggle["1t"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Toggle["1t"]["Size"] = UDim2.new(1, 0, 0, 40);
					Toggle["1t"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Toggle["1t"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1t"]["Name"] = [[ToggleInactive]];
					Toggle["1t"]["ClipsDescendants"] = true

					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UICorner
					Toggle["dx"] = Instance.new("UICorner", Toggle["1t"]);

					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UIStroke
					Toggle["3x"] = Instance.new("UIStroke", Toggle["1t"]);
					Toggle["3x"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					Toggle["3x"]["Color"] = Theme.ButtonInputStrokeColor;
					Toggle["3x"]["Thickness"] = 2;


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.Title
					Toggle["2x"] = Instance.new("TextLabel", Toggle["1t"]);
					Toggle["2x"]["BorderSizePixel"] = 0;
					Toggle["2x"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["2x"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2x"]["TextSize"] = 21;
					Toggle["2x"]["Font"] =fontall;
					Toggle["2x"]["TextColor3"] = Theme.TextColor;
					Toggle["2x"]["BackgroundTransparency"] = 1;
					Toggle["2x"]["Size"] = UDim2.new(1, -120, 1, 0);
					Toggle["2x"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2x"]["Text"] = options.Name;
					Toggle["2x"]["Name"] = [[Title]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UIPadding
					Toggle["4x"] = Instance.new("UIPadding", Toggle["1t"]);
					Toggle["4x"]["PaddingTop"] = UDim.new(0, 0);
					Toggle["4x"]["PaddingRight"] = UDim.new(0, 8);
					Toggle["4x"]["PaddingLeft"] = UDim.new(0, 6);
					Toggle["4x"]["PaddingBottom"] = UDim.new(0, 0);


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder
					Toggle["1z"] = Instance.new("Frame", Toggle["1t"]);
					Toggle["1z"]["BorderSizePixel"] = 0;
					Toggle["1z"]["BackgroundColor3"] = Theme.ToggleCheckColorInactive;
					Toggle["1z"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Toggle["1z"]["Size"] = UDim2.new(0, 20, 0, 20);
					Toggle["1z"]["Position"] = UDim2.new(1, -5, 0.5,0);
					Toggle["1z"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1z"]["Name"] = [[CheckMarkHolder]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.checkmark
					Toggle["1e"] = Instance.new("ImageLabel", Toggle["1z"]);
					Toggle["1e"]["BorderSizePixel"] = 0;
					Toggle["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["1e"]["ImageTransparency"] = 1;
					Toggle["1e"]["Image"] = [[rbxassetid://129387373527527]];
					Toggle["1e"]["ImageColor3"]  = Theme.TextColor;
					Toggle["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
					Toggle["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1e"]["BackgroundTransparency"] = 1;
					Toggle["1e"]["Name"] = [[checkmark]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.UIStroke
					Toggle["1v"] = Instance.new("UIStroke", Toggle["1z"]);
					Toggle["1v"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.UICorner
					Toggle["1r"] = Instance.new("UICorner", Toggle["1z"]);
					Toggle["1r"]["CornerRadius"] = UDim.new(0, 4);
				end
				--methods
				do
					function Toggle:UpdateToggle(b)
						if b == nil then
							Toggle.State = not Toggle.State
						else
							Toggle.State = b
						end

						if Toggle.State then
							Library:tween(Toggle["1z"], {BackgroundColor3 = Theme.ToggleCheckColor},0.1)
							Library:tween(Toggle["1e"], {ImageTransparency = 0},0.1)
						else
							Library:tween(Toggle["1z"], {BackgroundColor3 = Theme.ToggleCheckColorInactive},0.1)
							Library:tween(Toggle["1e"], {ImageTransparency = 1},0.1)
						end

						options.callback(Toggle.State)
					end



				end
				--logic
				do
					Toggle["1t"].MouseEnter:Connect(function()
						Toggle.Hover = true

						Library:tween(Toggle["3x"], {Color =Theme.ButtonInputStrokeColor},0.5)

					end)

					Toggle["1t"].MouseLeave:Connect(function()
						Toggle.Hover = false

						if not Toggle.MouseDown then
							Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
						end
					end)

					uis.InputBegan:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
							Toggle.MouseDown = true
							Library:tween(Toggle["1t"], {BackgroundColor3 =  addColors(Theme.ToggleColor, Color3.fromRGB(30,30,30))},0.5)
							Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
							Toggle:UpdateToggle()
						end

					end)

					uis.InputEnded:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Toggle.MouseDown = false
							if Toggle.Hover then
								Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
								Library:tween(Toggle["1t"], {BackgroundColor3 = Theme.ToggleColor},0.5)
							else
								Library:tween(Toggle["1t"], {BackgroundColor3 = Theme.ToggleColor},0.5)
								Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
							end
						end

					end)

				end
				return Toggle
			end
			--reusable keybind
			function Settings:KeyBind(options)
				options = Library:Validate({
					Title = "KeyBind",
					KeyBind = Enum.KeyCode.N,
					CallBack = function(v) end
				}, options or {})

				-- Create a table to store the components
				local KeyBind = {
					CurrentKeyBind = nil,
					isVisible = false
				}
				--make
				do
					KeyBind["2"] = Instance.new("TextLabel", Settings["Scrollable"]);
					KeyBind["2"]["Active"] = true;
					KeyBind["2"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					KeyBind["2"]["BorderSizePixel"] = 0;
					KeyBind["2"]["BackgroundColor3"] = Theme.TextInputColor
					KeyBind["2"]["TextSize"] = 21;
					KeyBind["2"]["Font"] =fontall;
					KeyBind["2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					KeyBind["2"]["Size"] = UDim2.new(1, 0, 0, 60);
					KeyBind["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					KeyBind["2"]["Text"] = [[]];
					KeyBind["2"]["Selectable"] = true;
					KeyBind["2"]["Name"] = [[TextInput]];
					KeyBind["2"].ClipsDescendants = true

					-- StarterGui.ScreenGui.TextInput.UICorner
					KeyBind["3"] = Instance.new("UICorner", KeyBind["2"]);
					
					-- StarterGui.ScreenGui.TextInput.UIPadding
					KeyBind["4"] = Instance.new("UIPadding", KeyBind["2"]);
					KeyBind["4"]["PaddingTop"] = UDim.new(0, 22);
					KeyBind["4"]["PaddingRight"] = UDim.new(0, 10);
					KeyBind["4"]["PaddingLeft"] = UDim.new(0, 10);
					KeyBind["4"]["PaddingBottom"] = UDim.new(0, 8);


					-- StarterGui.ScreenGui.TextInput.UIStroke
					KeyBind["5"] = Instance.new("UIStroke", KeyBind["2"]);
					KeyBind["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					KeyBind["5"]["Color"] = Theme.InputStrokeColor
					KeyBind["5"]["Thickness"] = 2


					-- StarterGui.ScreenGui.TextInput.Title
					KeyBind["6"] = Instance.new("TextLabel", KeyBind["2"]);
					KeyBind["6"]["BorderSizePixel"] = 0;
					KeyBind["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					KeyBind["6"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					KeyBind["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					KeyBind["6"]["TextSize"] = 21;
					KeyBind["6"]["Font"] =fontall;
					KeyBind["6"]["TextColor3"] = Theme.TextColor;
					KeyBind["6"]["BackgroundTransparency"] = 1;
					KeyBind["6"]["Size"] = UDim2.new(0, 310, 1, -5);
					KeyBind["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					KeyBind["6"]["Name"] = ("TextInput " .. options.Title);
					KeyBind["6"]["Position"] = UDim2.new(0, 0, 0, -15);
					KeyBind["6"]["Text"] = options.Title


					-- StarterGui.ScreenGui.TextInput.Icon
					KeyBind["7"] = Instance.new("ImageLabel", KeyBind["2"]);
					KeyBind["7"]["BorderSizePixel"] = 0;
					KeyBind["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					KeyBind["7"]["Image"] = [[rbxassetid://80945819041010]];
					KeyBind["7"]["Size"] = UDim2.new(0, 30, 0, 30);
					KeyBind["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					KeyBind["7"]["BackgroundTransparency"] = 1;
					KeyBind["7"]["Name"] = options.KeyBind.Name;
					KeyBind["7"]["Position"] = UDim2.new(1, -30, 0, -22);
					KeyBind["7"]["ImageColor3"] = Theme.TextColor


					-- StarterGui.ScreenGui.TextInput.TextBox
					KeyBind["8"] = Instance.new("TextBox", KeyBind["2"]);
					KeyBind["8"]["TextColor3"] = Theme.TextColor;
					KeyBind["8"]["BorderSizePixel"] = 0;
					KeyBind["8"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					KeyBind["8"]["TextSize"] = 21;
					if Theme.isDark then
						KeyBind["8"]["BackgroundColor3"] = addColors(Theme.TextInputColor, Color3.fromRGB(15,15,15));
					else
						KeyBind["8"]["BackgroundColor3"] = addColors(Theme.TextInputColor, Color3.fromRGB(-15,-15,-15));
					end

					KeyBind["8"]["Font"] =fontall;
					KeyBind["8"]["AutomaticSize"] = Enum.AutomaticSize.X;
					KeyBind["8"]["AnchorPoint"] = Vector2.new(1, 0);
					KeyBind["8"]["Size"] = UDim2.new(0, 10, 0, 25);
					KeyBind["8"]["Position"] = UDim2.new(0.99, 0, 0, 10);
					KeyBind["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					KeyBind["8"]["Text"] = [[]];
					KeyBind["8"]["PlaceholderText"] = [[KeyBind]]
					if Theme.isDark then
						KeyBind["8"]["PlaceholderColor3"] = addColors(Theme.TextColor, Color3.fromRGB(-70,-70,-70));
					else
						KeyBind["8"]["PlaceholderColor3"] = addColors(Theme.TextColor, Color3.fromRGB(70,70,70));
					end

					-- StarterGui.ScreenGui.TextInput.TextBox.UICorner
					KeyBind["9"] = Instance.new("UICorner", KeyBind["8"]);



					-- StarterGui.ScreenGui.TextInput.TextBox.UIPadding
					KeyBind["a"] = Instance.new("UIPadding", KeyBind["8"]);
					KeyBind["a"]["PaddingTop"] = UDim.new(0, 7);
					KeyBind["a"]["PaddingRight"] = UDim.new(0, 7);
					KeyBind["a"]["PaddingLeft"] = UDim.new(0, 7);
					KeyBind["a"]["PaddingBottom"] = UDim.new(0, 7);

				end
				--logic
				do

					KeyBind.CurrentKeyBind = options.KeyBind
					KeyBind["8"].Text = "Keybind:" .. KeyBind.CurrentKeyBind.Name
					KeyBind["8"].TextEditable = false

					function KeyBind:SetKeyBind(Txt)
						KeyBind["8"].Text = Txt.Name
						--options.CallBack()
					end

					KeyBind["8"].Focused:Connect(function()
						--print("ListeningForInput")
						KeyBind["8"].Text = "..."
						local connection
						connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.KeyCode ~= options.ToggleKey and input.KeyCode ~= Enum.KeyCode.Unknown then
								KeyBind["8"].Text = "Keybind:" .. input.KeyCode.Name
								KeyBind.CurrentKeyBind = input.KeyCode
								options.KeyBind = KeyBind.CurrentKeyBind 
								KeyBind["8"]:ReleaseFocus()
								connection:Disconnect()
							end
						end)
					end)

					uis.InputBegan:Connect(function(input)
						if input.KeyCode == KeyBind.CurrentKeyBind then
							options.CallBack(KeyBind.CurrentKeyBind)
						end
					end)
				end	

				return KeyBind
			end
			function Settings:DropDown(options)

				options = Library:Validate({
					Name = "DropDown",
					callback = function(v) end,
					items = {}
				},options or {})

				local DropDown = {
					Items = {
						["id"] = {
							--instance = {},
							"value"
						},

					},
					open = false,
					MouseDown = false,
					Hover = false,
					hoveringItem = false,
					--Connection = nil

				}
				--make Dropdown
				do
					DropDown["3b"] = Instance.new("TextButton", Settings["Scrollable"]);
					DropDown["3b"]["BorderSizePixel"] = 0;
					DropDown["3b"]["BackgroundColor3"] = Theme.DropDownColor;
					DropDown["3b"]["AnchorPoint"] = Vector2.new(0.5, 0);
					DropDown["3b"]["ClipsDescendants"] = true;
					DropDown["3b"]["Size"] = UDim2.new(1, 0, 0, 40);
					DropDown["3b"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					DropDown["3b"]["BorderColor3"] = Theme.DropDownColor
					DropDown["3b"]["Name"] = [[DropDown]];
					DropDown["3b"]["TextTransparency"] = 1
					DropDown["3b"]["TextStrokeTransparency"] = 1
					DropDown["3b"]["AutoButtonColor"] = false
					DropDown["3b"]["ClipsDescendants"] = true

					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UICorner
					DropDown["3c"] = Instance.new("UICorner", DropDown["3b"]);

					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UIStroke
					DropDown["3d"] = Instance.new("UIStroke", DropDown["3b"]);
					DropDown["3d"].Color = Theme.DropDownInputStrokeColor;
					DropDown["3d"].Thickness = 2;
					DropDown["3d"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					--DropDown["3d"].Thickness = 1;



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.Title
					DropDown["3e"] = Instance.new("TextLabel", DropDown["3b"]);
					DropDown["3e"]["BorderSizePixel"] = 0;
					DropDown["3e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					DropDown["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["3e"]["TextSize"] = 21;
					DropDown["3e"]["Font"] =fontall;
					DropDown["3e"]["TextColor3"] = Theme.TextColor;
					DropDown["3e"]["BackgroundTransparency"] = 1;
					DropDown["3e"]["Size"] = UDim2.new(1, -26, 0, 25);
					DropDown["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["3e"]["Text"] = options.Name;
					DropDown["3e"]["Name"] = [[Title]];


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UIPadding
					DropDown["3f"] = Instance.new("UIPadding", DropDown["3b"]);
					DropDown["3f"]["PaddingTop"] = UDim.new(0, 6);
					DropDown["3f"]["PaddingRight"] = UDim.new(0, 8);
					DropDown["3f"]["PaddingLeft"] = UDim.new(0, 6);
					DropDown["3f"]["PaddingBottom"] = UDim.new(0, 6);


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.Icon
					DropDown["40"] = Instance.new("ImageLabel", DropDown["3b"]);
					DropDown["40"]["BorderSizePixel"] = 0;
					DropDown["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["40"]["ScaleType"] = Enum.ScaleType.Fit;
					DropDown["40"]["AnchorPoint"] = Vector2.new(1, 1);
					DropDown["40"]["Image"] = [[rbxassetid://136506872237179]];
					DropDown["40"]["ImageColor3"]  = Theme.TextColor;
					DropDown["40"]["Size"] = UDim2.new(0, 30, 0, 30);
					DropDown["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["40"]["BackgroundTransparency"] = 1;
					DropDown["40"]["Name"] = [[Icon]];
					DropDown["40"]["Position"] = UDim2.new(1, 0, 0, 30);


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder
					DropDown["41"] = Instance.new("Frame", DropDown["3b"]);
					DropDown["41"]["Visible"] = false;
					DropDown["41"]["BorderSizePixel"] = 0;
					DropDown["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["41"]["Size"] = UDim2.new(1, 0, 1, -24);
					DropDown["41"]["Position"] = UDim2.new(0, 0, 0, 30);
					DropDown["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["41"]["Name"] = [[OptionHolder]];
					DropDown["41"]["BackgroundTransparency"] = 1;



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.UIListLayout
					DropDown["42"] = Instance.new("UIListLayout", DropDown["41"]);
					DropDown["42"]["Padding"] = UDim.new(0, 9);
					DropDown["42"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption	

				end
				--logic
				do
					function DropDown:Add(id,value)

						local item = {
							Hover = false,
							MouseDown = false
						}
						DropDown.Items[id] = {
							instance = {},
							value = value
						}
						DropDown.Items[id].instance["43"] = Instance.new("TextButton", DropDown["41"]);
						DropDown.Items[id].instance["43"]["TextWrapped"] = true;
						DropDown.Items[id].instance["43"]["BorderSizePixel"] = 0;
						DropDown.Items[id].instance["43"]["BackgroundColor3"] = Theme.DropDownOptionsColor;
						DropDown.Items[id].instance["43"]["TextSize"] = 21;
						DropDown.Items[id].instance["43"]["Font"] =fontall;
						DropDown.Items[id].instance["43"]["TextColor3"] = Theme.TextColor;
						DropDown.Items[id].instance["43"]["Size"] = UDim2.new(1, 0, 0, 28);
						DropDown.Items[id].instance["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						DropDown.Items[id].instance["43"]["Text"] = id;
						DropDown.Items[id].instance["43"]["Name"] = [[inactiveOption]];
						DropDown.Items[id].instance["43"]["AutoButtonColor"] = false;

						-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption.UIStroke
						DropDown.Items[id].instance["44"] = Instance.new("UIStroke", DropDown.Items[id].instance["43"]);
						DropDown.Items[id].instance["44"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						DropDown.Items[id].instance["44"]["Color"] = Theme.DropDownOptionsInputStrokeColor;


						-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption.UICorner
						DropDown.Items[id].instance["45"] = Instance.new("UICorner", DropDown.Items[id].instance["43"]);
						DropDown.Items[id].instance["45"]["CornerRadius"] = UDim.new(0, 10);						


						DropDown.Items[id].instance["43"].MouseEnter:Connect(function()
							if Theme.isDark then
								Library:tween(DropDown.Items[id].instance["44"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(20,20,20))}, 0.3, Enum.EasingStyle.Quint)
							else
								Library:tween(DropDown.Items[id].instance["44"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(-20,-20,-20))}, 0.3, Enum.EasingStyle.Quint)
							end

						end)

						DropDown.Items[id].instance["43"].MouseLeave:Connect(function()
							Library:tween(DropDown.Items[id].instance["44"], {Color = Theme.DropDownInputStrokeColor}, 0.3, Enum.EasingStyle.Quint)
						end)

						DropDown.Items[id].instance["43"].MouseButton1Down:Connect(function()
							Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = addColors(Theme.DropDownOptionsColor, Color3.fromRGB(20,20,20))}, 0.2, Enum.EasingStyle.Quint)
							options.callback(id)
							DropDown:Toggle()
						end)

						DropDown.Items[id].instance["43"].MouseButton1Up:Connect(function()
							Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = Theme.DropDownOptionsColor}, 0.2, Enum.EasingStyle.Quint)
						end)

					end

					function DropDown:Remove(id)
						if DropDown.Items[id] ~= nil then
							if DropDown.Items[id].instance ~= nil then
								for i, v in pairs(DropDown.Items[id].instance) do
									v:Destroy()
								end
							end
							DropDown.Items[id] = nil
						end
					end
					function DropDown:Clear()
						for i, v in pairs(DropDown.Items) do
							DropDown:Remove(i)
						end
					end

					function DropDown:Toggle()
						if DropDown.debounce then return end
						DropDown.debounce = true

						if DropDown["40"].Rotation == 0 then
							Library:tween(DropDown["40"], {Rotation = 180},0.5) 
						else
							Library:tween(DropDown["40"], {Rotation = 0},0.5) 
						end

						if DropDown.open then
							Library:tween(DropDown["3b"], {Size = UDim2.new(1,0,0,40)}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, function()
								DropDown.open = false

								DropDown.debounce = false
							end)
							wait(0.25)
							DropDown["41"].Visible = false
						else
							local count = 0
							for i,v in pairs(DropDown.Items) do
								if v ~= nil then
									count += 1
								end
							end

							Library:tween(DropDown["3b"], {Size = UDim2.new(1,0,0,40 +(count *(68-40)) + 14)}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, function()
								DropDown.open = true
								DropDown.debounce = false
							end)
							DropDown["41"].Visible = true
						end
					end
				end

				--METHODS
				do


					DropDown["3b"].MouseEnter:Connect(function()
						if Theme.isDark then
							Library:tween(DropDown["3d"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(20,20,20))}, 0.3, Enum.EasingStyle.Quint)
						else
							Library:tween(DropDown["3d"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(-20,-20,-20))}, 0.3, Enum.EasingStyle.Quint)
						end

					end)

					DropDown["3b"].MouseLeave:Connect(function()
						Library:tween(DropDown["3d"], {Color = Theme.DropDownInputStrokeColor}, 0.3, Enum.EasingStyle.Quint)
					end)

					DropDown["3b"].MouseButton1Down:Connect(function()
						Library:tween(DropDown["3b"], {BackgroundColor3 = addColors(Theme.DropDownColor, Color3.fromRGB(20,20,20))}, 0.2, Enum.EasingStyle.Quint)


					end)

					DropDown["3b"].MouseButton1Up:Connect(function()
						Library:tween(DropDown["3b"], {BackgroundColor3 = Theme.DropDownColor}, 0.2, Enum.EasingStyle.Quint)
						--options.callback()
						if not DropDown.hoveringItem then
							DropDown:Toggle()
						end
					end)


				end
				return DropDown
			end	
		end
		
		local AllTransparentValues = {
			guitwo = GUI["2"].Transparency,
			settingsone = Settings["1"]["BackgroundTransparency"],
			dock = GUI["b"].Transparency,
		}

		function Settings:_ToggleVisibility()
			if Settings.isToggled and Settings.CoolDown == false then
				Library:tween(Settings["icon"], {Rotation = 0}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
				Settings.CoolDown = true
				Library:tween(Settings["3"], {Position = UDim2.new(1, 1,0.5, 0)}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
				Library:tween(Settings["3"], {Size = UDim2.new(0,0,Settings["3"].Size.Y.Scale,Settings["3"].Size.Y.Offset)}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut,function()
					Settings["3"].Visible = false
					Settings.isToggled = false
					Settings.CoolDown = false
				end)
			else if not Settings.isToggled and Settings.CoolDown == false then
					Library:tween(Settings["icon"], {Rotation = 90}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
					Settings.CoolDown = true
					Settings.CoolDown = true
					Settings["3"].Visible = true
					Library:tween(Settings["3"], {Position = UDim2.new(1, 10, 0.5, 0)}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
					Library:tween(Settings["3"], {Size = UDim2.new(0, 300, 1, 0)}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut,function()
						Settings.isToggled = true
						Settings.CoolDown = false
					end)
				end
			end
		end

		--logic
		do
			--button
			do
				Settings["1"].MouseEnter:Connect(function()
					Settings.IsHovering = true
					--print(Settings.IsHovering)
					if Theme.isDark then
						Library:tween(Settings["1"], {ImageColor3 = addColors(Theme.TextColor, Color3.fromRGB(-35,-35,-35))},0.3)
					else
						Library:tween(Settings["1"], {ImageColor3 = addColors(Theme.TextColor, Color3.fromRGB(35,35,35))},0.3)
					end


				end)

				Settings["1"].MouseLeave:Connect(function()
					Settings.IsHovering = false
					if not Settings.MouseDown then
						Library:tween(Settings["1"], {ImageColor3 = Theme.TextColor},0.3)
					end
				end)


				Settings["1"].MouseButton1Down:Connect(function()
					Settings.MouseDown = true
					if Theme.isDark then
						Library:tween(Settings["1"], {ImageColor3 = addColors(Theme.TextColor, Color3.fromRGB(-60,-60,-60))},0.3)
					else
						Library:tween(Settings["1"], {ImageColor3 = addColors(Theme.TextColor, Color3.fromRGB(60,60,60))},0.3)
					end

				end)

				Settings["1"].MouseButton1Click:Connect(function()
					Settings:_ToggleVisibility()
				end)


				Settings["1"].MouseButton1Up:Connect(function()
					Settings.MouseDown = false
					if not Settings.IsHovering then
						Library:tween(Settings["1"], {ImageColor3 = Theme.TextColor},0.3)
					else
						if Theme.isDark then
							Library:tween(Settings["1"], {ImageColor3 = addColors(Theme.TextColor, Color3.fromRGB(-35,-35,-35))},0.3)
						else
							Library:tween(Settings["1"], {ImageColor3 = addColors(Theme.TextColor, Color3.fromRGB(35,35,35))},0.3)
						end
					end
				end)

			end
			--panel
			do
				do	

					local transparencytg = Settings:Toggle({
						Name = "Transparency",
						callback = function(visible) 
							if visible then
								if GUI.Style ~= "Classic" then
									GUI["2"].Transparency = AllTransparentValues["guitwo"]
									GUI["b"].Transparency = AllTransparentValues["dock"]
									Settings["1"].Transparency = AllTransparentValues["settingsone"]
									Settings["3"].Transparency = AllTransparentValues["guitwo"]
								end
								NotifTransparency = 0.3
								PopUpTransparency = 0.02
								for _, child in ipairs(NotificationHolder:GetChildren()) do
									if child.Name:match("^Notification") then -- checks if name starts with "Notification"
										child.Transparency = NotifTransparency
									end
								end
								for _, child in ipairs(GUI["14"]:GetChildren()) do
									if child.Name:match("^PopUp") then -- checks if name starts with "Notification"
										child.Transparency = 0.02
									end
								end
							else
								if GUI.Style ~= "Classic" then
									GUI["2"].Transparency = 0
									GUI["b"].Transparency = 0
									Settings["1"].Transparency = 0
									Settings["3"].Transparency = 0
								else
									
								end
								NotifTransparency = 0
								PopUpTransparency= 0
								for _, child in ipairs(NotificationHolder:GetChildren()) do
									if child.Name:match("^Notification") then -- checks if name starts with "Notification"
										child.Transparency = NotifTransparency
									end
								end
								for _, child in ipairs(GUI["14"]:GetChildren()) do
									if child.Name:match("^PopUp") then -- checks if name starts with "Notification"
										child.Transparency = 0
									end
								end
								
							end
						end

					})
					local Animtg = Settings:Toggle({
						Name = "Animations",
						callback = function(visible) 
							AnimationStatus = visible
						end

					})
					Animtg:UpdateToggle(true)
					
					Settings:KeyBind({
						Title = "Toogle KeyBind",
						KeyBind = GUI.currentKey,
						CallBack = function(v) 
							GUI.currentKey = v
						end
					})
					transparencytg:UpdateToggle(true)
					local current = GUI.Style		
					--[[
					local ThemeDD = Settings:DropDown({
						Name = "Themes",
						callback = function(option)
							local function applyTheme(theme)
								Theme = theme
								CurrentTheme = Theme
								
								for _, child in pairs(buttonStrokeRef) do
									child.Color = theme.ButtonInputStrokeColor
								end
								for _, child in pairs(buttonRef) do
									child.BackgroundColor3 = theme.ButtonColor
								end
								for _, child in pairs(sliderRef) do
									child.BackgroundColor3 = Theme.SliderColor;
								end
								GUI["2"]["BackgroundColor3"] = theme.BackgroundColor
								GUI["4"]["BackgroundColor3"] = theme.TopBar
								GUI["6"]["BackgroundColor3"] = theme.TopBar
								GUI["Time"]["TextColor3"] = theme.TextColor
								GUI["7"]["TextColor3"] = theme.TextColor
								GUI["b"]["BackgroundColor3"] = theme.DockColor
								if GUI["Ext"] ~= nil then
									GUI["Ext"].BackgroundColor3 = theme.BackgroundColor
									GUI["Sep"].BackgroundColor3 = theme.TopBarInputStrokeColor
								end
								for _, child in pairs(TabRef) do
									if child ~= tabcur or GUI.CurrentTab then
										if Theme.isDark == false then 
											child.ImageColor3 = addColors(Theme.TextColor, Color3.fromRGB(-80,-80,-80))
										else 
											child.ImageColor3 = addColors(Theme.TextColor, Color3.fromRGB(80,80,80))
										end
									else
										child["ImageColor3"] = Theme.TextColor;
									end
									
								end
								for _, child in pairs(TabTextRef) do
									child["TextColor3"] = Theme.TextColor
								end
								
								for _, child in pairs(toggleCheckMarkRef) do
									child["BackgroundColor3"] = Theme.ToggleCheckColorInactive;
									
								end
								
								for _, child in pairs(toggleRef) do
									child["BackgroundColor3"] = Theme.ToggleColor;
									
								end
								
								for _, child in pairs(toggleThirdRef) do
									child["ImageColor3"]  = Theme.TextColor;
								end
								for _, child in pairs(toggleStrokeRef) do
									child["Color"] = Theme.ButtonInputStrokeColor;
								end
							end

							if option == "Dark" then
								applyTheme(Themes.Black)
							elseif option == "Dark Blue" then
								applyTheme(Themes.DarkBlue)
							elseif option == "Dark Red" then
								applyTheme(Themes.DarkRed)
							elseif option == "Dark Green" then
								applyTheme(Themes.DarkGreen)
							elseif option == "Light Blue" then
								applyTheme(Themes.LightBlue)
							elseif option == "Light Yellow" then
								applyTheme(Themes.LightYellow)
							end
							
						end
					})

					ThemeDD:Add("Dark", 1)
					ThemeDD:Add("Dark Blue", 2)
					ThemeDD:Add("Dark Red", 3)
					ThemeDD:Add("Dark Green", 4)
					ThemeDD:Add("Light Blue", 5)
					ThemeDD:Add("Light Yellow", 6)
					]]
					
					if GUI.Style ~= "Classic" then
					
						local d = Settings:DropDown({
							Name = "Style",
							callback = function(option) 
								if option == "Fixed" and GUI.Style ~= "Fixed" then
									--GUI["2"].Size = UDim2.new(0, 601.5, 0, 450);
									Library:tween(GUI["2"], {Size =  UDim2.new(0, 601.5, 0, 450)}, 0.8, Enum.EasingStyle.Quint)
									GUI["b"].Parent = GUI["1"];
									GUI["b"]["Size"] = UDim2.new(0,650, 0, 60);
									do
										GUI["b"].Visible = not GUI["b"].Visible
										GUI["b"].Position = UDim2.new(0.5,0,1, -60);
										wait(0.4)
										GUI["b"].Visible = not GUI["b"].Visible
									end
									GUI["b"].AnchorPoint = Vector2.new(0.5,0.5)
									Settings["Scrollable"]["Size"] = UDim2.new(1, 0, 0.9, 0);
									isFixed = true
									--print(isFixed)
								GUI.Style = "Fixed"
								
								elseif option == "Dock Bellow" and GUI.Style ~= "Bottom" then
								isFixed = false
								
									Library:tween(GUI["2"], {Size =UDim2.new(0, 401, 0, 300)}, 0.8, Enum.EasingStyle.Quint)
									GUI["b"].Parent = GUI["2"];
									GUI["b"]["Size"] = UDim2.new(1,0, 0, 60);
									GUI["b"].AnchorPoint = Vector2.new(0,0)
									if GUI.Style == "Fixed" then
										do
											GUI["b"].Visible = not GUI["b"].Visible
											GUI["b"].Position = UDim2.new(0, 0,0, 350);
											wait(0.4)
											GUI["b"].Visible = not GUI["b"].Visible
										end
									else
										Library:tween(GUI["b"], {Position = UDim2.new(0, 0,0, 350)}, 0.8, Enum.EasingStyle.Quint)
									end
									print(isFixed)
									Settings["Scrollable"]["Size"] = UDim2.new(1, 0, 0.9, 0);
									GUI.Style = "Bottom"
								elseif option == "Dock Top"  and GUI.Style ~= "Top" then
								isFixed = false
								
									GUI["b"].Parent = GUI["2"];
									Library:tween(GUI["2"], {Size =UDim2.new(0, 401, 0, 300)}, 0.8, Enum.EasingStyle.Quint)
									GUI["b"]["Size"] = UDim2.new(1,0, 0, 60);
									GUI["b"].AnchorPoint = Vector2.new(0,0)
									if GUI.Style == "Fixed" then
										do
											GUI["b"].Visible = not GUI["b"].Visible
											GUI["b"].Position = UDim2.new(0, 0,0,-100);
											wait(0.4)
											GUI["b"].Visible = not GUI["b"].Visible
										end
									else
										Library:tween(GUI["b"], {Position = UDim2.new(0, 0,0, -100)}, 0.8, Enum.EasingStyle.Quint)
									end
									print(isFixed)

									GUI.Style = "Top"
								end

								if isFixed then
									GUI2PosLOl = UDim2.new(0, 601.5, 0, 450);
								else
									GUI2PosLOl= UDim2.new(0, 401, 0, 300);
								end
							end
						})
						d:Add("Fixed", 1)
						d:Add("Dock Bellow", 2)
						d:Add("Dock Top", 3)
						
						end
					end
			end
		end
		return Settings
	end

	GUI:_MakeSettings()
	
	function GUI:KeySystem() 
		do
			--ui
			
			local KeySystem = Instance.new("Frame")
			local ImageButton = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local TextHolder = Instance.new("Frame")
			local MainName = Instance.new("TextLabel")
			local MainText = Instance.new("TextLabel")
			local SmallTitle = Instance.new("TextLabel")
			local Frame = Instance.new("Frame")
			local TextBox = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")
			local UIPadding = Instance.new("UIPadding")
			local TextButton = Instance.new("TextButton")
			local DraggableFrame = Instance.new("Frame")

			DraggableFrame.Parent = KeySystem
			DraggableFrame.Name = "DraggableFrame"
			DraggableFrame.Size = UDim2.new(1, 0, 0.1, 0)
			DraggableFrame.Position = UDim2.new(0, 0, 0, 0)
			DraggableFrame.AnchorPoint = Vector2.new(0, 0)
			DraggableFrame.BackgroundTransparency = 1

			local UICorner_3 = Instance.new("UICorner")
			local UIPadding_2 = Instance.new("UIPadding")
			local UIListLayout = Instance.new("UIListLayout")

			-- Properties:
			KeySystem.Name = "KeySystem"
			KeySystem.Parent = GUI["1"]
			KeySystem.AnchorPoint = Vector2.new(0.5, 0.5)
			KeySystem.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			KeySystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
			KeySystem.BorderSizePixel = 0
			KeySystem.Size = UDim2.new(0, 420, 0, 200)
			KeySystem.Position = UDim2.new(0.5, 0, 1.5, 0)
			KeySystem.BackgroundTransparency = 0.1

			local Pos = UDim2.new(0.5, 0, 0.5, 0)
			Library:tween(KeySystem, {Position = Pos}, 1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)

			ImageButton.Parent = KeySystem
			ImageButton.AnchorPoint = Vector2.new(1, 0)
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageButton.BorderSizePixel = 0
			ImageButton.Position = UDim2.new(1, -10, 0, 10)
			ImageButton.Size = UDim2.new(0,22, 0,22)
			ImageButton.Image = "rbxassetid://101632078875960"

			UICorner.CornerRadius = UDim.new(0, 12)
			UICorner.Parent = KeySystem

			TextHolder.Name = "TextHolder"
			TextHolder.Parent = KeySystem
			TextHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextHolder.BackgroundTransparency = 1.000
			TextHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextHolder.BorderSizePixel = 0
			TextHolder.Size = UDim2.new(1, 0, 1, 0)

			MainName.Name = "Main Name"
			MainName.Parent = TextHolder
			MainName.AnchorPoint = Vector2.new(0.5, 0)
			MainName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainName.BackgroundTransparency = 1.000
			MainName.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainName.BorderSizePixel = 0
			MainName.Position = UDim2.new(0.5, 0, 0, 15)
			MainName.Size = UDim2.new(0, 300, 0, 40)
			MainName.Font = Enum.Font.GothamBold
			MainName.Text = options.KeySystemConfig.KeySystemText.Title
			MainName.TextColor3 = Color3.fromRGB(255, 255, 255)
			MainName.TextSize = 24.000
			MainName.TextXAlignment = Enum.TextXAlignment.Center

			MainText.Name = "Main Text"
			MainText.Parent = TextHolder
			MainText.AnchorPoint = Vector2.new(0.5, 0.5)
			MainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainText.BackgroundTransparency = 1.000
			MainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainText.BorderSizePixel = 0
			MainText.Position = UDim2.new(0.5, 0, 0.45, 0)
			MainText.Size = UDim2.new(1, -80, 0, 50)
			MainText.Font = Enum.Font.Gotham
			MainText.Text = options.KeySystemConfig.KeySystemText.Text
			MainText.TextColor3 = Color3.fromRGB(200, 200, 200)
			MainText.TextSize = 18.000
			MainText.TextWrapped = true
			MainText.TextXAlignment = Enum.TextXAlignment.Center
			MainText.TextYAlignment = Enum.TextYAlignment.Top

			SmallTitle.Name = "SmallTitle"
			SmallTitle.Parent = TextHolder
			SmallTitle.AnchorPoint = Vector2.new(0.5, 0.5)
			SmallTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SmallTitle.BackgroundTransparency = 1.000
			SmallTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SmallTitle.BorderSizePixel = 0
			SmallTitle.Position = UDim2.new(0.5, 0, 0.35, 0)
			SmallTitle.Size = UDim2.new(0, 200, 0, 20)
			SmallTitle.Font = Enum.Font.Gotham
			SmallTitle.Text = [[]]
			SmallTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
			SmallTitle.TextSize = 16.000
			SmallTitle.TextXAlignment = Enum.TextXAlignment.Center
			SmallTitle.Visible = false
			

			Frame.Parent = KeySystem
			Frame.AnchorPoint = Vector2.new(0, 1)
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0, 0, 1, 0)
			Frame.Size = UDim2.new(1, 0, 0, 80)
			Frame.Name = "Holder"

			TextBox.Parent = Frame
			TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
			TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(0.4, 0, 0.5, 0)
			TextBox.Size = UDim2.new(0.5, 0, 0, 40)
			TextBox.Font = Enum.Font.Gotham
			TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
			TextBox.PlaceholderText = "Enter Key"
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 16.000
			TextBox.TextXAlignment = Enum.TextXAlignment.Left

			UICorner_2.Parent = TextBox

			UIPadding.Parent = TextBox
			UIPadding.PaddingLeft = UDim.new(0, 10)
			UIPadding.PaddingRight = UDim.new(0, 10)

			TextButton.Name = "Sumbit"
			TextButton.Parent = Frame
			TextButton.AnchorPoint = Vector2.new(1, 0.5)
			TextButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Position = UDim2.new(0.9, 0, 0.5, 0)
			TextButton.Size = UDim2.new(0, 100, 0, 40)
			TextButton.Font = Enum.Font.GothamBold
			TextButton.Text = "Submit"
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 16.000
			TextButton.TextWrapped = true

			UICorner_3.Parent = TextButton

			UIPadding_2.Parent = TextButton
			UIPadding_2.PaddingLeft = UDim.new(0, 10)
			UIPadding_2.PaddingRight = UDim.new(0, 10)

			local SmallTextKey = Instance.new("TextLabel")

			SmallTextKey.Parent = Frame
			SmallTextKey.AnchorPoint = Vector2.new(0.5, 1)
			SmallTextKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SmallTextKey.BackgroundTransparency = 1.000
			SmallTextKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SmallTextKey.BorderSizePixel = 0
			SmallTextKey.Position = UDim2.new(0.08, 0, 0.25, 0)
			SmallTextKey.Size = UDim2.new(0.1, 0, 0, 15)
			SmallTextKey.Font = Enum.Font.Gotham
			SmallTextKey.Text = "Key"
			SmallTextKey.TextColor3 = Color3.fromRGB(255, 255, 255)
			SmallTextKey.TextSize = 14.000
			SmallTextKey.TextWrapped = true
			
			--logic
			do
			
			local sound = Instance.new("Sound")
			sound.Parent = game:GetService("SoundService")

			local function CheckKey(InputtedKey)
				if options.KeySystemConfig.Key == InputtedKey then
					Library:tween(KeySystem, {Position = UDim2.new(KeySystem.Position.X.Scale,KeySystem.Position.X.Offset,-0.5,0)}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
					wait(1.2)
					GUI["2"]["Visible"] = true
					GUI:Move()
					GUI.HasKeyBeenInputed = true
					GUI:_ToggleVisibility()
					task.wait(1.1)
					KeySystem:Destroy()
				else 
						Library:tween(TextBox, {Position = UDim2.new(TextBox.Position.X.Scale, -15, TextBox.Position.Y.Scale, 0)}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut,function()
							Library:tween(TextBox, {Position = UDim2.new(TextBox.Position.X.Scale, 15,TextBox.Position.Y.Scale, 0)}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut,function()
								Library:tween(TextBox, {Position = UDim2.new(TextBox.Position.X.Scale, 0, TextBox.Position.Y.Scale, 0)}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
								return
							end)
						end)
						--[[
						Library:tween(SmallTextKey, {Position = UDim2.new(SmallTextKey.Position.X.Scale, -15, SmallTextKey.Position.Y.Scale, 0)}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut,function()
							Library:tween(SmallTextKey, {Position = UDim2.new(SmallTextKey.Position.X.Scale, 15,SmallTextKey.Position.Y.Scale, 0)}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut,function()
								Library:tween(SmallTextKey, {Position = UDim2.new(SmallTextKey.Position.X.Scale, 0, SmallTextKey.Position.Y.Scale, 0)}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
								return
							end)
						end)
						]]
				end
			end
			
			TextButton.MouseButton1Click:Connect(function()
					CheckKey(TextBox.Text)
					
			end)

			ImageButton.MouseButton1Click:Connect(function()
				sound.SoundId = "rbxassetid://1524543584"
				sound:Play()
				KeySystem.ClipsDescendants = true
					Library:tween(KeySystem, {Position = UDim2.new(KeySystem.Position.X.Scale,KeySystem.Position.X.Offset,1,95)}, 0.7,Enum.EasingStyle.Back, Enum.EasingDirection.In)
				sound.Ended:Connect(function()
					task.wait(2)
					KeySystem:Destroy()
				end)

			end)
			
			end
			--drag
			do
				local topbar = DraggableFrame
				local draggableFrame = KeySystem

				local isDragging = false
				local dragStart = nil
				local startPos = nil
				local currentTween = nil

				local function smoothMove(targetPosition)
					if currentTween then currentTween:Cancel() end
					currentTween = Library:tween(draggableFrame, {Position = targetPosition}, 0.80, Enum.EasingStyle.Exponential)
				end

				topbar.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						isDragging = true
						dragStart = input.Position
						startPos = draggableFrame.Position
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						isDragging = false
					end
				end)

				uis.InputChanged:Connect(function(input)
					if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						local mouseOffset = input.Position - dragStart
						local targetPosition = UDim2.new(
							startPos.X.Scale, startPos.X.Offset + mouseOffset.X,
							startPos.Y.Scale, startPos.Y.Offset + mouseOffset.Y
						)
						smoothMove(targetPosition)
					end
				end)
			end
		end

	end

	if options.KeySystemConfig.KeySystem == true then
		GUI:KeySystem()
	end
	
	return GUI
end
return Library
