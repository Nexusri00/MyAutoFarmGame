-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")

require(script.Parent.Parent.Types.ServiceType)

local CheckerData = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Data"):WaitForChild("CheckerData"))

require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("BluePrints"):WaitForChild("PlayerStatsBluePrint"))

return {
	Init = function(p1, p2) --[[ Init | Line: 22 | Upvalues: CheckerData (copy) ]]
		local Character = p2.Character
		local Humanoid = p2.Humanoid
		local RootPart = p2.RootPart
		local Status = Character:WaitForChild("Status", (1 / 0))
		local Config = Character:WaitForChild("Config", (1 / 0))

		p2.StatusFolder = Status
		p2.ConfigFolder = Config
		function p2.ActionChecker(p1) --[[ Line: 34 | Upvalues: Humanoid (copy), RootPart (copy), CheckerData (ref), p2 (copy) ]]
			if not Humanoid.Parent then
				return
			end

			if not RootPart.Parent then
				return
			end

			if not p1 then
				return
			end

			local v1 = CheckerData[p1]

			if not v1 then
				return
			end

			for k, v in pairs(v1) do
				if p2.StatusFolder:FindFirstChild(v) then
					if not p2.StatusFolder:FindFirstChild(v):IsA("BoolValue") then
						return true
					end

					if p2.StatusFolder:FindFirstChild(v).Value == true then
						return true
					end
				end
			end
		end
		function p2.GetStat(p1) --[[ Line: 56 | Upvalues: p2 (copy) ]]
			if not (p2 and p2.ConfigFolder) then
				return
			end

			local v1 = p2.ConfigFolder:FindFirstChild(p1)

			return if v1 then v1.Value else v1
		end
		function p2.GetDashData() --[[ Line: 63 | Upvalues: p2 (copy), Character (copy) ]]
			local v1 = p2.GetStat("MS")
			local v2 = p2.GetStat("DashMultiplier")
			local v3 = math.clamp(0.16 * v2 * v2 + 0.2, 0, 1.5) * 0.325

			return v3 - 0.1, v1 * v2 + 10, v3, Character:HasTag("HasFlashStep")
		end
	end
}