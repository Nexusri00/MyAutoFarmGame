-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBHR5cGUGc3RyaW5nBkxldmVscwZOb3JtYWwHcmVzb2x2ZQNnZXQGTWVkaXVtBEhhcmQHRXh0cmVtZQVPcmRlcg5Db3N0TXVsdGlwbGllchBIZWFsdGhNdWx0aXBsaWVyEERhbWFnZU11bHRpcGxpZXIURHJvcENoYW5jZU11bHRpcGxpZXIPTW9uZXlNdWx0aXBsaWVyDUV4cE11bHRpcGxpZXIAAwMBAQAAAA+7KAADUgIAAKQBAQAAAABAnwECAvABBwACAACA+wIAAE0CAukDAAAAhwECAA4BAQCCAAIAbwEEAIIBAgAFAwEEAAAAQAMCAwMDBAAeBQEYAAAAAAAAAAAAAAAAAQIAHwAAAAAFAQEAAAAK+wIAAE0CAukAAAAA+wMAAE0DAx0BAAAAUgQAAJ8DAgKHAQIDggECAAIDAwMFACUGARgAAAAAAAAAAAAAJgAAAAAGAAABAgAlowAAAP8AAwAAAAAA/wEAAAQAAABvAgAAbwMBAG8EAgBvBQMAxQECBQEAAAAwAQBkBAAAAOIBBQDiAg0AMAIBEAAAAADiAhEAMAIBfwEAAADiAhUAMAIBYAIAAADiAhkAMAIBNQMAAAAwAQDpGgAAAMABGwASAAAAMAEAHRwAAADAAR0AEgAAADABAF8eAAAAggACAB8DBAMHAwgDCQMKBQQAAQIDAwsCAAAAAAAA8D8DDAMNAw4DDwMQCAYGBwAAAAgHAAAACQcAAAAKBwAAAAsHAAAADAcAAAACzczMzMzM9D8CAAAAAAAA+D8CMzMzMzMz8z8IBgYOAAAACA8AAAAJEAAAAAoQAAAACxAAAAAMEAAAAAIzMzMzMzP7PwIAAAAAAAACQAIzMzMzMzP3PwgGBhIAAAAIEwAAAAkUAAAACg8AAAALDwAAAAwPAAAAAgAAAAAAAARAAgAAAAAAAAxAAgAAAAAAAPw/CAYGFgAAAAgXAAAACRgAAAAKGAAAAAsYAAAADBgAAAADAwYAAwUGAQMGAgABAQABGAALAAoAAAAAAAAAAAABAQAAAQAAAQAAAQAA/AAHAAAABwAAAAQBAAAAAAKLJ4DYkurQkYhYnFgiAv/3+z+XrLnj6tk=

-- https://lua.expert/
local t = {
	Order = { "Normal", "Medium", "Hard", "Extreme" },
	Levels = {
		Normal = {
			CostMultiplier = 1,
			HealthMultiplier = 1,
			DamageMultiplier = 1,
			DropChanceMultiplier = 1,
			MoneyMultiplier = 1,
			ExpMultiplier = 1
		},
		Medium = {
			CostMultiplier = 1.3,
			HealthMultiplier = 1.5,
			DamageMultiplier = 1.2,
			DropChanceMultiplier = 1.2,
			MoneyMultiplier = 1.2,
			ExpMultiplier = 1.2
		},
		Hard = {
			CostMultiplier = 1.7,
			HealthMultiplier = 2.25,
			DamageMultiplier = 1.45,
			DropChanceMultiplier = 1.5,
			MoneyMultiplier = 1.5,
			ExpMultiplier = 1.5
		},
		Extreme = {
			CostMultiplier = 2.5,
			HealthMultiplier = 3.5,
			DamageMultiplier = 1.75,
			DropChanceMultiplier = 1.75,
			MoneyMultiplier = 1.75,
			ExpMultiplier = 1.75
		}
	}
}

function t.resolve(p1) --[[ resolve | Line: 30 | Upvalues: t (copy) ]]
	if type(p1) == "string" and t.Levels[p1] then
		return p1
	end

	return "Normal"
end
function t.get(p1) --[[ get | Line: 37 | Upvalues: t (copy) ]]
	return t.Levels[t.resolve(p1)]
end

return t