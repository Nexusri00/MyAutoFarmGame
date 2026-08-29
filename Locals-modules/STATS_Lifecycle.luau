-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Janitor = require(ReplicatedStorage.Modules.Zone.Janitor)

return {
	Init = function(p1) --[[ Init | Line: 16 | Upvalues: Janitor (copy) ]]
		local Player = p1.Player
		local v1 = Janitor.new()
		local v2 = nil
		local v3 = 0
		local t = {}

		local function fireForChar(p1) --[[ fireForChar | Line: 24 | Upvalues: v3 (ref), v2 (ref), Janitor (ref), Player (copy), t (copy) ]]
			v3 = v3 + 1

			local v1 = v3

			if v2 then
				v2:Destroy()
			end

			v2 = Janitor.new()

			local v22 = v2

			local function isCurrent() --[[ isCurrent | Line: 32 | Upvalues: v1 (copy), v3 (ref), Player (ref), p1 (copy) ]]
				return if v1 == v3 then Player.Character == p1 else false
			end

			for i, v in ipairs(t) do
				task.spawn(function() --[[ Line: 36 | Upvalues: v1 (copy), v3 (ref), v (copy), p1 (copy), v22 (copy), isCurrent (copy) ]]
					if v1 ~= v3 then
						return
					end

					local ok, result = pcall(v, p1, v22, isCurrent)

					if ok then
						return
					end

					warn("[STATS_Lifecycle] OnCharacter callback errored:", result)
				end)
			end
		end

		v1:Add(Player.CharacterAdded:Connect(fireForChar))
		v1:Add(function() --[[ Line: 47 | Upvalues: v2 (ref) ]]
			if not v2 then
				return
			end

			v2:Destroy()
			v2 = nil
		end, true)

		return {
			ScriptMaid = v1,
			OnCharacter = function(p1) --[[ OnCharacter | Line: 56 | Upvalues: t (copy), Player (copy), v2 (ref), v3 (ref), fireForChar (copy) ]]
				table.insert(t, p1)

				local Character = Player.Character

				if not Character then
					return
				end

				if v2 then
					local v22 = v2
					local v32 = v3

					task.spawn(function() --[[ Line: 63 | Upvalues: v32 (copy), v3 (ref), p1 (copy), Character (copy), v22 (copy), Player (ref) ]]
						if v32 ~= v3 then
							return
						end

						local ok, result = pcall(p1, Character, v22, function() --[[ Line: 65 | Upvalues: v32 (ref), v3 (ref), Player (ref), Character (ref) ]]
							return if v32 == v3 then Player.Character == Character else false
						end)

						if ok then
							return
						end

						warn("[STATS_Lifecycle] OnCharacter callback errored:", result)
					end)
				else
					fireForChar(Character)
				end
			end
		}
	end
}