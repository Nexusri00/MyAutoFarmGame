-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbipTZXQgYSBwbGF5ZXIncyBjbGFuLiBVc2UgJ05vbmUnIHRvIHJlbW92ZS4FR3JvdXAFQWRtaW4EQXJncwZzY3JpcHQIZ2l2ZWNsYW4EVHlwZQZwbGF5ZXIGdGFyZ2V0GlBsYXllciB0byByZWNlaXZlIHRoZSBjbGFuCGNsYW5uYW1lCGNsYW5OYW1lRENsYW4gbmFtZSDigJQgYXV0b2NvbXBsZXRlcyBmcm9tIGFsbCB2YWxpZCBjbGFucyAob3IgTm9uZSB0byByZW1vdmUpAAEEAAABAgAYowAAAOIABwCkAQkAAACAQE0BAboAAAAAMAEAugAAAAD/AQAAAQAAAG8CCgDFAQICAQAAADABACcBAAAA/wEAAAIAAADiAg8A4gMTAMUBAgMBAAAAMAEA2wYAAACCAAIAFAMBAwIDAwMEAwUDBgMHCAUA/////wH/////AgMAAAAEBQAAAAb/////AwgEAACAQAMJAwoDCwMMAw0IAwsMAAAAAA0AAAACDgAAAAMOAw8DEAgDCxAAAAAAEQAAAAISAAAAAAEAARgAAAEAAAAAAAEAAAAAAAADAAEFAAD6AAABAAAAAAAxHqC3t8I/DENid+jRY41eQQa3wwPayrY=

-- https://lua.expert/
return {
	Description = "Set a player\'s clan. Use \'None\' to remove.",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "giveclan" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive the clan"
		},
		{
			Type = "clanname",
			Name = "clanName",
			Description = "Clan name \226\128\148 autocompletes from all valid clans (or None to remove)"
		}
	}
}