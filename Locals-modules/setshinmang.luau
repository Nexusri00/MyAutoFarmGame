-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbmJHcmFudC9zZXQgU2hpbiAmIE1hbmcgc3RhdGUgb24gYSBwbGF5ZXIuIFVzYWdlOiBzZXRzaGlubWFuZyA8cGxheWVyPiB1bmxvY2sgfCB4cCA8bj4gfCB0cmlhbCA8MC0zPgVHcm91cAVBZG1pbgRBcmdzBnNjcmlwdARUeXBlBnBsYXllcgZ0YXJnZXQjUGxheWVyIHRvIHNldCBTaGluICYgTWFuZyBzdGF0ZSBmb3IGc3RyaW5nBWZpZWxkIXVubG9jayB8IHNoaW4gfCBtYW5nIHwgeHAgfCB0cmlhbAdpbnRlZ2VyBXZhbHVlJ1ZhbHVlIGZvciB4cC90cmlhbCAoaWdub3JlZCBmb3IgdW5sb2NrKQhPcHRpb25hbAABBQAAAQIAFqMAAADiAAcApAEJAAAAgEBNAQG6AAAAADABALoAAAAA/wEAAAAAAAAwAQAnAQAAAP8BAAADAAAA4gIOAOIDEgDiBBgAxQECBAEAAAAwAQDbBgAAAIIAAgAZAwEDAgMDAwQDBQMGAwcIBQD/////Af////8CAwAAAAQFAAAABv////8DCAQAAIBAAwkDCgMLAwwIAwoLAAAAAAwAAAACDQAAAAMNAw4DDwgDCg8AAAAAEAAAAAIRAAAAAxADEQMSAxMBAQgEChMAAAAAFAAAAAIVAAAAFhcAAAAAAQABGAAAAQAAAAAAAQAAAAMAAQUFAAD1AAABAAAAAAAmxqjZN+tdT9jQ5eRAdyM4Vt6/rRQCwtg=

-- https://lua.expert/
return {
	Description = "Grant/set Shin & Mang state on a player. Usage: setshinmang <player> unlock | xp <n> | trial <0-3>",
	Group = "Admin",
	Name = script.Name,
	Aliases = {},
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set Shin & Mang state for"
		},
		{
			Type = "string",
			Name = "field",
			Description = "unlock | shin | mang | xp | trial"
		},
		{
			Type = "integer",
			Name = "value",
			Description = "Value for xp/trial (ignored for unlock)",
			Optional = true
		}
	}
}