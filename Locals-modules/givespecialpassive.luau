-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMSBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbrYBRm9yY2UgYSBTcGVjaWFsUGFzc2l2ZSBvbnRvIHRoZSB0YXJnZXQncyBjdXJyZW50bHkgZXF1aXBwZWQgV2VhcG9uL0FiaWxpdHkvU3R5bGUgdG9vbCAoZGV2LW9ubHkpLiBPbWl0IHBhc3NpdmVJZCAob3IgcGFzcyAnYXV0bycpIHRvIGF1dG8tcGljayArIHJvbGwgYSB2YXJpYW50IGZvciB0aGUgZXF1aXBwZWQgc3BlYy4FR3JvdXAFQWRtaW4EQXJncwZzY3JpcHQMZm9yY2VwYXNzaXZlA2dzcARUeXBlBnBsYXllcgZ0YXJnZXREUGxheWVyIHdob3NlIGVxdWlwcGVkIFdlYXBvbi9BYmlsaXR5L1N0eWxlIHdpbGwgcmVjZWl2ZSB0aGUgcGFzc2l2ZS4Gc3RyaW5nCXBhc3NpdmVJZHlTcGVjaWFsUGFzc2l2ZSBJZCAoZS5nLiBUYXRzdW1ha2lfTWV0ZW9yUHJlc3N1cmUpLiBPbWl0IG9yICdhdXRvJy8ncmFuZG9tJyA9IGF1dG8tcGljayBmb3IgZXF1aXBwZWQgc3BlYy4gJ2NsZWFyJyA9IHdpcGUuCE9wdGlvbmFsAAEEAAABAgAZowAAAOIABwCkAQkAAACAQE0BAboAAAAAMAEAugAAAAD/AQAAAgAAAG8CCgBvAwsAxQECAwEAAAAwAQAnAQAAAP8BAAACAAAA4gIQAOIDFgDFAQIDAQAAADABANsGAAAAggACABcDAQMCAwMDBAMFAwYDBwgFAP////8B/////wIDAAAABAUAAAAG/////wMIBAAAgEADCQMKAwsDDAMNAw4IAwwNAAAAAA4AAAACDwAAAAMPAxADEQMSAQEIBAwRAAAAABIAAAACEwAAABQVAAAAAAEAARgAAAEAAAAAAAEAAAAAAAAAAwABBQAA+gAAAQAAAAAAqc2mbgukkI2Iv3CX0ttY+tnVsRqbCcxv

-- https://lua.expert/
return {
	Description = "Force a SpecialPassive onto the target\'s currently equipped Weapon/Ability/Style tool (dev-only). Omit passiveId (or pass \'auto\') to auto-pick + roll a variant for the equipped spec.",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "forcepassive", "gsp" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player whose equipped Weapon/Ability/Style will receive the passive."
		},
		{
			Type = "string",
			Name = "passiveId",
			Description = "SpecialPassive Id (e.g. Tatsumaki_MeteorPressure). Omit or \'auto\'/\'random\' = auto-pick for equipped spec. \'clear\' = wipe.",
			Optional = true
		}
	}
}