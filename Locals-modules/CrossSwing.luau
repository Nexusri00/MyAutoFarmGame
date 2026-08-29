-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMiBERvbmUGUGFyZW50CkRpc2Nvbm5lY3QCb3MFY2xvY2sGQ0ZyYW1lBkFuZ2xlcwVNb2RlbANJc0EHUGl2b3RUbwhCYXNlUGFydAlIZWFydGJlYXQHQ29ubmVjdAVjbG9uZQlEb21haW5NYXAORmluZEZpcnN0Q2hpbGQGRm9sZGVyBUNyb3NzC1ByaW1hcnlQYXJ0FkZpbmRGaXJzdENoaWxkV2hpY2hJc0EIR2V0UGl2b3QDbmV3BmlwYWlycw5HZXREZXNjZW5kYW50cwhBbmNob3JlZApDYW5Db2xsaWRlCENhblF1ZXJ5CENhblRvdWNoBHRhc2sFc3Bhd24FU2V0dXAEZ2FtZQpSdW5TZXJ2aWNlCkdldFNlcnZpY2UBBgAECAAFAAAANfsAAABNAAA1AAAAACsABAD7AAEATQAAJAEAAAArAAkA+wACAA4ABgD7AAIAvAAAGgIAAACfAAIBxgAAAN4AAgCCAAEApAEFAAAQMICfAQEC+wIDACYAAQJbAQAG+wMEAKQECQAAIHCAjAUAAFIGAQCMBwAAnwQEAgkCAwT7AwEAbwUKALwDA/4LAAAAnwMDAg4DBgD7AwEAUgUCALwDA8IMAAAAnwMDAYIAAQD7AwEAbwUNALwDA/4LAAAAnwMDAg4DAwD7AwEAMAIDhQcAAACCAAEADgMBAwIDAwMEAwUEABAwgAI5nVKiRt/BPwMGAwcEACBwgAMIAwkDCgMLAC8AARgAAAAAAAAAAAEAAAAAAAAAAQIAAAAAAQEAAAAAAAAAAQAAAAAAAQAAAAAAAQAAAAAAAQAAAjAAAAAABQAEAAAAE6QAAgAABACAnwABAsYBAAD7AgAATQIC/QMAAADZBAAAEgIBABICAgASAQH/EgAAABICAwC8AgLHBAAAAJ8CAwJSAQIAwQEAAIIAAQAFAwQDBQQABACAAwwDDQEAKwABGAAAAAEBAAAAAAAAAAAAAAAADgAtAAAAAA4BAQAAAGVNAQDaAAAAAG8EAQC8AgEDAgAAAJ8CAwJSAwIADgMEAG8FAwC8AwIDAgAAAJ8DAwJSBAMADgQEAG8GBAC8BAMDAgAAAJ8EAwIrBAEAggABAMYFAABvCAUAvAYE/gYAAACfBgMCDgYQAE0GBJsHAAAAKwYIAG8ICACpCQEAvAYEVAkAAACfBgQCDgYCADAGBJsHAAAAvAYEUgoAAACfBgICUgUGAGUADABvCAgAvAYE/gYAAACfBgMCDgYDAE0FBIULAAAAZQAEAKQGDQAAMLCAnwYBAlIFBgCkBg8AAADgQLwHBEcQAAAAnwcCAJ8GAARRBhEAbw0IALwLCv4GAAAAnwsDAg4LDACpCwEAMAsKRREAAACpCwAAMAsK0xIAAACpCwAAMAsKYhMAAACpCwAAMAsK9hQAAABuBu7/AgAAgG8ICAC8BgT+BgAAAJ8GAwIOBgYAqQYBADAGBEURAAAAqQYAADAGBNMSAAAApAYXAABYUIHZBwAAEgIAABIAAAASAAQAEgEF/58GAgHBBQAAggABABgDDgMPAxADEQMSAwgDCQMTAwsDFAMVAwYDFgQAMLCAAxcEAADgQAMYAxkDGgMbAxwDHQMeBABYUIEBAQcfARgAAAEAAAABAAAAAAABAAAAAAABAAIBAAAAAAIAAAEAAAAAAQAAAgAAAAABAAAAAAEAAAIAAAADAAAAAAAAAQAAAAACAAABAAABAAABAAD6AAkAAAAAAgAAAQAAAwAAAAAAAAATAAgAAAAAAwAAAQIADqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwL/AQEAAAAAAMACBAASAAAAMAIBmQUAAACCAQIABgMgBAAAAEADIQMiBgIDHwECAQABGAACAAAAAAACAAIAAAA5AQAAAAADZCqescH4Evfwu/byj6HoIRQyicVW7vSw

-- https://lua.expert/
local RunService = game:GetService("RunService")

return {
	Setup = function(p1) --[[ Setup | Line: 7 | Upvalues: RunService (copy) ]]
		local DomainMap = p1.clone:FindFirstChild("DomainMap")
		local v1 = if DomainMap then DomainMap:FindFirstChild("Folder") else DomainMap
		local v2 = v1 and v1:FindFirstChild("Cross")

		if not v2 then
			return
		end

		local v3

		if v2:IsA("Model") then
			if not v2.PrimaryPart then
				local v4 = v2:FindFirstChildWhichIsA("BasePart", true)

				if v4 then
					v2.PrimaryPart = v4
				end
			end

			v3 = v2:GetPivot()
		else
			v3 = if v2:IsA("BasePart") then v2.CFrame else CFrame.new()
		end

		for i, v in ipairs(v2:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Anchored = true
				v.CanCollide = false
				v.CanQuery = false
				v.CanTouch = false
			end
		end

		if v2:IsA("BasePart") then
			v2.Anchored = true
			v2.CanCollide = false
		end

		task.spawn(function() --[[ Line: 43 | Upvalues: RunService (ref), p1 (copy), v2 (copy), v3 (ref) ]]
			local v1 = os.clock()
			local v22 = nil

			v22 = RunService.Heartbeat:Connect(function() --[[ Line: 47 | Upvalues: p1 (ref), v2 (ref), v22 (ref), v1 (copy), v3 (ref) ]]
				if p1.Done or not v2.Parent then
					if not v22 then
						return
					end

					v22:Disconnect()
					v22 = nil
				else
					local v23 = v3 * CFrame.Angles(0, (os.clock() - v1) * 0.13962634015954636, 0)

					if v2:IsA("Model") then
						v2:PivotTo(v23)

						return
					end

					if not v2:IsA("BasePart") then
						return
					end

					v2.CFrame = v23
				end
			end)
		end)
	end
}