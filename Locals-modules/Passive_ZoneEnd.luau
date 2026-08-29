-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMFC2Rlc3Ryb3lBdXJhB3JlcXVpcmUGc2NyaXB0BlBhcmVudAZDb21tb24AAgMBAQAABgMAAAUBBwgrAAEAggABAPsBAABNAQFDAAAAAFICAACfAQIBggABAAEDAQAFAAEYAAABAAAAAAEGAAAAAAIAAAECAA2jAAAApAABAAAAAECkAQMAAAAgQE0BASQEAAAATQEBcwUAAACfAAICwAEGABIAAACCAQIABwMCBAAAAEADAwQAACBAAwQDBQYAAQABAAEYAAIAAAAAAAAAAAIAAAEAAAAAAQ==

-- https://lua.expert/
local Common = require(script.Parent.Common)

return function(p1) --[[ Line: 5 | Upvalues: Common (copy) ]]
	if p1 then
		Common.destroyAura(p1)
	end
end