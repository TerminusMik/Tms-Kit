ESX = nil
CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Wait(10)
        while ESX.GetPlayerData().job == nil do Wait(10) end

        if ESX.IsPlayerLoaded() then 
            ESX.PlayerData = ESX.GetPlayerData() 
        end
    end
end)


local MenuOpen = false
local AchatKit = RageUI.CreateMenu("Magasin Mécano", "Achat de Kit de Réparation")
AchatKit:SetRectangleBanner(42, 48, 48, 255)


AchatKit.Closed = function()
    MenuOpen = false
end

function MenuKit()
    if MenuOpen then
        MenuOpen = false
        RageUI.Visible(AchatKit, false)
    else
        MenuOpen = true
        RageUI.Visible(AchatKit, true)
        CreateThread(function()
            while MenuOpen do
                Wait(0)
                RageUI.IsVisible(AchatKit, function()
                    RageUI.Button("Kit de réparation", nil, { RightLabel = "~g~250$" },true, {
                        onSelected = function()
                            TriggerServerEvent("Tms:AchatKit")
                        end
                    });
                end)

        
            end
        end)
    end
end




local achatkit = {
    {pos = vector3(-232.50, -1310.83, 30.30)}, --point vente
}  



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local spam = false
        for _,v in pairs(achatkit) do
            if #(pCoords - v.pos) < 2 then
                spam = true
                HelpNotification("Appuyez sur [~b~E~w~] pour acheter un kit")
                DrawMarker(27, -232.50, -1310.83, 29.30+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 255, 255, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                if IsControlJustReleased(0, 51) then
                    MenuMadrazo()
                end                
            elseif #(pCoords - v.pos) < 1.3 then
                spam = false           
            end
        end
    end
end)

function HelpNotification(msg)
    AddTextEntry('HelpNotification', msg)
    DisplayHelpTextThisFrame('HelpNotification', false)
end