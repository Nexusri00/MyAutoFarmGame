-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUBkRldGFjaAxfQmxhemluZ1NvdWwKR2V0UGFzc2l2ZQhSZW5nb2tvaQNWRlgFQXNzZXQGRm9sZGVyBUJsYXplBFRpZXIGQXR0YWNoBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlB01vZHVsZXMOQ29uZmlndXJhdGlvbnMIRmlzaERhdGEGc2NyaXB0BlBhcmVudAdfU2hhcmVkAAIIAgIAAAcEAAAFAgcBIysBBwD7AgAATQIC9QAAAABSAwAAbwQBAJ8CAwGCAAEA+wIBAE0CAl8CAAAAbwMDAJ8CAgJNAgJ+BAAAAPsDAABNAwNGBQAAAE0EAogGAAAATQUCiAcAAABNBgKLCAAAAJ8DBAIrAwEAggABAPsEAABNBARUCQAAAFIFAwBSBgAAbwcBAJ8EBAGCAAEACgMBAwIDAwMEAwUDBgMHAwgDCQMKABgIARgAAQAAAAAAAQMAAAAAAAABAAAAAAAAAAAAAQACAAAAAAAAARkAAAAABQAAAQIAIaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAOgGAAAATQICugcAAABNAgKhCAAAAJ8BAgKkAgUAAABAQKQDCgAAAJBATQMDJAsAAABNAwNGDAAAAJ8CAgL/AwEAAAAAAMAEDQASAAIAEgABADAEA4gOAAAAggMCAA8DCwQAAABAAwwDDQMOBAAAQEADDwMQAxEDEgQAAJBAAxMDFAYAAwgBAAEAARgABAAAAAAABAAAAAAAAAAAAQAAAAAAAAAABAAKAAAAAA0BAAAAAAEy5cl0oYiBwUolT3q2sk7uQv3eAAAho3U=

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Blaze = function(p1, p2) --[[ Blaze | Line: 24 | Upvalues: _Shared (copy), FishData (copy) ]]
		if not p2 then
			_Shared.Detach(p1, "_BlazingSoul")

			return
		end

		local VFX = FishData.GetPassive("Rengokoi").VFX
		local v1 = _Shared.Asset(VFX.Folder, VFX.Blaze, VFX.Tier)

		if v1 then
			_Shared.Attach(v1, p1, "_BlazingSoul")
		end
	end
}