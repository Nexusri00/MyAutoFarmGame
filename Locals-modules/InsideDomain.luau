-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMeBlBhcmVudBVJbnNpZGVEb21haW5IaWdobGlnaHQORmluZEZpcnN0Q2hpbGQHQWRkSXRlbQhJbnN0YW5jZQNuZXcJSGlnaGxpZ2h0BE5hbWUGQ29sb3IzB2Zyb21SR0IJRmlsbENvbG9yDE91dGxpbmVDb2xvchBGaWxsVHJhbnNwYXJlbmN5E091dGxpbmVUcmFuc3BhcmVuY3kERW51bRJIaWdobGlnaHREZXB0aE1vZGULQWx3YXlzT25Ub3AJRGVwdGhNb2RlFkdldFBsYXllckZyb21DaGFyYWN0ZXILTG9jYWxQbGF5ZXIOSW5zaWRlRG9tYWluQ0MVQ29sb3JDb3JyZWN0aW9uRWZmZWN0CVRpbnRDb2xvcgpTYXR1cmF0aW9uCENvbnRyYXN0BGdhbWUHUGxheWVycwpHZXRTZXJ2aWNlCExpZ2h0aW5nBkRlYnJpcwACCgMDAAAIBQAABQMHAwJxDgADAE0DACQAAAAAKwMBAIIAAQCQAgIBbwUCALwDAAMDAAAAnwMDAg4DBwD7BAAAUgYDAFIHAgC8BAR4BAAAAJ8EBAFlACkApAQHAAAYUIBvBQgAnwQCAm8FAgAwBQS6CQAAAKQFDAAALKCAjAa0AIwHAACMCDwAnwUEAjAFBIANAAAApAUMAAAsoICMBv8AjAd4AIwIqgCfBQQCMAUE3A4AAABvBQ8AMAUEFhAAAACMBQAAMAUEohEAAACkBRUAFEwgwTAFBDMWAAAAMAAEJAAAAAD7BQAAUgcEAFIIAgC8BQV4BAAAAJ8FBAH7BAEAUgYAALwEBIkXAAAAnwQDAvsFAQBNBQUxGAAAAJoELAAFAAAA+wQCAG8GGQC8BAQDAwAAAJ8EAwIOBAcA+wUAAFIHBABSCAIAvAUFeAQAAACfBQQBggABAKQFBwAAGFCAbwYaAJ8FAgJvBhkAMAYFugkAAACkBgwAACyggIwHtACMCGQAjAmMAJ8GBAIwBgUsGwAAAG8GHAAwBgWKHQAAAG8GHgAwBgUzHwAAAPsGAgAwBgUkAAAAAPsGAABSCAUAUgkCALwGBngEAAAAnwYEAYIAAQAgAwECAAAAAAAAPkADAgMDAwQDBQMGBAAYUIADBwMIAwkDCgQALKCAAwsDDAKamZmZmZnhPwMNAw4DDwMQAxEEFEwgwQMSAxMDFAMVAxYDFwIzMzMzMzPTvwMYAjMzMzMzM8M/AxkABwABGAAAAAAAAQIAAAABAQAAAAAAAAIAAAABAAABAAAAAAAAAAEAAAAAAAAAAQAAAQAAAQAAAAEAAQAAAAAAAwAAAAAAAAAAAAEAAAAAAQEAAAAAAAACAAAAAQAAAQAAAAAAAAABAAABAAABAAABAAAAAAADCAAAAAAFAAABAgAYowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBAQAAAABAbwMEALwBARYDAAAAnwEDAqQCAQAAAABAbwQFALwCAhYDAAAAnwIDAsADBgASAAIAEgAAABIAAQCCAwIABwMaBAAAAEADGwMcAx0DHgYAAQABAAEYAAIAAAAAAAEAAAAAAAEAAAAAAAIAAAAAAQAAAAABgkolcFDLuPytr7xDQ9miefJSMgSwjk9x

-- https://lua.expert/
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")

return function(p1, p2, p3) --[[ Line: 7 | Upvalues: Debris (copy), Players (copy), Lighting (copy) ]]
	if not (p1 and p1.Parent) then
		return
	end

	local v1 = p3 or 30
	local InsideDomainHighlight = p1:FindFirstChild("InsideDomainHighlight")

	if InsideDomainHighlight then
		Debris:AddItem(InsideDomainHighlight, v1)
	else
		local InsideDomainHighlight2 = Instance.new("Highlight")

		InsideDomainHighlight2.Name = "InsideDomainHighlight"
		InsideDomainHighlight2.FillColor = Color3.fromRGB(180, 0, 60)
		InsideDomainHighlight2.OutlineColor = Color3.fromRGB(255, 120, 170)
		InsideDomainHighlight2.FillTransparency = 0.55
		InsideDomainHighlight2.OutlineTransparency = 0
		InsideDomainHighlight2.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		InsideDomainHighlight2.Parent = p1
		Debris:AddItem(InsideDomainHighlight2, v1)
	end

	if Players:GetPlayerFromCharacter(p1) ~= Players.LocalPlayer then
		return
	end

	local InsideDomainCC = Lighting:FindFirstChild("InsideDomainCC")

	if InsideDomainCC then
		Debris:AddItem(InsideDomainCC, v1)

		return
	end

	local InsideDomainCC2 = Instance.new("ColorCorrectionEffect")

	InsideDomainCC2.Name = "InsideDomainCC"
	InsideDomainCC2.TintColor = Color3.fromRGB(180, 100, 140)
	InsideDomainCC2.Saturation = -0.3
	InsideDomainCC2.Contrast = 0.15
	InsideDomainCC2.Parent = Lighting
	Debris:AddItem(InsideDomainCC2, v1)
end