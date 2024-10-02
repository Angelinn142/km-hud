local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('hud:server:UpdateMoney')
AddEventHandler('hud:server:UpdateMoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.Functions.GetMoney('cash')
    local bank = Player.Functions.GetMoney('bank')
    TriggerClientEvent('hud:client:UpdateMoney', src, cash, bank)
end)
