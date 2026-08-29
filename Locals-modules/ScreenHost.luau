-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTBlBhcmVudBByZXNvbHZlQ29udGFpbmVyCEluc3RhbmNlA25ldwlTY3JlZW5HdWkTUGFydEljbGVzU2NyZWVuSG9zdAROYW1lCkFyY2hpdmFibGUMRGlzcGxheU9yZGVyDFJlc2V0T25TcGF3bg5JZ25vcmVHdWlJbnNldANnZXQFcGNhbGwHRGVzdHJveQdkZXN0cm95BmV4aXN0cwdyZXF1aXJlBnNjcmlwdAdHdWlIb3N0AAQDAAIAAAAt+wAAAA4ABgD7AAAATQAAJAAAAAAOAAIA+wAAAIIAAgD7AAEATQAAwgEAAACfAAECKwACAMYBAACCAQIApAEEAAAMIIBvAgUAnwECAt4BAAD7AQAAbwIGADACAboHAAAA+wEAAKkCAAAwAgFuCAAAAPsBAACMAvb/MAIBywkAAAD7AQAAqQIAADACAaQKAAAA+wEAAKkCAQAwAgEFCwAAAPsBAAAwAAEkAAAAAPsBAACCAQIADAMBAwIDAwMEBAAMIIADBQMGAwcDCAMJAwoDCwAIDAEYAAAAAAAAAAABAAAAAQAAAQAAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAEACQAAAAADAAEAAAAM+wAAAA4ACQCkAAEAAAAAQPsBAABNAQFQAgAAAPsCAACfAAMBxgAAAN4AAACCAAEAAwMNBAAAAEADDgAWDwEYAAAAAAAAAAAAAAABFwAAAAACAAEAAAAK+wAAAA4ABwD7AQAATQEBJAAAAABHAQIAAAAAgKkAAAGpAAEAggACAAEDAQAaEAEYAAAAAAAAAAAAABoAAAAABAAAAQIAHKMAAACkAAEAAAAAQKQBAwAAACBATQEBJAQAAABNAQEJBQAAAJ8AAgL/AQMAAAAAAMYCAADZAwAAEgEC/xIAAAAwAwFfBgAAANkDAQASAQL/MAMBMAcAAADZAwIAEgEC/zADARoIAAAAwQIAAIIBAgAJAxEEAAAAQAMSBAAAIEADAQMTAwwDDwMQAwABAgEAARgAAgAAAAAAAAAAAgABAgAAAAAOAAAABAAAAAIAAQAAAAAD1FB4ZgJ3hqMo3gEEMtyvZKRIbxLmlBJn

-- https://lua.expert/
local GuiHost = require(script.Parent.GuiHost)
local t = {}
local v1 = nil

function t.get() --[[ get | Line: 8 | Upvalues: v1 (ref), GuiHost (copy) ]]
	if v1 and v1.Parent then
		return v1
	end

	local v12 = GuiHost.resolveContainer()

	if v12 then
		v1 = Instance.new("ScreenGui")
		v1.Name = "PartIclesScreenHost"
		v1.Archivable = false
		v1.DisplayOrder = -10
		v1.ResetOnSpawn = false
		v1.IgnoreGuiInset = true
		v1.Parent = v12

		return v1
	end

	return nil
end
function t.destroy() --[[ destroy | Line: 22 | Upvalues: v1 (ref) ]]
	if not v1 then
		return
	end

	pcall(v1.Destroy, v1)
	v1 = nil
end
function t.exists() --[[ exists | Line: 26 | Upvalues: v1 (ref) ]]
	return v1 and v1.Parent ~= nil
end

return t