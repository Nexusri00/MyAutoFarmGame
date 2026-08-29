-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUBkRldGFjaBBfVW5pdmVyc2FsRW5lcmd5CkdldFBhc3NpdmUWU3Bpcml0Ym9tYiBBbmdsZXIgRmlzaANWRlgFQXNzZXQGRm9sZGVyBEF1cmEEVGllcgZBdHRhY2gEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUHTW9kdWxlcw5Db25maWd1cmF0aW9ucwhGaXNoRGF0YQZzY3JpcHQGUGFyZW50B19TaGFyZWQAAggCAgAABwQAAAUCBwEjKwEHAPsCAABNAgL1AAAAAFIDAABvBAEAnwIDAYIAAQD7AgEATQICXwIAAABvAwMAnwICAk0CAn4EAAAA+wMAAE0DA0YFAAAATQQCiAYAAABNBQLrBwAAAE0GAosIAAAAnwMEAisDAQCCAAEA+wQAAE0EBFQJAAAAUgUDAFIGAABvBwEAnwQEAYIAAQAKAwEDAgMDAwQDBQMGAwcDCAMJAwoAGQgBGAABAAAAAAABAwAAAAAAAAEAAAAAAAAAAAABAAIAAAAAAAABGgAAAAAFAAABAgAhowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIA6AYAAABNAgK6BwAAAE0CAqEIAAAAnwECAqQCBQAAAEBApAMKAAAAkEBNAwMkCwAAAE0DA0YMAAAAnwICAv8DAQAAAAAAwAQNABIAAgASAAEAMAQD6w4AAACCAwIADwMLBAAAAEADDAMNAw4EAABAQAMPAxADEQMSBAAAkEADEwMUBgADCAEAAQABGAAEAAAAAAAEAAAAAAAAAAABAAAAAAAAAAAEAAsAAAAADQEAAAAAAeuDqd64yzdSyorZ3+8hebabm76q2UfD3w==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Aura = function(p1, p2) --[[ Aura | Line: 25 | Upvalues: _Shared (copy), FishData (copy) ]]
		if not p2 then
			_Shared.Detach(p1, "_UniversalEnergy")

			return
		end

		local VFX = FishData.GetPassive("Spiritbomb Angler Fish").VFX
		local v1 = _Shared.Asset(VFX.Folder, VFX.Aura, VFX.Tier)

		if v1 then
			_Shared.Attach(v1, p1, "_UniversalEnergy")
		end
	end
}