-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMQBnR5cGVvZgtOdW1iZXJWYWx1ZQZzdHJpbmcFdGFibGULU3RyaW5nVmFsdWUHYm9vbGVhbglCb29sVmFsdWUMR2V0VmFsdWVUeXBlCkpTT05FbmNvZGUOVHJhbnNsYXRlVmFsdWUGSGFzVGFnBVZhbHVlCldyaXRlVmFsdWUEZ2FtZQtIdHRwU2VydmljZQpHZXRTZXJ2aWNlAAQFAgAAAAASuywBA1IDAQCkAgEAAAAAQJ8CAgJvAwIAxgQAAPACAwADAAAA8AIEAAQAAIBvAwUAbwQEAIICBADwAgIABgAAgG8DBwCCAgQACAMBBAAAAEADAgMDAwQDBQMGAwcABAgBGAAAAAAAAQECAAAAAQEAAQABAwUAAAAABwICAAAAECsBAQCCAAEA+wIAAFIEAQC8AgJDAAAAAJ8CAwPwAgcAAQAAgPsEAQBSBgEAvAQEngIAAACfBAMAggQAAIIBAgADAwgDBAMJABMKARgAAAEAAAAAAQABAAAAAAACFAAAAAAIAwIAAAgFAAAFAwQHDxsOAgEAKwEBAIIAAQD7AwAAUgUCALwDA0MAAAAAnwMDA28HAQC8BQHeAgAAAJ8FAwIOBQEAbwMBAPADCQABAACA+wUBAFIHAgC8BQWeAwAAAJ8FAwIwBQHsBAAAAIIAAQAwAgHsBAAAAIIAAQAFAwgDBAMLAwkDDAAcDQEYAAAAAQAAAAABAAAAAAABAAEAAAAAAAABAgABHQAAAAADAAABAgAXowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAv8BAwAAAAAAwAIEADACAUMFAAAAwAIGABIAAQASAAAAMAIBmwcAAADAAggAEgABABIAAAAwAgEJCQAAAIIBAgAKAw4EAAAAQAMPAxAGAAMIBgEDCgYCAw0DAAECAQABGAAAAAAAAAABAAIAAA8AAAAACQAAAAALAQAAAAADuV9RWDkY5jldCwL07SZDdMlHRiyLmztZ

-- https://lua.expert/
local HttpService = game:GetService("HttpService")
local t = {
	GetValueType = function(p1, p2) --[[ GetValueType | Line: 4 ]]
		local v1 = typeof(p2)
		local v2 = "NumberValue"

		if v1 == "string" or v1 == "table" then
			return v1, "StringValue", "table"
		end

		if v1 == "boolean" then
			v2 = "BoolValue"
		end

		return v1, v2, nil
	end
}

function t.TranslateValue(p1, p2) --[[ TranslateValue | Line: 19 | Upvalues: t (copy), HttpService (copy) ]]
	if not p2 then
		return
	end

	local v1, _ = t:GetValueType(p2)

	if v1 == "table" then
		return HttpService:JSONEncode(p2)
	end

	return p2
end
function t.WriteValue(p1, p2, p3) --[[ WriteValue | Line: 28 | Upvalues: t (copy), HttpService (copy) ]]
	if not (p3 and p2) then
		return
	end

	local v1, _ = t:GetValueType(p3)

	if p2:HasTag("table") then
		v1 = "table"
	end

	if v1 == "table" then
		p2.Value = HttpService:JSONEncode(p3)
	else
		p2.Value = p3
	end
end

return t