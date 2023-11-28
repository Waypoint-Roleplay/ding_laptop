local QBCore = exports['qb-core']:GetCoreObject()

local laptopItem = nil

RegisterNetEvent('laptop:client:openUI', function(item)
    laptopItem = item
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openLaptop",
        item = laptopItem
    })
end)

closeLaptop = function()
    SetNuiFocus(false, false)
end

local openRacingApp = function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then 
            TriggerEvent("rahe-racing:client:openTablet")
        else
            QBCore.Functions.Notify("USB not detected", "error")
        end
    end, 'racingusb')
end

local openBoostingApp = function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then 
            TriggerEvent("qb-carboosting:client:UseLaptop")
        else 
            QBCore.Functions.Notify("USB not detected", "error")
        end
    end, 'boostingusb')
end

RegisterNUICallback('closeLaptop', closeLaptop)

RegisterNUICallback('openRacingApp', openRacingApp)

RegisterNUICallback('openBoostingApp', openBoostingApp)

RegisterNUICallback('fetchExperienceAppData', function(_data, cb)
    QBCore.Functions.TriggerCallback('laptop:server:fetchExperienceAppData', function(data)

        cb(data)
    end)
end)

RegisterNUICallback('SaveLaptopBackground', function(data)
    local background = data.background
    TriggerServerEvent('ding_laptop:server:SaveLaptopBackground', laptopItem, background)
end)
-- Zones for the "Elevators"
for k, v in pairs(Config.Entrances) do
    exports['qb-target']:AddBoxZone(v.zoneName .. k, v.coords, v.length, v.width, {
        name = v.zoneName .. k,
        debugPoly = false,
        minZ = v.coords.z-1,
        maxZ = v.coords.z+1,
        heading = v.heading,
    },{
        options = {
            {
                event = "ding_laptop:client:teleportUp",
                icon = "fas fa-arrow-circle-up",
                label = "Take the Elevator Up",
                key = k,
            }
        },
        distance = 2.0
    })
end

for k, v in pairs(Config.Exits) do
    exports['qb-target']:AddBoxZone(v.zoneName .. k, v.coords, v.length, v.width, {
        name = v.zoneName .. k,
        debugPoly = false,
        minZ = v.coords.z-1,
        maxZ = v.coords.z+1,
        heading = v.heading, 
    },{
        options = {
            {
                event = "ding_laptop:client:teleportDown",
                icon = "fas fa-arrow-circle-down",
                label = "Take the Elevator Down",
                key = k,
            }
        },
        distance = 2.0
    })
end
-- Teleport event (universal for going up and down)
RegisterNetEvent('ding_laptop:client:teleportUp', function(args)
    enterClitOffice(args.key)
end)

RegisterNetEvent('ding_laptop:client:teleportDown', function(args)
    exitClitOffice(args.key)
end)

-- function for entering building(universal, just add new location to config)(key is the office key from the key value pairs from config)
function enterClitOffice(key)
    local ped = PlayerPedId()

    Wait(500)
    DoScreenFadeOut(250)
    Wait(250)
    SetEntityCoords(ped, Config.Exits[key].coords.x, Config.Exits[key].coords.y, Config.Exits[key].coords.z)
    SetEntityHeading(ped, Config.Exits[key].heading)
    Wait(1000)
    DoScreenFadeIn(250)
end
-- function for exiting building(universal, just add new location to config)(key is the office key from the key value pairs from config)
function exitClitOffice(key)
    local ped = PlayerPedId()

    Wait(500)
    DoScreenFadeOut(250)
    Wait(250)
    SetEntityCoords(ped, Config.Entrances[key].coords.x, Config.Entrances[key].coords.y,Config.Entrances[key].coords.z)
    SetEntityHeading(ped, Config.Entrances[key].heading)
    Wait(1000)
    DoScreenFadeIn(250)
end