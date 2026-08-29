-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUMc2V0cG90ZW50aWFsB0FsaWFzZXMLRGVzY3JpcHRpb25JU2V0IGEgcGxheWVyJ3MgcG90ZW50aWFsIChzdGF0IHJlcm9sbHMpIHRvIGEgc3BlY2lmaWMgcmFuayBmb3IgYWxsIHN0YXRzLgVHcm91cAVBZG1pbgRBcmdzDHBvdGVudGlhbHNldAZzZXRwb3QEVHlwZQZwbGF5ZXIGdGFyZ2V0G1BsYXllciB0byBzZXQgcG90ZW50aWFsIGZvcgZzdHJpbmcEcmFua0JSYW5rIHRvIHNldCBhbGwgcG90ZW50aWFscyB0byAoS2FtaSwgU1NTLCBTUywgUywgQSwgQiwgQywgRCwgRSwgRikAAQQAAAECABOjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAIAAADiAg8A4gMTAMUBAgMBAAAAMAEA2wcAAACCAAIAFAMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAMNAw4IAwsMAAAAAA0AAAADDgAAAAMPAxADEQgDCxAAAAAAEQAAAAMSAAAAAAEAARgAAAIAAAAAAAAAAwABBQAA+gAAAQAAAAAAcB6CoOxuEUmE6bezTbp6NAAGldRC2uih

-- https://lua.expert/
return {
	Name = "setpotential",
	Description = "Set a player\'s potential (stat rerolls) to a specific rank for all stats.",
	Group = "Admin",
	Aliases = { "potentialset", "setpot" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set potential for"
		},
		{
			Type = "string",
			Name = "rank",
			Description = "Rank to set all potentials to (Kami, SSS, SS, S, A, B, C, D, E, F)"
		}
	}
}