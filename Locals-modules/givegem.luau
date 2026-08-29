-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUBE5hbWUHZ2l2ZWdlbQdBbGlhc2VzC0Rlc2NyaXB0aW9uM0dpdmUgYSBnZW0gb2YgYSBzcGVjaWZpYyB0aWVyIGFuZCBzdGF0IHRvIGEgcGxheWVyLgVHcm91cAVBZG1pbgRBcmdzCGdyYW50Z2VtBFR5cGUGcGxheWVyBnRhcmdldBlQbGF5ZXIgdG8gcmVjZWl2ZSB0aGUgZ2VtB2dlbXRpZXIEdGllcjhHZW0gdGllciAoQ29tbW9uLCBSYXJlLCBFcGljLCBMZWdlbmRhcnksIE15dGhpYywgU2VjcmV0KQdnZW1zdGF0BHN0YXQ1TWFpbiBzdGF0IG9mIHRoZSBnZW0gKG9wdGlvbmFsIOKAlCByYW5kb20gaWYgb21pdHRlZCkIT3B0aW9uYWwAAQUAAAECABOjAAAA4gAIAP8BAAABAAAAbwIJAMUBAgIBAAAAMAEAJwIAAAD/AQAAAwAAAOICDgDiAxIA4gQYAMUBAgQBAAAAMAEA2wcAAACCAAIAGQMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAMNCAMKCwAAAAAMAAAAAw0AAAADDgMPAxAIAwoPAAAAABAAAAADEQAAAAMRAxIDEwMUAQEIBAoTAAAAABQAAAADFQAAABYXAAAAAAEAARgAAAIAAAAAAAADAAEFBQAA9QAAAQAAAAAAPmzkVBub8xiccHxRIKEF8k508yAMqI5V

-- https://lua.expert/
return {
	Name = "givegem",
	Description = "Give a gem of a specific tier and stat to a player.",
	Group = "Admin",
	Aliases = { "grantgem" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive the gem"
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