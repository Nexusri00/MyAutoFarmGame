-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTBG1hdGgGcmFuZG9tCHRvc3RyaW5nA1J1bgROYW1lBHJhbmQHQWxpYXNlcwtEZXNjcmlwdGlvbitSZXR1cm5zIGEgcmFuZG9tIG51bWJlciBiZXR3ZWVuIG1pbiBhbmQgbWF4BUdyb3VwC0RlZmF1bHRVdGlsBEFyZ3MEVHlwZQdpbnRlZ2VyDEZpcnN0IG51bWJlcpYBSWYgc2Vjb25kIG51bWJlciBpcyBuaWwsIHJhbmRvbSBudW1iZXIgaXMgYmV0d2VlbiAxIGFuZCB0aGlzIHZhbHVlLiBJZiBzZWNvbmQgbnVtYmVyIGlzIHByb3ZpZGVkLCBudW1iZXIgaXMgYmV0d2VlbiB0aGlzIG51bWJlciBhbmQgdGhlIHNlY29uZCBudW1iZXIuDVNlY29uZCBudW1iZXIQVGhlIHVwcGVyIGJvdW5kLghPcHRpb25hbAACBwMAAAAAEA4CBgCkBAIAAAQAgFIFAQBSBgIAnwQDAisEBACkBAIAAAQAgFIFAQCfBAICuz8EAqQDBAAAADBAnwMCAoIDAgAFAwEDAgQABACAAwMEAAAwQAAUBAEYAAAAAAAAAAAAAAAAAAAAABUAAAAABAAAAQIAEqMAAADiAAkA/wEAAAAAAAAwAQAnAgAAAP8BAAACAAAA4gIOAOIDEwDFAQIDAQAAADABANsHAAAAwAEUADABABYIAAAAggACABUDBQMGAwcDCAMJAwoDCwMMAwQIBgABAAAAAv////8DBAAAAAUGAAAAB/////8I/////wMNAw4DDwMQCAMKCwAAAAAMAAAAAw0AAAADEQMSAxMBAQgECgsAAAAADwAAAAMQAAAAERIAAAAGAAEAAQABGAAAAgAAAAMAAQUAAPoADgAAAAEAAAAAAffN/lxLQ1U0lA+mxtiOrGWH1ekoxQmUXQ==

-- https://lua.expert/
return {
	Name = "rand",
	Description = "Returns a random number between min and max",
	Group = "DefaultUtil",
	Aliases = {},
	Args = {
		{
			Type = "integer",
			Name = "First number",
			Description = "If second number is nil, random number is between 1 and this value. If second number is provided, number is between this number and the second number."
		},
		{
			Type = "integer",
			Name = "Second number",
			Description = "The upper bound.",
			Optional = true
		}
	},
	Run = function(p1, p2, p3) --[[ Run | Line: 20 ]]
		return tostring(p3 and math.random(p2, p3) or math.random(p2))
	end
}