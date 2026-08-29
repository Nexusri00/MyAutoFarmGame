-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local t = {
	SUBSTEP = 1 / 60,
	MAX_SUBSTEPS = 3
}

local function windAccel(p1, p2, p3, p4, p5) --[[ windAccel | Line: 23 ]]
	local v1 = p1 * 3 - p3
	local v2 = p1 * 8.1 - p3 * 1.6
	local v3 = (math.noise(v1, p4) + 0.5 * math.noise(v2, p4 + 37.1)) * p2

	return Vector3.new(v3, 0, (math.noise(v1, p5) + 0.5 * math.noise(v2, p5 + 37.1)) * p2)
end

function t.step(p1, p2, p3, p4, p5, p6) --[[ step | Line: 37 | Upvalues: t (copy), windAccel (copy) ]]
	local v1 = p4._lastH or p5

	p4._lastH = p5

	local v2 = 1 - (p4._damping or 0)

	if p5 ~= t.SUBSTEP and (v2 < 1 and v2 > 0) then
		v2 = v2 ^ (p5 / t.SUBSTEP)
	end

	local v3 = v2 * (p5 / v1)
	local _gravity = p4._gravity
	local v4 = p4._windAmp or 0
	local v5 = if p4._pinStart == false then false else true
	local _pinEnd = p4._pinEnd

	for i = if v5 then 2 else 1, if _pinEnd and p3 then p3 else p3 + 1 do
		local v8 = p1[i]

		p1[i] = v8 + (v8 - p2[i]) * v3 + (if v4 == 0 then _gravity else _gravity + windAccel((i - 1) / p3, v4, p6, p4._windSeedA, p4._windSeedB)) * (p5 * p5)
		p2[i] = v8
	end

	local v10 = p4._restLenEff or p4._restLen
	local v11 = p4._bendStiffness or 0

	for j = 1, p4._stiffness or 4 do
		for k = 1, p3 do
			local v12 = p1[k]
			local v13 = p1[k + 1]
			local v14 = v13 - v12
			local Magnitude = v14.Magnitude

			if Magnitude > 1e-6 then
				local v15 = v14 * ((Magnitude - v10) / Magnitude)
				local v17 = if _pinEnd then if k + 1 == p3 + 1 then true else false else _pinEnd

				if if v5 then if k == 1 then true else false else v5 then
					if not v17 then
						p1[k + 1] = v13 - v15
					end

					continue
				end

				if v17 then
					p1[k] = v12 + v15

					continue
				end

				local v18 = v15 * 0.5

				p1[k] = v12 + v18
				p1[k + 1] = v13 - v18
			end
		end

		if v11 > 0 then
			local v19 = v11 * 0.5

			for n = 2, p3 do
				p1[n] = p1[n] + ((p1[n - 1] + p1[n + 1]) * 0.5 - p1[n]) * v19
			end
		end
	end
end
function t.translate(p1, p2, p3, p4) --[[ translate | Line: 109 ]]
	for i = 1, p3 + 1 do
		p1[i] = p1[i] + p4
		p2[i] = p2[i] + p4
	end
end
function t.calm(p1, p2, p3) --[[ calm | Line: 117 ]]
	for i = 1, p3 + 1 do
		p2[i] = p1[i]
	end
end

return t