-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMdBWZvdlRvBEVudW0LRWFzaW5nU3R5bGUEU2luZQ9FYXNpbmdEaXJlY3Rpb24DT3V0CEh1bWFub2lkFUZpbmRGaXJzdENoaWxkT2ZDbGFzcxBIdW1hbm9pZFJvb3RQYXJ0DkZpbmRGaXJzdENoaWxkD0dldEFiaWxpdHlTY2FsZQVTaG9vdAZTaG9vdDMGdHlwZW9mBm51bWJlchJyZXNvbHZlQXNzZXRGb2xkZXIJc3Bhd25CZWFtBk1lZGl1bQtFeHBvbmVudGlhbAR0YXNrBWRlbGF5BUxpZ2h0EHJ1bkRlZmF1bHRBY3Rpb24HcmVxdWlyZQZzY3JpcHQGUGFyZW50BkNvbW1vbg1WaXN1YWxQYWNrYWdlCVNoYWtlR2F0ZQAEBgACAAAADPsAAABNAAA8AAAAAPsBAQCMAkYAbwMBAKQEBQAEDCDApAUIAAcYIMCfAAYBggABAAkDAQLNzMzMzMzkPwMCAwMDBAQEDCDAAwUDBgQHGCDAACIAARgAAAAAAAAAAAAAAAEjAAAAAAYAAgAAAAz7AAAATQAAPAAAAAD7AQEAjAJGAG8DAQCkBAUABAwgwKQFCAAHGCDAnwAGAYIAAQAJAwECzczMzMzM3D8DAgMDAwQEBAwgwAMFAwYEBxggwAAoAAEYAAAAAAAAAAAAAAABKQAAAAAVAwMBAAgFAAAFAwcDA4ABowMAAG8FAAC8AwC4AQAAAJ8DAwJvBgIAvAQAAwMAAACfBAMC/wUAAAAAAADdBgAAxQUGAAEAAAArAwIAKwQBAIIAAQD7BgAATQYGyAQAAABSBwAAnwYCA/ACAwAFAAAA8AJdAAYAAIATCAUAEwkFARMMBQK7LAwCpAsIAAAAcECfCwIC8AsHAAkAAIATCwUCjAwAAGAMAwALAAAAEwoFAisKAQCMCgEADggCAA4JAQArBAEAggABAPsLAQBNCwszCgAAAFIMAQBSDQIAnwsDAvsMAQBNDAyLCwAAAFINBABSDgsAUg8IAFIQCQBSEQYAUhIHAIwTAQBSFAoAnwwJAfACGwAGAACA+wwCAE0MDH8MAAAAUg0AAFIOBACMD7QAnwwEAfsMAQBNDAw8DQAAAFINAACMDlwAbw8OAKQQEgARQPDApBEVABRM8MCfDAYBpAwYAABcYIFvDRkA2Q4AABICAQASAAAAnwwDAYIAAQD7DAIATQwMDxoAAABSDQAAUg4EAIwPjACfDAQB+wwBAE0MDDwNAAAAUg0AAIwOVABvDxsApBASABFA8MCkERUAFEzwwJ8MBgGkDBgAAFxggW8NHADZDgEAEgIBABIAAACfDAMBggABAA4DCAD7CAEATQgI9B0AAABSCQAAUgoDAFILBABSDAEAnwgFAYIAAQAeAwcDCAMJAwoDCwMMAw0DDgQAAHBAAw8DEAMRAxIDAQK4HoXrUbiuPwMCAwMDEwQRQPDAAwUDBgQUTPDAAxQDFQQAXGCBAnsUrkfherQ/AxYCmpmZmZmZqT8C7FG4HoXrsT8DFwIAAQcAARgAAQAAAAEAAAABAAAAAAIAAQMAAAAAAgAAAAIBAQAAAAAAAAAAAAAAAAACAAABAwAAAAAAAQAAAAAAAAAAAAAAAgABAAAAAAAAAQAAAAAAAAAAAAABAAAAAAAAAAQAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAABQEAAAAAAAAAAwcAAAAABAAAAQIAE6MAAACkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQFzBQAAAJ8AAgJNAQAKBgAAAE0CAIwHAAAAwAMIABIAAQASAAAAEgACAIIDAgAJAxgEAAAAQAMZBAAAIEADGgMbAxwDHQYCAQIBAAEYAAIAAAAAAAAAAAEAAQACAAAAAAEAAAAAA2k6+ahbofHZr1/dsz2zyVkZIu7cW/6TqQ==

-- https://lua.expert/
local Common = require(script.Parent.Common)
local VisualPackage = Common.VisualPackage
local ShakeGate = Common.ShakeGate

return function(p1, p2, p3, ...) --[[ Line: 7 | Upvalues: VisualPackage (copy), Common (copy), ShakeGate (copy) ]]
	local Humanoid = p1:FindFirstChildOfClass("Humanoid")
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
	local t = { ... }

	if not (Humanoid or HumanoidRootPart) then
		return
	end

	local v1, v2 = VisualPackage.GetAbilityScale(p1)

	if p3 == "Shoot" or p3 == "Shoot3" then
		local v3 = t[1]
		local v4 = t[2]
		local v6 = typeof(t[3]) == "number" and t[3] > 0 and t[3] or 1

		if not (v3 and (v4 and HumanoidRootPart)) then
			return
		end

		local v7 = Common.resolveAssetFolder(p2, p3)

		Common.spawnBeam(HumanoidRootPart, v7, v3, v4, v1, v2, 1, v6)

		if p3 == "Shoot3" then
			ShakeGate.Medium(p1, HumanoidRootPart, 180)
			Common.fovTo(p1, 92, 0.06, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			task.delay(0.08, function() --[[ Line: 34 | Upvalues: Common (ref), p1 (copy) ]]
				Common.fovTo(p1, 70, 0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			end)
		else
			ShakeGate.Light(p1, HumanoidRootPart, 140)
			Common.fovTo(p1, 84, 0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			task.delay(0.07, function() --[[ Line: 40 | Upvalues: Common (ref), p1 (copy) ]]
				Common.fovTo(p1, 70, 0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			end)
		end
	else
		if not Humanoid then
			return
		end

		Common.runDefaultAction(p1, Humanoid, HumanoidRootPart, p2)
	end
end