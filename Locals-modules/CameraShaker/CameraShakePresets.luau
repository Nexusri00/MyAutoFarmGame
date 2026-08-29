-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMWA25ldxFQb3NpdGlvbkluZmx1ZW5jZRFSb3RhdGlvbkluZmx1ZW5jZQlTbWFsbEJ1bXAEQnVtcAlFeHBsb3Npb24KRWFydGhxdWFrZQdCYWRUcmlwDkhhbmRoZWxkQ2FtZXJhCVZpYnJhdGlvbgxSb3VnaERyaXZpbmcEdHlwZQhmdW5jdGlvbgVlcnJvchxObyBwcmVzZXQgZm91bmQgd2l0aCBpbmRleCAiASIHX19pbmRleAdyZXF1aXJlBnNjcmlwdAZQYXJlbnQTQ2FtZXJhU2hha2VJbnN0YW5jZQxzZXRtZXRhdGFibGUACgUAAQAAAA/7AAAATQAA7wAAAABvAQEAbwICAG8DAwBvBAQAnwAFAm8BBQAwAQByBgAAAG8BBwAwAQDsCAAAAIIAAgAJAwECZmZmZmZmAkACZmZmZmZmDkACmpmZmZmZuT8CmpmZmZmZ4T8HuB4FPrgeBT64HgU+AAAAAAMCB83MTD/NzEw/zcxMPwAAAAADAwAWBAEYAAAAAAAAAAABAAABAAABFwAAAAAFAAEAAAAP+wAAAE0AAO8AAAAAbwEBAIwCBABvAwIAbwQDAJ8ABQJvAQQAMAEAcgUAAABvAQYAMAEA7AcAAACCAAIACAMBAgAAAAAAAARAApqZmZmZmbk/AgAAAAAAAOg/B5qZGT6amRk+mpkZPgAAAAADAgcAAIA/AACAPwAAgD8AAAAAAwMAIAUBGAAAAAAAAAAAAQAAAQAAASEAAAAABQABAAAAD/sAAABNAADvAAAAAIwBBQCMAgoAjAMAAG8EAQCfAAUCbwECADABAHIDAAAAbwEEADABAOwFAAAAggACAAYDAQIAAAAAAAD4PwcAAIA+AACAPgAAgD4AAAAAAwIHAACAQAAAgD8AAIA/AAAAAAMDACoGARgAAAAAAAAAAAEAAAEAAAErAAAAAAUAAQAAAA/7AAAATQAA7wAAAABvAQEAbwICAIwDAgCMBAoAnwAFAm8BAwAwAQByBAAAAG8BBQAwAQDsBgAAAIIAAgAHAwECMzMzMzMz4z8CAAAAAAAADEAHAACAPgAAgD4AAIA+AAAAAAMCBwAAgD8AAIA/AACAQAAAAAADAwA0BwEYAAAAAAAAAAABAAABAAABNQAAAAAFAAEAAAAP+wAAAE0AAO8AAAAAjAEKAG8CAQCMAwUAjAQKAJ8ABQJvAQIAMAEAcgMAAABvAQQAMAEA7AUAAACCAAIABgMBAjMzMzMzM8M/BwAAAAAAAAAAmpkZPgAAAAADAgcAAABAAACAPwAAgEAAAAAAAwMAPggBGAAAAAAAAAAAAQAAAQAAAT8AAAAABQABAAAAD/sAAABNAADvAAAAAIwBAQBvAgEAjAMFAIwECgCfAAUCbwECADABAHIDAAAAbwEEADABAOwFAAAAggACAAYDAQIAAAAAAADQPwcAAAAAAAAAAAAAAAAAAAAAAwIHAACAPwAAAD8AAAA/AAAAAAMDAEgJARgAAAAAAAAAAAEAAAEAAAFJAAAAAAUAAQAAAA/7AAAATQAA7wAAAABvAQEAjAIUAIwDAgCMBAIAnwAFAm8BAgAwAQByAwAAAG8BBAAwAQDsBQAAAIIAAgAGAwECmpmZmZmZ2T8HAAAAAJqZGT4AAAAAAAAAAAMCBwAAoD8AAAAAAACAQAAAAAADAwBSCgEYAAAAAAAAAAABAAABAAABUwAAAAAFAAEAAAAP+wAAAE0AAO8AAAAAjAEBAIwCAgCMAwEAjAQBAJ8ABQJvAQEAMAEAcgIAAABvAQMAMAEA7AQAAACCAAIABQMBBwAAAAAAAAAAAAAAAAAAAAADAgcAAIA/AACAPwAAgD8AAAAAAwMAXAsBGAAAAAAAAAAAAQAAAQAAAV0AAAAACAIBAAAAFPsDAACHAgMBuygCA1IEAgCkAwEAAAAAQJ8DAgLwAwQAAgAAgFIDAgCfAwEAggMAAKQDBAAAADBAbwUFAFIGAQBvBwYAcwQFB58DAgGCAAEABwMMBAAAAEADDQMOBAAAMEADDwMQAGgRARgAAAEAAAAAAAABAAACAAAAAAAAAWkAAAAABgAAAQIAOKMAAACkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQHKBQAAAJ8AAgLiAQ4AwAIPABIAAAAwAgHgBgAAAMACEAASAAAAMAIBWwcAAADAAhEAEgAAADACAZYIAAAAwAISABIAAAAwAgEqCQAAAMACEwASAAAAMAIBtAoAAADAAhQAEgAAADACAb0LAAAAwAIVABIAAAAwAgF7DAAAAMACFgASAAAAMAIBNA0AAAD/AwAAAAAAAOIEGADABRkAEgABADAFBG4XAAAAnj0DAwQAAACkAhsAAACgQZ8CAwKCAgIAHAMSBAAAAEADEwQAACBAAxQDFQMEAwUDBgMHAwgDCQMKAwsFCAYHCAkKCwwNBgAGAQYCBgMGBAYFBgYGBwMRBQEXBggDFgQAAKBBCQABAgMEBQYHCAEAARgAEgAAAAAAAAAAAgEAAAAKAAAACgAAAAoAAAAKAAAACgAAAAoAAAAKAAAACwAAAQAAAAAA/wAAAAEAAAAACSwDEO6dedxf1C8Xv/W7qttcGweaHsd67w==

