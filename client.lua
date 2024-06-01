RegisterNetEvent('yourserver:drinkWater')
AddEventHandler('yourserver:drinkWater', function(item)
    -- Check if the item is in the Config.Items table
    if config.Items[item] then
        -- Start the drunk walking animation
        RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
        while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
            Citizen.Wait(0)
        end
        SetPedMovementClipset(PlayerPedId(), "MOVE_M@DRUNK@VERYDRUNK", 1.0)

        -- Start the screen effect
        StartScreenEffect('DrugsMichaelAliensFightIn', 0, true)
        StartScreenEffect('Rampage', 0, true)
        SetCamEffect(1)

        -- Stop the screen effect and reset the walking animation after the specified duration
        Citizen.SetTimeout(config.Items[item], function()
            ResetPedMovementClipset(PlayerPedId(), 0)
            StopScreenEffect('DrugsMichaelAliensFightIn')
            StopScreenEffect('Rampage', 0, true)
            SetCamEffect(0)
        end)
    end
end)
