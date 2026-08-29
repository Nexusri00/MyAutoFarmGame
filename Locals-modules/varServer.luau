-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMgFV9wYWNrYWdlL2VyeW4uaW8vQ21kcgxHZXREYXRhU3RvcmUIdGVzdF9rZXkIR2V0QXN5bmMFcGNhbGwJY29yb3V0aW5lBnJlc3VtZQV0YWJsZQZyZW1vdmUHcnVubmluZwZpbnNlcnQFeWllbGQDc3ViASQBLjsjIFlvdSBtdXN0IHB1Ymxpc2ggdGhpcyBwbGFjZSB0byB0aGUgd2ViIHRvIHVzZSBzYXZlZCBrZXlzLgR2YXJfBmdsb2JhbAhFeGVjdXRvcgZVc2VySWQIdG9zdHJpbmcBXwAEdHlwZQZjb25jYXQBLAhHZXRTdG9yZQRnYW1lEERhdGFTdG9yZVNlcnZpY2UKR2V0U2VydmljZQR0YXNrBXNwYXduAAQEAAEAAAAK+wAAAG8CAAC8AAASAQAAAJ8AAwJvAwIAvAEAUAMAAACfAQMBggACAAQDAQMCAwMDBAAGAAEYAAAAAAABAAAAAQcAAAAABAAEAAAAFqQAAQAAAABAwAECABICAgCfAAID3gAAAN4BAQD7AQMAHAABAIwBAABgAQoAAAAAAKQABQAAEDCApAEIAAAcYID7AgMAjAMBAJ8BAwCfAAABSADy/4IAAQAJAwUEAAAAQAYAAwYDBwQAEDCAAwgDCQQAHGCAAQAFAAEYAAAAAAAAAAYAAAAAAQAAAAAAAAD/AwYAAAAACwIDAAAAa/sCAABHAgwAAAAAgPsDAQCkBAIAAAQAgJ8EAQBMNAACpAIFAAAQMICfAgABpAIHAAAYAICfAgEBqQIAAKkDAQCMBgEAjAcBALwEAfAIAAAAnwQEAvAEBwAJAACAjAYCALwEAfAIAAAAnwQDAlIBBACpAgEAjAYBAIwHAQC8BAHwCAAAAJ8EBALwBAcACgAAgIwGAgC8BAHwCAAAAJ8EAwJSAQQAqQMAAA4DBAD7BAAAKwQCAG8ECwCCBAIAbwUMAA4CAgBvBg0AZQAIAE0HAP8OAAAATQcH5g8AAAC7PwcCpAYRAAAAAEGfBgICcwQFBg4DGQBSBgQAbwcSAFIIAQBzBQYI+wcCAFIJBQC8BwdQFAAAAJ8HAwKQBgcTuygGA1IIBgCkBxYAAABQQZ8HAgLwBwgAAwAAgKQIGAAAXDCAUgkGAG8KGQCfCAMCkAcIE4IHAgCCBgIAUgcEALwFAFUaAAAAnwUDAocHBQGQBgcTuygGA1IIBgCkBxYAAABQQZ8HAgLwBwgAAwAAgKQIGAAAXDCAUgkGAG8KGQCfCAMCkAcIE4IHAgCCBgIAGwMGAwoEAAQAgAMIAwsEABAwgAMMBAAYAIADDQMOAw8DEAMRAxIDEwMUAxUEAAAAQQMWAxcDBAMYBAAAUEEDGQQAXDCAAxoDGwARAAEYAAAAAQAAAAAAAAABAAADAQIAAAAAAAABAAAAAAEDAAAAAAAAAQAAAAABAwAAAQADAAAAAAAAAAAAAAAAAgEAAAABAAAAAAABAAAAAAAAAQAAAAAAAAICAAAAAgACAAAAAAAAAQAAAAAAAAMSAAAAAAYAAAECABmjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMC/wEAAAAAAADGAgAAxgMAAKQEBgAAFECA2QUAABIBAv8SAQP/EgAAABIAAQCfBAIB2QQBABIBAv8SAAEAEgED/8ECAACCBAIABwMcBAAAAEADHQMeAx8DIAQAFECAAgECAQABGAAAAAAAAAACAAEAAQAAAAAAAAAMAAAAAAABAAAAAAP/RSsgPW0rbVFYyJDS/hrRj108VM2BQSE=

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

return function(p1, p2) --[[ Line: 17 | Upvalues: v1 (ref), t (copy), v2 (ref) ]]
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
		local v9 = v2:GetAsync(v8 .. "_" .. p2) or ""

		if type(v9) == "table" then
			return table.concat(v9, ",") or ""
		end

		return v9
	end

	local v10 = p1:GetStore(v8)[p2] or ""

	if type(v10) == "table" then
		return table.concat(v10, ",") or ""
	end

	return v10
end