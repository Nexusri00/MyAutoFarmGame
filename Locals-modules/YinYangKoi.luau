-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMYBXBhaXJzBkRldGFjaApHZXRQYXNzaXZlDFlpbi1ZYW5nIEtvaQNWRlgFQXNzZXQGRm9sZGVyBFRpZXIGQXR0YWNoBlN0YW5jZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzDkNvbmZpZ3VyYXRpb25zCEZpc2hEYXRhBnNjcmlwdAZQYXJlbnQHX1NoYXJlZARZYW5nCl9DeWNsZVlhbmcDWWluCV9DeWNsZVlpbgACCgIDAAAHBAAABQIHgy+kAgEAAAAAQPsDAACfAgIEFwIIAPEFBwABAAAA+wcBAE0HB/UCAAAAUggAAFIJBgCfBwMBbgL3/wIAAABSAgEADgICAPsDAACHAgMBKwIBAIIAAQD7AwIATQMDXwMAAABvBAQAnwMCAk0DA34FAAAA+wQBAE0EBEYGAAAATQUDiAcAAACHBgMBTQcDiwgAAACfBAQCKwQBAIIAAQD7BQEATQUFVAkAAABSBgQAUgcAAFIIAgCfBQQBggABAAoDAQQAAABAAwIDAwMEAwUDBgMHAwgDCQAZCgEYAAAAAAABAAEAAAAAAP4ABgAAAAEAAgAAAAAAAAEAAAAAAAAAAAEAAgAAAAAAAAEaAAAAAAYAAAECACOjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgDoBgAAAE0CAroHAAAATQICoQgAAACfAQICpAIFAAAAQECkAwoAAACQQE0DAyQLAAAATQMDRgwAAACfAgIC/wMBAAAAAADiBBEAwAUSABIABAASAAIAEgABADAFAx8TAAAAggMCABQDCwQAAABAAwwDDQMOBAAAQEADDwMQAxEDEgQAAJBAAxMDFAMVAxYDFwMYCAINDgAAAA8QAAAABgADCgEAAQABGAAEAAAAAAAEAAAAAAAAAAABAAAAAAAAAAAEAAUGAAAAAAARAQAAAAABhjTpe/bizdH3vN/mvVIlRvYs/g+08IN6

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishData = require(ReplicatedStorage.Modules.Configurations.FishData)
local _Shared = require(script.Parent._Shared)
local t = {}
local t2 = {
	Yang = "_CycleYang",
	Yin = "_CycleYin"
}

function t.Stance(p1, p2) --[[ Stance | Line: 25 | Upvalues: t2 (copy), _Shared (copy), FishData (copy) ]]
	for k, v in pairs(t2) do
		if k ~= p2 then
			_Shared.Detach(p1, v)
		end
	end

	local v1 = if p2 then t2[p2] else p2

	if not v1 then
		return
	end

	local VFX = FishData.GetPassive("Yin-Yang Koi").VFX
	local v2 = _Shared.Asset(VFX.Folder, VFX[p2], VFX.Tier)

	if v2 then
		_Shared.Attach(v2, p1, v1)
	end
end

return t