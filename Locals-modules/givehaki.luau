-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbiZHaXZlIGEgc3BlY2lmaWMgSGFraSB0eXBlIHRvIGEgcGxheWVyLgVHcm91cAVBZG1pbgRBcmdzBnNjcmlwdAp1bmxvY2toYWtpBFR5cGUGcGxheWVyBnRhcmdldBZQbGF5ZXIgdG8gcmVjZWl2ZSBIYWtpBnN0cmluZwhoYWtpVHlwZS5IYWtpIHR5cGU6IGFybWFtZW50LCBvYnNlcnZhdGlvbiwgb3IgY29ucXVlcm9yAAEEAAABAgAYowAAAOIABwCkAQkAAACAQE0BAboAAAAAMAEAugAAAAD/AQAAAQAAAG8CCgDFAQICAQAAADABACcBAAAA/wEAAAIAAADiAg8A4gMTAMUBAgMBAAAAMAEA2wYAAACCAAIAFAMBAwIDAwMEAwUDBgMHCAUA/////wH/////AgMAAAAEBQAAAAb/////AwgEAACAQAMJAwoDCwMMAw0IAwsMAAAAAA0AAAACDgAAAAMOAw8DEAgDCxAAAAAAEQAAAAISAAAAAAEAARgAAAEAAAAAAAEAAAAAAAADAAEFAAD6AAABAAAAAABwZsI76oYO5ns2auIBgOrpAH7VT0KiqDo=

-- https://lua.expert/
return {
	Description = "Give a specific Haki type to a player.",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "unlockhaki" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive Haki"
		},
		{
			Type = "string",
			Name = "hakiType",
			Description = "Haki type: armament, observation, or conqueror"
		}
	}
}