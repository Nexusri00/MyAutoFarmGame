-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRBkhlYWx0aAJfRwxWYWx1ZU1hbmFnZXIFU2tpbGwFQ2hlY2sNSW5wdXRGdW5jdGlvbglDbGFuU2tpbGwMSW52b2tlU2VydmVyBGdhbWUHUGxheWVycwpHZXRTZXJ2aWNlC0xvY2FsUGxheWVyCUNoYXJhY3Rlcg5DaGFyYWN0ZXJBZGRlZARXYWl0CEh1bWFub2lkDFdhaXRGb3JDaGlsZAACBAACAAAAIfsAAABNAABaAAAAAIwBAAB9AAIAAQAAAIIAAQCkAAIAAAAQQE0AALYDAAAADgAMAKQAAgAAABBATQAAtgMAAAD7AgEAbwMEALwAAPwFAAAAnwAEAioAAgAAAACAggABAKQAAgAAABBATQAAMQYAAABvAgcAvAAAOQgAAACfAAMBggABAAkDAQMCBAAAEEADAwMEAwUDBgMHAwgACQABGAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAQoAAAAABgAAAQIAGaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwJNAQAxBAAAAE0CAWkFAAAAKwIFAE0CAZcGAAAAvAIC9wcAAACfAgICbwUIALwDAtMJAAAAnwMDAsAECgASAAMAEgACAIIEAgALAwkEAAAAQAMKAwsDDAMNAw4DDwMQAxEGAAEAAQABGAACAAAAAAACAAEAAAAAAAAAAQAAAAIAAAABAAAAAAEfQNokXOQRQzJ7D6Rr720mb1jNUC2EsCU=

-- https://lua.expert/
local LocalPlayer = game:GetService("Players").LocalPlayer
local v1 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = v1:WaitForChild("Humanoid")

return function() --[[ Line: 9 | Upvalues: Humanoid (copy), v1 (copy) ]]
	if Humanoid.Health <= 0 then
		return
	end

	if not _G.ValueManager or _G.ValueManager:Check(v1, "Skill") ~= false then
		_G.InputFunction:InvokeServer("ClanSkill")
	end
end