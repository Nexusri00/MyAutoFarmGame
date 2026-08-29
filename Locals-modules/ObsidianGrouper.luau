-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMaBkRldGFjaA5fT2JzaWRpYW5TaGVsbApHZXRQYXNzaXZlEE9ic2lkaWFuIEdyb3VwZXIDVkZYBUFzc2V0BkZvbGRlcgZTaGllbGQGQXR0YWNoEEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQHU3Bhd25BdARFbWl0BkNGcmFtZQhMaWZldGltZQVCcmVhawRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zCEZpc2hEYXRhBnNjcmlwdAZQYXJlbnQHX1NoYXJlZAADCAICAAAHBAAABQIHASErAQcA+wIAAE0CAvUAAAAAUgMAAG8EAQCfAgMBggABAPsCAQBNAgJfAgAAAG8DAwCfAgICTQICfgQAAAD7AwAATQMDRgUAAABNBAKIBgAAAE0FAiQHAAAAnwMDAisDAQCCAAEA+wQAAE0EBFQIAAAAUgUDAFIGAABvBwEAnwQEAYIAAQAJAwEDAgMDAwQDBQMGAwcDCAMJABYIARgAAQAAAAAAAQMAAAAAAAABAAAAAAAAAAEAAgAAAAAAAAEXAAAAAAgBAgAABgMAAAUBByD7AQAATQEB9QAAAABSAgAAbwMBAJ8BAwFvAwIAvAEAAwMAAACfAQMCKwEBAIIAAQD7AgEATQICXwQAAABvAwUAnwICAk0CAn4GAAAA+wMAAE0DAzQHAAAATQQCiAgAAABNBQJWCQAAAE0GAYUKAAAATQcCywsAAACfAwUBggABAAwDAQMCAwoDCwMDAwQDBQMMAwcDDQMOAw8AJBABGAAAAAAAAAIAAAABAAIAAAAAAAABAAAAAAAAAAAAAAABJQAAAAAFAAABAgAmowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIA6AYAAABNAgK6BwAAAE0CAqEIAAAAnwECAqQCBQAAAEBApAMKAAAAkEBNAwMkCwAAAE0DA0YMAAAAnwICAv8DAgAAAAAAwAQNABIAAgASAAEAMAQDJA4AAADABA8AEgACABIAAQAwBANXEAAAAIIDAgARAxEEAAAAQAMSAxMDFAQAAEBAAxUDFgMXAxgEAACQQAMZAxoGAAMIBgEDEAIAAQEAARgABAAAAAAABAAAAAAAAAAAAQAAAAAAAAAABAAIAAAAAA4AAAAACgEAAAAAAhmq5Bb+6AP3QRZoc+P3UORpsvNiK26OFw==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Shield = function(p1, p2) --[[ Shield | Line: 22 | Upvalues: _Shared (copy), FishData (copy) ]]
		if not p2 then
			_Shared.Detach(p1, "_ObsidianShell")

			return
		end

		local VFX = FishData.GetPassive("Obsidian Grouper").VFX
		local v1 = _Shared.Asset(VFX.Folder, VFX.Shield)

		if v1 then
			_Shared.Attach(v1, p1, "_ObsidianShell")
		end
	end,
	Break = function(p1) --[[ Break | Line: 36 | Upvalues: _Shared (copy), FishData (copy) ]]
		_Shared.Detach(p1, "_ObsidianShell")

		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			local VFX = FishData.GetPassive("Obsidian Grouper").VFX

			_Shared.SpawnAt(VFX.Folder, VFX.Emit, HumanoidRootPart.CFrame, VFX.Lifetime)
		end
	end
}