-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMbEEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQKR2V0UGFzc2l2ZQtBa2F6YSBTaGFyawNWRlgHU3Bhd25BdAZGb2xkZXIERW1pdAZDRnJhbWUITGlmZXRpbWUEVGllcgpBZnRlcnNob2NrBkRldGFjaA5fQ29tcGFzc05lZWRsZQVBc3NldARBdXJhBkF0dGFjaARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zCEZpc2hEYXRhBnNjcmlwdAZQYXJlbnQHX1NoYXJlZAADCQECAAAGAwAABQEHHG8DAAC8AQADAQAAAJ8BAwIrAQEAggABAPsCAABNAgJfAgAAAG8DAwCfAgICTQICfgQAAAD7AwEATQMDNAUAAABNBAKIBgAAAE0FAlYHAAAATQYBhQgAAABNBwLLCQAAAE0IAosKAAAAnwMGAYIAAQALAwEDAgMDAwQDBQMGAwcDCAMJAwoDCwAWDAEYAAAAAAEAAgAAAAAAAAEAAAAAAAAAAAAAAAAAARcAAAAACAICAAAHBAAABQIHASMrAQcA+wIAAE0CAvUAAAAAUgMAAG8EAQCfAgMBggABAPsCAQBNAgJfAgAAAG8DAwCfAgICTQICfgQAAAD7AwAATQMDRgUAAABNBAKIBgAAAE0FAusHAAAATQYCiwgAAACfAwQCKwMBAIIAAQD7BAAATQQEVAkAAABSBQMAUgYAAG8HAQCfBAQBggABAAoDDQMOAwMDBAMFAw8DBwMQAwsDEQAhEAEYAAEAAAAAAAEDAAAAAAAAAQAAAAAAAAAAAAEAAgAAAAAAAAEiAAAAAAUAAAECACajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgDoBgAAAE0CAroHAAAATQICoQgAAACfAQICpAIFAAAAQECkAwoAAACQQE0DAyQLAAAATQMDRgwAAACfAgIC/wMCAAAAAADABA0AEgABABIAAgAwBAOaDgAAAMAEDwASAAIAEgABADAEA+sQAAAAggMCABEDEgQAAABAAxMDFAMVBAAAQEADFgMXAxgDGQQAAJBAAxoDGwYAAwwGAQMQAgABAQABGAAEAAAAAAAEAAAAAAAAAAABAAAAAAAAAAAEAAgAAAAACwAAAAANAQAAAAAC6zuVaZi4KjvAXmC59kvSJZsjgh3Z//9o

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Aftershock = function(p1) --[[ Aftershock | Line: 22 | Upvalues: FishData (copy), _Shared (copy) ]]
		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			local VFX = FishData.GetPassive("Akaza Shark").VFX

			_Shared.SpawnAt(VFX.Folder, VFX.Emit, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
		end
	end,
	Aura = function(p1, p2) --[[ Aura | Line: 33 | Upvalues: _Shared (copy), FishData (copy) ]]
		if not p2 then
			_Shared.Detach(p1, "_CompassNeedle")

			return
		end

		local VFX = FishData.GetPassive("Akaza Shark").VFX
		local v1 = _Shared.Asset(VFX.Folder, VFX.Aura, VFX.Tier)

		if v1 then
			_Shared.Attach(v1, p1, "_CompassNeedle")
		end
	end
}