ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("zmrentacar:checkMoney")
AddEventHandler("zmrentacar:checkMoney", function(name,number)
    local src = source
    local user = ESX.GetPlayerFromId(src)

    local car_price = config.cars[number].car_price
    local car_name = name
    
    local bank = user.getAccount('bank').money

    if bank >= car_price then
      user.removeAccountMoney('bank', car_price)
      TriggerEvent('Notification',"Car has been rented for $"..car_price)
        TriggerClientEvent('zm-rentacar:rentcar',source, car_name)
    else
      TriggerEvent('Notification',"You dont have enough money..")
    end
    

end)
