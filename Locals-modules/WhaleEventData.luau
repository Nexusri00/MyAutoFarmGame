-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMbCkZpcnN0RGVsYXkIRHVyYXRpb24ISW50ZXJ2YWwKWm9uZVJhZGl1cw1JbmRpY2F0b3JJY29uC1NwYXduU291bmRzCUx1Y2tCb251cxJHdWFyYW50ZWVkRmlzaERyb3AOTHVja0JvbnVzQnlSb2QRUHJvZ3Jlc3NHYWluQm9udXMFRHJvcHMBMQEyATMJQmFzaWMgUm9kB0Vzc2VuY2UFQ2hlc3QHTGFudGVybgNSb2QESXRlbQ1XaGFsZSBFc3NlbmNlA01pbgNNYXgUV2hhbGUgQmxlc3NpbmcgQ2hlc3QGQ2hhbmNlDFdoYWxlIExhdGVybgtBbmdlbGljIFJvZAABBQAAAQIAIqMAAADiABIA/wEAAAMAAABvAhMAbwMUAG8EFQDFAQIEAQAAADABAHoJAAAA/wEBAAAAAABvAhAAMAIBCBYAAAAwAQAUDgAAAOIBGwDiAiIAMAIBNBcAAADiAiYAMAIBmBgAAADiAikAMAIBxBkAAADiAiwAMAIBxBoAAAAwAQBTEQAAAIIAAgAtAwECAAAAAAAgnEADAgIAAAAAAMCCQAMDAwQCAAAAAABAb0ADBQLAbtvr59faQgMGAwcCAAAAAAAAAEADCAEBAwkDCgIAAAAAAADgPwMLCAsAAQAAAAIDAAAABAEAAAAFBgAAAAcIAAAACf////8KCwAAAAwNAAAADv////8PEAAAABH/////AwwDDQMOAw8DEAMRAxIDEwUEFxgZGgMUAxUDFgIAAAAAAADwPwMXAgAAAAAAAAhACAMcHQAAAB4fAAAAICEAAAADGAMZAqRwPQrXo7A/CAIcIwAAACQlAAAAAxoCexSuR+F6hD8IAhwnAAAAJCgAAAADGwL8qfHSTWJQPwgCHCoAAAAkKwAAAAABAAEYAAgZAAAAAAAAAAASAAEAAP8ADwEAAAEAAAEAAAEAAPwAAAEAAAAAAC+gGZmGu/yfw7D5qZMPD5ZfuA7tHWRzmA==

-- https://lua.expert/
return {
	FirstDelay = 1800,
	Duration = 600,
	Interval = 1800,
	ZoneRadius = 250,
	IndicatorIcon = 118058445139387,
	LuckBonus = 2,
	GuaranteedFishDrop = true,
	ProgressGainBonus = 0.5,
	SpawnSounds = { "1", "2", "3" },
	LuckBonusByRod = {
		["Basic Rod"] = 0.5
	},
	Drops = {
		Essence = {
			Item = "Whale Essence",
			Min = 1,
			Max = 3
		},
		Chest = {
			Item = "Whale Blessing Chest",
			Chance = 0.065
		},
		Lantern = {
			Item = "Whale Latern",
			Chance = 0.01
		},
		Rod = {
			Item = "Angelic Rod",
			Chance = 0.001
		}
	}
}