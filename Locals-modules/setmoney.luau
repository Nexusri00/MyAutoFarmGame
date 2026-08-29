-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUIc2V0bW9uZXkHQWxpYXNlcwtEZXNjcmlwdGlvbihTZXQgYSBwbGF5ZXIncyBNb25leSB0byBhbiBleGFjdCBhbW91bnQuBUdyb3VwBUFkbWluBEFyZ3MGc21vbmV5BFR5cGUGcGxheWVyBnRhcmdldA1UYXJnZXQgcGxheWVyBm51bWJlcgZhbW91bnQPTmV3IE1vbmV5IHZhbHVlAAEEAAABAgASowAAAOIACAD/AQAAAQAAAG8CCQDFAQICAQAAADABACcCAAAA/wEAAAIAAADiAg4A4gMSAMUBAgMBAAAAMAEA2wcAAACCAAIAEwMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAMNCAMKCwAAAAAMAAAAAw0AAAADDgMPAxAIAwoPAAAAABAAAAADEQAAAAABAAEYAAACAAAAAAAAAwABBQAA+gAAAQAAAAAAPw8lou9HF2hyf1b56Rv9S08XMtYNy0+j

-- https://lua.expert/
return {
	Name = "setmoney",
	Description = "Set a player\'s Money to an exact amount.",
	Group = "Admin",
	Aliases = { "smoney" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Target player"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "New Money value"
		}
	}
}