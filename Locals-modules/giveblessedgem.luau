-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUBE5hbWUOZ2l2ZWJsZXNzZWRnZW0HQWxpYXNlcwtEZXNjcmlwdGlvbkZHaXZlIGEgZ3VhcmFudGVlZCBCbGVzc2VkIGdlbSBvZiBhIHNwZWNpZmljIHRpZXIgYW5kIHN0YXQgdG8gYSBwbGF5ZXIuBUdyb3VwBUFkbWluBEFyZ3MPZ3JhbnRibGVzc2VkZ2VtBFR5cGUGcGxheWVyBnRhcmdldCFQbGF5ZXIgdG8gcmVjZWl2ZSB0aGUgYmxlc3NlZCBnZW0HZ2VtdGllcgR0aWVyOEdlbSB0aWVyIChDb21tb24sIFJhcmUsIEVwaWMsIExlZ2VuZGFyeSwgTXl0aGljLCBTZWNyZXQpB2dlbXN0YXQEc3RhdDVNYWluIHN0YXQgb2YgdGhlIGdlbSAob3B0aW9uYWwg4oCUIHJhbmRvbSBpZiBvbWl0dGVkKQhPcHRpb25hbAABBQAAAQIAE6MAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAADAAAA4gIOAOIDEgDiBBgAxQECBAEAAAAwAQDbBwAAAIIAAgAZAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0IAwoLAAAAAAwAAAADDQAAAAMOAw8DEAgDCg8AAAAAEAAAAAMRAAAAAxEDEgMTAxQBAQgEChMAAAAAFAAAAAMVAAAAFhcAAAAAAQABGAAAAgAAAAAAAAMAAQUFAAD1AAABAAAAAACsMWWpPN5dCkLsSIIcdUdn3Cly3Z71D6g=

-- https://lua.expert/
return {
	Name = "giveblessedgem",
	Description = "Give a guaranteed Blessed gem of a specific tier and stat to a player.",
	Group = "Admin",
	Aliases = { "grantblessedgem" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive the blessed gem"
		},
		{
			Type = "gemtier",
			Name = "tier",
			Description = "Gem tier (Common, Rare, Epic, Legendary, Mythic, Secret)"
		},
		{
			Type = "gemstat",
			Name = "stat",
			Description = "Main stat of the gem (optional \226\128\148 random if omitted)",
			Optional = true
		}
	}
}