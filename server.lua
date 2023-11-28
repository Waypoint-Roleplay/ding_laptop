QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("minipad", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('laptop:client:openUI', source, item)
end, false)

QBCore.Functions.CreateCallback("laptop:server:fetchExperienceAppData", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local citizenId = Player.PlayerData.citizenid

    MySQL.Async.fetchSingle('SELECT experience FROM players WHERE citizenid = ?', {citizenId}, function(result)
        cb(result.experience)
    end)
end)

RegisterNetEvent('ding_laptop:server:SaveLaptopBackground', function(laptopItem, backgroundImageUrl)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playerInventory = Player.PlayerData.items
    --Gets items from player inventory, then the slot where the laptop is used from, then updates the background image to whats passed through
    if playerInventory[laptopItem.slot] then
        playerInventory[laptopItem.slot].info.backgroundImage = backgroundImageUrl -- this is what passes the new background image
        Player.Functions.SetInventory(playerInventory, true) -- this updates the inventory with the new item data
    end

end)