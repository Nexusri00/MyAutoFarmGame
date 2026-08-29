-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMPB3JlcXVpcmUPVmlzdWFsRW5oYW5jZXJzDFdhaXRGb3JDaGlsZAxHVUkgRW5oYW5jZXINQnV0dG9uRWZmZWN0cwVTdGFydA5HVUlJbnRlcmFjdGlvbgZTaGFyZWQGRGVicmlzBEluaXQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlBHRhc2sFc3Bhd24ABAQAAQAAABSkAAEAAAAAQPsBAABvAwIAvAEB0wMAAACfAQMCbwMEALwBAdMDAAAAnwEDAm8DBQC8AQHTAwAAAJ8BAwCfAAACvAAAHAYAAACfAAIBggABAAcDAQQAAABAAwIDAwMEAwUDBgAFAAEYAAAAAAAAAAAAAAAAAAAAAAAAAAEGAAAAAAQAAQAAABCkAAEAAAAAQPsBAABvAwIAvAEB0wMAAACfAQMCbwMEALwBAdMDAAAAnwEDAJ8AAAK8AAAcBQAAAJ8AAgGCAAEABgMBBAAAAEADAgMDAwcDBgAJAAEYAAAAAAAAAAAAAAAAAAAAAQoAAAAABAABAAAAEKQAAQAAAABA+wEAAG8DAgC8AQHTAwAAAJ8BAwJvAwQAvAEB0wMAAACfAQMAnwAAArwAAHMFAAAAnwACAYIAAQAGAwEEAAAAQAMIAwMDCQMKAA0AARgAAAAAAAAAAAAAAAAAAAABDgAAAAADAAABAgAXowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBgAAFECAwAIHABIAAACfAQIBpAEGAAAUQIDAAggAEgAAAJ8BAgGkAQYAABRAgMACCQASAAAAnwECAYIAAQAKAwsEAAAAQAMMAw0DDgMPBAAUQIAGAAYBBgIDAAECAQABGAADAAAAAAABAAAAAAQAAAAABAAAAAACAQAAAAADm1IsVu2LhY9C3aYHksbfgetKOyKplkZX

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")

task.spawn(function() --[[ Line: 5 | Upvalues: ReplicatedStorage (copy) ]]
	require(ReplicatedStorage:WaitForChild("VisualEnhancers"):WaitForChild("GUI Enhancer"):WaitForChild("ButtonEffects")):Start()
end)
task.spawn(function() --[[ Line: 9 | Upvalues: ReplicatedStorage (copy) ]]
	require(ReplicatedStorage:WaitForChild("VisualEnhancers"):WaitForChild("GUIInteraction")):Start()
end)
task.spawn(function() --[[ Line: 13 | Upvalues: ReplicatedStorage (copy) ]]
	require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Debris")):Init()
end)