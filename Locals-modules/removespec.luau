-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUKcmVtb3Zlc3BlYwdBbGlhc2VzC0Rlc2NyaXB0aW9uYkRlbGV0ZSBhbiBvd25lZCBTdHlsZS9BYmlsaXR5IHNwZWMgZnJvbSBhIHBsYXllcidzIGRhdGEgc28gcXVlc3RsaW5lL3Nob3Agb3duZXJzaGlwIGdhdGVzIHJlLW9wZW4uBUdyb3VwBUFkbWluBEFyZ3MKZGVsZXRlc3BlYwh3aXBlc3BlYwRUeXBlBnBsYXllcgZ0YXJnZXQeUGxheWVyIHRvIHJlbW92ZSB0aGUgc3BlYyBmcm9tCGl0ZW1uYW1lBHNwZWMxU3R5bGUvQWJpbGl0eSBzcGVjIG5hbWUgKFJpZW4sIEdvam8sIFN1a3VuYSwgLi4uKQABBAAAAQIAE6MAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAgAAAOICDwDiAxMAxQECAwEAAAAwAQDbBwAAAIIAAgAUAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0DDggDCwwAAAAADQAAAAMOAAAAAw8DEAMRCAMLEAAAAAARAAAAAxIAAAAAAQABGAAAAgAAAAAAAAADAAEFAAD6AAABAAAAAAB3KmGW+i1MKg1InmlL4IhFBzJ24kXuC5c=

-- https://lua.expert/
return {
	Name = "removespec",
	Description = "Delete an owned Style/Ability spec from a player\'s data so questline/shop ownership gates re-open.",
	Group = "Admin",
	Aliases = { "deletespec", "wipespec" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to remove the spec from"
		},
		{
			Type = "itemname",
			Name = "spec",
			Description = "Style/Ability spec name (Rien, Gojo, Sukuna, ...)"
		}
	}
}