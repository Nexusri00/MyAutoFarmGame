-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMaEEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQKR2V0UGFzc2l2ZRNFYXN0d2luZCBIYWtpIFNoYXJrA1ZGWAdTcGF3bkF0BkZvbGRlcgZDRnJhbWUITGlmZXRpbWUEVGllcgdidXJzdEF0BFByZXkISGFraUZhbmcERmFuZwhIYWtpU3R1bgRTdHVuBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlB01vZHVsZXMOQ29uZmlndXJhdGlvbnMIRmlzaERhdGEGc2NyaXB0BlBhcmVudAdfU2hhcmVkAAUKAgIAAAcEAAAFAgcDG28EAAC8AgADAQAAAJ8CAwIrAgEAggABAPsDAABNAwNfAgAAAG8EAwCfAwICTQMDfgQAAAD7BAEATQQENAUAAABNBQOIBgAAAIcGAwFNBwKFBwAAAE0IA8sIAAAATQkDiwkAAACfBAYBggABAAoDAQMCAwMDBAMFAwYDBwMIAwkDCgAYCwEYAAAAAAEAAgAAAAAAAAEAAAAAAAAAAAAAAAABGQAAAAAJAQIAAAYDAAAFAQccbwMAALwBAAMBAAAAnwEDAisBAQCCAAEA+wIAAE0CAl8CAAAAbwMDAJ8CAgJNAgJ+BAAAAPsDAQBNAwM0BQAAAE0EAogGAAAATQUCIgcAAABNBgGFCAAAAE0HAssJAAAATQgCiwoAAACfAwYBggABAAsDAQMCAwMDBAMFAwYDBwMMAwgDCQMKACMMARgAAAAAAQACAAAAAAAAAQAAAAAAAAAAAAAAAAAIGQAAAAAJAQIAAAYDAAAFAQccbwMAALwBAAMBAAAAnwEDAisBAQCCAAEA+wIAAE0CAl8CAAAAbwMDAJ8CAgJNAgJ+BAAAAPsDAQBNAwM0BQAAAE0EAogGAAAATQUCfgcAAABNBgGFCAAAAE0HAssJAAAATQgCiwoAAACfAwYBggABAAsDAQMCAwMDBAMFAwYDBwMNAwgDCQMKACgOARgAAAAAAQACAAAAAAAAAQAAAAAAAAAAAAAAAAANGQAAAAAJAQIAAAYDAAAFAQccbwMAALwBAAMBAAAAnwEDAisBAQCCAAEA+wIAAE0CAl8CAAAAbwMDAJ8CAgJNAgJ+BAAAAPsDAQBNAwM0BQAAAE0EAogGAAAATQUCaAcAAABNBgGFCAAAAE0HAssJAAAATQgCiwoAAACfAwYBggABAAsDAQMCAwMDBAMFAwYDBwMPAwgDCQMKAC8QARgAAAAAAQACAAAAAAAAAQAAAAAAAAAAAAAAAAAUGQAAAAAGAAABAgAuowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIA6AYAAABNAgK6BwAAAE0CAqEIAAAAnwECAqQCBQAAAEBApAMKAAAAkEBNAwMkCwAAAE0DA0YMAAAAnwICAv8DAwAAAAAAwAQNABIAAQASAAIAwAUOABIAAQASAAIAMAUDIg8AAADABRAAEgABABIAAgAwBQO0EQAAAMAFEgASAAEAEgACADAFA0wTAAAAggMCABQDEQQAAABAAxIDEwMUBAAAQEADFQMWAxcDGAQAAJBAAxkDGgYABgEDDAYCAw4GAwMQBAABAgMBAAEYAAQAAAAAAAQAAAAAAAAAAAEAAAAAAAAAAAQACgAACwAAAAAFAAAAAAcAAAAABAEAAAAABMecUwkbn9H3UfwOx5cLoyS3hER99Vg5CA==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)
local t = {}

local function burstAt(p1, p2) --[[ burstAt | Line: 24 | Upvalues: FishData (copy), _Shared (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local VFX = FishData.GetPassive("Eastwind Haki Shark").VFX

		_Shared.SpawnAt(VFX.Folder, VFX[p2], HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
	end
end

function t.Prey(p1) --[[ Prey | Line: 35 | Upvalues: FishData (copy), _Shared (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local VFX = FishData.GetPassive("Eastwind Haki Shark").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.Prey, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
	end
end
function t.Fang(p1) --[[ Fang | Line: 40 | Upvalues: FishData (copy), _Shared (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local VFX = FishData.GetPassive("Eastwind Haki Shark").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.HakiFang, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
	end
end
function t.Stun(p1) --[[ Stun | Line: 47 | Upvalues: FishData (copy), _Shared (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local VFX = FishData.GetPassive("Eastwind Haki Shark").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.HakiStun, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
	end
end

return t