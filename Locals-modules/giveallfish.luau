-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWULZ2l2ZWFsbGZpc2gHQWxpYXNlcwtEZXNjcmlwdGlvboIBR2l2ZSBhIHBsYXllciBvbmUgZmlzaCBvZiBldmVyeSBzcGVjaWVzIGFjcm9zcyBhbGwgdGllcnMsIGluY2x1ZGluZyB0aGUgV2hhbGUncyBCbGVzc2luZyBldmVudC1vbmx5IHNwZWNpZXMgKHRlc3RpbmcgRmlzaFN0b3JhZ2UpLgVHcm91cAVBZG1pbgRBcmdzCGdpdmVmaXNoB2FsbGZpc2gEVHlwZQZwbGF5ZXIGdGFyZ2V0K1BsYXllciB0byByZWNlaXZlIG9uZSBmaXNoIG9mIGV2ZXJ5IHNwZWNpZXMAAQQAAAECABKjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAEAAADiAg8AxQECAgEAAAAwAQDbBwAAAIIAAgAQAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0DDggDCwwAAAAADQAAAAMOAAAAAAEAARgAAAIAAAAAAAAAAwABAAD/AAABAAAAAAC7T1Jwo0a44mJqRAeRoLi5y1dFBImLOHE=

-- https://lua.expert/
return {
	Name = "giveallfish",
	Description = "Give a player one fish of every species across all tiers, including the Whale\'s Blessing event-only species (testing FishStorage).",
	Group = "Admin",
	Aliases = { "givefish", "allfish" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive one fish of every species"
		}
	}
}