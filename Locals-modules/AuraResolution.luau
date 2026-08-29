-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMHBF4lcysABGdzdWIEJXMrJAR0cmltBE5vbmUXcmVzb2x2ZVZhbml0eVZpc3VhbE5hbWUAAwUBAAAABgMAAAUBAwtvAwAAbwQBALwBAMwCAAAAnwEEAm8DAwBvBAEAvAEBzAIAAACfAQQCggECAAQDAQMCAwMDBAAPBQEYAAAAAAAAAAAAAAAQAAAAAAcCAAAABwQAAAUCAwMibwQAAG8FAQC8AgDMAgAAAJ8CBAJvBAMAbwUBALwCAswCAAAAnwIEAm8FAABvBgEAvAMBzAIAAACfAwQCbwUDAG8GAQC8AwPMAgAAAJ8DBALwAwYAAQAAAPADBAAEAAAA8QMCAAIAAACCAwIA8AIEAAEAAADwAgIABAAAAIICAgBvBAEAggQCAAUDAQMCAwMDBAMGABMHARgAAAAAAAAAAAAAAAAAAAAAAAAAAAYAAAAAAAABAAAAAAEAEAAAAAADAAABAgAIowAAAP8AAQAAAAAAwAEAAMACAQAwAgAmAgAAAIIAAgADBgAGAQMHAgABAQABGAAKAAQEAAAKAQAAAAACGP0+oCtFCT6HcFxOIBQXuGjlKdQqOVSh

-- https://lua.expert/
local t = {}

local function trim(p1) --[[ trim | Line: 15 ]]
	return p1:gsub("^%s+", ""):gsub("%s+$", "")
end

function t.resolveVanityVisualName(p1, p2) --[[ resolveVanityVisualName | Line: 19 ]]
	local v1 = p1:gsub("^%s+", ""):gsub("%s+$", "")
	local v2 = p2:gsub("^%s+", ""):gsub("%s+$", "")

	if v2 ~= "" and (v2 ~= "None" and v2 ~= v1) then
		return v2
	end

	if v1 == "" or v1 == "None" then
		return ""
	end

	return v1
end

return t