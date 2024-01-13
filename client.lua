local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('azqb-admin-vehicles:client:result', function(success, code)
    if success then
        QBCore.Functions.Notify(Lang:t('success.' .. code), 'success')
    else
        QBCore.Functions.Notify(Lang:t('error.' .. code), 'error')
    end
end)
