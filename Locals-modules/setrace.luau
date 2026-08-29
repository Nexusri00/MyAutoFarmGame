-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUHc2V0cmFjZQdBbGlhc2VzC0Rlc2NyaXB0aW9uLFNldHMgYSBwbGF5ZXIncyByYWNlIHRvIHRoZSBzcGVjaWZpZWQgdmFsdWUuBUdyb3VwDERlZmF1bHRBZG1pbgRBcmdzBHJhY2UFc3JhY2UEVHlwZQdwbGF5ZXJzB3RhcmdldHMgVGhlIHBsYXllcnMgdG8gc2V0IHRoZSByYWNlIGZvci4Gc3RyaW5nPFRoZSByYWNlIHRvIHNldCAoZS5nLiwgSHVtYW4sIEVsZiwgT25pLCBHaG91bCwgQXN1cmEsIGV0Yy4pLgABBAAAAQIAE6MAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAgAAAOICDwDiAxIAxQECAwEAAAAwAQDbBwAAAIIAAgATAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0DDggDCwwAAAAADQAAAAMOAAAAAw8DEAgDCxAAAAAACQAAAAMRAAAAAAEAARgAAAIAAAAAAAAAAwABBQAA+gAAAQAAAAAAnlbYYbae1c5QfpyvmEBE9O5OzxWskrJg

-- https://lua.expert/
return {
	Name = "setrace",
	Description = "Sets a player\'s race to the specified value.",
	Group = "DefaultAdmin",
	Aliases = { "race", "srace" },
	Args = {
		{
			Type = "players",
			Name = "targets",
			Description = "The players to set the race for."
		},
		{
			Type = "string",
			Name = "race",
			Description = "The race to set (e.g., Human, Elf, Oni, Ghoul, Asura, etc.)."
		}
	}
}