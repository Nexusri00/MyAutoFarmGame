-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUIc2V0dHJhaXQHQWxpYXNlcwtEZXNjcmlwdGlvbi1TZXQgYSBwbGF5ZXIncyBUcmFpdCB0byBhbnkgdmFsaWQgdHJhaXQgbmFtZS4FR3JvdXAFQWRtaW4EQXJncwZzdHJhaXQEVHlwZQZwbGF5ZXIGdGFyZ2V0DVRhcmdldCBwbGF5ZXIJdHJhaXRuYW1lBXRyYWl0MlRyYWl0IG5hbWUg4oCUIGF1dG9jb21wbGV0ZXMgZnJvbSBhbGwgdmFsaWQgdHJhaXRzAAEEAAABAgASowAAAOIACAD/AQAAAQAAAG8CCQDFAQICAQAAADABACcCAAAA/wEAAAIAAADiAg4A4gMSAMUBAgMBAAAAMAEA2wcAAACCAAIAEwMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAMNCAMKCwAAAAAMAAAAAw0AAAADDgMPAxAIAwoPAAAAABAAAAADEQAAAAABAAEYAAACAAAAAAAAAwABBQAA+gAAAQAAAAAA4SmZOTEKdhycygghVGbrOpExjk3T7fM4

-- https://lua.expert/
return {
	Name = "settrait",
	Description = "Set a player\'s Trait to any valid trait name.",
	Group = "Admin",
	Aliases = { "strait" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Target player"
		},
		{
			Type = "traitname",
			Name = "trait",
			Description = "Trait name \226\128\148 autocompletes from all valid traits"
		}
	}
}