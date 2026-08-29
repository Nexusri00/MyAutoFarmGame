-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMSBXBhaXJzBW1lcmdlDVJheWNhc3RQYXJhbXMDbmV3E2NyZWF0ZVJheWNhc3RQYXJhbXMGaXBhaXJzC0dldENoaWxkcmVuBU1vZGVsA0lzQQV0YWJsZQRmaW5kBmluc2VydAdjb2xsZWN0CXdvcmtzcGFjZQpDaGFyYWN0ZXJzDkZpbmRGaXJzdENoaWxkB0VuZW1pZXMaZ2V0Q2hhcmFjdGVyc1dpdGhFeGNsdXNpb24ABQgCAAAABwQAAAUCBAQT/wIAAAAAAACkAwEAAAAAQFIEAQCfAwIEFwMBAGoHAgZuA/7/AgAAAKQDAQAAAABAUgQAAJ8DAgQXAwEAagcCBm4D/v8CAAAAggICAAIDAQQAAABAAAUCARgAAAEAAAAAAAAAAQAAAAAAAAABBgAAAAAHAQAAAAYDAAAFAQQMpAECAAAEAICfAQECpAIEAAAAMEBSAwAAnwICBBcCAQBqBgEFbgL+/wIAAACCAQIABQMDAwQEAAQAgAMBBAAAMEAADAUBGAAAAAEAAAAAAf8AAw0AAAAACQECAAAGAwAABQGHHisAAQCCAAEApAEBAAAAAEC8AgBoAgAAAJ8CAgCfAQAEUQESAG8IAwC8BgX+BAAAAJ8GAwIOBg0ApAYHAAAYUID7BwAAUggFAJ8GAwIrBgcA+wcBAJ40BwQFAAAAUggFAKQGCQAAIFCAnwYDAW4B7f8CAACAggABAAoDBgQAAABAAwcDCAMJAwoDCwQAGFCAAwwEACBQgAAWDQEYAAABAAAAAAAAAQAAAAAAAAAAAAABAAAAAAAA/gAFFwAAAAAHAQAAAAYDAAAFAQQW/wEAAAAAAADZAgAAEgAAABIAAQBSAwIApAQBAAAAAEBvBgIAvAQEAwMAAACfBAMAnwMAAVIDAgCkBAEAAAAAQG8GBAC8BAQDAwAAAJ8EAwCfAwABggECAAUDDgQAAABAAw8DEAMRAQIUEgEYAAABAAAIAAAAAAAAAAEAAAAAAAAAARUAAAAAAgAAAQIADaMAAAD/AAMAAAAAAMABAAAwAQAfAQAAAMABAgAwAQCYAwAAAMABBAAwAQApBQAAAIIAAgAGBgADAgYBAwUGAwMSAwABAwEAARgAAgACAAAHAAAIAAAPAQAAAAAEa7ztHexLV3tnO8BALbgwuRuk+mlZeIcc

-- https://lua.expert/
return {
	merge = function(p1, p2) --[[ merge | Line: 5 ]]
		local t = {}

		for k, v in pairs(p2) do
			t[k] = v
		end

		for k, v in pairs(p1) do
			t[k] = v
		end

		return t
	end,
	createRaycastParams = function(p1) --[[ createRaycastParams | Line: 12 ]]
		local v1 = RaycastParams.new()

		for k, v in pairs(p1) do
			v1[k] = v
		end

		return v1
	end,
	getCharactersWithExclusion = function(p1) --[[ getCharactersWithExclusion | Line: 20 ]]
		local t = {}

		local function collect(p12) --[[ collect | Line: 22 | Upvalues: p1 (copy), t (copy) ]]
			if not p12 then
				return
			end

			for i, v in ipairs(p12:GetChildren()) do
				if v:IsA("Model") and not table.find(p1, v) then
					table.insert(t, v)
				end
			end
		end

		collect(workspace:FindFirstChild("Characters"))
		collect(workspace:FindFirstChild("Enemies"))

		return t
	end
}