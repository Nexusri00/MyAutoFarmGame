-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOA0dldAhJc0NsaWVudAtMb2NhbFBsYXllcglQbGF5ZXJHdWkVRmluZEZpcnN0Q2hpbGRPZkNsYXNzDFdhaXRGb3JDaGlsZBByZXNvbHZlQ29udGFpbmVyBGdhbWUHQ29yZUd1aQpHZXRTZXJ2aWNlClJ1blNlcnZpY2UHUGxheWVycwlTZWxlY3Rpb24FcGNhbGwAAwIAAQAAAAX7AAAAvAAAfwAAAACfAAIAggAAAAEDAQAMAAEYAAAAAAAMAAAAAAUABAAAABr7AAAADgACAPsAAQCCAAIA+wACALwAAAQAAAAAnwACAg4ADwD7AAMATQAAMQEAAAAOAAsAbwMCALwBALgDAAAAnwEDAisBBQBvAwIAjAQFALwBANMEAAAAnwEEAoIBAgDGAAAAggACAAUDAgMDAwQDBQMGABAHARgAAAAAAQAAAAABAAABAQAAAAAAAAAAAAADABEAAAAABwAAAQIAKKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwKkAgEAAAAAQG8EBQC8AgIWAwAAAJ8CAwKkAwEAAAAAQG8FBgC8AwMWAwAAAJ8DAwKkBAgAAABwQMAFCQASAAMAnwQCAv8FAQAAAAAAwAYKABIABAASAAAAEgABABIAAgAwBgXCCwAAAIIFAgAMAwgEAAAAQAMJAwoDCwMMAw0DDgQAAHBABgAGAQMHAgABAQABGAAFAAAAAAABAAAAAAABAAAAAAABAAAAAAADAAAAAAIAAgAAAAAAAAsBAAAAAAIa3vKN8zDRcXEdY6ZUTfrdasbl+SgamIw=

-- https://lua.expert/
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Selection = game:GetService("Selection")
local ok = pcall(function() --[[ Line: 12 | Upvalues: Selection (copy) ]]
	return Selection:Get()
end)

return {
	resolveContainer = function() --[[ resolveContainer | Line: 16 | Upvalues: ok (copy), CoreGui (copy), RunService (copy), Players (copy) ]]
		if ok then
			return CoreGui
		end

		if not RunService:IsClient() then
			return nil
		end

		local LocalPlayer = Players.LocalPlayer

		if not LocalPlayer then
			return nil
		end

		return LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 5)
	end
}