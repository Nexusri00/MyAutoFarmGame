-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMdA0FsbAZpcGFpcnMJQ2hhcmFjdGVyAl9HElN0YXRzX0luc3RhbmNlTGlzdApTdGF0c0NsYXNzDkFkbWluU3RhdEJvb3N0ElN0YWNrRXh0ZXJuYWxTdGF0cwROYW1lBXRhYmxlBmluc2VydBdObyB2YWxpZCB0YXJnZXRzIGZvdW5kLhZDbGVhcmVkIHN0YXQgYm9vc3Q6ICVzBmNvbmNhdAIsIAZmb3JtYXQJYWxsIHN0YXRzMlNldCBzdGF0IGJvb3N0ICglcykgdG8gKyVzJSUgdW50aWwgcmVzZXQvZGVhdGg6ICVzCHRvc3RyaW5nCURvdERhbWFnZQ9NZWxlZU11bHRpcGxpZXIPUG93ZXJNdWx0aXBsaWVyEFdlYXBvbk11bHRpcGxpZXIOQ3JpdGljYWxDaGFuY2UOQ3JpdGljYWxEYW1hZ2UJTGlmZVN0ZWFsEkRlZmVuc2VQZW5ldHJhdGlvbglIUE1heF9QQ1QPRGFtYWdlUmVkdWN0aW9uAAIVBAEAABEGAAIFBA8EAoMDCEsCAwlfAmM+BAIAqQUBAEcDBQAAAAAA8AMCAAEAAACpBQABqQUBAP8GAAAAAAAADgUJAKQHAwAAACBA+wgAAJ8HAgRRBwEAagQGC24H/v8CAACAZQABAGoEBgP/BwAAAAAAAKQIAwAAACBAUgkBAJ8IAgRRCCAATQ0MaQQAAAAODR0ApA4GAAAAUEBNDg6OBwAAAA4OBQCkDwYAAABQQE0PD44HAAAAhw4PDVIPDgAODwIATQ8OFAgAAAAODw4AUhIGAG8TCQCpFAEAvBAPXQoAAACfEAUBTRIMugsAAACeNAcEEgAAAFIRBwCkEA4AADTAgJ8QAwFuCN//AgAAgBwIBwANCAMADwAAgG8IEACCCAIADQILAA8AAIBvCBEApAoTAABIwIBSCwcAbwwUAJ8KAwC8CAiNFQAAAJ8IAACCCAAADgUCAG8IFgBlAAEAUggDAG8JFwBSCwgAuz8CA1INAgCkDBkAAACAQZ8MAgKkDRMAAEjAgFIOBwBvDxQAnw0DALwJCY0VAAAAnwkAAIIJAAAaAgAAAAAAAFlAAwEDAgQAACBAAwMDBAQAAFBAAwUDBgMHAwgDCQMKAwsEADTAgAIAAAAAAAAAAAMMAw0DDgQASMCAAw8DEAMRAxIDEwQAAIBBABcAARgAAQAAAAAAAAEAAgEAAAAAAAAAAAIDAAIAAAAAAQABAgAAAAAAAAAAAAEAAAABBAAAAAAAAgAAAAAAAAD0AA8AAAEAAwABAAAAAAAAAAAAAwAAAAEAAAAAAAAAAAAAAAAAAAAYAAAAAAsAAAECABKjAAAA/wAAAAoAAABvAQAAbwIBAG8DAgBvBAMAbwUEAG8GBQBvBwYAbwgHAG8JCABvCgkAxQABCwEAAADAAQoAEgAAAIIBAgALAxQDFQMWAxcDGAMZAxoDGwMcAx0GAAEAAQABGAAGAAEBAQEBAQEBAQEAAAYAAAEAAAAAAR3RLIPbnNOjS2ZvRp3hyA9tyTv3LxVGgg==

-- https://lua.expert/
local t = {
	"DotDamage",
	"MeleeMultiplier",
	"PowerMultiplier",
	"WeaponMultiplier",
	"CriticalChance",
	"CriticalDamage",
	"LifeSteal",
	"DefensePenetration",
	"HPMax_PCT",
	"DamageReduction"
}

return function(p1, p2, p3, p4) --[[ Line: 23 | Upvalues: t (copy) ]]
	local v1 = p3 / 100
	local v2 = if p4 == nil then true elseif p4 == "All" then true else false
	local t2 = {}

	if v2 then
		for i, v in ipairs(t) do
			t2[v] = v1
		end
	else
		t2[p4] = v1
	end

	local t3 = {}

	for i, v in ipairs(p2) do
		local Character = v.Character

		if Character then
			local v3 = _G.Stats_InstanceList and _G.Stats_InstanceList[Character]
			local v4 = if v3 then v3.StatsClass else v3

			if v4 then
				v4:StackExternalStats(t2, "AdminStatBoost", true)
				table.insert(t3, v.Name)
			end
		end
	end

	if #t3 == 0 then
		return "No valid targets found."
	end

	if p3 == 0 then
		return ("Cleared stat boost: %s"):format(table.concat(t3, ", "))
	end

	return ("Set stat boost (%s) to +%s%% until reset/death: %s"):format(if v2 then "all stats" else p4, tostring(p3), table.concat(t3, ", "))
end