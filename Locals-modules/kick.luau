-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMMBE5hbWUEa2ljawdBbGlhc2VzC0Rlc2NyaXB0aW9uIUtpY2tzIGEgcGxheWVyIG9yIHNldCBvZiBwbGF5ZXJzLgVHcm91cAxEZWZhdWx0QWRtaW4EQXJncwRib290BFR5cGUHcGxheWVycxRUaGUgcGxheWVycyB0byBraWNrLgABAwAAAQIAEaMAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAABAAAA4gINAMUBAgIBAAAAMAEA2wcAAACCAAIADgMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAgDCgsAAAAACwAAAAMMAAAAAAEAARgAAAIAAAAAAAADAAEAAP8AAAEAAAAAALWrjhXvmrP15vtcvNy/sh3Fs5lhh2/kFA==

-- https://lua.expert/
return {
	Name = "kick",
	Description = "Kicks a player or set of players.",
	Group = "DefaultAdmin",
	Aliases = { "boot" },
	Args = {
		{
			Type = "players",
			Name = "players",
			Description = "The players to kick."
		}
	}
}