-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMdCkdldFBhc3NpdmUXUmVhbGl0eS1FYXRlciBMZXZpYXRoYW4DVkZYBXZmeE9mCVByaW1hcnlPZgdTcGF3bkF0BkZvbGRlcgVDcmFjawZDRnJhbWUDbmV3CFBvc2l0aW9uCExpZmV0aW1lBFRpZXIGRGV0YWNoEV9PdmVyd3JpdHRlbkRlY2F5BUFzc2V0BURlY2F5BkF0dGFjaAhEZWxldGlvbgRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zCEZpc2hEYXRhBnNjcmlwdAZQYXJlbnQHX1NoYXJlZAAFAgABAAAACPsAAABNAABfAAAAAG8BAQCfAAICTQAAfgIAAACCAAIAAwMBAwIDAwAnBAEYAAAAAAAAAAAoAAAAAAkBAgAABgMAAAUBByD7AQAATQEBEgAAAABSAgAAnwECAisBAQCCAAEA+wIBAE0CAl8BAAAAbwMCAJ8CAgJNAgJ+AwAAAPsDAABNAwM0BAAAAE0EAogFAAAATQUCDwYAAACkBgkAACBwgE0HATsKAAAAnwYCAk0HAssLAAAATQgCiwwAAACfAwYBggABAA0DBQMBAwIDAwMGAwcDCAMJAwoEACBwgAMLAwwDDQAuCAEYBwAAAAABAPgAAAAAAAALAAAAAAAAAAAAAAAAAAAAAAEoAAAAAAsCAgAABwQAAAUCBwEsKwEHAPsCAABNAgL1AAAAAFIDAABvBAEAnwIDAYIAAQD7AgAATQICEgIAAABSAwAAnwICAisCAQCCAAEA+wMBAE0DA18DAAAAbwQEAJ8DAgJNAwN+BQAAAPsEAABNBARGBgAAAE0FA4gHAAAATQYDJQgAAABNBwOLCQAAAJ8EBAIrBAEAggABAPsFAABNBQVUCgAAAFIGBABSBwAAbwgBAMYJAABSCgIAnwUGAYIAAQALAw4DDwMFAwEDAgMDAxADBwMRAw0DEgA8EQEYFQEAAAAAAAEDAAAAAAEA5QAAAAAAAB4AAAAAAAAAAAABAAIAAAAAAAAAAAEoAAAAAAkBAgAABgMAAAUBByD7AQAATQEBEgAAAABSAgAAnwECAisBAQCCAAEA+wIBAE0CAl8BAAAAbwMCAJ8CAgJNAgJ+AwAAAPsDAABNAwM0BAAAAE0EAogFAAAATQUCSAYAAACkBgkAACBwgE0HATsKAAAAnwYCAk0HAssLAAAATQgCiwwAAACfAwYBggABAA0DBQMBAwIDAwMGAwcDEwMJAwoEACBwgAMLAwwDDQBOEwEYJwAAAAABANgAAAAAAAArAAAAAAAAAAAAAAAAAAAAAAEoAAAAAAYAAAECAC2jAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgDoBgAAAE0CAroHAAAATQICoQgAAACfAQICpAIFAAAAQECkAwoAAACQQE0DAyQLAAAATQMDRgwAAACfAgIC/wMDAAAAAADABA0AEgABAMAFDgASAAIAEgABADAFAw8PAAAAwAUQABIAAgASAAEAMAUDJREAAADABRIAEgACABIAAQAwBQNIEwAAAIIDAgAUAxQEAAAAQAMVAxYDFwQAAEBAAxgDGQMaAxsEAACQQAMcAx0GAAYBAwgGAgMRBgMDEwQAAQIDAQABGAAWAAAAAAAEAAAAAAAAAAABAAAAAAAAAAAEAAcABwAAAAAOAAAAABIAAAAACAEAAAAABO9J7N19bihXoD3HopsqcJ+fUfup3Y2G3A==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)
local t = {}

local function vfxOf() --[[ vfxOf | Line: 39 | Upvalues: FishData (copy) ]]
	return FishData.GetPassive("Reality-Eater Leviathan").VFX
end

function t.Crack(p1) --[[ Crack | Line: 46 | Upvalues: _Shared (copy), FishData (copy) ]]
	local v1 = _Shared.PrimaryOf(p1)

	if v1 then
		local VFX = FishData.GetPassive("Reality-Eater Leviathan").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.Crack, CFrame.new(v1.Position), VFX.Lifetime, VFX.Tier)
	end
end
function t.Decay(p1, p2) --[[ Decay | Line: 60 | Upvalues: _Shared (copy), FishData (copy) ]]
	if not p2 then
		_Shared.Detach(p1, "_OverwrittenDecay")

		return
	end

	local v1 = _Shared.PrimaryOf(p1)

	if not v1 then
		return
	end

	local VFX = FishData.GetPassive("Reality-Eater Leviathan").VFX
	local v2 = _Shared.Asset(VFX.Folder, VFX.Decay, VFX.Tier)

	if v2 then
		_Shared.Attach(v2, p1, "_OverwrittenDecay", nil, v1)
	end
end
function t.Deletion(p1) --[[ Deletion | Line: 78 | Upvalues: _Shared (copy), FishData (copy) ]]
	local v1 = _Shared.PrimaryOf(p1)

	if v1 then
		local VFX = FishData.GetPassive("Reality-Eater Leviathan").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.Deletion, CFrame.new(v1.Position), VFX.Lifetime, VFX.Tier)
	end
end

return t