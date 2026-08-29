-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMYBENtZHIEVXRpbA9NYWtlRnV6enlGaW5kZXIORGljdGlvbmFyeUtleXMJdmFyc191c2VkCEdldFN0b3JlDEF1dG9jb21wbGV0ZQZpcGFpcnMFbWF0Y2hXS2V5IG5hbWVzIG11c3Qgc3RhcnQgd2l0aCBhbiBvcHRpb25hbCBtb2RpZmllcjogLiAkIG9yICQuIGFuZCBtdXN0IGJlZ2luIHdpdGggYSBsZXR0ZXIuCFZhbGlkYXRlBVBhcnNlCXN0b3JlZEtleQxSZWdpc3RlclR5cGUKc3RvcmVkS2V5cxBNYWtlTGlzdGFibGVUeXBlB3JlcXVpcmUGc2NyaXB0BlBhcmVudAZTaGFyZWQKXiVhWyV3X10qJAxeJSQlYVsld19dKiQMXiUuJWFbJXdfXSokDl4lJCUuJWFbJXdfXSokAAUGAQEAAAAc+wEAAE0BAZ4AAAAATQEBngEAAABNAQE9AgAAAPsCAABNAgKeAAAAAE0CAp4BAAAATQIC4wMAAAD7AwAAbwUEALwDA1UFAAAAnwMDAisDAgD/AwAAAAAAAJ8CAgCfAQACUgIBAFIDAACfAgIAggIAAAYDAQMCAwMDBAMFAwYADAcBGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAANAAAAAAkBAQAAABGkAQEAAAAAQPsCAACfAQIEUQEHAFIIBQC8BgDnAgAAAJ8GAwIOBgIAqQYBAIIGAgBuAfj/AgAAgKkBAABvAgMAggEDAAQDCAQAAABAAwkDCgASCwEYAAAAAAABAAAAAAEA/gAGAAATAAAAAAEBAAAAAAGCAAIAAAAcDAEYAB0AAAAABwECAAAAG+IBAwDZAgAAEgAAADACAasAAAAAwAIEABICAAAwAgF2AQAAAMACBQAwAgGbAgAAAG8EBgBSBQEAvAIA3QcAAACfAgQBbwQIAPsFAQBNBQUkCQAAAFIGAQCfBQIAvAIA3QcAAACfAgABggABAAoDBwMLAwwFAwABAgYBBgIDDQMOAw8DEAMAAQIKAAEYAAEAAAAGAAAACgAABAAAAAABAAAAAAAAAAABCwAAAAAGAAABAgAaowAAAKQAAQAAAABApAEDAAAAIEBNAQEkBAAAAE0BASQEAAAATQEBEgUAAABNAQGeBgAAAJ8AAgL/AQAABAAAAG8CBwBvAwgAbwQJAG8FCgDFAQIFAQAAAMACCwASAAEAEgAAAIICAgAMAxEEAAAAQAMSBAAAIEADEwMUAwIDFQMWAxcDGAYDAQMBAAEYAAAAAAAAAAAAAAAAAAACAAEBAQEAAAMAAAABAAAAAATkrqt1nsmFEU4IGZpTlZn7lLa8AdZqwXQ=

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)
local t = { "^%a[%w_]*$", "^%$%a[%w_]*$", "^%.%a[%w_]*$", "^%$%.%a[%w_]*$" }

return function(p1) --[[ Line: 10 | Upvalues: t (copy), Util (copy) ]]
	local t2 = {
		Autocomplete = function(p12) --[[ Autocomplete | Line: 12 | Upvalues: p1 (copy) ]]
			return p1.Cmdr.Util.MakeFuzzyFinder(p1.Cmdr.Util.DictionaryKeys(p1:GetStore("vars_used") or {}))(p12)
		end,
		Validate = function(p1) --[[ Validate | Line: 18 | Upvalues: t (ref) ]]
			for i, v in ipairs(t) do
				if p1:match(v) then
					return true
				end
			end

			return false, "Key names must start with an optional modifier: . $ or $. and must begin with a letter."
		end,
		Parse = function(p1) --[[ Parse | Line: 28 ]]
			return p1
		end
	}

	p1:RegisterType("storedKey", t2)
	p1:RegisterType("storedKeys", Util.MakeListableType(t2))
end