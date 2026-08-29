-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMaBXBjYWxsDEludm9rZVNlcnZlcgV0YWJsZQZ1bnBhY2sEdGFzawVzcGF3bgJvcwVjbG9jawR3YWl0B1RpbWVvdXQGaW52b2tlBnR5cGVvZgZzdHJpbmcfUmVxdWVzdCBmYWlsZWQg4oCUIHBsZWFzZSByZXRyeSJSZXF1ZXN0IHRpbWVkIG91dCDigJQgcGxlYXNlIHJldHJ5C1JhdGVMaW1pdGVkHlNsb3cgZG93biDigJQgcGxlYXNlIHRyeSBhZ2FpbgtTZWxsVG9vRmFzdBpIb2xkIG9uIOKAlCByZWFkaW5nIGZvciAxcwtOb0hhbmRzaGFrZRBQbGVhc2UgdHJ5IGFnYWluDEl0ZW1Ob3RGb3VuZBVJdGVtIG5vIGxvbmdlciBleGlzdHMOVW5zZWxsYWJsZUl0ZW0YVGhpcyBpdGVtIGNhbm5vdCBiZSBzb2xkDnR5cGVkRXJyb3JUZXh0AAQFAAUAAAARpAABAAAAAED7AQAATQEBOQIAAAD7AgAA+wQBALs1BAKkAwUAABAwgJ8DAgCfAAAD3gACAN4BAwCpAgEA3gIEAIIAAQAGAwEEAAAAQAMCAwMDBAQAEDCAAA0AARgAAAAAAAAAAAAAAAABAQEAAQ4AAAAACQIAAQAHBAAABQIHAiejAgAA/wIAAAAAAADdAwAAxQIDAAEAAACpAwAAqQQAAMYFAACkBgIAAAQAgNkHAAASAAAAEgACABIBBP8SAQX/EgED/58GAgGkBwUAABAwgJ8HAQJDBgcBKwMJAKQHBQAAEDCAnwcBAmAHBQAGAAAApAcHAAAYAICfBwEBSAD2/w4DAgDBAwAAggQDAKkHAABvCAgAwQMAAIIHAwAJAwUDBgQABACAAwcDCAQAEDCAAwkEABgAgAMKAQAHCwEYAAEAAAAAAQEBAgAAAAAAAAAABwAAAAEAAAAAAAEAAP8EAQACAAAABwAAAAADAQAAAAAjuywAA1ICAACkAQEAAAAAQJ8BAgLwAQMAAgAAAG8BAwCCAQIA8AADAAQAAIBvAQUAggECAPAAAwAGAACAbwEHAIIBAgDwAAMACAAAgG8BCQCCAQIA8AADAAoAAIBvAQsAggECAPAAAwAMAACAbwENAIIBAgDwAAMADgAAgG8BDwCCAQIAbwEDAIIBAgAQAwwEAAAAQAMNAw4DCgMPAxADEQMSAxMDFAMVAxYDFwMYAxkAHxoBGAAAAAAAAAAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAIAAAAAACAAABAgAKowAAAP8AAgAAAAAAwAEAADABABYBAAAAwAECADABAKUDAAAAggACAAQGAQMLBgIDGgIBAgEAARgAAgAEAAAYAAANAQAAAAADn13pGS5zaH6OJc9bY7cHq+9F/m2tmYMY

-- https://lua.expert/
return {
	invoke = function(p1, p2, ...) --[[ invoke | Line: 7 ]]
		local t = { ... }
		local v1 = false
		local v2 = false
		local v3 = nil

		task.spawn(function() --[[ Line: 13 | Upvalues: p1 (copy), t (copy), v2 (ref), v3 (ref), v1 (ref) ]]
			local ok, result = pcall(p1.InvokeServer, p1, table.unpack(t))

			v2 = ok
			v3 = result
			v1 = true
		end)

		local v4 = os.clock() + p2

		while not v1 and os.clock() < v4 do
			task.wait()
		end

		if v1 then
			return v2, v3
		end

		return false, "Timeout"
	end,
	typedErrorText = function(p1) --[[ typedErrorText | Line: 31 ]]
		if typeof(p1) ~= "string" then
			return "Request failed \226\128\148 please retry"
		end

		if p1 == "Timeout" then
			return "Request timed out \226\128\148 please retry"
		end

		if p1 == "RateLimited" then
			return "Slow down \226\128\148 please try again"
		end

		if p1 == "SellTooFast" then
			return "Hold on \226\128\148 reading for 1s"
		end

		if p1 == "NoHandshake" then
			return "Please try again"
		end

		if p1 == "ItemNotFound" then
			return "Item no longer exists"
		end

		if p1 == "UnsellableItem" then
			return "This item cannot be sold"
		end

		return "Request failed \226\128\148 please retry"
	end
}