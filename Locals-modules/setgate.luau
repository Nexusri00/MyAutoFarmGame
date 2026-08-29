-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUHc2V0Z2F0ZQdBbGlhc2VzC0Rlc2NyaXB0aW9uU0dyYW50cyBvciByZXZva2VzIGdhdGVkLWFjY2VzcyBjZWlsaW5ncyAoYXVyYSBjcmF0ZXMsIGVuY2hhbnQgKzYuLisxMCwgcmVmb3JnZSBTKykuBUdyb3VwDERlZmF1bHRBZG1pbgRBcmdzBGdhdGUFc2dhdGUEVHlwZQdwbGF5ZXJzB3RhcmdldHMkVGhlIHBsYXllcnMgdG8gc2V0IGdhdGVkIGFjY2VzcyBmb3IuB2Jvb2xlYW4HZW5hYmxlZCx0cnVlIHRvIGdyYW50IGdhdGVkIGFjY2VzcywgZmFsc2UgdG8gcmV2b2tlLgABBAAAAQIAE6MAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAgAAAOICDwDiAxMAxQECAwEAAAAwAQDbBwAAAIIAAgAUAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0DDggDCwwAAAAADQAAAAMOAAAAAw8DEAMRCAMLEAAAAAARAAAAAxIAAAAAAQABGAAAAgAAAAAAAAADAAEFAAD6AAABAAAAAAALkqMxngV6BK9LjqdQVs7re4q0RTlWyTA=

-- https://lua.expert/
return {
	Name = "setgate",
	Description = "Grants or revokes gated-access ceilings (aura crates, enchant +6..+10, reforge S+).",
	Group = "DefaultAdmin",
	Aliases = { "gate", "sgate" },
	Args = {
		{
			Type = "players",
			Name = "targets",
			Description = "The players to set gated access for."
		},
		{
			Type = "boolean",
			Name = "enabled",
			Description = "true to grant gated access, false to revoke."
		}
	}
}