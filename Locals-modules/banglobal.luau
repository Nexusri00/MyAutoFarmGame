-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMYBE5hbWUJYmFuZ2xvYmFsB0FsaWFzZXMLRGVzY3JpcHRpb26ZAUJhbiBhIHBsYXllciBmcm9tIEFMTCBzZXJ2ZXJzIGFuZCBBTEwgcGxhY2VzIChSb2Jsb3ggbmF0aXZlIGJhbikuIENob29zZSAncGVybWFuZW50JyBvciBhIGR1cmF0aW9uIGxpa2UgN2QvMjRoLzMwbS4gQmFucyBhbHRzIHRvbyB1bmxlc3MgJ2FsdHMnIGlzIGZhbHNlLgVHcm91cAVBZG1pbgRBcmdzA2JhbgRnYmFuBFR5cGUIcGxheWVySWQGdGFyZ2V0OlBsYXllciB0byBiYW4gKHdvcmtzIGV2ZW4gaWYgb2ZmbGluZSBvciBpbiBhbm90aGVyIHNlcnZlcikGc3RyaW5nCGR1cmF0aW9uOidwZXJtYW5lbnQnLCBvciBhIGR1cmF0aW9uIGxpa2UgN2QgLyAyNGggLyAzMG0gLyAzMCAoZGF5cykGcmVhc29uKUJhbiByZWFzb24gc2hvd24gdG8gdGhlIHBsYXllciAob3B0aW9uYWwpCE9wdGlvbmFsB2Jvb2xlYW4EYWx0cyVBbHNvIGJhbiBhbHQgYWNjb3VudHMgKGRlZmF1bHQ6IHRydWUpB0RlZmF1bHQAAQYAAAECABWjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAQAAADiAg8A4gMTAOIEGADiBR0AxQECBQEAAAAwAQDbBwAAAIIAAgAeAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0DDggDCwwAAAAADQAAAAMOAAAAAw8DEAMRCAMLEAAAAAARAAAAAxIAAAADEgMTAxQBAQgECxAAAAAAFAAAAAMVAAAAFhcAAAADFQMWAxcDGAgFCxkAAAAAGgAAAAMbAAAAFhcAAAAcFwAAAAABAAEYAAACAAAAAAAAAAMAAQUFBgAA7wAAAQAAAAAADVqZC9ymZ5iCcTSqZchptH1Cjn8/nvMK

-- https://lua.expert/
return {
	Name = "banglobal",
	Description = "Ban a player from ALL servers and ALL places (Roblox native ban). Choose \'permanent\' or a duration like 7d/24h/30m. Bans alts too unless \'alts\' is false.",
	Group = "Admin",
	Aliases = { "ban", "gban" },
	Args = {
		{
			Type = "playerId",
			Name = "target",
			Description = "Player to ban (works even if offline or in another server)"
		},
		{
			Type = "string",
			Name = "duration",
			Description = "\'permanent\', or a duration like 7d / 24h / 30m / 30 (days)"
		},
		{
			Type = "string",
			Name = "reason",
			Description = "Ban reason shown to the player (optional)",
			Optional = true
		},
		{
			Type = "boolean",
			Name = "alts",
			Description = "Also ban alt accounts (default: true)",
			Optional = true,
			Default = true
		}
	}
}