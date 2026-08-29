-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = script.Parent:WaitForChild("Packages")
local Tweens = require(Packages:WaitForChild("Tweens"))
local MouseFollow = require(Packages:WaitForChild("MouseFollow"))
local Shime = require(Packages:WaitForChild("Shime"))
local GradientColor = require(Packages:WaitForChild("GradientColor"))
local TransparencyTweener = require(Packages:WaitForChild("TransparencyTweener"))
local TextWriter = require(Packages:WaitForChild("TextWriter"))
local Signal = require(Packages:WaitForChild("Signal"))
local Teleport = require(script.Parent:WaitForChild("Teleport"))
local TeleportLoading = require(script.Parent:WaitForChild("TeleportLoading"))
local IslandsConfig = require(ReplicatedStorage.Modules.Configurations:WaitForChild("IslandsConfig"))
local v1 = Signal()
local t = {
	Get = function(p1) --[[ Get | Line: 28 | Upvalues: Tweens (copy), MouseFollow (copy), IslandsConfig (copy), Shime (copy), GradientColor (copy), TransparencyTweener (copy), TextWriter (copy) ]]
		if p1 == "Tweens" then
			return Tweens
		end

		if p1 == "MouseFollow" then
			return MouseFollow
		end

		if p1 == "IslandsConfig" then
			return IslandsConfig
		end

		if p1 == "Shime" then
			return Shime
		end

		if p1 == "GradientColor" then
			return GradientColor
		end

		if p1 == "TransparencyTweener" then
			return TransparencyTweener
		end

		if p1 == "TextWriter" then
			return TextWriter
		end

		warn("[TeleportHandler] Unknown package:", p1)

		return nil
	end,
	Signal = {}
}

local function Get(p1) --[[ Get | Line: 51 | Upvalues: v1 (copy) ]]
	if p1 == "Teleport" then
		return v1
	end

	warn("[TeleportHandler] Unknown signal:", p1)

	return nil
end

t.Signal.Get = Get

local Teleport2 = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Teleport")

Teleport2.ResetOnSpawn = false

local TeleportFrame = Teleport2:WaitForChild("TeleportFrame")
local TeleportLoading2 = Teleport2:FindFirstChild("TeleportLoading")

task.spawn(function() --[[ Line: 68 | Upvalues: Teleport (copy), t (copy), TeleportFrame (copy), TeleportLoading2 (copy), TeleportLoading (copy) ]]
	_G.TeleportUI = Teleport.Init(t, TeleportFrame)

	if not TeleportLoading2 then
		return
	end

	TeleportLoading.Init(t, TeleportLoading2)
end)

return {}