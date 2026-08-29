-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOAklkC2Jvc3NfdGlja2V0BEl0ZW0LQm9zcyBUaWNrZXQEQ29zdAZpcGFpcnMFZXJyb3IhR29sZFNob3BEYXRhOiBkdXBsaWNhdGUgSXRlbSAnJXMnBmZvcm1hdAhDdXJyZW5jeQVNb25leQtNYXhRdWFudGl0eQRMaXN0BkJ5TmFtZQABCwAAAQAPAAADAwgPAQMIFwIDBx4BJ6MAAAD/AAAAAQAAAOIBBgDFAAECAQAAAP8BAAAAAAAApAIIAAAAcEBSAwAAnwICBFECEgBNCAbKAgAAAIcHAQhHBwsAAAAAAKQHCgAAAJBAbwgLAE0KBsoCAAAAvAgIjQwAAACfCAMCjAkAAJ8HAwFNBwbKAgAAAGoGAQduAu3/AgAAgOICEwAwAALrEQAAADABApESAAAAggICABQDAQMCAwMDBAMFAgAAAAAATN1ACAMAAQAAAAIDAAAABAUAAAADBgQAAHBAAwcEAACQQAMIAwkDCgMLAwwCAAAAAAA4j0ADDQMOCAQNDgAAAA8QAAAAEf////8S/////wABAAEYABQAAQAAAwABAAAAAAEAAAAAAQAAAAAAAAAAAAIAAPwABwMAAQADAQAAAAAAfI+875Ouv60y3a/eUd3XyAyXq5tOS9bu

-- https://lua.expert/
local list = {
	{
		Id = "boss_ticket",
		Item = "Boss Ticket",
		Cost = 30000
	}
}
local t = {}

for i, v in ipairs(list) do
	if t[v.Item] ~= nil then
		error(("GoldShopData: duplicate Item \'%s\'"):format(v.Item), 0)
	end

	t[v.Item] = v
end

return {
	Currency = "Money",
	MaxQuantity = 999,
	List = list,
	ByName = t
}