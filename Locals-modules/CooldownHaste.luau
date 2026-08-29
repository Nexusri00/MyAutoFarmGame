-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMPB3JlcXVpcmUGc2NyaXB0BlBhcmVudBFDb21wcmVzc2lvbkNvbmZpZxFDb21wcmVzc2lvbkN1cnZlcw1GaW5hbENvb2xkb3duDEVmZmVjdGl2ZUNEUhRQb2ludHNGcm9tTXVsdGlwbGllchRGYWN0b3JGcm9tTXVsdGlwbGllcgdJc1JlYWR5FEhhc3RlQ29tcHJlc3Npb25SYXRlE0VmZmVjdGl2ZU11bHRpcGxpZXIFcGNhbGwTLi9Db21wcmVzc2lvbkNvbmZpZxMuL0NvbXByZXNzaW9uQ3VydmVzAAgCAAAAAAAKpAABAAAAAECkAQMAAAAgQE0BASQEAAAATQEBVgUAAACfAAIAggAAAAYDAQQAAABAAwIEAAAgQAMDAwQADwABGAAAAAAAAAAAAAAQAAAAAAIAAAAAAAqkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQH+BQAAAJ8AAgCCAAAABgMBBAAAAEADAgQAACBAAwMDBQAZAAEYAAAAAAAAAAAAABoAAAAABQIAAAAHBAAABQICAgiMAgAAfQECAAIAAACCAAIAPgQBAZUDBADsAgADggICAAICAAAAAAAA8D8CAAAAAAAAWUAAIQYBGAAAAAECAAAAIgAAAAAEAQAAAAYDAAAFAQIJjAEAAH0AAwABAAAAjAEAAIIBAgCVAwAA7AIAA1sBAgCCAQIAAQIAAAAAAABZQAAoBwEYAAAAAQACAAAAKQAAAAADAQAAAAYDAAAFAQIIjAEBAH0BAwAAAAAAjAEAAIIBAgD1AgEAWwECAIIBAgACAgAAAAAAAFlAAgAAAAAAAPA/ADMIARgAAAABAAIAADQAAAAABwEBAAAGAwAABQECDowBAQB9AQIAAAAAAIIAAgCMAwEA+wUAAE0FBX8CAAAAUgYAAJ8FAgI+BAUBQwIDBNgBAAKCAQIAAwIAAAAAAADwPwIAAAAAAABZQAMIAEAJARgAAAABAgAAAAAAAAAAAEEAAAAABAEDAAAGAwAABQECFYwBAQDUAQYAAAAAAPsBAABNAQHNAAAAAJ8BAQIrAQEAggACAPsCAQBNAgJ/AQAAAFIDAACfAgIC+wMCAE0DA8sCAAAACQECAz4DAQT1AgMDggICAAUDCgMIAwsCAAAAAAAA8D8CAAAAAAAAWUAAUgwBGAAAAAAAAAAAAQIAAAAAAAAAAAEAAFMAAAAABgAAAQIAMqMAAADGAAAApAEBAAAAAEDAAgIAnwECAw4BAgBSAAIAZQAFAKQDBAAAADBAbwQFAJ8DAgJSAAMAxgEAAKQCAQAAAABAwAMGAJ8CAgMOAgIAUgEDAGUABQCkBAQAAAAwQG8FBwCfBAICUgEEAP8CBAAAAAAAwAMIADADAhUJAAAAwAMKADADAlcLAAAAwAMMADADAn8NAAAAwAMOABIAAgAwAwKPDwAAANkDBgASAQH/EgACABIBAP8wAwKpEAAAAMEAAACCAgIAEQMNBAAAAEAGAAMBBAAAMEADDgYBAw8GAgMGBgMDBwYEAwgGBQMJAwwHAAECAwQFBgEAARgADAIAAAADAAAAAAAAAAUCAAAAAwAAAAAAAAADAAIAAAcAAAsAAA0AAAASAAAAAAAIAAEAAAAAB+C5Aa1cQbhQoUOrU7EOmZqQoRbZ0n1rrA==

-- https://lua.expert/
local ok, result = pcall(function() --[[ Line: 15 ]]
	return require(script.Parent.CompressionConfig)
end)
local v1 = if ok then result else require("./CompressionConfig")
local ok2, result2 = pcall(function() --[[ Line: 25 ]]
	return require(script.Parent.CompressionCurves)
end)
local v2 = if ok2 then result2 else require("./CompressionCurves")
local t = {
	FinalCooldown = function(p1, p2) --[[ FinalCooldown | Line: 33 ]]
		if p2 <= 0 then
			return p1
		end

		return p1 / (p2 / 100 + 1)
	end,
	EffectiveCDR = function(p1) --[[ EffectiveCDR | Line: 40 ]]
		if p1 <= 0 then
			return 0
		end

		return p1 / (p1 + 100) * 100
	end,
	PointsFromMultiplier = function(p1) --[[ PointsFromMultiplier | Line: 51 ]]
		if p1 >= 1 then
			return 0
		end

		return (1 - p1) * 100
	end
}

function t.FactorFromMultiplier(p1) --[[ FactorFromMultiplier | Line: 64 | Upvalues: t (copy) ]]
	if p1 >= 1 then
		return p1
	end

	return 1 / (1 + t.PointsFromMultiplier(p1) / 100)
end
function t.EffectiveMultiplier(p1) --[[ EffectiveMultiplier | Line: 82 | Upvalues: v2 (ref), t (copy), v1 (ref) ]]
	if p1 >= 1 or not v2.IsReady() then
		return p1
	end

	return 1 - t.PointsFromMultiplier(p1) * v1.HasteCompressionRate / 100
end

return t