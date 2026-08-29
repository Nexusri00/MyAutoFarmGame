-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMhD01ha2VGdXp6eUZpbmRlcgpHZXRQbGF5ZXJzCVRyYW5zZm9ybShObyBwbGF5ZXIgd2l0aCB0aGF0IG5hbWUgY291bGQgYmUgZm91bmQuCFZhbGlkYXRlCEdldE5hbWVzDEF1dG9jb21wbGV0ZQVQYXJzZQROYW1lB0RlZmF1bHQGcGxheWVyDFJlZ2lzdGVyVHlwZQdwbGF5ZXJzEE1ha2VMaXN0YWJsZVR5cGUIUHJlZml4ZXMNJSB0ZWFtUGxheWVycwdyZXF1aXJlBnNjcmlwdAZQYXJlbnQGU2hhcmVkBFV0aWwEZ2FtZQdQbGF5ZXJzCkdldFNlcnZpY2UXQXJndW1lbnRPcGVyYXRvckFsaWFzZXMCbWUBLgNhbGwBKgZvdGhlcnMCKioGcmFuZG9tAT8ABwQBAgAAAAz7AQAATQEBPQAAAAD7AgEAvAICqwEAAACfAgIAnwEAAlICAQBSAwAAnwICAIICAAACAwEDAgAFAwEYAAAAAAAAAAACAAAABgAAAAAEAQAAAAAIHAIAAIwDAAC3AwIAAgAAAKkBAAGpAQEAbwIAAIIBAwABAwQACwUBGAAAAAAAAAAADAAAAAADAQEAAAAG+wEAAE0BAccAAAAAUgIAAJ8BAgCCAQAAAQMGAA8HARgAAAAAAAAQAAAAAAIBAAAAAAITAQAAggECAAAAEwgBGAAAFAAAAAACAQAAAAADTQEAugAAAACCAQIAAQMJABcKARgAAAAYAAAAAAcBAgAAABBvAwAA+wQAALwBAN0BAAAAnwEEAW8DAgD7BAEATQQEJAMAAAD7BQAA4gYGAJ8EAwC8AQDdAQAAAJ8BAAGCAAEABwMLAwwDDQMOAw8DEAgBBAUAAAAAIwABGAAAAAAAAQAAAAAAAAAAAAMkAAAAAAQAAAECAC6jAAAApAABAAAAAECkAQMAAAAgQE0BASQEAAAATQEBJAQAAABNAQESBQAAAE0BAZ4GAAAAnwACAqQBCAAAAHBAbwMJALwBARYKAAAAnwEDAuICEQDAAxIAEgAAABIAAQAwAwIhCwAAAMADEwAwAwJ2DAAAAMADFAASAAAAMAMCqw0AAADAAxUAMAMCmw4AAADAAxYAMAMCOg8AAADiAx8AMAMCaRAAAADAAyAAEgACABIAAACCAwIAIQMRBAAAAEADEgQAACBAAxMDFAMVAxYEAABwQAMXAxgDAwMFAwcDCAMKAxkFBgsMDQ4PEAYABgEGAgYDBgQDGgMbAxwDHQMeAx8DIAMhCAQXGAAAABkaAAAAGxwAAAAdHgAAAAYFBgABAgMEBQEAARgAAAAAAAAAAAAAAAAAAAEAAAAAAAIBAAAAAAYAAAQAAAAEAAAEAAAEAAAIAAAAAQAAAAAGcTi96vLLRMej/bhM9m+kMQEgqp5D/Nfr

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)
local Players = game:GetService("Players")
local t = {
	Transform = function(p1) --[[ Transform | Line: 5 | Upvalues: Util (copy), Players (copy) ]]
		return Util.MakeFuzzyFinder(Players:GetPlayers())(p1)
	end,
	Validate = function(p1) --[[ Validate | Line: 11 ]]
		return #p1 > 0, "No player with that name could be found."
	end,
	Autocomplete = function(p1) --[[ Autocomplete | Line: 15 | Upvalues: Util (copy) ]]
		return Util.GetNames(p1)
	end,
	Parse = function(p1) --[[ Parse | Line: 19 ]]
		return p1[1]
	end,
	Default = function(p1) --[[ Default | Line: 23 ]]
		return p1.Name
	end,
	ArgumentOperatorAliases = {
		me = ".",
		all = "*",
		others = "**",
		random = "?"
	}
}

return function(p1) --[[ Line: 35 | Upvalues: t (copy), Util (copy) ]]
	p1:RegisterType("player", t)
	p1:RegisterType("players", Util.MakeListableType(t, {
		Prefixes = "% teamPlayers"
	}))
end