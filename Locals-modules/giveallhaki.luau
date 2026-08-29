-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbjBHaXZlIGFsbCBoYWtpIHR5cGVzIHRvIGEgcGxheWVyIChzYXZlZCB0byBkYXRhKS4FR3JvdXAFQWRtaW4EQXJncwZzY3JpcHQMZ3JhbnRhbGxoYWtpDXVubG9ja2FsbGhha2kEVHlwZQZwbGF5ZXIGdGFyZ2V0FlBsYXllciB0byByZWNlaXZlIGhha2kAAQQAAAECABijAAAA4gAHAKQBCQAAAIBATQEBugAAAAAwAQC6AAAAAP8BAAACAAAAbwIKAG8DCwDFAQIDAQAAADABACcBAAAA/wEAAAEAAADiAhAAxQECAgEAAAAwAQDbBgAAAIIAAgARAwEDAgMDAwQDBQMGAwcIBQD/////Af////8CAwAAAAQFAAAABv////8DCAQAAIBAAwkDCgMLAwwDDQMOCAMMDQAAAAAOAAAAAg8AAAAAAQABGAAAAQAAAAAAAQAAAAAAAAADAAEAAP8AAAEAAAAAAI42ykTQKuoDjXlDKj4Wta3+Lt0wvPKgRQ==

-- https://lua.expert/
return {
	Description = "Give all haki types to a player (saved to data).",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "grantallhaki", "unlockallhaki" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive haki"
		}
	}
}