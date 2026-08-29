-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWUMc2V0bWF4cG9pbnRzB0FsaWFzZXMLRGVzY3JpcHRpb248U2V0IGEgcGxheWVyJ3MgU2tpbGwgVHJlZSBwb2ludHMgKE1hcmtzKSB0byBhbiBleGFjdCBhbW91bnQuBUdyb3VwBUFkbWluBEFyZ3MDc21wCHNldG1hcmtzBFR5cGUGcGxheWVyBnRhcmdldA1UYXJnZXQgcGxheWVyBm51bWJlcgZhbW91bnQ/TmV3IE1hcmtzIHZhbHVlIChza2lsbCB0cmVlIHBvaW50cyB0byBzcGVuZCBvbiB0aGUgc2tpbGwgdHJlZSkuAAEEAAABAgATowAAAOIACAD/AQAAAgAAAG8CCQBvAwoAxQECAwEAAAAwAQAnAgAAAP8BAAACAAAA4gIPAOIDEwDFAQIDAQAAADABANsHAAAAggACABQDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAADDwMQAxEIAwsQAAAAABEAAAADEgAAAAABAAEYAAACAAAAAAAAAAMAAQUAAPoAAAEAAAAAAKcqlvyUwo2i0xd8gLgu8MLXMoGIle78/Q==

-- https://lua.expert/
return {
	Name = "setmaxpoints",
	Description = "Set a player\'s Skill Tree points (Marks) to an exact amount.",
	Group = "Admin",
	Aliases = { "smp", "setmarks" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Target player"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "New Marks value (skill tree points to spend on the skill tree)."
		}
	}
}