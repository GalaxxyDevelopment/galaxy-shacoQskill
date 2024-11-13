function sescal()
    SendNUIMessage({
        type = 'sescal'
    })
end

local shacogibiananisikims = false

function startduryavrubekle(seconds)
    shacogibiananisikims = true

    SendNUIMessage({
        type = 'beklemesuresibaslat',
        duration = seconds
    })

    Wait(seconds * 1000)
    shacogibiananisikims = false
end

CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 44) then
            if not shacogibiananisikims then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local forwardVector = GetEntityForwardVector(playerPed) * 10
                local teleportCoords = playerCoords + forwardVector

                SetEntityCoords(playerPed, teleportCoords.x, teleportCoords.y, teleportCoords.z - 1, false, false, false, true)

                sescal()

                SetEntityAlpha(playerPed, 128, false)
                SetEntityVisible(playerPed, true, false)
                Wait(5000)
                ResetEntityAlpha(playerPed)

                startduryavrubekle(15)
            end
        end
    end
end)

local correctScriptName = "galaxy-shacoQskill"

AddEventHandler('onResourceStart', function(resourceName)

    if resourceName == GetCurrentResourceName() then
        if resourceName ~= correctScriptName then
            print(string.format("^1HATA: Bu scriptin adını değiştiremezsiniz! Doğru ad: '%s'^7", correctScriptName))

            os.exit()
        else
            print(string.format("^2Başarı: Script adı doğru, '%s' adıyla başlatılıyor.^7", correctScriptName))
        end
    end
end)