-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbmRHaXZlIGFsbCBNYXRlcmlhbCBhbmQgSXRlbS10eXBlIGl0ZW1zIChmdWxsIHN0YWNrKSB0byBhIHBsYXllci4gRXhjbHVkZXMgU3R5bGUsIFdlYXBvbiwgYW5kIEFiaWxpdHkuBUdyb3VwBUFkbWluBEFyZ3MGc2NyaXB0DWdyYW50bWF0ZXJpYWwQZ3JhbnRhbGxtYXRlcmlhbARUeXBlBnBsYXllcgZ0YXJnZXQbUGxheWVyIHRvIHJlY2VpdmUgbWF0ZXJpYWxzAAEEAAABAgAYowAAAOIABwCkAQkAAACAQE0BAboAAAAAMAEAugAAAAD/AQAAAgAAAG8CCgBvAwsAxQECAwEAAAAwAQAnAQAAAP8BAAABAAAA4gIQAMUBAgIBAAAAMAEA2wYAAACCAAIAEQMBAwIDAwMEAwUDBgMHCAUA/////wH/////AgMAAAAEBQAAAAb/////AwgEAACAQAMJAwoDCwMMAw0DDggDDA0AAAAADgAAAAIPAAAAAAEAARgAAAEAAAAAAAEAAAAAAAAAAwABAAD/AAABAAAAAAB/KLkVTvynBmcIJM63xH+BDzCuYU3s0xQ=

-- https://lua.expert/
return {
	Description = "Give all Material and Item-type items (full stack) to a player. Excludes Style, Weapon, and Ability.",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "grantmaterial", "grantallmaterial" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive materials"
		}
	}
}