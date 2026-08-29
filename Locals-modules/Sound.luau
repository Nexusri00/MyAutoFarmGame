-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMREEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQHcmVxdWlyZQdNb2R1bGVzB0VmZmVjdHMJU291bmREYXRhBlNvdW5kcwVUcmFpdAVDbG9uZQZQYXJlbnQEUGxheQdBZGRJdGVtA1J1bgRnYW1lBkRlYnJpcwpHZXRTZXJ2aWNlEVJlcGxpY2F0ZWRTdG9yYWdlAAIMAwIAAAgFAAAFAwcDAzNvBQAAvAMAAwEAAACfAwMCKwMBAIIAAQCkBAMAAAAgQPsFAABNBQXoBAAAAE0FBZcFAAAATQUF/wYAAACfBAICTQQEKAcAAABvBggAvAQEAwEAAACfBAMCUgUEAA4FBABSBwEAvAUEAwEAAACfBQMCUgYFAA4GBABSCAIAvAYFAwEAAACfBgMCKwYBAIIAAQC8BwY6CQAAAJ8HAgIwAwckCgAAALwIB+4LAAAAnwgCAfsIAQBSCgcAjAsFALwICHgMAAAAnwgEAYIAAQANAwEDAgMDBAAAIEADBAMFAwYDBwMIAwkDCgMLAwwACA0BGAAAAAABAAEAAAAAAAAAAAAAAAAAAAABAAAAAAABAAAAAAABAAEAAAEAAQAAAQAAAAAAAQkAAAAABAAAAQIAFaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwL/AgEAAAAAAMADBQASAAEAEgAAADADAhYGAAAAggICAAcDDgQAAABAAw8DEAMRBgADDQEAAQABGAACAAAAAAABAAAAAAACAAIAAAAADQEAAAAAAR5u2ZQ9/8hPguDEArrkhyxuds7gLKqzlQ==

-- https://lua.expert/
local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

return {
	Run = function(p1, p2, p3) --[[ Run | Line: 8 | Upvalues: ReplicatedStorage (copy), Debris (copy) ]]
		local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return
		end

		local Trait = require(ReplicatedStorage.Modules.Effects.SoundData).Sounds:FindFirstChild("Trait")
		local v1 = if Trait then Trait:FindFirstChild(p2) else Trait
		local v2 = if v1 then v1:FindFirstChild(p3) else v1

		if v2 then
			local v3 = v2:Clone()

			v3.Parent = HumanoidRootPart
			v3:Play()
			Debris:AddItem(v3, 5)
		end
	end
}