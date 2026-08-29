-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMPBmlwYWlycwZQYXJlbnQHRW5hYmxlZAV0YWJsZQVjbGVhcgdSZXN0b3JlDkdldERlc2NlbmRhbnRzCUhpZ2hsaWdodANJc0EOSXNEZXNjZW5kYW50T2YGaW5zZXJ0CFN1cHByZXNzBGdhbWUJV29ya3NwYWNlCkdldFNlcnZpY2UAAwYAAgAAABj7AAAADgABAIIAAQCpAAEA3gAAAKQAAQAAAABA+wEBAJ8AAgRRAAcADgQGAE0FBCQCAAAADgUDAKkFAQAwBQTwAwAAAG4A+P8CAACApAAGAAAUQID7AQEAnwACAYIAAQAHAwEEAAAAQAMCAwMDBAMFBAAUQIAAJwYBGAAAAAEAAQAAAAABAAAAAQAA/gAFAAAAASgAAAAAEQEBAAAGAwAABQGEPFIBAAArAQIA/wEAAAAAAAD/AgAAAAAAAKQDAQAAAABA+wQAALwEBEcCAAAAnwQCAJ8DAARRAyMAbwoDALwIB/4EAAAAnwgDAg4IHgBNCAfwBQAAAA4IGwCpCAAApAkBAAAAAEBSCgEAnwkCBFEJCAAODQcAUhANALwOB60GAAAAnw4DAg4OAgCpCAEAZQACAG4J9/8CAACAKwgKAKkJAAAwCQfwBQAAAJ40AgUHAAAAUgoCAFILBwCkCQkAACBwgJ8JAwFuA9z/AgAAgKkDAADiBAsA2QUAABIBA/8SAAIAMAUErgoAAADBAwAAggQCAAwDAQQAAABAAwcDCAMJAwMDCgMEAwsEACBwgAMGBQEKAQARDAEYAAAAAAEAAgAAAAAAAAABAAAAAAAAAAEBAAAAAAEAAAAAAAEB/QAGAQAAAQAAAAAAAPUAEAEBAAAAAAAAEgAAAAADAAABAgAOowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAv8BAQAAAAAAwAIEABIAAAAwAgFFBQAAAIIBAgAGAw0EAAAAQAMOAw8GAQMMAQEBAAEYAAcAAAAAAAIABwAAACMBAAAAAAKSFtqam6lT1MrwoNU6GHPz4g7N7qDSsJs=

-- https://lua.expert/
local Workspace = game:GetService("Workspace")

return {
	Suppress = function(p1) --[[ Suppress | Line: 17 | Upvalues: Workspace (copy) ]]
		local v1 = if p1 then p1 else {}
		local t = {}

		for i, v in ipairs(Workspace:GetDescendants()) do
			if v:IsA("Highlight") and v.Enabled then
				local v2 = false

				for i2, v3 in ipairs(v1) do
					if v3 and v:IsDescendantOf(v3) then
						v2 = true

						break
					end
				end

				if not v2 then
					v.Enabled = false
					table.insert(t, v)
				end
			end
		end

		local v3 = false

		return {
			Restore = function() --[[ Restore | Line: 39 | Upvalues: v3 (ref), t (copy) ]]
				if v3 then
					return
				end

				v3 = true

				for i, v in ipairs(t) do
					if v and v.Parent then
						v.Enabled = true
					end
				end

				table.clear(t)
			end
		}
	end
}