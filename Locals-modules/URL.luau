-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMODV5odHRwcz86Ly8uKyQFbWF0Y2goVVJMcyBtdXN0IGJlZ2luIHdpdGggaHR0cDovLyBvciBodHRwczovLwhWYWxpZGF0ZQVQYXJzZQN1cmwMUmVnaXN0ZXJUeXBlBHVybHMQTWFrZUxpc3RhYmxlVHlwZQdyZXF1aXJlBnNjcmlwdAZQYXJlbnQGU2hhcmVkBFV0aWwABAQBAAAAAApvAwAAvAEA5wEAAACfAQMCDgECAKkBAQCCAQIAqQEAAG8CAgCCAQMAAwMBAwIDAwAEBAEYAAAAAAABAAMAAAUAAAAAAQEAAAAAAYIAAgAAAAwFARgADQAAAAAGAQIAAAAPbwMAAPsEAAC8AQDdAQAAAJ8BBAFvAwIA+wQBAE0EBCQDAAAA+wUAAJ8EAgC8AQDdAQAAAJ8BAAGCAAEABAMGAwcDCAMJABEAARgAAAAAAAEAAAAAAAAAAAESAAAAAAMAAAECABmjAAAApAABAAAAAECkAQMAAAAgQE0BASQEAAAATQEBJAQAAABNAQESBQAAAE0BAZ4GAAAAnwACAuIBCQDAAgoAMAIBdgcAAADAAgsAMAIBmwgAAADAAgwAEgABABIAAACCAgIADQMKBAAAAEADCwQAACBAAwwDDQMOAwQDBQUCBwgGAAYBBgIDAAECAQABGAAAAAAAAAAAAAAAAAAAAgEAAAgAAAUAAAABAAAAAAMa3oYHb41Zk/lo8mvYFuD8asaRcyga7AY=

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)
local t = {
	Validate = function(p1) --[[ Validate | Line: 4 ]]
		if p1:match("^https?://.+$") then
			return true
		end

		return false, "URLs must begin with http:// or https://"
	end,
	Parse = function(p1) --[[ Parse | Line: 12 ]]
		return p1
	end
}

return function(p1) --[[ Line: 17 | Upvalues: t (copy), Util (copy) ]]
	p1:RegisterType("url", t)
	p1:RegisterType("urls", Util.MakeListableType(t))
end