-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMSB1pPZmZzZXQKVmlzdWFsUGFydAZQYXJlbnQEVHlwZQRQYXJ0BU1vZGVsCkF0dGFjaG1lbnQNX3Bvc3RVcGRhdGVDRghHZXRQaXZvdAZDRnJhbWUIQmFzZVBhcnQDSXNBCFBvc2l0aW9uCU1hZ25pdHVkZQNuZXcNVG9PYmplY3RTcGFjZQdQaXZvdFRvDEFwcGx5Wk9mZnNldAADEQMAAAAAaE0DASYAAAAADgMCAA0DAgABAACAggABACsCAQCCAAEATQQBrgIAAAAOBAUATQQBrgIAAABNBAQkAwAAACsEAQCCAAEATQQBEQQAAADwBAYABQAAAPAEBAAGAAAA8AQCAAcAAACCAAEA8AQCAAYAAACpBQABqQUBAPAEAgAHAAAAqQYAAakGAQBNBwEaCAAAACsHCwAOBQYATQcBrgIAAAC8BwdSCQAAAJ8HAgIrBwQATQcBrgIAAABNBweFCgAAAMYIAAAOBg8ATQkBrgIAAABNCAkkAwAAAA4ICQBvCwsAvAkI/gwAAACfCQMCDgkEAE0JCIUKAAAACQcJB2UAAQDGCAAATQkHOw0AAAAmCgIJTQsKqg4AAABvDA8AYAsCAAwAAACCAAEA7A4KCwkNDgNDDAkNpA4RAABAoIBSDwwAnw4CAiYPBwkJDQ4PDggHAE0OCIUKAAAAUhANALwODkYSAAAAnw4DAlINDgAOBQcATQ4BrgIAAABSEA0AvA4OwhMAAACfDgMBggABAE0OAa4CAAAAMA0OhQoAAACCAAEAFAMBAgAAAAAAAAAAAwIDAwMEAwUDBgMHAwgDCQMKAwsDDAMNAw4C/Knx0k1iUD8DDwQAQKCAAxADEQAKEgEYAAABAAAAAQABAAAAAAAAAAABAAEAAAAAAAACAAAAAQAAAAIAAAAAAAAAAAAAAAAAAwEBAAAAAQAAAAAAAQAAAAIEAAEBAAEAAAABAAABAAAAAAACAQAAAAAAAAMBAAAAAAAAAgAAAAILAAAAAAIBAAAAAATAAQAAMAEA5wEAAACCAAEAAgYAAxIBAAYAARgAAAAqCgAAAAABAAABAgADowAAAMAAAACCAAIAAQYBAQEBAAEYAAUAAQAAAAACj+rT/F4YEAPGqtMZFXISrv/yxIi9Lrn9

-- https://lua.expert/
return function(p1) --[[ Line: 6 ]]
	function p1.ApplyZOffset(p1, p2, p3) --[[ ApplyZOffset | Line: 10 ]]
		local ZOffset = p2.ZOffset

		if not ZOffset or ZOffset == 0 then
			return
		end

		if not p3 then
			return
		end

		if not (p2.VisualPart and p2.VisualPart.Parent) then
			return
		end

		local Type = p2.Type

		if Type ~= "Part" and (Type ~= "Model" and Type ~= "Attachment") then
			return
		end

		local v1 = if Type == "Model" then true else false
		local v3 = p2._postUpdateCF or (v1 and p2.VisualPart:GetPivot() or p2.VisualPart.CFrame)
		local v4

		if if Type == "Attachment" then true else false then
			v4 = p2.VisualPart.Parent

			if v4 and v4:IsA("BasePart") then
				v3 = v4.CFrame * v3
			else
				v4 = nil
			end
		else
			v4 = nil
		end

		local Position = v3.Position
		local v5 = p3 - Position
		local Magnitude = v5.Magnitude

		if Magnitude < 0.001 then
			return
		end

		local v6 = CFrame.new(Position + v5 / Magnitude * ZOffset) * (v3 - Position)

		if v4 then
			v6 = v4.CFrame:ToObjectSpace(v6)
		end

		if v1 then
			p2.VisualPart:PivotTo(v6)
		else
			p2.VisualPart.CFrame = v6
		end
	end
end