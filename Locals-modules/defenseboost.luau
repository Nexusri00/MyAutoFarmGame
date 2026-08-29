-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUBE5hbWUMZGVmZW5zZWJvb3N0B0FsaWFzZXMLRGVzY3JpcHRpb25CR3JhbnQgYSBwbGF5ZXIgYSBEYW1hZ2VSZWR1Y3Rpb24gYm9vc3QuIFNldCBwZXJjZW50IHRvIDAgdG8gY2xlYXIuBUdyb3VwBUFkbWluBEFyZ3MIZGVmYm9vc3QFZGVmZHIEVHlwZQZwbGF5ZXIGdGFyZ2V0DVRhcmdldCBwbGF5ZXIGbnVtYmVyB3BlcmNlbnRTRGFtYWdlUmVkdWN0aW9uIHBlcmNlbnRhZ2UgKGUuZy4gNTAgZm9yIDUwJSBsZXNzIGRhbWFnZSB0YWtlbikuIDAgY2xlYXJzIHRoZSBib29zdC4IZHVyYXRpb25BRHVyYXRpb24gaW4gc2Vjb25kcyAoMCBvciBibGFuayA9IGluZmluaXRlLCB1bnRpbCBkZWF0aC9yZXNwYXduKS4IT3B0aW9uYWwAAQUAAAECABSjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAMAAADiAg8A4gMTAOIEGADFAQIEAQAAADABANsHAAAAggACABkDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAADDwMQAxEIAwsQAAAAABEAAAADEgAAAAMSAxMDFAEBCAQLEAAAAAAUAAAAAxUAAAAWFwAAAAABAAEYAAACAAAAAAAAAAMAAQUFAAD1AAABAAAAAAC7P+FwIPoh5N6ovLFIGsV/yyf2BIn7i3E=

-- https://lua.expert/
return {
	Name = "defenseboost",
	Description = "Grant a player a DamageReduction boost. Set percent to 0 to clear.",
	Group = "Admin",
	Aliases = { "defboost", "defdr" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Target player"
		},
		{
			Type = "number",
			Name = "percent",
			Description = "DamageReduction percentage (e.g. 50 for 50% less damage taken). 0 clears the boost."
		},
		{
			Type = "number",
			Name = "duration",
			Description = "Duration in seconds (0 or blank = infinite, until death/respawn).",
			Optional = true
		}
	}
}