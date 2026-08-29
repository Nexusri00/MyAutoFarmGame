-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local t = {}
local Elastic = Enum.EasingStyle.Elastic
local Out = Enum.EasingDirection.Out

function t.Animate(p1, p2) --[[ Animate | Line: 19 | Upvalues: Elastic (copy), Out (copy), TweenService (copy) ]]
	local v1 = if typeof(p1) == "table" then p1 else { p1 }
	local v5 = p2 and p2.rotationOffset or 20
	local v6 = p2 and p2.staggerDelay or 0.15
	local v7 = if p2 then p2.forceAnchored else p2
	local v8 = if p2 then p2.OGRotation else p2
	local v9 = p2 and p2.ScaleY or 0.2

	if v7 then
		for i, v in ipairs(v1) do
			if v:IsA("GuiObject") then
				local v10 = 0
				local AnchorPoint = v.AnchorPoint
				local v11 = if AnchorPoint.X == 0.5 then 0 else 0.5 - AnchorPoint.X

				if AnchorPoint.Y ~= 0.5 then
					v10 = 0.5 - AnchorPoint.Y
				end

				v.AnchorPoint = Vector2.new(0.5, 0.5)

				local Position = v.Position

				v.Position = UDim2.new(Position.X.Scale + v11, Position.X.Offset, Position.Y.Scale + v10, Position.Y.Offset)
			end
		end
	end

	local v12 = TweenInfo.new(p2 and p2.duration or 0.7, p2 and p2.easingStyle or Elastic, p2 and p2.easingDirection or Out)

	for i, v in ipairs(v1) do
		if v:IsA("GuiObject") then
			local Position = v.Position
			local v13 = v8 or v.Rotation
			local v14 = UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale + v9, Position.Y.Offset)
			local v15 = v13 + v5

			task.delay((i - 1) * v6, function() --[[ Line: 73 | Upvalues: v (copy), v14 (copy), v15 (copy), TweenService (ref), v12 (copy), Position (copy), v13 (copy) ]]
				v.Position = v14
				v.Rotation = v15
				v.Visible = true
				TweenService:Create(v, v12, {
					Position = Position,
					Rotation = v13
				}):Play()
			end)
		end
	end
end

return t