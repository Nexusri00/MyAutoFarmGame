-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMfB0Rlc3Ryb3kGQ29sb3IzB2Zyb21SR0IERG9uZQhOZXdGcmFtZQxUd2Vlbl9PYmplY3QJVGludENvbG9yCENvbnRyYXN0CkJyaWdodG5lc3MKU2F0dXJhdGlvbgdFbmFibGVkBlBhcmVudAlUd2VlbkluZm8DbmV3BEVudW0LRWFzaW5nU3R5bGUGTGluZWFyClR3ZWVuX0luZm8QVHdlZW5fUHJvcGVydGllcwZQcm9tcHQEdGFzawR3YWl0CmN1dHNjZW5lT24GQ2FtUmlnBkNvbW1vbgtJbXBhY3RGcmFtZQVzcGF3bgVGcmFtZQRnYW1lCExpZ2h0aW5nCkdldFNlcnZpY2UABAIAAQAAAAX7AAAAvAAAUAAAAACfAAIBggABAAEDAQAhAAEYAAAAAAAhAAAAAAoAAwAAAFj/AAAAAgAAAKQBAgAABACAjAL/AIwD/wCMBP8AnwEEAqQCAgAABACAjAMAAIwEAACMBQAAnwIEAMUAAQABAAAAjAMBAIwBDACMAgEAqAFDAPsEAABNBAQ1AwAAACsEPwD7BAEATQQENAQAAACfBAECTQUELQUAAAB4CQMGIQgJB5UHCAaHBgAHMAYFLAgAAABNBQQtBQAAAG8GCQAwBgUzCgAAAE0FBC0FAAAAIQcDBw0HAwAGAACAbwYLAGUAAQBvBgwAMAYF7Q0AAABNBQQtBQAAAIwG//8wBgWKDgAAAE0FBC0FAAAAqQYBADAGBfAPAAAATQUELQUAAAD7BgIAMAYFJBAAAACkBRMAAEgQgW8GFACkBxgAF1hQwZ8FAwIwBQTLGQAAAOIFGwAwBQQEHAAAANkHAAASAAQAvAUEfR0AAACfBQMBpAUgAAB84IFvBhQAnwUCAYsBvf+CAAEAIQMCAwMEAAQAgAMEAwUDBgIAAAAAAADwPwIAAAAAAAAAQAMHAgAAAAAAAPg/AwgCmpmZmZmZ2T8CmpmZmZmZ2b8DCQMKAwsDDAMNAw4EAEgQgQKamZmZmZmZPwMPAxADEQQXWFDBAxICAAAAAAAAAAAIAgoaAAAADRoAAAADEwMUAxUDFgQAfOCBAQAQAAEYAAABAAAAAAABAAAAAAAAAAIAAAABAAAAAQAAAAEAAAAAAAAAAQAAAAABAAAAAAAAAAAAAQAAAAABAAAAAAEAAAAAAQAAAAAAAAABAAABAAAAAAEAAAD0DhIAAAAABQIBAAAHBAAABQICDxcNAAIAAAAAAIIAAQBNAgGpAQAAACsCAQCCAAEATQIBjQIAAAArAgEAggABAE0CAXMDAAAATQICmgQAAACkAwcAABhQgNkEAAASAAEAEgACABICAACfAwIBggABAAgCAAAAAAAATkADFwMYAxkDGgMVAxsEABhQgAEBCRwBGAAAAAEAAAABAAAAAgAAAAIAAAAAAAAVCgAAAAADAAABAgAOowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAv8BAQAAAAAAwAIEABIAAAAwAgGdBQAAAIIBAgAGAx0EAAAAQAMeAx8GAgMcAQIBAAEYAAIAAAAAAAIABAAAAB4BAAAAAAOhK0e1wNPrW65VTNsbRdP30TNQwZPvLbQ=

-- https://lua.expert/
local Lighting = game:GetService("Lighting")

return {
	Frame = function(p1, p2) --[[ Frame | Line: 9 | Upvalues: Lighting (copy) ]]
		if p1 ~= 60 then
			return
		end

		if not p2.cutsceneOn then
			return
		end

		if p2.CamRig then
			local ImpactFrame = p2.Common.ImpactFrame

			task.spawn(function() --[[ Line: 16 | Upvalues: p2 (copy), ImpactFrame (copy), Lighting (ref) ]]
				local t = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0) }

				for i = 1, 12 do
					if p2.Done then
						break
					end

					local v1 = ImpactFrame.NewFrame()

					v1.Tween_Object.TintColor = t[(i - 1) % 2 + 1]
					v1.Tween_Object.Contrast = 1.5
					v1.Tween_Object.Brightness = if i % 2 == 1 then 0.4 else -0.4
					v1.Tween_Object.Saturation = -1
					v1.Tween_Object.Enabled = true
					v1.Tween_Object.Parent = Lighting
					v1.Tween_Info = TweenInfo.new(0.025, Enum.EasingStyle.Linear)
					v1.Tween_Properties = {
						Contrast = 0,
						Brightness = 0
					}
					v1:Prompt(function() --[[ Line: 33 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
					task.wait(0.025)
				end
			end)
		end
	end
}