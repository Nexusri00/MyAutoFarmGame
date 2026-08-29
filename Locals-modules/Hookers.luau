-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMPBGdhbWUOSXNEZXNjZW5kYW50T2YGUGFyZW50BHRhc2sFc3Bhd24HRGVzdHJveQtDb25uZWN0aW9ucwpEaXNjb25uZWN0BXRhYmxlBWNsZWFyCENhbGxiYWNrD0FuY2VzdHJ5Q2hhbmdlZAdDb25uZWN0Bmluc2VydAtVbmVxdWlwSG9vawAEBAAFAAAAKqkAAQD7AQAApAMBAAAAAEC8AQGtAgAAAJ8BAwIOAQYA+wEAAE0BASQDAAAA+wIBAPEBAgACAAAAqQAAAPsBAgCkAwEAAAAAQLwBAa0CAAAAnwEDAisBAQCpAAAADgABAIIAAQD7AQMADgEEAKQBBgAAFECA+wIDAJ8BAgH7AQQADgEIAPsBBABNAQFQBwAAAA4BBAD7AQQATQEBUAcAAACfAQEBggABAAgDAQQAAABAAwIDAwMEAwUEABRAgAMGAAgAARgAAQAAAAAAAAAAAAAAAAABAAAAAAAAAAIAAQAAAAAAAQAAAAAAAQAAAAIJAAAAAAcAAgAAACX7AAAATQAA8QAAAADGAQAAxgIAAGQABAC8BQQaAQAAAJ8FAgHGBAAAbgD7/wIAAACkAAQAAAwggPsBAABNAQHxAAAAAJ8AAgH7AAEADgACAMYAAADeAAEA+wAAAMYBAAAwAQBGBQAAAPsAAADGAQAAMAEAUAYAAACkAAQAAAwggPsBAACfAAIBxgAAAN4AAACCAAEABwMHAwgDCQMKBAAMIIADCwMGABQAARgAAAAAAAABAAAB/gAEAAAAAAACAAAAAQAAAAEAAAACAAAAAQABFQAAAAAKAwAAAAgFAAAFAwcHBTUOAAEAKwECAMECAACCAAEA/wMDAAAAAAD/BAAAAAAAADAEA/EAAAAATQQBJAEAAADZBQAAEgABABIABAASAAAAEgEC/xIBA/8wBQNGAgAAANkFAQASAQP/EgEC/zAFA1ADAAAATQYD8QAAAABNBwGLBAAAAE0JA0YCAAAAvAcHxwUAAACfBwMATDQAAqQFCAAAHGCAnwUAAU0GA/EAAAAATQcAiwQAAABNCQNGAgAAALwHB8cFAAAAnwcDAEw0AAKkBQgAABxggJ8FAAHBAgAAggMCAAkDBwMDAwsDBgMMAw0DCQMOBAAcYIACAAEBDwEYAAAAAAIAAQAAAAIAAQAAAAAAAAAMAAAAAA8AAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAgACAAAAAAIAAAECAAqjAAAAwAAAABgAANcBAAAA4gACADUBANcBAAAAMAEA1wEAAACCAAIAAwYCAw8FAQEBAgEAARgAAAAAKAEAAAAAAQAAAAADTwlMguZxDop8ApHtUHr4qD8RW/Z9zSaD

-- https://lua.expert/
function UnequipHook(p1, p2, p3) --[[ UnequipHook | Line: 1 ]]
	if p1 and p2 then
		local t = {
			Connections = {}
		}
		local v1 = p2.Parent

		function t.Callback() --[[ Line: 8 | Upvalues: p2 (copy), v1 (copy), p1 (copy), p3 (ref), t (ref) ]]
			local v12 = p2:IsDescendantOf(game) and p2.Parent == v1 and true or false

			if not p1:IsDescendantOf(game) then
				v12 = false
			end

			if v12 then
				return
			end

			if p3 then
				task.spawn(p3)
			end

			if not (t and t.Destroy) then
				return
			end

			t.Destroy()
		end
		function t.Destroy() --[[ Line: 20 | Upvalues: t (ref), p3 (ref) ]]
			for v1, v2 in t.Connections do
				v2:Disconnect()
			end

			table.clear(t.Connections)

			if p3 then
				p3 = nil
			end

			t.Callback = nil
			t.Destroy = nil
			table.clear(t)
			t = nil
		end

		local Connections = t.Connections
		local Callback = t.Callback

		table.insert(Connections, p2.AncestryChanged:Connect(Callback))

		local Connections2 = t.Connections
		local Callback2 = t.Callback

		table.insert(Connections2, p1.AncestryChanged:Connect(Callback2))

		return t
	end
end

return {
	UnequipHook = UnequipHook
}