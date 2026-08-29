-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMhFV9wYWNrYWdlL2VyeW4uaW8vQ21kcgxHZXREYXRhU3RvcmUIdGVzdF9rZXkIR2V0QXN5bmMFcGNhbGwJY29yb3V0aW5lBnJlc3VtZQV0YWJsZQZyZW1vdmUHcnVubmluZwZpbnNlcnQFeWllbGQDc3ViASQBLjsjIFlvdSBtdXN0IHB1Ymxpc2ggdGhpcyBwbGFjZSB0byB0aGUgd2ViIHRvIHVzZSBzYXZlZCBrZXlzLgR2YXJfBmdsb2JhbAhFeGVjdXRvcgZVc2VySWQIdG9zdHJpbmcBXwhTZXRBc3luYwR0eXBlAAZjb25jYXQBLAhHZXRTdG9yZQRnYW1lEERhdGFTdG9yZVNlcnZpY2UKR2V0U2VydmljZQR0YXNrBXNwYXduAAQEAAEAAAAK+wAAAG8CAAC8AAASAQAAAJ8AAwJvAwIAvAEAUAMAAACfAQMBggACAAQDAQMCAwMDBAAGAAEYAAAAAAABAAAAAQcAAAAABAAEAAAAFqQAAQAAAABAwAECABICAgCfAAID3gAAAN4BAQD7AQMAHAABAIwBAABgAQoAAAAAAKQABQAAEDCApAEIAAAcYID7AgMAjAMBAJ8BAwCfAAABSADy/4IAAQAJAwUEAAAAQAYAAwYDBwQAEDCAAwgDCQQAHGCAAQAFAAEYAAAAAAAAAAYAAAAAAQAAAAAAAAD/AwYAAAAACwMDAAAAavsDAABHAwwAAAAAgPsEAQCkBQIAAAQAgJ8FAQBMNAACpAMFAAAQMICfAwABpAMHAAAYAICfAwEBqQMAAKkEAQCMBwEAjAgBALwFAfAIAAAAnwUEAvAFBwAJAACAjAcCALwFAfAIAAAAnwUDAlIBBQCpAwEAjAcBAIwIAQC8BQHwCAAAAJ8FBALwBQcACgAAgIwHAgC8BQHwCAAAAJ8FAwJSAQUAqQQAAA4EBAD7BQAAKwUCAG8FCwCCBQIAbwYMAA4DAgBvBw0AZQAIAE0IAP8OAAAATQgI5g8AAAC7PwgCpAcRAAAAAEGfBwICcwUGBw4EGQBSBwUAbwgSAFIJAQBzBgcJ+wcCAFIJBgBSCgIAvAcHXBMAAACfBwQBuygCA1IIAgCkBxUAAABAQZ8HAgLwBwgAAwAAgKQIGAAAXDCAUgkCAG8KGQCfCAMCkAcIFoIHAgCCAgIAUggFALwGAFUaAAAAnwYDAmoCBgG7KAIDUggCAKQHFQAAAEBBnwcCAvAHCAADAACApAgYAABcMIBSCQIAbwoZAJ8IAwKQBwgWggcCAIICAgAbAwYDCgQABACAAwgDCwQAEDCAAwwEABgAgAMNAw4DDwMQAxEDEgMTAxQDFQQAAABBAxYDFwMYBAAAQEEDGQMaBABcMIADGwMcABEAARgAAAABAAAAAAAAAAEAAAMBAgAAAAAAAAEAAAAAAQMAAAAAAAABAAAAAAEDAAABAAMAAAAAAAAAAAAAAAACAQAAAAIAAAAAAAIAAAAAAAABAAAAAAAAAwIAAAACAgAAAAAAAAEAAAAAAAADEgAAAAAGAAABAgAZowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAv8BAAAAAAAAxgIAAMYDAACkBAYAABRAgNkFAAASAQL/EgED/xIAAAASAAEAnwQCAdkEAQASAQL/EgABABIBA//BAgAAggQCAAcDHQQAAABAAx4DHwMgAyEEABRAgAIBAgEAARgAAAAAAAAAAgABAAEAAAAAAAAADAAAAAAAAQAAAAADAcYYUd6RK5x4YZzwVZXSIHHeDyUzAnJQ

-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local t = {}
local v1 = nil
local v2 = nil

task.spawn(function() --[[ Line: 5 | Upvalues: v1 (ref), v2 (ref), DataStoreService (copy), t (copy) ]]
	local ok, result = pcall(function() --[[ Line: 6 | Upvalues: DataStoreService (ref) ]]
		local v1 = DataStoreService:GetDataStore("_package/eryn.io/Cmdr")

		v1:GetAsync("test_key")

		return v1
	end)

	v1 = ok
	v2 = result

	while #t > 0 do
		coroutine.resume(table.remove(t, 1))
	end
end)

return function(p1, p2, p3) --[[ Line: 17 | Upvalues: v1 (ref), t (copy), v2 (ref) ]]
	if v1 == nil then
		table.insert(t, coroutine.running())
		coroutine.yield()
	end

	local v22 = true
	local v3

	if p2:sub(1, 1) == "$" then
		p2, v3 = p2:sub(2), true
	else
		v3 = false
	end

	if p2:sub(1, 1) == "." then
		v22, p2 = false, p2:sub(2)
	end

	if v22 and not v1 then
		return "# You must publish this place to the web to use saved keys."
	end

	local v8 = "var_" .. (if v3 then "global" else tostring(p1.Executor.UserId))

	if v22 then
		v2:SetAsync(v8 .. "_" .. p2, p3)
	else
		p1:GetStore(v8)[p2] = p3
	end

	if type(p3) == "table" then
		return table.concat(p3, ",") or ""
	end

	return p3
end