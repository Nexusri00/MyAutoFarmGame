-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbhxTZXQgSGFraSBzdGFnZSBmb3IgYSBwbGF5ZXIuBUdyb3VwBUFkbWluBEFyZ3MGc2NyaXB0CWhha2lzdGFnZQpzZXRoYWtpbHZsBFR5cGUGcGxheWVyBnRhcmdldBdQbGF5ZXIgdG8gc2V0IHN0YWdlIGZvcgZzdHJpbmcIaGFraVR5cGU/SGFraSB0eXBlOiBhcm1hbWVudCwgYXJtYW1lbnR2Mi9yeW91LCBvYnNlcnZhdGlvbiwgb3IgY29ucXVlcm9yBm51bWJlcgVzdGFnZQxTdGFnZSB0byBzZXQAAQUAAAECABqjAAAA4gAHAKQBCQAAAIBATQEBugAAAAAwAQC6AAAAAP8BAAACAAAAbwIKAG8DCwDFAQIDAQAAADABACcBAAAA/wEAAAMAAADiAhAA4gMUAOIEGADFAQIEAQAAADABANsGAAAAggACABkDAQMCAwMDBAMFAwYDBwgFAP////8B/////wIDAAAABAUAAAAG/////wMIBAAAgEADCQMKAwsDDAMNAw4IAwwNAAAAAA4AAAACDwAAAAMPAxADEQgDDBEAAAAAEgAAAAITAAAAAxIDEwMUCAMMFQAAAAAWAAAAAhcAAAAAAQABGAAAAQAAAAAAAQAAAAAAAAADAAEFBQAA9QAAAQAAAAAAQik62RaOR0kE5qQp3okzajIxLa1w7VDY

-- https://lua.expert/
return {
	Description = "Set Haki stage for a player.",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "hakistage", "sethakilvl" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set stage for"
		},
		{
			Type = "string",
			Name = "hakiType",
			Description = "Haki type: armament, armamentv2/ryou, observation, or conqueror"
		},
		{
			Type = "number",
			Name = "stage",
			Description = "Stage to set"
		}
	}
}