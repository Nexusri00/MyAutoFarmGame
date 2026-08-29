-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUJc2V0Ym91bnR5B0FsaWFzZXMLRGVzY3JpcHRpb24pU2V0IGEgcGxheWVyJ3MgQm91bnR5IHRvIGFuIGV4YWN0IGFtb3VudC4FR3JvdXAFQWRtaW4EQXJncwdzYm91bnR5BFR5cGUGcGxheWVyBnRhcmdldA1UYXJnZXQgcGxheWVyBm51bWJlcgZhbW91bnQQTmV3IEJvdW50eSB2YWx1ZQABBAAAAQIAEqMAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAACAAAA4gIOAOIDEgDFAQIDAQAAADABANsHAAAAggACABMDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQgDCgsAAAAADAAAAAMNAAAAAw4DDwMQCAMKDwAAAAAQAAAAAxEAAAAAAQABGAAAAgAAAAAAAAMAAQUAAPoAAAEAAAAAAJxfW9WRPz0UW7cfu3Rz48LsR0yhrpsx1A==

-- https://lua.expert/
return {
	Name = "setbounty",
	Description = "Set a player\'s Bounty to an exact amount.",
	Group = "Admin",
	Aliases = { "sbounty" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Target player"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "New Bounty value"
		}
	}
}