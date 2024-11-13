RegisterNetEvent('teleport:MuzikiBaslat')
AddEventHandler('teleport:MuzikiBaslat', function(coords)
    TriggerClientEvent('teleport:MuzikiBaslatAtCoords', -1, coords)
end)
