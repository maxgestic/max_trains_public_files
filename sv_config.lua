Config.CivJob = "civ"
Config.IsItemNeeded = false
Config.NeededItem = "Train License"
Config.UseBuiltInPay = true
Config.PayInterval = 10 -- seconds between pay with built in pay
Config.PayAmountTrain = 1000 -- amount of pay each time player gets payed as train driver
Config.PayAmountMetro = 1000 -- amount of pay each time player gets payed as metro driver
Config.TrainTicketCost = 100
Config.MetroTicketCost = 50
Config.CustomCheck = false -- if you want a server side custom check that permits clockin in
Config.MapUpdateInterval = 1
local internalJobTable = {} -- only for testing purposes server should not use as its main job system

Config.Functions = {
	getMoney = function(source)
		-- server side check money of player
		-- return amount of money (int) to check against
		return 1000
	end,
	removeMoney = function(source, amount)
		-- server side remove money from player
	end,
	addMoney = function(source, amount)
		-- server side add money to player
	end,
	getPlayerId = function(source)
		-- server side function to get a player identifier
		local steamid  = false

		for k,v in pairs(GetPlayerIdentifiers(source))do
	      	if string.sub(v, 1, string.len("steam:")) == "steam:" then
	        	steamid = v
	        end
		end

		return steamid
	end,
	getJob = function(source)
		-- server side function to get players job
		return internalJobTable[source]
	end,
	setJob = function(source, job)
		-- server side function to set players job
		internalJobTable[source] = job
	end,
	checkNeededItem = function(source)
		-- server side function to check players inventory
		-- return true or false if item is found
		return true
	end,
	customCheck = function(source, job)
		-- server side function to check if a player is able to clock in or not return true if, permitted false if not
		-- source is player id and job is either train or metro
		return true
	end
}