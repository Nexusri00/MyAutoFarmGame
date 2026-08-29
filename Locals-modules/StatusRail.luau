-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {}
local v1 = nil

function t.Template() --[[ Template | Line: 20 | Upvalues: v1 (ref), ReplicatedStorage (copy) ]]
	if v1 and v1.Parent then
		return v1
	end

	v1 = nil

	local Assets = ReplicatedStorage:FindFirstChild("Assets")
	local v12 = if Assets then Assets:FindFirstChild("UIs") else Assets

	if not v12 then
		return nil
	end

	for i, v in ipairs(v12:GetChildren()) do
		if v.Name == "Status" and v:IsA("BillboardGui") then
			v1 = v

			return v
		end
	end

	return nil
end
function t.Ensure(p1, p2) --[[ Ensure | Line: 35 | Upvalues: t (copy) ]]
	if not p1 then
		return nil
	end

	local v1 = nil

	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("BillboardGui") and v.Name == p2 then
			if v1 then
				v:Destroy()

				continue
			end

			v1 = v
		end
	end

	if v1 then
		return v1
	end

	local v2 = t.Template()

	if v2 and v2:IsA("BillboardGui") then
		local v3 = v2:Clone()

		v3.Name = p2
		v3.Adornee = p1
		v3.Parent = p1

		return v3
	end

	return nil
end
function t.Set(p1, p2, p3, p4, p5) --[[ Set | Line: 53 ]]
	local v1 = p1:FindFirstChild(p2)

	if p3 == nil then
		if not v1 then
			return
		end

		v1:Destroy()
	else
		if not v1 then
			local v2 = nil

			for i, v in ipairs(p1:GetChildren()) do
				if v:IsA("ImageLabel") and v.Name == "Status" then
					v2 = v

					break
				end
			end

			if not v2 then
				return
			end

			local v3 = v2:Clone()

			v3.Name = p2
			v3.Visible = true
			v3.Parent = p1
			v1 = v3
		end

		if v1:IsA("ImageLabel") then
			v1.Image = p3
		end

		local Potency = v1:FindFirstChild("Potency", true)
		local Count = v1:FindFirstChild("Count", true)

		if Potency and Potency:IsA("TextLabel") then
			Potency.Visible = p4 ~= nil
			Potency.Text = p4 or ""
		end

		if not (Count and Count:IsA("TextLabel")) then
			return
		end

		Count.Visible = p5 ~= nil
		Count.Text = p5 or ""
	end
end

return t