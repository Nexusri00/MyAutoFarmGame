-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWULdW5iYW5nbG9iYWwHQWxpYXNlcwtEZXNjcmlwdGlvbklSZW1vdmUgYSBnbG9iYWwgYmFuIChSb2Jsb3ggbmF0aXZlIGJhbiwgYWxsIHNlcnZlcnMvcGxhY2VzKSBmb3IgYSBwbGF5ZXIuBUdyb3VwBUFkbWluBEFyZ3MFdW5iYW4GZ3VuYmFuBFR5cGUIcGxheWVySWQGdGFyZ2V0J1BsYXllciB0byB1bmJhbiAod29ya3MgZXZlbiBpZiBvZmZsaW5lKQABBAAAAQIAEqMAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAQAAAOICDwDFAQICAQAAADABANsHAAAAggACABADAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAAAAQABGAAAAgAAAAAAAAADAAEAAP8AAAEAAAAAAF5sG+OtbNfy3b7dWYrMgOcudAyXbKhx4g==

-- https://lua.expert/
return {
	Name = "unbanglobal",
	Description = "Remove a global ban (Roblox native ban, all servers/places) for a player.",
	Group = "Admin",
	Aliases = { "unban", "gunban" },
	Args = {
		{
			Type = "playerId",
			Name = "target",
			Description = "Player to unban (works even if offline)"
		}
	}
}