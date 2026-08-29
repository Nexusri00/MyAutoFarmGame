-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMYB1BlcmZvcm0JQ2xpZW50UnVuBE5hbWUEbWF0aAdBbGlhc2VzC0Rlc2NyaXB0aW9uJVBlcmZvcm0gYSBtYXRoIG9wZXJhdGlvbiBvbiAyIHZhbHVlcy4FR3JvdXALRGVmYXVsdFV0aWwIQXV0b0V4ZWMEQXJnc0lhbGlhcyAiK3xQZXJmb3JtIGFuIGFkZGl0aW9uLiIgbWF0aCArICQxe251bWJlcnxOdW1iZXJ9ICQye251bWJlcnxOdW1iZXJ9S2FsaWFzICItfFBlcmZvcm0gYSBzdWJ0cmFjdGlvbi4iIG1hdGggLSAkMXtudW1iZXJ8TnVtYmVyfSAkMntudW1iZXJ8TnVtYmVyfU5hbGlhcyAiKnxQZXJmb3JtIGEgbXVsdGlwbGljYXRpb24uIiBtYXRoICogJDF7bnVtYmVyfE51bWJlcn0gJDJ7bnVtYmVyfE51bWJlcn1IYWxpYXMgIi98UGVyZm9ybSBhIGRpdmlzaW9uLiIgbWF0aCAvICQxe251bWJlcnxOdW1iZXJ9ICQye251bWJlcnxOdW1iZXJ9UWFsaWFzICIqKnxQZXJmb3JtIGFuIGV4cG9uZW50aWF0aW9uLiIgbWF0aCAqKiAkMXtudW1iZXJ8TnVtYmVyfSAkMntudW1iZXJ8TnVtYmVyfUdhbGlhcyAiJXxQZXJmb3JtIGEgbW9kdWx1cy4iIG1hdGggJSAkMXtudW1iZXJ8TnVtYmVyfSAkMntudW1iZXJ8TnVtYmVyfQRUeXBlDG1hdGhPcGVyYXRvcglPcGVyYXRpb24RQSBtYXRoIG9wZXJhdGlvbi4GbnVtYmVyBVZhbHVlD0EgbnVtYmVyIHZhbHVlLgACBwQAAAAABk0EAVwAAAAAUgUCAFIGAwCfBAMAggQAAAEDAQAgAgEYAAAAAAAAIQAAAAAIAAABAgAfowAAAOIACgD/AQAAAAAAADABACcCAAAA/wEAAAYAAABvAgsAbwMMAG8EDQBvBQ4AbwYPAG8HEADFAQIHAQAAADABAH0HAAAA/wEAAAMAAADiAhUA4gMZAOIEGQDFAQIEAQAAADABANsIAAAAwAEaADABADMJAAAAggACABsDAwMEAwUDBgMHAwgDCQMKAwsDAggHAAEAAAAC/////wMEAAAABQYAAAAH/////wj/////Cf////8DDAMNAw4DDwMQAxEDEgMTAxQDFQgDERIAAAAAEwAAAAMUAAAAAxYDFwMYCAMRFgAAAAAXAAAAAxgAAAAGAAEAAQABGAAAAgAAAAMAAQEBAQEBAAD6AAgAAQUFAAD1ABIAAAABAAAAAAHDWg4/uCtM0GAW2QaujPH6s0IZS/GeZD4=

-- https://lua.expert/
return {
	Name = "math",
	Description = "Perform a math operation on 2 values.",
	Group = "DefaultUtil",
	Aliases = {},
	AutoExec = { "alias \"+|Perform an addition.\" math + $1{number|Number} $2{number|Number}", "alias \"-|Perform a subtraction.\" math - $1{number|Number} $2{number|Number}", "alias \"*|Perform a multiplication.\" math * $1{number|Number} $2{number|Number}", "alias \"/|Perform a division.\" math / $1{number|Number} $2{number|Number}", "alias \"**|Perform an exponentiation.\" math ** $1{number|Number} $2{number|Number}", "alias \"%|Perform a modulus.\" math % $1{number|Number} $2{number|Number}" },
	Args = {
		{
			Type = "mathOperator",
			Name = "Operation",
			Description = "A math operation."
		},
		{
			Type = "number",
			Name = "Value",
			Description = "A number value."
		},
		{
			Type = "number",
			Name = "Value",
			Description = "A number value."
		}
	},
	ClientRun = function(p1, p2, p3, p4) --[[ ClientRun | Line: 32 ]]
		return p2.Perform(p3, p4)
	end
}