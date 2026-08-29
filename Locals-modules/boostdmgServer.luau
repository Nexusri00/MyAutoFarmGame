-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBmlwYWlycwlDaGFyYWN0ZXICX0cSU3RhdHNfSW5zdGFuY2VMaXN0ClN0YXRzQ2xhc3MPRGFtYWdlQW1wbGlmaWVyCkFkbWluQm9vc3QSU3RhY2tFeHRlcm5hbFN0YXRzBE5hbWUFdGFibGUGaW5zZXJ0F05vIHZhbGlkIHRhcmdldHMgZm91bmQuLEJvb3N0ZWQgZGFtYWdlIGJ5ICVkJSUgdW50aWwgcmVzZXQvZGVhdGg6ICVzBmNvbmNhdAIsIAZmb3JtYXQAAhEDAAAADAUAAQUDDwQCAwQ3Ajv/AwAAAAAAAKQEAQAAAABAUgUBAJ8EAgRRBCIATQkIaQIAAAAOCR8ApAoEAAAAMEBNCgqOBQAAAA4KBQCkCwQAAAAwQE0LC44FAAAAhwoLCVILCgAOCwIATQsKFAYAAAAOCxAAPgwCB+IPCQAwDA+7CAAAAG8QCgC8DQtdCwAAAJ8NBAFNDwi6DAAAAJ40AwQPAAAAUg4DAKQNDwAAONCAnw0DAW4E3f8CAACAHAQDAA0EAwAQAACAbwQRAIIEAgBvBBIAUgYCAKQHFAAATNCAUggDAG8JFQCfBwMAvAQEjRYAAACfBAAAggQAABcDAQQAAABAAwIDAwQAADBAAwQDBQIAAAAAAABZQAMGBQEIAwcDCAMJAwoDCwQAONCAAgAAAAAAAAAAAwwDDQMOBABM0IADDwMQAAIAARgAAAIAAAAAAQABAgAAAAAAAAAAAAEAAAABAgEAAAAAAAACAAAAAAAAAPUADgAAAQADAAAAAAAAAAAAAAMAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAABAAEAAAAAASCRGYplL5tTTIsG+r0GuJZQiQ7+ElVziw==

-- https://lua.expert/
return function(p1, p2, p3) --[[ Line: 2 ]]
	local t = {}

	for i, v in ipairs(p2) do
		local Character = v.Character

		if Character then
			local v1 = _G.Stats_InstanceList and _G.Stats_InstanceList[Character]
			local v2 = if v1 then v1.StatsClass else v1

			if v2 then
				v2:StackExternalStats({
					DamageAmplifier = p3 / 100
				}, "AdminBoost")
				table.insert(t, v.Name)
			end
		end
	end

	if #t == 0 then
		return "No valid targets found."
	end

	return ("Boosted damage by %d%% until reset/death: %s"):format(p3, table.concat(t, ", "))
end