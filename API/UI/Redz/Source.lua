local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local Player = Players.LocalPlayer
local PlayerMouse = Player:GetMouse()
 
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")
 
local redzlib = {
	Themes = {
		Darker = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(32.5, 32.5, 32.5)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))
			}),
			["Color Hub 2"] = Color3.fromRGB(30, 30, 30),
			["Color Stroke"] = Color3.fromRGB(40, 40, 40),
			["Color Theme"] = Color3.fromRGB(88, 101, 242),
			["Color Text"] = Color3.fromRGB(243, 243, 243),
			["Color Dark Text"] = Color3.fromRGB(180, 180, 180)
		},
		Dark = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(40, 40, 40)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(47.5, 47.5, 47.5)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(40, 40, 40))
			}),
			["Color Hub 2"] = Color3.fromRGB(45, 45, 45),
			["Color Stroke"] = Color3.fromRGB(65, 65, 65),
			["Color Theme"] = Color3.fromRGB(65, 150, 255),
			["Color Text"] = Color3.fromRGB(245, 245, 245),
			["Color Dark Text"] = Color3.fromRGB(190, 190, 190)
		},
		Purple = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27.5, 25, 30)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(32.5, 32.5, 32.5)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(27.5, 25, 30))
			}),
			["Color Hub 2"] = Color3.fromRGB(30, 30, 30),
			["Color Stroke"] = Color3.fromRGB(40, 40, 40),
			["Color Theme"] = Color3.fromRGB(150, 0, 255),
			["Color Text"] = Color3.fromRGB(240, 240, 240),
			["Color Dark Text"] = Color3.fromRGB(180, 180, 180)
		}
	},
	Info = { Version = "1.2.0" },
	Save = {
		UISize = {550, 380},
		TabSize = 160,
		Theme = "Darker"
	},
	Settings = {},
	Connection = {},
	Instances = {},
	Elements = {},
	Options = {},
	Flags = {},
	Tabs = {},
	Icons = (function()
		return {
			["accessibility"] = "rbxassetid://10709751939",
			["activity"] = "rbxassetid://10709752035",
			["airvent"] = "rbxassetid://10709752131",
			["airplay"] = "rbxassetid://10709752254",
			["alarmcheck"] = "rbxassetid://10709752405",
			["alarmclock"] = "rbxassetid://10709752630",
			["alarmclockoff"] = "rbxassetid://10709752508",
			["alarmminus"] = "rbxassetid://10709752732",
			["alarmplus"] = "rbxassetid://10709752825",
			["album"] = "rbxassetid://10709752906",
			["alertcircle"] = "rbxassetid://10709752996",
			["alertoctagon"] = "rbxassetid://10709753064",
			["alerttriangle"] = "rbxassetid://10709753149",
			["aligncenter"] = "rbxassetid://10709753570",
			["aligncenterhorizontal"] = "rbxassetid://10709753272",
			["aligncentervertical"] = "rbxassetid://10709753421",
			["alignendhorizontal"] = "rbxassetid://10709753692",
			["alignendvertical"] = "rbxassetid://10709753808",
			["alignhorizontaldistributecenter"] = "rbxassetid://10747779791",
			["alignhorizontaldistributeend"] = "rbxassetid://10747784534",
			["alignhorizontaldistributestart"] = "rbxassetid://10709754118",
			["alignhorizontaljustifycenter"] = "rbxassetid://10709754204",
			["alignhorizontaljustifyend"] = "rbxassetid://10709754317",
			["alignhorizontaljustifystart"] = "rbxassetid://10709754436",
			["alignhorizontalspacearound"] = "rbxassetid://10709754590",
			["alignhorizontalspacebetween"] = "rbxassetid://10709754749",
			["alignjustify"] = "rbxassetid://10709759610",
			["alignleft"] = "rbxassetid://10709759764",
			["alignright"] = "rbxassetid://10709759895",
			["alignstarthorizontal"] = "rbxassetid://10709760051",
			["alignstartvertical"] = "rbxassetid://10709760244",
			["alignverticaldistributecenter"] = "rbxassetid://10709760351",
			["alignverticaldistributeend"] = "rbxassetid://10709760434",
			["alignverticaldistributestart"] = "rbxassetid://10709760612",
			["alignverticaljustifycenter"] = "rbxassetid://10709760814",
			["alignverticaljustifyend"] = "rbxassetid://10709761003",
			["alignverticaljustifystart"] = "rbxassetid://10709761176",
			["alignverticalspacearound"] = "rbxassetid://10709761324",
			["alignverticalspacebetween"] = "rbxassetid://10709761434",
			["anchor"] = "rbxassetid://10709761530",
			["angry"] = "rbxassetid://10709761629",
			["annoyed"] = "rbxassetid://10709761722",
			["aperture"] = "rbxassetid://10709761813",
			["apple"] = "rbxassetid://10709761889",
			["archive"] = "rbxassetid://10709762233",
			["archiverestore"] = "rbxassetid://10709762058",
			["armchair"] = "rbxassetid://10709762327",
			["arrowbigdown"] = "rbxassetid://10747796644",
			["arrowbigleft"] = "rbxassetid://10709762574",
			["arrowbigright"] = "rbxassetid://10709762727",
			["arrowbigup"] = "rbxassetid://10709762879",
			["arrowdown"] = "rbxassetid://10709767827",
			["arrowdowncircle"] = "rbxassetid://10709763034",
			["arrowdownleft"] = "rbxassetid://10709767656",
			["arrowdownright"] = "rbxassetid://10709767750",
			["arrowleft"] = "rbxassetid://10709768114",
			["arrowleftcircle"] = "rbxassetid://10709767936",
			["arrowleftright"] = "rbxassetid://10709768019",
			["arrowright"] = "rbxassetid://10709768347",
			["arrowrightcircle"] = "rbxassetid://10709768226",
			["arrowup"] = "rbxassetid://10709768939",
			["arrowupcircle"] = "rbxassetid://10709768432",
			["arrowupdown"] = "rbxassetid://10709768538",
			["arrowupleft"] = "rbxassetid://10709768661",
			["arrowupright"] = "rbxassetid://10709768787",
			["asterisk"] = "rbxassetid://10709769095",
			["atsign"] = "rbxassetid://10709769286",
			["award"] = "rbxassetid://10709769406",
			["axe"] = "rbxassetid://10709769508",
			["axis3d"] = "rbxassetid://10709769598",
			["baby"] = "rbxassetid://10709769732",
			["backpack"] = "rbxassetid://10709769841",
			["baggageclaim"] = "rbxassetid://10709769935",
			["banana"] = "rbxassetid://10709770005",
			["banknote"] = "rbxassetid://10709770178",
			["barchart"] = "rbxassetid://10709773755",
			["barchart2"] = "rbxassetid://10709770317",
			["barchart3"] = "rbxassetid://10709770431",
			["barchart4"] = "rbxassetid://10709770560",
			["barcharthorizontal"] = "rbxassetid://10709773669",
			["barcode"] = "rbxassetid://10747360675",
			["baseline"] = "rbxassetid://10709773863",
			["bath"] = "rbxassetid://10709773963",
			["battery"] = "rbxassetid://10709774640",
			["batterycharging"] = "rbxassetid://10709774068",
			["batteryfull"] = "rbxassetid://10709774206",
			["batterylow"] = "rbxassetid://10709774370",
			["batterymedium"] = "rbxassetid://10709774513",
			["beaker"] = "rbxassetid://10709774756",
			["bed"] = "rbxassetid://10709775036",
			["beddouble"] = "rbxassetid://10709774864",
			["bedsingle"] = "rbxassetid://10709774968",
			["beer"] = "rbxassetid://10709775167",
			["bell"] = "rbxassetid://10709775704",
			["bellminus"] = "rbxassetid://10709775241",
			["belloff"] = "rbxassetid://10709775320",
			["bellplus"] = "rbxassetid://10709775448",
			["bellring"] = "rbxassetid://10709775560",
			["bike"] = "rbxassetid://10709775894",
			["binary"] = "rbxassetid://10709776050",
			["bitcoin"] = "rbxassetid://10709776126",
			["bluetooth"] = "rbxassetid://10709776655",
			["bluetoothconnected"] = "rbxassetid://10709776240",
			["bluetoothoff"] = "rbxassetid://10709776344",
			["bluetoothsearching"] = "rbxassetid://10709776501",
			["bold"] = "rbxassetid://10747813908",
			["bomb"] = "rbxassetid://10709781460",
			["bone"] = "rbxassetid://10709781605",
			["book"] = "rbxassetid://10709781824",
			["bookopen"] = "rbxassetid://10709781717",
			["bookmark"] = "rbxassetid://10709782154",
			["bookmarkminus"] = "rbxassetid://10709781919",
			["bookmarkplus"] = "rbxassetid://10709782044",
			["bot"] = "rbxassetid://10709782230",
			["box"] = "rbxassetid://10709782497",
			["boxselect"] = "rbxassetid://10709782342",
			["boxes"] = "rbxassetid://10709782582",
			["briefcase"] = "rbxassetid://10709782662",
			["brush"] = "rbxassetid://10709782758",
			["bug"] = "rbxassetid://10709782845",
			["building"] = "rbxassetid://10709783051",
			["building2"] = "rbxassetid://10709782939",
			["bus"] = "rbxassetid://10709783137",
			["cake"] = "rbxassetid://10709783217",
			["calculator"] = "rbxassetid://10709783311",
			["calendar"] = "rbxassetid://10709789505",
			["calendarcheck"] = "rbxassetid://10709783474",
			["calendarcheck2"] = "rbxassetid://10709783392",
			["calendarclock"] = "rbxassetid://10709783577",
			["calendardays"] = "rbxassetid://10709783673",
			["calendarheart"] = "rbxassetid://10709783835",
			["calendarminus"] = "rbxassetid://10709783959",
			["calendaroff"] = "rbxassetid://10709788784",
			["calendarplus"] = "rbxassetid://10709788937",
			["calendarrange"] = "rbxassetid://10709789053",
			["calendarsearch"] = "rbxassetid://10709789200",
			["calendarx"] = "rbxassetid://10709789407",
			["calendarx2"] = "rbxassetid://10709789329",
			["camera"] = "rbxassetid://10709789686",
			["cameraoff"] = "rbxassetid://10747822677",
			["car"] = "rbxassetid://10709789810",
			["carrot"] = "rbxassetid://10709789960",
			["cast"] = "rbxassetid://10709790097",
			["charge"] = "rbxassetid://10709790202",
			["check"] = "rbxassetid://10709790644",
			["checkcircle"] = "rbxassetid://10709790387",
			["checkcircle2"] = "rbxassetid://10709790298",
			["checksquare"] = "rbxassetid://10709790537",
			["chefhat"] = "rbxassetid://10709790757",
			["cherry"] = "rbxassetid://10709790875",
			["chevrondown"] = "rbxassetid://10709790948",
			["chevronfirst"] = "rbxassetid://10709791015",
			["chevronlast"] = "rbxassetid://10709791130",
			["chevronleft"] = "rbxassetid://10709791281",
			["chevronright"] = "rbxassetid://10709791437",
			["chevronup"] = "rbxassetid://10709791523",
			["chevronsdown"] = "rbxassetid://10709796864",
			["chevronsdownup"] = "rbxassetid://10709791632",
			["chevronsleft"] = "rbxassetid://10709797151",
			["chevronsleftright"] = "rbxassetid://10709797006",
			["chevronsright"] = "rbxassetid://10709797382",
			["chevronsrightleft"] = "rbxassetid://10709797274",
			["chevronsup"] = "rbxassetid://10709797622",
			["chevronsupdown"] = "rbxassetid://10709797508",
			["chrome"] = "rbxassetid://10709797725",
			["circle"] = "rbxassetid://10709798174",
			["circledot"] = "rbxassetid://10709797837",
			["circleellipsis"] = "rbxassetid://10709797985",
			["circleslashed"] = "rbxassetid://10709798100",
			["citrus"] = "rbxassetid://10709798276",
			["clapperboard"] = "rbxassetid://10709798350",
			["clipboard"] = "rbxassetid://10709799288",
			["clipboardcheck"] = "rbxassetid://10709798443",
			["clipboardcopy"] = "rbxassetid://10709798574",
			["clipboardedit"] = "rbxassetid://10709798682",
			["clipboardlist"] = "rbxassetid://10709798792",
			["clipboardsignature"] = "rbxassetid://10709798890",
			["clipboardtype"] = "rbxassetid://10709798999",
			["clipboardx"] = "rbxassetid://10709799124",
			["clock"] = "rbxassetid://10709805144",
			["cloud"] = "rbxassetid://10709806740",
			["code"] = "rbxassetid://10709810463",
			["code2"] = "rbxassetid://10709807111",
			["coffee"] = "rbxassetid://10709810814",
			["cog"] = "rbxassetid://10709810948",
			["coins"] = "rbxassetid://10709811110",
			["command"] = "rbxassetid://10709811365",
			["compass"] = "rbxassetid://10709811445",
			["contact"] = "rbxassetid://10709811834",
			["copy"] = "rbxassetid://10709812159",
			["cpu"] = "rbxassetid://10709813383",
			["crown"] = "rbxassetid://10709818626",
			["database"] = "rbxassetid://10709818996",
			["delete"] = "rbxassetid://10709819059",
			["diamond"] = "rbxassetid://10709819149",
			["download"] = "rbxassetid://10723344270",
			["edit"] = "rbxassetid://10734883598",
			["edit2"] = "rbxassetid://10723344885",
			["edit3"] = "rbxassetid://10723345088",
			["eye"] = "rbxassetid://10723346959",
			["eyeoff"] = "rbxassetid://10723346871",
			["file"] = "rbxassetid://10723374641",
			["filter"] = "rbxassetid://10723375128",
			["flag"] = "rbxassetid://10723375890",
			["flame"] = "rbxassetid://10723376114",
			["folder"] = "rbxassetid://10723387563",
			["folderopen"] = "rbxassetid://10723386277",
			["gamepad"] = "rbxassetid://10723395457",
			["gamepad2"] = "rbxassetid://10723395215",
			["ghost"] = "rbxassetid://10723396107",
			["gift"] = "rbxassetid://10723396402",
			["globe"] = "rbxassetid://10723404337",
			["grid"] = "rbxassetid://10723404936",
			["hammer"] = "rbxassetid://10723405360",
			["heart"] = "rbxassetid://10723406885",
			["home"] = "rbxassetid://10723407389",
			["image"] = "rbxassetid://10723415040",
			["info"] = "rbxassetid://10723415903",
			["key"] = "rbxassetid://10723416652",
			["keyboard"] = "rbxassetid://10723416765",
			["layout"] = "rbxassetid://10723425376",
			["list"] = "rbxassetid://10723433811",
			["lock"] = "rbxassetid://10723434711",
			["login"] = "rbxassetid://10723434830",
			["logout"] = "rbxassetid://10723434906",
			["magnet"] = "rbxassetid://10723435069",
			["mail"] = "rbxassetid://10734885430",
			["map"] = "rbxassetid://10734886202",
			["maximize"] = "rbxassetid://10734886735",
			["menu"] = "rbxassetid://10734887784",
			["messagecircle"] = "rbxassetid://10734888000",
			["messagesquare"] = "rbxassetid://10734888228",
			["mic"] = "rbxassetid://10734888864",
			["minimize"] = "rbxassetid://10734895698",
			["minus"] = "rbxassetid://10734896206",
			["monitor"] = "rbxassetid://10734896881",
			["moon"] = "rbxassetid://10734897102",
			["music"] = "rbxassetid://10734905958",
			["network"] = "rbxassetid://10734906975",
			["package"] = "rbxassetid://10734909540",
			["palette"] = "rbxassetid://10734910430",
			["phone"] = "rbxassetid://10734921524",
			["pin"] = "rbxassetid://10734922324",
			["play"] = "rbxassetid://10734923549",
			["plus"] = "rbxassetid://10734924532",
			["power"] = "rbxassetid://10734930466",
			["rocket"] = "rbxassetid://10734934585",
			["save"] = "rbxassetid://10734941499",
			["search"] = "rbxassetid://10734943674",
			["send"] = "rbxassetid://10734943902",
			["settings"] = "rbxassetid://10734950309",
			["settings2"] = "rbxassetid://10734950020",
			["share"] = "rbxassetid://10734950813",
			["shield"] = "rbxassetid://10734951847",
			["shieldcheck"] = "rbxassetid://10734951367",
			["shoppingcart"] = "rbxassetid://10734952479",
			["shuffle"] = "rbxassetid://10734953451",
			["signal"] = "rbxassetid://10734961133",
			["skull"] = "rbxassetid://10734962068",
			["sliders"] = "rbxassetid://10734963400",
			["smartphone"] = "rbxassetid://10734963940",
			["smile"] = "rbxassetid://10734964441",
			["star"] = "rbxassetid://10734966248",
			["sun"] = "rbxassetid://10734974297",
			["swords"] = "rbxassetid://10734975692",
			["table"] = "rbxassetid://10734976230",
			["target"] = "rbxassetid://10734977012",
			["terminal"] = "rbxassetid://10734982144",
			["thumbsup"] = "rbxassetid://10734983629",
			["timer"] = "rbxassetid://10734984606",
			["toggleleft"] = "rbxassetid://10734984834",
			["toggleright"] = "rbxassetid://10734985040",
			["trash"] = "rbxassetid://10747362393",
			["trash2"] = "rbxassetid://10747362241",
			["trendingup"] = "rbxassetid://10747363465",
			["trophy"] = "rbxassetid://10747363809",
			["truck"] = "rbxassetid://10747364031",
			["tv"] = "rbxassetid://10747364593",
			["unlock"] = "rbxassetid://10747366027",
			["upload"] = "rbxassetid://10747366434",
			["user"] = "rbxassetid://10747373176",
			["users"] = "rbxassetid://10747373426",
			["video"] = "rbxassetid://10747374938",
			["volume"] = "rbxassetid://10747376008",
			["wallet"] = "rbxassetid://10747376205",
			["wifi"] = "rbxassetid://10747382504",
			["wifioff"] = "rbxassetid://10747382268",
			["wrench"] = "rbxassetid://10747383470",
			["x"] = "rbxassetid://10747384394",
			["xcircle"] = "rbxassetid://10747383819",
			["zoomin"] = "rbxassetid://10747384552",
			["zoomout"] = "rbxassetid://10747384679"
		}
	end)()
}
 
