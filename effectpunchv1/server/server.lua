Framework = nil
TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

Framework.Functions.CreateUseableItem(Config['ItemName'], function(source) 
	TriggerClientEvent('fashion:smokepurplepunchv2', source)
end)
