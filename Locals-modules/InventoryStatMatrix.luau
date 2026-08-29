-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMiDmdldFJvd3NGb3JUeXBlBmlwYWlycwxpc1Jvd1Zpc2libGUEQXVyYQhDb3NtZXRpYwAXc2hvdWxkU3VwcHJlc3NGb3JWYW5pdHkGV2VhcG9uBVN0eWxlB0FiaWxpdHkJQWNjZXNzb3J5BEl0ZW0ITWF0ZXJpYWwLRGFtYWdlQm9vc3QKU3BlZWRCb29zdA1Db21ib01vZGlmaWVyEENvb2xkb3duTW9kaWZpZXILSGVhbHRoQm9vc3QPTWVsZWVNdWx0aXBsaWVyEFdlYXBvbk11bHRpcGxpZXIPUG93ZXJNdWx0aXBsaWVyEkRlZmVuc2VQZW5ldHJhdGlvbg5Dcml0aWNhbENoYW5jZQ5Dcml0aWNhbERhbWFnZQlEb3REYW1hZ2UJTGlmZVN0ZWFsD0RhbWFnZVJlZHVjdGlvbhJDb29sZG93bk11bHRpcGxpZXINTW92ZW1lbnRTcGVlZARMdWNrD01vbmV5TXVsdGlwbGllcg5Ecm9wTXVsdGlwbGllcghRdWFudGl0eQtDcmFmdGluZ1RhZwAEAwEBAAAGAwAABQEDBvsCAACHAQIAKwECAP8BAAAAAAAAggECAAAAWAEBGAAAAAAAAFkAAAAACQIBAAAHBAAABQIDAxP7AwAAhwIDAEcCAwAAAACAqQMAAIIDAgCkAwEAAAAAQFIEAgCfAwIEUQMEAJoHAwABAAAAqQgBAIIIAgBuA/v/AgAAgKkDAACCAwIAAgMCBAAAAEAAXgMBGAAAAQAAAAEAAAAAAQAAAP8AAwBfAAAAAAUEAAAACQYAAAUEAwODgxTwAAUAAAAAAPAAAwABAAAAqQQAAIIEAgBHAgMAAAAAAPACAwACAACAqQQAAIIEAgCpBAAAmgEFAAIAAACaAgIAAwAAAKkEAAGpBAEAggQCAAMDBAMFAwYAaQcBGAAAAAAAAAEAAAAAAAEAAAAAAAAAbwAAAAATAAABAgBpowAAAP8AAwAAAAAA4gEIAP8CAAACAAAAbwMJAG8ECgDFAgMDAQAAADACAV8AAAAA/wIAAAIAAABvAwkAbwQLAMUCAwMBAAAAMAIBugEAAAD/AgAAAgAAAG8DCQBvBAwAxQIDAwEAAAAwAgH0AgAAAP8CAAABAAAAbwMNAMUCAwIBAAAAMAIBKQMAAAD/AgAAEAAAAG8DCQBvBA4AbwUPAG8GEABvBxEAbwgSAG8JEwBvChQAbwsNAG8MFQBvDRYAbw4XAG8PGABvEBkAbxEaAG8SGwDFAgMRAQAAADACAesEAAAA/wIAAA8AAABvAwkAbwQOAG8FDwBvBhAAbwcRAG8IEgBvCRMAbwoNAG8LFQBvDBYAbw0XAG8OGABvDxkAbxAaAG8RGwDFAgMQAQAAADACAcEFAAAA/wIAAAEAAABvAxwAxQIDAgEAAAAwAgHKBgAAAP8CAAACAAAAbwMcAG8EHQDFAgMDAQAAADACAS0HAAAAwAIeABIAAQAwAgDjHwAAAMACIAASAAEAMAIAUiEAAADAAiIAMAIANSMAAACCAAIAJAMIAwkDCgMLAwQDBQMMAw0FCAABAgMEBQYHAw4DDwMQAxEDEgMTAxQDFQMWAxcDGAMZAxoDGwMcAx0DHgMfAyADIQMiBgADAQYBAwMGAgMHAwABAgEAARgAAgAnAQAAAAAAAAABAAAAAAAAAAEAAAAAAAAAAQAAAAAAAAEAAQEBAQEBAQEBAQEBAQEBAQAA8AASAAEBAQEBAQEBAQEBAQEBAQAA8QARAAAAAAAAAQAAAAAAAAAFAAAABgAAAAsAAA0BAAAAAANcBs6zLs4ZGQzhOsHuc14fLB7Zx27CpLI=

-- https://lua.expert/
local t = {}
local t2 = {
	Weapon = { "DamageBoost", "SpeedBoost" },
	Style = { "DamageBoost", "ComboModifier" },
	Ability = { "DamageBoost", "CooldownModifier" },
	Accessory = { "HealthBoost" },
	Aura = {
		"DamageBoost",
		"MeleeMultiplier",
		"WeaponMultiplier",
		"PowerMultiplier",
		"DefensePenetration",
		"CriticalChance",
		"CriticalDamage",
		"DotDamage",
		"HealthBoost",
		"LifeSteal",
		"DamageReduction",
		"CooldownMultiplier",
		"MovementSpeed",
		"Luck",
		"MoneyMultiplier",
		"DropMultiplier"
	},
	Cosmetic = {
		"DamageBoost",
		"MeleeMultiplier",
		"WeaponMultiplier",
		"PowerMultiplier",
		"DefensePenetration",
		"CriticalChance",
		"CriticalDamage",
		"HealthBoost",
		"LifeSteal",
		"DamageReduction",
		"CooldownMultiplier",
		"MovementSpeed",
		"Luck",
		"MoneyMultiplier",
		"DropMultiplier"
	},
	Item = { "Quantity" },
	Material = { "Quantity", "CraftingTag" }
}

function t.getRowsForType(p1) --[[ getRowsForType | Line: 88 | Upvalues: t2 (copy) ]]
	return t2[p1] or {}
end
function t.isRowVisible(p1, p2) --[[ isRowVisible | Line: 94 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1]

	if v1 == nil then
		return false
	end

	for i, v in ipairs(v1) do
		if v == p2 then
			return true
		end
	end

	return false
end
function t.shouldSuppressForVanity(p1, p2, p3, p4) --[[ shouldSuppressForVanity | Line: 105 ]]
	if p1 ~= "Aura" and p1 ~= "Cosmetic" then
		return false
	end

	if p3 == nil or p3 == "" then
		return false
	end

	return if p2 == p3 then p3 ~= p4 else false
end

return t