-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMVAm9zBHRpbWUFJSogJSoEZGF0ZQIleAIlWAZmb3JtYXQJQ2xpZW50UnVuBE5hbWUQY29udmVydFRpbWVzdGFtcAdBbGlhc2VzC0Rlc2NyaXB0aW9uL0NvbnZlcnQgYSB0aW1lc3RhbXAgdG8gYSBodW1hbi1yZWFkYWJsZSBmb3JtYXQuBUdyb3VwC0RlZmF1bHRVdGlsBEFyZ3MEVHlwZQZudW1iZXIJdGltZXN0YW1wOEEgbnVtZXJpY2FsIHJlcHJlc2VudGF0aW9uIG9mIGEgc3BlY2lmaWMgbW9tZW50IGluIHRpbWUuCE9wdGlvbmFsAAIIAgAAAAAVUgIBACsCAwCkAgIAAAQAgJ8CAQJSAQIAbwIDAKQEBQAAEACAbwUGAFIGAQCfBAMCpAUFAAAQAIBvBgcAUgcBAJ8FAwK8AgKNCAAAAJ8CBAKCAgIACQMBAwIEAAQAgAMDAwQEABAAgAMFAwYDBwAOCAEYAAAAAAAAAQAAAAAAAAAAAAAAAAAADwAAAAADAAABAgAUowAAAOIACQD/AQAAAQAAAG8CCgDFAQICAQAAADABACcCAAAA/wEAAAEAAADiAhEAxQECAgEAAAAwAQDbBwAAAMABEgAwAQAzCAAAAIIAAgATAwkDCgMLAwwDDQMOAw8DEAMICAYAAQAAAAL/////AwQAAAAFBgAAAAf/////CP////8DBAMRAxIDEwMUAxUBAQgECwwAAAAADQAAAAMOAAAADxAAAAAGAAEAAQABGAAAAgAAAAAAAAMAAQAA/wAIAAAAAQAAAAABzO6Ug7wBehkw8zh8MjSg2Lz2g/f+Kv6C

-- https://lua.expert/
return {
	Name = "convertTimestamp",
	Description = "Convert a timestamp to a human-readable format.",
	Group = "DefaultUtil",
	Aliases = { "date" },
	Args = {
		{
			Type = "number",
			Name = "timestamp",
			Description = "A numerical representation of a specific moment in time.",
			Optional = true
		}
	},
	ClientRun = function(p1, p2) --[[ ClientRun | Line: 14 ]]
		local v1 = if p2 then p2 else os.time()

		return ("%* %*"):format(os.date("%x", v1), (os.date("%X", v1)))
	end
}