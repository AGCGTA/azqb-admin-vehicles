local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("gogarage", Lang:t("commands.gogarage_description"), { { name = 'plate', help = 'Plate' } }, true, function(source, args)
    local plate = args[1]:upper()
    local query = MySQL.query.await('SELECT * FROM player_vehicles WHERE plate = ?', {plate})
    local record = query[1]
    if record == nil then
        TriggerClientEvent('azqb-admin-vehicles:client:result', source, false, 'plate_notfound')
        return
    end
    if record.state == 1 then
        TriggerClientEvent('azqb-admin-vehicles:client:result', source, false, 'already_in_garage')
        return
    end
    MySQL.update('UPDATE player_vehicles SET state = 1 WHERE plate = ?', { plate })
    TriggerClientEvent('azqb-admin-vehicles:client:result', source, true, 'sended_garage')
end, 'admin')
