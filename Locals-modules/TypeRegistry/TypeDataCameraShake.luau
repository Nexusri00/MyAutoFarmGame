-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMzCEJhc2VQYXJ0A0lzQQ1Jc0NhbWVyYVNoYWtlDEdldEF0dHJpYnV0ZRJQYXJ0SWNsZVByb3BlcnRpZXMORmluZEZpcnN0Q2hpbGQKY2xhc3NDaGVjaw5TaGFrZUFtcGxpdHVkZRFTaGFrZVJvdEFtcGxpdHVkZQlUaW1lc2NhbGUOU2hha2VGcmVxdWVuY3kMU2hha2VGYWxsb2ZmCExpZmV0aW1lBFJhdGUHRW5hYmxlZA5Ub3RhbEtleUZyYW1lcwR0eXBlDk51bWJlclNlcXVlbmNlB2RlZmF1bHQDbmV3Bm51bWJlcgtub25OZWdhdGl2ZQtOdW1iZXJSYW5nZQdib29sZWFuFUNhbWVyYVNoYWtlUHJvcGVydGllcwtDYW1lcmFTaGFrZQlwRGF0YVR5cGUJdWlTZWN0aW9uDUNhbWVyYSBTaGFrZXMKcHJvcGVydGllcwZyZXNpemUGcmV0aW1lCWNsaXBib2FyZAtzY2FsZUdyYXBocwxzY2FsZU51bWJlcnMPbXVsdGlwbHlOdW1iZXJzDGRpdmlkZVJhbmdlcwRuYW1lCFNwYXduaW5nBXByb3BzCEVtaXNzaW9uCUVtaXRDb3VudAlFbWl0RGVsYXkMRW1pdER1cmF0aW9uBVNoYWtlCEFkdmFuY2VkBkV2ZW50cwZPbkVtaXQHT25EZWF0aA1PbkRlc3RydWN0aW9uBVR5cGVzAAIFAQAAAAAVbwMAALwBAP4BAAAAnwEDAg4BDwCpAQAAbwQCALwCABIDAAAAnwIDAioCCQABAACAbwQEALwCAAMFAAAAnwIDAkcCAgAAAACAqQEAAakBAQCCAQIABgMBAwIDAwMEAwUDBgAjBwEYAAAAAAAAAAAAAAAAAQAAAAAAAAAAJAAAAAANAAABAgChAaMAAAD/AAIAAAAAAOIBCQDiAg0ApAMPAAA4sICMBAEAnwMCAjADAhoMAAAAMAIBjAAAAADiAg0ApAMPAAA4sIBvBBAAnwMCAjADAhoMAAAAMAIBxwEAAADiAg0ApAMPAAA4sICMBAEAnwMCAjADAhoMAAAAMAIBowIAAADiAhMAMAIBWAMAAADiAhcAMAIBdwQAAADiAhkApAMaAAA4gIFvBBsAnwMCAjADAhoMAAAAMAIBywUAAADiAhMAMAIB9gYAAADiAh4AMAIB8AcAAADiAiAAMAIB1AgAAAAwAQA9IQAAAOIBIwDiAiwAwAMtADADAjwkAAAATQMAPSEAAAAwAwIlKAAAAOIDMAD/BAAAAQAAAG8FAADFBAUCAQAAADAEA8guAAAA/wQAAAEAAABvBQQAxQQFAgEAAAAwBAOwLwAAADADAi4pAAAA4gMzAP8EAAACAAAAbwUGAG8GAwDFBAUDAQAAADAEA54xAAAA/wQAAAEAAABvBQUAxQQFAgEAAAAwBAMnMgAAADADAiUqAAAA/wMAAAUAAADiBDcA/wUAAAIAAABvBgYAbwcFAMUFBgMBAAAAMAUEBzYAAADiBTkA/wYAAAMAAABvBzoAbwg7AG8JPADFBgcEAQAAADAGBQc2AAAA4gY+AP8HAAAEAAAAbwgAAG8JAQBvCgMAbwsEAMUHCAUBAAAAMAcGBzYAAADiB0AA/wgAAAIAAABvCQgAbwoCAMUICQMBAAAAMAgHBzYAAADiCEIA/wkAAAMAAABvCkMAbwtEAG8MRQDFCQoEAQAAADAJCAc2AAAAxQMEBgEAAAAwAwLLKwAAADACAToiAAAAMAEA70YAAACCAAIARwMIAwkDCgMLAwwDDQMOAw8DEAUJAAECAwQFBgcIAxEDEgMTCAIKCwAAAAz/////AxQEADiwgAIzMzMzMzPjPwMVAgAAAAAAACRACAIKEQAAAAwSAAAAAgAAAAAAAAAAAxYBAQgDChEAAAAMFAAAABUWAAAAAxcIAgoYAAAADP////8EADiAgQIAAAAAAADgPwMYAQAIAgocAAAADB0AAAACAAAAAAAAWUAIAgoRAAAADB8AAAADGQMaBQEiAwcDGwMcAx0DHgMfAyADIQgHJP////8lIgAAACYnAAAAKP////8p/////yr/////K/////8GAAMiAyMFAi4vAyQDJQUCMTIDJgMnAygIAjQ1AAAANv////8DKQgCNDgAAAA2/////wMqAysDLAMtCAI0PQAAADb/////Ay4IAjQ/AAAANv////8DLwgCNEEAAAA2/////wMwAzEDMgMzAQABAAEYAAoAAgIAAAAAAAAAAAEAAAAAAAAAAAEAAAAAAAAAAAMAAAIAAAIAAAAAAAAAAAEAAAEAAAEAAPIAEQEEAAAGAAAAAgEAAAAAAAABAAAAAAAA/gAFAQAAAAAAAAABAAAAAAAA/gAEAAEAAAAAAAAAAAEAAAAAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAEAAAAAAAAAAAAAAPsA6wD/ACABAAAAAAEG4BYo4MlsuWVKZo61DCyrdvgBXDQkfCk=

