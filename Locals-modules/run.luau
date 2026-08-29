-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUBENtZHIEVXRpbBBSdW5Db21tYW5kU3RyaW5nCkRpc3BhdGNoZXIDUnVuBE5hbWUDcnVuB0FsaWFzZXMIQXV0b0V4ZWMLRGVzY3JpcHRpb246UnVucyBhIGdpdmVuIGNvbW1hbmQgc3RyaW5nIChyZXBsYWNpbmcgZW1iZWRkZWQgY29tbWFuZHMpLgVHcm91cAtEZWZhdWx0VXRpbARBcmdzAT5PYWxpYXMgImRpc2NhcmR8UnVuIGEgY29tbWFuZCBhbmQgZGlzY2FyZCB0aGUgb3V0cHV0LiIgcmVwbGFjZSAke3J1biAkMX0gLiogXCJcIgRUeXBlBnN0cmluZwdDb21tYW5kGVRoZSBjb21tYW5kIHN0cmluZyB0byBydW4AAgUCAAAAAAtNAgCeAAAAAE0CAp4BAAAATQICgQIAAABNAwAKAwAAAFIEAQCfAgMAggIAAAQDAQMCAwMDBAARBQEYAAAAAAAAAAAAAAASAAAAAAMAAAECABujAAAA4gAKAP8BAAABAAAAbwILAMUBAgIBAAAAMAEAJwIAAAD/AQAAAQAAAG8CDADFAQICAQAAADABAH0DAAAA/wEAAAEAAADiAhEAxQECAgEAAAAwAQDbCAAAAMABEgAwAQAWCQAAAIIAAgATAwYDBwMIAwkDCgMLAwwDDQMOAwUIBwABAAAAAv////8D/////wQFAAAABgcAAAAI/////wn/////Aw8DEAMRAxIDEwMUCAMNDgAAAAAPAAAABBAAAAAGAAEAAQABGAAAAgAAAAAAAAEAAQAA/wAFAAEAAP8ACAAAAAEAAAAAAQstWdTUCt1TnUgD/gJh0kd7NU6gOekz1Q==

-- https://lua.expert/
return {
	Name = "run",
	Description = "Runs a given command string (replacing embedded commands).",
	Group = "DefaultUtil",
	Aliases = { ">" },
	AutoExec = { "alias \"discard|Run a command and discard the output.\" replace ${run $1} .* \\\"\\\"" },
	Args = {
		{
			Type = "string",
			Name = "Command",
			Description = "The command string to run"
		}
	},
	Run = function(p1, p2) --[[ Run | Line: 17 ]]
		return p1.Cmdr.Util.RunCommandString(p1.Dispatcher, p2)
	end
}