QBCore items.lua stuff

Dont forget to change the image name for whichever one you use for that item. 

["boostingusb"] 				= {["name"] = "boostingusb", 			    ["label"] = "Blue USB", 				["weight"] = 1, 		["type"] = "item", 		["image"] = "boostingusb.png", 	["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = "Plug this in at your own risk."},

["racingusb"] 				 	= {["name"] = "racingusb", 			    	["label"] = "Pink USB", 				["weight"] = 1, 		["type"] = "item", 		["image"] = "racingusb.png", 	["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = "Plug this in at your own risk."},

["minipad"] 				 	= {["name"] = "minipad", 			    	["label"] = "Clit Laptop", 				["weight"] = 1, 		["type"] = "item", 		["image"] = "minipad.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil, ["description"] = "Laptop produced by Clit Operating Systems"},


qb-shops config.lua stuff

    ["clit"] = {
        [1] = {
            name = "minipad",
            price = 5000,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "phone",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "fitbit",
            price = 2000,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "radio",
            price = 5000,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
    },

    ["hidden"] = {
        [1] = {
            name = "boostingusb",
            price = 5000,
            amount = 50,
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "racingusb",
            price = 5000,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },

     ["clit"] = {
        ["label"] = "Clit",
        ["coords"] = vector4(-1531.05, -402.97, 35.64, 226.39),
        ["ped"] = 'cs_lifeinvad_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-laptop",
        ["targetLabel"] = "Open Clit Store",
        ["products"] = Config.Products["clit"],
        ["showblip"] = true,
        ["blipsprite"] = 384,
        ["blipcolor"] = 0
    },

      ["hidden"] = {
        ["label"] = "Talk to Sex Worker",
        ["coords"] = vector4(-69.6, -827.98, 285.0, 248.71),
        ["ped"] = 'mp_f_stripperlite',
        ["scenario"] = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-female",
        ["targetLabel"] = "Open Sex Worker Store",
        ["products"] = Config.Products["hidden"],
        ["showblip"] = false,
        ["blipsprite"] = 384,
        ["blipcolor"] = 0
    },
    ["hidden2"] = {
        ["label"] = "Talk to Sex Worker",
        ["coords"] = vector4(-797.79, 336.05, 191.39, 359.17),
        ["ped"] = 'mp_f_stripperlite',
        ["scenario"] = "WORLD_HUMAN_SUNBATHE",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-female",
        ["targetLabel"] = "Open Sex Worker Store",
        ["products"] = Config.Products["hidden"],
        ["showblip"] = false,
        ["blipsprite"] = 384,
        ["blipcolor"] = 0
    },
    ["hidden3"] = {
        ["label"] = "Talk to Sex Worker",
        ["coords"] = vector4(931.36, -2999.23, -47.95, 359.17),
        ["ped"] = 'mp_f_stripperlite',
        ["scenario"] = "WORLD_HUMAN_SUNBATHE",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-female",
        ["targetLabel"] = "Open Sex Worker Store",
        ["products"] = Config.Products["hidden"],
        ["showblip"] = false,
        ["blipsprite"] = 384,
        ["blipcolor"] = 0
    },
    ["hidden4"] = {
        ["label"] = "Talk to Sex Worker",
        ["coords"] = vector4(896.15, -3245.83, -98.25, 359.17),
        ["ped"] = 'mp_f_stripperlite',
        ["scenario"] = "WORLD_HUMAN_SUNBATHE",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-female",
        ["targetLabel"] = "Open Sex Worker Store",
        ["products"] = Config.Products["hidden"],
        ["showblip"] = false,
        ["blipsprite"] = 384,
        ["blipcolor"] = 0
    },