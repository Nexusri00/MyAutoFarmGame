-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMFBl9fY2FsbAtBYmlsaXR5TmFtZQdfX2luZGV4DHNldG1ldGF0YWJsZQ5TZXRBYmlsaXR5TmFtZQADAwEBAQAABaMBAAD7AQAA3QIAAJ8BAAGCAAEAAAAJAQEYAAEAAAEJAAAAAAcCAAAABwQAAAUCAwUUDgABACsBAQCCAAEA4gIBADAAAqIAAAAA4gUEADACBW4CAAAA2QYAABIAAQAwBgXvAwAAAJ49AgQFAAAAUgQCAKQDBgAAAFBAnwMDAYICAgAHAwIFAQADAwMBBQICAwMEBAAAUEABAAMAARgAAAACAAABAQABAAAAAAAA/gAABgQAAAAAAgAAAQIAB6MAAAD/AAEAAAAAAMABAAAwAQDLAQAAAIIAAgACBgEDBQEBAQABGAAAAAIAAA0BAAAAAALcS0687M3I3EzR3ejp1kz8rFNZyO6PJL0=

-- https://lua.expert/
return {
	SetAbilityName = function(p1, p2) --[[ Line: 3 ]]
		if p1 and p2 then
			local t = {
				AbilityName = p1
			}

			setmetatable(t, {
				__index = t,
				__call = function(p1, ...) --[[ __call | Line: 9 | Upvalues: p2 (copy) ]]
					p2(...)
				end
			})

			return t
		end
	end
}