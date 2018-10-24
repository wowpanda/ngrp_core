--[[
 _   _  _____ _____  _____  _____  _      
 | \ | |/ ____|  __ \|  __ \|  __ \| |     
 |  \| | |  __| |__) | |__) | |__) | |     
 | . ` | | |_ |  _  /|  ___/|  ___/| |     
 | |\  | |__| | | \ \| |_   | |    | |____ 
 |_| \_|\_____|_|  \_\_(_)  |_|    |______|                                      

Author: Ezi
Version: 0.1
]]--


local function countPlayer() -- count all players
	local counter = 0
	for _ in pairs(GetPlayers()) do
		counter = counter + 1
	end
	return counter
end

RegisterServerEvent('ngrp_solosession:PlayerNumber')
AddEventHandler('ngrp_solosession:PlayerNumber', function(clientPlayerNumber)
	if source ~= nil then
		serverPlayerNumber = countPlayer()
		if serverPlayerNumber-clientPlayerNumber > 1 then 
			DropPlayer(source, '[NGRP] Solo session detected! Reconnect to the server!') -- Kick player
			print("ngrp_solosession:PlayerNumber clientPlayerNumber-"..clientPlayerNumber.." serverPlayerNumber-"..serverPlayerNumber) -- Debug
		end
	end
end)

TriggerEvent('es:addCommand', 'k', function(source, args, user)
	TriggerClientEvent('KneelHU', source, {})
end, {help = "Get down on your knees and put your hands on your head"})