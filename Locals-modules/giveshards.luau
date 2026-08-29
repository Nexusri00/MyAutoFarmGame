-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUKZ2l2ZXNoYXJkcwdBbGlhc2VzC0Rlc2NyaXB0aW9uGEdpdmUgU2hhcmRzIHRvIGEgcGxheWVyLgVHcm91cAVBZG1pbgRBcmdzC2dyYW50c2hhcmRzCWFkZHNoYXJkcwRUeXBlBnBsYXllcgZ0YXJnZXQYUGxheWVyIHRvIHJlY2VpdmUgU2hhcmRzBm51bWJlcgZhbW91bnQYQW1vdW50IG9mIFNoYXJkcyB0byBnaXZlAAEEAAABAgATowAAAOIACAD/AQAAAgAAAG8CCQBvAwoAxQECAwEAAAAwAQAnAgAAAP8BAAACAAAA4gIPAOIDEwDFAQIDAQAAADABANsHAAAAggACABQDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAADDwMQAxEIAwsQAAAAABEAAAADEgAAAAABAAEYAAACAAAAAAAAAAMAAQUAAPoAAAEAAAAAAOEbrp1X8pgcwcf2pD4ZpoCRA7np09/EnA==

-- https://lua.expert/
return {
	Name = "giveshards",
	Description = "Give Shards to a player.",
	Group = "Admin",
	Aliases = { "grantshards", "addshards" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive Shards"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "Amount of Shards to give"
		}
	}
}