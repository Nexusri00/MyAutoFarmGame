-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMMBE5hbWUNd2lwZWludmVudG9yeQdBbGlhc2VzC0Rlc2NyaXB0aW9uVFdpcGUgcGxheWVyJ3MgSW52ZW50b3J5IGFuZCBzYXZlIGltbWVkaWF0ZWx5IChQcm9maWxlLkRhdGEuSW52ZW50b3J5IGJlY29tZXMgZW1wdHkpLgVHcm91cAVBZG1pbgRBcmdzB3dpcGVpbnYEVHlwZQdwbGF5ZXJzD1BsYXllcnMgdG8gd2lwZQABAwAAAQIAEaMAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAABAAAA4gINAMUBAgIBAAAAMAEA2wcAAACCAAIADgMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAgDCgsAAAAACwAAAAMMAAAAAAEAARgAAAIAAAAAAAAEAAEAAP8AAAEAAAAAANiJhKY91CgvAhWhp4hGcFCokZPS6k3upw==

-- https://lua.expert/
return {
	Name = "wipeinventory",
	Description = "Wipe player\'s Inventory and save immediately (Profile.Data.Inventory becomes empty).",
	Group = "Admin",
	Aliases = { "wipeinv" },
	Args = {
		{
			Type = "players",
			Name = "players",
			Description = "Players to wipe"
		}
	}
}