-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUEEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQKR2V0UGFzc2l2ZQlEZW1vbiBLb2kDVkZYB1NwYXduQXQGRm9sZGVyCUV4cGxvc2lvbgZDRnJhbWUITGlmZXRpbWUEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUHTW9kdWxlcw5Db25maWd1cmF0aW9ucwhGaXNoRGF0YQZzY3JpcHQGUGFyZW50B19TaGFyZWQAAggBAgAABgMAAAUBBxpvAwAAvAEAAwEAAACfAQMCKwEBAIIAAQD7AgAATQICXwIAAABvAwMAnwICAk0CAn4EAAAA+wMBAE0DAzQFAAAATQQCiAYAAABNBQKWBwAAAE0GAYUIAAAATQcCywkAAACfAwUBggABAAoDAQMCAwMDBAMFAwYDBwMIAwkDCgAUCAEYAAAAAAEAAgAAAAAAAAEAAAAAAAAAAAAAAAEVAAAAAAUAAAECACGjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgDoBgAAAE0CAroHAAAATQICoQgAAACfAQICpAIFAAAAQECkAwoAAACQQE0DAyQLAAAATQMDRgwAAACfAgIC/wMBAAAAAADABA0AEgABABIAAgAwBAOWDgAAAIIDAgAPAwsEAAAAQAMMAw0DDgQAAEBAAw8DEAMRAxIEAACQQAMTAxQGAAMIAQABAAEYAAQAAAAAAAQAAAAAAAAAAAEAAAAAAAAAAAQABgAAAAAIAQAAAAABGQolOo1pBvxoNRrXBjh3rWkSMk4rzk87

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Explosion = function(p1) --[[ Explosion | Line: 20 | Upvalues: FishData (copy), _Shared (copy) ]]
		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			local VFX = FishData.GetPassive("Demon Koi").VFX

			_Shared.SpawnAt(VFX.Folder, VFX.Explosion, HumanoidRootPart.CFrame, VFX.Lifetime)
		end
	end
}