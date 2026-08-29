-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMMBnR5cGVvZghJbnN0YW5jZQlDaGFyYWN0ZXIQSHVtYW5vaWRSb290UGFydA5GaW5kRmlyc3RDaGlsZAZDRnJhbWUfVGFyZ2V0IHBsYXllciBoYXMgbm8gY2hhcmFjdGVyLgdWZWN0b3IzA25ldwZpcGFpcnMWVGVsZXBvcnRlZCAlZCBwbGF5ZXJzLgZmb3JtYXQAAgwDAAAABwAAAQMEQQJFxgMAALssAgNSBQIApAQBAAAAAECfBAIC8AQVAAIAAIBNBAJpAwAAAA4EDgBNBAJpAwAAAG8GBAC8BAQDBQAAAJ8EAwIOBAcATQQCaQMAAABNBARmBAAAAE0DBIUGAAAAZQAPAG8EBwCCBAIAZQAMALssAgNSBQIApAQBAAAAAECfBAIC8AQGAAgAAICkBAoAACRggFIFAgCfBAICUgMEAKQEDAAAALBAUgUBAJ8EAgRRBBAATQkIaQMAAAAOCQ0ATQkIaQMAAABvCwQAvAkJAwUAAACfCQMCDgkGAE0JCGkDAAAATQkJZgQAAAAwAwmFBgAAAG4E7/8CAACAbwQNABwGAQC8BASNDgAAAJ8EAwCCBAAADwMBBAAAAEADAgMDAwQDBQMGAwcDCAMJBAAkYIADCgQAALBAAwsDDAABAAEYAAIAAAAAAAABAAAAAAAAAAAAAQAAAAAAAAIAAAIAAAAAAAABAAAAAAMAAAAAAQAAAAAAAAAAAAEAAAAAAP4ABgAAAAAAAgAAAAABAAABAgADowAAAMAAAACCAAIAAQYAAQABAAEYAAAAAQAAAAABCvWWkhdwGGWc5tKFOZDpjXrtgeY4MfyT

-- https://lua.expert/
return function(p1, p2, p3) --[[ Line: 1 ]]
	local v1 = nil

	if typeof(p3) == "Instance" then
		if not (p3.Character and p3.Character:FindFirstChild("HumanoidRootPart")) then
			return "Target player has no character."
		end

		v1 = p3.Character.HumanoidRootPart.CFrame
	elseif typeof(p3) == "Vector3" then
		v1 = CFrame.new(p3)
	end

	for i, v in ipairs(p2) do
		if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
			v.Character.HumanoidRootPart.CFrame = v1
		end
	end

	return ("Teleported %d players."):format(#p2)
end