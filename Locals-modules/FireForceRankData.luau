-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local t = {
	Ranks = {
		{
			Name = "Cadet",
			QuestsRequired = 0,
			DamageAmplifier = 0.1
		},
		{
			Name = "Recruit",
			QuestsRequired = 10,
			DamageAmplifier = 0.15
		},
		{
			Name = "Second Class Fire Soldier",
			QuestsRequired = 20,
			DamageAmplifier = 0.2,
			DotDamage = 0.1
		},
		{
			Name = "First Class Fire Soldier",
			QuestsRequired = 30,
			DamageAmplifier = 0.25,
			DotDamage = 0.15
		},
		{
			Name = "Lieutenant",
			QuestsRequired = 50,
			DamageAmplifier = 0.3,
			DotDamage = 0.2
		},
		{
			Name = "Captain",
			QuestsRequired = 60,
			DamageAmplifier = 0.4,
			DotDamage = 0.3
		}
	},
	MaxUnlockedIndex = 5,
	UnjoinedLabel = "None"
}

function t.FirstRank() --[[ FirstRank | Line: 33 | Upvalues: t (copy) ]]
	return t.Ranks[1].Name
end
function t.GetRankBuffs(p1) --[[ GetRankBuffs | Line: 38 | Upvalues: t (copy) ]]
	for i, v in ipairs(t.Ranks) do
		if v.Name == p1 then
			return {
				DamageAmplifier = v.DamageAmplifier or 0,
				DotDamage = v.DotDamage or 0
			}
		end
	end

	return {
		DamageAmplifier = 0,
		DotDamage = 0
	}
end
function t.GetRankByQuests(p1) --[[ GetRankByQuests | Line: 49 | Upvalues: t (copy) ]]
	local v1 = tonumber(p1) or 0
	local v2 = 1

	for i = 1, t.MaxUnlockedIndex do
		if not (t.Ranks[i].QuestsRequired <= v1) then
			break
		end

		v2 = i
	end

	return t.Ranks[v2].Name, v2
end
function t.GetNextRequirement(p1) --[[ GetNextRequirement | Line: 63 | Upvalues: t (copy) ]]
	local v1 = tonumber(p1) or 0
	local _, v2 = t.GetRankByQuests(v1)

	if t.MaxUnlockedIndex <= v2 then
		return nil, 0, true
	end

	local v3 = t.Ranks[v2 + 1]

	return v3.Name, math.max(0, v3.QuestsRequired - v1), false
end
function t.GetRankProgressAlpha(p1) --[[ GetRankProgressAlpha | Line: 75 | Upvalues: t (copy) ]]
	local v1 = tonumber(p1) or 0
	local _, v2 = t.GetRankByQuests(v1)

	if t.MaxUnlockedIndex <= v2 then
		return 1
	end

	local QuestsRequired = t.Ranks[v2].QuestsRequired
	local QuestsRequired2 = t.Ranks[v2 + 1].QuestsRequired

	if QuestsRequired2 <= QuestsRequired then
		return 1
	end

	return math.clamp((v1 - QuestsRequired) / (QuestsRequired2 - QuestsRequired), 0, 1)
end

return t