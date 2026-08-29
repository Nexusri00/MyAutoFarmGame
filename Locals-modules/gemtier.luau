-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMSBWxvd2VyBmlwYWlycwRmaW5kBXRhYmxlBmluc2VydAlUcmFuc2Zvcm1CSW52YWxpZCB0aWVyLiBWYWxpZDogQ29tbW9uLCBSYXJlLCBFcGljLCBMZWdlbmRhcnksIE15dGhpYywgU2VjcmV0CFZhbGlkYXRlDEF1dG9jb21wbGV0ZQVQYXJzZQZDb21tb24EUmFyZQRFcGljCUxlZ2VuZGFyeQZNeXRoaWMGU2VjcmV0B2dlbXRpZXIMUmVnaXN0ZXJUeXBlAAYNAQEAAAAevAEA7wAAAACfAQIC/wIAAAAAAACkAwIAAAAQQPsEAACfAwIEUQMRALwIB+8AAAAAnwgCAlIKAQCMCwEAqQwBALwICFYDAAAAnwgFAg4IBwCeNAIFBwAAAFIJAgBSCgcApAgGAAAUQICfCAMBbgPu/wIAAICCAgIABwMBAwIEAAAQQAMDAwQDBQQAFECAAAUGARgAAAABAAEAAAAAAQAAAAAAAAAAAAEAAAAAAAD+AAUGAAAAAAQBAAAAAAgcAgAAjAMAALcDAgACAAAAqQEAAakBAQBvAgAAggEDAAEDBwAQCAEYAAAAAAAAAAARAAAAAAEBAAAAAAGCAAIAAAAUCQEYABUAAAAAAgEAAAAAAhMBAACCAQIAAAAYCgEYAAAZAAAAAAgBAAAAAB3/AQAABgAAAG8CAABvAwEAbwQCAG8FAwBvBgQAbwcFAMUBAgcBAAAAbwQGAOIFCwDZBgAAEgABADAGBSEHAAAAwAYMADAGBXYIAAAAwAYNADAGBasJAAAAwAYOADAGBZsKAAAAvAIA3Q8AAACfAgQBggABABADCwMMAw0DDgMPAxADEQMGAwgDCQMKBQQHCAkKBgEGAgYDAxIEAAECAwEAARgAAAAAAAAAAAAAAgABAAAACwAABAAABAAA7AAAGAIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGBAEEAQABGAAAAAEAAAAABYkUVaudnlGOtUeTOmT7VV/5DELfu9A/qg==

-- https://lua.expert/
return function(p1) --[[ Line: 1 ]]
	local t = { "Common", "Rare", "Epic", "Legendary", "Mythic", "Secret" }

	p1:RegisterType("gemtier", {
		Transform = function(p1) --[[ Transform | Line: 5 | Upvalues: t (copy) ]]
			local v1 = p1:lower()
			local t2 = {}

			for i, v in ipairs(t) do
				if v:lower():find(v1, 1, true) then
					table.insert(t2, v)
				end
			end

			return t2
		end,
		Validate = function(p1) --[[ Validate | Line: 16 ]]
			return #p1 > 0, "Invalid tier. Valid: Common, Rare, Epic, Legendary, Mythic, Secret"
		end,
		Autocomplete = function(p1) --[[ Autocomplete | Line: 20 ]]
			return p1
		end,
		Parse = function(p1) --[[ Parse | Line: 24 ]]
			return p1[1]
		end
	})
end