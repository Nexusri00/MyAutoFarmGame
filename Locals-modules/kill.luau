-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMNBE5hbWUEa2lsbAdBbGlhc2VzC0Rlc2NyaXB0aW9uIUtpbGxzIGEgcGxheWVyIG9yIHNldCBvZiBwbGF5ZXJzLgVHcm91cAxEZWZhdWx0QWRtaW4EQXJncwRzbGF5BFR5cGUHcGxheWVycwd2aWN0aW1zFFRoZSBwbGF5ZXJzIHRvIGtpbGwuAAEDAAABAgARowAAAOIACAD/AQAAAQAAAG8CCQDFAQICAQAAADABACcCAAAA/wEAAAEAAADiAg4AxQECAgEAAAAwAQDbBwAAAIIAAgAPAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0IAwoLAAAAAAwAAAADDQAAAAABAAEYAAACAAAAAAAAAwABAAD/AAABAAAAAAALYUcQmKwliNIItSDUvTS+e3lQZDmlLRE=

-- https://lua.expert/
return {
	Name = "kill",
	Description = "Kills a player or set of players.",
	Group = "DefaultAdmin",
	Aliases = { "slay" },
	Args = {
		{
			Type = "players",
			Name = "victims",
			Description = "The players to kill."
		}
	}
}