-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMXOEludmFsaWQgb3IgbWlzc2luZyBudW1iZXIgYXQgcG9zaXRpb24gJWQgaW4gVmVjdG9yIHR5cGUuBmZvcm1hdA52YWxpZGF0ZVZlY3Rvcgd2ZWN0b3IzDFJlZ2lzdGVyVHlwZQh2ZWN0b3IzcxBNYWtlTGlzdGFibGVUeXBlB3ZlY3RvcjIIdmVjdG9yMnMHcmVxdWlyZQZzY3JpcHQGUGFyZW50BlNoYXJlZARVdGlsEE1ha2VTZXF1ZW5jZVR5cGUMVmFsaWRhdGVFYWNoDVRyYW5zZm9ybUVhY2gLQ29uc3RydWN0b3IGTGVuZ3RoCHRvbnVtYmVyB1ZlY3RvcjMDbmV3B1ZlY3RvcjIAAwYCAAAABwAAAQMDBQILRwAIAAAAAICpAgAAbwMAAFIFAQC8AwONAQAAAJ8DAwCCAgAAqQIBAIICAgACAwEDAgADAwEYAAABAAAAAAAAAwAEAAAAAAYBAwAAAB1vAwAA+wQAALwBAN0BAAAAnwEEAW8DAgD7BAEATQQEJAMAAAD7BQAAnwQCALwBAN0BAAAAnwEAAW8DBAD7BAIAvAEA3QEAAACfAQQBbwMFAPsEAQBNBAQkAwAAAPsFAgCfBAIAvAEA3QEAAACfAQABggABAAYDBAMFAwYDBwMIAwkAGQABGAAAAAAAAQAAAAAAAAAAAgAAAAABAAAAAAAAAAABGgAAAAAGAAABAgAwowAAAKQAAQAAAABApAEDAAAAIEBNAQEkBAAAAE0BASQEAAAATQEBEgUAAABNAQGeBgAAAJ8AAgLAAQcATQIAIwgAAADiAw4AMAEDkQkAAACkBBAAAADwQDAEA00KAAAApAQTAABIEIEwBAO3CwAAAJ8CAgJNAwAjCAAAAOIEFQAwAQSRCQAAAKQFEAAAAPBAMAUETQoAAACkBRcAAEhggTAFBLcLAAAAnwMCAsAEGAASAAIAEgAAABIAAwCCBAIAGQMKBAAAAEADCwQAACBAAwwDDQMOBgADDwMQAxEDEgMTAgAAAAAAAAhACAQJ/////wr/////C/////8MDQAAAAMUBAAA8EADFQMWBABIEIECAAAAAAAAAEAIBAn/////Cv////8L/////wwUAAAAAxcEAEhggQYBAgABAQABGAAAAAAAAAAAAAAAAAAAAggAAAEAAQAAAAEAAAD9BwAAAQABAAAAAQAAAP0HAAAAAAEAAAAAAl4zhK/ydEcHuUHWnabwrfEuK5PbbPfurg==

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)

local function validateVector(p1, p2) --[[ validateVector | Line: 3 ]]
	if p1 == nil then
		return false, ("Invalid or missing number at position %d in Vector type."):format(p2)
	end

	return true
end

local v1 = Util.MakeSequenceType({
	Length = 3,
	ValidateEach = validateVector,
	TransformEach = tonumber,
	Constructor = Vector3.new
})
local v2 = Util.MakeSequenceType({
	Length = 2,
	ValidateEach = validateVector,
	TransformEach = tonumber,
	Constructor = Vector2.new
})

return function(p1) --[[ Line: 25 | Upvalues: v1 (copy), Util (copy), v2 (copy) ]]
	p1:RegisterType("vector3", v1)
	p1:RegisterType("vector3s", Util.MakeListableType(v1))
	p1:RegisterType("vector2", v2)
	p1:RegisterType("vector2s", Util.MakeListableType(v2))
end