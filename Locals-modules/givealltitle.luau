-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbitHaXZlIGFsbCB0aXRsZSB0byBhIHBsYXllciAoc2F2ZWQgdG8gZGF0YSkuBUdyb3VwBUFkbWluBEFyZ3MGc2NyaXB0BWdyYW50CWdyYW50aXRlbQRUeXBlBnBsYXllcgZ0YXJnZXQWUGxheWVyIHRvIHJlY2VpdmUgaXRlbQABBAAAAQIAGKMAAADiAAcApAEJAAAAgEBNAQG6AAAAADABALoAAAAA/wEAAAIAAABvAgoAbwMLAMUBAgMBAAAAMAEAJwEAAAD/AQAAAQAAAOICEADFAQICAQAAADABANsGAAAAggACABEDAQMCAwMDBAMFAwYDBwgFAP////8B/////wIDAAAABAUAAAAG/////wMIBAAAgEADCQMKAwsDDAMNAw4IAwwNAAAAAA4AAAACDwAAAAABAAEYAAABAAAAAAABAAAAAAAAAAMAAQAA/wAAAQAAAAAAYYEJPptAXyS/GeJKXx70KxGZHkpTRWM/

-- https://lua.expert/
return {
	Description = "Give all title to a player (saved to data).",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "grant", "grantitem" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive item"
		}
	}
}