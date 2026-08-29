-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local v1 = 0

local function _toolExposesSkill(p1, p2) --[[ _toolExposesSkill | Line: 19 ]]
	local SkillList = p1.SkillList

	if type(SkillList) ~= "table" then
		return false
	end

	for i, v in ipairs(SkillList) do
		if v.Key == p2 then
			return true
		end
	end

	return false
end

RunService.Heartbeat:Connect(function(p1) --[[ Line: 30 | Upvalues: v1 (ref), LocalPlayer (copy), ReplicatedStorage (copy) ]]
	v1 = v1 + p1

	if v1 < 0.1 then
		return
	end

	v1 = 0

	local ActiveToolSelf = _G.ActiveToolSelf

	if not ActiveToolSelf then
		return
	end

	local Character = LocalPlayer.Character

	if not Character then
		return
	end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")

	if not Humanoid or Humanoid.Health <= 0 then
		return
	end

	if Character:FindFirstChild("Flight") or (Character:FindFirstChild("Holding") or Character:GetAttribute("TeleportCooldown")) then
		return
	end

	local LocalSettings = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("GUI"):WaitForChild("LocalSettings"))
	local Type = ActiveToolSelf.Type

	for i, v in ipairs({ "Z", "X", "C", "V", "F", "B" }) do
		local v12

		if LocalSettings.Get("AutoSkill_" .. v) then
			local v2 = Type .. "-" .. v

			if not (Character:FindFirstChild(v2) or LocalPlayer:FindFirstChild(v2)) then
				if v == "B" then
					local SkillList = ActiveToolSelf.SkillList

					if type(SkillList) == "table" then
						v12 = false

						for i2, v3 in ipairs(SkillList) do
							if v3.Key == "B" then
								v12 = true

								break
							end
						end
					else
						v12 = false
					end

					if v12 then
						ActiveToolSelf:TriggerSkill(v)
					end
				else
					ActiveToolSelf:TriggerSkill(v)
				end
			end
		end
	end
end)

return {}