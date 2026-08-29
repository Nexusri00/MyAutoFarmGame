-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMqCExpZ2h0aW5nCkF0bW9zcGhlcmULQmxvb21FZmZlY3QVQ29sb3JDb3JyZWN0aW9uRWZmZWN0EkRlcHRoT2ZGaWVsZEVmZmVjdA1TdW5SYXlzRWZmZWN0A1NreQZDbG91ZHMKQnJpZ2h0bmVzcxRFeHBvc3VyZUNvbXBlbnNhdGlvbhJHZW9ncmFwaGljTGF0aXR1ZGUXRW52aXJvbm1lbnREaWZmdXNlU2NhbGUYRW52aXJvbm1lbnRTcGVjdWxhclNjYWxlB0FtYmllbnQOT3V0ZG9vckFtYmllbnQOQ29sb3JTaGlmdF9Ub3ARQ29sb3JTaGlmdF9Cb3R0b20HRGVuc2l0eQZPZmZzZXQFQ29sb3IFRGVjYXkFR2xhcmUESGF6ZQlJbnRlbnNpdHkEU2l6ZQlUaHJlc2hvbGQIQ29udHJhc3QKU2F0dXJhdGlvbglUaW50Q29sb3INRm9jdXNEaXN0YW5jZQ1JbkZvY3VzUmFkaXVzDU5lYXJJbnRlbnNpdHkMRmFySW50ZW5zaXR5BlNwcmVhZBRDZWxlc3RpYWxCb2RpZXNTaG93bgVDb3ZlcgZDb2xvcjMHZnJvbVJHQgpCbHVyRWZmZWN0DFByb3BlcnR5TGlzdA1EZWZhdWx0UHJlc2V0C0Jvb2xlYW5MaXN0AAELAAABAgCqAaMAAADiAAgA/wEAAAkAAABvAgkAbwMKAG8ECwBvBQwAbwYNAG8HDgBvCA8AbwkQAG8KEQDFAQIKAQAAADABAKQAAAAA/wEAAAYAAABvAhIAbwMTAG8EFABvBRUAbwYWAG8HFwDFAQIHAQAAADABALwBAAAA/wEAAAMAAABvAhgAbwMZAG8EGgDFAQIEAQAAADABAAwCAAAA/wEAAAQAAABvAgkAbwMbAG8EHABvBR0AxQECBQEAAAAwAQC6AwAAAP8BAAAEAAAAbwIeAG8DHwBvBCAAbwUhAMUBAgUBAAAAMAEAWgQAAAD/AQAAAgAAAG8CGABvAyIAxQECAwEAAAAwAQDoBQAAAP8BAAABAAAAbwIjAMUBAgIBAAAAMAEAugYAAAD/AQAAAwAAAG8CJABvAxIAbwQUAMUBAgQBAAAAMAEAjwcAAADiASUA4gIpAKQDLAAArKCCjASAAIwFgACMBoAAnwMEAjADAjoOAAAApAMsAACsoIKMBIAAjAWAAIwGgACfAwQCMAMCmw8AAACkAywAAKyggowEAACMBQAAjAYAAJ8DBAIwAwKOEAAAAKQDLAAArKCCjAQAAIwFAACMBgAAnwMEAjADAgERAAAAMAIBpAAAAADiAi0ApAMsAACsoIKMBMcAjAXHAIwGxwCfAwQCMAMCpBQAAACkAywAAKyggowE/wCMBf8AjAb/AJ8DBAIwAwIlFQAAADACAbwBAAAA4gIvADACAboGAAAA4gIwADACAegFAAAA4gIxAKQDLAAArKCCjAT/AIwF/wCMBv8AnwMEAjADAqQUAAAAMAIBjwcAAAD/AgAABAAAAG8DAgBvBAMAbwUEAG8GMgDFAgMFAQAAAOIDNgAwAAPUMwAAADABA7o0AAAAMAIDBzUAAACCAwIANwMBAwIDAwMEAwUDBgMHAwgFCAABAgMEBQYHAwkDCgMLAwwDDQMOAw8DEAMRAxIDEwMUAxUDFgMXAxgDGQMaAxsDHAMdAx4DHwMgAyEDIgMjAyQFBQABBgUHAgAAAAAAAABAAgAAAAAAAAAAAgAAAAAAAPA/CAkJJgAAAAonAAAACycAAAAMKAAAAA0oAAAADv////8P/////xD/////Ef////8DJQMmBACsoIIIBhInAAAAEycAAAAU/////xX/////FicAAAAXJwAAAAEACAEjLgAAAAgCGCcAAAAiJwAAAAgDJCcAAAASJwAAABT/////AycDKAMpAyoFAzM0NQABAAEYAAABAAEBAQEBAQEBAQAA9wAMAAEBAQEBAQAA+gAJAAEBAQAA/QAGAAEBAQEAAPwABwABAQEBAAD8AAcAAQEAAP4ABQABAAD/AAQAAQEBAAD9AAcBBgAAAAAAAAABAAAAAAAAAAEAAAAAAAAAAQAAAAAAAAD3AAwDAAAAAAAAAAEAAAAAAAAA/AAJAAAEAAAFAwAAAAAAAAD9AAcAAQAAAQAAAwEAAQABAAABAAAAAACDuSnkcSEHYWCgs6xzL9BJ86E+kLF9Q+U=

-- https://lua.expert/
return {
	PropertyList = {
		Lighting = {
			"Brightness",
			"ExposureCompensation",
			"GeographicLatitude",
			"EnvironmentDiffuseScale",
			"EnvironmentSpecularScale",
			"Ambient",
			"OutdoorAmbient",
			"ColorShift_Top",
			"ColorShift_Bottom"
		},
		Atmosphere = { "Density", "Offset", "Color", "Decay", "Glare", "Haze" },
		BloomEffect = { "Intensity", "Size", "Threshold" },
		ColorCorrectionEffect = { "Brightness", "Contrast", "Saturation", "TintColor" },
		DepthOfFieldEffect = { "FocusDistance", "InFocusRadius", "NearIntensity", "FarIntensity" },
		SunRaysEffect = { "Intensity", "Spread" },
		Sky = { "CelestialBodiesShown" },
		Clouds = { "Cover", "Density", "Color" }
	},
	DefaultPreset = {
		Lighting = {
			Brightness = 2,
			ExposureCompensation = 0,
			GeographicLatitude = 0,
			EnvironmentDiffuseScale = 1,
			EnvironmentSpecularScale = 1,
			Ambient = Color3.fromRGB(128, 128, 128),
			OutdoorAmbient = Color3.fromRGB(128, 128, 128),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
		},
		Atmosphere = {
			Density = 0,
			Offset = 0,
			Glare = 0,
			Haze = 0,
			Color = Color3.fromRGB(199, 199, 199),
			Decay = Color3.fromRGB(255, 255, 255)
		},
		Sky = {
			CelestialBodiesShown = false
		},
		SunRaysEffect = {
			Intensity = 0,
			Spread = 0
		},
		Clouds = {
			Cover = 0,
			Density = 0,
			Color = Color3.fromRGB(255, 255, 255)
		}
	},
	BooleanList = { "BloomEffect", "ColorCorrectionEffect", "DepthOfFieldEffect", "BlurEffect" }
}