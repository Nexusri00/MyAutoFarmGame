-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMSCEV4ZWN1dG9yBlVzZXJJZARFbnVtEVRleHRGaWx0ZXJDb250ZXh0ClB1YmxpY0NoYXQRRmlsdGVyU3RyaW5nQXN5bmMGaXBhaXJzCkdldFBsYXllcnMRQ2FuVXNlcnNDaGF0QXN5bmMHTWVzc2FnZRNHZXRDaGF0Rm9yVXNlckFzeW5jCVNlbmRFdmVudBVDcmVhdGVkIGFubm91bmNlbWVudC4EZ2FtZQtUZXh0U2VydmljZQpHZXRTZXJ2aWNlB1BsYXllcnMEQ2hhdAACDwIDAAAALvsCAABSBAEATQUA/wAAAABNBQXmAQAAAKQGBQAEDCDAvAIC+QYAAACfAgUCpAMIAAAAcED7BAEAvAQEqwkAAACfBAIAnwMABFEDFwD7CAIATQoA/wAAAABNCgrmAQAAAE0LB+YBAAAAvAgIHAoAAACfCAQCDggMAFIKBwBvCwsATQ4H5gEAAAC8DAJnDAAAAJ8MAwJNDQD/AAAAALwIANkNAAAAnwgGAW4D6P8CAACAbwMOAIIDAgAPAwEDAgMDAwQDBQQEDCDAAwYDBwQAAHBAAwgDCQMKAwsDDAMNAAUAARgAAAAAAAAAAAAAAAIAAAAAAAAAAQAAAAAAAAAAAAABAAAAAAAAAAAAAAD+AAYABgAAAAAFAAABAgAYowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBAQAAAABAbwMEALwBARYDAAAAnwEDAqQCAQAAAABAbwQFALwCAhYDAAAAnwIDAsADBgASAAAAEgABABIAAgCCAwIABwMOBAAAAEADDwMQAxEDEgYAAQABAAEYAAAAAAAAAAEAAAAAAAEAAAAAAAIAAAAAAQAAAAABgJdBvdjHIGD2rINMNO8CnfCPVsmyUyu8

-- https://lua.expert/
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local Chat = game:GetService("Chat")

return function(p1, p2) --[[ Line: 5 | Upvalues: TextService (copy), Players (copy), Chat (copy) ]]
	local v1 = TextService:FilterStringAsync(p2, p1.Executor.UserId, Enum.TextFilterContext.PublicChat)

	for i, v in ipairs(Players:GetPlayers()) do
		if Chat:CanUsersChatAsync(p1.Executor.UserId, v.UserId) then
			p1:SendEvent(v, "Message", v1:GetChatForUserAsync(v.UserId), p1.Executor)
		end
	end

	return "Created announcement."
end