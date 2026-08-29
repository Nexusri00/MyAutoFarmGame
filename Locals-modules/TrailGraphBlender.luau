-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local Graph = require(script.Parent.Graph)

return {
	CollectStates = function(p1) --[[ CollectStates | Line: 17 ]]
		local t = {}
		local t2 = {}
		local t3 = {}

		if not p1 then
			return t, t2, t3
		end

		for k, v in pairs(p1:GetChildren()) do
			if v:IsA("Configuration") then
				local v1 = v:GetAttribute("Time")

				if v1 == nil then
					local v3 = tonumber(string.match(v.Name, "%d+"))

					v1 = if v3 then v3 - 1 or 0 else 0
				end

				local v5 = v:GetAttribute("Width")

				if v5 and typeof(v5) == "NumberSequence" then
					table.insert(t, {
						Time = v1,
						Graph = v5
					})
				end

				local v6 = v:GetAttribute("Transparency")

				if v6 and typeof(v6) == "NumberSequence" then
					table.insert(t2, {
						Time = v1,
						Graph = v6
					})
				end

				local v7 = v:GetAttribute("Color")

				if v7 and typeof(v7) == "ColorSequence" then
					table.insert(t3, {
						Time = v1,
						Graph = v7
					})
				end
			end
		end

		for i, v in ipairs({ t, t2, t3 }) do
			table.sort(v, function(p1, p2) --[[ Line: 44 ]]
				return p1.Time < p2.Time
			end)

			if #v > 1 and v[#v].Time > 1 then
				local Time = v[#v].Time

				if Time > 0 then
					for i2, v2 in ipairs(v) do
						v2.Time = v2.Time / Time
					end
				end
			end
		end

		return t, t2, t3
	end,
	PrecomputeMergedTimes = Graph.PrecomputeMergedTimes,
	PrecomputeMergedColorTimes = Graph.PrecomputeMergedColorTimes,
	LerpGraphFast = Graph.LerpGraphFast,
	LerpColorGraphFast = Graph.LerpColorGraphFast
}