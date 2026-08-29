-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMPBG1hdGgFY2xhbXAFQ2xhbXAFZmxvb3IFRmxvb3IGT2Zmc2V0B0RhbXBpbmcLQW5jaG9yRGVwdGgJU3RpZmZuZXNzB0luZXJ0aWEKRWxhc3RpY2l0eQtCbGVuZFdlaWdodApVcGRhdGVSYXRlDFdpbmRTdHJlbmd0aAdHcmF2aXR5AAYFAQIAAAAJ+wMAAPsEAQA0LgAEAwQAAFICAACkAQIAAAQAgJ8BBAKCAQIAAwMBAwIEAAQAgAACAAEYAAAAAAAAAAAAAwAAAAADAgAAAAAE2QIAABIAAAASAAEAggICAAABAAEDARgAAAAAAgAAAAADAQAAAAAGuwwAA1ICAACkAQIAAAQAgJ8BAgKCAQIAAwMBAwQEAAQAgAAHBQEYAAAAAAAACAAAAAADAQEAAAAD+wIAAEMBAAKCAQIAAAAMAAEYAAAADQAAAAACAQAAAAAD2QEAABIAAACCAQIAAAEDCwYBGAAAAAwAAAAABwAAAQIAPqMAAADAAAAAwAEBAMACAgDiAwwAjAUAAIwGAQDZBAMAEgAFABIABgAwBANgAwAAADABA0sEAAAAjAUAAIwGAQDZBAMAEgAFABIABgAwBAP8BQAAAIwFAACMBgEA2QQDABIABQASAAYAMAQDgAYAAACMBQAAjAYBANkEAwASAAUAEgAGADAEAxgHAAAAjAUAAIwGAQDZBAMAEgAFABIABgAwBAOeCAAAAIwFAACMBqUA2QQDABIABQASAAYAMAQDdgkAAACMBQAAjAYKANkEAwASAAUAEgAGADAEA7oKAAAAbwUNANkEBAASAAUAMAQDJQsAAACCAwIADgYBBgIGBAMHAwgDCQMKAwsDDAMNAw4DDwUJAwQFBgcICQoLBwAAAAAK1yO8AAAAAAAAAAAFAQIEAAMBAAEYAAAGBAbxAAAAABAAAQDvAAAAABIA7gAAAAATAO0AAAAAFADsAAAAABUA6wAAAAAWAOoAAAAAFwDzAAAPAAABAAAAAAXobAgMeEbrSevF8EpPMWhTmHQfeNqoYg0=

-- https://lua.expert/
local function Clamp(p1, p2) --[[ Clamp | Line: 1 ]]
	return function(p1) --[[ Line: 2 | Upvalues: p1 (copy), p2 (copy) ]]
		return math.clamp(p1, p1, p2)
	end
end

local function Floor(p1) --[[ Floor | Line: 7 ]]
	return math.floor(p1)
end

local function Offset(p1) --[[ Offset | Line: 11 ]]
	return function(p1) --[[ Line: 12 | Upvalues: p1 (copy) ]]
		return p1 + p1
	end
end

local t = {}
local v1 = 0
local v2 = 1

function t.Damping(p1) --[[ Line: 2 | Upvalues: v1 (copy), v2 (copy) ]]
	return math.clamp(p1, v1, v2)
end
t.AnchorDepth = Floor

local v3 = 0
local v4 = 1

function t.Stiffness(p1) --[[ Line: 2 | Upvalues: v3 (copy), v4 (copy) ]]
	return math.clamp(p1, v3, v4)
end

local v5 = 0
local v6 = 1

function t.Inertia(p1) --[[ Line: 2 | Upvalues: v5 (copy), v6 (copy) ]]
	return math.clamp(p1, v5, v6)
end

local v7 = 0
local v8 = 1

function t.Elasticity(p1) --[[ Line: 2 | Upvalues: v7 (copy), v8 (copy) ]]
	return math.clamp(p1, v7, v8)
end

local v9 = 0
local v10 = 1

function t.BlendWeight(p1) --[[ Line: 2 | Upvalues: v9 (copy), v10 (copy) ]]
	return math.clamp(p1, v9, v10)
end

local v11 = 0
local v12 = 165

function t.UpdateRate(p1) --[[ Line: 2 | Upvalues: v11 (copy), v12 (copy) ]]
	return math.clamp(p1, v11, v12)
end

local v13 = 0
local v14 = 10

function t.WindStrength(p1) --[[ Line: 2 | Upvalues: v13 (copy), v14 (copy) ]]
	return math.clamp(p1, v13, v14)
end

local v15 = Vector3.new(0, -0.01, 0)

function t.Gravity(p1) --[[ Line: 12 | Upvalues: v15 (copy) ]]
	return p1 + v15
end

return t