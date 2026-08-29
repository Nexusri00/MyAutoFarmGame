-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMeBXRhYmxlBGZpbmQGaW5zZXJ0GkZpbHRlckRlc2NlbmRhbnRzSW5zdGFuY2VzBnJlbW92ZRNjcmVhdGVSYXljYXN0UGFyYW1zBW1lcmdlA2dldARnYW1lEUNvbGxlY3Rpb25TZXJ2aWNlCkdldFNlcnZpY2UHcmVxdWlyZQZzY3JpcHQGUGFyZW50CVV0aWxpdGllcwZpcGFpcnMIU3dpbVpvbmUJR2V0VGFnZ2VkBmZyZWV6ZQpGaWx0ZXJUeXBlEVJlc3BlY3RDYW5Db2xsaWRlC0lnbm9yZVdhdGVyBEVudW0RUmF5Y2FzdEZpbHRlclR5cGUHSW5jbHVkZRZHZXRJbnN0YW5jZUFkZGVkU2lnbmFsB0Nvbm5lY3QYR2V0SW5zdGFuY2VSZW1vdmVkU2lnbmFsCGluc3RhbmNlBmZpZWxkcwAEBAECAAAAE6QBAgAABACA+wIAAFIDAACfAQMCDgEBAIIAAQD7AgAAnjQCBAAAAABSAwAApAEEAAAMAICfAQMB+wEBAPsCAAAwAgF9BQAAAIIAAQAGAwEDAgQABACAAwMEAAwAgAMEABUAARgAAAAAAAAAAQAAAAAAAAEAAAABFgAAAAAFAQIAAAARpAECAAAEAID7AgAAUgMAAJ8BAwIrAQEAggABAKQCBAAADACA+wMAAFIEAQCfAgMB+wIBAPsDAAAwAwJ9BQAAAIIAAQAGAwEDAgQABACAAwUEAAwAgAMEABsAARgAAAAAAAEAAQAAAAABAAAAARwAAAAABQEDAAAGAwAABQGEDisAAgD7AQAAggECAPsBAQBNAQGYAAAAAPsCAQBNAgIfAQAAAFIDAAD7BAIAnwIDAJ8BAACCAQAAAgMGAwcAIwgBGAAAAAEAAAAAAAAAAAAAJAAAAAALAAABAABZowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBApAIHAAAAYEBNAgIkCAAAAE0CAiQIAAAATQICtQkAAACfAQIC/wIAAAAAAACkAwsAAACgQG8GDAC8BAAFDQAAAJ8EAwCfAwAEUQMNAKQIEAAAPOCAUgkCAFIKBwCfCAMCKwgHAJ40AgUHAAAAUgkCAFIKBwCkCBIAAETggJ8IAwFuA/L/AgAAgKQDFAAATOCA4gQaAKQFHgAdcLDBMAUEVxUAAAAwAgR9GQAAAJ8DAgJNBAGYHwAAAFIFAwCfBAICbwcMALwFAF4gAAAAnwUDAsAHIQASAAIAEgAEALwFBcciAAAAnwUDAW8HDAC8BQDcIwAAAJ8FAwLAByQAEgACABIABAC8BQXHIgAAAJ8FAwHiBSgAwAYpABIABAASAAEAEgADADAGBV8lAAAAMAQFFCYAAAAwAwV5JwAAAIIFAgAqAwkEAAAAQAMKAwsDDAQAAEBAAw0EAABgQAMOAw8DEAQAAKBAAxEDEgMBAwIEADzggAMDBABE4IADEwQATOCAAxQDFQEAAxYDBAgEFf////8WFwAAABgXAAAAGf////8DFwMYAxkEHXCwwQMGAxoGAAMbAxwGAQMIAx0DHgUDJSYnBgIDAAECAQABGAACAAAAAAABAAAAAAAAAAAAAAIAAQAAAAAAAAABAAAAAAABAAAAAAAA/gAGAAABAAAAAwD8BgAAAAIAAAAAAAAAAAAGAAAAAAAAAAAABwEAAAAAAAQAAQAAAQAAAAADsJmAsTt8rf9Jy9eluTkOFcCBl8WCXeqw

-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local Utilities = require(script.Parent.Parent.Utilities)
local t = {}

for i, v in ipairs(CollectionService:GetTagged("SwimZone")) do
	if not table.find(t, v) then
		table.insert(t, v)
	end
end

local v1 = table.freeze({
	RespectCanCollide = false,
	IgnoreWater = false,
	FilterType = Enum.RaycastFilterType.Include,
	FilterDescendantsInstances = t
})
local v2 = Utilities.createRaycastParams(v1)

CollectionService:GetInstanceAddedSignal("SwimZone"):Connect(function(p1) --[[ Line: 21 | Upvalues: t (copy), v2 (copy) ]]
	if not table.find(t, p1) then
		table.insert(t, p1)
		v2.FilterDescendantsInstances = t
	end
end)
CollectionService:GetInstanceRemovedSignal("SwimZone"):Connect(function(p1) --[[ Line: 27 | Upvalues: t (copy), v2 (copy) ]]
	local v1 = table.find(t, p1)

	if v1 then
		table.remove(t, v1)
		v2.FilterDescendantsInstances = t
	end
end)

return {
	get = function(p1) --[[ get | Line: 35 | Upvalues: v2 (copy), Utilities (copy), v1 (copy) ]]
		if p1 then
			return Utilities.createRaycastParams(Utilities.merge(p1, v1))
		end

		return v2
	end,
	instance = v2,
	fields = v1
}