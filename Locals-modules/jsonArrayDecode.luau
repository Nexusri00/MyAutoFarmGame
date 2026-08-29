-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBHR5cGUFdGFibGUGY29uY2F0ASwJQ2xpZW50UnVuBE5hbWURanNvbi1hcnJheS1kZWNvZGUHQWxpYXNlcwtEZXNjcmlwdGlvbjBEZWNvZGVzIGEgSlNPTiBBcnJheSBpbnRvIGEgY29tbWEtc2VwYXJhdGVkIGxpc3QFR3JvdXALRGVmYXVsdFV0aWwEQXJncwRUeXBlBGpzb24ESlNPTg9UaGUgSlNPTiBhcnJheS4AAgUCAAAAABO7KAEDUgMBAKQCAQAAAABAnwICAvACBwACAAAA/wIAAAEAAABSAwEAxQIDAgEAAABSAQIApAIEAAAMIIBSAwEAbwQFAJ8CAwCCAgAABgMBBAAAAEADAgMDBAAMIIADBAAOBQEYAAAAAAAAAAEAAAAAAAMAAAAAAA8AAAAAAwAAAQIAEaMAAADiAAkA/wEAAAAAAAAwAQAnAgAAAP8BAAABAAAA4gIOAMUBAgIBAAAAMAEA2wcAAADAAQ8AMAEAMwgAAACCAAIAEAMGAwcDCAMJAwoDCwMMAw0DBQgGAAEAAAAC/////wMEAAAABQYAAAAH/////wj/////Aw4DDwMQAxEIAwoLAAAAAAwAAAADDQAAAAYAAQABAAEYAAACAAAAAwABAAD/AAgAAAABAAAAAAEsVontRDaCoLRiQEjyd/GkXE6emR6S4+w=

-- https://lua.expert/
return {
	Name = "json-array-decode",
	Description = "Decodes a JSON Array into a comma-separated list",
	Group = "DefaultUtil",
	Aliases = {},
	Args = {
		{
			Type = "json",
			Name = "JSON",
			Description = "The JSON array."
		}
	},
	ClientRun = function(p1, p2) --[[ ClientRun | Line: 14 ]]
		if type(p2) ~= "table" then
			p2 = { p2 }
		end

		return table.concat(p2, ",")
	end
}