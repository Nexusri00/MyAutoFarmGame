-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMZCEdldFNjYWxlFUNhbWVyYU1pblpvb21EaXN0YW5jZRVDYW1lcmFNYXhab29tRGlzdGFuY2UHVmVjdG9yMwNuZXcMQ2FtZXJhT2Zmc2V0BlBhcmVudAVwY2FsbAR0eXBlBm51bWJlcgRtYXRoA2FicwNtYXgFYXBwbHkEdGFzawR3YWl0BGdhbWUHUGxheWVycwpHZXRTZXJ2aWNlClJ1blNlcnZpY2ULTG9jYWxQbGF5ZXIGc2NyaXB0CEh1bWFub2lkFUZpbmRGaXJzdENoaWxkT2ZDbGFzcwVzcGF3bgAGAgABAAAABfsAAAC8AADlAAAAAJ8AAgCCAAAAAQMBAB0AARgAAAAAAB0AAAAABAAEAAAADfsAAAD7AgEA+wMCAAkBAgMwAQCEAAAAAPsAAAD7AgMA+wMCAAkBAgMwAQCkAQAAAIIAAQACAwIDAwAhAAEYAAAAAAAAAQAAAAAAASIAAAAABwADAAAHAAABCAMKAQ77AAAA+wIBAIwEAAD7BgIAWwUGAIwGAABMNgACpAMDAAAIEICfAwQCQwECAzABAG0EAAAAggABAAUCAAAAAAAAAEADBAMFBAAIEIADBgAoAAEYAAAAAAAAAAAAAAAAAAEpAAAAAAUABwAAAEL7AAAADgAEAPsAAABNAAAkAAAAACsAAQCCAAEApAACAAAAEEDAAQMAEgIAAJ8AAgMOAAoAuygBA1IDAQCkAgUAAABAQJ8CAgLwAgQABgAAgIwCAAB9AQIAAgAAAIIAAQD7BAEAJgMBBLsCAwKkAgkAACBwgJ8CAgJvAwoAYAICAAMAAACCAAEA3gEBAKQCAgAAABBA2QMBABICAgASAgMAEgABABICBACfAgIB+wIFAA4CFAD7AgUATQICJAAAAAAOAhAA+wIGAA4CDgCMAwAAeAQBC54SAwMEAAAApAINAAAwcICfAgMCpAMCAAAAEEDZBAIAEgIFABICBgASAAIAnwMCAYIAAQAOAwcDCAQAABBABgADCQQAAEBAAwoDCwMMBAAgcIACexSuR+F6hD8CAAAAAAAA8D8DDQQAMHCAAwABAhsOARgAAAAAAAAAAQAAAAABAAAAAAAAAAAAAAABAAAAAAAAAAAAAQEAAAAAAAAABQAAAAAAAAABAAAAAAAAAQAAAAAAAAQcAAAAAAIAAgAAAAz7AAAATQAAJAAAAAAOAAcA+wABAJ8AAQGkAAMAAAgQgG8BBACfAAIBSAD1/4IAAQAFAwcDDwMQBAAIEIACAAAAAAAA0D8AMAABGAAAAAABAAEAAAD+BDEAAAAADAAAAQIAO6MAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwJNAgAxBQAAAKQDBwAAAGBATQMDJAgAAABNBAKECQAAAE0FAqQKAAAAjAYAAH0EAgAGAAAAbwQLAIwGAAB9BQIABgAAAIwFgACMBgAAbwkMALwHA7gNAAAAnwcDAg4HAwBNCAdtDgAAACsIAQDGCAAA2QkAABIAAwASAQb/EgACABIBBP8SAQX/EgAHABIACABSCgkAnwoBAaQKEQAAQPCAwAsSABIAAwASAAkAnwoCAcEEAACCAAEAEwMRBAAAAEADEgMTAxQDFQMWBAAAYEADBwMCAwMCAAAAAAAA4D8DFwMYAwYDDwMZBABA8IAGBAIDBAEAARgABQAAAAAAAQAAAAAAAgABAAAABwABAAEAAAABAAAAAgIAAAABAAAAAAIAAAAAAAAAEwACAAAAAAAGAAEAAAAABerPW2YdnW6rY3FntWMiXbaa10wS2AsxZw==

-- https://lua.expert/
local Players = game:GetService("Players")

game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local v1 = script.Parent
local CameraMinZoomDistance = LocalPlayer.CameraMinZoomDistance
local CameraMaxZoomDistance = LocalPlayer.CameraMaxZoomDistance

if CameraMinZoomDistance <= 0 then
	CameraMinZoomDistance = 0.5
end

if CameraMaxZoomDistance <= 0 then
	CameraMaxZoomDistance = 128
end

local v2 = 0
local Humanoid = v1:FindFirstChildOfClass("Humanoid")
local v3 = Humanoid and Humanoid.CameraOffset or nil

local function apply() --[[ apply | Line: 27 | Upvalues: v1 (copy), v2 (ref), LocalPlayer (copy), CameraMinZoomDistance (ref), CameraMaxZoomDistance (ref), Humanoid (copy), v3 (copy) ]]
	if not (v1 and v1.Parent) then
		return
	end

	local ok, result = pcall(function() --[[ Line: 29 | Upvalues: v1 (ref) ]]
		return v1:GetScale()
	end)

	if not ok or (type(result) ~= "number" or result <= 0) then
		return
	end

	if math.abs(result - v2) < 0.01 then
		return
	end

	v2 = result
	pcall(function() --[[ Line: 33 | Upvalues: LocalPlayer (ref), CameraMinZoomDistance (ref), result (copy), CameraMaxZoomDistance (ref) ]]
		LocalPlayer.CameraMinZoomDistance = CameraMinZoomDistance * result
		LocalPlayer.CameraMaxZoomDistance = CameraMaxZoomDistance * result
	end)

	if not (Humanoid and (Humanoid.Parent and v3)) then
		return
	end

	local v22 = math.max(0, result - 1)

	pcall(function() --[[ Line: 40 | Upvalues: Humanoid (ref), v3 (ref), v22 (copy) ]]
		Humanoid.CameraOffset = v3 + Vector3.new(0, v22 * 2, 0)
	end)
end

apply()
task.spawn(function() --[[ Line: 48 | Upvalues: v1 (copy), apply (copy) ]]
	while v1.Parent do
		apply()
		task.wait(0.25)
	end
end)