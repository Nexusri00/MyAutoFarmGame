-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMXBXBjYWxsB3JlcXVpcmUGU2hhcmVkAlVJBk5vdGlmeQdfbm90aWZ5BHR5cGUGc3RyaW5nAAdNZXNzYWdlCENvb2xkb3duCER1cmF0aW9uCFJlZ2lzdGVyAm9zBWNsb2NrBFNlbmQIZnVuY3Rpb24IZHVyYXRpb24HU2hvd0ZvcgxJc1JlZ2lzdGVyZWQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlAAUDAAIAAAAU+wAAAA4AAgD7AAAAggACAKQAAQAAAABApAEDAAAAIED7AgEATQICEgQAAABNAgJcBQAAAE0CAkMGAAAAnwADAw4AAQDeAQAA+wIAAIICAgAHAwEEAAAAQAMCBAAAIEADAwMEAwUACwYBGAAAAAABAAAAAAAAAAAAAAABAAEADAAAAAAGAwEAAAgFAAAFAwMDhCa7KAADUgQAAKQDAQAAAABAnwMCAvADAwACAACA8AACAAMAAICCAAEAuygBA1IEAQCkAwEAAAAAQJ8DAgLwAwMAAgAAgPABAgADAACAggABAPsDAADiBAcAMAEE+AQAAABSBQIADgUCAE0FAl4FAAAAMAUEXgUAAABSBQIADgUCAE0FAuUGAAAAMAUE5QYAAABqBAMAggABAAgDBwQAAABAAwgDCQMKAwsDDAUDBAUGACUNARgAAAAAAAAAAAAAAQAAAAAAAAAAAAEAAQABAAAAAAABAAAAAAD9BSYAAAAACwEEAAAGAwAABQEDQfsCAACHAQIAKwECAKkCAACCAgIApAICAAAEAICfAgEC+wUBAIcEBQCQAwQDTQUBXgUAAACQBAUEJgUCA2AFAwAEAAAAqQUAAIIFAgD7BQEAagIFAPsGAgAOBgIA+wUCAGUADwCkBgcAAABgQKQHCQAAAIBA+wgDAE0ICBIKAAAATQgIXAsAAABNCAhDDAAAAJ8GAwMOBgEA3gcCAPsFAgAOBQgATQcF5A0AAAC7KAcCpAYPAAAA4ECfBgIC8AYDABAAAACpBgAAggYCAKQGBwAAAGBATQcF5A0AAABNCAH4EQAAAOIJEwBNCgHlFAAAADAKCcUSAAAAnwYEAakGAQCCBgIAFQMOAw8EAAQAgAIAAAAAAAAAAAIAAAAAAADwPwMLAwEEAABgQAMCBAAAgEADAwMEAwUDEAMHBAAA4EADEQMKAxIFARIDDAAvEwEYJAABAAACAAABAAABAAABAAAAAAEA1QAAAAEAAAAAAAAAAAAAAAEAASsAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAQAMAAAAAAQBAQAABgMAAAUBAwf7AwAAhwIDAEcCAgAAAACAqQEAAakBAQCCAQIAAAA/FAEYAAAAAAAAAEAAAAAABwAAAQIAIqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwLGAQAA2QIAABIBAf8SAAAA/wMDAAAAAAD/BAAAAAAAAP8FAAAAAAAAwAYEABIABAAwBgODBQAAANkGAgASAAQAEgAFABIBAf8SAAAAMAYD2gYAAADABgcAEgAEADAGA1QIAAAAwQEAAIIDAgAJAxUEAAAAQAMWAxcGAQMNAxMGAwMUBAABAgMBAAEYAAQAAAAAAAUBAAARAAQAAQAEAAAACgAAAAAAABAAAAAEAAEAAAAABCn9QRWKnhU/yBUx9Ror6JNZ5VZhGzkrFA==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = nil

local function _notify() --[[ _notify | Line: 11 | Upvalues: v1 (ref), ReplicatedStorage (copy) ]]
	if v1 then
		return v1
	end

	local ok, result = pcall(require, ReplicatedStorage.Shared.UI.Notify)

	if not ok then
		return v1
	end

	v1 = result

	return result
end

local t = {}
local t2 = {}
local t3 = {}

function t.Register(p1, p2, p3) --[[ Register | Line: 37 | Upvalues: t2 (copy) ]]
	if type(p1) ~= "string" or p1 == "" then
		return
	end

	if type(p2) ~= "string" or p2 == "" then
		return
	end

	local t = {
		Message = p2
	}

	t.Cooldown = if p3 then p3.Cooldown else p3
	t.Duration = if p3 then p3.Duration else p3
	t2[p1] = t
end
function t.ShowFor(p1) --[[ ShowFor | Line: 47 | Upvalues: t2 (copy), t3 (copy), v1 (ref), ReplicatedStorage (copy) ]]
	local v12 = t2[p1]

	if not v12 then
		return false
	end

	local v2 = os.clock()

	if v2 - (t3[p1] or 0) < (v12.Cooldown or 1) then
		return false
	end

	t3[p1] = v2

	if not v1 then
		local ok, result = pcall(require, ReplicatedStorage.Shared.UI.Notify)

		if ok then
			v1 = result
		end
	end

	local v3 = v1

	if not v3 then
		return false
	end

	if type(v3.Send) == "function" then
		pcall(v3.Send, v12.Message, {
			duration = v12.Duration
		})

		return true
	end

	return false
end
function t.IsRegistered(p1) --[[ IsRegistered | Line: 63 | Upvalues: t2 (copy) ]]
	return t2[p1] ~= nil
end

return t