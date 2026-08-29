-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWUJbHVja2V2ZW50B0FsaWFzZXMLRGVzY3JpcHRpb26wAVRvZ2dsZSB0aGUgR0xPQkFMIHgyIEx1Y2sgZXZlbnQgKCsxMDAlIGx1Y2sgZm9yIGV2ZXJ5b25lLCBzYW1lIGFzIHRoZSB3ZWVrZW5kIGJvb3N0KSBhY3Jvc3MgYWxsIHNlcnZlcnMsIGluY2x1ZGluZyBvbmVzIHRoYXQgc3RhcnQgbGF0ZXIuIHRydWUvb24gPSBlbmFibGUsIGZhbHNlL29mZiA9IGRpc2FibGUuBUdyb3VwBUFkbWluBEFyZ3MGeDJsdWNrCWx1Y2tib29zdARUeXBlB2Jvb2xlYW4HZW5hYmxlZEJ0cnVlID0gZW5hYmxlIHgyIGx1Y2sgZm9yIGV2ZXJ5b25lIG9uIHRoaXMgc2VydmVyLCBmYWxzZSA9IGRpc2FibGUAAQQAAAECABKjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAEAAADiAg8AxQECAgEAAAAwAQDbBwAAAIIAAgAQAwEDAgMDAwQDBQMGAwcDCAgFAAEAAAAC/////wMEAAAABQYAAAAH/////wMJAwoDCwMMAw0DDggDCwwAAAAADQAAAAMOAAAAAAEAARgAAAIAAAAAAAAAAwABAAD/AAABAAAAAACjvx0D6c3pHlb/qc1EEiNx06cKd5F7dwI=

-- https://lua.expert/
return {
	Name = "luckevent",
	Description = "Toggle the GLOBAL x2 Luck event (+100% luck for everyone, same as the weekend boost) across all servers, including ones that start later. true/on = enable, false/off = disable.",
	Group = "Admin",
	Aliases = { "x2luck", "luckboost" },
	Args = {
		{
			Type = "boolean",
			Name = "enabled",
			Description = "true = enable x2 luck for everyone on this server, false = disable"
		}
	}
}