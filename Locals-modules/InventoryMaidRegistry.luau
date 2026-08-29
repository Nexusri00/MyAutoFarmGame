-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMODHNldG1ldGF0YWJsZQhfZmFjdG9yeQZfbWFpZHMDbmV3CkRpc2Nvbm5lY3QDQWRkBVRyYWNrB0NsZWFudXAFcGFpcnMFdGFibGUFY2xlYXIKQ2xlYW51cEFsbAdIYXNNYWlkB19faW5kZXgABgQBAQAABgMAAAUBBQ//AgIAAAAAAPsDAACePQIDAwAAAKQBAQAAAABAnwEDAjAAAV8CAAAA/wIAAAAAAAAwAgE+AwAAAIIBAgAEAwEEAAAAQAMCAwMAGwQBGAAAAAAAAAAAAQABAAAAARwAAAAACgQAAAAJBgAABQQEAwcDEk0FAD4AAAAAhwQFASsEBwBNBQBfAQAAAJ8FAQJSBAUATQUAPgAAAABqBAUBUgcCAG8IAgBSCQMAvAUEXwMAAACfBQUBggABAAQDAwMCAwUDBgAiBwEYAAAAAQEAAAABAAACAAAAAAABIwAAAAAFAgAAAAcEAAAFAgQDDE0DAD4AAAAAhwIDAQ4CBwC8AwLxAQAAAJ8DAgFNAwA+AAAAAMYEAABqBAMBggABAAIDAwMIACsIARgAAAABAQAAAQAAAAIsAAAAAAgBAAAAABGkAQEAAAAAQE0CAD4CAAAAnwECBBcBAwC8BgXxAwAAAJ8GAgFuAfz/AgAAAKQBBgAAFECATQIAPgIAAACfAQIBggABAAcDCQQAAABAAwMDCAMKAwsEABRAgAAzDAEYAAAAAAAAAQAA/wADAAAAAAE0AAAAAAUCAAAABwQAAAUCBAMITQQAPgAAAACHAwQBRwMCAAAAAICpAgABqQIBAIICAgABAwMAOg0BGAAAAAAAAAAAOwAAAAADAAABAgAXowAAAP8ABAAAAAAAMAAAbgAAAADAAQEAEgAAAMACAgAwAgDgAwAAAMACBAAwAgDxBQAAAMACBgAwAgCkBwAAAMACCAAwAgBiCQAAAOICCwAwAQLvCgAAAIICAgAMAw4GAAYBAwcGAgMIBgMDDAYEAw0DBAUBCgUAAQIDBAEAARgAFQABAAQABwAACQAACAAABwAABgEAAAEAAAAABYgzR4Um3FgNfx/nBfWcKzL4K1DxuvcthA==

-- https://lua.expert/
local t = {}

t.__index = t

local function new(p1) --[[ new | Line: 27 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)

	v2._factory = p1
	v2._maids = {}

	return v2
end

function t.Track(p1, p2, p3, p4) --[[ Track | Line: 34 ]]
	local v1 = p1._maids[p2]

	if not v1 then
		local v2 = p1._factory()

		p1._maids[p2] = v2
		v1 = v2
	end

	v1:Add(p3, "Disconnect", p4)
end
function t.Cleanup(p1, p2) --[[ Cleanup | Line: 43 ]]
	local v1 = p1._maids[p2]

	if not v1 then
		return
	end

	v1:Cleanup()
	p1._maids[p2] = nil
end
function t.CleanupAll(p1) --[[ CleanupAll | Line: 51 ]]
	for k, v in pairs(p1._maids) do
		v:Cleanup()
	end

	table.clear(p1._maids)
end
function t.HasMaid(p1, p2) --[[ HasMaid | Line: 58 ]]
	return p1._maids[p2] ~= nil
end

return {
	new = new
}