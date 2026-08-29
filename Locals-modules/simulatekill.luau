-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTBE5hbWUMc2ltdWxhdGVraWxsB0FsaWFzZXMLRGVzY3JpcHRpb24oU2ltdWxhdGUgcGxheWVyIGtpbGxzIGZvciBxdWVzdCB0ZXN0aW5nLgVHcm91cAVBZG1pbgRBcmdzB3NpbWtpbGwIdGVzdGtpbGwEVHlwZQZwbGF5ZXIGdGFyZ2V0HVBsYXllciB0byByZWNlaXZlIGtpbGwgY3JlZGl0B0RlZmF1bHQABm51bWJlcgZhbW91bnQjTnVtYmVyIG9mIGtpbGxzIHRvIHNpbXVsYXRlICgxLTEwMCkAAQQAAAECABOjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAIAAADiAhEA4gMWAMUBAgMBAAAAMAEA2wcAAACCAAIAFwMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAMNAw4DDwMQCAQLDAAAAAANAAAAAw4AAAAPEAAAAAMRAxIDEwIAAAAAAADwPwgECxIAAAAAEwAAAAMUAAAADxUAAAAAAQABGAAAAgAAAAAAAAADAAEGAAD5AAABAAAAAACbcdKtclVQhiuH5OMN5Ts762nF2am1uKw=

-- https://lua.expert/
return {
	Name = "simulatekill",
	Description = "Simulate player kills for quest testing.",
	Group = "Admin",
	Aliases = { "simkill", "testkill" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive kill credit",
			Default = ""
		},
		{
			Type = "number",
			Name = "amount",
			Description = "Number of kills to simulate (1-100)",
			Default = 1
		}
	}
}