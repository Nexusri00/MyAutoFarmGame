-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMyDVVzZXJJbnB1dFR5cGUHS2V5Q29kZQpEaXNwYXRjaGVyBENtZHIEVXRpbBNSdW5FbWJlZGRlZENvbW1hbmRzDkV2YWx1YXRlQW5kUnVuBVJlcGx5DlN1YnN0aXR1dGVBcmdzDCVzICQgJXMgOiAlcwROYW1lBmZvcm1hdAZDb2xvcjMHZnJvbVJHQgpDTURSX0JpbmRzCEdldFN0b3JlASAKRGlzY29ubmVjdAtHZXRBcmd1bWVudARUeXBlCXVzZXJJbnB1dApJbnB1dEJlZ2FuB0Nvbm5lY3QQYmluZGFibGVSZXNvdXJjZRBVbmltcGxlbWVudGVkLi4uBnBsYXllcgdDaGF0dGVkF0JvdW5kIGNvbW1hbmQgdG8gaW5wdXQuCUNsaWVudFJ1bgRnYW1lEFVzZXJJbnB1dFNlcnZpY2UKR2V0U2VydmljZQRiaW5kB0FsaWFzZXMLRGVzY3JpcHRpb24vQmluZHMgYSBjb21tYW5kIHN0cmluZyB0byBhIGtleSBvciBtb3VzZSBpbnB1dC4FR3JvdXALRGVmYXVsdFV0aWwEQXJncyV1c2VySW5wdXQgISBiaW5kYWJsZVJlc291cmNlIEAgcGxheWVyBUlucHV0OFRoZSBrZXkgb3IgaW5wdXQgdHlwZSB5b3UnZCBsaWtlIHRvIGJpbmQgdGhlIGNvbW1hbmQgdG8uB2NvbW1hbmQHQ29tbWFuZClUaGUgY29tbWFuZCB5b3Ugd2FudCB0byBydW4gb24gdGhpcyBpbnB1dAZzdHJpbmcJQXJndW1lbnRzHVRoZSBhcmd1bWVudHMgZm9yIHRoZSBjb21tYW5kB0RlZmF1bHQAAAQJAgMAAAAjDgEBAIIAAQBNAgDCAAAAAPsDAADxAgYAAwAAAE0CALMBAAAA+wMAAJoCFwADAAAA+wIBAPsEAQBNBAQKAgAAAPsGAQBNBgaeAwAAAE0GBp4EAAAATQYGYgUAAAD7BwEATQcHCgIAAAD7CAIAnwYDALwEBF4GAAAAnwQAALwCAtkHAAAAnwIAAYIAAQAIAwEDAgMDAwQDBQMGAwcDCAAnAAEYAAEDAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAIoAAAAAAwBAwAABwAAAQMFJwI0/wEAAAEAAABSAgAAxQECAgEAAAD7AgAATQICngAAAABNAgKeAQAAAE0CAmICAAAA+wMAAE0DAwoDAAAA+wQAAE0EBJ4AAAAATQQEngEAAABNBASCBAAAAPsFAQBSBgEAnwQDAJ8CAAL7AwAAbwUFAPsHAgBNBwe6BgAAAFIIAgD7CQAATQkJCgMAAABSCwIAvAkJXgcAAACfCQMAvAUFjQgAAACfBQACpAYLAAAokICMB/QAjAhcAIwJQgCfBgQAvAMD2QwAAACfAwABggABAA0DBAMFAwYDAwMJAwoDCwMHAwwDDQMOBAAokIADCAAzAAEYAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAABAAEAAAEBAAAAAAAA/QAABAAAAAAA/AAABTQAAAAACQQBAAAAOG8GAAC8BABVAQAAAJ8EAwJSBQIAbwYCAFIHAwBzAgUHhwUEAQ4FBACHBQQBvAUFGgMAAACfBQIBjAcBALwFAN4EAAAAnwUDAk0FBREFAAAATQUFugYAAADwBQ0ABwAAgPsGAABNBgaCCAAAANkIAAASAAEAEgAAABIBAv+8BgbHCQAAAJ8GAwJqBgQBZQARAPAFBAAKAACAbwYLAMECAACCBgIA8AULAAwAAIBNBgF0DQAAANkIAQASAAAAEgEC/xIAAQC8BgbHCQAAAJ8GAwJqBgQBbwYOAMECAACCBgIADwMPAxADEQMSAxMDFAMLAxUDFgMXAxgDGQMaAxsDHAIAARsdARgAAAAAAgAAAAIAAQAAAAMAAAAAAAAAAgABAAAAAAAAAAAAAAAJAAEAAAEAAQAAAAAAAAAAAAwAABwAAAAABgAAAQIAGqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwLiAQ0A/wIAAAAAAAAwAgEnBgAAAP8CAAADAAAA4gMSAOIEFgDiBRwAxQIDBAEAAAAwAgHbCwAAAMACHQASAAAAMAIBMwwAAACCAQIAHgMeBAAAAEADHwMgAwsDIQMiAyMDJAMlAyYDJwMdCAYEBQAAAAb/////BwgAAAAJCgAAAAv/////DP////8DFAMoAykDKggDDg8AAAAEEAAAAAcRAAAAAysDLAMtCAMOEwAAAAQUAAAABxUAAAADLgMvAzADMQMyCAQOFwAAAAQYAAAABxkAAAAaGwAAAAYCAQIBAAEYAAAAAAAAAAICAAAAAwABBQUAAPUAEwAAAAABAAAAAAMW4ZpxOA6qX1avF6Ll+g2yZvmNBSQl8HA=

