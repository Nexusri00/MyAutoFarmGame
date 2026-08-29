-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUIc2V0bGV2ZWwHQWxpYXNlcwtEZXNjcmlwdGlvbh5TZXQgYSBwbGF5ZXIncyBsZXZlbCBkaXJlY3RseS4FR3JvdXAFQWRtaW4EQXJncwZsdmxzZXQGc2V0bHZsBFR5cGUGcGxheWVyBnRhcmdldBdQbGF5ZXIgdG8gc2V0IGxldmVsIGZvcgZudW1iZXIFbGV2ZWwcTGV2ZWwgdG8gc2V0ICgxIHRvIExldmVsTWF4KQABBAAAAQIAE6MAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAgAAAOICDwDiAxMAxQECAwEAAAAwAQDbBwAAAIIAAgAUAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0DDggDCwwAAAAADQAAAAMOAAAAAw8DEAMRCAMLEAAAAAARAAAAAxIAAAAAAQABGAAAAgAAAAAAAAADAAEFAAD6AAABAAAAAABU5YWHp4zGu9cI+pI3XVB8JP2S82Yh74Y=

-- https://lua.expert/
return {
	Name = "setlevel",
	Description = "Set a player\'s level directly.",
	Group = "Admin",
	Aliases = { "lvlset", "setlvl" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to set level for"
		},
		{
			Type = "number",
			Name = "level",
			Description = "Level to set (1 to LevelMax)"
		}
	}
}