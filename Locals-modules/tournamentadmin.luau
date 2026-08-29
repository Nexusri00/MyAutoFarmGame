-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMWBE5hbWUPdG91cm5hbWVudGFkbWluB0FsaWFzZXMLRGVzY3JpcHRpb24xSW5zcGVjdCBvciBtYW5hZ2UgRWNsaXBzZSBDaGFtcGlvbnNoaXAgdGVzdCBkYXRhLgVHcm91cAVBZG1pbgRBcmdzAnRhBFR5cGUGc3RyaW5nBmFjdGlvbjRzdGF0dXMsIGluc3BlY3QsIHNldHdhdmUsIHJlc2V0cGxheWVyLCBvciByZXNldGNsYWltBnBsYXllcgZ0YXJnZXQqVGFyZ2V0IHBsYXllciAocmVxdWlyZWQgZXhjZXB0IGZvciBzdGF0dXMpCE9wdGlvbmFsBm51bWJlcgV2YWx1ZRBXYXZlIGZvciBzZXR3YXZlBHdlZWslVG91cm5hbWVudCB3ZWVrIChkZWZhdWx0cyB0byBjdXJyZW50KQABBgAAAQIAFKMAAADiAAgA/wEAAAEAAABvAgkAxQECAgEAAAAwAQAnAgAAAP8BAAAEAAAA4gIOAOIDFADiBBgA4gUbAMUBAgUBAAAAMAEA2wcAAACCAAIAHAMBAwIDAwMEAwUDBgMHAwgIBQABAAAAAv////8DBAAAAAUGAAAAB/////8DCQMKAwsDDAMNCAMKCwAAAAAMAAAAAw0AAAADDgMPAxADEQEBCAQKDwAAAAAQAAAAAxEAAAASEwAAAAMSAxMDFAgEChUAAAAAFgAAAAMXAAAAEhMAAAADFQMWCAQKFQAAAAAZAAAAAxoAAAASEwAAAAABAAEYAAACAAAAAAAAAwABBQYGAADuAAABAAAAAADVSnrPwnIinVKTJchSB8bQpVJtu+eOEM4=

-- https://lua.expert/
return {
	Name = "tournamentadmin",
	Description = "Inspect or manage Eclipse Championship test data.",
	Group = "Admin",
	Aliases = { "ta" },
	Args = {
		{
			Type = "string",
			Name = "action",
			Description = "status, inspect, setwave, resetplayer, or resetclaim"
		},
		{
			Type = "player",
			Name = "target",
			Description = "Target player (required except for status)",
			Optional = true
		},
		{
			Type = "number",
			Name = "value",
			Description = "Wave for setwave",
			Optional = true
		},
		{
			Type = "number",
			Name = "week",
			Description = "Tournament week (defaults to current)",
			Optional = true
		}
	}
}