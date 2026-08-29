-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUCkRpc3BhdGNoZXIKR2V0SGlzdG9yeQAJQ2xpZW50UnVuBE5hbWUHaGlzdG9yeQdBbGlhc2VzCEF1dG9FeGVjC0Rlc2NyaXB0aW9uKERpc3BsYXlzIHByZXZpb3VzIGNvbW1hbmRzIGZyb20gaGlzdG9yeS4FR3JvdXALRGVmYXVsdFV0aWwEQXJnc1dhbGlhcyAiIXxEaXNwbGF5cyBwcmV2aW91cyBjb21tYW5kIGZyb20gaGlzdG9yeS4iIHJ1biAke2hpc3RvcnkgJDF7bnVtYmVyfExpbmUgTnVtYmVyfX2GAWFsaWFzICJefFJ1bnMgdGhlIHByZXZpb3VzIGNvbW1hbmQsIHJlcGxhY2luZyBhbGwgb2NjdXJyZW5jZXMgb2YgQSB3aXRoIEIuIiBydW4gJHtydW4gcmVwbGFjZSAke2hpc3RvcnkgLTF9ICQxe3N0cmluZ3xBfSAkMntzdHJpbmd8Qn19KGFsaWFzICIhIXxSZXJ1bnMgdGhlIGxhc3QgY29tbWFuZC4iICEgLTEEVHlwZQdpbnRlZ2VyC0xpbmUgTnVtYmVyNENvbW1hbmQgbGluZSBudW1iZXIgKGNhbiBiZSBuZWdhdGl2ZSB0byBnbyBmcm9tIGVuZCkAAgUCAAAAAA1NAgAKAAAAALwCAowBAAAAnwICAowDAAB9AQMAAwAAABwDAgBDAQMBhwQCAZADBAKCAwIAAwMBAwIDAwATBAEYAAAAAAACAAABAAMAABQAAAAABQAAAQIAGqMAAADiAAoA/wEAAAAAAAAwAQAnAgAAAP8BAAADAAAAbwILAG8DDABvBA0AxQECBAEAAAAwAQB9AwAAAP8BAAABAAAA4gISAMUBAgIBAAAAMAEA2wgAAADAARMAMAEAMwkAAACCAAIAFAMFAwYDBwMIAwkDCgMLAwwDDQMECAcAAQAAAAL/////A/////8EBQAAAAYHAAAACP////8J/////wMOAw8DEAMRAxIDEwMUCAMODwAAAAAQAAAABBEAAAAGAAEAAQABGAAAAgAAAAEAAQEBAAD9AAcAAQAA/wAIAAAAAQAAAAABT2IaSKxs6lURYScYdSJ7lT96DTx9pnBJ

-- https://lua.expert/
return {
	Name = "history",
	Description = "Displays previous commands from history.",
	Group = "DefaultUtil",
	Aliases = {},
	AutoExec = { "alias \"!|Displays previous command from history.\" run ${history $1{number|Line Number}}", "alias \"^|Runs the previous command, replacing all occurrences of A with B.\" run ${run replace ${history -1} $1{string|A} $2{string|B}}", "alias \"!!|Reruns the last command.\" ! -1" },
	Args = {
		{
			Type = "integer",
			Name = "Line Number",
			Description = "Command line number (can be negative to go from end)"
		}
	},
	ClientRun = function(p1, p2) --[[ ClientRun | Line: 19 ]]
		local v1 = p1.Dispatcher:GetHistory()

		if p2 <= 0 then
			p2 = #v1 + p2
		end

		return v1[p2] or ""
	end
}