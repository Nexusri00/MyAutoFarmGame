-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMVBE5hbWUIZ2l2ZWl0ZW0HQWxpYXNlcwtEZXNjcmlwdGlvbilHaXZlIGFuIGl0ZW0gdG8gYSBwbGF5ZXIgKHNhdmVkIHRvIGRhdGEpLgVHcm91cAVBZG1pbgRBcmdzBWdyYW50CWdyYW50aXRlbQRUeXBlBnBsYXllcgZ0YXJnZXQWUGxheWVyIHRvIHJlY2VpdmUgaXRlbQhpdGVtbmFtZQRpdGVtMUl0ZW0gbmFtZSAobXVzdCBleGlzdCBpbiBfRy5JdGVtRGF0YS9fRy5Ub29sRGF0YSkGbnVtYmVyBmFtb3VudBJBbW91bnQgKGRlZmF1bHQgMSkIT3B0aW9uYWwAAQUAAAECABSjAAAA4gAIAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcCAAAA/wEAAAMAAADiAg8A4gMTAOIEGQDFAQIEAQAAADABANsHAAAAggACABoDAQMCAwMDBAMFAwYDBwMICAUAAQAAAAL/////AwQAAAAFBgAAAAf/////AwkDCgMLAwwDDQMOCAMLDAAAAAANAAAAAw4AAAADDwMQAxEIAwsQAAAAABEAAAADEgAAAAMSAxMDFAMVAQEIBAsUAAAAABUAAAADFgAAABcYAAAAAAEAARgAAAIAAAAAAAAAAwABBQUAAPUAAAEAAAAAAOPkf3P5V2nk00qwXnoEtYOT/GgH0SAVcg==

-- https://lua.expert/
return {
	Name = "giveitem",
	Description = "Give an item to a player (saved to data).",
	Group = "Admin",
	Aliases = { "grant", "grantitem" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to receive item"
		},
		{
			Type = "itemname",
			Name = "item",
			Description = "Item name (must exist in _G.ItemData/_G.ToolData)"
		},
		{
			Type = "number",
			Name = "amount",
			Description = "Amount (default 1)",
			Optional = true
		}
	}
}