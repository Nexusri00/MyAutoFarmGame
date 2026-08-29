-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMVBW1lcmdlBmlwYWlycxpnZXRDaGFyYWN0ZXJzV2l0aEV4Y2x1c2lvbgV0YWJsZQZpbnNlcnQaRmlsdGVyRGVzY2VuZGFudHNJbnN0YW5jZXMTY3JlYXRlUmF5Y2FzdFBhcmFtcwNnZXQHcmVxdWlyZQZzY3JpcHQGUGFyZW50CVV0aWxpdGllcwZmcmVlemUKRmlsdGVyVHlwZRFSZXNwZWN0Q2FuQ29sbGlkZQtJZ25vcmVXYXRlcgRFbnVtEVJheWNhc3RGaWx0ZXJUeXBlB0luY2x1ZGUIaW5zdGFuY2UGZmllbGRzAAIMAgIAAAcEAAAFAoSEJvsCAABNAgIfAAAAAFIDAAArAwIA/wMAAAAAAAD7BAEAnwIDAv8DAAAAAAAADgESAKQEAgAAABBA+wUAAE0FBSkDAAAAUgYBAJ8FAgCfBAAEUQQHAJ40AwUIAAAAUgoDAFILCACkCQYAABRAgJ8JAwFuBPj/AgAAgDADAn0HAAAA+wQAAE0EBJgIAAAAUgUCAJ8EAgCCBAAACQMBAwIEAAAQQAMDAwQDBQQAFECAAwYDBwAOCAEYAAAAAAAAAAAAAQABAQAAAAAAAAAAAQAAAAAAAP8ABAABAAAAAAAPAAAAAAUAAAECACejAAAApAABAAAAAECkAQMAAAAgQE0BASQEAAAATQEBJAQAAABNAQG1BQAAAJ8AAgKkAQgAABxggOICDgCkAxIAEUDwwDADAlcJAAAA/wMAAAAAAAAwAwJ9DQAAAJ8BAgJNAgCYEwAAAFIDAQCfAgIC4gMXAMAEGAASAAAAEgABADAEA18UAAAAMAIDFBUAAAAwAQN5FgAAAIIDAgAZAwkEAAAAQAMKBAAAIEADCwMMAwQDDQQAHGCAAw4DDwEBAxADBggECf////8KCwAAAAwLAAAADf////8DEQMSAxMEEUDwwAMHAwgDFAMVBQMUFRYGAAEAAQABGAACAAAAAAAAAAAAAAIAAAEAAAADAAAA/AYAAAACAQAAAAALAAEAAAEAAAAAAaGNSqlUG7aj+iuzgB5xM1zRlV3dk0kgqA==

-- https://lua.expert/
local Utilities = require(script.Parent.Parent.Utilities)
local v1 = table.freeze({
	RespectCanCollide = true,
	IgnoreWater = true,
	FilterType = Enum.RaycastFilterType.Include,
	FilterDescendantsInstances = {}
})
local v2 = Utilities.createRaycastParams(v1)

return {
	get = function(p1, p2) --[[ get | Line: 14 | Upvalues: Utilities (copy), v1 (copy) ]]
		local v2 = Utilities.merge(if p1 then p1 else {}, v1)
		local t = {}

		if p2 then
			for i, v in ipairs(Utilities.getCharactersWithExclusion(p2)) do
				table.insert(t, v)
			end
		end

		v2.FilterDescendantsInstances = t

		return Utilities.createRaycastParams(v2)
	end,
	instance = v2,
	fields = v1
}