-- https://lua.expert/
local CameraShakeInstance = require(script.Parent.CameraShakeInstance)
local t = {
	SmallBump = function() --[[ SmallBump | Line: 22 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(2.3, 3.8, 0.1, 0.55)

		v1.PositionInfluence = Vector3.new(0.13, 0.13, 0.13)
		v1.RotationInfluence = Vector3.new(0.8, 0.8, 0.8)

		return v1
	end,
	Bump = function() --[[ Bump | Line: 32 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(2.5, 4, 0.1, 0.75)

		v1.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v1.RotationInfluence = Vector3.new(1, 1, 1)

		return v1
	end,
	Explosion = function() --[[ Explosion | Line: 42 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(5, 10, 0, 1.5)

		v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v1.RotationInfluence = Vector3.new(4, 1, 1)

		return v1
	end,
	Earthquake = function() --[[ Earthquake | Line: 52 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.6, 3.5, 2, 10)

		v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v1.RotationInfluence = Vector3.new(1, 1, 4)

		return v1
	end,
	BadTrip = function() --[[ BadTrip | Line: 62 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(10, 0.15, 5, 10)

		v1.PositionInfluence = Vector3.new(0, 0, 0.15)
		v1.RotationInfluence = Vector3.new(2, 1, 4)

		return v1
	end,
	HandheldCamera = function() --[[ HandheldCamera | Line: 72 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1, 0.25, 5, 10)

		v1.PositionInfluence = Vector3.new(0, 0, 0)
		v1.RotationInfluence = Vector3.new(1, 0.5, 0.5)

		return v1
	end,
	Vibration = function() --[[ Vibration | Line: 82 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.4, 20, 2, 2)

		v1.PositionInfluence = Vector3.new(0, 0.15, 0)
		v1.RotationInfluence = Vector3.new(1.25, 0, 4)

		return v1
	end,
	RoughDriving = function() --[[ RoughDriving | Line: 92 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1, 2, 1, 1)

		v1.PositionInfluence = Vector3.new(0, 0, 0)
		v1.RotationInfluence = Vector3.new(1, 1, 1)

		return v1
	end
}

return setmetatable({}, {
	__index = function(p1, p2) --[[ __index | Line: 104 | Upvalues: t (copy) ]]
		local v1 = t[p2]

		if type(v1) == "function" then
			return v1()
		end

		error("No preset found with index \"" .. p2 .. "\"")
	end
})