-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMpClRyYXZlbFRpbWUJSGVhcnRiZWF0BFdhaXQEbWF0aANtaW4GQ0ZyYW1lA25ldwRMZXJwB1Bpdm90VG8HU3Bhd25BdAZGb2xkZXIJRXhwbG9zaW9uCExpZmV0aW1lB0Rlc3Ryb3kKR2V0UGFzc2l2ZRFQaXJhdGUgQW5jaG9yZmlzaANWRlgFQXNzZXQGQW5jaG9yEUFuY2hvck9yaWVudGF0aW9uD2Zyb21PcmllbnRhdGlvbgFYA3JhZAFZAVoKRHJvcEhlaWdodAdWZWN0b3IzBVNwYXduBHRhc2sFc3Bhd24EZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlClJ1blNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zCEZpc2hEYXRhBnNjcmlwdAZQYXJlbnQHX1NoYXJlZAADCwAHAAAAOvsAAABNAAAaAAAAAIwBAABgAR8AAAAAAPsCAQBNAgL9AQAAALwCAvcCAAAAnwICAkMEAQKeEwQEAAAAAFIFAACkAwUAABAwgJ8DAwJSAQMA+wMCAKQGCAAAHGCA+wcDAPsJBADsCgEAvAcHXwkAAACfBwQAnwYAAvsHBQAJBQYHvAMDwgoAAACfAwMBSADg//sCBgBNAgI0CwAAAPsDAABNAwOIDAAAAPsEAABNBASWDQAAAKQFCAAAHGCA+wYEAJ8FAgL7BgAATQYGyw4AAACfAgUB+wICALwCAlAPAAAAnwICAYIAAQAQAwEDAgMDAwQDBQQAEDCAAwYDBwQAHGCAAwgDCQMKAwsDDAMNAw4ANAABGAAAAAECAAEAAAAAAAEAAAAAAAAABAAAAAAAAAAAAAAAAAAA+gkAAAAAAAAAAAAAAAAAAAAAAQAAAAE1AAAAAAwCAwAACwQAAQUCBwgIBzABSfsCAABNAgJfAAAAAG8DAQCfAgICTQICfgIAAAD7AwEATQMDRgMAAABNBAKIBAAAAE0FAqwFAAAAnwMDAisDAQCCAAEATQQCegYAAACkBQkAACBwgE0HBHkKAAAAuxYHAqQGDQAAMLCAnwYCAk0IBHgOAAAAuxYIAqQHDQAAMLCAnwcCAk0JBHsPAAAAuxYJAqQIDQAAMLCAnwgCAp8FBAKMCAAATQkCIhAAAACMCgAATDYAAqQHEwAASBCBnwcEAkMGAQf7BwEATQcH3xQAAABSCAMApAoVAABIcIBSCwYAnwoCAgkJCgWfBwMCKwcBAIIAAQCkCBgAAFxggdkJAAASAAIAEgICABIABwASAAYAEgABABIABQASAgEAnwgCAYIAAQAZAw8DEAMRAxIDCwMTAxQDBgMVBAAgcIADFgMEAxcEADCwgAMYAxkDGgMbAwcEAEgQgQMcBABIcIADHQMeBABcYIEBACYTARgAAAAAAAAAAQAAAAAAAAABAAQAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAQAAAAAAAAAAAAEAAgAAAAAAAAAAAAAQJwAAAAAGAAABAgAoowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBAQAAAABAbwMEALwBARYDAAAAnwEDAqQCBgAAAFBATQMA6AcAAABNAwO6CAAAAE0DA6EJAAAAnwICAqQDBgAAAFBApAQLAAAAoEBNBAQkDAAAAE0EBEYNAAAAnwMCAv8EAQAAAAAAwAUOABIAAgASAAMAEgABADAFBKwPAAAAggQCABADHwQAAABAAyADIQMiAyMEAABQQAMkAyUDJgMnBAAAoEADKAMpBgEDEwEBAQABGAAPAAAAAAABAAAAAAAEAAAAAAAAAAABAAAAAAAAAAAEAAwAAAAAACABAAAAAAJ59J3D+JyQ/Iy7wwTreEniCeyKt0sw98I=

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)

return {
	Anchor = function(p1, p2) --[[ Anchor | Line: 38 | Upvalues: FishData (copy), _Shared (copy), RunService (copy) ]]
		local VFX = FishData.GetPassive("Pirate Anchorfish").VFX
		local v1 = _Shared.Asset(VFX.Folder, VFX.Anchor)

		if not v1 then
			return
		end

		local AnchorOrientation = VFX.AnchorOrientation
		local v4 = CFrame.fromOrientation(math.rad(AnchorOrientation.X), math.rad(AnchorOrientation.Y), (math.rad(AnchorOrientation.Z)))
		local v5 = p2 + Vector3.new(0, VFX.DropHeight, 0)
		local v6 = _Shared.Spawn(v1, CFrame.new(v5) * v4)

		if v6 then
			task.spawn(function() --[[ Line: 52 | Upvalues: VFX (copy), RunService (ref), v6 (copy), v5 (copy), p2 (copy), v4 (copy), _Shared (ref) ]]
				local TravelTime = VFX.TravelTime
				local v1 = 0

				while v1 < TravelTime do
					local v3 = math.min(v1 + RunService.Heartbeat:Wait(), TravelTime)

					v6:PivotTo(CFrame.new(v5:Lerp(p2, v3 / TravelTime)) * v4)
					v1 = v3
				end

				_Shared.SpawnAt(VFX.Folder, VFX.Explosion, CFrame.new(p2), VFX.Lifetime)
				v6:Destroy()
			end)
		end
	end
}