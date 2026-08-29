-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMWE2NyZWF0ZVJheWNhc3RQYXJhbXMFbWVyZ2UDZ2V0B3JlcXVpcmUGc2NyaXB0BlBhcmVudAlVdGlsaXRpZXMFdGFibGUGZnJlZXplCkZpbHRlclR5cGURUmVzcGVjdENhbkNvbGxpZGULSWdub3JlV2F0ZXIaRmlsdGVyRGVzY2VuZGFudHNJbnN0YW5jZXMERW51bRFSYXljYXN0RmlsdGVyVHlwZQdJbmNsdWRlCXdvcmtzcGFjZQpDaGFyYWN0ZXJzDFdhaXRGb3JDaGlsZAdFbmVtaWVzCGluc3RhbmNlBmZpZWxkcwACBQEDAAAGAwAABQGEDisAAgD7AQAAggECAPsBAQBNAQGYAAAAAPsCAQBNAgIfAQAAAFIDAAD7BAIAnwIDAJ8BAACCAQAAAgMBAwIAEQMBGAAAAAEAAAAAAAAAAAAAEgAAAAAIAAABAgA2owAAAKQAAQAAAABApAEDAAAAIEBNAQEkBAAAAE0BASQEAAAATQEBtQUAAACfAAICpAEIAAAcYIDiAg4ApAMSABFA8MAwAwJXCQAAAP8DAAACAAAApAQUAAAAMEFvBhUAvAQE0xYAAACfBAMCpAUUAAAAMEFvBxcAvAUF0xYAAACfBQMAxQMEAAEAAAAwAwJ9DQAAAJ8BAgJNAgCYGAAAAFIDAQCfAgIC4gMcAMAEHQASAAIAEgAAABIAAQAwBANfGQAAADACAxQaAAAAMAEDeRsAAACCAwIAHgMEBAAAAEADBQQAACBAAwYDBwMIAwkEABxggAMKAwsBAQMMAw0IBAn/////CgsAAAAMCwAAAA3/////Aw4DDwMQBBFA8MADEQQAADBBAxIDEwMUAwEDAwMVAxYFAxkaGwYAAQABAAEYAAIAAAAAAAAAAAAAAgAAAQAAAAMAAQAAAAAAAQAAAAAAAAD+APwJAAAAAgEAAAAAAAQAAQAAAQAAAAABaRNifE6611l9fi0fVF9SDBkLdQhb1wh9

-- https://lua.expert/
local Utilities = require(script.Parent.Parent.Utilities)
local v1 = table.freeze({
	RespectCanCollide = true,
	IgnoreWater = true,
	FilterType = Enum.RaycastFilterType.Include,
	FilterDescendantsInstances = { workspace:WaitForChild("Characters"), workspace:WaitForChild("Enemies") }
})
local v2 = Utilities.createRaycastParams(v1)

return {
	get = function(p1) --[[ get | Line: 17 | Upvalues: v2 (copy), Utilities (copy), v1 (copy) ]]
		if p1 then
			return Utilities.createRaycastParams(Utilities.merge(p1, v1))
		end

		return v2
	end,
	instance = v2,
	fields = v1
}