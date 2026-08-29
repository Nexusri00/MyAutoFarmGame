-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMKDEN1cnJlbnRJdGVtcwtNYXhDYXBhY2l0eQZJc0Z1bGwFZW1wdHkEdHlwZQV0YWJsZQRuZXh0Bm51bWJlcgdib29sZWFuCW5vcm1hbGl6ZQADAQAAAAAAAuIABQCCAAIABgMBAgAAAAAAAAAAAwIDAwEBCAMAAQAAAAIBAAAAAwQAAAAAEQQBGAAAEgAAAAAGAQEAAABMuygAA1ICAACkAQEAAAAAQJ8BAgLwAQcAAgAAgKQBBAAAADBAUgIAAJ8BAgJHAQYAAAAAgPsBAABNAQGtBQAAAJ8BAQCCAQAAEwEAALsoAQNSAwEApAIBAAAAAECfAgIC8AIDAAYAAABNAQBBBwAAABMCAAG7KAIDUgQCAKQDAQAAAABAnwMCAvADAwAGAAAATQIAKwgAAAATAwACuygDA1IFAwCkBAEAAAAAQJ8EAgLwBAMACQAAAE0DAFgKAAAAuygBA1IFAQCkBAEAAAAAQJ8EAgLwBAIABgAAAIwBAAC7KAIDUgUCAKQEAQAAAABAnwQCAvAEAgAGAAAAjAIAAOIECwAwAQRBBwAAADACBCsIAAAAKgMCAAEAAACpBQABqQUBADAFBFgKAAAAggQCAAwDBQQAAABAAwYDBwQAADBAAwQDCAMBAwIDCQMDBQMHCAoAFQoBGAAAAAAAAAAAAAAAAAABAAAAAAIBAAAAAAAAAAABAQAAAAAAAAAAAQEAAAAAAAAAAAEAAAAAAAAAAQAAAAAAAAABAQABAAEAAAAAAAAWAAAAAAMAAAECAAyjAAAA/wACAAAAAADiAQUAwAIGADACAK0HAAAAwAIIABIAAAAwAgCKCQAAAIIAAgAKAwECAAAAAAAAAAADAgMDAQEIAwABAAAAAgEAAAADBAAAAAYAAwQGAQMKAgABAQABGAACAAwCAAAEAAAAFQEAAAAAAqsYxw1zn78SpGsPoVWo47TbANB5mdytDA==

-- https://lua.expert/
local t = {
	empty = function() --[[ empty | Line: 17 ]]
		return {
			CurrentItems = 0,
			MaxCapacity = 0,
			IsFull = true
		}
	end
}

function t.normalize(p1) --[[ normalize | Line: 21 | Upvalues: t (copy) ]]
	if type(p1) ~= "table" or next(p1) == nil then
		return t.empty()
	end

	local v1 = p1[1]

	if type(v1) ~= "number" then
		v1 = p1.CurrentItems
	end

	local v2 = p1[2]

	if type(v2) ~= "number" then
		v2 = p1.MaxCapacity
	end

	local v3 = p1[3]

	if type(v3) ~= "boolean" then
		v3 = p1.IsFull
	end

	if type(v1) ~= "number" then
		v1 = 0
	end

	if type(v2) ~= "number" then
		v2 = 0
	end

	local t2 = {
		CurrentItems = v1,
		MaxCapacity = v2
	}

	t2.IsFull = v3 == true

	return t2
end

return t