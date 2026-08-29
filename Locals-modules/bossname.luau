-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMXCVRyYW5zZm9ybSFObyBib3NzIGZvdW5kIG1hdGNoaW5nIHRoYXQgbmFtZS4IVmFsaWRhdGUMQXV0b2NvbXBsZXRlBVBhcnNlBXBhaXJzBXRhYmxlBmluc2VydARzb3J0D01ha2VGdXp6eUZpbmRlcghib3NzbmFtZQxSZWdpc3RlclR5cGUHcmVxdWlyZQZzY3JpcHQGUGFyZW50BlNoYXJlZARVdGlsBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zB05QQ0RhdGEABgMBAQAAAAT7AQAAUgIAAJ8BAgCCAQAAAAAPAQEYAAAAABAAAAAABAEAAAAACBwCAACMAwAAtwMCAAIAAACpAQABqQEBAG8CAACCAQMAAQMCABMDARgAAAAAAAAAABQAAAAAAQEAAAAAAYIAAgAAABcEARgAGAAAAAACAQAAAAACEwEAAIIBAgAAABsFARgAABwAAAAACgECAAAALP8BAAAAAAAApAIBAAAAAED7AwAAnwICBBcCBwCeNAEFBQAAAFIIAQBSCQUApAcEAAAMIICfBwMBbgL4/wEAAACkAgYAABQggFIDAQCfAgIB+wIBAE0CAj0HAAAAUgMBAJ8CAgJvBQgA4gYNANkHAAASAAIAMAcGIQkAAADABw4AMAcGdgoAAADABw8AMAcGqwsAAADABxAAMAcGmwwAAAC8AwDdEQAAAJ8DBAGCAAEAEgMGBAAAAEADBwMIBAAMIIADCQQAFCCAAwoDCwMBAwMDBAMFBQQJCgsMBgEGAgYDAwwEAAECAwUAARgAAAEAAAAAAQAAAAAAAP8AAwAAAAIAAAAAAgABAAAABAAABAAABAAA8wAAEQYAAAAABAAAAQIAIaMAAACkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQEkBAAAAE0BARIFAAAATQEBngYAAACfAAICpAEIAAAAcEBvAwkAvAEBFgoAAACfAQMCpAIBAAAAAEBNAwHoCwAAAE0DA7oMAAAATQMDaQ0AAACfAgICwAMOABIAAgASAAAAggMCAA8DDQQAAABAAw4EAAAgQAMPAxADEQMSBAAAcEADEwMUAxUDFgMXBgQBBAEAARgAAAAAAAAAAAAAAAAAAAEAAAAAAAEAAAAAAAAAAAIAAAABAAAAAAVlmrOuneSEP5DTe0w8VayXFYKk2lde2a8=

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NPCData = require(ReplicatedStorage.Modules.Configurations.NPCData)

return function(p1) --[[ Line: 5 | Upvalues: NPCData (copy), Util (copy) ]]
	local t = {}

	for k in pairs(NPCData) do
		table.insert(t, k)
	end

	table.sort(t)

	local v1 = Util.MakeFuzzyFinder(t)

	p1:RegisterType("bossname", {
		Transform = function(p1) --[[ Transform | Line: 15 | Upvalues: v1 (copy) ]]
			return v1(p1)
		end,
		Validate = function(p1) --[[ Validate | Line: 19 ]]
			return #p1 > 0, "No boss found matching that name."
		end,
		Autocomplete = function(p1) --[[ Autocomplete | Line: 23 ]]
			return p1
		end,
		Parse = function(p1) --[[ Parse | Line: 27 ]]
			return p1[1]
		end
	})
end