-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQNAFEV4dHJhLkZpcmVGb3JjZVF1ZXN0CVNwYXduUm9vdBBGaXJlRm9yY2VDb21wYW55ElJlY3J1aXRlckF0dHJpYnV0ZQ1DYXB0YWluIEJ1cm5zDFJlY3J1aXRlck5QQwhDb21wYW55MQtEaXNwbGF5TmFtZRRGaXJlIEZvcmNlIENvbXBhbnkgMQlRdWVzdGxpbmUDQ2F0B0hvc3RhZ2UGQW1idXNoEFJlc2N1ZUR1dHlBbWJ1c2gEQm9zcwtXb3JsZEFtYnVzaBFJbnZlc3RpZ2F0ZUFtYnVzaARCdWZmFE1pc3Npb24gRmlyZSBGb3JjZSAxFE1pc3Npb24gRmlyZSBGb3JjZSAyFE1pc3Npb24gRmlyZSBGb3JjZSAzBlRhcmdldAhMb3N0IENhdAhUZW1wbGF0ZQtTcGF3bkZvbGRlcg5DYXRTcGF3blBvaW50cwpQcm9tcHRUZXh0DUNhcnJ5IHRoZSBjYXQMSW50ZXJhY3REaXN0EkZpcmUgRm9yY2UgSG9zdGFnZRJIb3N0YWdlU3Bhd25Qb2ludHMGUmVzY3VlC1Jlc2N1ZUNvdW50A05QQw9GaXJlIEZvcmNlIFRodWcLU3Bhd25SYWRpdXMFQ291bnQKU3Bhd25EZWxheQdUaW1lb3V0EUluZmVybmFsIEFtYnVzaGVyEUFtYnVzaFNwYXduUG9pbnRzEUludmVzdGlnYXRlUG9pbnRzDlpvbmVQcm9tcHRUZXh0FEludmVzdGlnYXRlIHRoZSBhcmVhCUtpbGxDb3VudA5EZW1vbiBJbmZlcm5hbA9Cb3NzU3Bhd25Qb2ludHMPUmVzcGF3bkludGVydmFsDVJlc3Bhd25DaGFuY2UMRGVzcGF3bkFmdGVyBlBvaW50cwxNYXhQZXJTZXJ2ZXIJVGltZUxpbWl0DEZhaWxDb29sZG93bhBTcGF3bkNsZWFyUmFkaXVzCkJvc3NTcGF3bjEKQm9zc1NwYXduMgpCb3NzU3Bhd24zCkJvc3NTcGF3bjUKQm9zc1NwYXduNgRUeXBlDUFiaWxpdHlEYW1hZ2UKTXVsdGlwbGllcglDb21wYW5pZXMAAQoAAAECAD+jAAAA/wADAAAAAABvAQAAMAEA5gEAAABvAQIAMAEA3gMAAABvAQQAMAEA+wUAAADiAQcA4gITAP8DAAADAAAAbwQUAG8FFQBvBhYAxQMEBAEAAAAwAwIpCgAAAOIDIAAwAwLqCwAAAOIDJgAwAwJ6DAAAAOIDMQAwAwLRDQAAAOIDNgAwAwLSDgAAAOIDPQAwAwJpDwAAAOIDRgAwAwJEEAAAAOIDTQD/BAAABQAAAG8FTgBvBk8AbwdQAG8IUQBvCVIAxQQFBgEAAAAwBAMtRwAAADADAisRAAAA4gNXADADAiMSAAAAMAIBRAYAAAAwAQCzWAAAAIIAAgBZAwEDAgMDAwQDBQMGAwcFAQYDCAMJAwoDCwMMAw0DDgMPAxADEQMSCAoICQAAAAr/////C/////8M/////w3/////Dv////8P/////xD/////Ef////8S/////wMTAxQDFQMWAxcDGAMZAxoDGwMcAx0CAAAAAAAAKEAIBRcYAAAAGRgAAAAaGwAAABwdAAAAHh8AAAADHgMfAyADIQIAAAAAAAAUQAgGFyEAAAAZIQAAABoiAAAAHCMAAAAeHwAAACQlAAAAAyIDIwMkAgAAAAAAACBAAyUCAAAAAAAAEEADJgIzMzMzMzPDPwMnAgAAAAAAgGZACAYnKAAAABoiAAAAKSoAAAArLAAAAC0uAAAALzAAAAADKAMpAgAAAAAAAPA/AgAAAAAAAF5ACAUnMgAAABozAAAAKzQAAAAtLgAAAC81AAAAAyoDKwMsAgAAAAAAAD5AAy0CAAAAAAAACEAIBScyAAAAGjcAAAA4OQAAAB46AAAAOzwAAAADLgMvAzACAAAAAAAgjEADMQIAAAAAAADgPwMyAgAAAAAAcJdACAUnPgAAABo/AAAAQEEAAABCQwAAAERFAAAAAzMDNAM1AgAAAAAAQI9AAzYDNwgHJzIAAAAaNwAAAEf/////SDwAAABJSgAAAEs6AAAATDoAAAADOAM5AzoDOwM8Az0DPgM/AjMzMzMzM/M/CAJTVAAAAFVWAAAAA0AAAQABGAAHAAUAAAMAAAQAAAIBBAAAAAAAAAAAAwAACQAADwAADQAACgAADwAADgMAAAAAAAAAAAAA/QAMAAChAP8AbAEAAAAAAMmewzDRxqSDlOb4+BbQJja5htRE+1qpMQ==

