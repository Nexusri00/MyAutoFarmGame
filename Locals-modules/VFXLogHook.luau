-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMdBXRhYmxlBmNvbmNhdAEgCFZGWEVycm9yB21lc3NhZ2UOTG9nQ3VzdG9tRXZlbnQCb3MFY2xvY2sISXNDbGllbnQLTG9jYWxQbGF5ZXIFcGNhbGwGdHlwZW9mBnN0cmluZwNzdWIObG9nVG9BbmFseXRpY3MEZ2FtZRBBbmFseXRpY3NTZXJ2aWNlCkdldFNlcnZpY2UHUGxheWVycxFSZXBsaWNhdGVkU3RvcmFnZQpSdW5TZXJ2aWNlB3JlcXVpcmUGU2hhcmVkCEZvcmdlVkZYDFdhaXRGb3JDaGlsZANtb2QGbG9nZ2VyF19hbmFseXRpY3NIb29rSW5zdGFsbGVkBHdhcm4ABQMAAAEAAAujAAAApAACAAAEAID/AQAAAAAAAN0CAADFAQIAAQAAAG8CAwCfAAMAggAAAAQDAQMCBAAEAIADAwAtAAEYAAEAAAAAAAAAAAAtAAAAAAcAAwAAAAz7AAAA+wIBAG8DAACMBAEA4gUCAPsGAgAwBgWYAQAAALwAAIoDAAAAnwAGAYIAAQAEAwQDBQUBAQMGADoAARgAAAAAAAEAAP8AAAM7AAAAAAgABAEAADujAAAApAACAAAEAICfAAEC+wIAACYBAAKMAgEAYAECAAIAAACCAAEA3gAAAPsBAQC8AQEEAwAAAJ8BAgIrAQEAggABAPsBAgBNAQExBAAAACsBAQCCAAEApAIGAAAAUEDAAwcA3QQAAJ8CAAMOAgcAuywDA1IFAwCkBAkAAACAQJ8EAgLwBAMACgAAAMEDAACCAAEAHAQDAIwF9AFgBQoABAAAAIwGAQCMB/QBNC0DBAYHAABSBQMApAQMAAAsoICfBAQCUgMEAKQEBgAAAFBA2QUBABICAwASAAEAEgED/58EAgHBAwAAggABAA0DBwMIBAAEAIADCQMKAwsEAABQQAYAAwwEAACAQAMNAw4EACyggAIAAR0PARgAAQAAAQAAAAABAgIAAAAAAQMAAAEBAwAAAv4EAAAAAAAAAAEABAAAAAEAAAAAAAAAAAMAAAAAAAAFAB0AAAAAAgACAQAACKMAAAD7AAAA3QEAAJ8AAAH7AAEA3QEAAJ8AAAGCAAEAAABBAAEYAAEAAAEAAAFBAAAAAAkAAAECAEKjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEBAAAAAEBvAwQAvAEBFgMAAACfAQMCpAIBAAAAAEBvBAUAvAICFgMAAACfAgMCpAMBAAAAAEBvBQYAvAMDFgMAAACfAwMCpAQIAAAAcEBNBQISCQAAAG8HCgC8BQXTCwAAAJ8FAwJvBwwAvAUF0wsAAACfBQMCbwcNALwFBdMLAAAAnwUDAJ8EAAJNBQSUDgAAAA4FAgDGBQAAggUCAKkFAQAwBQSUDgAAAE0FBIMPAAAAjAYAANkHAAASAQb/EgADABIAAQASAAAAwAgQABIABQASAAcAMAgEgw8AAADGCAAAwQYAAIIIAgARAxAEAAAAQAMRAxIDEwMUAxUDFgQAAHBAAxcDGAMZAxoDGwMcAx0GAwICAwEAARgACgAAAAAAAQAAAAAAAQAAAAAAAQAAAAAAAgAAAAAAAAAAAAAAAAAAAAACAAABAAMAAAIAAwIAAAAAJAAAAAAFAAABAAAAAARqjzq4Oyx/rLGiwpJnKWOeGpctzFhLULk=

-- https://lua.expert/
local AnalyticsService = game:GetService("AnalyticsService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local logger = require(ReplicatedStorage.Shared:WaitForChild("ForgeVFX"):WaitForChild("mod"):WaitForChild("logger"))

if not logger._analyticsHookInstalled then
	logger._analyticsHookInstalled = true

	local v1 = logger.warn
	local v2 = 0

	local function logToAnalytics(...) --[[ logToAnalytics | Line: 29 | Upvalues: v2 (ref), RunService (copy), Players (copy), AnalyticsService (copy) ]]
		local v1 = os.clock()

		if v1 - v2 < 1 then
			return
		end

		v2 = v1

		if not RunService:IsClient() then
			return
		end

		local LocalPlayer = Players.LocalPlayer

		if not LocalPlayer then
			return
		end

		local ok, result = pcall(function(...) --[[ Line: 45 ]]
			return table.concat({ ... }, " ")
		end, ...)

		if ok and typeof(result) == "string" then
			if #result > 500 then
				result = string.sub(result, 1, 500)
			end

			pcall(function() --[[ Line: 58 | Upvalues: AnalyticsService (ref), LocalPlayer (copy), result (ref) ]]
				AnalyticsService:LogCustomEvent(LocalPlayer, "VFXError", 1, {
					message = result
				})
			end)
		end
	end

	function logger.warn(...) --[[ Line: 65 | Upvalues: v1 (copy), logToAnalytics (copy) ]]
		v1(...)
		logToAnalytics(...)
	end
end

return nil