-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUDEF0dGFja2VyQ2hhcgR0eXBlBXRhYmxlCER1cmF0aW9uEVBhc3NpdmVfWm9uZVN0YXJ0D1Bhc3NpdmVfWm9uZUVuZARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzB0VmZmVjdHMHX1NoYXJlZBdDbGllbnRQYXNzaXZlRGlzcGF0Y2hlchFDbGllbnRQYXNzaXZlQmFzZQxDdXJzZWQgQ2hpbGQGV2VhcG9uCFJlZ2lzdGVyFEN1cnNlZENoaWxkWm9uZVN0YXJ0EkN1cnNlZENoaWxkWm9uZUVuZAADBwICAAAAHfsCAABNAgKqAAAAAFIDAACfAgICKwIBAIIAAQC7KAEDUgUBAKQEAgAAABBAnwQCAvAEBAADAACATQMB5QQAAAArAwEAjAMUAPsEAQBNBAQoBQAAAA4EBgD7BAEATQQEKAUAAABSBQIAUgYDAJ8EAwGCAAEABgMBAwIEAAAQQAMDAwQDBQAPAAEYAAAAAAABAAEAAAAAAAAAAAAAAQAAAAEAAAAAAAIQAAAAAAUCAgAAABH7AgAATQICqgAAAABSAwAAnwICAisCAQCCAAEA+wMBAE0DA/8BAAAADgMFAPsDAQBNAwP/AQAAAFIEAgCfAwIBggABAAIDAQMGABgAARgAAAAAAAEAAQAAAAEAAAAAAhkAAAAABwAAAQIAOKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAOgGAAAATQIClwcAAABNAgJGCAAAAE0CAkUJAAAAnwECAqQCBQAAAEBATQMA6AYAAABNAwOXBwAAAE0DA0YIAAAATQMDfAoAAACfAgICpAMFAAAAQEBNBQDoBgAAAE0FBZcHAAAATQUFXwwAAABNBAUwCwAAAJ8DAgJNBAGDDQAAAG8FDgDABg8AEgACABIAAwCfBAMBTQQBgw0AAABvBRAAwAYRABIAAgASAAMAnwQDAakEAQCCBAIAEgMHBAAAAEADCAMJAwoEAABAQAMLAwwDDQMOAw8DEAMRAxIDEwYAAxQGAQIAAQEAARgABAAAAAAABAAAAAAAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAABAAAAAAAAAkAAAAAAAAIAAEAAAAAAsn+NQvmuc0cLfo8Wj2QlxK55iJ/+zpfCg==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientPassiveDispatcher = require(ReplicatedStorage.Modules.Effects._Shared.ClientPassiveDispatcher)
local ClientPassiveBase = require(ReplicatedStorage.Modules.Effects._Shared.ClientPassiveBase)
local v1 = require(ReplicatedStorage.Modules.Effects.Weapon["Cursed Child"])

ClientPassiveDispatcher.Register("CursedChildZoneStart", function(p1, p2) --[[ Line: 15 | Upvalues: ClientPassiveBase (copy), v1 (copy) ]]
	local v12 = ClientPassiveBase.AttackerChar(p1)

	if not v12 then
		return
	end

	local v2 = if type(p2) == "table" then p2.Duration or 20 else 20

	if not v1.Passive_ZoneStart then
		return
	end

	v1.Passive_ZoneStart(v12, v2)
end)
ClientPassiveDispatcher.Register("CursedChildZoneEnd", function(p1, p2) --[[ Line: 24 | Upvalues: ClientPassiveBase (copy), v1 (copy) ]]
	local v12 = ClientPassiveBase.AttackerChar(p1)

	if not v12 then
		return
	end

	if not v1.Passive_ZoneEnd then
		return
	end

	v1.Passive_ZoneEnd(v12)
end)

return true