-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local BatchService = require(game.ReplicatedStorage.Shared.BatchService)
local t = {
	Registered = {}
}

BatchService:SetBatchSize("StickyKeySupport", 120)
BatchService:SetBatchFPS("StickyKeySupport", 60)
function t.SetupKey(p1, p2, p3, p4) --[[ SetupKey | Line: 12 | Upvalues: t (copy), BatchService (copy) ]]
	if p2 and not t.Registered[p2] then
		local t2 = {
			FireTime = p3 or 0.05,
			Accumulation = 0,
			Binded = false,
			CallbackFunction = p4
		}

		function t2.Destroy() --[[ Line: 26 | Upvalues: t2 (ref), BatchService (ref), p2 (copy), t (ref) ]]
			if t2._Runtime then
				BatchService:Remove(p2, t2._Runtime)
			end

			if t2.CallbackFunction then
				task.spawn(t2.CallbackFunction, "Destroy")
			end

			t.Registered[p2] = nil
			table.clear(t2)
			t2 = nil
		end
		function t2._Runtime(p1) --[[ Line: 38 | Upvalues: t2 (ref) ]]
			if not t2.CallbackFunction then
				return task.spawn(t2.Destroy)
			end

			local v1 = t2

			v1.Accumulation = v1.Accumulation + p1

			if not (t2.Accumulation <= t2.FireTime) then
				t2.Accumulation = 0
				t2.CallbackFunction("Began")
			end
		end
		function t2.InputBegan() --[[ Line: 49 | Upvalues: t2 (ref), BatchService (ref), p2 (copy) ]]
			if not t2.CallbackFunction then
				return task.spawn(t2.Destroy)
			end

			if not t2.Binded then
				BatchService:Add(p2, t2._Runtime)
				t2.Binded = true
			end
		end
		function t2.InputEnded() --[[ Line: 57 | Upvalues: t2 (ref), BatchService (ref), p2 (copy) ]]
			if not t2.CallbackFunction then
				return task.spawn(t2.Destroy)
			end

			if t2.Binded then
				BatchService:Remove(p2, t2._Runtime)
				t2.Binded = false
			end
		end
		t.Registered[p2] = t2
	end
end
function t.InputBegan(p1, p2, ...) --[[ InputBegan | Line: 68 | Upvalues: t (copy) ]]
	if t.Registered[p2] then
		t.Registered[p2].InputBegan(...)

		return
	end

	return print("Invalid Flag")
end
function t.InputEnded(p1, p2, ...) --[[ InputEnded | Line: 73 | Upvalues: t (copy) ]]
	if t.Registered[p2] then
		t.Registered[p2].InputEnded(...)

		return
	end

	return print("Invalid Flag")
end

return t