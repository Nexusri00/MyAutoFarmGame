-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMMBmlwYWlycw5HZXREZXNjZW5kYW50cwhCYXNlUGFydANJc0EKQ2FuQ29sbGlkZQdEaXNhYmxlBXBhaXJzBlBhcmVudAV0YWJsZQVjbGVhcgdSZXN0b3JlA1NldAAECgEAAAAGAwAABQEHGf8BAAAAAAAApAIBAAAAAEC8AwBHAgAAAJ8DAgCfAgAEUQINAG8JAwC8Bwb+BAAAAJ8HAwIOBwgATQcG0wUAAAAOBwUAqQcBAGoHAQapBwAAMAcG0wUAAABuAvL/AgAAgIIBAgAGAwEEAAAAQAMCAwMDBAMFAAkGARgAAAEAAAAAAAABAAAAAAAAAAEAAQAA/QAGCgAAAAAHAQAAAAYDAAAFAQQSpAEBAAAAAEBSAgAAnwECBBcBBgBNBgQkAgAAAA4GAwCpBgEAMAYE0wMAAABuAfn/AQAAAKQBBgAAFECAUgIAAJ8BAgGCAAEABwMHBAAAAEADCAMFAwkDCgQAFECAABQLARgAAAAAAAEAAAEAAP4ABQAAAAEVAAAAAAsDAQAACAUAAAUDBwEEHyoBGAAAAACApAMBAAAAAEC8BABHAgAAAJ8EAgCfAwAEUQMNAG8KAwC8CAf+BAAAAJ8IAwIOCAgATQgH0wUAAAAOCAUAqQgBAGoIAgepCAAAMAgH0wUAAABuA/L/AgAAgIIAAQD7AwAATQMDrgYAAABSBAIAnwMCAYIAAQAHAwEEAAAAQAMCAwMDBAMFAwsAHQwBGAAAAQAAAAAAAAEAAAAAAAAAAQABAAD9AAAHAAAAAAIeAAAAAAIAAAECAA6jAAAA/wADAAAAAADAAQAAMAEAXwEAAADAAQIAMAEArgMAAADAAQQAEgAAADABAHMFAAAAggACAAYGAAMGBgEDCwYCAwwDAAECAQABGAAEAAQAAAsAAAkAAAANAQAAAAADy7gmL/zla/c/LVUbb7PpGbugMVv5fEwu

-- https://lua.expert/
local t = {
	Disable = function(p1) --[[ Disable | Line: 9 ]]
		local t = {}

		for i, v in ipairs(p1:GetDescendants()) do
			if v:IsA("BasePart") and v.CanCollide then
				t[v] = true
				v.CanCollide = false
			end
		end

		return t
	end,
	Restore = function(p1) --[[ Restore | Line: 20 ]]
		for k in pairs(p1) do
			if k.Parent then
				k.CanCollide = true
			end
		end

		table.clear(p1)
	end
}

function t.Set(p1, p2, p3) --[[ Set | Line: 29 | Upvalues: t (copy) ]]
	if p2 ~= false then
		t.Restore(p3)

		return
	end

	for i, v in ipairs(p1:GetDescendants()) do
		if v:IsA("BasePart") and v.CanCollide then
			p3[v] = true
			v.CanCollide = false
		end
	end
end

return t