-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOB1BlcmZvcm0MbWF0aE9wZXJhdG9yBENtZHIEVXRpbAxNYWtlRW51bVR5cGUNTWF0aCBPcGVyYXRvcgROYW1lASsBLQEqAS8CKioBJQxSZWdpc3RlclR5cGUACAMCAAAAAAJDAgABggICAAAABQEBGAAABgAAAAADAgAAAAACJgIAAYICAgAAAAsBARgAAAwAAAAAAwIAAAAAAgkCAAGCAgIAAAARAQEYAAASAAAAAAMCAAAAAALsAgABggICAAAAFwEBGAAAGAAAAAADAgAAAAACsgIAAYICAgAAAB0BARgAAB4AAAAAAwIAAAAAAs8CAAGCAgIAAAAjAQEYAAAkAAAAAA4BAAAAAClvAwAATQQAngEAAABNBASeAgAAAE0EBLIDAAAAbwUEAP8GAAAGAAAA4gcIAMAICQAwCAdcBwAAAOIICwDACQwAMAkIXAcAAADiCQ4AwAoPADAKCVwHAAAA4goRAMALEgAwCwpcBwAAAOILFADADBUAMAwLXAcAAADiDBcAwA0YADANDFwHAAAAxQYHBwEAAACfBAMAvAEA3RkAAACfAQABggABABoDAgMDAwQDBQMGAwcDCAMBCAIFBgAAAAf/////BgADCQgCBQoAAAAH/////wYBAwoIAgUNAAAAB/////8GAgMLCAIFEAAAAAf/////BgMDDAgCBRMAAAAH/////wYEAw0IAgUWAAAAB/////8GBQMOBgABAgMEBQEAARgAAAAAAAAAAAAAAQIAAAQCAAAEAgAABAIAAAQCAAAEAgAAAADfAAAAJgIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGBgEGAQABGAAAAAEAAAAAB1KTU6sFqxVWRiPfrqCBwJQii0TfYFc5qg==

-- https://lua.expert/
return function(p1) --[[ Line: 1 ]]
	p1:RegisterType("mathOperator", p1.Cmdr.Util.MakeEnumType("Math Operator", {
		{
			Name = "+",
			Perform = function(p1, p2) --[[ Perform | Line: 5 ]]
				return p1 + p2
			end
		},
		{
			Name = "-",
			Perform = function(p1, p2) --[[ Perform | Line: 11 ]]
				return p1 - p2
			end
		},
		{
			Name = "*",
			Perform = function(p1, p2) --[[ Perform | Line: 17 ]]
				return p1 * p2
			end
		},
		{
			Name = "/",
			Perform = function(p1, p2) --[[ Perform | Line: 23 ]]
				return p1 / p2
			end
		},
		{
			Name = "**",
			Perform = function(p1, p2) --[[ Perform | Line: 29 ]]
				return p1 ^ p2
			end
		},
		{
			Name = "%",
			Perform = function(p1, p2) --[[ Perform | Line: 35 ]]
				return p1 % p2
			end
		}
	}))
end