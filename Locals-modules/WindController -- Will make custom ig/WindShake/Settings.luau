-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local t = {}

local function Normalize(p1) --[[ Normalize | Line: 13 ]]
	return if p1.Magnitude > 0 then p1.Unit or Vector3.new(0, 0, 0) else Vector3.new(0, 0, 0)
end

function t.new(p1) --[[ new | Line: 17 ]]
	local t = {}
	local v1 = p1:GetAttribute("WindPower")
	local v2 = p1:GetAttribute("WindSpeed")
	local v3 = p1:GetAttribute("WindDirection")

	t.WindPower = if type(v1) == "number" then v1 else nil
	t.WindSpeed = if type(v2) == "number" then v2 else nil

	local v6

	if typeof(v3) == "Vector3" then
		local v7 = v3

		v6 = v7.Magnitude > 0 and v7.Unit or Vector3.new(0, 0, 0)
	else
		v6 = nil
	end

	t.WindDirection = v6
	t.PivotOffset = if p1:IsA("BasePart") then p1.PivotOffset else nil
	t.PivotOffsetInverse = if t.PivotOffset then t.PivotOffset:Inverse() else nil

	local t2 = {
		PowerConnection = p1:GetAttributeChangedSignal("WindPower"):Connect(function() --[[ Line: 50 | Upvalues: v1 (ref), p1 (copy), t (copy) ]]
			v1 = p1:GetAttribute("WindPower")
			t.WindPower = if type(v1) == "number" then v1 else nil
		end),
		SpeedConnection = p1:GetAttributeChangedSignal("WindSpeed"):Connect(function() --[[ Line: 55 | Upvalues: v2 (ref), p1 (copy), t (copy) ]]
			v2 = p1:GetAttribute("WindSpeed")
			t.WindSpeed = if type(v2) == "number" then v2 else nil
		end),
		DirectionConnection = p1:GetAttributeChangedSignal("WindDirection"):Connect(function() --[[ Line: 60 | Upvalues: v3 (ref), p1 (copy), t (copy) ]]
			v3 = p1:GetAttribute("WindDirection")

			local v32

			if typeof(v3) == "Vector3" then
				local v4 = v3

				v32 = if v4.Magnitude > 0 then v4.Unit or Vector3.new(0, 0, 0) else Vector3.new(0, 0, 0)
			else
				v32 = nil
			end

			t.WindDirection = v32
		end)
	}

	if p1:IsA("BasePart") then
		t2.PivotConnection = p1:GetPropertyChangedSignal("PivotOffset"):Connect(function() --[[ Line: 66 | Upvalues: p1 (copy), t (copy) ]]
			local PivotOffset = p1.PivotOffset

			t.PivotOffset = PivotOffset
			t.PivotOffsetInverse = PivotOffset:Inverse()
		end)
	end

	function t.Destroy(p1) --[[ Destroy | Line: 74 | Upvalues: t2 (copy) ]]
		for k, v in pairs(t2) do
			v:Disconnect()
		end
	end

	return t
end

return t