-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMbEEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQKR2V0UGFzc2l2ZQ9TaGFua3MgU3R1cmdlb24DVkZYB1NwYXduQXQGRm9sZGVyCUNvbnF1ZXJvcgZDRnJhbWUITGlmZXRpbWUEVGllcgdSZWxlYXNlBkRldGFjaA9fQ29ucXVlcm9yc1RpZGUFQXNzZXQEQXVyYQZBdHRhY2gEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUHTW9kdWxlcw5Db25maWd1cmF0aW9ucwhGaXNoRGF0YQZzY3JpcHQGUGFyZW50B19TaGFyZWQAAwkBAgAABgMAAAUBBxxvAwAAvAEAAwEAAACfAQMCKwEBAIIAAQD7AgAATQICXwIAAABvAwMAnwICAk0CAn4EAAAA+wMBAE0DAzQFAAAATQQCiAYAAABNBQItBwAAAE0GAYUIAAAATQcCywkAAABNCAKLCgAAAJ8DBgGCAAEACwMBAwIDAwMEAwUDBgMHAwgDCQMKAwsAFgwBGAAAAAABAAIAAAAAAAABAAAAAAAAAAAAAAAAAAEXAAAAAAgCAgAABwQAAAUCBwEjKwEHAPsCAABNAgL1AAAAAFIDAABvBAEAnwIDAYIAAQD7AgEATQICXwIAAABvAwMAnwICAk0CAn4EAAAA+wMAAE0DA0YFAAAATQQCiAYAAABNBQLrBwAAAE0GAosIAAAAnwMEAisDAQCCAAEA+wQAAE0EBFQJAAAAUgUDAFIGAABvBwEAnwQEAYIAAQAKAw0DDgMDAwQDBQMPAwcDEAMLAxEAIRABGAABAAAAAAABAwAAAAAAAAEAAAAAAAAAAAABAAIAAAAAAAABIgAAAAAFAAABAgAmowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIA6AYAAABNAgK6BwAAAE0CAqEIAAAAnwECAqQCBQAAAEBApAMKAAAAkEBNAwMkCwAAAE0DA0YMAAAAnwICAv8DAgAAAAAAwAQNABIAAQASAAIAMAQDXA4AAADABA8AEgACABIAAQAwBAPrEAAAAIIDAgARAxIEAAAAQAMTAxQDFQQAAEBAAxYDFwMYAxkEAACQQAMaAxsGAAMMBgEDEAIAAQEAARgABAAAAAAABAAAAAAAAAAAAQAAAAAAAAAABAAIAAAAAAsAAAAADQEAAAAAAlIIGNoLmDnXSchR2pXWWlciEA+uYMxy2w==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Release = function(p1) --[[ Release | Line: 22 | Upvalues: FishData (copy), _Shared (copy) ]]
		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			local VFX = FishData.GetPassive("Shanks Sturgeon").VFX

			_Shared.SpawnAt(VFX.Folder, VFX.Conqueror, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
		end
	end,
	Aura = function(p1, p2) --[[ Aura | Line: 33 | Upvalues: _Shared (copy), FishData (copy) ]]
		if not p2 then
			_Shared.Detach(p1, "_ConquerorsTide")

			return
		end

		local VFX = FishData.GetPassive("Shanks Sturgeon").VFX
		local v1 = _Shared.Asset(VFX.Folder, VFX.Aura, VFX.Tier)

		if v1 then
			_Shared.Attach(v1, p1, "_ConquerorsTide")
		end
	end
}