-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMXEEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQKR2V0UGFzc2l2ZRVDcmltc29udGlkZSBMZXZpYXRoYW4DVkZYB1NwYXduQXQGRm9sZGVyBkNGcmFtZQhMaWZldGltZQRUaWVyB2J1cnN0QXQHUnVwdHVyZQlFeHBsb3Npb24EZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUHTW9kdWxlcw5Db25maWd1cmF0aW9ucwhGaXNoRGF0YQZzY3JpcHQGUGFyZW50B19TaGFyZWQABAoCAgAABwQAAAUCBwMbbwQAALwCAAMBAAAAnwIDAisCAQCCAAEA+wMAAE0DA18CAAAAbwQDAJ8DAgJNAwN+BAAAAPsEAQBNBAQ0BQAAAE0FA4gGAAAAhwYDAU0HAoUHAAAATQgDywgAAABNCQOLCQAAAJ8EBgGCAAEACgMBAwIDAwMEAwUDBgMHAwgDCQMKABYLARgAAAAAAQACAAAAAAAAAQAAAAAAAAAAAAAAAAEXAAAAAAkBAgAABgMAAAUBBxxvAwAAvAEAAwEAAACfAQMCKwEBAIIAAQD7AgAATQICXwIAAABvAwMAnwICAk0CAn4EAAAA+wMBAE0DAzQFAAAATQQCiAYAAABNBQJKBwAAAE0GAYUIAAAATQcCywkAAABNCAKLCgAAAJ8DBgGCAAEACwMBAwIDAwMEAwUDBgMHAwwDCAMJAwoAIQwBGAAAAAABAAIAAAAAAAABAAAAAAAAAAAAAAAAAAgXAAAAAAkBAgAABgMAAAUBBxxvAwAAvAEAAwEAAACfAQMCKwEBAIIAAQD7AgAATQICXwIAAABvAwMAnwICAk0CAn4EAAAA+wMBAE0DAzQFAAAATQQCiAYAAABNBQKWBwAAAE0GAYUIAAAATQcCywkAAABNCAKLCgAAAJ8DBgGCAAEACwMBAwIDAwMEAwUDBgMHAw0DCAMJAwoAJw0BGAAAAAABAAIAAAAAAAABAAAAAAAAAAAAAAAAAA4XAAAAAAYAAAECACmjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgDoBgAAAE0CAroHAAAATQICoQgAAACfAQICpAIFAAAAQECkAwoAAACQQE0DAyQLAAAATQMDRgwAAACfAgIC/wMCAAAAAADABA0AEgABABIAAgDABQ4AEgABABIAAgAwBQNKDwAAAMAFEAASAAEAEgACADAFA5YRAAAAggMCABIDDgQAAABAAw8DEAMRBAAAQEADEgMTAxQDFQQAAJBAAxYDFwYABgEDDAYCAw0DAAECAQABGAAEAAAAAAAEAAAAAAAAAAABAAAAAAAAAAAEAAgAAAsAAAAABgAAAAAEAQAAAAADLcaawmS/ta+hqaALroZDal3ejbYfAvDD

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)
local t = {}

local function burstAt(p1, p2) --[[ burstAt | Line: 22 | Upvalues: FishData (copy), _Shared (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local VFX = FishData.GetPassive("Crimsontide Leviathan").VFX

		_Shared.SpawnAt(VFX.Folder, VFX[p2], HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
	end
end

function t.Rupture(p1) --[[ Rupture | Line: 33 | Upvalues: FishData (copy), _Shared (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local VFX = FishData.GetPassive("Crimsontide Leviathan").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.Rupture, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
	end
end
function t.Explosion(p1) --[[ Explosion | Line: 39 | Upvalues: FishData (copy), _Shared (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local VFX = FishData.GetPassive("Crimsontide Leviathan").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.Explosion, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
	end
end

return t