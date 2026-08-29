-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTAAEsBXNwbGl0A1J1bgROYW1lBHBpY2sHQWxpYXNlcwtEZXNjcmlwdGlvbixQaWNrcyBhIHZhbHVlIG91dCBvZiBhIGNvbW1hLXNlcGFyYXRlZCBsaXN0LgVHcm91cAtEZWZhdWx0VXRpbARBcmdzBFR5cGUHaW50ZWdlcg1JbmRleCB0byBwaWNrJlRoZSBpbmRleCBvZiB0aGUgaXRlbSB5b3Ugd2FudCB0byBwaWNrBnN0cmluZwNDU1YYVGhlIGNvbW1hLXNlcGFyYXRlZCBsaXN0AAIIAwAAAAAHbwcBALwFAuMCAAAAnwUDAocEBQGQAwQAggMCAAMDAQMCAwMAEwQBGAAAAAAAAAAUAAAAAAQAAAECABKjAAAA4gAJAP8BAAAAAAAAMAEAJwIAAAD/AQAAAgAAAOICDgDiAxIAxQECAwEAAAAwAQDbBwAAAMABEwAwAQAWCAAAAIIAAgAUAwUDBgMHAwgDCQMKAwsDDAMECAYAAQAAAAL/////AwQAAAAFBgAAAAf/////CP////8DDQMOAw8DEAgDCgsAAAAADAAAAAMNAAAAAxEDEgMTCAMKDwAAAAAQAAAAAxEAAAAGAAEAAQABGAAAAgAAAAMAAQUAAPoADQAAAAEAAAAAAXlqJvqbLypvVKhDAFA0ms4JcjGOS65M+w==

-- https://lua.expert/
return {
	Name = "pick",
	Description = "Picks a value out of a comma-separated list.",
	Group = "DefaultUtil",
	Aliases = {},
	Args = {
		{
			Type = "integer",
			Name = "Index to pick",
			Description = "The index of the item you want to pick"
		},
		{
			Type = "string",
			Name = "CSV",
			Description = "The comma-separated list"
		}
	},
	Run = function(p1, p2, p3) --[[ Run | Line: 19 ]]
		return p3:split(",")[p2] or ""
	end
}