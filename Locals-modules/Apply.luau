-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local t = {}
local v1 = 0
local v2 = 0
local v3 = 0
local v4 = 0
local v5 = 0
local v6 = 0
local identity = CFrame.identity
local v7 = false
local v8 = nil

function t.accumulate(p1, p2, p3, p4, p5, p6) --[[ accumulate | Line: 27 | Upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref) ]]
	v1 = v1 + p1
	v2 = v2 + p2
	v3 = v3 + p3
	v4 = v4 + p4
	v5 = v5 + p5
	v6 = v6 + p6
end

local function clearState() --[[ clearState | Line: 32 | Upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), identity (ref), v7 (ref), v8 (ref) ]]
	v1 = 0
	v2 = 0
	v3 = 0
	v4 = 0
	v5 = 0
	v6 = 0
	identity = CFrame.identity
	v7 = false
	v8 = nil
end

function t.applyFrame() --[[ applyFrame | Line: 39 | Upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), identity (ref), v8 (ref) ]]
	local v12 = if v1 == 0 and (v2 == 0 and (v3 == 0 and (v4 == 0 and v5 == 0))) then v6 ~= 0 else true

	if not (v7 or v12) then
		return
	end

	local CurrentCamera = workspace.CurrentCamera

	if not CurrentCamera then
		v1 = 0
		v2 = 0
		v3 = 0
		v4 = 0
		v5 = 0
		v6 = 0
		identity = CFrame.identity
		v7 = false
		v8 = nil

		return
	end

	if v8 and v8 ~= CurrentCamera then
		if v7 and v8.Parent then
			pcall(function() --[[ Line: 51 | Upvalues: v8 (ref), identity (ref) ]]
				v8.CFrame = v8.CFrame * identity:Inverse()
			end)
		end

		identity = CFrame.identity
		v7 = false
	end

	local v22 = CFrame.new(v1, v2, v3) * CFrame.fromOrientation(v4, v5, v6)

	CurrentCamera.CFrame = CurrentCamera.CFrame * identity:Inverse() * v22
	identity = v22
	v7 = v12
	v8 = CurrentCamera
	v1 = 0
	v2 = 0
	v3 = 0
	v4 = 0
	v5 = 0
	v6 = 0
end
function t.reset() --[[ reset | Line: 66 | Upvalues: v7 (ref), v8 (ref), identity (ref), v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref) ]]
	if v7 and (v8 and v8.Parent) then
		pcall(function() --[[ Line: 68 | Upvalues: v8 (ref), identity (ref) ]]
			v8.CFrame = v8.CFrame * identity:Inverse()
		end)
	end

	v1 = 0
	v2 = 0
	v3 = 0
	v4 = 0
	v5 = 0
	v6 = 0
	identity = CFrame.identity
	v7 = false
	v8 = nil
end

return t