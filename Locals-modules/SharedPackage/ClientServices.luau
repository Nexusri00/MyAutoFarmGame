-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMLAl9HDkNsaWVudFNlcnZpY2VzB19faW5kZXgHcmVxdWlyZQRnYW1lDVN0YXJ0ZXJQbGF5ZXIXU3RhcnRlckNoYXJhY3RlclNjcmlwdHMZQ29tYmF0RnJhbWV3b3JrX0NoYXJhY3RlcgVUeXBlcwtTZXJ2aWNlVHlwZQxzZXRtZXRhdGFibGUAAgQCAAAABwQAAAUCDwMJpAIBAAAAAEBNAgLfAgAAAA4CAgCHAwIBggMCAMYDAACCAwIAAwMBBAAAAEADAgAHAwEYAAAAAAEBAAIACAAAAAAFAAABAgAcowAAAKQAAQAAAABApAEDAAAAIEBNAQExBAAAAE0BAXcFAAAATQEB2wYAAABNAQHvBwAAAE0BAR8IAAAAnwACAv8CAAAAAAAA4gMKAMAECwAwBANuCQAAAJ49AgMDAAAApAENAAAAwECfAQMCggECAA4DBAQAAABAAwUEAAAgQAMGAwcDCAMJAwoDAwUBCQYAAwsEAADAQAEAAQABGAACAAAAAAAAAAAAAAAAAAADAAABAAAAAP8AAAABAAAAAAE+5OpGQbPcvbrVROdjmzHDTvz9MgwggEc=

-- https://lua.expert/
require(game.StarterPlayer.StarterCharacterScripts.CombatFramework_Character.Types.ServiceType)

return setmetatable({}, {
	__index = function(p1, p2) --[[ __index | Line: 7 ]]
		local ClientServices = _G.ClientServices

		if ClientServices then
			return ClientServices[p2]
		end

		return nil
	end
})