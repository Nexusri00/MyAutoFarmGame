-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local t = {}

local function fmt(p1) --[[ fmt | Line: 8 ]]
	return string.format("%.6g", p1)
end

local function q(p1, p2) --[[ q | Line: 13 ]]
	if p2 and not (p2 <= 0) then
		return math.round(p1 / p2) * p2
	end

	return p1
end

function t.ToAttributeString(p1, p2) --[[ ToAttributeString | Line: 20 | Upvalues: fmt (copy) ]]
	if p2 and p2 > 0 then
		local X = p1.X
		local v1 = if p2 and not (p2 <= 0) then math.round(X / p2) * p2 else X
		local Y = p1.Y
		local v2 = if p2 and not (p2 <= 0) then math.round(Y / p2) * p2 else Y
		local Z = p1.Z

		p1 = Vector3.new(v1, v2, if p2 and not (p2 <= 0) then math.round(Z / p2) * p2 else Z)
	end

	local concat = table.concat
	local t = {}

	t[1] = string.format("%.6g", p1.X)
	t[2] = string.format("%.6g", p1.Y)
	t[3] = fmt(p1.Z)

	return concat(t, ",")
end
function t.FromAttributeString(p1) --[[ FromAttributeString | Line: 28 ]]
	if typeof(p1) ~= "string" then
		return nil
	end

	local v1, v2, v3 = p1:match("^%s*(-?[%d%.]+[eE]?[+-]?%d*)%s*,%s*(-?[%d%.]+[eE]?[+-]?%d*)%s*,%s*(-?[%d%.]+[eE]?[+-]?%d*)%s*$")

	if not v1 then
		return nil
	end

	local v4 = tonumber(v1)
	local v5 = tonumber(v2)
	local v6 = tonumber(v3)

	if v4 and (v5 and v6) then
		return Vector3.new(v4, v5, v6)
	end

	return nil
end
function t.SetVector3Attribute(p1, p2, p3, p4) --[[ SetVector3Attribute | Line: 42 | Upvalues: t (copy) ]]
	p1:SetAttribute(p2, t.ToAttributeString(p3, p4))
end
function t.GetVector3Attribute(p1, p2) --[[ GetVector3Attribute | Line: 46 | Upvalues: t (copy) ]]
	local v1 = p1:GetAttribute(p2)

	if typeof(v1) == "string" then
		return t.FromAttributeString(v1)
	end

	return nil
end

return t