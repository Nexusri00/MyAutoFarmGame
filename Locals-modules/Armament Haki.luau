-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local ValueManager = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("ValueManager"))
local v1 = require(game.ReplicatedStorage.Modules.Effects._Shared.EffectSessionStore).new()
local t = { "Right Arm", "Left Arm" }

local function CoatArms(p1, p2, p3) --[[ CoatArms | Line: 14 | Upvalues: t (copy) ]]
	for i, v in ipairs(t) do
		local v1 = p1:FindFirstChild(v)

		if v1 and v1:IsA("BasePart") then
			if p2 then
				if v1:GetAttribute("HakiColor") == nil then
					v1:SetAttribute("HakiColor", v1.Color)
				end

				v1.Color = p3

				continue
			end

			local v2 = v1:GetAttribute("HakiColor")

			if v2 ~= nil then
				v1.Color = v2
				v1:SetAttribute("HakiColor", nil)
			end
		end
	end
end

return {
	["Armament Haki"] = function(p1, p2, p3) --[[ Line: 34 | Upvalues: v1 (copy), ValueManager (copy), CoatArms (copy), t (copy) ]]
		if p2 == true then
			local v12 = v1:Begin(p1, "Armament Haki")

			if not v12:IsCurrent() then
				return
			end

			local v2 = setmetatable({ p1 }, {
				__mode = "v"
			})
			local v3 = typeof(p3) == "Color3" and p3 or Color3.new(255/255, 255/255, 255/255)

			ValueManager:Add(p1, "ArmamentHaki", nil, true)
			CoatArms(p1, true, v3)
			v12:Add(function() --[[ Line: 51 | Upvalues: v2 (copy), ValueManager (ref), CoatArms (ref) ]]
				local v1 = v2[1]

				if v1 then
					ValueManager:Remove(v1, "ArmamentHaki")
					CoatArms(v1, false)
				end
			end)

			for i, v in ipairs(t) do
				local v4 = p1:FindFirstChild(v)

				if v4 and v4:IsA("BasePart") then
					v12:Add(v4:GetPropertyChangedSignal("Color"):Connect(function() --[[ Line: 62 | Upvalues: v2 (copy), v12 (copy), v4 (copy), v3 (copy) ]]
						local v1 = v2[1]

						if not (v1 and v12:IsCurrent()) then
							return
						end

						if v4.Parent == v1 and v4.Color ~= v3 then
							v4.Color = v3
						end
					end))
				end
			end
		else
			if v1:Stop(p1, "Armament Haki") then
				return
			end

			ValueManager:Remove(p1, "ArmamentHaki")
			CoatArms(p1, false)
		end
	end
}