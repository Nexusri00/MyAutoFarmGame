-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWULd2lwZXByb2ZpbGUHQWxpYXNlcwtEZXNjcmlwdGlvbkVIYXJkIHdpcGUgcHJvZmlsZSBkYXRhIHVzaW5nIF9HLkRhdGFNYW5hZ2VyOldpcGUgKHJlc2V0cyBldmVyeXRoaW5nKS4FR3JvdXAFQWRtaW4EQXJncwp3aXBlcGxheWVyCGhhcmR3aXBlBFR5cGUGcGxheWVyBnRhcmdldA5QbGF5ZXIgdG8gd2lwZQABBAAAAQIAEqMAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAQAAAOICDwDFAQICAQAAADABANsHAAAAggACABADAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAAAAQABGAAAAgAAAAAAAAADAAEAAP8AAAEAAAAAAK+zmo2Xa5T5xsgJhbtyjJLfq435nXfwjA==

-- https://lua.expert/
return {
	Name = "wipeprofile",
	Description = "Hard wipe profile data using _G.DataManager:Wipe (resets everything).",
	Group = "Admin",
	Aliases = { "wipeplayer", "hardwipe" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to wipe"
		}
	}
}