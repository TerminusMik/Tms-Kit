ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterNetEvent('Tms:AchatKit')
AddEventHandler('Tms:AchatKit', function()
    local item = "fixkit"
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 250
    local xMoney = xPlayer.getMoney()
    local limiteitem = 5
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count


    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Vous trop de kit sur vous !")
    else
        if xMoney >= price then
            xPlayer.removeMoney(price)
            xPlayer.addInventoryItem(item, 1)
            TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ un ~r~Kit de Réparation~w~")
        else
            TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
        end
    end
end)
