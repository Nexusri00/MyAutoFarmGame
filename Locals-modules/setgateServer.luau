-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTBmlwYWlycwREYXRhDkZpbmRGaXJzdENoaWxkAl9HC0RhdGFNYW5hZ2VyC0dhdGVkQWNjZXNzA1NldAlCb29sVmFsdWUDSXNBBVZhbHVlBE5hbWUFdGFibGUGaW5zZXJ0F05vIHZhbGlkIHRhcmdldHMgZm91bmQuHVNldCBHYXRlZEFjY2VzcyB0byAlcyBmb3I6ICVzCHRvc3RyaW5nBmNvbmNhdAIsIAZmb3JtYXQAAg8DAAAADAUAAQUDDwQBAwRCAkb/AwAAAAAAAKQEAQAAAABAUgUBAJ8EAgRRBCkAbwsCALwJCAMDAAAAnwkDAg4JJACkCgUAAABAQE0KCnAGAAAADgoLAKQKBQAAAEBATQoKcAYAAABSDAgAbw0HAFIOAgC8CgpzCAAAAJ8KBQFlAAwAbwwHALwKCQMDAAAAnwoDAg4KBwBvDQkAvAsK/goAAACfCwMCDgsCADACCuwLAAAATQwIugwAAACeNAMEDAAAAFILAwCkCg8AADjQgJ8KAwFuBNb/AgAAgBwEAwANBAMAEAAAgG8EEQCCBAIAbwQSALs/AgNSBwIApAYUAAAAMEGfBgICpAcWAABU0IBSCAMAbwkXAJ8HAwC8BASNGAAAAJ8EAACCBAAAGQMBBAAAAEADAgMDAwQEAABAQAMFAwYDBwMIAwkDCgMLAwwDDQQAONCAAgAAAAAAAAAAAw4DDwMQBAAAMEEDEQQAVNCAAxIDEwADAAEYAAACAAAAAAEAAAABAgAAAAABAAAAAAAAAAAAAAIAAAABAAAAAAABAAQAAAAAAAAA8wAQAAABAAMAAAAAAAAAAAAAAAAAAAQAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAACAAEAAAAAARFBSwCGkxfMwrrCJYZmsIthWVx0I4UhAQ==

-- https://lua.expert/
return function(p1, p2, p3) --[[ Line: 3 ]]
	local t = {}

	for i, v in ipairs(p2) do
		local Data = v:FindFirstChild("Data")

		if Data then
			if _G.DataManager then
				_G.DataManager:Set(v, "GatedAccess", p3)
			else
				local GatedAccess = Data:FindFirstChild("GatedAccess")

				if GatedAccess and GatedAccess:IsA("BoolValue") then
					GatedAccess.Value = p3
				end
			end

			table.insert(t, v.Name)
		end
	end

	if #t == 0 then
		return "No valid targets found."
	end

	return ("Set GatedAccess to %s for: %s"):format(tostring(p3), table.concat(t, ", "))
end