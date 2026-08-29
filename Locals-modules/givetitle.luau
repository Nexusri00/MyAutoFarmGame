-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUJZ2l2ZXRpdGxlB0FsaWFzZXMLRGVzY3JpcHRpb24yR2l2ZSBhIHNwZWNpZmljIHRpdGxlIHRvIGEgcGxheWVyIChzYXZlZCB0byBkYXRhKS4FR3JvdXAFQWRtaW4EQXJncwpncmFudHRpdGxlBFR5cGUGcGxheWVyBnRhcmdldBtQbGF5ZXIgdG8gcmVjZWl2ZSB0aGUgdGl0bGUJdGl0bGVuYW1lBXRpdGxlJFRpdGxlIG5hbWUgKG11c3QgZXhpc3QgaW4gVGl0bGVEYXRhKQABBAAAAQIAEqMAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAACAAAA4gIOAOIDEgDFAQIDAQAAADABANsHAAAAggACABMDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQgDCgsAAAAADAAAAAMNAAAAAw4DDwMQCAMKDwAAAAAQAAAAAxEAAAAAAQABGAAAAgAAAAAAAAMAAQUAAPoAAAEAAAAAAMpMn14WB7GronhBH+MIZ7S6VIgq+Ij1Xw==

-- https://lua.expert/
return {
	Name = "givetitle",
	Description = "Give a specific title to a player (saved to data).",
	Group = "Admin",
	Aliases = { "granttitle" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive the title"
		},
		{
			Type = "titlename",
			Name = "title",
			Description = "Title name (must exist in TitleData)"
		}
	}
}