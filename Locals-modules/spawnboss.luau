-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUJc3Bhd25ib3NzB0FsaWFzZXMLRGVzY3JpcHRpb244U3Bhd24gYSBzcGVjaWZpYyBib3NzIGJ5IG5hbWUgKHBhcnRpYWwgbWF0Y2ggc3VwcG9ydGVkKS4FR3JvdXAFQWRtaW4EQXJncwJzYgRUeXBlCGJvc3NuYW1lCGJvc3NOYW1lNEJvc3MgbmFtZSAoc3VwcG9ydHMgcGFydGlhbCBtYXRjaCB3aXRoIGF1dG9jb21wbGV0ZSkGbnVtYmVyBmFtb3VudC1OdW1iZXIgb2YgYm9zc2VzIHRvIHNwYXduIChkZWZhdWx0IDEsIG1heCAxMCkHRGVmYXVsdAABBAAAAQIAEqMAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAACAAAA4gIOAOIDFADFAQIDAQAAADABANsHAAAAggACABUDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQgDCgsAAAAADAAAAAMNAAAAAw4DDwMQAxECAAAAAAAA8D8IBAoPAAAAABAAAAADEQAAABITAAAAAAEAARgAAAIAAAAAAAADAAEFAAD6AAABAAAAAACqU+KIvlyvjKU4XtefPsxj2kv1/JiXiIk=

-- https://lua.expert/
return {
	Name = "spawnboss",
	Description = "Spawn a specific boss by name (partial match supported).",
	Group = "Admin",
	Aliases = { "sb" },
	Args = {
		{
			Type = "bossname",
			Name = "bossName",
			Description = "Boss name (supports partial match with autocomplete)"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "Number of bosses to spawn (default 1, max 10)",
			Default = 1
		}
	}
}