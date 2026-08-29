-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMEBkNvbmZpZw5GaW5kRmlyc3RDaGlsZAlNb2RlbFNpemUFVmFsdWUAAgkDAAAACAUAAAUDBwGCIysAAwCMAwEAjAQBAIIDAwBvBQAAvAMAAwEAAACfAwMCKwMDAIwEAQCMBQEAggQDAG8GAgC8BAMDAQAAAJ8EAwJSBQQADgUCAE0FBOwDAAAADgEDAJAGBQSQBwUEggYDAMYGAAAOBQYAjAcBAGAHBAAFAAAAUgYFAA4CAQAJBgYCkAcGBJAIBQSCBwMABQMBAwIDAwMEAgAAAAAAAPA/AAEAARgAAAAAAQAAAAEAAAACAAAAAQAAAAIAAAAEAQAAAAEBAAMAAAIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAAAAAEAAAAAAUQ9hW8A3hACaTlYvg3pPkA0JZIbdvnvbg==

-- https://lua.expert/
return function(p1, p2, p3) --[[ Line: 1 ]]
	if not p1 then
		return 1, 1
	end

	local Config = p1:FindFirstChild("Config")

	if not Config then
		return 1, 1
	end

	local ModelSize = Config:FindFirstChild("ModelSize")
	local v1 = if ModelSize then ModelSize.Value else ModelSize

	if p2 then
		return v1 or 1, v1 or 1
	end

	return (if v1 and v1 > 1 then if p3 then v1 * p3 else v1 else nil) or 1, v1 or 1
end