local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 450
 
local Settings = redzlib.Settings
local Flags = redzlib.Flags
 
local SetProps, SetChildren, InsertTheme, Create do
	InsertTheme = function(Instance, Type)
		table.insert(redzlib.Instances, {
			Instance = Instance,
			Type = Type
		})
		return Instance
	end
 
	SetChildren = function(Instance, Children)
		if Children then
			for _, Child in ipairs(Children) do
				Child.Parent = Instance
			end
		end
		return Instance
	end
 
	SetProps = function(Instance, Props)
		if Props then
			for prop, value in pairs(Props) do
				Instance[prop] = value
			end
		end
		return Instance
	end
 
	Create = function(...)
		local args = {...}
		if type(args) ~= "table" then return end
		local new = Instance.new(args[1])
 
		if type(args[2]) == "table" then
			SetProps(new, args[2])
			SetChildren(new, args[3])
		elseif typeof(args[2]) == "Instance" then
			new.Parent = args[2]
			SetProps(new, args[3])
			SetChildren(new, args[4])
		end
		return new
	end
 
	local function Save(file)
		if readfile and isfile and isfile(file) then
			local ok, decode = pcall(function()
				return HttpService:JSONDecode(readfile(file))
			end)
			if ok and type(decode) == "table" then
				if rawget(decode, "UISize") then redzlib.Save["UISize"] = decode["UISize"] end
				if rawget(decode, "TabSize") then redzlib.Save["TabSize"] = decode["TabSize"] end
				if rawget(decode, "Theme") and VerifyTheme(decode["Theme"]) then
					redzlib.Save["Theme"] = decode["Theme"]
				end
			end
		end
	end
 
	pcall(Save, "redz library V5.json")
end
 
local Funcs = {} do
	function Funcs:InsertCallback(tab, func)
		if type(func) == "function" then
			table.insert(tab, func)
		end
		return func
	end
 
	function Funcs:FireCallback(tab, ...)
		for _, v in ipairs(tab) do
			if type(v) == "function" then
				task.spawn(v, ...)
			end
		end
	end
 
	function Funcs:ToggleVisible(Obj, Bool)
		if Bool ~= nil then
			Obj.Visible = Bool
		else
			Obj.Visible = not Obj.Visible
		end
	end
 
	function Funcs:GetConnectionFunctions(ConnectedFuncs, func)
		local Connected = { Function = func, Connected = true }
 
		function Connected:Disconnect()
			if self.Connected then
				local idx = table.find(ConnectedFuncs, self.Function)
				if idx then table.remove(ConnectedFuncs, idx) end
				self.Connected = false
			end
		end
 
		function Connected:Fire(...)
			if self.Connected then
				task.spawn(self.Function, ...)
			end
		end
 
		return Connected
	end
 
	function Funcs:GetCallback(Configs, index)
		local func = Configs[index] or Configs.Callback or function() end
		if type(func) == "table" then
			return { function(Value) func[1][func[2]] = Value end }
		end
		return { func }
	end
end
 
local Connections, Connection = {}, redzlib.Connection do
	local function NewConnectionList(List)
		if type(List) ~= "table" then return end
 
		for _, CoName in ipairs(List) do
			local ConnectedFuncs, Connect = {}, {}
			Connection[CoName] = Connect
			Connections[CoName] = ConnectedFuncs
			Connect.Name = CoName
 
			function Connect:Connect(func)
				if type(func) == "function" then
					table.insert(ConnectedFuncs, func)
					return Funcs:GetConnectionFunctions(ConnectedFuncs, func)
				end
			end
 
			function Connect:Once(func)
				if type(func) == "function" then
					local Connected
					local _NFunc; _NFunc = function(...)
						task.spawn(func, ...)
						Connected:Disconnect()
					end
					Connected = Funcs:GetConnectionFunctions(ConnectedFuncs, _NFunc)
					return Connected
				end
			end
		end
	end
 
	function Connection:FireConnection(CoName, ...)
		local Conn = type(CoName) == "string" and Connections[CoName] or Connections[CoName.Name]
		if not Conn then return end
		for _, Func in pairs(Conn) do
			task.spawn(Func, ...)
		end
	end
 
	NewConnectionList({"FlagsChanged", "ThemeChanged", "FileSaved", "ThemeChanging", "OptionAdded"})
end
 
local GetFlag, SetFlag, CheckFlag do
	CheckFlag = function(Name)
		return type(Name) == "string" and Flags[Name] ~= nil
	end
 
	GetFlag = function(Name)
		return type(Name) == "string" and Flags[Name]
	end
 
	SetFlag = function(Flag, Value)
		if Flag and (Value ~= Flags[Flag] or type(Value) == "table") then
			Flags[Flag] = Value
			Connection:FireConnection("FlagsChanged", Flag, Value)
		end
	end
 
	local db
	Connection.FlagsChanged:Connect(function(Flag, Value)
		local ScriptFile = Settings.ScriptFile
		if not db and ScriptFile and writefile then
			db = true
			task.wait(0.1)
			db = false
 
			local ok, Encoded = pcall(function()
				return HttpService:JSONEncode(Flags)
			end)
 
			if ok then
				local ok2 = pcall(writefile, ScriptFile, Encoded)
				if ok2 then
					Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, Encoded)
				end
			end
		end
	end)
end
 
local ScreenGui = Create("ScreenGui", CoreGui, {
	Name = "redz-library-v5",
}, {
	Create("UIScale", {
		Scale = UIScale,
		Name = "Scale"
	})
})
 
local ScreenFind = CoreGui:FindFirstChild(ScreenGui.Name)
if ScreenFind and ScreenFind ~= ScreenGui then
	ScreenFind:Destroy()
end
 
local function GetStr(val)
	if type(val) == "function" then return val() end
	return val
end
 
local function ConnectSave(Instance, func)
	Instance.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then
			while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
				task.wait()
			end
		end
		func()
	end)
end
 
local function CreateTween(Configs)
	local Inst     = Configs[1] or Configs.Instance
	local Prop     = Configs[2] or Configs.Prop
	local NewVal   = Configs[3] or Configs.NewVal
	local Time     = Configs[4] or Configs.Time or 0.5
	local TweenWait = Configs[5] or Configs.wait or false
	local Info = TweenInfo.new(Time, Enum.EasingStyle.Quint)
 
	local Tween = TweenService:Create(Inst, Info, {[Prop] = NewVal})
	Tween:Play()
	if TweenWait then Tween.Completed:Wait() end
	return Tween
end
 
local function MakeDrag(Instance)
	task.spawn(function()
		SetProps(Instance, {
			Active = true,
			AutoButtonColor = false
		})
 
		local DragStart, StartPos, InputOn
 
		local function Update(Input)
			local delta = Input.Position - DragStart
			local Position = UDim2.new(
				StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale,
				StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale
			)
			CreateTween({Instance, "Position", Position, 0.35})
		end
 
		Instance.MouseButton1Down:Connect(function()
			InputOn = true
		end)
 
		Instance.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch then
				StartPos = Instance.Position
				DragStart = Input.Position
 
				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					RunService.Heartbeat:Wait()
					if InputOn then Update(Input) end
				end
				InputOn = false
			end
		end)
	end)
	return Instance
end
 
local function VerifyTheme(Theme)
	for name, _ in pairs(redzlib.Themes) do
		if name == Theme then return true end
	end
end
 
local function SaveJson(FileName, save)
	if writefile then
		local json = HttpService:JSONEncode(save)
		writefile(FileName, json)
	end
end
 
local Theme = redzlib.Themes[redzlib.Save.Theme]
 
local function AddEle(Name, Func)
	redzlib.Elements[Name] = Func
end
 
local function Make(Ele, Instance, props, ...)
	return redzlib.Elements[Ele](Instance, props, ...)
end
 
AddEle("Corner", function(parent, CornerRadius)
	return SetProps(Create("UICorner", parent, {
		CornerRadius = CornerRadius or UDim.new(0, 7)
	}), {})
end)
 
AddEle("Stroke", function(parent, props, ...)
	local args = {...}
	return InsertTheme(SetProps(Create("UIStroke", parent, {
		Color = args[1] or Theme["Color Stroke"],
		Thickness = args[2] or 1,
		ApplyStrokeMode = "Border"
	}), props or {}), "Stroke")
end)
 
AddEle("Button", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("TextButton", parent, {
		Text = "",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Theme["Color Hub 2"],
		AutoButtonColor = false
	}), props), "Frame")
 
	New.MouseEnter:Connect(function()
		New.BackgroundTransparency = 0.4
	end)
	New.MouseLeave:Connect(function()
		New.BackgroundTransparency = 0
	end)
	if args[1] then
		New.Activated:Connect(args[1])
	end
	return New
end)
 
AddEle("Gradient", function(parent, props, ...)
	return InsertTheme(SetProps(Create("UIGradient", parent, {
		Color = Theme["Color Hub 1"]
	}), props or {}), "Gradient")
end)
 
