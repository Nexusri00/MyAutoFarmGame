-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMiCU1hcEZvbGRlcgxVbmR5bmUgVHJpYWwHTWFwTmFtZQNNYXANU3Bhd25QYXJ0TmFtZQVTcGF3bgRCb3NzBlVuZHluZQlRdWVzdE5hbWUNRGVmZWF0IFVuZHluZRBSZXF1aXJlbWVudFF1ZXN0DlNvdWwgUmVzb25hbmNlDVJ1bnRpbWVGb2xkZXIMVW5keW5lVHJpYWxzCFpvbmVOYW1lCk9jZWFuIENhdmUHWm9uZVRhZwtNYXBCb3VuZGFyeQtab25lUGFkZGluZwtab25lTWF4QXhpcwlTbG90Q291bnQLU2xvdFNwYWNpbmcKU2xvdE9yaWdpbhFQbGF5ZXJTcGF3bk9mZnNldA9Cb3NzU3Bhd25PZmZzZXQNVm9pZERyb3BCZWxvdxJWb2lkUmVzY3VlQ29vbGRvd24NVGVsZXBvcnRHcmFjZQ1EZWF0aENvb2xkb3duEERlYXRoR3JhY2VXaW5kb3cNQ29vbGRvd25GaWVsZBVVbmR5bmVUcmlhbENvb2xkb3duQXQGQ0ZyYW1lA25ldwABBQAAAQIAE6MAAADiACoApAEtAACwsIKMAgAAjAMFAIwEAACfAQQCMAEAahwAAACkAS0AALCwgowCAACMAwAAjASI/58BBAIwAQDnHQAAAIIAAgAuAwEDAgMDAwQDBQMGAwcDCAMJAwoDCwMMAw0DDgMPAxADEQMSAxMHAACgQQAAoEEAAKBBAAAAAAMUAgAAAAAAAKBAAxUCAAAAAAAAGEADFgIAAAAAAHCnQAMXBwC4iEcAAAAAAAAAAAAAAAADGAMZAxoCAAAAAADAYkADGwIAAAAAAADwPwMcAgAAAAAAABRAAx0CAAAAAADAckADHgIAAAAAAAAIQAMfAyAIFgABAAAAAgMAAAAEBQAAAAYHAAAACAkAAAAKCwAAAAwNAAAADg8AAAAQEQAAABITAAAAFBUAAAAWFwAAABgZAAAAGhsAAAAc/////x3/////Hh8AAAAgIQAAACIjAAAAJCUAAAAmJwAAACgpAAAAAyEDIgQAsLCCAAEAARgAAhIAAAAAAAAAAQAAAAAAAAALAQAAAAAAnaK1r7cUth1GY9Gbg+GW3e26otuvZt+u

-- https://lua.expert/
return {
	MapFolder = "Undyne Trial",
	MapName = "Map",
	SpawnPartName = "Spawn",
	Boss = "Undyne",
	QuestName = "Defeat Undyne",
	RequirementQuest = "Soul Resonance",
	RuntimeFolder = "UndyneTrials",
	ZoneName = "Ocean Cave",
	ZoneTag = "MapBoundary",
	ZonePadding = Vector3.new(20, 20, 20),
	ZoneMaxAxis = 2048,
	SlotCount = 6,
	SlotSpacing = 3000,
	SlotOrigin = Vector3.new(70000, 0, 0),
	VoidDropBelow = 150,
	VoidRescueCooldown = 1,
	TeleportGrace = 5,
	DeathCooldown = 300,
	DeathGraceWindow = 3,
	CooldownField = "UndyneTrialCooldownAt",
	PlayerSpawnOffset = CFrame.new(0, 5, 0),
	BossSpawnOffset = CFrame.new(0, 0, -120)
}