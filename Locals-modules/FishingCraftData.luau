-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMSBlJlc3VsdApBbmdsZXIgUm9kBkFtb3VudAtEaXNwbGF5SWNvbgRDb3N0CU1hdGVyaWFscw1NYXRlcmlhbEljb25zC0xheW91dE9yZGVyBU1vbmV5BVRyb3V0DEdvbGRlbiBTY2FsZQxEZWVwIExhbnRlcm4UUm95YWwgU2VhaG9yc2UgQ3Jlc3QKQW5nZWwgRmlzaAtDb3JhbCBQZWFybAlTZWEgR2xhc3MOU2VhIERyYWdvbiBSb2QHUmVjaXBlcwABBQAAAQIAbqMAAAD/AAEAAAAAAP8BAwAAAAAA4gIKAOIDDQAwAwIjBgAAAP8DAwAAAAAAjAQIADAEAxcOAAAAjAQKADAEA8wPAAAAjAQBADAEA0cQAAAAMAMCWgcAAAD/AwMAAAAAAG8EBQAwBAMXDgAAAG8EEQAwBAPMDwAAAG8EEQAwBANHEAAAADADAngIAAAAMAIBbQEAAADiAhQA4gMWADADAiMGAAAA/wMDAAAAAACMBAMAMAQDBRcAAACMBAoAMAQDQBgAAACMBBQAMAQD6hkAAAAwAwJaBwAAAP8DAwAAAAAAbwQRADAEAwUXAAAAbwQRADAEA0AYAAAAbwQRADAEA+oZAAAAMAMCeAgAAAAwAgHJEgAAAOICHADiAx4AMAMCIwYAAAD/AwMAAAAAAIwEAQAwBAPJEgAAAIwEBQAwBAMFFwAAAIwECgAwBANAGAAAAIwEDwAwBAPqGQAAADADAloHAAAA/wMDAAAAAABvBBEAMAQDyRIAAABvBBEAMAQDBRcAAABvBBEAMAQDQBgAAABvBBEAMAQD6hkAAAAwAwJ4CAAAADACAZsaAAAAMAEARR8AAACCAAIAIAMBAwIDAwIAAAAAAADwPwMEAsBG92nXQNpCAwUDBgMHAwgIBwABAAAAAgMAAAAEBQAAAAb/////B/////8I/////wkDAAAAAwkCAAAAAICEHkEIAQsMAAAAAwoDCwMMAkBtPyE7ddlCAw0CAAAAAAAAAEAIBwASAAAAAgMAAAAEEQAAAAb/////B/////8I/////wkTAAAAAgAAAABg4yZBCAELFQAAAAMOAw8DEAMRAgAAAAAAAAhACAcAGgAAAAIDAAAABBEAAAAG/////wf/////CP////8JGwAAAAIAAAAAgIQ+QQgBCx0AAAADEgABAAEYAAAAAgABBAAAAwABAAABAAABAAD9AAUAAQAAAQAAAQAA/QD0ABQEAAADAAEAAAEAAAEAAP0ABQABAAABAAABAAD9APQAFAQAAAMAAQAAAQAAAQAAAQAA/AAGAAEAAAEAAAEAAAEAAPwA8wDXAEABAAAAAAD7LobVfbEjpk8/WHBwWa4HizaRocnq7NQ=

-- https://lua.expert/
return {
	Recipes = {
		["Angler Rod"] = {
			Result = "Angler Rod",
			Amount = 1,
			DisplayIcon = 115463177100571,
			LayoutOrder = 1,
			Cost = {
				Money = 500000
			},
			Materials = {
				Trout = 8,
				["Golden Scale"] = 10,
				["Deep Lantern"] = 1
			},
			MaterialIcons = {
				Trout = 115463177100571,
				["Golden Scale"] = 111965175610805,
				["Deep Lantern"] = 111965175610805
			}
		},
		["Royal Seahorse Crest"] = {
			Result = "Royal Seahorse Crest",
			Amount = 1,
			DisplayIcon = 111965175610805,
			LayoutOrder = 2,
			Cost = {
				Money = 750000
			},
			Materials = {
				["Angel Fish"] = 3,
				["Coral Pearl"] = 10,
				["Sea Glass"] = 20
			},
			MaterialIcons = {
				["Angel Fish"] = 111965175610805,
				["Coral Pearl"] = 111965175610805,
				["Sea Glass"] = 111965175610805
			}
		},
		["Sea Dragon Rod"] = {
			Result = "Sea Dragon Rod",
			Amount = 1,
			DisplayIcon = 111965175610805,
			LayoutOrder = 3,
			Cost = {
				Money = 2000000
			},
			Materials = {
				["Royal Seahorse Crest"] = 1,
				["Angel Fish"] = 5,
				["Coral Pearl"] = 10,
				["Sea Glass"] = 15
			},
			MaterialIcons = {
				["Royal Seahorse Crest"] = 111965175610805,
				["Angel Fish"] = 111965175610805,
				["Coral Pearl"] = 111965175610805,
				["Sea Glass"] = 111965175610805
			}
		}
	}
}