-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
function AncestryChangedHook(p1, p2, p3) --[[ AncestryChangedHook | Line: 1 ]]
	if p1 then
		local t = {
			Connections = {}
		}

		function t.Callback() --[[ Line: 11 | Upvalues: p3 (copy), p1 (copy), p2 (ref), t (ref) ]]
			local v1 = false

			if p3 then
				if typeof(p3) == "table" then
					for k, v in pairs(p3) do
						if p1:IsDescendantOf(v) then
							v1 = true

							break
						end
					end
				elseif p1:IsDescendantOf(p3) then
					v1 = true
				end
			elseif p1:IsDescendantOf(game) then
				v1 = true
			end

			if v1 then
				return
			end

			if p2 then
				task.spawn(p2)
			end

			if not (t and t.Destroy) then
				return
			end

			t.Destroy()
		end
		function t.Destroy() --[[ Line: 32 | Upvalues: t (ref), p2 (ref) ]]
			for v1, v2 in t.Connections do
				v2:Disconnect()
			end

			table.clear(t.Connections)

			if p2 then
				p2 = nil
			end

			t.Callback = nil
			t.Destroy = nil
			table.clear(t)
			t = nil
		end

		local Connections = t.Connections
		local Callback = t.Callback

		table.insert(Connections, p1.AncestryChanged:Connect(Callback))

		return t
	end
end
function UnequipHook(p1, p2, p3) --[[ UnequipHook | Line: 52 ]]
	if p1 and p2 then
		local t = {
			Connections = {}
		}
		local v1 = p2.Parent

		function t.Callback() --[[ Line: 59 | Upvalues: p2 (copy), v1 (copy), p1 (copy), p3 (ref), t (ref) ]]
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
		function t.Destroy() --[[ Line: 71 | Upvalues: t (ref), p3 (ref) ]]
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
	UnequipHook = UnequipHook,
	AncestryChangedHook = AncestryChangedHook
}