-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")

return {
	Name = "bind",
	Description = "Binds a command string to a key or mouse input.",
	Group = "DefaultUtil",
	Aliases = {},
	Args = {
		{
			Type = "userInput ! bindableResource @ player",
			Name = "Input",
			Description = "The key or input type you\'d like to bind the command to."
		},
		{
			Type = "command",
			Name = "Command",
			Description = "The command you want to run on this input"
		},
		{
			Type = "string",
			Name = "Arguments",
			Description = "The arguments for the command",
			Default = ""
		}
	},
	ClientRun = function(p1, p2, p3, p4) --[[ ClientRun | Line: 27 | Upvalues: UserInputService (copy) ]]
		local v1 = p1:GetStore("CMDR_Binds")
		local v2 = p3 .. " " .. p4

		if v1[p2] then
			v1[p2]:Disconnect()
		end

		local v3 = p1:GetArgument(1).Type.Name

		if v3 == "userInput" then
			v1[p2] = UserInputService.InputBegan:Connect(function(p12, p22) --[[ Line: 39 | Upvalues: p2 (copy), p1 (copy), v2 (ref) ]]
				if p22 then
					return
				end

				if p12.UserInputType ~= p2 and p12.KeyCode ~= p2 then
					return
				end

				p1:Reply(p1.Dispatcher:EvaluateAndRun(p1.Cmdr.Util.RunEmbeddedCommands(p1.Dispatcher, v2)))
			end)
		else
			if v3 == "bindableResource" then
				return "Unimplemented..."
			end

			if v3 ~= "player" then
				return "Bound command to input."
			end

			v1[p2] = p2.Chatted:Connect(function(p12) --[[ Line: 51 | Upvalues: p1 (copy), v2 (ref), p2 (copy) ]]
				local v1 = p1.Cmdr.Util.RunEmbeddedCommands(p1.Dispatcher, p1.Cmdr.Util.SubstituteArgs(v2, { p12 }))

				p1:Reply(("%s $ %s : %s"):format(p2.Name, v1, p1.Dispatcher:EvaluateAndRun(v1)), Color3.fromRGB(244, 92, 66))
			end)
		end

		return "Bound command to input."
	end
}