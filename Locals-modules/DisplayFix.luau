-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMPBnN0cmluZwRmaW5kBkJ1dHRvbgNzdWIBWwFdDUdldERpc3BsYXlGaXgFW+KGkl0JRFBhZFJpZ2h0BVvihpFdBkRQYWRVcAVb4oaTXQhEUGFkRG93bgVb4oaQXQhEUGFkTGVmdAACBgEBAAAGAwAABQEDGCsAAQCCAAEA+wIAAIcBAgAOAQMA+wIAAIcBAgCCAQIApAECAAAEAIBSAgAAbwMDAJ8BAwIOAQkAjAP//7wBAPAEAAAAnwEDAm8DBQBSBAEAbwUGAHMCAwWCAgIAggACAAcDAQMCBAAEAIADAwMEAwUDBgAIBwEYAAACAAABAAADAAAAAAABAAAAAQAAAAACCQAAAAACAAABAgAWowAAAP8AAwAAAAAAbwEAADABAI4BAAAAbwECADABAPgDAAAAbwEEADABAP0FAAAAbwEGADABADkHAAAAwAEIABIAAAAYAQBLCQAAADUBAEsJAAAAggECAAoDCAMJAwoDCwMMAw0DDgMPBgADBwEAAQABGAAAAAEAAAEAAAEAAAEAAAMAAAAPAAABAAAAAAGTMOc/ZczVw63BHYhahjM34yjwS6H0jT4=

-- https://lua.expert/
local t = {
	DPadRight = "[\226\134\146]",
	DPadUp = "[\226\134\145]",
	DPadDown = "[\226\134\147]",
	DPadLeft = "[\226\134\144]"
}

function GetDisplayFix(p1) --[[ GetDisplayFix | Line: 8 | Upvalues: t (copy) ]]
	if not p1 then
		return
	end

	if t[p1] then
		return t[p1]
	end

	if string.find(p1, "Button") then
		return "[" .. p1:sub(-1) .. "]"
	end

	return p1
end

return GetDisplayFix