-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local t = {
	MergeTables = function(p1, p2, p3) --[[ MergeTables | Line: 3 ]]
		for k, v in pairs(p2) do
			if not table.find(p1, v) then
				if p3 and next(p3) then
					if not table.find(p3, v) then
						table.insert(p1, v)
					end

					continue
				end

				table.insert(p1, v)
			end
		end

		return p1
	end,
	MergeAdd = function(p1, p2) --[[ MergeAdd | Line: 18 ]]
		for k, v in pairs(p2) do
			if not p1[k] then
				p1[k] = 0
			end

			if not v then
				v = 0
			end

			p1[k] = p1[k] + v
		end
	end,
	MergeIndexToQuantity = function(p1, p2, p3) --[[ MergeIndexToQuantity | Line: 26 ]]
		for k, v in pairs(p2) do
			if not p1[v] then
				p1[v] = 0
			end

			if p3 and next(p3) then
				if not table.find(p3, v) then
					p1[v] = p1[v] + 1
				end

				continue
			end

			p1[v] = p1[v] + 1
		end
	end
}
local v1 = Random.new(tick())

function t.PickRandom(p1) --[[ PickRandom | Line: 40 | Upvalues: v1 (copy) ]]
	if p1 and next(p1) then
		return p1[v1:NextInteger(1, #p1)]
	end
end
function t.PoolPick(p1, p2) --[[ PoolPick | Line: 47 | Upvalues: t (copy) ]]
	local t2 = {}

	for k, v in pairs(p1) do
		for i = 1, v do
			t2[#t2 + 1] = k
		end
	end

	return t.PickRandom(t2, p2)
end
function t.DeepCopyTable(p1) --[[ DeepCopyTable | Line: 57 | Upvalues: t (copy) ]]
	local t2 = {}

	for k, v in pairs(p1) do
		if type(v) == "table" then
			t2[k] = t.DeepCopyTable(v)

			continue
		end

		t2[k] = v
	end

	return t2
end
function t.DeepCloneTweenInfo(p1, p2) --[[ DeepCloneTweenInfo | Line: 70 ]]
	if not p1 then
		return
	end

	local v1 = if p2 then p2 else {}

	return TweenInfo.new(v1.Time or p1.Time, v1.EasingStyle or p1.EasingStyle, v1.EasingDirection or p1.EasingDirection, v1.RepeatCount or p1.RepeatCount, v1.Reverses or p1.Reverses, v1.DelayTime or p1.DelayTime)
end

return t