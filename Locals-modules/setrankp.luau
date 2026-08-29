-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUIc2V0cmFua3AHQWxpYXNlcwtEZXNjcmlwdGlvbjJTZXQgYSBwbGF5ZXIncyBSYW5rRXhwZXJpZW5jZSB0byBhIHNwZWNpZmljIHZhbHVlLgVHcm91cAVBZG1pbgRBcmdzCnNldHJhbmtleHANc2V0cmFua3BvaW50cwRUeXBlBnBsYXllcgZ0YXJnZXQdUGxheWVyIHRvIHNldCByYW5rIHBvaW50cyBmb3IGbnVtYmVyBmFtb3VudB9BbW91bnQgb2YgUmFua0V4cGVyaWVuY2UgdG8gc2V0AAEEAAABAgATowAAAOIACAD/AQAAAgAAAG8CCQBvAwoAxQECAwEAAAAwAQAnAgAAAP8BAAACAAAA4gIPAOIDEwDFAQIDAQAAADABANsHAAAAggACABQDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAADDwMQAxEIAwsQAAAAABEAAAADEgAAAAABAAEYAAACAAAAAAAAAAMAAQUAAPoAAAEAAAAAANogt2vhGZ31pv4Eb0RgZCSqOKAf6OTdag==

-- https://lua.expert/
return {
	Name = "setrankp",
	Description = "Set a player\'s RankExperience to a specific value.",
	Group = "Admin",
	Aliases = { "setrankexp", "setrankpoints" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set rank points for"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "Amount of RankExperience to set"
		}
	}
}