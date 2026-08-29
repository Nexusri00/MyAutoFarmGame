-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
local t = {}

t.__index = t
function t.new(p1, p2) --[[ new | Line: 7 | Upvalues: t (copy) ]]
	return setmetatable({
		_connected = true,
		_signal = p1,
		_fn = p2
	}, t)
end
function t.Disconnect(p1) --[[ Disconnect | Line: 15 ]]
	if not p1._connected then
		return
	end

	p1._connected = false

	local _listeners = p1._signal._listeners

	for i, v in ipairs(_listeners) do
		if v == p1 then
			table.remove(_listeners, i)

			return
		end
	end
end

local t2 = {}

t2.__index = t2
function t2.new() --[[ new | Line: 31 | Upvalues: t2 (copy) ]]
	return setmetatable({
		_listeners = {}
	}, t2)
end
function t2.Connect(p1, p2) --[[ Connect | Line: 37 | Upvalues: t (copy) ]]
	local v1 = t.new(p1, p2)

	table.insert(p1._listeners, v1)

	return v1
end
function t2.Fire(p1, ...) --[[ Fire | Line: 43 ]]
	for i, v in ipairs(p1._listeners) do
		if v._connected then
			task.spawn(v._fn, ...)
		end
	end
end
function t2.Wait(p1) --[[ Wait | Line: 51 ]]
	local v1 = coroutine.running()
	local v2 = nil

	v2 = p1:Connect(function(...) --[[ Line: 54 | Upvalues: v2 (ref), v1 (copy) ]]
		v2:Disconnect()
		task.spawn(v1, ...)
	end)

	return coroutine.yield()
end
function t2.DisconnectAll(p1) --[[ DisconnectAll | Line: 61 ]]
	for i, v in ipairs(p1._listeners) do
		v._connected = false
	end

	table.clear(p1._listeners)
end
function t2.Destroy(p1) --[[ Destroy | Line: 68 ]]
	p1:DisconnectAll()
end

return setmetatable({
	new = t2.new
}, {
	__call = function() --[[ __call | Line: 75 | Upvalues: t2 (copy) ]]
		return t2.new()
	end
})