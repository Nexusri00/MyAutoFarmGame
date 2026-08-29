-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMXE2NyZWF0ZVJheWNhc3RQYXJhbXMFbWVyZ2UDZ2V0B3JlcXVpcmUGc2NyaXB0BlBhcmVudAlVdGlsaXRpZXMFdGFibGUGZnJlZXplCkZpbHRlclR5cGURUmVzcGVjdENhbkNvbGxpZGULSWdub3JlV2F0ZXIaRmlsdGVyRGVzY2VuZGFudHNJbnN0YW5jZXMERW51bRFSYXljYXN0RmlsdGVyVHlwZQdJbmNsdWRlCXdvcmtzcGFjZQpDaGFyYWN0ZXJzDFdhaXRGb3JDaGlsZAdFbmVtaWVzA01hcAhpbnN0YW5jZQZmaWVsZHMAAgUBAwAABgMAAAUBhA4rAAIA+wEAAIIBAgD7AQEATQEBmAAAAAD7AgEATQICHwEAAABSAwAA+wQCAJ8CAwCfAQAAggEAAAIDAQMCABIDARgAAAABAAAAAAAAAAAAABMAAAAACQAAAQIAPKMAAACkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQEkBAAAAE0BAbUFAAAAnwACAqQBCAAAHGCA4gIOAKQDEgARQPDAMAMCVwkAAAD/AwAAAwAAAKQEFAAAADBBbwYVALwEBNMWAAAAnwQDAqQFFAAAADBBbwcXALwFBdMWAAAAnwUDAqQGFAAAADBBbwgYALwGBtMWAAAAnwYDAMUDBAABAAAAMAMCfQ0AAACfAQICTQIAmBkAAABSAwEAnwICAuIDHQDABB4AEgACABIAAAASAAEAMAQDXxoAAAAwAgMUGwAAADABA3kcAAAAggMCAB8DBAQAAABAAwUEAAAgQAMGAwcDCAMJBAAcYIADCgMLAQEDDAMNCAQJ/////woLAAAADAsAAAAN/////wMOAw8DEAQRQPDAAxEEAAAwQQMSAxMDFAMVAwEDAwMWAxcFAxobHAYAAQABAAEYAAIAAAAAAAAAAAAAAgAAAQAAAAMAAQAAAAAAAQAAAAAAAQAAAAAAAAD9APwKAAAAAgEAAAAAAAQAAQAAAQAAAAABaJkzyQvYAmY66BpMPNPkxhiBJL1aXVnI

-- https://lua.expert/
local Utilities = require(script.Parent.Parent.Utilities)
local v1 = table.freeze({
	RespectCanCollide = true,
	IgnoreWater = true,
	FilterType = Enum.RaycastFilterType.Include,
	FilterDescendantsInstances = { workspace:WaitForChild("Characters"), workspace:WaitForChild("Enemies"), workspace:WaitForChild("Map") }
})
local v2 = Utilities.createRaycastParams(v1)

return {
	get = function(p1) --[[ get | Line: 18 | Upvalues: v2 (copy), Utilities (copy), v1 (copy) ]]
		if p1 then
			return Utilities.createRaycastParams(Utilities.merge(p1, v1))
		end

		return v2
	end,
	instance = v2,
	fields = v1
}