-- https://lua.expert/
return {
	SpawnRoot = "Extra.FireForceQuest",
	RecruiterAttribute = "FireForceCompany",
	RecruiterNPC = "Captain Burns",
	Companies = {
		Company1 = {
			DisplayName = "Fire Force Company 1",
			Questline = { "Mission Fire Force 1", "Mission Fire Force 2", "Mission Fire Force 3" },
			Cat = {
				Target = "Lost Cat",
				Template = "Lost Cat",
				SpawnFolder = "CatSpawnPoints",
				PromptText = "Carry the cat",
				InteractDist = 12
			},
			Hostage = {
				Target = "Fire Force Hostage",
				Template = "Fire Force Hostage",
				SpawnFolder = "HostageSpawnPoints",
				PromptText = "Rescue",
				InteractDist = 12,
				RescueCount = 5
			},
			Ambush = {
				NPC = "Fire Force Thug",
				SpawnFolder = "HostageSpawnPoints",
				SpawnRadius = 8,
				Count = 4,
				SpawnDelay = 0.15,
				Timeout = 180
			},
			RescueDutyAmbush = {
				NPC = "Infernal Ambusher",
				SpawnFolder = "AmbushSpawnPoints",
				Count = 1,
				SpawnDelay = 0.15,
				Timeout = 120
			},
			Boss = {
				NPC = "Infernal Ambusher",
				SpawnFolder = "InvestigatePoints",
				ZonePromptText = "Investigate the area",
				InteractDist = 30,
				KillCount = 3
			},
			WorldAmbush = {
				NPC = "Demon Infernal",
				SpawnFolder = "BossSpawnPoints",
				RespawnInterval = 900,
				RespawnChance = 0.5,
				DespawnAfter = 1500
			},
			InvestigateAmbush = {
				NPC = "Infernal Ambusher",
				SpawnFolder = "InvestigatePoints",
				MaxPerServer = 3,
				TimeLimit = 1000,
				FailCooldown = 30,
				SpawnClearRadius = 30,
				Points = { "BossSpawn1", "BossSpawn2", "BossSpawn3", "BossSpawn5", "BossSpawn6" }
			},
			Buff = {
				Type = "AbilityDamage",
				Multiplier = 1.2
			}
		}
	}
}