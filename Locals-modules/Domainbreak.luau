-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local Common = require(script.Parent.Common)
local VisualPackage = Common.VisualPackage
local TOOL_TYPE = Common.TOOL_TYPE
local TOOL_NAME = Common.TOOL_NAME

return function(p1, p2, p3) --[[ Line: 11 | Upvalues: Workspace (copy), Common (copy), TOOL_TYPE (copy), TOOL_NAME (copy), VisualPackage (copy), Debris (copy) ]]
	local v1 = Workspace:FindFirstChild("Extra") and Workspace.Extra:FindFirstChild("Effects")

	if v1 and p1 then
		for i, v in ipairs(v1:GetChildren()) do
			if v.Name == "CursedChild_DomainBarrier" and v:GetAttribute("CasterCharName") == p1.Name then
				v:Destroy()
			end
		end
	end

	local v2 = nil
	local v3 = if p1 then p1:FindFirstChild("HumanoidRootPart") else p1

	if v3 and v3:IsA("BasePart") then
		v2 = v3.CFrame
	elseif typeof(p3) == "CFrame" then
		v2 = p3
	end

	if not v2 then
		return
	end

	local v4 = Common.ResolveAsset(_G.Effects, TOOL_TYPE, TOOL_NAME, "F", "Domainbreak")

	if not v4 then
		warn("[Cursed Child.Domainbreak] asset missing at Effects." .. TOOL_TYPE .. "." .. TOOL_NAME .. ".F.Domainbreak")

		return
	end

	local v5 = v4:Clone()

	v5.Parent = Workspace:WaitForChild("Extra"):WaitForChild("Effects")

	if v5:IsA("Model") then
		if not v5.PrimaryPart then
			local v6 = v5:FindFirstChildWhichIsA("BasePart", true)

			if v6 then
				v5.PrimaryPart = v6
			end
		end

		local v7 = v2 * v5:GetPivot():Inverse()

		for i, v in ipairs(v5:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CFrame = v7 * v.CFrame
			end
		end
	elseif v5:IsA("BasePart") then
		v5.CFrame = v2
	end

	for i, v in ipairs(v5:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Anchored = true
			v.CanCollide = false
		end
	end

	if v5:IsA("BasePart") then
		v5.Anchored = true
		v5.CanCollide = false
	end

	VisualPackage.Emit_WithScale(v5)
	Debris:AddItem(v5, 4)
end