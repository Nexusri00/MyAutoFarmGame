-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Janitor = require(ReplicatedStorage.Modules.Zone.Janitor)
local t = {}

t.__index = t

local LocalPlayer = Players.LocalPlayer

function t.new(p1) --[[ new | Line: 12 | Upvalues: Janitor (copy), t (copy) ]]
	return setmetatable({
		_onTrigger = nil,
		_janitor = Janitor.new(),
		_bound = {},
		_promptName = p1
	}, t)
end
function t._bindPrompt(p1, p2) --[[ _bindPrompt | Line: 21 | Upvalues: LocalPlayer (copy) ]]
	if not p1._bound[p2] then
		p1._bound[p2] = true
		p1._janitor:Add(p2.Triggered:Connect(function(p12) --[[ Line: 25 | Upvalues: LocalPlayer (ref), p1 (copy) ]]
			if p12 ~= LocalPlayer or not p1._onTrigger then
				return
			end

			p1._onTrigger()
		end), "Disconnect")
	end
end
function t._scanNpc(p1, p2) --[[ _scanNpc | Line: 34 ]]
	if not p2:IsA("Model") or p2.Name ~= p1._promptName then
		return
	end

	local v1 = p2:FindFirstChildWhichIsA("ProximityPrompt", true)

	if v1 then
		p1:_bindPrompt(v1)
	end

	p1._janitor:Add(p2.DescendantAdded:Connect(function(p12) --[[ Line: 39 | Upvalues: p1 (copy) ]]
		if not p12:IsA("ProximityPrompt") then
			return
		end

		p1:_bindPrompt(p12)
	end), "Disconnect")
end
function t.Mount(p1, p2) --[[ Mount | Line: 46 ]]
	p1._onTrigger = p2

	local NPCs = workspace:WaitForChild("NPCs", 30)

	if not NPCs then
		return
	end

	for i, v in ipairs(NPCs:GetChildren()) do
		p1:_scanNpc(v)
	end

	p1._janitor:Add(NPCs.ChildAdded:Connect(function(p12) --[[ Line: 52 | Upvalues: p1 (copy) ]]
		p1:_scanNpc(p12)
	end), "Disconnect")
end
function t.Shutdown(p1) --[[ Shutdown | Line: 59 ]]
	p1._janitor:Cleanup()
	table.clear(p1._bound)
end

return t