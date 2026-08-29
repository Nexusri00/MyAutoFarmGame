-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUIYm9vc3RkbWcHQWxpYXNlcwtEZXNjcmlwdGlvbk1Cb29zdHMgYSBwbGF5ZXIncyBkYW1hZ2UgbXVsdGlwbGllciBieSBhIHNwZWNpZmllZCBwZXJjZW50YWdlIGZvciAxNSBtaW51dGVzLgVHcm91cAxEZWZhdWx0QWRtaW4EQXJncwhkbWdib29zdARUeXBlB3BsYXllcnMHdGFyZ2V0cxVUaGUgcGxheWVycyB0byBib29zdC4GbnVtYmVyB3BlcmNlbnQ1VGhlIHBlcmNlbnRhZ2UgdG8gYm9vc3QgZGFtYWdlIGJ5IChlLmcuIDUwIGZvciArNTAlKS4AAQQAAAECABKjAAAA4gAIAP8BAAABAAAAbwIJAMUBAgIBAAAAMAEAJwIAAAD/AQAAAgAAAOICDgDiAxIAxQECAwEAAAAwAQDbBwAAAIIAAgATAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0IAwoLAAAAAAwAAAADDQAAAAMOAw8DEAgDCg8AAAAAEAAAAAMRAAAAAAEAARgAAAIAAAAAAAADAAEFAAD6AAABAAAAAAAPCQQJhLa7XSMCZ4JNri7gfxETfT3Nbgg=

-- https://lua.expert/
return {
	Name = "boostdmg",
	Description = "Boosts a player\'s damage multiplier by a specified percentage for 15 minutes.",
	Group = "DefaultAdmin",
	Aliases = { "dmgboost" },
	Args = {
		{
			Type = "players",
			Name = "targets",
			Description = "The players to boost."
		},
		{
			Type = "number",
			Name = "percent",
			Description = "The percentage to boost damage by (e.g. 50 for +50%)."
		}
	}
}