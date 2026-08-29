-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMZBlRyYWl0cwZSYXJpdHkACVRyYW5zZm9ybSJObyB0cmFpdCBmb3VuZCBtYXRjaGluZyB0aGF0IG5hbWUuCFZhbGlkYXRlDEF1dG9jb21wbGV0ZQVQYXJzZQVwYWlycwV0YWJsZQZpbnNlcnQEc29ydA9NYWtlRnV6enlGaW5kZXIJdHJhaXRuYW1lDFJlZ2lzdGVyVHlwZQdyZXF1aXJlBnNjcmlwdAZQYXJlbnQGU2hhcmVkBFV0aWwEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB01vZHVsZXMLVHJhaXRDb25maWcABwYCAQAAACb7BAAATQQEcwAAAACHAwQADgMHAPsDAABNAwNzAAAAAIcCAwBNAgLyAQAAACsCAQBvAgIA+wUAAE0FBXMAAAAAhwQFAQ4EBwD7BAAATQQEcwAAAACHAwQBTQMD8gEAAAArAwEAbwMCAPECBgADAAAAtwICAAMAAACpBAABqQQBAIIEAgC3AAIAAQAAAKkEAAGpBAEAggQCAAMDAQMCAwMACgABGAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAQAAAAAAAAEAAAAACwAAAAADAQEAAAYDAAAFAQME+wEAAFICAACfAQIAggEAAAAAFAQBGAAAAAAVAAAAAAQBAAAABgMAAAUBBAgcAgAAjAMAALcDAgACAAAAqQEAAakBAQBvAgAAggEDAAEDBQAYBgEYAAAAAAAAAAAZAAAAAAEBAAAABgMAAAUBBAGCAAIAAAAcBwEYAB0AAAAAAgEAAAAGAwAABQEEAhMBAACCAQIAAAAgCAEYAAAhAAAAAAoBAgAAADD/AQAAAAAAAKQCAQAAAABA+wMAAE0DA3MCAAAAnwICBBcCBwCeNAEFBQAAAFIIAQBSCQUApAcFAAAQMICfBwMBbgL4/wIAAACkAgcAABgwgFIDAQDABAgAEgIAAJ8CAwH7AgEATQICPQkAAABSAwEAnwICAm8FCgDiBg8A2QcBABIAAgAwBwYhCwAAAMAHEAAwBwZ2DAAAAMAHEQAwBwarDQAAAMAHEgAwBwabDgAAALwDAN0TAAAAnwMEAYIAAQAUAwkEAAAAQAMBAwoDCwQAEDCAAwwEABgwgAYAAw0DDgMEAwYDBwMIBQQLDA0OBgIGAwYEAw8FAAECAwQFAAEYAAABAAAAAAAAAQAAAAAAAP8AAwAAAAAABwAAAAACAAEAAAAEAAAEAAAEAADzAAARBgAAAAAEAAABAgAfowAAAKQAAQAAAABApAEDAAAAIEBNAQEkBAAAAE0BASQEAAAATQEBEgUAAABNAQGeBgAAAJ8AAgKkAQgAAABwQG8DCQC8AQEWCgAAAJ8BAwKkAgEAAAAAQE0DAegLAAAATQMDHAwAAACfAgICwAMNABIAAgASAAAAggMCAA4DEAQAAABAAxEEAAAgQAMSAxMDFAMVBAAAcEADFgMXAxgDGQYFAQUBAAEYAAAAAAAAAAAAAAAAAAABAAAAAAABAAAAAAAAAgAAAAEAAAAABqrk3P3sGIjOgu+Wx0MkrpPa/MuJmCC2/A==

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TraitConfig = require(ReplicatedStorage.Modules.TraitConfig)

return function(p1) --[[ Line: 5 | Upvalues: TraitConfig (copy), Util (copy) ]]
	local t = {}

	for k, v in pairs(TraitConfig.Traits) do
		table.insert(t, k)
	end

	table.sort(t, function(p1, p2) --[[ Line: 10 | Upvalues: TraitConfig (ref) ]]
		local v1 = TraitConfig.Traits[p1] and TraitConfig.Traits[p1].Rarity or ""
		local v2 = TraitConfig.Traits[p2] and TraitConfig.Traits[p2].Rarity or ""

		if v1 == v2 then
			return p1 < p2
		end

		return v1 < v2
	end)

	local v1 = Util.MakeFuzzyFinder(t)

	p1:RegisterType("traitname", {
		Transform = function(p1) --[[ Transform | Line: 20 | Upvalues: v1 (copy) ]]
			return v1(p1)
		end,
		Validate = function(p1) --[[ Validate | Line: 24 ]]
			return #p1 > 0, "No trait found matching that name."
		end,
		Autocomplete = function(p1) --[[ Autocomplete | Line: 28 ]]
			return p1
		end,
		Parse = function(p1) --[[ Parse | Line: 32 ]]
			return p1[1]
		end
	})
end