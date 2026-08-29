-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMYBGdzdWIDUnVuBE5hbWUHcmVwbGFjZQdBbGlhc2VzC0Rlc2NyaXB0aW9uG1JlcGxhY2VzIHRleHQgQSB3aXRoIHRleHQgQgVHcm91cAtEZWZhdWx0VXRpbAhBdXRvRXhlYwRBcmdzAi8vfWFsaWFzICJtYXB8TWFwcyBhIENTViBpbnRvIGFub3RoZXIgQ1NWIiByZXBsYWNlICQxe3N0cmluZ3xDU1Z9IChbXixdKykgIiQye3N0cmluZ3xtYXBwZWQgdmFsdWV8VXNlICUxIHRvIGluc2VydCB0aGUgZWxlbWVudH0iYWFsaWFzICJqb2lufEpvaW5zIGEgQ1NWIHdpdGggYSBzcGVjaWZpZWQgZGVsaW1pdGVyIiByZXBsYWNlICQxe3N0cmluZ3xDU1Z9ICwgJDJ7c3RyaW5nfERlbGltaXRlcn0EVHlwZQZzdHJpbmcISGF5c3RhY2s0VGhlIHNvdXJjZSBzdHJpbmcgdXBvbiB3aGljaCB0byBwZXJmb3JtIHJlcGxhY2VtZW50LgZOZWVkbGUeVGhlIHN0cmluZyBwYXR0ZXJuIHNlYXJjaCBmb3IuC1JlcGxhY2VtZW50NVRoZSBzdHJpbmcgdG8gcmVwbGFjZSBtYXRjaGVzICglMSB0byBpbnNlcnQgbWF0Y2hlcykuB0RlZmF1bHQAAAIIBAAAAAAGUgYCAFIHAwC8BAHMAAAAAJ8EBACCBAAAAQMBAB0CARgAAAAAAAAeAAAAAAUAAAECAB+jAAAA4gAKAP8BAAACAAAAbwILAG8DDADFAQIDAQAAADABACcCAAAA/wEAAAIAAABvAg0AbwMOAMUBAgMBAAAAMAEAfQcAAAD/AQAAAwAAAOICEwDiAxYA4gQbAMUBAgQBAAAAMAEA2wgAAADAARwAMAEAFgkAAACCAAIAHQMDAwQDBQMGAwcDCAMJAwoDCwMCCAcAAQAAAAL/////AwQAAAAFBgAAAAf/////CP////8J/////wMBAwwDDQMOAw8DEAMRAxIIAw8QAAAAABEAAAADEgAAAAMTAxQIAw8QAAAAABQAAAADFQAAAAMVAxYDFwMYCAQPEAAAAAAXAAAAAxgAAAAZGgAAAAYAAQABAAEYAAACAAAAAAAAAAMAAQEAAP4ABAABBQUAAPUAEwAAAAEAAAAAAQenFUeKm+RYAg8W6JF+1693vwIzNWN/Rg==

-- https://lua.expert/
return {
	Name = "replace",
	Description = "Replaces text A with text B",
	Group = "DefaultUtil",
	Aliases = { "gsub", "//" },
	AutoExec = { "alias \"map|Maps a CSV into another CSV\" replace $1{string|CSV} ([^,]+) \"$2{string|mapped value|Use %1 to insert the element}\"", "alias \"join|Joins a CSV with a specified delimiter\" replace $1{string|CSV} , $2{string|Delimiter}" },
	Args = {
		{
			Type = "string",
			Name = "Haystack",
			Description = "The source string upon which to perform replacement."
		},
		{
			Type = "string",
			Name = "Needle",
			Description = "The string pattern search for."
		},
		{
			Type = "string",
			Name = "Replacement",
			Description = "The string to replace matches (%1 to insert matches).",
			Default = ""
		}
	},
	Run = function(p1, p2, p3, p4) --[[ Run | Line: 29 ]]
		return p2:gsub(p3, p4)
	end
}