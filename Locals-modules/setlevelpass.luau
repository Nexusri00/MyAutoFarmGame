-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUMc2V0bGV2ZWxwYXNzB0FsaWFzZXMLRGVzY3JpcHRpb24rU2V0IGEgcGxheWVyJ3MgRmlzaGluZyBQYXNzIGxldmVsIGRpcmVjdGx5LgVHcm91cAVBZG1pbgRBcmdzDHNldHBhc3NsZXZlbAlwYXNzbGV2ZWwEVHlwZQZwbGF5ZXIGdGFyZ2V0JFBsYXllciB0byBzZXQgRmlzaGluZyBQYXNzIGxldmVsIGZvcgZudW1iZXIFbGV2ZWwjRmlzaGluZyBQYXNzIGxldmVsIHRvIHNldCAoMSB0byA1MCkAAQQAAAECABOjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAIAAADiAg8A4gMTAMUBAgMBAAAAMAEA2wcAAACCAAIAFAMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAMNAw4IAwsMAAAAAA0AAAADDgAAAAMPAxADEQgDCxAAAAAAEQAAAAMSAAAAAAEAARgAAAIAAAAAAAAAAwABBQAA+gAAAQAAAAAALIQzmeIX3UXrU839tHdixlycJO0eQFmY

-- https://lua.expert/
return {
	Name = "setlevelpass",
	Description = "Set a player\'s Fishing Pass level directly.",
	Group = "Admin",
	Aliases = { "setpasslevel", "passlevel" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set Fishing Pass level for"
		},
		{
			Type = "number",
			Name = "level",
			Description = "Fishing Pass level to set (1 to 50)"
		}
	}
}