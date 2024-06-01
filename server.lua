-- Make sure to require the config file at the top of your server.lua

AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
    -- Check if the item is in the Config.Items table
    if config.Items[name] then
        TriggerClientEvent('yourserver:drinkWater', playerId, name)
    end
end)
