-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local t = {
	GateGems = false,
	GateSpecOverwrite = true,
	GateConquerorHaki = true,
	GatedQuests = {
		["Conqueror Trial 1"] = true,
		["Conqueror Trial 2"] = true,
		["Conqueror Trial 3"] = true,
		["Conqueror Trial 4"] = true
	},
	GatedDialogueActions = {
		SpecOverwrite = true
	},
	GatedRaces = {
		Monarch = true
	},
	HasAccess = function(p1) --[[ HasAccess | Line: 37 ]]
		local Data = p1:FindFirstChild("Data")
		local v1 = if Data then Data:FindFirstChild("GatedAccess") else Data

		return if v1 == nil then false else v1:IsA("BoolValue") and v1.Value == true
	end
}

function t.CanUseGems(p1) --[[ CanUseGems | Line: 43 | Upvalues: t (copy) ]]
	if t.HasAccess(p1) then
		return true
	end

	return not t.GateGems
end
function t.CanObtainRace(p1, p2) --[[ CanObtainRace | Line: 50 | Upvalues: t (copy) ]]
	if t.HasAccess(p1) then
		return true
	end

	return t.GatedRaces[p2] ~= true
end
function t.CanObtainConquerorHaki(p1) --[[ CanObtainConquerorHaki | Line: 57 | Upvalues: t (copy) ]]
	if t.HasAccess(p1) then
		return true
	end

	return not t.GateConquerorHaki
end
function t.IsQuestGated(p1, p2) --[[ IsQuestGated | Line: 64 | Upvalues: t (copy) ]]
	if t.HasAccess(p1) then
		return false
	end

	return t.GatedQuests[p2] == true
end
function t.CanUseSpecOverwrite(p1) --[[ CanUseSpecOverwrite | Line: 71 | Upvalues: t (copy) ]]
	if t.HasAccess(p1) then
		return true
	end

	return not t.GateSpecOverwrite
end
function t.IsDialogueActionGated(p1, p2) --[[ IsDialogueActionGated | Line: 78 | Upvalues: t (copy) ]]
	if t.HasAccess(p1) then
		return false
	end

	return t.GatedDialogueActions[p2] == true
end

return t