-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VisualPackage = require(ReplicatedStorage.Modules.VisualPackage)

return {
	Enable = function(p1) --[[ Enable | Line: 10 | Upvalues: VisualPackage (copy), ReplicatedStorage (copy) ]]
		for i, v in ipairs(p1:GetChildren()) do
			if v.Name == "_AstralCoreAura" then
				v:Destroy()
			end
		end

		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return
		end

		if VisualPackage.IsTraitVFXHidden() then
			return
		end

		if not VisualPackage.IsVFXEnabled() then
			return
		end

		local Trait = ReplicatedStorage.Assets.Effects:FindFirstChild("Trait")
		local v1 = if Trait then Trait:FindFirstChild("Astral Core") else Trait
		local v2 = if v1 then v1:FindFirstChild("Aura") else v1

		if not v2 then
			return
		end

		local _AstralCoreAura = v2:Clone()

		_AstralCoreAura.Name = "_AstralCoreAura"
		VisualPackage.RegisterTraitVFX(_AstralCoreAura)
		_AstralCoreAura.Parent = p1

		local v3 = if _AstralCoreAura:IsA("BasePart") then _AstralCoreAura else _AstralCoreAura.PrimaryPart or _AstralCoreAura:FindFirstChildOfClass("BasePart")

		if _AstralCoreAura:IsA("Model") then
			_AstralCoreAura:PivotTo(HumanoidRootPart.CFrame)
		elseif v3 then
			v3.CFrame = HumanoidRootPart.CFrame
		end

		for i, v in ipairs(_AstralCoreAura:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Anchored = false
				v.CanCollide = false
				v.Massless = true
			end
		end

		if v3 and v3:IsA("BasePart") then
			v3.Anchored = false
			v3.CanCollide = false
			v3.Massless = true
		end

		VisualPackage.EnableVFX(_AstralCoreAura, true)

		if not v3 then
			return
		end

		local WeldConstraint = Instance.new("WeldConstraint")

		WeldConstraint.Part0 = v3
		WeldConstraint.Part1 = HumanoidRootPart
		WeldConstraint.Parent = v3
	end,
	Disable = function(p1) --[[ Disable | Line: 69 | Upvalues: VisualPackage (copy), Debris (copy) ]]
		for i, v in ipairs(p1:GetChildren()) do
			if v.Name == "_AstralCoreAura" then
				VisualPackage.EnableVFX(v, false)
				Debris:AddItem(v, 0)
			end
		end
	end
}