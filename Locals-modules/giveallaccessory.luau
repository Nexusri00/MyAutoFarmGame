-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbi9HaXZlIGFsbCBhY2Nlc3NvcnkgdG8gYSBwbGF5ZXIgKHNhdmVkIHRvIGRhdGEpLgVHcm91cAVBZG1pbgRBcmdzBnNjcmlwdAVncmFudAlncmFudGl0ZW0EVHlwZQZwbGF5ZXIGdGFyZ2V0FlBsYXllciB0byByZWNlaXZlIGl0ZW0AAQQAAAECABijAAAA4gAHAKQBCQAAAIBATQEBugAAAAAwAQC6AAAAAP8BAAACAAAAbwIKAG8DCwDFAQIDAQAAADABACcBAAAA/wEAAAEAAADiAhAAxQECAgEAAAAwAQDbBgAAAIIAAgARAwEDAgMDAwQDBQMGAwcIBQD/////Af////8CAwAAAAQFAAAABv////8DCAQAAIBAAwkDCgMLAwwDDQMOCAMMDQAAAAAOAAAAAg8AAAAAAQABGAAAAQAAAAAAAQAAAAAAAAADAAEAAP8AAAEAAAAAAHnXHLh+7jPbJz9tn9DPtAUJzwvMSxN2uQ==

-- https://lua.expert/
return {
	Description = "Give all accessory to a player (saved to data).",
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