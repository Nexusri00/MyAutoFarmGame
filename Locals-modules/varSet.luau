-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUCXZhcnNfdXNlZAhHZXRTdG9yZQlDbGllbnRSdW4ETmFtZQR2YXI9B0FsaWFzZXMLRGVzY3JpcHRpb24UU2V0cyBhIHN0b3JlZCB2YWx1ZS4FR3JvdXALRGVmYXVsdFV0aWwEQXJncwRUeXBlCXN0b3JlZEtleQNLZXmpAVRoZSBrZXkgdG8gc2V0LCBzYXZlZCBpbiB5b3VyIHVzZXIgZGF0YSBzdG9yZS4gS2V5cyBwcmVmaXhlZCB3aXRoIC4gYXJlIG5vdCBzYXZlZC4gS2V5cyBwcmVmaXhlZCB3aXRoICQgYXJlIGdhbWUtd2lkZS4gS2V5cyBwcmVmaXhlZCB3aXRoICQuIGFyZSBnYW1lLXdpZGUgYW5kIG5vbi1zYXZlZC4Gc3RyaW5nBVZhbHVlF1ZhbHVlIG9yIHZhbHVlcyB0byBzZXQuB0RlZmF1bHQAAAIFAgAAAAAHbwQAALwCAFUBAAAAnwIDAqkDAQBqAwIBggABAAIDAQMCABQDARgAAAAAAAABFQAAAAAEAAABAgASowAAAOIACQD/AQAAAAAAADABACcCAAAA/wEAAAIAAADiAg4A4gMUAMUBAgMBAAAAMAEA2wcAAADAARUAMAEAMwgAAACCAAIAFgMEAwUDBgMHAwgDCQMKAwsDAwgGAAEAAAAC/////wMEAAAABQYAAAAH/////wj/////AwwDDQMOAw8IAwoLAAAAAAwAAAADDQAAAAMQAxEDEgMTAxQIBAoPAAAAABAAAAADEQAAABITAAAABgABAAEAARgAAAIAAAADAAEFAAD6AA4AAAABAAAAAAFMhKyyL3GpKpR4TeA0Jz/UPJy7xn5AxrM=

-- https://lua.expert/
return {
	Name = "var=",
	Description = "Sets a stored value.",
	Group = "DefaultUtil",
	Aliases = {},
	Args = {
		{
			Type = "storedKey",
			Name = "Key",
			Description = "The key to set, saved in your user data store. Keys prefixed with . are not saved. Keys prefixed with $ are game-wide. Keys prefixed with $. are game-wide and non-saved."
		},
		{
			Type = "string",
			Name = "Value",
			Description = "Value or values to set.",
			Default = ""
		}
	},
	ClientRun = function(p1, p2) --[[ ClientRun | Line: 20 ]]
		p1:GetStore("vars_used")[p2] = true
	end
}