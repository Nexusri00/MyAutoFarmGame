-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local Util = require(script.Parent.Parent.Shared.Util)
local Players = game:GetService("Players")
local t = {}

local function getUserId(p1) --[[ getUserId | Line: 5 | Upvalues: t (copy), Players (copy) ]]
	if t[p1] then
		return t[p1]
	end

	if Players:FindFirstChild(p1) then
		t[p1] = Players[p1].UserId

		return Players[p1].UserId
	end

	local ok, result = pcall(Players.GetUserIdFromNameAsync, Players, p1)

	if ok then
		t[p1] = result

		return result
	end

	return nil
end

local t2 = {
	DisplayName = "Full Player Name",
	Prefixes = "# integer",
	Transform = function(p1) --[[ Transform | Line: 27 | Upvalues: Util (copy), Players (copy) ]]
		return p1, Util.MakeFuzzyFinder(Players:GetPlayers())(p1)
	end,
	ValidateOnce = function(p1) --[[ ValidateOnce | Line: 33 | Upvalues: t (copy), Players (copy) ]]
		local v1

		if t[p1] then
			v1 = t[p1]
		elseif Players:FindFirstChild(p1) then
			t[p1] = Players[p1].UserId
			v1 = Players[p1].UserId
		else
			local ok, result = pcall(Players.GetUserIdFromNameAsync, Players, p1)

			if ok then
				t[p1] = result
				v1 = result
			else
				v1 = nil
			end
		end

		return v1 ~= nil, "No player with that name could be found."
	end,
	Autocomplete = function(p1, p2) --[[ Autocomplete | Line: 37 | Upvalues: Util (copy) ]]
		return Util.GetNames(p2)
	end,
	Parse = function(p1) --[[ Parse | Line: 41 | Upvalues: t (copy), Players (copy) ]]
		if t[p1] then
			return t[p1]
		end

		if Players:FindFirstChild(p1) then
			t[p1] = Players[p1].UserId

			return Players[p1].UserId
		end

		local ok, result = pcall(Players.GetUserIdFromNameAsync, Players, p1)

		if ok then
			t[p1] = result

			return result
		end

		return nil
	end,
	Default = function(p1) --[[ Default | Line: 45 ]]
		return p1.Name
	end,
	ArgumentOperatorAliases = {
		me = ".",
		all = "*",
		others = "**",
		random = "?"
	}
}

return function(p1) --[[ Line: 57 | Upvalues: t2 (copy), Util (copy) ]]
	p1:RegisterType("playerId", t2)
	p1:RegisterType("playerIds", Util.MakeListableType(t2, {
		Prefixes = "# integers"
	}))
end