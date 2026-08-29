-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMcCVRyYW5zZm9ybSFObyBpdGVtIGZvdW5kIG1hdGNoaW5nIHRoYXQgbmFtZS4IVmFsaWRhdGUMQXV0b2NvbXBsZXRlBVBhcnNlBXBhaXJzBXRhYmxlBmluc2VydARzb3J0D01ha2VGdXp6eUZpbmRlcghpdGVtbmFtZQxSZWdpc3RlclR5cGUHcmVxdWlyZQZzY3JpcHQGUGFyZW50BlNoYXJlZARVdGlsBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQR0YXNrBHdhaXQCX0cGTW9kZWxzB01vZHVsZXMOQ29uZmlndXJhdGlvbnMISXRlbURhdGEIVG9vbERhdGEABgMBAQAAAAT7AQAAUgIAAJ8BAgCCAQAAAAAcAQEYAAAAAB0AAAAABAEAAAAACBwCAACMAwAAtwMCAAIAAACpAQABqQEBAG8CAACCAQMAAQMCACADARgAAAAAAAAAACEAAAAAAQEAAAAAAYIAAgAAACQEARgAJQAAAAACAQAAAAACEwEAAIIBAgAAACgFARgAACkAAAAACwEDAAAARP8BAAAAAAAA/wIAAAAAAACkAwEAAAAAQPsEAACfAwIEFwMLAIcIAQYrCAkAqQgBAGoIAQaeNAIFBgAAAFIJAgBSCgYApAgEAAAMIICfCAMBbgP0/wIAAACkAwEAAAAAQPsEAQCfAwIEFwMLAIcIAQYrCAkAqQgBAGoIAQaeNAIFBgAAAFIJAgBSCgYApAgEAAAMIICfCAMBbgP0/wIAAACkAwYAABQggFIEAgCfAwIB+wMCAE0DAz0HAAAAUgQCAJ8DAgJvBggA4gcNANkIAAASAAMAMAgHIQkAAADACA4AMAgHdgoAAADACA8AMAgHqwsAAADACBAAMAgHmwwAAAC8BADdEQAAAJ8EBAGCAAEAEgMGBAAAAEADBwMIBAAMIIADCQQAFCCAAwoDCwMBAwMDBAMFBQQJCgsMBgEGAgYDAwwEAAECAwgAARgAAAEAAQAAAAABAAEAAQAAAAAAAP0ABgAAAAABAAEAAQAAAAAAAP0ABgAAAAIAAAAAAgABAAAABAAABAAABAAA8wAAEQkAAAAABQAAAQAANKMAAACkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQEkBAAAAE0BARIFAAAATQEBngYAAACfAAICpAEIAAAAcEBvAwkAvAEBFgoAAACfAQMCpAINAAAwsICfAgEBpAIPAAAA4EBNAgL4EAAAACsCAQBIAPf/pAIBAAAAAEBNAwHoEQAAAE0DA7oSAAAATQMDUxMAAACfAgICpAMBAAAAAEBNBAHoEQAAAE0EBLoSAAAATQQEKxQAAACfAwICwAQVABIAAgASAAMAEgAAAIIEAgAWAw0EAAAAQAMOBAAAIEADDwMQAxEDEgQAAHBAAxMDFAMVAxYEADCwgAMXBAAA4EADGAMZAxoDGwMcBgQBBAEAARgAAAAAAAAAAAAAAAAAAAEAAAAAAAIAAAAAAAAAAAEAAAAAAAAAAAEAAAAAAAAAAAIAAAAAAQAAAAAF4R4slAeycCKN8Jf6+EqBypEGO+DT2kaV

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

repeat
	task.wait()
until _G.Models

local ItemData = require(ReplicatedStorage.Modules.Configurations.ItemData)
local ToolData = require(ReplicatedStorage.Modules.Configurations.ToolData)

return function(p1) --[[ Line: 8 | Upvalues: ItemData (copy), ToolData (copy), Util (copy) ]]
	local t = {}
	local t2 = {}

	for k, v in pairs(ItemData) do
		if not t[k] then
			t[k] = true
			table.insert(t2, k)
		end
	end

	for k, v in pairs(ToolData) do
		if not t[k] then
			t[k] = true
			table.insert(t2, k)
		end
	end

	table.sort(t2)

	local v1 = Util.MakeFuzzyFinder(t2)

	p1:RegisterType("itemname", {
		Transform = function(p1) --[[ Transform | Line: 28 | Upvalues: v1 (copy) ]]
			return v1(p1)
		end,
		Validate = function(p1) --[[ Validate | Line: 32 ]]
			return #p1 > 0, "No item found matching that name."
		end,
		Autocomplete = function(p1) --[[ Autocomplete | Line: 36 ]]
			return p1
		end,
		Parse = function(p1) --[[ Parse | Line: 40 ]]
			return p1[1]
		end
	})
end