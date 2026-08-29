-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMXCkdldFBhc3NpdmURUmlubmVnYW4gU2VhcGVyY2gDVkZYEEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQHU3Bhd25BdAZGb2xkZXIEVXNlcgZDRnJhbWUITGlmZXRpbWUEVGllcgZUYXJnZXQIUmVjZWl2ZXIEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUHTW9kdWxlcw5Db25maWd1cmF0aW9ucwhGaXNoRGF0YQZzY3JpcHQGUGFyZW50B19TaGFyZWQAAgsCAgAABwQAAAUCB4cw+wIAAE0CAl8AAAAAbwMBAJ8CAgJNAgJ+AgAAAG8FAwC8AwADBAAAAJ8DAwIOAw4A+wQBAE0EBDQFAAAATQUCiAYAAABNBgLTBwAAAE0HA4UIAAAATQgCywkAAABNCQKLCgAAAJ8EBgFSBAEADgQEAG8GAwC8BAEDBAAAAJ8EAwIOBA4A+wUBAE0FBTQFAAAATQYCiAYAAABNBwIsCwAAAE0IBIUIAAAATQkCywkAAABNCgKLCgAAAJ8FBgGCAAEADAMBAwIDAwMEAwUDBgMHAwgDCQMKAwsDDAAYDQEYAAAAAAAAAAIAAAABAQAAAAAAAAAAAAAAAAADAAAAAAABAQAAAAAAAAAAAAAAAAACGQAAAAAFAAABAgAhowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIA6AYAAABNAgK6BwAAAE0CAqEIAAAAnwECAqQCBQAAAEBApAMKAAAAkEBNAwMkCwAAAE0DA0YMAAAAnwICAv8DAQAAAAAAwAQNABIAAQASAAIAMAQDug4AAACCAwIADwMOBAAAAEADDwMQAxEEAABAQAMSAxMDFAMVBAAAkEADFgMXBgADDQEAAQABGAAEAAAAAAAEAAAAAAAAAAABAAAAAAAAAAAEAAoAAAAADgEAAAAAAaEZYdkM6IAey8vMvdG8X4PRAXatk90L2A==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Receiver = function(p1, p2) --[[ Receiver | Line: 24 | Upvalues: FishData (copy), _Shared (copy) ]]
		local VFX = FishData.GetPassive("Rinnegan Seaperch").VFX
		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			_Shared.SpawnAt(VFX.Folder, VFX.User, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
		end

		local v1 = if p2 then p2:FindFirstChild("HumanoidRootPart") else p2

		if not v1 then
			return
		end

		_Shared.SpawnAt(VFX.Folder, VFX.Target, v1.CFrame, VFX.Lifetime, VFX.Tier)
	end
}