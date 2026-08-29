-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMYBlBhcmVudAZFbmFibGUERW51bRFIdW1hbm9pZFN0YXRlVHlwZQlHZXR0aW5nVXAPU2V0U3RhdGVFbmFibGVkB1JhZ2RvbGwHUGh5c2ljcwRKdW1wDVBsYXRmb3JtU3RhbmQKQXV0b1JvdGF0ZQdEaXNhYmxlC0NoYW5nZVN0YXRlCEh1bWFub2lkBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UHUmVtb3Rlcw1PbkNsaWVudEV2ZW50B0Nvbm5lY3QFU3RhcnQHcmVxdWlyZQZzY3JpcHQFVHlwZXMLU2VydmljZVR5cGUAAwUBAQAAAFH7AQAADgEEAPsBAABNAQEkAAAAACsBAQCCAAEA8AAjAAEAAID7AQAApAMFAAQMIMCpBAAAvAEB6AYAAACfAQQB+wEAAKQDCAAHDCDAqQQBALwBAegGAAAAnwEEAfsBAACkAwoACQwgwKkEAQC8AQHoBgAAAJ8BBAH7AQAAqQIAADACAVMLAAAA+wEAAKkCAQAwAgH7DAAAAPsBAACpAgAAMAIBAg0AAACCAAEA8AAkAA4AAID7AQAApAMIAAcMIMCpBAAAvAEB6AYAAACfAQQB+wEAAKQDCgAJDCDAqQQAALwBAegGAAAAnwEEAfsBAACkAwUABAwgwKkEAQC8AQHoBgAAAJ8BBAH7AQAApAMFAAQMIMC8AQEhDwAAAJ8BAwH7AQAAqQIAADACAfsMAAAA+wEAAKkCAQAwAgECDQAAAIIAAQAQAwEDAgMDAwQDBQQEDCDAAwYDBwQHDCDAAwgECQwgwAMJAwoDCwMMAw0ACAABGAAAAAAAAAABAAEAAAAAAAABAAAAAAAAAQAAAAAAAAEAAAABAAAAAQAAAAABAAEAAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAEAAAABAAAAAgkAAAAABgIAAAAAEk0CAQEAAAAApAMCAAAAEEBNAwM/AwAAAE0DA10EAAAATQMDwQUAAABNAwOMBgAAANkFAAASAAIAvAMDxwcAAACfAwMBggABAAgDDgMPBAAAEEADEAMRAwcDEgMTAQAGFAEYAAABAAAAAAAAAAAAAAAAAAASBwAAAAADAAABAgAUowAAAKQAAQAAAABApAEDAAAAIEBNAQEkBAAAAE0BASQEAAAATQEB7wUAAABNAQEfBgAAAJ8AAgL/AQEAAAAAAMACBwAwAgEcCAAAAIIBAgAJAxUEAAAAQAMWBAAAIEADAQMXAxgGAQMUAQEBAAEYAAAAAAAAAAAAAAAAAAADAAIAABYBAAAAAAKp8/mXAwGEGzqtNlXImhQq2evu45s3k5Y=

-- https://lua.expert/
require(script.Parent.Parent.Types.ServiceType)

return {
	Start = function(p1, p2) --[[ Start | Line: 6 ]]
		local Humanoid = p2.Humanoid

		game.ReplicatedStorage.Remotes.Ragdoll.OnClientEvent:Connect(function(p1) --[[ Line: 8 | Upvalues: Humanoid (copy) ]]
			if not (Humanoid and Humanoid.Parent) then
				return
			end

			if p1 == "Enable" then
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
				Humanoid.Jump = false
				Humanoid.PlatformStand = true
				Humanoid.AutoRotate = false

				return
			end

			if p1 ~= "Disable" then
				return
			end

			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
			Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			Humanoid.PlatformStand = false
			Humanoid.AutoRotate = true
		end)
	end
}