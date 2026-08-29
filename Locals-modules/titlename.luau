-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMXCVRyYW5zZm9ybSJObyB0aXRsZSBmb3VuZCBtYXRjaGluZyB0aGF0IG5hbWUuCFZhbGlkYXRlDEF1dG9jb21wbGV0ZQVQYXJzZQVwYWlycwV0YWJsZQZpbnNlcnQEc29ydA9NYWtlRnV6enlGaW5kZXIJdGl0bGVuYW1lDFJlZ2lzdGVyVHlwZQdyZXF1aXJlBnNjcmlwdAZQYXJlbnQGU2hhcmVkBFV0aWwEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB01vZHVsZXMOQ29uZmlndXJhdGlvbnMJVGl0bGVEYXRhAAYDAQEAAAAE+wEAAFICAACfAQIAggEAAAAAEAEBGAAAAAARAAAAAAQBAAAAAAgcAgAAjAMAALcDAgACAAAAqQEAAakBAQBvAgAAggEDAAEDAgAUAwEYAAAAAAAAAAAVAAAAAAEBAAAAAAGCAAIAAAAYBAEYABkAAAAAAgEAAAAAAhMBAACCAQIAAAAcBQEYAAAdAAAAAAoBAgAAACz/AQAAAAAAAKQCAQAAAABA+wMAAJ8CAgQXAgcAnjQBBQUAAABSCAEAUgkFAKQHBAAADCCAnwcDAW4C+P8CAAAApAIGAAAUIIBSAwEAnwICAfsCAQBNAgI9BwAAAFIDAQCfAgICbwUIAOIGDQDZBwAAEgACADAHBiEJAAAAwAcOADAHBnYKAAAAwAcPADAHBqsLAAAAwAcQADAHBpsMAAAAvAMA3REAAACfAwQBggABABIDBgQAAABAAwcDCAQADCCAAwkEABQggAMKAwsDAQMDAwQDBQUECQoLDAYBBgIGAwMMBAABAgMGAAEYAAABAAAAAAEAAAAAAAD/AAMAAAACAAAAAAIAAQAAAAQAAAQAAAQAAPMAABEHAAAAAAQAAAECACGjAAAApAABAAAAAECkAQMAAAAgQE0BASQEAAAATQEBJAQAAABNAQESBQAAAE0BAZ4GAAAAnwACAqQBCAAAAHBAbwMJALwBARYKAAAAnwEDAqQCAQAAAABATQMB6AsAAABNAwO6DAAAAE0DA/sNAAAAnwICAsADDgASAAIAEgAAAIIDAgAPAw0EAAAAQAMOBAAAIEADDwMQAxEDEgQAAHBAAxMDFAMVAxYDFwYEAQQBAAEYAAAAAAAAAAAAAAAAAAABAAAAAAACAAAAAAAAAAACAAAAAQAAAAAFbOrg+ak0uTtXXejCCfyB/xzy941eLor4

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TitleData = require(ReplicatedStorage.Modules.Configurations.TitleData)

return function(p1) --[[ Line: 6 | Upvalues: TitleData (copy), Util (copy) ]]
	local t = {}

	for k, v in pairs(TitleData) do
		table.insert(t, k)
	end

	table.sort(t)

	local v1 = Util.MakeFuzzyFinder(t)

	p1:RegisterType("titlename", {
		Transform = function(p1) --[[ Transform | Line: 16 | Upvalues: v1 (copy) ]]
			return v1(p1)
		end,
		Validate = function(p1) --[[ Validate | Line: 20 ]]
			return #p1 > 0, "No title found matching that name."
		end,
		Autocomplete = function(p1) --[[ Autocomplete | Line: 24 ]]
			return p1
		end,
		Parse = function(p1) --[[ Parse | Line: 28 ]]
			return p1[1]
		end
	})
end