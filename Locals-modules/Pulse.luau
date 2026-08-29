-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VisualPackage = require(ReplicatedStorage.Modules.VisualPackage)

return {
	Run = function(p1, p2, p3) --[[ Run | Line: 10 | Upvalues: ReplicatedStorage (copy), Debris (copy), VisualPackage (copy) ]]
		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return
		end

		local Trait = require(ReplicatedStorage.Modules.Effects.SoundData).Sounds:FindFirstChild("Trait")
		local v1 = if Trait then Trait:FindFirstChild(p2) or Trait:FindFirstChild(p2 .. " ") else Trait
		local v2 = if v1 then v1:FindFirstChild(p3) else v1

		if v2 then
			local v3 = v2:Clone()

			v3.Parent = HumanoidRootPart
			v3:Play()
			Debris:AddItem(v3, 5)
		end

		if VisualPackage.IsTraitVFXHidden() then
			return
		end

		if not VisualPackage.IsVFXEnabled() then
			return
		end

		local Trait2 = ReplicatedStorage.Assets.Effects:FindFirstChild("Trait")
		local v4 = if Trait2 then Trait2:FindFirstChild(p2) else Trait2
		local v5 = if v4 then v4:FindFirstChild(p3) else v4

		if not v5 then
			return
		end

		local v6 = v5:Clone()

		VisualPackage.RegisterTraitVFX(v6)
		v6.Parent = HumanoidRootPart

		if v6:IsA("Model") then
			v6:PivotTo(HumanoidRootPart.CFrame)

			local v7 = v6.PrimaryPart or v6:FindFirstChildOfClass("BasePart")

			if v7 then
				local Weld = Instance.new("Weld")

				Weld.Part0 = HumanoidRootPart
				Weld.Part1 = v7
				Weld.C0 = CFrame.new(0, 0, 0)
				Weld.Parent = v7
			end
		elseif v6:IsA("BasePart") then
			v6.CFrame = HumanoidRootPart.CFrame

			local Weld = Instance.new("Weld")

			Weld.Part0 = HumanoidRootPart
			Weld.Part1 = v6
			Weld.C0 = CFrame.new(0, 0, 0)
			Weld.Parent = v6
		end

		for i, v in ipairs(v6:GetDescendants()) do
			if v:IsA("Sound") then
				v:Play()
				Debris:AddItem(v, v.TimeLength + 1)
			end
		end

		VisualPackage.Emit_WithScale(v6, (VisualPackage.GetAbilityScale(p1)))
		Debris:AddItem(v6, 3)
	end
}