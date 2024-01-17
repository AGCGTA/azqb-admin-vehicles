local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("gogarage", Lang:t("command.gogarage.help"), { { name = Lang:t("command.gogarage.params.plate.name"), help = Lang:t("command.gogarage.params.plate.help") } }, true, function(source, args)
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
    TriggerClientEvent('azqb-admin-vehicles:Command:removeingamecar', source, plate)
    MySQL.update('UPDATE player_vehicles SET state = 1 WHERE plate = ?', { plate })
    TriggerClientEvent('azqb-admin-vehicles:client:result', source, true, 'sended_garage')
end, 'admin')

QBCore.Commands.Add("removeingamecar", Lang:t("command.removeingamecar.help"), { { name = Lang:t("command.removeingamecar.params.plate.name"), help = Lang:t("command.removeingamecar.params.plate.help") } }, true, function(source, args)
    local plate = args[1]:upper()
    TriggerClientEvent('azqb-admin-vehicles:Command:removeingamecar', source, plate)
end, 'admin')
