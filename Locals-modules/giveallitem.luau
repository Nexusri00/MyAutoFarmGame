-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbipHaXZlIGFsbCBpdGVtIHRvIGEgcGxheWVyIChzYXZlZCB0byBkYXRhKS4FR3JvdXAFQWRtaW4EQXJncwZzY3JpcHQFZ3JhbnQJZ3JhbnRpdGVtBFR5cGUGcGxheWVyBnRhcmdldBZQbGF5ZXIgdG8gcmVjZWl2ZSBpdGVtAAEEAAABAgAYowAAAOIABwCkAQkAAACAQE0BAboAAAAAMAEAugAAAAD/AQAAAgAAAG8CCgBvAwsAxQECAwEAAAAwAQAnAQAAAP8BAAABAAAA4gIQAMUBAgIBAAAAMAEA2wYAAACCAAIAEQMBAwIDAwMEAwUDBgMHCAUA/////wH/////AgMAAAAEBQAAAAb/////AwgEAACAQAMJAwoDCwMMAw0DDggDDA0AAAAADgAAAAIPAAAAAAEAARgAAAEAAAAAAAEAAAAAAAAAAwABAAD/AAABAAAAAAAmRL2g1aOHcRrsm0VaBdB1Vlyq1BSA16E=

-- https://lua.expert/
return {
	Description = "Give all item to a player (saved to data).",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "grant", "grantitem" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive item"
		}
	}
}