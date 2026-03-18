repeat task.wait() until game:IsLoaded()
_G.Config = {
    ["Home"] = {},
    ["Main"] = {
        ["Money"] = {
            ["Autofully Claim All Money"] = true
        },
        ["Wheel"] = {
            ["Autofully Claim Wheel"] = true
        }
    },
    ["Shop"] = {
        ["Buy Pack"] = {
            ["Selected Pack To Buy"] = {
                ["Bronze"] = false, ["Silver"] = false, ["Gold"] = false, ["Platinum"] = false, ["Diamond"] = false,
                ["Toxic"] = false,["Shadow"] = false,["Infernal"] = false, ["Corrupted"] = false, ["Cosmic"] = false, 
                ["Eclipse"] = false, ["Hades"] = false, ["Heaven"] = false, ["Chaos"] = false, ["Ordain"] = false,
                ["Alpha"] = false,["Omega"] = false, ["Genesis"] = false, ["Abyssal"] = false 
            },
            ["Autofully Buy Selected Pack"] = true,
            ["Delay To Buy Pack"] = 1
        },
        ["Use Pack"] = {
            ["Selected Pack To Use"] = {
                ["Bronze"] = false, ["Silver"] = false, ["Gold"] = false, ["Platinum"] = false, ["Diamond"] = false,
                ["Toxic"] = false,["Shadow"] = false,["Infernal"] = false, ["Corrupted"] = false, ["Cosmic"] = false, 
                ["Eclipse"] = false, ["Hades"] = false, ["Heaven"] = false, ["Chaos"] = false, ["Ordain"] = false,
                ["Alpha"] = false,["Omega"] = false, ["Genesis"] = false, ["Abyssal"] = false 
            },
            ["Autofully Use Selected Pack"] = true,
            ["Delay To Use Pack"] = 1
        },
        ["Trophy"] = {
            ["Selected Trophy To Craft"] = {
                ["Golden Boot"] = false, ["Champions League"] = false, ["Ballon d'Or"] = false, ["Eternal Crown"] = false
            },
            ["Autofully Craft Selected Trophy"] = true,
            ["Delay To Craft Trophy"] = 1
        }
    },
    ["Miscellaneous"] = {}
}

getgenv().SCRIPT_KEY = "b61c8242-8946-4505-b2d0-23e62c34d98b"
loadstring(Game:HttpGet("https://raw.githubusercontent.com/phatanwr333/script/refs/heads/main/Code/MainLoader.lua"))()
