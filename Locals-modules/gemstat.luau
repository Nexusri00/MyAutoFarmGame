-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMWBWxvd2VyBmlwYWlycwRmaW5kBXRhYmxlBmluc2VydAlUcmFuc2Zvcm0lTm8gZ2VtIHN0YXQgZm91bmQgbWF0Y2hpbmcgdGhhdCBuYW1lLghWYWxpZGF0ZQxBdXRvY29tcGxldGUFUGFyc2UFcGFpcnMIQWxsU3RhdHMEc29ydAdnZW1zdGF0DFJlZ2lzdGVyVHlwZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zB0dlbURhdGEABg0BAQAAAB68AQDvAAAAAJ8BAgL/AgAAAAAAAKQDAgAAABBA+wQAAJ8DAgRRAxEAvAgH7wAAAACfCAICUgoBAIwLAQCpDAEAvAgIVgMAAACfCAUCDggHAJ40AgUHAAAAUgkCAFIKBwCkCAYAABRAgJ8IAwFuA+7/AgAAgIICAgAHAwEDAgQAABBAAwMDBAMFBAAUQIAADAYBGAAAAAEAAQAAAAABAAAAAAAAAAAAAQAAAAAAAP4ABQ0AAAAABAEAAAAACBwCAACMAwAAtwMCAAIAAACpAQABqQEBAG8CAACCAQMAAQMHABcIARgAAAAAAAAAABgAAAAAAQEAAAAAAYIAAgAAABsJARgAHAAAAAACAQAAAAACEwEAAIIBAgAAAB8KARgAACAAAAAACgEBAAAAKf8BAAAAAAAApAIBAAAAAED7AwAATQMDlgIAAACfAgIEFwIHAJ40AQUFAAAAUggBAFIJBQCkBwUAABAwgJ8HAwFuAvj/AQAAAKQCBwAAGDCAUgMBAJ8CAgFvBAgA4gUNANkGAAASAAEAMAYFIQkAAADABg4AMAYFdgoAAADABg8AMAYFqwsAAADABhAAMAYFmwwAAAC8AgDdEQAAAJ8CBAGCAAEAEgMLBAAAAEADDAMEAwUEABAwgAMNBAAYMIADDgMGAwgDCQMKBQQJCgsMBgEGAgYDAw8EAAECAwQAARgAAAEAAAAAAAABAAAAAAAA/wADAAAAAgABAAAACwAABAAABAAA7AAAGAUAAAAAAwAAAQIAE6MAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAOgGAAAATQICugcAAABNAgKyCAAAAJ8BAgLAAgkAEgABAIICAgAKAxAEAAAAQAMRAxIDEwQAAEBAAxQDFQMWBgQBBAEAARgAAAAAAAAAAQAAAAAAAAAAAgAAAQAAAAAFQqbMobtmmHxehMbQJpQJRjK+29VwYqag

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GemData = require(ReplicatedStorage.Modules.Configurations.GemData)

return function(p1) --[[ Line: 4 | Upvalues: GemData (copy) ]]
	local t = {}

	for k in pairs(GemData.AllStats) do
		table.insert(t, k)
	end

	table.sort(t)
	p1:RegisterType("gemstat", {
		Transform = function(p1) --[[ Transform | Line: 12 | Upvalues: t (copy) ]]
			local v1 = p1:lower()
			local t2 = {}

			for i, v in ipairs(t) do
				if v:lower():find(v1, 1, true) then
					table.insert(t2, v)
				end
			end

			return t2
		end,
		Validate = function(p1) --[[ Validate | Line: 23 ]]
			return #p1 > 0, "No gem stat found matching that name."
		end,
		Autocomplete = function(p1) --[[ Autocomplete | Line: 27 ]]
			return p1
		end,
		Parse = function(p1) --[[ Parse | Line: 31 ]]
			return p1[1]
		end
	})
end