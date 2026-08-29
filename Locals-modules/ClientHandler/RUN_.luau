-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTCFN3aW1taW5nDkZpbmRGaXJzdENoaWxkCVdhbGtTcGVlZAJfRwxWYWx1ZU1hbmFnZXIDUnVuBUNoZWNrB1J1bm5pbmcEZ2FtZQdQbGF5ZXJzCkdldFNlcnZpY2ULTG9jYWxQbGF5ZXIIR2V0TW91c2UJQ2hhcmFjdGVyDkNoYXJhY3RlckFkZGVkBFdhaXQISHVtYW5vaWQMV2FpdEZvckNoaWxkEEh1bWFub2lkUm9vdFBhcnQAAgQAAgAAACn7AAAAbwIAALwAAAMBAAAAnwADAg4AEQD7AAEATQAAjgIAAAANAA0AAwAAgKQABQAAAEBATQAAtgYAAAD7AgAAbwMHALwAAPwIAAAAnwAEAioAAgAAAACAggABAKQABQAAAEBATQAA6QkAAABHAAcAAAAAgKQABQAAAEBAqQEBADABAOkJAAAAggABAKQABQAAAEBAxgEAADABAOkJAAAAggABAAoDAQMCAwMCAAAAAAAAAAADBAQAAEBAAwUDBgMHAwgABwABGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAwAAAAAAAQAAAAAAAgAAAAACCAAAAAAHAAABAgAgowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAk0AADEEAAAAvAEAIwUAAACfAQICTQIAaQYAAAArAgUATQIAlwcAAAC8AgL3CAAAAJ8CAgJvBQkAvAMC0woAAACfAwMCbwYLALwEAtMKAAAAnwQDAsAFDAASAAIAEgADAIIFAgANAwkEAAAAQAMKAwsDDAMNAw4DDwMQAxEDEgMTBgABAAEAARgAAAAAAAAAAAABAAABAAAAAAAAAAEAAAABAAAAAgAAAAEAAAAAAbDEHMVph+o1EujWyn/te9nA3AuxggB2xA==

-- https://lua.expert/
local LocalPlayer = game:GetService("Players").LocalPlayer

LocalPlayer:GetMouse()

local v1 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = v1:WaitForChild("Humanoid")

v1:WaitForChild("HumanoidRootPart")

return function() --[[ Line: 7 | Upvalues: v1 (copy), Humanoid (copy) ]]
	if v1:FindFirstChild("Swimming") and (Humanoid.WalkSpeed == 0 and _G.ValueManager:Check(v1, "Run") == false) then
		return
	end

	if _G.Running == nil then
		_G.Running = true
	else
		_G.Running = nil
	end
end