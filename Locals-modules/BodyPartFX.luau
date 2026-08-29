-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMZBkNvbW1vbg1WaXN1YWxQYWNrYWdlCUNoYXJhY3RlcglWRlhTb3VyY2UMUmVzb2x2ZUFzc2V0BmlwYWlycw5GaW5kRmlyc3RDaGlsZAhCYXNlUGFydANJc0EFQ2xvbmUFTW9kZWwGQ0ZyYW1lB1Bpdm90VG8GUGFyZW50EHdlbGRFZmZlY3RUb1BhcnQJRW5hYmxlVkZYDkVtaXRfV2l0aFNjYWxlB0FkZEl0ZW0QX3NwYXduT25Cb2R5UGFydAdMZWZ0QXJtBEhlYWQFRnJhbWUEZ2FtZQZEZWJyaXMKR2V0U2VydmljZQADEgMBAAAIBQAABQMPAwRTTQMAcwAAAABNBAMKAQAAAE0FAGkCAAAATQYAcgMAAABNBwMyBAAAAFIIBgBSCQEAnwcDAisHAQCCAAEAxggAAKQJBgAAAFBAUgoCAJ8JAgRRCQwAUhANALwOBQMHAAAAnw4DAg4OBwBvEQgAvA8O/gkAAACfDwMCDg8CAFIIDgBlAAIAbgnz/wIAAIArCAEAggABALwJBzoKAAAAnwkCAm8MCwC8Cgn+CQAAAJ8KAwIOCgYATQwIhQwAAAC8CgnCDQAAAJ8KAwFlAAkAbwwIALwKCf4JAAAAnwoDAg4KBABNCgiFDAAAADAKCYUMAAAAMAgJJA4AAABNCgNzDwAAAFILCQBSDAgAnwoDAU0KBP4QAAAAUgsJAKkMAQCfCgMBTQoEDREAAABSCwkAnwoCAfsKAABSDAkAjA0FALwKCngSAAAAnwoEAYIAAQATAwEDAgMDAwQDBQMGBAAAUEADBwMIAwkDCgMLAwwDDQMOAw8DEAMRAxIACRMBGAAAAQABAAEAAgAAAAABAAEBAAAAAAEAAAABAAAAAAAAAP4ABAABAAABAAAAAAEAAAAAAAEAAAAAAQAAAAIAAQAAAAABAAAAAAEAAAABAAAAAAABCgAAAAAHAgEAAAcEAAAFAgIPFg0AAgAAAAAAggABAPsCAABSAwEAbwQBAP8FAAABAAAAbwYBAMUFBgIBAAAAnwIEAfsCAABSAwEAbwQCAP8FAAABAAAAbwYCAMUFBgIBAAAAnwIEAYIAAQADAgAAAAAAABhAAxQDFQAkFgEYAAAAAQAAAAAAAAAAAQAAAAAAAAAAASUAAAAABAAAAQIAEKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwL/AQEAAAAAAMACBAASAAAAwAMFABIAAgAwAwGdBgAAAIIBAgAHAxcEAAAAQAMYAxkGAAYBAxYCAAEBAAEYAAIAAAAAAAIABAAbAAAABgEAAAAAAhAjLkX+GbYqNby8Z6utdWRgOzkxIudERA==

-- https://lua.expert/
local Debris = game:GetService("Debris")
local t = {}

local function _spawnOnBodyPart(p1, p2, p3) --[[ _spawnOnBodyPart | Line: 9 | Upvalues: Debris (copy) ]]
	local Common = p1.Common
	local VisualPackage = Common.VisualPackage
	local Character = p1.Character
	local v1 = Common.ResolveAsset(p1.VFXSource, p2)

	if not v1 then
		return
	end

	local v2 = nil

	for i, v in ipairs(p3) do
		local v3 = Character:FindFirstChild(v)

		if v3 and v3:IsA("BasePart") then
			v2 = v3

			break
		end
	end

	if not v2 then
		return
	end

	local v4 = v1:Clone()

	if v4:IsA("Model") then
		v4:PivotTo(v2.CFrame)
	elseif v4:IsA("BasePart") then
		v4.CFrame = v2.CFrame
	end

	v4.Parent = v2
	Common.weldEffectToPart(v4, v2)
	VisualPackage.EnableVFX(v4, true)
	VisualPackage.Emit_WithScale(v4)
	Debris:AddItem(v4, 5)
end

function t.Frame(p1, p2) --[[ Frame | Line: 36 | Upvalues: _spawnOnBodyPart (copy) ]]
	if p1 == 6 then
		_spawnOnBodyPart(p2, "LeftArm", { "LeftArm" })
		_spawnOnBodyPart(p2, "Head", { "Head" })
	end
end

return t