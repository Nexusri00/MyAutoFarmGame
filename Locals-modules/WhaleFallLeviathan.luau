-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMeCkdldFBhc3NpdmUUV2hhbGUtRmFsbCBMZXZpYXRoYW4DVkZYBXZmeE9mBkRldGFjaAhfQmlvbWFzcwlQcmltYXJ5T2YFQXNzZXQGRm9sZGVyB0Jpb21hc3MEVGllcgZBdHRhY2gNX0FieXNzYWxCbG9vbQRBdXJhB1NwYXduQXQFRGVjYXkGQ0ZyYW1lA25ldwhQb3NpdGlvbghMaWZldGltZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zCEZpc2hEYXRhBnNjcmlwdAZQYXJlbnQHX1NoYXJlZAAFAgABAAAACPsAAABNAABfAAAAAG8BAQCfAAICTQAAfgIAAACCAAIAAwMBAwIDAwAjBAEYAAAAAAAAAAAkAAAAAAsCAgAABwQAAAUCBwEsKwEHAPsCAABNAgL1AAAAAFIDAABvBAEAnwIDAYIAAQD7AgAATQICEgIAAABSAwAAnwICAisCAQCCAAEA+wMBAE0DA18DAAAAbwQEAJ8DAgJNAwN+BQAAAPsEAABNBARGBgAAAE0FA4gHAAAATQYDMwgAAABNBwOLCQAAAJ8EBAIrBAEAggABAPsFAABNBQVUCgAAAFIGBABSBwAAbwgBAMYJAABSCgIAnwUGAYIAAQALAwUDBgMHAwEDAgMDAwgDCQMKAwsDDAArCgEYCAEAAAAAAAEDAAAAAAEA8gAAAAAAABEAAAAAAAAAAAABAAIAAAAAAAAAAAEkAAAAAAgCAgAABwQAAAUCBwEjKwEHAPsCAABNAgL1AAAAAFIDAABvBAEAnwIDAYIAAQD7AgEATQICXwIAAABvAwMAnwICAk0CAn4EAAAA+wMAAE0DA0YFAAAATQQCiAYAAABNBQLrBwAAAE0GAosIAAAAnwMEAisDAQCCAAEA+wQAAE0EBFQJAAAAUgUDAFIGAABvBwEAnwQEAYIAAQAKAwUDDQMBAwIDAwMIAwkDDgMLAwwAPg4BGBsBAAAAAAAB4wAAAAAAACEAAAAAAAAAAAABAAIAAAAAAAABJAAAAAAJAQIAAAYDAAAFAQcg+wEAAE0BARIAAAAAUgIAAJ8BAgIrAQEAggABAPsCAQBNAgJfAQAAAG8DAgCfAgICTQICfgMAAAD7AwAATQMDNAQAAABNBAKIBQAAAE0FAiUGAAAApAYJAAAgcIBNBwE7CgAAAJ8GAgJNBwLLCwAAAE0IAosMAAAAnwMGAYIAAQANAwcDAQMCAwMDDwMJAxADEQMSBAAgcIADEwMUAwsATRABGCoAAAAAAQDVAAAAAAAALgAAAAAAAAAAAAAAAAAAAAABJAAAAAAGAAABAgAtowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIA6AYAAABNAgK6BwAAAE0CAqEIAAAAnwECAqQCBQAAAEBApAMKAAAAkEBNAwMkCwAAAE0DA0YMAAAAnwICAv8DAwAAAAAAwAQNABIAAQDABQ4AEgACABIAAQAwBQMzDwAAAMAFEAASAAIAEgABADAFA+sRAAAAwAUSABIAAgASAAEAMAUDJRMAAACCAwIAFAMVBAAAAEADFgMXAxgEAABAQAMZAxoDGwMcBAAAkEADHQMeBgAGAQMKBgIDDgYDAxAEAAECAwEAARgAEQAAAAAABAAAAAAAAAAAAQAAAAAAAAAABAAIAAgAAAAAEwAAAAAPAAAAAAgBAAAAAATuxOmQZvX2/tP0r3Qea10Mntz+5NwAg5E=

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)
local t = {}

local function vfxOf() --[[ vfxOf | Line: 35 | Upvalues: FishData (copy) ]]
	return FishData.GetPassive("Whale-Fall Leviathan").VFX
end

function t.Biomass(p1, p2) --[[ Biomass | Line: 43 | Upvalues: _Shared (copy), FishData (copy) ]]
	if not p2 then
		_Shared.Detach(p1, "_Biomass")

		return
	end

	local v1 = _Shared.PrimaryOf(p1)

	if not v1 then
		return
	end

	local VFX = FishData.GetPassive("Whale-Fall Leviathan").VFX
	local v2 = _Shared.Asset(VFX.Folder, VFX.Biomass, VFX.Tier)

	if v2 then
		_Shared.Attach(v2, p1, "_Biomass", nil, v1)
	end
end
function t.Aura(p1, p2) --[[ Aura | Line: 62 | Upvalues: _Shared (copy), FishData (copy) ]]
	if not p2 then
		_Shared.Detach(p1, "_AbyssalBloom")

		return
	end

	local VFX = FishData.GetPassive("Whale-Fall Leviathan").VFX
	local v1 = _Shared.Asset(VFX.Folder, VFX.Aura, VFX.Tier)

	if v1 then
		_Shared.Attach(v1, p1, "_AbyssalBloom")
	end
end
function t.Decay(p1) --[[ Decay | Line: 77 | Upvalues: _Shared (copy), FishData (copy) ]]
	local v1 = _Shared.PrimaryOf(p1)

	if v1 then
		local VFX = FishData.GetPassive("Whale-Fall Leviathan").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.Decay, CFrame.new(v1.Position), VFX.Lifetime, VFX.Tier)
	end
end

return t