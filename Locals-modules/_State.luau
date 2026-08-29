-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMNAm9zBWNsb2NrBXBhaXJzE0FjdGl2ZVRla2tldHN1QXVyYXMGdHlwZW9mCEluc3RhbmNlBlBhcmVudAdEZXN0cm95FEFjdGl2ZUVuZHVyYW5jZUF1cmFzEkFjdGl2ZVNodW5yYWlBdXJhcxZjbGVhbnVwRGVhZEF1cmFFbnRyaWVzEVN0YXR1c0Nvbm5lY3Rpb25zGGNsZWFudXBEZWFkU3RhdHVzRW50cmllcwADCAACAAAAgAGkAAIAAAQAgJ8AAQL7AgAAJgEAAowCCgBgAQIAAgAAAIIAAQDeAAAApAEEAAAAMED7AgEATQICJwUAAACfAQIEFwEeALssBANSBwQApAYHAAAAYECfBgIC8AYYAAgAAIBNBgQkCQAAAEcGFAAAAACADgUNALssBQNSBwUApAYHAAAAYECfBgIC8AYHAAgAAIBNBgUkCQAAAA4GAwC8BgVQCgAAAJ8GAgH7BgEATQYGJwUAAADGBwAAagcGBG4B4f8CAAAApAEEAAAAMED7AgEATQICSgsAAACfAQIEFwEeALssBANSBwQApAYHAAAAYECfBgIC8AYYAAgAAIBNBgQkCQAAAEcGFAAAAACADgUNALssBQNSBwUApAYHAAAAYECfBgIC8AYHAAgAAIBNBgUkCQAAAA4GAwC8BgVQCgAAAJ8GAgH7BgEATQYGSgsAAADGBwAAagcGBG4B4f8CAAAApAEEAAAAMED7AgEATQICBwwAAACfAQIEFwEeALssBANSBwQApAYHAAAAYECfBgIC8AYYAAgAAIBNBgQkCQAAAEcGFAAAAACADgUNALssBQNSBwUApAYHAAAAYECfBgIC8AYHAAgAAIBNBgUkCQAAAA4GAwC8BgVQCgAAAJ8GAgH7BgEATQYGBwwAAADGBwAAagcGBG4B4f8CAAAAggABAA0DAQMCBAAEAIADAwQAADBAAwQDBQQAAGBAAwYDBwMIAwkDCgAQCwEYAAAAAQAAAAAAAQEAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAQAAAAD9AAYAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAQAAAAD9AAYAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAQAAAAD9AAYRAAAAAAgAAgAAACSkAAIAAAQAgJ8AAQL7AgAAJgEAAowCBQBgAQIAAgAAAIIAAQDeAAAApAEEAAAAMED7AgEATQICwgUAAACfAQIEFwEQALssBANSBwQApAYHAAAAYECfBgIC8AYKAAgAAIBNBgQkCQAAAEcGBgAAAACA+wYBAE0GBsIFAAAAxgcAAGoHBgRuAe//AgAAAIIAAQAKAwEDAgQABACAAwMEAAAwQAMMAwUEAABgQAMGAwcAKA0BGAAAAAEAAAAAAAEBAAAAAAAAAQAAAAAAAAAAAAABAAAAAP4ABSkAAAAABAAAAQIAIaMAAAD/AAQAAAAAAP8BAAAAAAAAMAEAwgAAAAD/AQAAAAAAADABACcBAAAA/wEAAAAAAAAwAQBKAgAAAP8BAAAAAAAAMAEABwMAAACMAQAAjAIAANkDAAASAQH/EgAAADADADgEAAAA2QMBABIBAv8SAAAAMAMAlgUAAADBAQAAggACAAYDDAMEAwkDCgMLAw0CAAEBAAEYAAUAAgAAAAEAAAABAAAAAQAAAAIBAgAAAAAYAAAAAAsAAQAAAAACSccz0+h4M4b1JG013LjPHDnfJKd7A1nS

-- https://lua.expert/
local t = {
	StatusConnections = {},
	ActiveTekketsuAuras = {},
	ActiveEnduranceAuras = {},
	ActiveShunraiAuras = {}
}
local v1 = 0
local v2 = 0

function t.cleanupDeadAuraEntries() --[[ cleanupDeadAuraEntries | Line: 16 | Upvalues: v1 (ref), t (copy) ]]
	local v12 = os.clock()

	if v12 - v1 < 10 then
		return
	end

	v1 = v12

	for k, v in pairs(t.ActiveTekketsuAuras) do
		if typeof(k) == "Instance" and k.Parent == nil then
			if v and (typeof(v) == "Instance" and v.Parent) then
				v:Destroy()
			end

			t.ActiveTekketsuAuras[k] = nil
		end
	end

	for k, v in pairs(t.ActiveEnduranceAuras) do
		if typeof(k) == "Instance" and k.Parent == nil then
			if v and (typeof(v) == "Instance" and v.Parent) then
				v:Destroy()
			end

			t.ActiveEnduranceAuras[k] = nil
		end
	end

	for k, v in pairs(t.ActiveShunraiAuras) do
		if typeof(k) == "Instance" and k.Parent == nil then
			if v and (typeof(v) == "Instance" and v.Parent) then
				v:Destroy()
			end

			t.ActiveShunraiAuras[k] = nil
		end
	end
end
function t.cleanupDeadStatusEntries() --[[ cleanupDeadStatusEntries | Line: 40 | Upvalues: v2 (ref), t (copy) ]]
	local v1 = os.clock()

	if v1 - v2 < 5 then
		return
	end

	v2 = v1

	for k, v in pairs(t.StatusConnections) do
		if typeof(k) == "Instance" and k.Parent == nil then
			t.StatusConnections[k] = nil
		end
	end
end

return t