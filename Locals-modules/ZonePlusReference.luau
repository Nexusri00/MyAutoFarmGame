-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMSBnNjcmlwdAROYW1lDkZpbmRGaXJzdENoaWxkCEluc3RhbmNlA25ldwtPYmplY3RWYWx1ZQZQYXJlbnQFVmFsdWUJQm9vbFZhbHVlBGdhbWUKUnVuU2VydmljZQpHZXRTZXJ2aWNlCElzQ2xpZW50BkNsaWVudAZTZXJ2ZXIWYWRkVG9SZXBsaWNhdGVkU3RvcmFnZQlnZXRPYmplY3QRUmVwbGljYXRlZFN0b3JhZ2UAAwcAAQAAADf7AAAApAIBAAAAAEBNAgK6AgAAALwAAAMDAAAAnwADAg4AAgCpAQAAggECAKQBBgAAFECAbwIHAJ8BAgKkAgEAAAAAQE0CAroCAAAAMAIBugIAAACkAgEAAAAAQE0CAiQIAAAAMAIB7AkAAAD7AgAAMAIBJAgAAACkAgYAABRAgG8DCgCfAgICpAQMAAAAsEBvBg0AvAQEFg4AAACfBAMCvAQEBA8AAACfBAICDgQCAG8DEABlAAEAbwMRADADAroCAAAAqQMBADADAuwJAAAAMAECJAgAAACCAQIAEgMBBAAAAEADAgMDAwQDBQQAFECAAwYDBwMIAwkDCgQAALBAAwsDDAMNAw4DDwAJEAEYAAAAAAAAAAABAQACAAAAAQAAAAAAAQAAAAAAAQAAAQAAAAEAAAAAAAAAAAAAAAAAAAEAAAEAAQoAAAAAAwABAAAADPsAAACkAgEAAAAAQE0CAroCAAAAvAAAAwMAAACfAAMCDgABAIIAAgCpAQAAggECAAQDAQQAAABAAwIDAwAZEQEYAAAAAAAAAAABAQIAGgAAAAADAAABAgASowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAv8BAgAAAAAAwAIEABIAAAAwAgF7BQAAAMACBgASAAAAMAIBGQcAAACCAQIACAMKBAAAAEADEgMMBgADEAYBAxECAAEBAAEYAAUAAAAAAAEAAgAAABAAAAAIAQAAAAACnkZtRqqA7BRvgM3ernBZXe5eejKsggdH

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")

return {
	addToReplicatedStorage = function() --[[ addToReplicatedStorage | Line: 9 | Upvalues: ReplicatedStorage (copy) ]]
		if ReplicatedStorage:FindFirstChild(script.Name) then
			return false
		end

		local v1 = Instance.new("ObjectValue")

		v1.Name = script.Name
		v1.Value = script.Parent
		v1.Parent = ReplicatedStorage

		local v2 = Instance.new("BoolValue")

		v2.Name = if game:GetService("RunService"):IsClient() then "Client" else "Server"
		v2.Value = true
		v2.Parent = v1

		return v1
	end,
	getObject = function() --[[ getObject | Line: 25 | Upvalues: ReplicatedStorage (copy) ]]
		local v1 = ReplicatedStorage:FindFirstChild(script.Name)

		if v1 then
			return v1
		end

		return false
	end
}