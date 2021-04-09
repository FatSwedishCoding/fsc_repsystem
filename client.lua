local stuff = {
	}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
-- MADE BY MAKKI3 IN FSC
-- VERSION 1.0
-- 2021-04-09 LAST UPDATE
-- 2021-04-09 LAST UPDATE
