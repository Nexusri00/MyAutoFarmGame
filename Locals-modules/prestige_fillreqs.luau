-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWURcHJlc3RpZ2VfZmlsbHJlcXMHQWxpYXNlcwtEZXNjcmlwdGlvbjpGaWxsIGFsbCBwcmVzdGlnZSByZXF1aXJlbWVudHMgZm9yIGEgcGxheWVyIChmb3IgdGVzdGluZykuBUdyb3VwBUFkbWluBEFyZ3MMZmlsbHByZXN0aWdlDHByZXN0aWdldGVzdARUeXBlBnBsYXllcgZ0YXJnZXQoUGxheWVyIHRvIGZpbGwgcHJlc3RpZ2UgcmVxdWlyZW1lbnRzIGZvcgABBAAAAQIAEqMAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAQAAAOICDwDFAQICAQAAADABANsHAAAAggACABADAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAAAAQABGAAAAgAAAAAAAAADAAEAAP8AAAEAAAAAAB5/cSTP1SYHCwDJanz32EFuZ2ZQLLsbJQ==

-- https://lua.expert/
return {
	Name = "prestige_fillreqs",
	Description = "Fill all prestige requirements for a player (for testing).",
	Group = "Admin",
	Aliases = { "fillprestige", "prestigetest" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to fill prestige requirements for"
		}
	}
}