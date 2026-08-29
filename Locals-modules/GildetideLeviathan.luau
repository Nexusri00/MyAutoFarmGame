-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)
local t = {}

local function vfxOf() --[[ vfxOf | Line: 34 | Upvalues: FishData (copy) ]]
	return FishData.GetPassive("Gildetide Leviathan").VFX
end

local function setAura(p1, p2, p3, p4) --[[ setAura | Line: 39 | Upvalues: _Shared (copy), FishData (copy) ]]
	if not p2 then
		_Shared.Detach(p1, p4)

		return
	end

	local VFX = FishData.GetPassive("Gildetide Leviathan").VFX
	local v1 = _Shared.Asset(VFX.Folder, VFX[p3], VFX.Tier)

	if v1 then
		_Shared.Attach(v1, p1, p4)
	end
end

function t.Gild(p1, p2) --[[ Gild | Line: 57 | Upvalues: _Shared (copy), FishData (copy) ]]
	if not p2 then
		_Shared.Detach(p1, "_GoldenTarget")

		return
	end

	local VFX = FishData.GetPassive("Gildetide Leviathan").VFX
	local v1 = _Shared.Asset(VFX.Folder, VFX.GoldenTarget, VFX.Tier)

	if v1 then
		_Shared.Attach(v1, p1, "_GoldenTarget")
	end
end
function t.Rush(p1, p2) --[[ Rush | Line: 62 | Upvalues: _Shared (copy), FishData (copy) ]]
	if not p2 then
		_Shared.Detach(p1, "_GoldenRush")

		return
	end

	local VFX = FishData.GetPassive("Gildetide Leviathan").VFX
	local v1 = _Shared.Asset(VFX.Folder, VFX.Rush, VFX.Tier)

	if v1 then
		_Shared.Attach(v1, p1, "_GoldenRush")
	end
end
function t.Emit(p1) --[[ Emit | Line: 67 | Upvalues: FishData (copy), _Shared (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local VFX = FishData.GetPassive("Gildetide Leviathan").VFX

		_Shared.SpawnAt(VFX.Folder, VFX.Emit, HumanoidRootPart.CFrame, VFX.Lifetime, VFX.Tier)
	end
end

return t