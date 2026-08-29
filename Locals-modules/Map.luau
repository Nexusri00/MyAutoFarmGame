-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMVE2NyZWF0ZVJheWNhc3RQYXJhbXMFbWVyZ2UDZ2V0B3JlcXVpcmUGc2NyaXB0BlBhcmVudAlVdGlsaXRpZXMFdGFibGUGZnJlZXplCkZpbHRlclR5cGURUmVzcGVjdENhbkNvbGxpZGULSWdub3JlV2F0ZXIaRmlsdGVyRGVzY2VuZGFudHNJbnN0YW5jZXMERW51bRFSYXljYXN0RmlsdGVyVHlwZQdJbmNsdWRlCXdvcmtzcGFjZQNNYXAMV2FpdEZvckNoaWxkCGluc3RhbmNlBmZpZWxkcwACBQEDAAAGAwAABQGEDisAAgD7AQAAggECAPsBAQBNAQGYAAAAAPsCAQBNAgIfAQAAAFIDAAD7BAIAnwIDAJ8BAACCAQAAAgMBAwIADgMBGAAAAAEAAAAAAAAAAAAADwAAAAAHAAABAgAwowAAAKQAAQAAAABApAEDAAAAIEBNAQEkBAAAAE0BASQEAAAATQEBtQUAAACfAAICpAEIAAAcYIDiAg4ApAMSABFA8MAwAwJXCQAAAP8DAAABAAAApAQUAAAAMEFvBhUAvAQE0xYAAACfBAMAxQMEAAEAAAAwAwJ9DQAAAJ8BAgJNAgCYFwAAAFIDAQCfAgIC4gMbAMAEHAASAAIAEgAAABIAAQAwBANfGAAAADACAxQZAAAAMAEDeRoAAACCAwIAHQMEBAAAAEADBQQAACBAAwYDBwMIAwkEABxggAMKAwsBAQMMAw0IBAn/////CgsAAAAMCwAAAA3/////Aw4DDwMQBBFA8MADEQQAADBBAxIDEwMBAwMDFAMVBQMYGRoGAAEAAQABGAACAAAAAAAAAAAAAAIAAAEAAAADAAAAAAAAAAAAAAD8BgAAAAIBAAAAAAAEAAEAAAEAAAAAAbk68+rO2SatWv1bl3HNAXXJIuSei/6Z6w==

-- https://lua.expert/
local Utilities = require(script.Parent.Parent.Utilities)
local v1 = table.freeze({
	RespectCanCollide = true,
	IgnoreWater = true,
	FilterType = Enum.RaycastFilterType.Include,
	FilterDescendantsInstances = { workspace:WaitForChild("Map") }
})
local v2 = Utilities.createRaycastParams(v1)

return {
	get = function(p1) --[[ get | Line: 14 | Upvalues: v2 (copy), Utilities (copy), v1 (copy) ]]
		if p1 then
			return Utilities.createRaycastParams(Utilities.merge(p1, v1))
		end

		return v2
	end,
	instance = v2,
	fields = v1
}