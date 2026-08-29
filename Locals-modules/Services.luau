-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOAl9HBnJhd2dldAdfX2luZGV4BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdSZW1vdGVzDFdhaXRGb3JDaGlsZApJbnB1dEV2ZW50C091dHB1dEV2ZW50DkFjdGl2ZVRvb2xTZWxmBUlucHV0Bk91dHB1dAxzZXRtZXRhdGFibGUAAgUCAAAABwQAAAUCDwMJpAMBAAAAAECeMgMEAQAAAFIEAQCkAgMAAAAgQJ8CAwKCAgIABAMBBAAAAEADAgQAACBAAB8DARgAAAAAAAAAAAAgAAAAAAcAAAECACOjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCbwMEALwBANMFAAAAnwEDAuICCgBvBQsAvAMB0wUAAACfAwMCMAMCzwYAAABvBQwAvAMB0wUAAACfAwMCMAMC6gcAAADiBQ4AwAYPADAGBW4NAAAAnj0CBAUAAABSBAIApAMRAAAAAEGfAwMBggICABIDBAQAAABAAwUDBgMHAwgDCQMKAwsACAMG/////wf/////CAkAAAADDAMNAwMFAQ0GAAMOBAAAAEEBAAEAARgAAgAAAAAAEwAAAAIBAAAAAAABAAAAAAAEAQAAAAAA/wAABgEAAAAAAUSpG2MqfCqhRH5yEUXer8c0sQwXdm1xYg==

-- https://lua.expert/
local Remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local t = {
	ActiveToolSelf = nil,
	InputEvent = Remotes:WaitForChild("Input"),
	OutputEvent = Remotes:WaitForChild("Output")
}

setmetatable(t, {
	__index = function(p1, p2) --[[ __index | Line: 31 ]]
		return rawget(_G, p2)
	end
})

return t