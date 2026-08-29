-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWUNY29tcGxldGVxdWVzdAdBbGlhc2VzC0Rlc2NyaXB0aW9uSkluc3RhbnRseSBjb21wbGV0ZSB0aGUgcGxheWVyJ3MgcGlubmVkL3RyYWNrZWQgcXVlc3QgYW5kIGNsYWltIGl0cyByZXdhcmQuBUdyb3VwBUFkbWluBEFyZ3MCY3ELZmluaXNocXVlc3QEVHlwZQZwbGF5ZXIGdGFyZ2V0MFBsYXllciB3aG9zZSBwaW5uZWQvdHJhY2tlZCBxdWVzdCBnZXRzIGNvbXBsZXRlZAABBAAAAQIAEqMAAADiAAgA/wEAAAIAAABvAgkAbwMKAMUBAgMBAAAAMAEAJwIAAAD/AQAAAQAAAOICDwDFAQICAQAAADABANsHAAAAggACABADAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAAAAQABGAAAAgAAAAAAAAADAAEAAP8AAAEAAAAAAK7rymh5CLZmw3G+NUkUHf3e890cnC+gaQ==

-- https://lua.expert/
return {
	Name = "completequest",
	Description = "Instantly complete the player\'s pinned/tracked quest and claim its reward.",
	Group = "Admin",
	Aliases = { "cq", "finishquest" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player whose pinned/tracked quest gets completed"
		}
	}
}