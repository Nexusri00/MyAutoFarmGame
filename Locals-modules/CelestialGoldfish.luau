-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUCkdldFBhc3NpdmUSQ2VsZXN0aWFsIEdvbGRmaXNoA1ZGWBBIdW1hbm9pZFJvb3RQYXJ0DkZpbmRGaXJzdENoaWxkB1NwYXduQXQGRm9sZGVyBkNGcmFtZQhMaWZldGltZQRTdGFyBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlB01vZHVsZXMOQ29uZmlndXJhdGlvbnMIRmlzaERhdGEGc2NyaXB0BlBhcmVudAdfU2hhcmVkAAIJAgIAAAcEAAAFAgcDGfsCAABNAgJfAAAAAG8DAQCfAgICTQICfgIAAABvBQMAvAMAAwQAAACfAwMCKwMBAIIAAQD7BAEATQQENAUAAABNBQKIBgAAAIcGAgFNBwOFBwAAAE0IAssIAAAAnwQFAYIAAQAJAwEDAgMDAwQDBQMGAwcDCAMJABgKARgAAAAAAAAAAQAAAAEAAgAAAAAAAAAAAAABGQAAAAAFAAABAgAhowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIA6AYAAABNAgK6BwAAAE0CAqEIAAAAnwECAqQCBQAAAEBApAMKAAAAkEBNAwMkCwAAAE0DA0YMAAAAnwICAv8DAQAAAAAAwAQNABIAAQASAAIAMAQDDQ4AAACCAwIADwMLBAAAAEADDAMNAw4EAABAQAMPAxADEQMSBAAAkEADEwMUBgADCgEAAQABGAAEAAAAAAAEAAAAAAAAAAABAAAAAAAAAAAEAAoAAAAACAEAAAAAAVBactJAECiQDIjkzKzz8LkgQmWmYp4Y0w==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Star = function(p1, p2) --[[ Star | Line: 24 | Upvalues: FishData (copy), _Shared (copy) ]]
		local VFX = FishData.GetPassive("Celestial Goldfish").VFX
		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			_Shared.SpawnAt(VFX.Folder, VFX[p2], HumanoidRootPart.CFrame, VFX.Lifetime)
		end
	end
}