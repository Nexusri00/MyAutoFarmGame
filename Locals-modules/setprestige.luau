-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUBE5hbWULc2V0cHJlc3RpZ2UHQWxpYXNlcwtEZXNjcmlwdGlvblRTZXQgYSBwbGF5ZXIncyBwcmVzdGlnZSByYW5rIGRpcmVjdGx5LiBVc2FnZTogc2V0cHJlc3RpZ2UgPHBsYXllcj4gPHJhbms+IFtkaXZpc2lvbl0FR3JvdXAFQWRtaW4EQXJncwdzZXRyYW5rC3ByZXN0aWdlc2V0BFR5cGUGcGxheWVyBnRhcmdldBpQbGF5ZXIgdG8gc2V0IHByZXN0aWdlIGZvcgZzdHJpbmcEcmFua3RSYW5rIG5hbWUgKElyb24vQnJvbnplL1NpbHZlci9Hb2xkL1BsYXRpbnVtL0VtZXJhbGQvRGlhbW9uZC9NYXN0ZXIvR3JhbmRtYXN0ZXIvQ2hhbGxlbmdlcikgb3IgcHJlc3RpZ2UgbnVtYmVyICgwLTQwKQhkaXZpc2lvbj9EaXZpc2lvbiAoSVYvSUlJL0lJL0kpIOKAlCBkZWZhdWx0cyB0byBJViAobG93ZXN0IGluIHRoYXQgcmFuaykIT3B0aW9uYWwAAQUAAAECABSjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAMAAADiAg8A4gMTAOIEGADFAQIEAQAAADABANsHAAAAggACABkDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAADDwMQAxEIAwsQAAAAABEAAAADEgAAAAMSAxMDFAEBCAQLEAAAAAAUAAAAAxUAAAAWFwAAAAABAAEYAAACAAAAAAAAAAMAAQUFAAD1AAABAAAAAADHsuibP584oy63zDZqIXlBt6r/7/V2gpo=

-- https://lua.expert/
return {
	Name = "setprestige",
	Description = "Set a player\'s prestige rank directly. Usage: setprestige <player> <rank> [division]",
	Group = "Admin",
	Aliases = { "setrank", "prestigeset" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set prestige for"
		},
		{
			Type = "string",
			Name = "rank",
			Description = "Rank name (Iron/Bronze/Silver/Gold/Platinum/Emerald/Diamond/Master/Grandmaster/Challenger) or prestige number (0-40)"
		},
		{
			Type = "string",
			Name = "division",
			Description = "Division (IV/III/II/I) \226\128\148 defaults to IV (lowest in that rank)",
			Optional = true
		}
	}
}