local QBCore = exports['qb-core']:GetCoreObject()

local playerData = {}
local playerJob = {}
local hudVisible = true -- Variable para rastrear si el HUD está visible o no

-- Actualizar los datos del jugador cuando se une
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    playerData = QBCore.Functions.GetPlayerData()
    playerJob = playerData.job

    -- Enviar información de trabajo al NUI
    SendNUIMessage({
        action = "updateJob",
        job = playerJob.label,
        grade = playerJob.grade.name
    })

    -- Enviar información de dinero al NUI
    SendNUIMessage({
        action = "updateMoney",
        cash = playerData.money['cash'],
        bank = playerData.money['bank']
    })
end)

-- Actualizar el trabajo cuando cambia
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    playerJob = job
    SendNUIMessage({
        action = "updateJob",
        job = playerJob.label,
        grade = playerJob.grade.name
    })
end)

-- Escuchar cuando se actualiza el dinero (Efectivo o Banco)
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    if val.money then
        SendNUIMessage({
            action = "updateMoney",
            cash = val.money['cash'],
            bank = val.money['bank']
        })
    end
end)

-- Este hilo actualizará el dinero cada 5 segundos (por si acaso)
Citizen.CreateThread(function()
    while true do
        if hudVisible then
            local playerData = QBCore.Functions.GetPlayerData()
            SendNUIMessage({
                action = "updateMoney",
                cash = playerData.money['cash'],
                bank = playerData.money['bank']
            })
        end
        Citizen.Wait(5000) -- Espera de 5 segundos antes de actualizar de nuevo
    end
end)

-- Comando para ocultar o mostrar el HUD
RegisterCommand('zshud', function()
    hudVisible = not hudVisible -- Cambia el estado del HUD (visible/invisible)
    if hudVisible then
        SendNUIMessage({ action = "showHud" })
        QBCore.Functions.Notify("HUD activado", "success")
    else
        SendNUIMessage({ action = "hideHud" })
        QBCore.Functions.Notify("HUD desactivado", "error")
    end
end, false)
