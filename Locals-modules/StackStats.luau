-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMHBXBhaXJzBnR5cGVvZgZudW1iZXIFdGFibGUEZmluZAZpbnNlcnQKU3RhY2tTdGF0cwACEAMAAAAIBQAABQMEBAE6pAMBAAAAAEBSBAEAnwMCBBcDMgCHCAAGKwgBACsCLwC7LAcDUgkHAKQIAwAAACBAnwgCAvAICQAEAACAhwgABisIAgCMCAAAaggABocIAAZDCAgHaggABmUAIAC7LAcDUgkHAKQIAwAAACBAnwgCAvAIGgAFAACAhwgABisIAwD/CAAAAAAAAGoIAAakCAEAAAAAQFIJBwCfCAIEFwgNAKQNBwAAGFCAhw4ABlIPDACfDQMCKw0HAIcOAAaeNA4EDAAAAFIPDACkDQkAACBQgJ8NAwFuCPL/AgAAAG4Dzf8CAAAAggABAAoDAQQAAABAAwIEAAAgQAMDAwQDBQQAGFCAAwYEACBQgAABBwEYAAAAAAABAAABAAAAAAAAAQAAAAEAAAABAAAAAAAAAQAAAAABAAAAAAEAAAAAAAEAAAAAAAD+APkADgIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAAAEQEAAAAAAY2nHXFgpnHXmyFeq1X4w4n9vwoFv2N3cA==

-- https://lua.expert/
return function(p1, p2, p3) --[[ StackStats | Line: 1 ]]
	for k, v in pairs(p2) do
		if p1[k] or not p3 then
			if typeof(v) == "number" then
				if not p1[k] then
					p1[k] = 0
				end

				p1[k] = p1[k] + v

				continue
			end

			if typeof(v) == "table" then
				if not p1[k] then
					p1[k] = {}
				end

				for k2, v2 in pairs(v) do
					if not table.find(p1[k], v2) then
						table.insert(p1[k], v2)
					end
				end
			end
		end
	end
end