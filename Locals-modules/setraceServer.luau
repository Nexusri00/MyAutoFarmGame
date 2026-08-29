-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMbBXBhaXJzBXRhYmxlBmluc2VydARzb3J0BmlwYWlycwZzdHJpbmcFbG93ZXIiSW52YWxpZCByYWNlICclcycuIFZhbGlkIHJhY2VzOiAlcwZjb25jYXQCLCAGZm9ybWF0BERhdGEORmluZEZpcnN0Q2hpbGQEUmFjZQJfRwtEYXRhTWFuYWdlcgNTZXQFVmFsdWUETmFtZRdObyB2YWxpZCB0YXJnZXRzIGZvdW5kLhZTZXQgcmFjZSB0byAlcyBmb3I6ICVzB3JlcXVpcmUEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zCFJhY2VEYXRhAAISAwEAABAFAAIFAw8EAwMFMAIDBm0Ccf8DAAAAAAAApAQBAAAAAED7BQAAnwQCBBcEBwCeNAMFBwAAAFIKAwBSCwcApAkEAAAMIICfCQMBbgT4/wIAAACkBAYAABQggFIFAwCfBAIBxgQAAKQFCAAAAHBAUgYDAJ8FAgRRBQwApAoLAAAokIBSCwkAnwoCAqQLCwAAKJCAUgwCAJ8LAgKaCgMACwAAAFIECQBlAAIAbgXz/wIAAIArBAsAbwUMAFIHAgCkCA4AADQggFIJAwBvCg8AnwgDALwFBY0QAAAAnwUAAIIFAAD/BQAAAAAAAKQGCAAAAHBAUgcBAJ8GAgRRBiQAbw0RALwLCgMSAAAAnwsDAg4LHwBvDhMAvAwLAxIAAACfDAMCDgwaAKQNFQAAAEBBTQ0NcBYAAAAODQsApA0VAAAAQEFNDQ1wFgAAAFIPCgBvEBMAUhEEALwNDXMXAAAAnw0FAWUAAgAwBAzsGAAAAE0PCroZAAAAnjQFBA8AAABSDgUApA0EAAAMIICfDQMBbgbb/wIAAIAcBgUADQYDABoAAIBvBhsAggYCAG8GHABSCAQApAkOAAA0IIBSCgUAbwsPAJ8JAwC8BgaNEAAAAJ8GAACCBgAAHQMBBAAAAEADAgMDBAAMIIADBAQAFCCAAwUEAABwQAMGAwcEACiQgAMIAwkEADQggAMKAwsDDAMNAw4DDwQAAEBBAxADEQMSAxMCAAAAAAAAAAADFAMVAAQAARgAAAEAAAAAAQAAAAAAAP8AAwAAAAMBAAAAAAEAAAAAAAAAAAABAf0ABwEAAAAAAAAAAAAAAwACAAAAAAEAAAABAgAAAAEDAAAAAAEAAAAAAAAAAAAAAgADAAAAAAAAAPIAEQAAAQADAAAAAAAAAAAAAAUAAAAAAgAAAQIAEaMAAACkAAEAAAAAQKQBAwAAACBATQEBPwQAAABNAQHoBQAAAE0BAboGAAAATQEB/wcAAACfAAICwAEIABIAAACCAQIACQMWBAAAAEADFwQAACBAAxgDGQMaAxsGAAEAAQABGAABAAAAAAAAAAAAAAAAAgAAAQAAAAABk5Ol6uWZxf5fCUoscQ4koOOLsp6hV8/r

-- https://lua.expert/
local RaceData = require(game.ReplicatedStorage.Modules.Configurations.RaceData)

return function(p1, p2, p3) --[[ Line: 4 | Upvalues: RaceData (copy) ]]
	local list = {}

	for k, v in pairs(RaceData) do
		table.insert(list, k)
	end

	table.sort(list)

	local v1 = nil

	for i, v in ipairs(list) do
		if string.lower(v) == string.lower(p3) then
			v1 = v

			break
		end
	end

	if not v1 then
		return ("Invalid race \'%s\'. Valid races: %s"):format(p3, table.concat(list, ", "))
	end

	local t = {}

	for i, v in ipairs(p2) do
		local Data = v:FindFirstChild("Data")

		if Data then
			local Race = Data:FindFirstChild("Race")

			if Race then
				if _G.DataManager then
					_G.DataManager:Set(v, "Race", v1)
				else
					Race.Value = v1
				end

				table.insert(t, v.Name)
			end
		end
	end

	if #t == 0 then
		return "No valid targets found."
	end

	return ("Set race to %s for: %s"):format(v1, table.concat(t, ", "))
end