-- https://lua.expert/
local t = {
	CameraShakeProperties = {
		ShakeAmplitude = {
			type = "NumberSequence",
			default = NumberSequence.new(1)
		},
		ShakeRotAmplitude = {
			type = "NumberSequence",
			default = NumberSequence.new(0.6)
		},
		Timescale = {
			type = "NumberSequence",
			default = NumberSequence.new(1)
		},
		ShakeFrequency = {
			type = "number",
			default = 10
		},
		ShakeFalloff = {
			type = "number",
			default = 0,
			nonNegative = true
		},
		Lifetime = {
			type = "NumberRange",
			default = NumberRange.new(0.5)
		},
		Rate = {
			type = "number",
			default = 10
		},
		Enabled = {
			type = "boolean",
			default = false
		},
		TotalKeyFrames = {
			type = "number",
			default = 100
		}
	}
}

t.Types = {
	CameraShake = {
		pDataType = "CameraShake",
		uiSection = "Camera Shakes",
		classCheck = function(p1) --[[ classCheck | Line: 35 ]]
			return p1:IsA("BasePart") and (if p1:GetAttribute("IsCameraShake") == true then p1:FindFirstChild("PartIcleProperties") ~= nil else false)
		end,
		properties = t.CameraShakeProperties,
		resize = {
			scaleGraphs = { "ShakeAmplitude" },
			scaleNumbers = { "ShakeFalloff" }
		},
		retime = {
			multiplyNumbers = { "Rate", "ShakeFrequency" },
			divideRanges = { "Lifetime" }
		},
		clipboard = {
			{
				name = "Spawning",
				props = { "Rate", "Lifetime" }
			},
			{
				name = "Emission",
				props = { "EmitCount", "EmitDelay", "EmitDuration" }
			},
			{
				name = "Shake",
				props = { "ShakeAmplitude", "ShakeRotAmplitude", "ShakeFrequency", "ShakeFalloff" }
			},
			{
				name = "Advanced",
				props = { "TotalKeyFrames", "Timescale" }
			},
			{
				name = "Events",
				props = { "OnEmit", "OnDeath", "OnDestruction" }
			}
		}
	}
}

return t