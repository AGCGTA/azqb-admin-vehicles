local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('azqb-admin-vehicles:client:result', function(success, code)
    if success then
        QBCore.Functions.Notify(Lang:t('success.' .. code), 'success')
    else
        QBCore.Functions.Notify(Lang:t('error.' .. code), 'error')
    end
end)

RegisterNetEvent('azqb-admin-vehicles:Command:removeingamecar', function(plate)
    local vehicles = QBCore.Functions.GetVehicles()
    local deleted = false
    for _, v in pairs(vehicles) do
        if plate == GetVehicleNumberPlateText(v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteVehicle(v)
            deleted = true
        end
    end
    if deleted then
        QBCore.Functions.Notify(Lang:t('success.removed_ingame_car'), 'success')
    else
        QBCore.Functions.Notify(Lang:t('error.ingame_car_notfound'), 'error')
    end
end)