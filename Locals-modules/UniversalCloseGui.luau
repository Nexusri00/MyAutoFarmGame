-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local t = {}
local t2 = {}
local v1 = nil
local v2 = nil

local function Remove(p1) --[[ Remove | Line: 22 | Upvalues: t2 (copy) ]]
	local v1 = table.find(t2, p1)

	if v1 then
		table.remove(t2, v1)

		return true
	end

	return false
end

function t.Register(p1, p2, p3) --[[ Register | Line: 30 | Upvalues: t2 (copy) ]]
	if type(p2) ~= "function" then
		return
	end

	local v1 = table.find(t2, p2)

	if v1 then
		table.remove(t2, v1)
	end

	if p3 then
		table.insert(t2, 1, p2)
	else
		table.insert(t2, p2)
	end
end
function t.Destroy(p1, p2, p3) --[[ Destroy | Line: 40 | Upvalues: t2 (copy) ]]
	if type(p2) ~= "function" then
		return
	end

	if not p3 then
		p2()
	end

	local v1 = table.find(t2, p2)

	if v1 then
		table.remove(t2, v1)
	end
end
function t.SetWindowHandler(p1, p2) --[[ SetWindowHandler | Line: 46 | Upvalues: v1 (ref) ]]
	if p2 ~= nil and type(p2) ~= "function" then
		return false
	end

	v1 = p2

	return true
end
function t.Pop(p1) --[[ Pop | Line: 52 | Upvalues: v1 (ref), t2 (copy) ]]
	if v1 then
		local ok, result = pcall(v1)

		if ok then
			if result == true then
				return true
			end
		else
			warn("UniversalCloseGui managed window callback failed: " .. tostring(result))
		end
	end

	local v12 = t2[#t2]

	if not v12 then
		return false
	end

	local ok, result = pcall(v12)
	local v2 = table.find(t2, v12)

	if v2 then
		table.remove(t2, v2)
	end

	if ok then
		return true
	end

	warn("UniversalCloseGui callback failed: " .. tostring(result))

	return true
end
function t.Init(p1) --[[ Init | Line: 70 | Upvalues: v2 (ref), UserInputService (copy), t (copy) ]]
	if not v2 then
		v2 = UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 72 | Upvalues: t (ref) ]]
			if p2 then
				return
			end

			if p1.KeyCode ~= Enum.KeyCode.L and p1.KeyCode ~= Enum.KeyCode.ButtonB then
				return
			end

			t:Pop()
		end)
	end
end

return t