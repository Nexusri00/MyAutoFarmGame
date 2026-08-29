-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUJZ2l2ZW1vbmV5B0FsaWFzZXMLRGVzY3JpcHRpb24XR2l2ZSBNb25leSB0byBhIHBsYXllci4FR3JvdXAFQWRtaW4EQXJncwpncmFudG1vbmV5CGFkZG1vbmV5BFR5cGUGcGxheWVyBnRhcmdldBdQbGF5ZXIgdG8gcmVjZWl2ZSBNb25leQZudW1iZXIGYW1vdW50F0Ftb3VudCBvZiBNb25leSB0byBnaXZlAAEEAAABAgATowAAAOIACAD/AQAAAgAAAG8CCQBvAwoAxQECAwEAAAAwAQAnAgAAAP8BAAACAAAA4gIPAOIDEwDFAQIDAQAAADABANsHAAAAggACABQDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAADDwMQAxEIAwsQAAAAABEAAAADEgAAAAABAAEYAAACAAAAAAAAAAMAAQUAAPoAAAEAAAAAABRu/DnwUi5aQjJzbNpIc0VkdutNJqqWOA==

-- https://lua.expert/
return {
	Name = "givemoney",
	Description = "Give Money to a player.",
	Group = "Admin",
	Aliases = { "grantmoney", "addmoney" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive Money"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "Amount of Money to give"
		}
	}
}