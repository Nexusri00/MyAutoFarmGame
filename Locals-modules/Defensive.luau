-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMhEEh1bWFub2lkUm9vdFBhcnQORmluZEZpcnN0Q2hpbGQGc2NyaXB0BlBhcmVudAxXYWl0Rm9yQ2hpbGQFQ2xvbmUGQ0ZyYW1lB1Bpdm90VG8FRXh0cmEHRWZmZWN0cwdBZGRJdGVtC1ByaW1hcnlQYXJ0CEJhc2VQYXJ0FkZpbmRGaXJzdENoaWxkV2hpY2hJc0EISW5zdGFuY2UDbmV3BFdlbGQFUGFydDAFUGFydDEPR2V0QWJpbGl0eVNjYWxlDkVtaXRfV2l0aFNjYWxlCl9zcGF3bkF1cmEKU2Vjb25kV2luZA1Db25xdWVyb3JBdXJhEFN1cnZpdmFsSW5zdGluY3QEZ2FtZQlXb3Jrc3BhY2UKR2V0U2VydmljZQZEZWJyaXMRUmVwbGljYXRlZFN0b3JhZ2UHcmVxdWlyZQdNb2R1bGVzDVZpc3VhbFBhY2thZ2UABQoCAwAABwQAAAUCBwNEbwQAALwCAAMBAAAAnwIDAisCAQCCAAEApAMDAAAAIEBNAwMkBAAAAFIFAQC8AwPTBQAAAJ8DAwK8BAM6BgAAAJ8EAgJNBwKFBwAAALwFBMIIAAAAnwUDAfsFAABNBQWUCQAAAG8HCgC8BQXTBQAAAJ8FAwIwBQQkBAAAAPsFAQBSBwQAjAgDALwFBXgLAAAAnwUEAU0FBJsMAAAAKwUEAG8HDQC8BQRUDgAAAJ8FAwIOBQoApAYRAABA8IBvBxIAnwYCAjAFBjwTAAAAMAIGsRQAAAAwBQYkBAAAAPsGAgBNBgbIFQAAAFIHAACpCAEAnwYDAvsHAgBNBwcNFgAAAFIIBABSCQYAnwcDAYIAAQAXAwEDAgMDBAAAIEADBAMFAwYDBwMIAwkDCgMLAwwDDQMOAw8DEAQAQPCAAxEDEgMTAxQDFQAPFgEYAAAAAAEAAgAAAAAAAAABAAABAAAAAAEAAAAAAAAAAAEAAAAAAAIAAAAAAAABAQAAAAEAAQABAAMAAAAAAAEAAAAAAAEQAAAAAAQBAQAABgMAAAUBBwX7AQAAUgIAAG8DAACfAQMBggABAAEDFwAlFwEYAAAAAAEmAAAAAAQBAQAABgMAAAUBBwX7AQAAUgIAAG8DAACfAQMBggABAAEDGAApGAEYAAAAAAEqAAAAAAQBAQAABgMAAAUBBwX7AQAAUgIAAG8DAACfAQMBggABAAEDGQAtGQEYAAAAAAEuAAAAAAcAAAECAC2jAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEBAAAAAEBvAwQAvAEBFgMAAACfAQMCpAIBAAAAAEBvBAUAvAICFgMAAACfAgMCpAMHAAAAYEBNBALoCAAAAE0EBAoJAAAAnwMCAv8EAwAAAAAAwAUKABIAAAASAAEAEgADAMAGCwASAAUAMAYEgAwAAADABg0AEgAFADAGBNgOAAAAwAYPABIABQAwBgRZEAAAAIIEAgARAxoEAAAAQAMbAxwDHQMeAx8EAABgQAMgAyEGAAYBAxcGAgMYBgMDGQQAAQIDAQABGAAGAAAAAAABAAAAAAABAAAAAAACAAAAAAAAAgACAAAAFgAAAAQAAAAEAAAABAEAAAAABAKIfzhfO+vw3useAjohUw9ykGhMMEwVOQ==

-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VisualPackage = require(ReplicatedStorage.Modules.VisualPackage)
local t = {}

local function _spawnAura(p1, p2) --[[ _spawnAura | Line: 15 | Upvalues: Workspace (copy), Debris (copy), VisualPackage (copy) ]]
	local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	local v1 = script.Parent:WaitForChild(p2):Clone()

	v1:PivotTo(HumanoidRootPart.CFrame)
	v1.Parent = Workspace.Extra:WaitForChild("Effects")
	Debris:AddItem(v1, 3)

	local v2 = v1.PrimaryPart or v1:FindFirstChildWhichIsA("BasePart")
	local v3

	if v2 then
		local Weld = Instance.new("Weld")

		Weld.Part0 = v2
		Weld.Part1 = HumanoidRootPart
		Weld.Parent = v2
	end

	v3 = VisualPackage.GetAbilityScale(p1, true)
	VisualPackage.Emit_WithScale(v1, v3)
end

function t.SecondWind(p1) --[[ SecondWind | Line: 37 | Upvalues: _spawnAura (copy) ]]
	_spawnAura(p1, "SecondWind")
end
function t.ConquerorAura(p1) --[[ ConquerorAura | Line: 41 | Upvalues: _spawnAura (copy) ]]
	_spawnAura(p1, "ConquerorAura")
end
function t.SurvivalInstinct(p1) --[[ SurvivalInstinct | Line: 45 | Upvalues: _spawnAura (copy) ]]
	_spawnAura(p1, "SurvivalInstinct")
end

return t