local function ButtonFrame(Instance, Title, Description, HolderSize)
	local TitleL = InsertTheme(Create("TextLabel", {
		Font = Enum.Font.GothamMedium,
		TextColor3 = Theme["Color Text"],
		Size = UDim2.new(1, -20),
		AutomaticSize = "Y",
		Position = UDim2.new(0, 0, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		TextTruncate = "AtEnd",
		TextSize = 11,
		TextXAlignment = "Left",
		Text = "",
		RichText = true
	}), "Text")
 
	local DescL = InsertTheme(Create("TextLabel", {
		Font = Enum.Font.Gotham,
		TextColor3 = Theme["Color Dark Text"],
		Size = UDim2.new(1, -20),
		AutomaticSize = "Y",
		Position = UDim2.new(0, 12, 0, 15),
		BackgroundTransparency = 1,
		TextWrapped = true,
		TextSize = 9,
		TextXAlignment = "Left",
		Text = "",
		RichText = true
	}), "DarkText")
 
	local Frame = Make("Button", Instance, {
		Size = UDim2.new(1, 0, 0, 25),
		AutomaticSize = "Y",
		Name = "Option"
	})
	Make("Corner", Frame, UDim.new(0, 6))
 
	local LabelHolder = Create("Frame", Frame, {
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Size = HolderSize,
		Position = UDim2.new(0, 10, 0),
		AnchorPoint = Vector2.new(0, 0)
	}, {
		Create("UIListLayout", {
			SortOrder = "LayoutOrder",
			VerticalAlignment = "Center",
			Padding = UDim.new(0, 2)
		}),
		Create("UIPadding", {
			PaddingBottom = UDim.new(0, 5),
			PaddingTop = UDim.new(0, 5)
		}),
		TitleL,
		DescL,
	})
 
	local Label = {}
	function Label:SetTitle(NewTitle)
		if type(NewTitle) == "string" and NewTitle:gsub(" ", ""):len() > 0 then
			TitleL.Text = NewTitle
		end
	end
	function Label:SetDesc(NewDesc)
		if type(NewDesc) == "string" and NewDesc:gsub(" ", ""):len() > 0 then
			DescL.Visible = true
			DescL.Text = NewDesc
			LabelHolder.Position = UDim2.new(0, 10, 0)
			LabelHolder.AnchorPoint = Vector2.new(0, 0)
		else
			DescL.Visible = false
			DescL.Text = ""
			LabelHolder.Position = UDim2.new(0, 10, 0.5)
			LabelHolder.AnchorPoint = Vector2.new(0, 0.5)
		end
	end
 
	Label:SetTitle(Title)
	Label:SetDesc(Description)
	return Frame, Label
end
 
local function GetColor(Instance)
	if Instance:IsA("Frame") then return "BackgroundColor3"
	elseif Instance:IsA("ImageLabel") then return "ImageColor3"
	elseif Instance:IsA("TextLabel") then return "TextColor3"
	elseif Instance:IsA("ScrollingFrame") then return "ScrollBarImageColor3"
	elseif Instance:IsA("UIStroke") then return "Color"
	end
	return ""
end
 
function redzlib:GetIcon(index)
	if type(index) ~= "string" or index:find("rbxassetid://") or #index == 0 then
		return index
	end
 
	local firstMatch = nil
	index = string.lower(index):gsub("lucide", ""):gsub("-", "")
 
	if self.Icons[index] then return self.Icons[index] end
 
	for Name, Icon in pairs(self.Icons) do
		if Name == index then
			return Icon
		elseif not firstMatch and Name:find(index, 1, true) then
			firstMatch = Icon
		end
	end
 
	return firstMatch or index
end
 
function redzlib:SetTheme(NewTheme)
	if not VerifyTheme(NewTheme) then return end
 
	redzlib.Save.Theme = NewTheme
	SaveJson("redz library V5.json", redzlib.Save)
	Theme = redzlib.Themes[NewTheme]
 
	Connection:FireConnection("ThemeChanged", NewTheme)
	for _, Val in ipairs(redzlib.Instances) do
		if Val.Type == "Gradient" then
			Val.Instance.Color = Theme["Color Hub 1"]
		elseif Val.Type == "Frame" then
			Val.Instance.BackgroundColor3 = Theme["Color Hub 2"]
		elseif Val.Type == "Stroke" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Stroke"]
		elseif Val.Type == "Theme" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
		elseif Val.Type == "Text" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Text"]
		elseif Val.Type == "DarkText" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Dark Text"]
		elseif Val.Type == "ScrollBar" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
		elseif Val.Type == "SectionLine" then
			Val.Instance.BackgroundColor3 = Theme["Color Stroke"]
		end
	end
end
 
function redzlib:SetScale(NewScale)
	NewScale = ViewportSize.Y / math.clamp(NewScale, 300, 2000)
	UIScale = NewScale
	ScreenGui.Scale.Scale = NewScale
end
 
function redzlib:MakeWindow(Configs)
	local WTitle = Configs[1] or Configs.Name or Configs.Title or "redz Library V5"
	local WMiniText = Configs[2] or Configs.SubTitle or "by : redz9999"
 
	Settings.ScriptFile = Configs[3] or Configs.SaveFolder or false
 
	local function LoadFile()
		local File = Settings.ScriptFile
		if type(File) ~= "string" then return end
		if not readfile or not isfile then return end
		local s, r = pcall(isfile, File)
		if s and r then
			local s2, _Flags = pcall(readfile, File)
			if s2 and type(_Flags) == "string" then
				local s3, r3 = pcall(function() return HttpService:JSONDecode(_Flags) end)
				Flags = s3 and r3 or {}
			end
		end
	end
	LoadFile()
 
	local UISizeX, UISizeY = unpack(redzlib.Save.UISize)
	local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
		Size = UDim2.fromOffset(UISizeX, UISizeY),
		Position = UDim2.new(0.5, -UISizeX/2, 0.5, -UISizeY/2),
		BackgroundTransparency = 0.03,
		Name = "Hub"
	}), "Main")
	Make("Gradient", MainFrame, { Rotation = 45 })
	MakeDrag(MainFrame)
 
	local MainCorner = Make("Corner", MainFrame)
 
	local Components = Create("Folder", MainFrame, { Name = "Components" })
	local DropdownHolder = Create("Folder", ScreenGui, { Name = "Dropdown" })
 
	local TopBar = Create("Frame", Components, {
		Size = UDim2.new(1, 0, 0, 28),
		BackgroundTransparency = 1,
		Name = "Top Bar"
	})
 
	local Title = InsertTheme(Create("TextLabel", TopBar, {
		Position = UDim2.new(0, 15, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		AutomaticSize = "XY",
		Text = WTitle,
		TextXAlignment = "Left",
		TextSize = 13,
		TextColor3 = Theme["Color Text"],
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		Name = "Title"
	}, {
		InsertTheme(Create("TextLabel", {
			Size = UDim2.fromScale(0, 1),
			AutomaticSize = "X",
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(1, 5, 0.9),
			Text = WMiniText,
			TextColor3 = Theme["Color Dark Text"],
			BackgroundTransparency = 1,
			TextXAlignment = "Left",
			TextYAlignment = "Bottom",
			TextSize = 8,
			Font = Enum.Font.Gotham,
			Name = "SubTitle"
		}), "DarkText")
	}), "Text")
 
	local MainScroll = InsertTheme(Create("ScrollingFrame", Components, {
		Size = UDim2.new(0, redzlib.Save.TabSize, 1, -TopBar.Size.Y.Offset),
		ScrollBarImageColor3 = Theme["Color Theme"],
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		ScrollBarThickness = 1.5,
		BackgroundTransparency = 1,
		ScrollBarImageTransparency = 0.2,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = "Y",
		ScrollingDirection = "Y",
		BorderSizePixel = 0,
		Name = "Tab Scroll"
	}, {
		Create("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		Create("UIListLayout", { Padding = UDim.new(0, 5) })
	}), "ScrollBar")
 
	local Containers = Create("Frame", Components, {
		Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name = "Containers"
	})
 
	local ControlSize1, ControlSize2 = MakeDrag(Create("ImageButton", MainFrame, {
		Size = UDim2.new(0, 35, 0, 35),
		Position = MainFrame.Size,
		Active = true,
		AnchorPoint = Vector2.new(0.8, 0.8),
		BackgroundTransparency = 1,
		Name = "Control Hub Size"
	})), MakeDrag(Create("ImageButton", MainFrame, {
		Size = UDim2.new(0, 20, 1, -30),
		Position = UDim2.new(0, MainScroll.Size.X.Offset, 1, 0),
		AnchorPoint = Vector2.new(0.5, 1),
		Active = true,
		BackgroundTransparency = 1,
		Name = "Control Tab Size"
	}))
 
	local function ControlSize()
		local Pos1 = ControlSize1.Position
		local Pos2 = ControlSize2.Position
		ControlSize1.Position = UDim2.fromOffset(
			math.clamp(Pos1.X.Offset, 430, 1000),
			math.clamp(Pos1.Y.Offset, 200, 500)
		)
		ControlSize2.Position = UDim2.new(0, math.clamp(Pos2.X.Offset, 135, 250), 1, 0)
 
		MainScroll.Size = UDim2.new(0, ControlSize2.Position.X.Offset, 1, -TopBar.Size.Y.Offset)
		Containers.Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset)
		MainFrame.Size = ControlSize1.Position
	end
 
	ControlSize1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
	ControlSize2:GetPropertyChangedSignal("Position"):Connect(ControlSize)
 
	ConnectSave(ControlSize1, function()
		if not Minimized then
			redzlib.Save.UISize = {MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset}
			SaveJson("redz library V5.json", redzlib.Save)
		end
	end)
 
	ConnectSave(ControlSize2, function()
		redzlib.Save.TabSize = MainScroll.Size.X.Offset
		SaveJson("redz library V5.json", redzlib.Save)
	end)
 
	-- SEARCH BAR
	local SearchOpen = false
 
	local SearchBar = InsertTheme(Create("Frame", TopBar, {
		Size = UDim2.new(0, 0, 0, 20),
		Position = UDim2.new(1, -58, 0.5),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Theme["Color Hub 2"],
		ClipsDescendants = true,
		Visible = false,
		ZIndex = 5,
		Name = "SearchBar"
	}), "Frame")
	Make("Corner", SearchBar, UDim.new(0, 5))
	Make("Stroke", SearchBar)
 
	local SearchInput = InsertTheme(Create("TextBox", SearchBar, {
		Size = UDim2.new(1, -24, 1, 0),
		Position = UDim2.new(0, 8, 0, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = 9,
		TextColor3 = Theme["Color Text"],
		PlaceholderText = "Buscar elemento...",
		Text = "",
		ClearTextOnFocus = false,
		ZIndex = 6,
		Name = "Input"
	}), "Text")
 
	local SearchClear = Create("ImageButton", SearchBar, {
		Size = UDim2.new(0, 13, 0, 13),
		Position = UDim2.new(1, -5, 0.5),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://10747384394",
		ImageColor3 = Color3.fromRGB(180, 180, 180),
		AutoButtonColor = false,
		ZIndex = 7
	})
 
	local function RunSearch(query)
		query = query:lower()
		for _, TabData in pairs(redzlib.Tabs) do
			local cont = TabData.Cont
			if cont and cont.Parent then
				for _, child in pairs(cont:GetChildren()) do
					if child.Name == "Option" then
						if query == "" then
							child.Visible = true
						else
							local found = false
							for _, lbl in pairs(child:GetDescendants()) do
								if (lbl:IsA("TextLabel") or lbl:IsA("TextBox"))
								and lbl.Text:lower():find(query, 1, true) then
									found = true
									break
								end
							end
							child.Visible = found
						end
					end
				end
			end
		end
	end
 
	SearchInput:GetPropertyChangedSignal("Text"):Connect(function()
		RunSearch(SearchInput.Text)
	end)
 
	local function CloseSearch()
		SearchOpen = false
		SearchInput.Text = ""
		RunSearch("")
		CreateTween({SearchBar, "Size", UDim2.new(0, 0, 0, 20), 0.2, true})
		SearchBar.Visible = false
	end
 
	SearchClear.Activated:Connect(CloseSearch)
 
	local ButtonsFolder = Create("Folder", TopBar, { Name = "Buttons" })
 
	local SearchButton = Create("ImageButton", {
		Size = UDim2.new(0, 14, 0, 14),
		Position = UDim2.new(1, -57, 0.5),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://10734943674",
		AutoButtonColor = false,
		Name = "SearchBtn"
	})
 
	SearchButton.Activated:Connect(function()
		if SearchOpen then
			CloseSearch()
		else
			SearchOpen = true
			SearchBar.Visible = true
			CreateTween({SearchBar, "Size", UDim2.new(0, 140, 0, 20), 0.25, true})
			task.wait(0.26)
			SearchInput:CaptureFocus()
		end
	end)
 
	local CloseButton = Create("ImageButton", {
		Size = UDim2.new(0, 14, 0, 14),
		Position = UDim2.new(1, -10, 0.5),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://10747384394",
		AutoButtonColor = false,
		Name = "Close"
	})
 
	local MinimizeButton = SetProps(CloseButton:Clone(), {
		Position = UDim2.new(1, -35, 0.5),
		Image = "rbxassetid://10734896206",
		Name = "Minimize"
	})
 
	SetChildren(ButtonsFolder, { CloseButton, MinimizeButton, SearchButton })
 
	local Minimized, SaveSize, WaitClick
	local Window, FirstTab = {}, false
 
	function Window:CloseBtn()
		Window:Dialog({
			Title = "Close",
			Text = "You Want Close Ui?",
			Options = {
				{"Confirm", function() ScreenGui:Destroy() end},
				{"Cancel"}
			}
		})
	end
 
	function Window:MinimizeBtn()
		if WaitClick then return end
		WaitClick = true
 
		if Minimized then
			MinimizeButton.Image = "rbxassetid://10734896206"
			CreateTween({MainFrame, "Size", SaveSize, 0.25, true})
			ControlSize1.Visible = true
			ControlSize2.Visible = true
			Minimized = false
		else
			MinimizeButton.Image = "rbxassetid://10734924532"
			SaveSize = MainFrame.Size
			ControlSize1.Visible = false
			ControlSize2.Visible = false
			CreateTween({MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, 28), 0.25, true})
			Minimized = true
		end
 
		WaitClick = false
	end
 
	function Window:Minimize()
		MainFrame.Visible = not MainFrame.Visible
	end
 
	function Window:AddMinimizeButton(Configs)
		local Button = MakeDrag(Create("ImageButton", ScreenGui, {
			Size = UDim2.fromOffset(35, 35),
			Position = UDim2.fromScale(0.15, 0.15),
			BackgroundTransparency = 1,
			BackgroundColor3 = Theme["Color Hub 2"],
			AutoButtonColor = false
		}))
 
		local Stroke, Corner
		if Configs.Corner then
			Corner = Make("Corner", Button)
			SetProps(Corner, Configs.Corner)
		end
		if Configs.Stroke then
			Stroke = Make("Stroke", Button)
		end
 
		SetProps(Button, Configs.Button or {})
		Button.Activated:Connect(function() Window:Minimize() end)
 
		return { Stroke = Stroke, Corner = Corner, Button = Button }
	end
 
	function Window:Set(Val1, Val2)
		if type(Val1) == "string" and type(Val2) == "string" then
			Title.Text = Val1
			Title.SubTitle.Text = Val2
		elseif type(Val1) == "string" then
			Title.Text = Val1
		end
	end
 
	function Window:Dialog(Configs)
		if MainFrame:FindFirstChild("Dialog") then return end
		if Minimized then Window:MinimizeBtn() end
 
		local DTitle   = Configs[1] or Configs.Title or "Dialog"
		local DText    = Configs[2] or Configs.Text or "This is a Dialog"
		local DOptions = Configs[3] or Configs.Options or {}
 
		local Frame = Create("Frame", {
			Active = true,
			Size = UDim2.fromOffset(250 * 1.08, 150 * 1.08),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			InsertTheme(Create("TextLabel", {
				Font = Enum.Font.GothamBold,
				Size = UDim2.new(1, 0, 0, 20),
				Text = DTitle,
				TextXAlignment = "Left",
				TextColor3 = Theme["Color Text"],
				TextSize = 15,
				Position = UDim2.fromOffset(15, 5),
				BackgroundTransparency = 1
			}), "Text"),
			InsertTheme(Create("TextLabel", {
				Font = Enum.Font.GothamMedium,
				Size = UDim2.new(1, -25),
				AutomaticSize = "Y",
				Text = DText,
				TextXAlignment = "Left",
				TextColor3 = Theme["Color Dark Text"],
				TextSize = 12,
				Position = UDim2.fromOffset(15, 25),
				BackgroundTransparency = 1,
				TextWrapped = true
			}), "DarkText")
		})
		Make("Gradient", Frame, { Rotation = 270 })
		Make("Corner", Frame)
 
		local ButtonsHolder = Create("Frame", Frame, {
			Size = UDim2.fromScale(1, 0.35),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = 1
		}, {
			Create("UIListLayout", {
				Padding = UDim.new(0, 10),
				VerticalAlignment = "Center",
				FillDirection = "Horizontal",
				HorizontalAlignment = "Center"
			})
		})
 
		local Screen = InsertTheme(Create("Frame", MainFrame, {
			BackgroundTransparency = 0.6,
			Active = true,
			BackgroundColor3 = Theme["Color Stroke"],
			Size = UDim2.new(1, 0, 1, 0),
			Name = "Dialog"
		}), "Stroke")
 
		MainCorner:Clone().Parent = Screen
		Frame.Parent = Screen
		CreateTween({Frame, "Size", UDim2.fromOffset(250, 150), 0.2})
 
		local ButtonCount, Dialog = 1, {}
 
		function Dialog:Button(BConfigs)
			local Name = BConfigs[1] or BConfigs.Name or BConfigs.Title or ""
			local Callback = BConfigs[2] or BConfigs.Callback or function() end
 
			ButtonCount = ButtonCount + 1
			local Btn = Make("Button", ButtonsHolder)
			Make("Corner", Btn)
			SetProps(Btn, {
				Text = Name,
				Font = Enum.Font.GothamBold,
				TextColor3 = Theme["Color Text"],
				TextSize = 12
			})
 
			for _, B in pairs(ButtonsHolder:GetChildren()) do
				if B:IsA("TextButton") then
					B.Size = UDim2.new(1 / ButtonCount, -(((ButtonCount - 1) * 20) / ButtonCount), 0, 32)
				end
			end
			Btn.Activated:Connect(Dialog.Close)
			Btn.Activated:Connect(Callback)
		end
 
		function Dialog:Close()
			CreateTween({Frame, "Size", UDim2.fromOffset(250 * 1.08, 150 * 1.08), 0.2})
			CreateTween({Screen, "BackgroundTransparency", 1, 0.15})
			task.wait(0.15)
			Screen:Destroy()
		end
 
		for _, Btn in ipairs(DOptions) do
			Dialog:Button(Btn)
		end
 
		return Dialog
	end
 
	function Window:SelectTab(TabSelect)
		if type(TabSelect) == "number" then
			redzlib.Tabs[TabSelect].func:Enable()
		else
			for _, Tab in pairs(redzlib.Tabs) do
				if Tab.Cont == TabSelect.Cont then
					Tab.func:Enable()
				end
			end
		end
	end
 
	local ContainerList = {}
 
	function Window:MakeTab(paste, Configs)
		if type(paste) == "table" then Configs = paste end
		local TName = Configs[1] or Configs.Title or "Tab!"
		local TIcon = Configs[2] or Configs.Icon or ""
 
		TIcon = redzlib:GetIcon(TIcon)
		if not TIcon or not TIcon:find("rbxassetid://")
		or TIcon:gsub("rbxassetid://", ""):len() < 6 then
			TIcon = false
		end
 
		local TabSelect = Make("Button", MainScroll, {
			Size = UDim2.new(1, 0, 0, 24)
		})
		Make("Corner", TabSelect)
 
		local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, {
			Size = UDim2.new(1, TIcon and -25 or -15, 1),
			Position = UDim2.fromOffset(TIcon and 25 or 15),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamMedium,
			Text = TName,
			TextColor3 = Theme["Color Text"],
			TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTransparency = (FirstTab and 0.3) or 0,
			TextTruncate = "AtEnd"
		}), "Text")
 
		local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, {
			Position = UDim2.new(0, 8, 0.5),
			Size = UDim2.new(0, 13, 0, 13),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = TIcon or "",
			BackgroundTransparency = 1,
			ImageTransparency = (FirstTab and 0.3) or 0
		}), "Text")
 
		local Selected = InsertTheme(Create("Frame", TabSelect, {
			Size = FirstTab and UDim2.new(0, 4, 0, 4) or UDim2.new(0, 4, 0, 13),
			Position = UDim2.new(0, 1, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Theme["Color Theme"],
			BackgroundTransparency = FirstTab and 1 or 0
		}), "Theme")
		Make("Corner", Selected, UDim.new(0.5, 0))
 
		local Container = InsertTheme(Create("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 1),
			AnchorPoint = Vector2.new(0, 1),
			ScrollBarThickness = 1.5,
			BackgroundTransparency = 1,
			ScrollBarImageTransparency = 0.2,
			ScrollBarImageColor3 = Theme["Color Theme"],
			AutomaticCanvasSize = "Y",
			ScrollingDirection = "Y",
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			Name = ("Container %i [ %s ]"):format(#ContainerList + 1, TName)
		}, {
			Create("UIPadding", {
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10)
			}),
			Create("UIListLayout", { Padding = UDim.new(0, 5) })
		}), "ScrollBar")
 
		table.insert(ContainerList, Container)
 
		if not FirstTab then Container.Parent = Containers end
 
		local Tab = { Enabled = (FirstTab == false) }
 
		local function Tabs()
			if Container.Parent then return end
			for _, Frame in pairs(ContainerList) do
				if Frame:IsA("ScrollingFrame") and Frame ~= Container then
					Frame.Parent = nil
				end
			end
			Container.Parent = Containers
			Container.Size = UDim2.new(1, 0, 1, 150)
			for _, T in ipairs(redzlib.Tabs) do
				if T.Cont ~= Container then
					T.func:Disable()
				end
			end
			Tab.Enabled = true
			CreateTween({Container, "Size", UDim2.new(1, 0, 1, 0), 0.3})
			CreateTween({LabelTitle, "TextTransparency", 0, 0.35})
			CreateTween({LabelIcon, "ImageTransparency", 0, 0.35})
			CreateTween({Selected, "Size", UDim2.new(0, 4, 0, 13), 0.35})
			CreateTween({Selected, "BackgroundTransparency", 0, 0.35})
		end
 
		TabSelect.Activated:Connect(Tabs)
		FirstTab = true
		table.insert(redzlib.Tabs, {
			TabInfo = {Name = TName, Icon = TIcon},
			func = Tab,
			Cont = Container
		})
		Tab.Cont = Container
 
		function Tab:Disable()
			self.Enabled = false
			Container.Parent = nil
			CreateTween({LabelTitle, "TextTransparency", 0.3, 0.35})
			CreateTween({LabelIcon, "ImageTransparency", 0.3, 0.35})
			CreateTween({Selected, "Size", UDim2.new(0, 4, 0, 4), 0.35})
			CreateTween({Selected, "BackgroundTransparency", 1, 0.35})
		end
 
		function Tab:Enable() Tabs() end
 
		function Tab:Visible(Bool)
			Funcs:ToggleVisible(TabSelect, Bool)
		end
 
		function Tab:Destroy()
			TabSelect:Destroy()
			Container:Destroy()
		end
 
		-- ============================================================
		--  ADDSEPARATOR
		-- ============================================================
		function Tab:AddSeparator(Configs)
			local SepHeight = (Configs and Configs.Height) or 6
			local SepColor = (Configs and Configs.Color) or Theme["Color Stroke"]
			local SepTransparency = (Configs and Configs.Transparency) or 0.5
			
			local SepFrame = Create("Frame", Container, {
				Size = UDim2.new(1, 0, 0, SepHeight),
				BackgroundTransparency = 1,
				Name = "Option"
			})
			
			local Line = InsertTheme(Create("Frame", SepFrame, {
				Size = UDim2.new(1, -20, 0, 1),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = SepColor,
				BackgroundTransparency = SepTransparency,
				BorderSizePixel = 0
			}), "SectionLine")
			
			local Separator = {}
			function Separator:Visible(...) Funcs:ToggleVisible(SepFrame, ...) end
			function Separator:Destroy() SepFrame:Destroy() end
			function Separator:SetColor(color, transparency)
				Line.BackgroundColor3 = color or SepColor
				if transparency then Line.BackgroundTransparency = transparency end
			end
			return Separator
		end
 
		-- ============================================================
		--  ADDLABEL
		-- ============================================================
		function Tab:AddLabel(Configs)
			local LName = Configs[1] or Configs.Name or Configs.Title or "Label"
			local LDesc = Configs.Desc or Configs.Description or ""
			local LInitial = Configs[2] or Configs.Initial or Configs.Text or ""
			local LAlignment = (Configs.Align or "Left"):lower()
			
			local Frame, LabelFunc = ButtonFrame(Container, LName, LDesc, UDim2.new(1, -130))
			
			local DynamicFrame = InsertTheme(Create("Frame", Frame, {
				Size = UDim2.new(0, 100, 1, 0),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1
			}), "Frame")
			
			local DynamicText = InsertTheme(Create("TextLabel", DynamicFrame, {
				Size = UDim2.new(1, -5, 1, -5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				TextColor3 = Theme["Color Theme"],
				TextXAlignment = (LAlignment == "center" and "Center") or (LAlignment == "right" and "Right") or "Left",
				Text = tostring(LInitial),
				RichText = true
			}), "Theme")
			
			local Label = {}
			function Label:Set(NewText)
				if type(NewText) == "string" or type(NewText) == "number" then
					DynamicText.Text = tostring(NewText)
				elseif type(NewText) == "function" then
					DynamicText.Text = tostring(NewText() or "")
				end
			end
			function Label:Get()
				return DynamicText.Text
			end
			function Label:SetTitle(Val) LabelFunc:SetTitle(GetStr(Val)) end
			function Label:SetDesc(Val) LabelFunc:SetDesc(GetStr(Val)) end
			function Label:Visible(...) Funcs:ToggleVisible(Frame, ...) end
			function Label:Destroy() Frame:Destroy() end
			function Label:SetColor(color)
				DynamicText.TextColor3 = color or Theme["Color Theme"]
			end
			
			Label:Set(LInitial)
			return Label
		end
 
		-- ============================================================
		--  RADIOGROUP
		-- ============================================================
		function Tab:AddRadioGroup(Configs)
			local RGName = Configs[1] or Configs.Name or Configs.Title or "Radio Group"
			local RGDesc = Configs.Desc or Configs.Description or ""
			local RGOptions = Configs[2] or Configs.Options or {}
			local DefaultIndex = Configs[3] or Configs.Default or 1
			local Flag = Configs[4] or Configs.Flag or false
			local Callback = Funcs:GetCallback(Configs, 5)
			
			local SelectedIndex = DefaultIndex
			if CheckFlag(Flag) then
				local saved = GetFlag(Flag)
				if type(saved) == "number" and saved >= 1 and saved <= #RGOptions then
					SelectedIndex = saved
				end
			end
			
			local GroupFrame = Create("Frame", Container, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
				Name = "Option"
			})
			
			local TitleFrame, LabelFunc = ButtonFrame(GroupFrame, RGName, RGDesc, UDim2.new(1, -20))
			TitleFrame.Size = UDim2.new(1, 0, 0, 32)
			
			local OptionsContainer = Create("Frame", GroupFrame, {
				Size = UDim2.new(1, -20, 0, 0),
				Position = UDim2.new(0, 10, 0, 35),
				BackgroundTransparency = 1,
				AutomaticSize = "Y",
				Name = "OptionsContainer"
			}, {
				Create("UIListLayout", {
					Padding = UDim.new(0, 6),
					SortOrder = "LayoutOrder"
				})
			})
			
			local RadioButtons = {}
			
			local function UpdateGroup()
				SetFlag(Flag, SelectedIndex)
				Funcs:FireCallback(Callback, RGOptions[SelectedIndex], SelectedIndex)
				
				for i, btnData in ipairs(RadioButtons) do
					local isSelected = (i == SelectedIndex)
					local Btn = btnData.Button
					local Indicator = btnData.Indicator
					
					if isSelected then
						CreateTween({Indicator, "Size", UDim2.fromOffset(4, 12), 0.2})
						CreateTween({Indicator, "BackgroundTransparency", 0, 0.2})
						btnData.Label.TextColor3 = Theme["Color Theme"]
						btnData.Label.Font = Enum.Font.GothamBold
					else
						CreateTween({Indicator, "Size", UDim2.fromOffset(4, 4), 0.2})
						CreateTween({Indicator, "BackgroundTransparency", 0.8, 0.2})
						btnData.Label.TextColor3 = Theme["Color Text"]
						btnData.Label.Font = Enum.Font.GothamMedium
					end
				end
			end
			
			local function AddRadioOption(optionText, index)
				local Btn = Make("Button", OptionsContainer, {
					Size = UDim2.new(1, 0, 0, 24),
					Name = "RadioOption_" .. index
				})
				Make("Corner", Btn, UDim.new(0, 5))
				
				local Indicator = InsertTheme(Create("Frame", Btn, {
					Position = UDim2.new(0, 8, 0.5),
					Size = UDim2.new(0, 4, 0, 4),
					BackgroundColor3 = Theme["Color Theme"],
					BackgroundTransparency = 0.8,
					AnchorPoint = Vector2.new(0, 0.5)
				}), "Theme")
				Make("Corner", Indicator, UDim.new(0.5, 0))
				
				local Label = InsertTheme(Create("TextLabel", Btn, {
					Position = UDim2.new(0, 18, 0.5),
					Size = UDim2.new(1, -25, 1),
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundTransparency = 1,
					Font = Enum.Font.GothamMedium,
					TextColor3 = Theme["Color Text"],
					TextSize = 11,
					TextXAlignment = "Left",
					Text = optionText
				}), "Text")
				
				Btn.Activated:Connect(function()
					if SelectedIndex == index then return end
					SelectedIndex = index
					UpdateGroup()
				end)
				
				table.insert(RadioButtons, {
					Button = Btn,
					Indicator = Indicator,
					Label = Label,
					Index = index,
					Text = optionText
				})
			end
			
			for i, opt in ipairs(RGOptions) do
				AddRadioOption(opt, i)
			end
			
			UpdateGroup()
			
			local RadioGroup = {}
			function RadioGroup:Visible(...) Funcs:ToggleVisible(GroupFrame, ...) end
			function RadioGroup:Destroy() GroupFrame:Destroy() end
			function RadioGroup:SetSelected(index)
				if type(index) == "number" and index >= 1 and index <= #RGOptions then
					SelectedIndex = index
					UpdateGroup()
				elseif type(index) == "string" then
					for i, opt in ipairs(RGOptions) do
						if opt == index then
							SelectedIndex = i
							UpdateGroup()
							break
						end
					end
				end
			end
			function RadioGroup:GetSelected()
				return RGOptions[SelectedIndex], SelectedIndex
			end
			function RadioGroup:GetSelectedIndex()
				return SelectedIndex
			end
			function RadioGroup:Set(Val1, Val2)
				if type(Val1) == "string" and type(Val2) == "string" then
					LabelFunc:SetTitle(Val1)
					LabelFunc:SetDesc(Val2)
				elseif type(Val1) == "function" then
					Callback = {Val1}
				elseif type(Val1) == "number" then
					self:SetSelected(Val1)
				elseif type(Val1) == "string" then
					self:SetSelected(Val1)
				end
			end
			function RadioGroup:AddOption(newOption)
				table.insert(RGOptions, newOption)
				AddRadioOption(newOption, #RGOptions)
				UpdateGroup()
			end
			function RadioGroup:RemoveOption(index)
				if type(index) == "number" and RadioButtons[index] then
					RadioButtons[index].Button:Destroy()
					table.remove(RadioButtons, index)
					table.remove(RGOptions, index)
					if SelectedIndex >= index then
						SelectedIndex = math.max(1, SelectedIndex - 1)
					end
					for i, btnData in ipairs(RadioButtons) do
						btnData.Index = i
						btnData.Button.Name = "RadioOption_" .. i
					end
					UpdateGroup()
				elseif type(index) == "string" then
					for i, opt in ipairs(RGOptions) do
						if opt == index then
							self:RemoveOption(i)
							break
						end
					end
				end
			end
			return RadioGroup
		end
 
		-- ============================================================
		--  ADDSECTION
		-- ============================================================
		function Tab:AddSection(Configs)
			local SectionName = type(Configs) == "string" and Configs
				or Configs[1] or Configs.Name or Configs.Title or Configs.Section
 
			local SectionFrame = Create("Frame", Container, {
				Size = UDim2.new(1, 0, 0, 26),
				BackgroundTransparency = 1,
				Name = "Option"
			})
 
			local SectionDot = InsertTheme(Create("Frame", SectionFrame, {
				Size = UDim2.new(0, 3, 0, 11),
				Position = UDim2.new(0, 0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Theme["Color Theme"],
				BorderSizePixel = 0,
				Name = "SectionDot"
			}), "Theme")
			Make("Corner", SectionDot, UDim.new(0.5, 0))
 
			local SectionLabel = InsertTheme(Create("TextLabel", SectionFrame, {
				Font = Enum.Font.GothamBold,
				Text = SectionName,
				TextColor3 = Theme["Color Text"],
				Size = UDim2.new(1, -18, 1, 0),
				Position = UDim2.new(0, 10, 0, 0),
				BackgroundTransparency = 1,
				TextTruncate = "AtEnd",
				TextSize = 12,
				TextXAlignment = "Left"
			}), "Text")
 
			local SectionLine = InsertTheme(Create("Frame", SectionFrame, {
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, -1),
				BackgroundColor3 = Theme["Color Stroke"],
				BackgroundTransparency = 0.3,
				BorderSizePixel = 0,
				Name = "SectionLine"
			}), "SectionLine")
 
			local Section = {}
			table.insert(redzlib.Options, {type = "Section", Name = SectionName, func = Section})
 
			function Section:Visible(Bool)
				if Bool == nil then
					SectionFrame.Visible = not SectionFrame.Visible
				else
					SectionFrame.Visible = Bool
				end
			end
			function Section:Destroy() SectionFrame:Destroy() end
			function Section:Set(New)
				if New then SectionLabel.Text = GetStr(New) end
			end
			return Section
		end
 
		function Tab:AddParagraph(Configs)
			local PName = Configs[1] or Configs.Title or "Paragraph"
			local PDesc = Configs[2] or Configs.Text or ""
 
			local Frame, LabelFunc = ButtonFrame(Container, PName, PDesc, UDim2.new(1, -20))
 
			local Paragraph = {}
			function Paragraph:Visible(...) Funcs:ToggleVisible(Frame, ...) end
			function Paragraph:Destroy() Frame:Destroy() end
			function Paragraph:SetTitle(Val) LabelFunc:SetTitle(GetStr(Val)) end
			function Paragraph:SetDesc(Val) LabelFunc:SetDesc(GetStr(Val)) end
			function Paragraph:Set(Val1, Val2)
				if Val1 and Val2 then
					LabelFunc:SetTitle(GetStr(Val1))
					LabelFunc:SetDesc(GetStr(Val2))
				elseif Val1 then
					LabelFunc:SetDesc(GetStr(Val1))
				end
			end
			return Paragraph
		end
 
		function Tab:AddButton(Configs)
			local BName = Configs[1] or Configs.Name or Configs.Title or "Button!"
			local BDescription = Configs.Desc or Configs.Description or ""
			local Callback = Funcs:GetCallback(Configs, 2)
 
			local FButton, LabelFunc = ButtonFrame(Container, BName, BDescription, UDim2.new(1, -20))
 
			local ButtonIcon = Create("ImageLabel", FButton, {
				Size = UDim2.new(0, 14, 0, 14),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Image = "rbxassetid://10709791437"
			})
 
			FButton.Activated:Connect(function()
				Funcs:FireCallback(Callback)
			end)
 
			local Button = {}
			function Button:Visible(...) Funcs:ToggleVisible(FButton, ...) end
			function Button:Destroy() FButton:Destroy() end
			function Button:Callback(...) Funcs:InsertCallback(Callback, ...) end
			function Button:Set(Val1, Val2)
				if type(Val1) == "string" and type(Val2) == "string" then
					LabelFunc:SetTitle(Val1)
					LabelFunc:SetDesc(Val2)
				elseif type(Val1) == "string" then
					LabelFunc:SetTitle(Val1)
				elseif type(Val1) == "function" then
					Callback = {Val1}
				end
			end
			return Button
		end
 
		function Tab:AddToggle(Configs)
			local TName = Configs[1] or Configs.Name or Configs.Title or "Toggle"
			local TDesc = Configs.Desc or Configs.Description or ""
			local Callback = Funcs:GetCallback(Configs, 3)
			local Flag = Configs[4] or Configs.Flag or false
			local Default = Configs[2] or Configs.Default or false
			if CheckFlag(Flag) then Default = GetFlag(Flag) end
 
			local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -38))
 
			local ToggleHolder = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 35, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Stroke"]
			}), "Stroke")
			Make("Corner", ToggleHolder, UDim.new(0.5, 0))
 
			local Slider = Create("Frame", ToggleHolder, {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.8, 0, 0.8, 0),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
 
			local Toggle = InsertTheme(Create("Frame", Slider, {
				Size = UDim2.new(0, 12, 0, 12),
				Position = UDim2.new(0, 0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Theme["Color Theme"]
			}), "Theme")
			Make("Corner", Toggle, UDim.new(0.5, 0))
 
			local WaitToggle
			local function SetToggle(Val)
				if WaitToggle then return end
 
				WaitToggle, Default = true, Val
				SetFlag(Flag, Default)
				Funcs:FireCallback(Callback, Default)
				if Default then
					CreateTween({Toggle, "Position", UDim2.new(1, 0, 0.5), 0.25})
					CreateTween({Toggle, "BackgroundTransparency", 0, 0.25})
					CreateTween({Toggle, "AnchorPoint", Vector2.new(1, 0.5), 0.25})
				else
					CreateTween({Toggle, "Position", UDim2.new(0, 0, 0.5), 0.25})
					CreateTween({Toggle, "BackgroundTransparency", 0.8, 0.25})
					CreateTween({Toggle, "AnchorPoint", Vector2.new(0, 0.5), 0.25})
				end
				WaitToggle = false
			end
			task.spawn(SetToggle, Default)
 
			Button.Activated:Connect(function()
				SetToggle(not Default)
			end)
 
			local ToggleObj = {}
			function ToggleObj:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function ToggleObj:Destroy() Button:Destroy() end
			function ToggleObj:Callback(...) Funcs:InsertCallback(Callback, ...) end
			function ToggleObj:Set(Val1, Val2)
				if type(Val1) == "string" and type(Val2) == "string" then
					LabelFunc:SetTitle(Val1)
					LabelFunc:SetDesc(Val2)
				elseif type(Val1) == "string" then
					LabelFunc:SetTitle(Val1)
				elseif type(Val1) == "boolean" then
					if WaitToggle and Val2 then
						repeat task.wait() until not WaitToggle
					end
					task.spawn(SetToggle, Val1)
				elseif type(Val1) == "function" then
					Callback = {Val1}
				end
			end
			function ToggleObj:Get()
				return Default
			end
			return ToggleObj
		end
 
		-- ============================================================
		--  DROPDOWN COM SEARCH CORRIGIDO E COM SCROLL LIMITADO
		-- ============================================================
		function Tab:AddDropdown(Configs)
			local DName = Configs[1] or Configs.Name or Configs.Title or "Dropdown"
			local DDesc = Configs.Desc or Configs.Description or ""
			local DOptions = Configs[2] or Configs.Options or {}
			local OpDefault = Configs[3] or Configs.Default or {}
			local Flag = Configs[5] or Configs.Flag or false
			local DMultiSelect = Configs.MultiSelect or false
			local Callback = Funcs:GetCallback(Configs, 4)
			local SearchEnabled = (Configs.Search ~= false)
			
			local Button, LabelFunc = ButtonFrame(Container, DName, DDesc, UDim2.new(1, -180))
			
			local SelectedFrame = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 150, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Stroke"]
			}), "Stroke")
			Make("Corner", SelectedFrame, UDim.new(0, 4))
			
			local ActiveLabel = InsertTheme(Create("TextLabel", SelectedFrame, {
				Size = UDim2.new(0.85, 0, 0.85, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextScaled = true,
				TextColor3 = Theme["Color Text"],
				Text = "..."
			}), "Text")
			
			local Arrow = Create("ImageLabel", SelectedFrame, {
				Size = UDim2.new(0, 15, 0, 15),
				Position = UDim2.new(0, -5, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				Image = "rbxassetid://10709791523",
				BackgroundTransparency = 1
			})
			
			local NoClickFrame = Create("TextButton", DropdownHolder, {
				Name = "AntiClick",
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Visible = false,
				Text = ""
			})
			
			local DropFrame = Create("Frame", NoClickFrame, {
				Size = UDim2.fromOffset(152, 0),
				BackgroundTransparency = 0.1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AnchorPoint = Vector2.new(0, 1),
				Name = "DropdownFrame",
				ClipsDescendants = true,
				Active = true
			})
			Make("Corner", DropFrame)
			Make("Stroke", DropFrame)
			Make("Gradient", DropFrame, {Rotation = 60})
			
			local ScrollFrame = nil
			local SearchBarFrame = nil
			local SearchInputBox = nil
			
			if SearchEnabled then
				SearchBarFrame = InsertTheme(Create("Frame", DropFrame, {
					Size = UDim2.new(1, -10, 0, 24),
					Position = UDim2.new(0, 5, 0, 5),
					BackgroundColor3 = Theme["Color Hub 2"],
					Visible = true,
					ZIndex = 10
				}), "Frame")
				Make("Corner", SearchBarFrame, UDim.new(0, 4))
				Make("Stroke", SearchBarFrame)
				
				SearchInputBox = InsertTheme(Create("TextBox", SearchBarFrame, {
					Size = UDim2.new(1, -26, 1, 0),
					Position = UDim2.new(0, 8, 0, 0),
					BackgroundTransparency = 1,
					Font = Enum.Font.GothamMedium,
					TextSize = 10,
					TextColor3 = Theme["Color Text"],
					PlaceholderText = "Buscar opcao...",
					Text = "",
					ClearTextOnFocus = false,
					ZIndex = 11
				}), "Text")
				
				local ClearBtn = Create("ImageButton", SearchBarFrame, {
					Size = UDim2.new(0, 14, 0, 14),
					Position = UDim2.new(1, -6, 0.5),
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundTransparency = 1,
					Image = "rbxassetid://10747384394",
					ImageColor3 = Theme["Color Dark Text"],
					AutoButtonColor = false,
					ZIndex = 12
				})
				
				ClearBtn.Activated:Connect(function()
					SearchInputBox.Text = ""
				end)
				
				ScrollFrame = InsertTheme(Create("ScrollingFrame", DropFrame, {
					ScrollBarImageColor3 = Theme["Color Theme"],
					Size = UDim2.new(1, 0, 1, -34),
					Position = UDim2.new(0, 0, 0, 34),
					ScrollBarThickness = 1.5,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					CanvasSize = UDim2.new(),
					ScrollingDirection = "Y",
					AutomaticCanvasSize = "Y",
					Active = true
				}), "ScrollBar")
			else
				ScrollFrame = InsertTheme(Create("ScrollingFrame", DropFrame, {
					ScrollBarImageColor3 = Theme["Color Theme"],
					Size = UDim2.new(1, 0, 1, 0),
					ScrollBarThickness = 1.5,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					CanvasSize = UDim2.new(),
					ScrollingDirection = "Y",
					AutomaticCanvasSize = "Y",
					Active = true
				}), "ScrollBar")
			end
			
			SetChildren(ScrollFrame, {
				Create("UIPadding", {
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8),
					PaddingTop = UDim.new(0, 5),
					PaddingBottom = UDim.new(0, 5)
				}),
				Create("UIListLayout", { Padding = UDim.new(0, 4) })
			})
			
			local DropSize = 10
			local WaitAnim = false
			local OptionList = {}
			local CurrentSelected = nil
			local OptionButtons = {}
			
			local function CloseDropdown()
				WaitAnim = true
				CreateTween({Arrow, "Rotation", 0, 0.2})
				CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.2, true})
				CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.2})
				Arrow.Image = "rbxassetid://10709791523"
				NoClickFrame.Visible = false
				if SearchInputBox then SearchInputBox.Text = "" end
				WaitAnim = false
			end
			
			local function UpdateDropHeight()
				local visibleCount = 0
				for _, btnData in pairs(OptionButtons) do
					if btnData.Button.Visible then
						visibleCount = visibleCount + 1
					end
				end
				local maxVisible = math.min(visibleCount, 7)
				local newHeight = (maxVisible * 24) + 10
				if SearchBarFrame then newHeight = newHeight + 34 end
				DropSize = math.clamp(newHeight, 10, 200)
				if NoClickFrame.Visible then
					CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, DropSize), 0.15, true})
				end
			end
			
			local function FilterOptionsBySearch(query)
				query = query:lower()
				for _, btnData in pairs(OptionButtons) do
					local shouldShow = (query == "" or string.find(btnData.Name:lower(), query, 1, true))
					btnData.Button.Visible = shouldShow
				end
				UpdateDropHeight()
			end
			
			if SearchInputBox then
				SearchInputBox:GetPropertyChangedSignal("Text"):Connect(function()
					FilterOptionsBySearch(SearchInputBox.Text)
				end)
			end
			
			local function ToggleDropdown()
				if WaitAnim then return end
				WaitAnim = true
				if NoClickFrame.Visible then
					Arrow.Image = "rbxassetid://10709791523"
					CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.2})
					CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.2, true})
					NoClickFrame.Visible = false
					if SearchInputBox then SearchInputBox.Text = "" end
				else
					NoClickFrame.Visible = true
					Arrow.Image = "rbxassetid://10709790948"
					CreateTween({Arrow, "ImageColor3", Theme["Color Theme"], 0.2})
					UpdateDropHeight()
					CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, DropSize), 0.2, true})
					UpdatePosition()
				end
				WaitAnim = false
			end
			
			local function UpdatePosition()
				local framePos = SelectedFrame.AbsolutePosition
				local screenSize = ScreenGui.AbsoluteSize
				local newX = math.clamp((framePos.X / UIScale), 0, screenSize.X / UIScale - DropFrame.Size.X.Offset)
				local newY = framePos.Y / UIScale
				local anchorPointY = framePos.Y > screenSize.Y / 1.4 and 1 or 0
				DropFrame.AnchorPoint = Vector2.new(0, anchorPointY)
				CreateTween({DropFrame, "Position", UDim2.fromOffset(newX, newY), 0.1})
			end
			
			local function UpdateLabelText()
				if DMultiSelect then
					local selectedList = {}
					local selectedItems = CurrentSelected or {}
					for name, isSelected in pairs(selectedItems) do
						if isSelected then table.insert(selectedList, name) end
					end
					if #selectedList > 0 then
						if #selectedList > 2 then
							ActiveLabel.Text = table.concat(selectedList, ", "):sub(1, 20) .. "..."
						else
							ActiveLabel.Text = table.concat(selectedList, ", ")
						end
					else
						ActiveLabel.Text = "..."
					end
				else
					ActiveLabel.Text = tostring(CurrentSelected or "...")
				end
			end
			
			local function UpdateSelectionVisual()
				for btnName, btnData in pairs(OptionButtons) do
					local isItemSelected = false
					if DMultiSelect then
						isItemSelected = CurrentSelected and CurrentSelected[btnName] == true
					else
						isItemSelected = (btnData.Value == CurrentSelected)
					end
					
					local indicatorObj = btnData.Indicator
					local labelObj = btnData.Label
					
					if isItemSelected then
						CreateTween({indicatorObj, "Size", UDim2.fromOffset(4, 12), 0.2})
						CreateTween({indicatorObj, "BackgroundTransparency", 0, 0.2})
						if labelObj then labelObj.TextColor3 = Theme["Color Theme"] end
					else
						CreateTween({indicatorObj, "Size", UDim2.fromOffset(4, 4), 0.2})
						CreateTween({indicatorObj, "BackgroundTransparency", 0.8, 0.2})
						if labelObj then labelObj.TextColor3 = Theme["Color Text"] end
					end
				end
				UpdateLabelText()
			end
			
			local function SaveAndCallback()
				SetFlag(Flag, DMultiSelect and CurrentSelected or tostring(CurrentSelected or "..."))
				Funcs:FireCallback(Callback, CurrentSelected)
			end
			
			local function AddNewOption(index, Value)
				local optionName = tostring(type(index) == "string" and index or Value)
				if OptionButtons[optionName] then return end
				
				local newBtn = Make("Button", ScrollFrame, {
					Name = "Option",
					Size = UDim2.new(1, 0, 0, 22),
				})
				Make("Corner", newBtn, UDim.new(0, 4))
				
				local indicatorFrame = InsertTheme(Create("Frame", newBtn, {
					Position = UDim2.new(0, 6, 0.5),
					Size = UDim2.new(0, 4, 0, 4),
					BackgroundColor3 = Theme["Color Theme"],
					BackgroundTransparency = 0.8,
					AnchorPoint = Vector2.new(0, 0.5)
				}), "Theme")
				Make("Corner", indicatorFrame, UDim.new(0.5, 0))
				
				local optionLabel = InsertTheme(Create("TextLabel", newBtn, {
					Size = UDim2.new(1, -16, 1),
					Position = UDim2.new(0, 16, 0),
					Text = optionName,
					TextColor3 = Theme["Color Text"],
					Font = Enum.Font.GothamMedium,
					TextSize = 11,
					TextXAlignment = "Left",
					BackgroundTransparency = 1
				}), "Text")
				
				OptionButtons[optionName] = {
					Button = newBtn,
					Indicator = indicatorFrame,
					Label = optionLabel,
					Name = optionName,
					Value = Value
				}
				
				newBtn.Activated:Connect(function()
					if DMultiSelect then
						if not CurrentSelected then CurrentSelected = {} end
						CurrentSelected[optionName] = not CurrentSelected[optionName]
					else
						CurrentSelected = Value
					end
					UpdateSelectionVisual()
					SaveAndCallback()
				end)
				
				return newBtn
			end
			
			local function RemoveExistingOption(optionIdentifier)
				local optionName = tostring(optionIdentifier)
				if OptionButtons[optionName] then
					if DMultiSelect and CurrentSelected then
						CurrentSelected[optionName] = nil
					elseif CurrentSelected == OptionButtons[optionName].Value then
						CurrentSelected = nil
					end
					OptionButtons[optionName].Button:Destroy()
					OptionButtons[optionName] = nil
				end
			end
			
			-- Inicializar
			CurrentSelected = DMultiSelect and {} or nil
			
			for key, val in pairs(DOptions) do
				AddNewOption(key, val)
			end
			
			if CheckFlag(Flag) then
				local savedValue = GetFlag(Flag)
				if DMultiSelect and type(savedValue) == "table" then
					CurrentSelected = savedValue
				elseif not DMultiSelect and savedValue then
					CurrentSelected = savedValue
					for name, data in pairs(OptionButtons) do
						if data.Value == savedValue or name == savedValue then
							CurrentSelected = data.Value
							break
						end
					end
				end
			elseif OpDefault then
				if DMultiSelect then
					CurrentSelected = {}
					local defaultList = type(OpDefault) == "table" and OpDefault or {OpDefault}
					for _, opt in pairs(defaultList) do
						for name, data in pairs(OptionButtons) do
							if data.Value == opt or name == opt then
								CurrentSelected[name] = true
								break
							end
						end
					end
				else
					for name, data in pairs(OptionButtons) do
						if data.Value == OpDefault or name == OpDefault then
							CurrentSelected = data.Value
							break
						end
					end
				end
			end
			
			UpdateSelectionVisual()
			SaveAndCallback()
			UpdateDropHeight()
			
			Button.Activated:Connect(ToggleDropdown)
			NoClickFrame.MouseButton1Down:Connect(CloseDropdown)
			NoClickFrame.MouseButton1Click:Connect(CloseDropdown)
			MainFrame:GetPropertyChangedSignal("Visible"):Connect(CloseDropdown)
			SelectedFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(UpdatePosition)
			
			UpdatePosition()
			
			local DropdownObject = {}
			function DropdownObject:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function DropdownObject:Destroy() Button:Destroy() end
			function DropdownObject:Callback(...) Funcs:InsertCallback(Callback, ...)(CurrentSelected) end
			function DropdownObject:Add(...)
				local newOptions = {...}
				if type(newOptions[1]) == "table" then
					for key, val in pairs(newOptions[1]) do AddNewOption(key, val) end
				else
					for _, val in ipairs(newOptions) do AddNewOption(val, val) end
				end
				UpdateDropHeight()
			end
			function DropdownObject:Remove(opt)
				RemoveExistingOption(opt)
				UpdateDropHeight()
			end
			function DropdownObject:Set(val, clear)
				if type(val) == "table" then
					for key, val in pairs(val) do AddNewOption(key, val) end
				elseif type(val) == "function" then
					Callback = {val}
				end
			end
			function DropdownObject:GetSelected() return CurrentSelected end
			return DropdownObject
		end
 
		function Tab:AddSlider(Configs)
			local SName = Configs[1] or Configs.Name or Configs.Title or "Slider!"
			local SDesc = Configs.Desc or Configs.Description or ""
			local Min = Configs[2] or Configs.MinValue or Configs.Min or 10
			local Max = Configs[3] or Configs.MaxValue or Configs.Max or 100
			local Increase = Configs[4] or Configs.Increase or 1
			local Callback = Funcs:GetCallback(Configs, 6)
			local Flag = Configs[7] or Configs.Flag or false
			local Default = Configs[5] or Configs.Default or 25
			if CheckFlag(Flag) then Default = GetFlag(Flag) end
			Min, Max = Min / Increase, Max / Increase
 
			local Button, LabelFunc = ButtonFrame(Container, SName, SDesc, UDim2.new(1, -180))
 
			local SliderHolder = Create("TextButton", Button, {
				Size = UDim2.new(0.45, 0, 1),
				Position = UDim2.new(1),
				AnchorPoint = Vector2.new(1, 0),
				AutoButtonColor = false,
				Text = "",
				BackgroundTransparency = 1
			})
 
			local SliderBar = InsertTheme(Create("Frame", SliderHolder, {
				BackgroundColor3 = Theme["Color Stroke"],
				Size = UDim2.new(1, -20, 0, 6),
				Position = UDim2.new(0.5, 0, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}), "Stroke")
			Make("Corner", SliderBar)
 
			local Indicator = InsertTheme(Create("Frame", SliderBar, {
				BackgroundColor3 = Theme["Color Theme"],
				Size = UDim2.fromScale(0.3, 1),
				BorderSizePixel = 0
			}), "Theme")
			Make("Corner", Indicator)
 
			local SliderIcon = Create("Frame", SliderBar, {
				Size = UDim2.new(0, 6, 0, 12),
				BackgroundColor3 = Color3.fromRGB(220, 220, 220),
				Position = UDim2.fromScale(0.3, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 0.2
			})
			Make("Corner", SliderIcon)
 
			local LabelVal = InsertTheme(Create("TextLabel", SliderHolder, {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(0, 0, 0.5),
				BackgroundTransparency = 1,
				TextColor3 = Theme["Color Text"],
				Font = Enum.Font.FredokaOne,
				TextSize = 12
			}), "Text")
 
			local ValUIScale = Create("UIScale", LabelVal)
 
			local BaseMousePos = Create("Frame", SliderBar, {
				Position = UDim2.new(0, 0, 0.5, 0),
				Visible = false
			})
 
			local function UpdateLabel(NewValue)
				local Number = tonumber(NewValue * Increase)
				Number = math.floor(Number * 100) / 100
				Default = Number
				LabelVal.Text = tostring(Number)
				Funcs:FireCallback(Callback, Default)
			end
 
			local function ControlPos()
				local Mouse = Player:GetMouse()
				local APos = Mouse.X - BaseMousePos.AbsolutePosition.X
				local ConfigureDpiPos = APos / SliderBar.AbsoluteSize.X
				SliderIcon.Position = UDim2.new(math.clamp(ConfigureDpiPos, 0, 1), 0, 0.5, 0)
			end
 
			local function UpdateValues()
				Indicator.Size = UDim2.new(SliderIcon.Position.X.Scale, 0, 1, 0)
				local SliderPos = SliderIcon.Position.X.Scale
				local NewValue = math.floor(((SliderPos * Max) / Max) * (Max - Min) + Min)
				UpdateLabel(NewValue)
			end
 
			SliderHolder.MouseButton1Down:Connect(function()
				CreateTween({SliderIcon, "BackgroundTransparency", 0, 0.3})
				Container.ScrollingEnabled = false
				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					task.wait()
					ControlPos()
				end
				CreateTween({SliderIcon, "BackgroundTransparency", 0.2, 0.3})
				Container.ScrollingEnabled = true
				SetFlag(Flag, Default)
			end)
 
			LabelVal:GetPropertyChangedSignal("Text"):Connect(function()
				ValUIScale.Scale = 0.3
				CreateTween({ValUIScale, "Scale", 1.2, 0.1})
				CreateTween({LabelVal, "Rotation", math.random(-1, 1) * 5, 0.15, true})
				CreateTween({ValUIScale, "Scale", 1, 0.2})
				CreateTween({LabelVal, "Rotation", 0, 0.1})
			end)
 
			local function SetSlider(NewValue)
				if type(NewValue) ~= "number" then return end
				local MinR, MaxR = Min * Increase, Max * Increase
				local SliderPos = (NewValue - MinR) / (MaxR - MinR)
				SetFlag(Flag, NewValue)
				CreateTween({SliderIcon, "Position", UDim2.fromScale(math.clamp(SliderPos, 0, 1), 0.5), 0.3, true})
			end
			SetSlider(Default)
 
			SliderIcon:GetPropertyChangedSignal("Position"):Connect(UpdateValues)
			UpdateValues()
 
			local Slider = {}
			function Slider:Set(NewVal1, NewVal2)
				if NewVal1 and NewVal2 then
					LabelFunc:SetTitle(NewVal1)
					LabelFunc:SetDesc(NewVal2)
				elseif type(NewVal1) == "string" then
					LabelFunc:SetTitle(NewVal1)
				elseif type(NewVal1) == "function" then
					Callback = {NewVal1}
				elseif type(NewVal1) == "number" then
					SetSlider(NewVal1)
				end
			end
			function Slider:Callback(...) Funcs:InsertCallback(Callback, ...)(tonumber(Default)) end
			function Slider:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function Slider:Destroy() Button:Destroy() end
			function Slider:Get() return Default end
			return Slider
		end
 
		function Tab:AddTextBox(Configs)
			local TName = Configs[1] or Configs.Name or Configs.Title or "Text Box"
			local TDesc = Configs.Desc or Configs.Description or ""
			local TDefault = Configs[2] or Configs.Default or ""
			local TPlaceholderText = Configs[5] or Configs.PlaceholderText or "Input"
			local TClearText = Configs[3] or Configs.ClearText or false
			local Callback = Funcs:GetCallback(Configs, 4)
 
			if type(TDefault) ~= "string" or TDefault:gsub(" ", ""):len() < 1 then
				TDefault = false
			end
 
			local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -38))
 
			local SelectedFrame = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 150, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Stroke"]
			}), "Stroke")
			Make("Corner", SelectedFrame, UDim.new(0, 4))
 
			local TextBoxInput = InsertTheme(Create("TextBox", SelectedFrame, {
				Size = UDim2.new(0.85, 0, 0.85, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextScaled = true,
				TextColor3 = Theme["Color Text"],
				ClearTextOnFocus = TClearText,
				PlaceholderText = TPlaceholderText,
				Text = ""
			}), "Text")
 
			local Pencil = Create("ImageLabel", SelectedFrame, {
				Size = UDim2.new(0, 12, 0, 12),
				Position = UDim2.new(0, -5, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				Image = "rbxassetid://15637081879",
				BackgroundTransparency = 1
			})
 
			local TextBox = {}
			local function Input()
				local Text = TextBoxInput.Text
				if Text:gsub(" ", ""):len() > 0 then
					if TextBox.OnChanging then
						Text = TextBox.OnChanging(Text) or Text
					end
					Funcs:FireCallback(Callback, Text)
					TextBoxInput.Text = Text
				end
			end
 
			TextBoxInput.FocusLost:Connect(Input)
			Input()
 
			TextBoxInput.FocusLost:Connect(function()
				CreateTween({Pencil, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.2})
			end)
			TextBoxInput.Focused:Connect(function()
				CreateTween({Pencil, "ImageColor3", Theme["Color Theme"], 0.2})
			end)
 
			TextBox.OnChanging = false
			function TextBox:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function TextBox:Destroy() Button:Destroy() end
			function TextBox:Set(val)
				TextBoxInput.Text = tostring(val)
			end
			function TextBox:Get()
				return TextBoxInput.Text
			end
			return TextBox
		end
 
		function Tab:AddKeybind(Configs)
			local KName = Configs[1] or Configs.Name or Configs.Title or "Keybind"
			local KDesc = Configs.Desc or Configs.Description or ""
			local KDefault = Configs[2] or Configs.Default or Enum.KeyCode.Unknown
			local Flag = Configs[3] or Configs.Flag or false
			local Callback = Funcs:GetCallback(Configs, 4)
 
			local CurrentKey = CheckFlag(Flag) and GetFlag(Flag) or KDefault
			if type(CurrentKey) == "string" then
				pcall(function() CurrentKey = Enum.KeyCode[CurrentKey] end)
			end
 
			local Button, LabelFunc = ButtonFrame(Container, KName, KDesc, UDim2.new(1, -120))
 
			local KeyFrame = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 90, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Stroke"]
			}), "Stroke")
			Make("Corner", KeyFrame, UDim.new(0, 4))
 
			local KeyLabel = InsertTheme(Create("TextLabel", KeyFrame, {
				Size = UDim2.new(1, -6, 1, 0),
				Position = UDim2.new(0, 3, 0, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextScaled = true,
				TextColor3 = Theme["Color Text"],
				Text = tostring(CurrentKey.Name or "None")
			}), "Text")
 
			local Listening = false
 
			local function UpdateKeyLabel()
				KeyLabel.Text = tostring(CurrentKey.Name or "None")
				SetFlag(Flag, tostring(CurrentKey.Name))
			end
			UpdateKeyLabel()
 
			UserInputService.InputBegan:Connect(function(input, processed)
				if processed then return end
				if Listening then
					if input.UserInputType == Enum.UserInputType.Keyboard then
						if input.KeyCode == Enum.KeyCode.Escape then
							Listening = false
							KeyLabel.Text = tostring(CurrentKey.Name or "None")
							CreateTween({KeyFrame, "BackgroundColor3", Theme["Color Stroke"], 0.15})
						else
							CurrentKey = input.KeyCode
							Listening = false
							UpdateKeyLabel()
							CreateTween({KeyFrame, "BackgroundColor3", Theme["Color Stroke"], 0.15})
						end
					end
				elseif input.UserInputType == Enum.UserInputType.Keyboard
				and input.KeyCode == CurrentKey then
					Funcs:FireCallback(Callback, CurrentKey)
				end
			end)
 
			Button.Activated:Connect(function()
				if Listening then
					Listening = false
					UpdateKeyLabel()
					CreateTween({KeyFrame, "BackgroundColor3", Theme["Color Stroke"], 0.15})
				else
					Listening = true
					KeyLabel.Text = "..."
					CreateTween({KeyFrame, "BackgroundColor3", Theme["Color Theme"], 0.15})
				end
			end)
 
			local Keybind = {}
			function Keybind:Set(Val1, Val2)
				if typeof(Val1) == "EnumItem" then
					CurrentKey = Val1
					UpdateKeyLabel()
				elseif type(Val1) == "string" and type(Val2) == "string" then
					LabelFunc:SetTitle(Val1)
					LabelFunc:SetDesc(Val2)
				elseif type(Val1) == "string" then
					local ok, kc = pcall(function() return Enum.KeyCode[Val1] end)
					if ok and kc then
						CurrentKey = kc
						UpdateKeyLabel()
					else
						LabelFunc:SetTitle(Val1)
					end
				elseif type(Val1) == "function" then
					Callback = {Val1}
				end
			end
			function Keybind:GetKey() return CurrentKey end
			function Keybind:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function Keybind:Destroy() Button:Destroy() end
			return Keybind
		end
 
		function Tab:AddDiscordInvite(Configs)
			local Title   = Configs[1] or Configs.Name  or Configs.Title  or "Discord"
			local Desc    = Configs.Desc or Configs.Description or ""
			local Logo    = Configs[2] or Configs.Logo   or ""
			local Invite  = Configs[3] or Configs.Invite or ""
			local Members = Configs.Members or ""
			local Online  = Configs.Online  or ""
 
			local InviteHolder = Create("Frame", Container, {
				Size = UDim2.new(1, 0, 0, 190),
				Name = "Option",
				BackgroundTransparency = 1
			})
 
			local Card = InsertTheme(Create("Frame", InviteHolder, {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Theme["Color Hub 2"],
				ClipsDescendants = true
			}), "Frame")
			Make("Corner", Card, UDim.new(0, 10))
			Make("Stroke", Card)
 
			local Banner = Create("Frame", Card, {
				Size = UDim2.new(1, 0, 0, 55),
				BackgroundColor3 = Color3.fromRGB(30, 130, 200),
				BorderSizePixel = 0,
				ZIndex = 2
			})
			Create("UIGradient", Banner, {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0,    Color3.fromRGB(20,  100, 180)),
					ColorSequenceKeypoint.new(0.5,  Color3.fromRGB(60,  160, 230)),
					ColorSequenceKeypoint.new(1,    Color3.fromRGB(100, 190, 240)),
				}),
				Rotation = 135
			})
			Make("Corner", Banner, UDim.new(0, 10))
			Create("Frame", Banner, {
				Size = UDim2.new(1, 0, 0.5, 0),
				Position = UDim2.new(0, 0, 0.5, 0),
				BackgroundColor3 = Color3.fromRGB(20, 100, 180),
				BorderSizePixel = 0,
				ZIndex = 2
			})
 
			local LogoFrame = Create("Frame", Card, {
				Size = UDim2.new(0, 52, 0, 52),
				Position = UDim2.new(0, 10, 0, 28),
				BackgroundColor3 = Theme["Color Hub 2"],
				ZIndex = 4
			})
			Make("Corner", LogoFrame, UDim.new(0, 10))
			Make("Stroke", LogoFrame)
 
			Create("ImageLabel", LogoFrame, {
				Size = UDim2.new(1, -4, 1, -4),
				Position = UDim2.new(0, 2, 0, 2),
				Image = Logo ~= "" and Logo or "rbxassetid://10734888000",
				BackgroundTransparency = 1,
				ZIndex = 5
			})
 
			local ServerName = InsertTheme(Create("TextLabel", Card, {
				Size = UDim2.new(1, -20, 0, 16),
				Position = UDim2.new(0, 10, 0, 84),
				Font = Enum.Font.GothamBold,
				TextColor3 = Theme["Color Text"],
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextTruncate = "AtEnd",
				TextSize = 12,
				Text = Title,
				ZIndex = 3
			}), "Text")
 
			local MemberLine = InsertTheme(Create("TextLabel", Card, {
				Size = UDim2.new(1, -20, 0, 12),
				Position = UDim2.new(0, 10, 0, 103),
				Font = Enum.Font.Gotham,
				TextColor3 = Theme["Color Dark Text"],
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextSize = 9,
				Text = "",
				ZIndex = 3,
				RichText = true
			}), "DarkText")
 
			local function BuildMemberText()
				local parts = {}
				if Online ~= "" then
					table.insert(parts, '<font color="#3ba55c">●</font> <font color="#b9bbbe">' .. Online .. ' online</font>')
				end
				if Members ~= "" then
					table.insert(parts, '<font color="#72767d">●</font> <font color="#b9bbbe">' .. Members .. ' membros</font>')
				end
				MemberLine.Text = table.concat(parts, "   ")
			end
			BuildMemberText()
 
			local DescLabel = InsertTheme(Create("TextLabel", Card, {
				Size = UDim2.new(1, -20, 0, 0),
				AutomaticSize = "Y",
				Position = UDim2.new(0, 10, 0, 120),
				Font = Enum.Font.Gotham,
				TextColor3 = Theme["Color Dark Text"],
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextWrapped = true,
				TextSize = 9,
				Text = Desc,
				ZIndex = 3
			}), "DarkText")
 
			local JoinButton = Create("TextButton", Card, {
				Size = UDim2.new(1, -20, 0, 26),
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, -10),
				Text = "Ir para o Servidor",
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundColor3 = Color3.fromRGB(59, 165, 92),
				AutoButtonColor = false,
				ZIndex = 3
			})
			Make("Corner", JoinButton, UDim.new(0, 7))
 
			JoinButton.MouseEnter:Connect(function()
				CreateTween({JoinButton, "BackgroundColor3", Color3.fromRGB(46, 140, 75), 0.15})
			end)
			JoinButton.MouseLeave:Connect(function()
				CreateTween({JoinButton, "BackgroundColor3", Color3.fromRGB(59, 165, 92), 0.15})
			end)
 
			local ClickDelay
			JoinButton.Activated:Connect(function()
				if typeof(setclipboard) == "function" then setclipboard(Invite) end
				if ClickDelay then return end
				ClickDelay = true
				JoinButton.Text = "Link Copiado!"
				CreateTween({JoinButton, "BackgroundColor3", Color3.fromRGB(46, 140, 75), 0.1})
				task.wait(2)
				JoinButton.Text = "Ir para o Servidor"
				CreateTween({JoinButton, "BackgroundColor3", Color3.fromRGB(59, 165, 92), 0.1})
				ClickDelay = false
			end)
 
			local DiscordInvite = {}
			function DiscordInvite:Destroy() InviteHolder:Destroy() end
			function DiscordInvite:Visible(...) Funcs:ToggleVisible(InviteHolder, ...) end
			function DiscordInvite:Set(Prop, Val)
				if Prop == "Title" then ServerName.Text = Val
				elseif Prop == "Description" then DescLabel.Text = Val
				elseif Prop == "Members" then Members = Val; BuildMemberText()
				elseif Prop == "Online" then Online = Val; BuildMemberText()
				elseif Prop == "Logo" then LogoFrame:FindFirstChildOfClass("ImageLabel").Image = Val
				elseif Prop == "Invite" then Invite = Val
				end
			end
			return DiscordInvite
		end
 
		function Tab:AddColorPicker(Configs)
			local CPName    = Configs[1] or Configs.Name  or Configs.Title or "Color Picker"
			local CPDesc    = Configs.Desc or Configs.Description or ""
			local CPDefault = Configs[2] or Configs.Default or Color3.fromRGB(255, 100, 100)
			local Flag      = Configs[3] or Configs.Flag or false
			local Callback  = Funcs:GetCallback(Configs, 4)
 
			if CheckFlag(Flag) then
				local saved = GetFlag(Flag)
				if type(saved) == "table" and saved[1] then
					CPDefault = Color3.fromRGB(saved[1], saved[2] or 255, saved[3] or 255)
				end
			end
 
			local CurrentColor = CPDefault
			local CPOpen = false
			local CPWait = false
			local H, S, V = Color3.toHSV(CPDefault)
 
			local function GetPanelSize()
				local vp = workspace.CurrentCamera.ViewportSize
				local logicalW = vp.X / UIScale
				local W = math.min(210, math.floor(logicalW * 0.90))
				local H_ = math.floor(195 * (W / 210))
				return W, H_
			end
 
			local Button, LabelFunc = ButtonFrame(Container, CPName, CPDesc, UDim2.new(1, -50))
 
			local Swatch = Create("Frame", Button, {
				Size = UDim2.new(0, 34, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = CPDefault,
				ZIndex = 2
			})
			Make("Corner", Swatch, UDim.new(0, 5))
			Make("Stroke", Swatch)
 
			local PANEL_W, PANEL_H = GetPanelSize()
 
			local PickerFrame = InsertTheme(Create("Frame", DropdownHolder, {
				Size = UDim2.new(0, PANEL_W, 0, 0),
				BackgroundColor3 = Theme["Color Hub 2"],
				ClipsDescendants = true,
				Visible = false,
				ZIndex = 20,
				Name = "ColorPickerFrame"
			}), "Frame")
			Make("Corner", PickerFrame, UDim.new(0, 8))
			Make("Stroke", PickerFrame)
			Make("Gradient", PickerFrame, { Rotation = 90 })
 
			local function PositionPanel()
				PANEL_W, PANEL_H = GetPanelSize()
				PickerFrame.Size = UDim2.new(0, PANEL_W, 0, PickerFrame.Size.Y.Offset)
 
				local abs = Swatch.AbsolutePosition
				local sg  = ScreenGui.AbsoluteSize
				local px  = math.clamp(abs.X / UIScale, 0, sg.X / UIScale - PANEL_W - 5)
				local py  = abs.Y / UIScale
				local anchorY = (py > sg.Y / UIScale * 0.6) and 1 or 0
				PickerFrame.AnchorPoint = Vector2.new(0, anchorY)
				PickerFrame.Position    = UDim2.fromOffset(px, py)
			end
 
			local PanelHeader = Create("Frame", PickerFrame, {
				Size = UDim2.new(1, 0, 0, 26),
				BackgroundTransparency = 1,
				ZIndex = 21
			})
			InsertTheme(Create("TextLabel", PanelHeader, {
				Size = UDim2.new(1, -30, 1, 0),
				Position = UDim2.new(0, 10, 0, 0),
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = Theme["Color Text"],
				BackgroundTransparency = 1,
				TextXAlignment = "Left",
				Text = CPName,
				ZIndex = 21
			}), "Text")
 
			local PickerClose = Create("ImageButton", PanelHeader, {
				Size = UDim2.new(0, 12, 0, 12),
				Position = UDim2.new(1, -8, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Image = "rbxassetid://10747384394",
				ImageColor3 = Color3.fromRGB(170, 170, 170),
				AutoButtonColor = false,
				ZIndex = 22
			})
 
			local svTop = 30
			local svH   = math.floor(PANEL_H * 0.51)
 
			local SVArea = Create("Frame", PickerFrame, {
				Size = UDim2.new(1, -16, 0, svH),
				Position = UDim2.new(0, 8, 0, svTop),
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				ZIndex = 21
			})
			Make("Corner", SVArea, UDim.new(0, 6))
 
			local SatLayer = Create("Frame", SVArea, {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				ZIndex = 22
			})
			Make("Corner", SatLayer, UDim.new(0, 6))
			Create("UIGradient", SatLayer, {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				}),
				Rotation = 0
			})
 
			local ValLayer = Create("Frame", SVArea, {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				ZIndex = 23
			})
			Make("Corner", ValLayer, UDim.new(0, 6))
			Create("UIGradient", ValLayer, {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				}),
				Rotation = 90
			})
 
			local SVDot = Create("Frame", SVArea, {
				Size = UDim2.new(0, 10, 0, 10),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(S, 0, 1 - V, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				ZIndex = 25
			})
			Make("Corner", SVDot, UDim.new(0.5, 0))
			Make("Stroke", SVDot)
 
			local hueTop = svTop + svH + 8
 
			local HueBar = Create("Frame", PickerFrame, {
				Size = UDim2.new(1, -16, 0, 12),
				Position = UDim2.new(0, 8, 0, hueTop),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				ZIndex = 21
			})
			Make("Corner", HueBar, UDim.new(0.5, 0))
			Create("UIGradient", HueBar, {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0,     Color3.fromHSV(0,      1, 1)),
					ColorSequenceKeypoint.new(1/6,   Color3.fromHSV(1/6,    1, 1)),
					ColorSequenceKeypoint.new(2/6,   Color3.fromHSV(2/6,    1, 1)),
					ColorSequenceKeypoint.new(3/6,   Color3.fromHSV(3/6,    1, 1)),
					ColorSequenceKeypoint.new(4/6,   Color3.fromHSV(4/6,    1, 1)),
					ColorSequenceKeypoint.new(5/6,   Color3.fromHSV(5/6,    1, 1)),
					ColorSequenceKeypoint.new(0.999, Color3.fromHSV(0.999,  1, 1)),
					ColorSequenceKeypoint.new(1,     Color3.fromHSV(0,      1, 1)),
				})
			})
 
			local HueCursor = Create("Frame", HueBar, {
				Size = UDim2.new(0, 8, 1, 4),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(H, 0, 0.5, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				ZIndex = 24
			})
			Make("Corner", HueCursor, UDim.new(0.5, 0))
			Make("Stroke", HueCursor)
 
			local bottomTop = hueTop + 20
 
			local PreviewSwatch = Create("Frame", PickerFrame, {
				Size = UDim2.new(0, 28, 0, 22),
				Position = UDim2.new(0, 8, 0, bottomTop),
				BackgroundColor3 = CPDefault,
				ZIndex = 21
			})
			Make("Corner", PreviewSwatch, UDim.new(0, 5))
			Make("Stroke", PreviewSwatch)
 
			InsertTheme(Create("TextLabel", PickerFrame, {
				Size = UDim2.new(0, 12, 0, 22),
				Position = UDim2.new(0, 40, 0, bottomTop),
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = Theme["Color Dark Text"],
				Text = "#",
				BackgroundTransparency = 1,
				ZIndex = 21
			}), "DarkText")
 
			local HexBox = InsertTheme(Create("TextBox", PickerFrame, {
				Size = UDim2.new(1, -68, 0, 22),
				Position = UDim2.new(0, 52, 0, bottomTop),
				BackgroundColor3 = Theme["Color Hub 2"],
				Font = Enum.Font.GothamBold,
				TextSize = 9,
				TextColor3 = Theme["Color Text"],
				Text = "",
				PlaceholderText = "RRGGBB",
				ZIndex = 21
			}), "Text")
			Make("Corner", HexBox, UDim.new(0, 5))
			Make("Stroke", HexBox)
 
			local function ApplyColor(col)
				CurrentColor = col
				Swatch.BackgroundColor3 = col
				PreviewSwatch.BackgroundColor3 = col
				local r = math.floor(col.R * 255)
				local g = math.floor(col.G * 255)
				local b = math.floor(col.B * 255)
				HexBox.Text = string.format("%02X%02X%02X", r, g, b)
				SetFlag(Flag, {r, g, b})
				Funcs:FireCallback(Callback, col)
			end
 
			local function Refresh()
				SVArea.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
				SVDot.Position = UDim2.new(S, 0, 1 - V, 0)
				HueCursor.Position = UDim2.new(H, 0, 0.5, 0)
				ApplyColor(Color3.fromHSV(H, S, V))
			end
 
			local function GetInputPos(input)
				return Vector2.new(input.Position.X, input.Position.Y)
			end
 
			local function DragSV(input)
				local abs  = SVArea.AbsolutePosition
				local size = SVArea.AbsoluteSize
				local pos  = GetInputPos(input)
				S = math.clamp((pos.X - abs.X) / size.X, 0, 1)
				V = math.clamp(1 - (pos.Y - abs.Y) / size.Y, 0, 1)
				Refresh()
			end
 
			SVArea.InputBegan:Connect(function(inp)
				local isMouse = inp.UserInputType == Enum.UserInputType.MouseButton1
				local isTouch = inp.UserInputType == Enum.UserInputType.Touch
				if not (isMouse or isTouch) then return end
				DragSV(inp)
				local conn, endConn
				conn = UserInputService.InputChanged:Connect(function(changed)
					if changed.UserInputType == Enum.UserInputType.MouseMovement
					or changed.UserInputType == Enum.UserInputType.Touch then
						DragSV(changed)
					end
				end)
				endConn = UserInputService.InputEnded:Connect(function(ended)
					if ended.UserInputType == inp.UserInputType then
						conn:Disconnect()
						endConn:Disconnect()
					end
				end)
			end)
 
			local function DragHue(input)
				local abs  = HueBar.AbsolutePosition
				local size = HueBar.AbsoluteSize
				local pos  = GetInputPos(input)
				H = math.clamp((pos.X - abs.X) / size.X, 0, 0.999)
				Refresh()
			end
 
			HueBar.InputBegan:Connect(function(inp)
				local isMouse = inp.UserInputType == Enum.UserInputType.MouseButton1
				local isTouch = inp.UserInputType == Enum.UserInputType.Touch
				if not (isMouse or isTouch) then return end
				DragHue(inp)
				local conn, endConn
				conn = UserInputService.InputChanged:Connect(function(changed)
					if changed.UserInputType == Enum.UserInputType.MouseMovement
					or changed.UserInputType == Enum.UserInputType.Touch then
						DragHue(changed)
					end
				end)
				endConn = UserInputService.InputEnded:Connect(function(ended)
					if ended.UserInputType == inp.UserInputType then
						conn:Disconnect()
						endConn:Disconnect()
					end
				end)
			end)
 
			HexBox.FocusLost:Connect(function()
				local hex = HexBox.Text:gsub("#", ""):upper()
				if #hex == 6 then
					local r = tonumber(hex:sub(1, 2), 16)
					local g = tonumber(hex:sub(3, 4), 16)
					local b = tonumber(hex:sub(5, 6), 16)
					if r and g and b then
						H, S, V = Color3.toHSV(Color3.fromRGB(r, g, b))
						Refresh()
					end
				end
			end)
 
			local function ClosePicker()
				if not CPOpen then return end
				CPOpen = false
				CreateTween({PickerFrame, "Size", UDim2.new(0, PANEL_W, 0, 0), 0.2, true})
				PickerFrame.Visible = false
			end
 
			local function OpenPicker()
				if CPOpen then return end
				CPOpen = true
				PANEL_W, PANEL_H = GetPanelSize()
				PositionPanel()
				H, S, V = Color3.toHSV(CurrentColor)
				Refresh()
				PickerFrame.Visible = true
				CreateTween({PickerFrame, "Size", UDim2.new(0, PANEL_W, 0, PANEL_H), 0.25, true})
			end
 
			PickerClose.Activated:Connect(ClosePicker)
 
			MainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
				if not MainFrame.Visible then ClosePicker() end
			end)
 
			Swatch.InputBegan:Connect(function(inp)
				if inp.UserInputType ~= Enum.UserInputType.MouseButton1
				and inp.UserInputType ~= Enum.UserInputType.Touch then return end
				if CPWait then return end
				CPWait = true
				if CPOpen then ClosePicker() else OpenPicker() end
				CPWait = false
			end)
 
			Swatch:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				if CPOpen then PositionPanel() end
			end)
 
			Refresh()
 
			local ColorPickerObj = {}
			function ColorPickerObj:Set(Val1, Val2)
				if typeof(Val1) == "Color3" then
					H, S, V = Color3.toHSV(Val1)
					Refresh()
				elseif type(Val1) == "string" and type(Val2) == "string" then
					LabelFunc:SetTitle(Val1)
					LabelFunc:SetDesc(Val2)
				elseif type(Val1) == "string" then
					LabelFunc:SetTitle(Val1)
				elseif type(Val1) == "function" then
					Callback = {Val1}
				end
			end
			function ColorPickerObj:GetColor() return CurrentColor end
			function ColorPickerObj:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function ColorPickerObj:Destroy()
				ClosePicker()
				Button:Destroy()
				PickerFrame:Destroy()
			end
			return ColorPickerObj
		end
 
		return Tab
	end
 
	CloseButton.Activated:Connect(function() Window:CloseBtn() end)
	MinimizeButton.Activated:Connect(function() Window:MinimizeBtn() end)
	return Window
end
 
return redzlib
				
