-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBXBhaXJzBXRhYmxlBGZpbmQQR2V0UGxhY2VMb2NhdGlvbg5SZXR1cm5Mb2NhdGlvbg1DaGVja0xvY2F0aW9uDENoZWNrUGxhY2VJRARnYW1lD1JlcGxpY2F0ZWRGaXJzdAhQbGFjZUlkcwlMZWdhY3lTZWEFVmFsdWUDPz8/B1BsYWNlSWQABQkBAQAABgMAAAUBAhCkAQEAAAAAQPsCAACfAQIEFwEHAKQGBAAADCCAUgcFAFIIAACfBgMCDgYBAIIEAgBuAfj/AgAAAMYBAACCAQIABQMBBAAAAEADAgMDBAAMIIAACAQBGAAAAAAAAQAAAAAAAf4ABQAJAAAAAAIBAQAAAAL7AQAAggECAAAAFQUBGAAAFgAAAAAEAgEAAAcEAAAFAgQDBvsDAADxAwIAAQAAAKkCAAGpAgEAggICAAAAGQYBGAAAAAAAABoAAAAABAIAAAAHBAAABQIEAgU1AgB5AAAAAFIDAQCfAgIAggIAAAEDBAAdBwEYAAAAAAAeAAAAAAUAAAECAC2jAAAApAABAAAAAEBNAABFAgAAAE0AAJwDAAAA/wEBAAAAAAD/AgAAAQAAAE0DAGoEAAAATQMD7AUAAADFAgMCAQAAADACAWoEAAAAwAIGABIAAQAYAgB5BwAAADUDAHkHAAAApAQBAAAAAEBNBATFCQAAAJ8DAgKQAgMI/wMDAAAAAADABAoAEgACADAEA3ELAAAAwAQMABIAAgAwBAOsDQAAAMAEDgAwBANKDwAAAIIDAgAQAwgEAAAAQAMJAwoDCwMMBgADBAMNAw4GAQMFBgIDBgYDAwcEAAECAwEAARgAAQAAAAAAAgABAAAAAAAAAAAAAwAAAAkAAAAAAAAAAgACAAAABAAAAAQAAAQBAAAAAAShuMCaH8Tri24etNLhqRG30aDX7pN8qps=

-- https://lua.expert/
local t = {
	LegacySea = { game.ReplicatedFirst.PlaceIds.LegacySea.Value }
}

function GetPlaceLocation(p1) --[[ GetPlaceLocation | Line: 8 | Upvalues: t (copy) ]]
	for k, v in pairs(t) do
		if table.find(v, p1) then
			return k
		end
	end

	return nil
end

local v1 = GetPlaceLocation(game.PlaceId) or "???"

return {
	ReturnLocation = function(p1) --[[ ReturnLocation | Line: 21 | Upvalues: v1 (copy) ]]
		return v1
	end,
	CheckLocation = function(p1, p2) --[[ CheckLocation | Line: 25 | Upvalues: v1 (copy) ]]
		return v1 == p2
	end,
	CheckPlaceID = function(p1, p2) --[[ CheckPlaceID | Line: 29 ]]
		return GetPlaceLocation(p2)
	end
}