-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQD01ha2VGdXp6eUZpbmRlcgxHZXRUeXBlTmFtZXMJVHJhbnNmb3JtJk5vIHR5cGUgd2l0aCB0aGF0IG5hbWUgY291bGQgYmUgZm91bmQuCFZhbGlkYXRlDEF1dG9jb21wbGV0ZQVQYXJzZQR0eXBlDFJlZ2lzdGVyVHlwZQV0eXBlcxBNYWtlTGlzdGFibGVUeXBlB3JlcXVpcmUGc2NyaXB0BlBhcmVudAZTaGFyZWQEVXRpbAAGBAECAAAADPsBAABNAQE9AAAAAPsCAQC8AgKCAQAAAJ8CAgCfAQACUgIBAFIDAACfAgIAggIAAAIDAQMCAAUDARgAAAAAAAAAAAIAAAAGAAAAAAQBAAAAAAgcAgAAjAMAALcDAgACAAAAqQEAAakBAQBvAgAAggEDAAEDBAALBQEYAAAAAAAAAAAMAAAAAAEBAAAAAAGCAAIAAAAPBgEYABAAAAAAAgEAAAAAAhMBAACCAQIAAAATBwEYAAAUAAAAAAcBAQAAAB7iAQQA2QIAABICAAASAAAAMAIBIQAAAADAAgUAMAIBdgEAAADAAgYAMAIBqwIAAADAAgcAMAIBmwMAAABvBAgAUgUBALwCAN0JAAAAnwIEAW8ECgD7BQAATQUFJAsAAABSBgEAnwUCALwCAN0JAAAAnwIAAYIAAQAMAwMDBQMGAwcFBAABAgMGAQYCBgMDCAMJAwoDCwQAAQIDAwABGAABAAAAAAYAAAQAAAQAAAUAAAAAAQAAAAAAAAAAAQQAAAAAAgAAAQIAEaMAAACkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQEkBAAAAE0BARIFAAAATQEBngYAAACfAAICwAEHABIAAACCAQIACAMMBAAAAEADDQQAACBAAw4DDwMQBgQBBAEAARgAAAAAAAAAAAAAAAAAAAIAAAEAAAAABSiDLjG8cMM1gUspKTDedhtYmzlFGkdEMA==

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)

return function(p1) --[[ Line: 3 | Upvalues: Util (copy) ]]
	local t = {
		Transform = function(p12) --[[ Transform | Line: 5 | Upvalues: Util (ref), p1 (copy) ]]
			return Util.MakeFuzzyFinder(p1:GetTypeNames())(p12)
		end,
		Validate = function(p1) --[[ Validate | Line: 11 ]]
			return #p1 > 0, "No type with that name could be found."
		end,
		Autocomplete = function(p1) --[[ Autocomplete | Line: 15 ]]
			return p1
		end,
		Parse = function(p1) --[[ Parse | Line: 19 ]]
			return p1[1]
		end
	}

	p1:RegisterType("type", t)
	p1:RegisterType("types", Util.MakeListableType(t))
end