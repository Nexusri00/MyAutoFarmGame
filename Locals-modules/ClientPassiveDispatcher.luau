-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBHR5cGUGc3RyaW5nAAR3YXJuNVtDbGllbnRQYXNzaXZlRGlzcGF0Y2hlcl0gUmVnaXN0ZXI6IGludmFsaWQgZXZlbnROYW1lBmZvcm1hdFJbQ2xpZW50UGFzc2l2ZURpc3BhdGNoZXJdIGR1cGxpY2F0ZSBoYW5kbGVyIGZvciAlcSDigJQgc2Vjb25kIHJlZ2lzdHJhdGlvbiBpZ25vcmVkCFJlZ2lzdGVyK1tDbGllbnRQYXNzaXZlRGlzcGF0Y2hlcl0gbm8gaGFuZGxlciBmb3IgJXEFcGNhbGw0W0NsaWVudFBhc3NpdmVEaXNwYXRjaGVyXSBoYW5kbGVyIGZvciAlcSBlcnJvcmVkOiAlcwh0b3N0cmluZwhEaXNwYXRjaAxJc1JlZ2lzdGVyZWQABAYCAQAABwQAAAUCAwUeuygAA1IDAACkAgEAAAAAQJ8CAgLwAgMAAgAAgPAABgADAACApAIFAAAAQEBvAwYAnwICAYIAAQD7AwAAhwIDAEcCCgAAAAAApAIFAAAAQECkAwgAABwggG8ECQBSBQAAnwMDAJ8CAAGCAAEA+wIAAGoBAgCCAAEACgMBBAAAAEADAgMDAwQEAABAQAMFAwYEABwggAMHABAIARgAAAAAAAAAAAABAAAAAQIAAAABAAAAAAAAAAECAAERAAAAAAwDAgAACAUAAAUDA4cPL7soAANSBAAApAMBAAAAAECfAwIC8AMCAAIAAACCAAEA+wQAAIcDBAArAw8A+wUBAIcEBQArBAsA+wQBAKkFAQBqBQQApAQEAAAAMECkBQYAABQggG8GBwBSBwAAnwUDAJ8EAAGCAAEApAQJAAAAgEBSBQMAUgYBAFIHAgCfBAQDKwQNAKQGBAAAADBApAcGAAAUIIBvCAoAUgkAALs/BQNSCwUApAoMAAAAsECfCgICnwcEAJ8GAAGCAAEADQMBBAAAAEADAgMEBAAAMEADBgQAFCCAAwkDCgQAAIBAAwsDDAQAALBAABwNARgAAAAAAAAAAAEAAQEAAAEAAAEAAAAAAAAAAgIAAAAAAAEBAAAAAAAAAAAAAAAAAh0AAAAABAEBAAAGAwAABQEDB/sDAACHAgMARwICAAAAAICpAQABqQEBAIIBAgAAACwOARgAAAAAAAAALQAAAAAEAAABAgAVowAAAP8AAwAAAAAA/wEAAAAAAAD/AgAAAAAAAMADAAASAAEAMAMAgwEAAADAAwIAEgABABIAAgAwAwBsAwAAAMADBAASAAEAMAMAVAUAAACCAAIABgYAAwgGAQMNBgIDDgMAAQIBAAEYAAgAAgABAAQAAAAMAAAAABAAAAAEAQAAAAADHqJhEYTca2lxHnfou20mT266dmUsZgsQ

-- https://lua.expert/
local t = {}
local t2 = {}
local t3 = {}

function t.Register(p1, p2) --[[ Register | Line: 16 | Upvalues: t2 (copy) ]]
	if type(p1) ~= "string" or p1 == "" then
		warn("[ClientPassiveDispatcher] Register: invalid eventName")

		return
	end

	if t2[p1] == nil then
		t2[p1] = p2
	else
		warn(string.format("[ClientPassiveDispatcher] duplicate handler for %q \226\128\148 second registration ignored", p1))
	end
end
function t.Dispatch(p1, p2, p3) --[[ Dispatch | Line: 28 | Upvalues: t2 (copy), t3 (copy) ]]
	if type(p1) ~= "string" then
		return
	end

	local v1 = t2[p1]

	if v1 then
		local ok, result = pcall(v1, p2, p3)

		if ok then
			return
		end

		warn(string.format("[ClientPassiveDispatcher] handler for %q errored: %s", p1, (tostring(result))))
	else
		if t3[p1] then
			return
		end

		t3[p1] = true
		warn(string.format("[ClientPassiveDispatcher] no handler for %q", p1))
	end
end
function t.IsRegistered(p1) --[[ IsRegistered | Line: 44 | Upvalues: t2 (copy) ]]
	return t2[p1] ~= nil
end

return t