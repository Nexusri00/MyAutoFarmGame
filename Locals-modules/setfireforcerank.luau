-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUQc2V0ZmlyZWZvcmNlcmFuawdBbGlhc2VzC0Rlc2NyaXB0aW9uWFNldCBhIHBsYXllcidzIEZpcmUgRm9yY2UgY29tcGFueSByYW5rIGRpcmVjdGx5LiBVc2FnZTogc2V0ZmlyZWZvcmNlcmFuayA8cGxheWVyPiA8cmFuaz4FR3JvdXAFQWRtaW4EQXJncwlzZXRmZnJhbmsGZmZyYW5rBFR5cGUGcGxheWVyBnRhcmdldCFQbGF5ZXIgdG8gc2V0IEZpcmUgRm9yY2UgcmFuayBmb3IGc3RyaW5nBHJhbmtzUmFuayBuYW1lIChDYWRldC9SZWNydWl0L1NlY29uZCBDbGFzcyBGaXJlIFNvbGRpZXIvRmlyc3QgQ2xhc3MgRmlyZSBTb2xkaWVyL0xpZXV0ZW5hbnQvQ2FwdGFpbikgb3IgcmFuayBpbmRleCAoMS02KQABBAAAAQIAE6MAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAgAAAOICDwDiAxMAxQECAwEAAAAwAQDbBwAAAIIAAgAUAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0DDggDCwwAAAAADQAAAAMOAAAAAw8DEAMRCAMLEAAAAAARAAAAAxIAAAAAAQABGAAAAgAAAAAAAAADAAEFAAD6AAABAAAAAAAMyfsgfqnUVCEvn0/CWErcfNHsVD4NkSE=

-- https://lua.expert/
return {
	Name = "setfireforcerank",
	Description = "Set a player\'s Fire Force company rank directly. Usage: setfireforcerank <player> <rank>",
	Group = "Admin",
	Aliases = { "setffrank", "ffrank" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set Fire Force rank for"
		},
		{
			Type = "string",
			Name = "rank",
			Description = "Rank name (Cadet/Recruit/Second Class Fire Soldier/First Class Fire Soldier/Lieutenant/Captain) or rank index (1-6)"
		}
	}
}