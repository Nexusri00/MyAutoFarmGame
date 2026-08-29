-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTASwFc3BsaXQKSlNPTkVuY29kZQNSdW4EZ2FtZQtIdHRwU2VydmljZQpHZXRTZXJ2aWNlBE5hbWURanNvbi1hcnJheS1lbmNvZGUHQWxpYXNlcwtEZXNjcmlwdGlvbjBFbmNvZGVzIGEgY29tbWEtc2VwYXJhdGVkIGxpc3QgaW50byBhIEpTT04gYXJyYXkFR3JvdXALRGVmYXVsdFV0aWwEQXJncwRUeXBlBnN0cmluZwNDU1YYVGhlIGNvbW1hLXNlcGFyYXRlZCBsaXN0AAIHAgEAAAAJ+wIAAG8GAAC8BAHjAQAAAJ8EAwC8AgKeAgAAAJ8CAACCAgAAAwMBAwIDAwAQBAEYAAAAAAAAAAAAEQAAAAAEAAABAgAYowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAuIBDQD/AgAAAAAAADACAScGAAAA/wIAAAEAAADiAxIAxQIDAgEAAAAwAgHbCwAAAMACEwASAAAAMAIBFgwAAACCAQIAFAMFBAAAAEADBgMHAwgDCQMKAwsDDAMNAw4DDwMECAYEBQAAAAb/////BwgAAAAJCgAAAAv/////DP////8DEAMRAxIDEwgDDg8AAAAEEAAAAAcRAAAABgABAAEAARgAAAAAAAAAAgIAAAADAAEAAP8ACAAAAAABAAAAAAEjG3M73idEt/GMC9IIEM2DUwNkTxHfGTo=

-- https://lua.expert/
local HttpService = game:GetService("HttpService")

return {
	Name = "json-array-encode",
	Description = "Encodes a comma-separated list into a JSON array",
	Group = "DefaultUtil",
	Aliases = {},
	Args = {
		{
			Type = "string",
			Name = "CSV",
			Description = "The comma-separated list"
		}
	},
	Run = function(p1, p2) --[[ Run | Line: 16 | Upvalues: HttpService (copy) ]]
		return HttpService:JSONEncode(p2:split(","))
	end
}