-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMdCEluc3RhbmNlA25ldwROYW1lBlBhcmVudAZDcmVhdGUGc2NyaXB0CkNtZHJDbGllbnQOUmVtb3RlRnVuY3Rpb24MQ21kckZ1bmN0aW9uC1JlbW90ZUV2ZW50CUNtZHJFdmVudAZGb2xkZXIIQ29tbWFuZHMFVHlwZXMGU2hhcmVkDlJlcGxpY2F0ZWRSb290DEJ1aWx0SW5UeXBlcw9SZWdpc3RlclR5cGVzSW4HRGVzdHJveQ9CdWlsdEluQ29tbWFuZHMPU2VydmVyIGNvbW1hbmRzBENtZHIORmluZEZpcnN0Q2hpbGQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlClN0YXJ0ZXJHdWkHcmVxdWlyZQlDcmVhdGVHdWkAAwUDAQAAAAykAwIAAAQAgFIEAACfAwICMAEDugMAAABSBAIAKwQBAPsEAAAwBAMkBAAAAIIDAgAFAwEDAgQABACAAwMDBAAJBQEYAAAAAAEAAQAAAAACCgAAAAAIAQIAAABpxgEAAMYCAADGAwAA2QQAABIBAf+kBQEAAAAAQE0FBSQCAAAATQEFDgMAAACkBQYAABRAgG8GBwCfBQICbwYIADAGBboJAAAAUgYBADAGBSQCAAAAUgIFAKQFBgAAFECAbwYKAJ8FAgJvBgsAMAYFugkAAABSBgEAMAYFJAIAAABSAwUApAUGAAAUQIBvBgwAnwUCAm8GDQAwBgW6CQAAAFIGAQAwBgUkAgAAAKQFBgAAFECAbwYMAJ8FAgJvBg4AMAYFugkAAABSBgEAMAYFJAIAAACkBQEAAAAAQE0FBSQCAAAATQUFEg8AAAAwAQUkAgAAADABAGQQAAAAMAIAawcAAAAwAwAhCgAAAKQHAQAAAABATQcHJAIAAABNBwdTEQAAALwFANQSAAAAnwUDAaQFAQAAAABATQUFJAIAAABNBQVTEQAAALwFBVATAAAAnwUCAaQFAQAAAABATQUFJAIAAABNBQV1FAAAAG8GFQAwBgW6CQAAAPsFAABvBxYAvAUFAxcAAACfBQMCRwUDAAAAAID7BQEAnwUBAcEBAACCAAEAGAMGBAAAAEADBAMHAwEDAgQAFECAAwgDCQMDAwoDCwMMAw0DDgMPAxADEQMSAxMDFAMVAxYDFwEABgABGAAAAAIACAAAAAAA+QAAAAEAAAEAAAL8AAAAAQAAAQAAAvwAAAABAAABAAD+AAAAAQAAAQAADQAAAAAAAAACAAEAAQACAAAAAAAAAAACAAAAAAAAAAABAAAAAAAAAAACAAAAAAAAAQACAAcAAAAABAAAAQIAGqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwKkAgYAAABQQKQDCAAAAHBATQMDJAkAAABNAwPBCgAAAJ8CAgLAAwsAEgABABIAAgCCAwIADAMYBAAAAEADGQMaAxsDHAQAAFBAAwYEAABwQAMEAx0GAQEBAQABGAAAAAAAAAABAAAAAAABAAAAAAAAAAADAAAAAQAAAAACd4fMOYJFVOOdOAPafls6mAef201FQ6Y4

-- https://lua.expert/
game:GetService("ReplicatedStorage")

local StarterGui = game:GetService("StarterGui")
local CreateGui = require(script.Parent.CreateGui)

return function(p1) --[[ Line: 6 | Upvalues: StarterGui (copy), CreateGui (copy) ]]
	local v1 = nil

	local function Create(p1, p2, p3) --[[ Create | Line: 9 | Upvalues: v1 (ref) ]]
		local v12 = Instance.new(p1)

		v12.Name = p2
		v12.Parent = if p3 then p3 else v1

		return v12
	end

	v1 = script.Parent.CmdrClient

	local CmdrFunction = Instance.new("RemoteFunction")

	CmdrFunction.Name = "CmdrFunction"
	CmdrFunction.Parent = v1

	local CmdrEvent = Instance.new("RemoteEvent")

	CmdrEvent.Name = "CmdrEvent"
	CmdrEvent.Parent = v1

	local Commands = Instance.new("Folder")

	Commands.Name = "Commands"
	Commands.Parent = v1

	local Types = Instance.new("Folder")

	Types.Name = "Types"
	Types.Parent = v1
	script.Parent.Shared.Parent = v1
	p1.ReplicatedRoot = v1
	p1.RemoteFunction = CmdrFunction
	p1.RemoteEvent = CmdrEvent
	p1:RegisterTypesIn(script.Parent.BuiltInTypes)
	script.Parent.BuiltInTypes:Destroy()
	script.Parent.BuiltInCommands.Name = "Server commands"

	if StarterGui:FindFirstChild("Cmdr") == nil then
		CreateGui()
	end
end