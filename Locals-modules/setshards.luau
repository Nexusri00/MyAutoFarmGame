-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUJc2V0c2hhcmRzB0FsaWFzZXMLRGVzY3JpcHRpb24pU2V0IGEgcGxheWVyJ3MgU2hhcmRzIHRvIGFuIGV4YWN0IGFtb3VudC4FR3JvdXAFQWRtaW4EQXJncwdzc2hhcmRzBFR5cGUGcGxheWVyBnRhcmdldA1UYXJnZXQgcGxheWVyBm51bWJlcgZhbW91bnQQTmV3IFNoYXJkcyB2YWx1ZQABBAAAAQIAEqMAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAACAAAA4gIOAOIDEgDFAQIDAQAAADABANsHAAAAggACABMDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQgDCgsAAAAADAAAAAMNAAAAAw4DDwMQCAMKDwAAAAAQAAAAAxEAAAAAAQABGAAAAgAAAAAAAAMAAQUAAPoAAAEAAAAAAG1cs1WTIZWXA9r3+zKyPHEdRKQhX5jZVA==

-- https://lua.expert/
return {
	Name = "setshards",
	Description = "Set a player\'s Shards to an exact amount.",
	Group = "Admin",
	Aliases = { "sshards" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Target player"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "New Shards value"
		}
	}
}