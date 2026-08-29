-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMcB2FkZFN0YXQKYWRkRWxlbWVudAVTdGF0cw1FbGVtZW50RGFtYWdlC0RvZGdlQ2hhbmNlEUNvbnRyYWN0Q2hhcmdlQ2FwBXBhaXJzBVRyZWVzBU5vZGVzB0VmZmVjdHMETGluZQZpcGFpcnMNQ29vbGRvd25IYXN0ZQVWYWx1ZRJDb29sZG93bk11bHRpcGxpZXIHRWxlbWVudBBFbGVtZW50RGFtYWdlSHViCUFnZ3JlZ2F0ZQ1WSVJUVUFMX1NUQVRTDkRyb3BNdWx0aXBsaWVyDEJBTk5FRF9TVEFUUwVMaWdodAREYXJrBEZpcmUFV2F0ZXIGTmF0dXJlBUVhcnRoBU1ldGFsAAQGAwAAAAgFAAAFAwQDAgWHBQABkAQFAEMDBAJqAwABggABAAECAAAAAAAAAAAAPgEBGAAAAAABPwAAAAAGAwAAAAgFAAAFAwQDAgWHBQABkAQFAEMDBAJqAwABggABAAECAAAAAAAAAAAAQgIBGAAAAAABQwAAAAAgAgEAAAcEAAAFAgQPggHiAgUA/wMAAAAAAAAwAwIhAAAAAP8DAAAAAAAAMAMC1gEAAACkAwcAAABgQFIEAACfAwIEFwNxAE0IAfEIAAAADggDAE0JAfEIAAAAhwgJBlIJCAAOCQIATQkIPAkAAAAOCWYApAoHAAAAYEBSCwcAnwoCBBcKXwCHDwkNUhAPAA4QCABNEAGXCgAAAA4QBQBNEQGXCgAAAE0SD+kLAAAAhxAREg4PUwAOEFIApBENAAAAwEBNEhAhAAAAAJ8RAgRREUoA8BUOAA4AAIBNFgIhAAAAAE0ZD+wQAAAAORgZAD4XGA9NGhY0EQAAAJAZGgNDGBkXMBgWNBEAAABlADsA8BUMAAEAAIBNFgLWAQAAAE0XEJcSAAAATRgP7BAAAACHGxYXkBobA0MZGhhqGRYXZQAuAPAVEQATAACApBYNAAAAwED7FwAAnxYCBFEWCABNGwLWAQAAAE0cD+wQAAAAhx8bGpAeHwNDHR4cah0bGm4W9/8CAACAZQAcAPAVCQACAACATRYCrgIAAABNFw/sEAAAAEMWFhcwFgKuAgAAAGUAEgDwFQkABAAAgE0WAhoEAAAATRcP7BAAAABDFhYXMBYCGgQAAABlAAgATRYCIQAAAABNFw/sEAAAAIcaFhWQGRoDQxgZF2oYFhVuEbX/AgAAgG4KoP8BAAAAbgOO/wIAAACCAgIAFAMDAwQDBQIAAAAAAAAAAAMGCAQA/////wH/////AgMAAAAEAwAAAAMHBAAAYEADCAMJAwoDCwMMBAAAwEADDQIAAAAAAABZQAMOAw8DEAMRAEgSARgKAAAAAAAAAAACAAAAAAEAAAAAAAEAAAABAQAAAAABAQAAAAAAAAAAAAEAAQAAAAAAAQABAAAAAADqAAAAAAAAFwABAAAAAADsAAAAABUAAQAAAAABAAAA6QAAABYAAAMAAQAAAAAAAAABAAEAAAAAAAAAAgAAAN4AAAAUAPwA/AAePwAAAAAJAAABAgAbowAAAP8AAwAAAAAA4gEGADABAJIHAAAA4gEJADABACMKAAAA/wEAAAcAAABvAgsAbwMMAG8EDQBvBQ4AbwYPAG8HEABvCBEAxQECCAEAAADAAhIAwAMTAMAEFAASAAEAMAQA5hUAAACCAAIAFgMNAQEDBAMRAwUDBggFAAEAAAACAQAAAAMBAAAABAEAAAAFAQAAAAMTAxQIAQgBAAAAAxUDFgMXAxgDGQMaAxsDHAYABgEGAgMSAwABAgEAARgADwAPAAALAAAJAAAAAAAAAAAAAAsEBgAAACQBAAAAAAOdk/qV20GyTuk0cX2jLtjq7Yvt4a9XkJQ=

-- https://lua.expert/
local t = {
	VIRTUAL_STATS = {
		CooldownHaste = true,
		ElementDamage = true,
		ElementDamageHub = true,
		DodgeChance = true,
		ContractChargeCap = true
	},
	BANNED_STATS = {
		DropMultiplier = true
	}
}
local t2 = { "Light", "Dark", "Fire", "Water", "Nature", "Earth", "Metal" }

local function addStat(p1, p2, p3) --[[ addStat | Line: 62 ]]
	p1[p2] = (p1[p2] or 0) + p3
end

local function addElement(p1, p2, p3) --[[ addElement | Line: 66 ]]
	p1[p2] = (p1[p2] or 0) + p3
end

function t.Aggregate(p1, p2) --[[ Aggregate | Line: 72 | Upvalues: t2 (copy) ]]
	local t = {
		DodgeChance = 0,
		ContractChargeCap = 0,
		Stats = {},
		ElementDamage = {}
	}

	for k, v in pairs(p1) do
		local v1 = p2.Trees and p2.Trees[k]
		local v2 = if v1 then v1.Nodes else v1

		if v2 then
			for k2 in pairs(v) do
				local v3 = v2[k2]
				local v4 = if v3 then p2.Effects and p2.Effects[v3.Line] else v3

				if v3 and v4 then
					for i, v5 in ipairs(v4.Stats) do
						if v5 == "CooldownHaste" then
							local Stats = t.Stats

							Stats.CooldownMultiplier = (Stats.CooldownMultiplier or 0) + -v3.Value / 100

							continue
						end

						if v5 == "ElementDamage" then
							local ElementDamage = t.ElementDamage
							local Element = v4.Element

							ElementDamage[Element] = (ElementDamage[Element] or 0) + v3.Value

							continue
						end

						if v5 == "ElementDamageHub" then
							for i2, v6 in ipairs(t2) do
								local ElementDamage = t.ElementDamage

								ElementDamage[v6] = (ElementDamage[v6] or 0) + v3.Value
							end

							continue
						end

						if v5 == "DodgeChance" then
							t.DodgeChance = t.DodgeChance + v3.Value

							continue
						end

						if v5 == "ContractChargeCap" then
							t.ContractChargeCap = t.ContractChargeCap + v3.Value

							continue
						end

						local Stats = t.Stats

						Stats[v5] = (Stats[v5] or 0) + v3.Value
					end
				end
			end
		end
	end

	return t
end

return t