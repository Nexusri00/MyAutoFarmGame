-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMaBmlwYWlycxpGaWx0ZXJEZXNjZW5kYW50c0luc3RhbmNlcwV0YWJsZQRmaW5kBmluc2VydBpnZXRDaGFyYWN0ZXJzV2l0aEV4Y2x1c2lvbhBidWlsZERlc2NlbmRhbnRzBW1lcmdlE2NyZWF0ZVJheWNhc3RQYXJhbXMDZ2V0B3JlcXVpcmUGc2NyaXB0BlBhcmVudAlVdGlsaXRpZXMGZnJlZXplCkZpbHRlclR5cGURUmVzcGVjdENhbkNvbGxpZGULSWdub3JlV2F0ZXIERW51bRFSYXljYXN0RmlsdGVyVHlwZQdJbmNsdWRlCXdvcmtzcGFjZQNNYXAMV2FpdEZvckNoaWxkCGluc3RhbmNlBmZpZWxkcwADCgECAAAGAwAABQGEMv8BAAAAAAAApAIBAAAAAED7AwAATQMDfQIAAACfAgIEUQINAKQHBQAAEDCAUggBAFIJBgCfBwMCKwcHAJ40AQUGAAAAUggBAFIJBgCkBwcAABgwgJ8HAwFuAvL/AgAAgA4AGACkAgEAAAAAQPsDAQBNAwMpCAAAAFIEAACfAwIAnwIABFECDQCkBwUAABAwgFIIAQBSCQYAnwcDAisHBwCeNAEFBgAAAFIIAQBSCQYApAcHAAAYMICfBwMBbgLy/wIAAICCAQIACQMBBAAAAEADAgMDAwQEABAwgAMFBAAYMIADBgANBwEYAAABAAAAAAAAAQAAAAAAAQAAAAAAAP4ABQEAAAAAAAAAAAEAAAAAAAEAAAAAAAD+AAYOAAAAAAUCAwAABwQAAAUChIQU+wIAAE0CAh8AAAAAUgMAACsDAgD/AwAAAAAAAPsEAQCfAgMC+wMCAFIEAQCfAwICMAMCfQEAAAD7AwAATQMDmAIAAABSBAIAnwMCAIIDAAADAwgDAgMJAB8KARgAAAAAAAAAAAABAAAAAAEAAAAAACAAAAAABwAAAQIAM6MAAACkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQEkBAAAAE0BAbUFAAAAnwACAqQBCAAAHGCA4gIOAKQDEgARQPDAMAMCVwkAAAD/AwAAAQAAAKQEFAAAADBBbwYVALwEBNMWAAAAnwQDAMUDBAABAAAAMAMCfQ0AAACfAQICTQIAmBcAAABSAwEAnwICAsADGAASAAEAEgAAAOIEHADABR0AEgAAABIAAQASAAMAMAUEXxkAAAAwAgQUGgAAADABBHkbAAAAggQCAB4DCwQAAABAAwwEAAAgQAMNAw4DAwMPBAAcYIADEAMRAQEDEgMCCAQJ/////woLAAAADAsAAAAN/////wMTAxQDFQQRQPDAAxYEAAAwQQMXAxgDCQYAAwoDGQMaBQMZGhsGAQIAAQEAARgAAgAAAAAAAAAAAAACAAABAAAAAwAAAAAAAAAAAAAA/AYAAAACAAARAQAAAAAABQABAAABAAAAAAIrFMQPniAu88Z79gt52/kAWwzTexnQrg4=

-- https://lua.expert/
local Utilities = require(script.Parent.Parent.Utilities)
local v1 = table.freeze({
	RespectCanCollide = true,
	IgnoreWater = true,
	FilterType = Enum.RaycastFilterType.Include,
	FilterDescendantsInstances = { workspace:WaitForChild("Map") }
})
local v2 = Utilities.createRaycastParams(v1)

local function buildDescendants(p1) --[[ buildDescendants | Line: 13 | Upvalues: v1 (copy), Utilities (copy) ]]
	local t = {}

	for i, v in ipairs(v1.FilterDescendantsInstances) do
		if not table.find(t, v) then
			table.insert(t, v)
		end
	end

	if p1 then
		for i, v in ipairs(Utilities.getCharactersWithExclusion(p1)) do
			if not table.find(t, v) then
				table.insert(t, v)
			end
		end
	end

	return t
end

return {
	get = function(p1, p2) --[[ get | Line: 31 | Upvalues: Utilities (copy), v1 (copy), buildDescendants (copy) ]]
		local v2 = Utilities.merge(if p1 then p1 else {}, v1)

		v2.FilterDescendantsInstances = buildDescendants(p2)

		return Utilities.createRaycastParams(v2)
	end,
	instance = v2,
	fields = v1
}