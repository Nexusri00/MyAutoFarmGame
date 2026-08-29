-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBE5hbWURdG91cm5hbWVudGJyYWNrZXQHQWxpYXNlcwtEZXNjcmlwdGlvbjdTZW5kIGFuIEVjbGlwc2UgQ2hhbXBpb25zaGlwIGJyYWNrZXQgcm9zdGVyIHRvIERpc2NvcmQuBUdyb3VwBUFkbWluBEFyZ3MDdGJsBXRibG9nBFR5cGUGbnVtYmVyB2JyYWNrZXQOQnJhY2tldCBudW1iZXIEd2VlayVUb3VybmFtZW50IHdlZWsgKGRlZmF1bHRzIHRvIGN1cnJlbnQpCE9wdGlvbmFsAAEEAAABAgATowAAAOIACAD/AQAAAgAAAG8CCQBvAwoAxQECAwEAAAAwAQAnAgAAAP8BAAACAAAA4gIPAOIDFADFAQIDAQAAADABANsHAAAAggACABUDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAADDwMQAxEBAQgECwwAAAAAEAAAAAMRAAAAEhMAAAAAAQABGAAAAgAAAAAAAAADAAEFAAD6AAABAAAAAABtIKzoquOrlZynaosbw8qCHTi7nF/kxuk=

-- https://lua.expert/
return {
	Name = "tournamentbracket",
	Description = "Send an Eclipse Championship bracket roster to Discord.",
	Group = "Admin",
	Aliases = { "tbl", "tblog" },
	Args = {
		{
			Type = "number",
			Name = "bracket",
			Description = "Bracket number"
		},
		{
			Type = "number",
			Name = "week",
			Description = "Tournament week (defaults to current)",
			Optional = true
		}
	}
}