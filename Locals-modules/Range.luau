-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMGA01pbgNNYXgEbWF0aAZyYW5kb20UUmFuZG9tVmFsdWVGcm9tUmFuZ2ULTnVtYmVyUmFuZ2UBBgACBwEAAAAGAwAABQFAFk0BANgAAAAATQIAtAEAAACaAQQAAgAAAE0BANgAAAAAggECAE0CANgAAAAATQUAtAEAAABNBgDYAAAAACYEBQakBQQAAAwggJ8FAQIJAwQFQwECA4IBAgAFAwEDAgMDAwQEAAwggAAEBQEYAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAUAAAAAAgAAAQIAB6MAAAD/AAEAAAAAAMABAAAwAQBJAQAAAIIAAgACBgADBQEAAQABGAABAAIAAAUBAAAAAAFicIqynmEboTlR7xcdvHJ0EmidxlC04LM=

-- https://lua.expert/
return {
	RandomValueFromRange = function(p1) --[[ RandomValueFromRange | Line: 4 ]]
		if p1.Min == p1.Max then
			return p1.Min
		end

		return p1.Min + (p1.Max - p1.Min) * math.random()
	end
}