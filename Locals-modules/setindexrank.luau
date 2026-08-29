-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUMc2V0aW5kZXhyYW5rB0FsaWFzZXMLRGVzY3JpcHRpb260AVNldCBhIHBsYXllcidzIEluZGV4IGZhY3Rpb24gcmFuayBkaXJlY3RseSAoMCA9IG5vdCBhIG1lbWJlciwgMSBQcm9zZWx5dGUgLi4gNCBPcmFjbGUncyBQcm94eSkuIFJhbmsgMyBpcyB3aGF0IHRoZSBSaWVuIG9idGFpbiBxdWVzdGxpbmUgZGVtYW5kcy4gVXNhZ2U6IHNldGluZGV4cmFuayA8cGxheWVyPiA8MC00PgVHcm91cAVBZG1pbgRBcmdzCWluZGV4cmFuawRUeXBlBnBsYXllcgZ0YXJnZXQgUGxheWVyIHRvIHNldCB0aGUgSW5kZXggcmFuayBmb3IHaW50ZWdlcgRyYW5rSDAgPSBsZWF2ZSB0aGUgSW5kZXgsIDEgUHJvc2VseXRlLCAyIE1lc3NlbmdlciwgMyBQcm94eSwgNCBPcmFjbGUncyBQcm94eQABBAAAAQIAEqMAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAACAAAA4gIOAOIDEgDFAQIDAQAAADABANsHAAAAggACABMDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQgDCgsAAAAADAAAAAMNAAAAAw4DDwMQCAMKDwAAAAAQAAAAAxEAAAAAAQABGAAAAgAAAAAAAAMAAQUAAPoAAAEAAAAAAHwRQ9fhvP3X5WGpc8OiutYMCVSjTtUp1g==

-- https://lua.expert/
return {
	Name = "setindexrank",
	Description = "Set a player\'s Index faction rank directly (0 = not a member, 1 Proselyte .. 4 Oracle\'s Proxy). Rank 3 is what the Rien obtain questline demands. Usage: setindexrank <player> <0-4>",
	Group = "Admin",
	Aliases = { "indexrank" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set the Index rank for"
		},
		{
			Type = "integer",
			Name = "rank",
			Description = "0 = leave the Index, 1 Proselyte, 2 Messenger, 3 Proxy, 4 Oracle\'s Proxy"
		}
	}
}