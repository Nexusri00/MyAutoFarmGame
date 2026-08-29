-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMNBE5hbWUIYW5ub3VuY2UHQWxpYXNlcwtEZXNjcmlwdGlvbiFNYWtlcyBhIHNlcnZlci13aWRlIGFubm91bmNlbWVudC4FR3JvdXAMRGVmYXVsdEFkbWluBEFyZ3MBbQRUeXBlBnN0cmluZwR0ZXh0FlRoZSBhbm5vdW5jZW1lbnQgdGV4dC4AAQMAAAECABGjAAAA4gAIAP8BAAABAAAAbwIJAMUBAgIBAAAAMAEAJwIAAAD/AQAAAQAAAOICDgDFAQICAQAAADABANsHAAAAggACAA8DAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQgDCgsAAAAADAAAAAMNAAAAAAEAARgAAAIAAAAAAAADAAEAAP8AAAEAAAAAAMRdHo2PLY5yRLcYZwTq8Mq0RQn59pl0jA==

-- https://lua.expert/
return {
	Name = "announce",
	Description = "Makes a server-wide announcement.",
	Group = "DefaultAdmin",
	Aliases = { "m" },
	Args = {
		{
			Type = "string",
			Name = "text",
			Description = "The announcement text."
		}
	}
}