-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMaD01ha2VGdXp6eUZpbmRlcghHZXRUZWFtcwlUcmFuc2Zvcm0mTm8gdGVhbSB3aXRoIHRoYXQgbmFtZSBjb3VsZCBiZSBmb3VuZC4IVmFsaWRhdGUIR2V0TmFtZXMMQXV0b2NvbXBsZXRlBVBhcnNlCkdldFBsYXllcnMJVGVhbUNvbG9yBHRlYW0MUmVnaXN0ZXJUeXBlBXRlYW1zEE1ha2VMaXN0YWJsZVR5cGULdGVhbVBsYXllcnMJdGVhbUNvbG9yCnRlYW1Db2xvcnMEZ2FtZQVUZWFtcwpHZXRTZXJ2aWNlB3JlcXVpcmUGc2NyaXB0BlBhcmVudAZTaGFyZWQEVXRpbAhMaXN0YWJsZQAIBAECAAAADPsBAABNAQE9AAAAAPsCAQC8AgIxAQAAAJ8CAgCfAQACUgIBAFIDAACfAgIAggIAAAIDAQMCAAUDARgAAAAAAAAAAAIAAAAGAAAAAAQBAAAAAAgcAgAAjAMAALcDAgACAAAAqQEAAakBAQBvAgAAggEDAAEDBAALBQEYAAAAAAAAAAAMAAAAAAMBAQAAAAb7AQAATQEBxwAAAABSAgAAnwECAIIBAAABAwYADwcBGAAAAAAAABAAAAAAAgEAAAAAAhMBAACCAQIAAAATCAEYAAAUAAAAAAMBAAAAAAUTAQAAvAEBqwAAAACfAQIAggEAAAEDCQAeCAEYAAAAAAAfAAAAAAIBAAAAAAQTAQAATQEB2wAAAACCAQIAAQMKACgIARgAAAAAKQAAAAAGAQQAAAAibwMAAPsEAAC8AQDdAQAAAJ8BBAFvAwIA+wQBAE0EBCQDAAAA+wUAAJ8EAgC8AQDdAQAAAJ8BAAFvAwQA+wQCALwBAN0BAAAAnwEEAW8DBQD7BAMAvAEA3QEAAACfAQQBbwMGAPsEAQBNBAQkAwAAAPsFAwCfBAIAvAEA3QEAAACfAQABggABAAcDCwMMAw0DDgMPAxADEQAtAAEYAAAAAAABAAAAAAAAAAACAAAAAAIAAAAAAQAAAAAAAAAAAS4AAAAABgAAAQIASqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQKQCBwAAAGBATQICJAgAAABNAgIkCAAAAE0CAhIJAAAATQICngoAAACfAQIC4gIPAMADEAASAAEAEgAAADADAiELAAAAwAMRADADAnYMAAAAwAMSABIAAQAwAwKrDQAAAMADEwAwAwKbDgAAAOIDFgBNBAIhCwAAADAEAyELAAAATQQCdgwAAAAwBAN2DAAAAE0EAqsNAAAAMAQDqw0AAADABBcAMAQDmw4AAADiBA8ATQUCIQsAAAAwBQQhCwAAAE0FAnYMAAAAMAUEdgwAAABNBQKrDQAAADAFBKsNAAAAwAUYADAFBJsOAAAAwAUZABIAAgASAAEAEgADABIABACCBQIAGgMSBAAAAEADEwMUAxUEAABAQAMWBAAAYEADFwMYAxkDAwMFAwcDCAUECwwNDgYABgEGAgYDAxoBAQgFFBUAAAAL/////wz/////Df////8O/////wYEBgUGBgcAAQIDBAUGAQABGAAAAAAAAAABAAAAAAAAAAAAAAAAAgEAAAAABgAABAAAAAQAAAUCAAAAAQAAAAEAAAACAAAFAQAAAAEAAAABAAAAAgAABQAAAAAAAQAAAAAHjaaWh1gKBPUhQ+l9ZVLlAf2+gfO/YvyG

-- https://lua.expert/
local Teams = game:GetService("Teams")
local Util = require(script.Parent.Parent.Shared.Util)
local t = {
	Transform = function(p1) --[[ Transform | Line: 5 | Upvalues: Util (copy), Teams (copy) ]]
		return Util.MakeFuzzyFinder(Teams:GetTeams())(p1)
	end,
	Validate = function(p1) --[[ Validate | Line: 11 ]]
		return #p1 > 0, "No team with that name could be found."
	end,
	Autocomplete = function(p1) --[[ Autocomplete | Line: 15 | Upvalues: Util (copy) ]]
		return Util.GetNames(p1)
	end,
	Parse = function(p1) --[[ Parse | Line: 19 ]]
		return p1[1]
	end
}
local t2 = {
	Listable = true,
	Transform = t.Transform,
	Validate = t.Validate,
	Autocomplete = t.Autocomplete,
	Parse = function(p1) --[[ Parse | Line: 30 ]]
		return p1[1]:GetPlayers()
	end
}
local t3 = {
	Transform = t.Transform,
	Validate = t.Validate,
	Autocomplete = t.Autocomplete,
	Parse = function(p1) --[[ Parse | Line: 40 ]]
		return p1[1].TeamColor
	end
}

return function(p1) --[[ Line: 45 | Upvalues: t (copy), Util (copy), t2 (copy), t3 (copy) ]]
	p1:RegisterType("team", t)
	p1:RegisterType("teams", Util.MakeListableType(t))
	p1:RegisterType("teamPlayers", t2)
	p1:RegisterType("teamColor", t3)
	p1:RegisterType("teamColors", Util.MakeListableType(t3))
end