local Config = require('config')

AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
    -- Check if the item is in the Config.Items table
    if Config.Items[name] then
        TriggerClientEvent('yourserver:drinkWater', playerId, name)
    end
end)
