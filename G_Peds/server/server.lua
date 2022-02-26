ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('G_Peds:Perm', function(source, perm)
	local group = ESX.GetPlayerFromId(source).getGroup()
	perm(group)
end)