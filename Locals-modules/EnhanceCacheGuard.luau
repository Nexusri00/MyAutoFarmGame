-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMGBnR5cGVvZgZudW1iZXILU2hvdWxkV3JpdGUFQXBwbHkHQ2xlYW51cBNDbGVhbnVwV2l0aFRlYXJkb3duAAUEAgAAAAcEAAAFAoKCD7ssAQNSAwEApAIBAAAAAECfAgIC8AIDAAIAAACpAgAAggICAJADAAPUAwIAAQAAAKkCAAGpAgEAggICAAQDAQQAAABAAwICAAAAAAAAAAAADAMBGAAAAAAAAAABAAIAAAAAAA0AAAAACAUBAAAKBwAABQUEBAMCghy7LAQDUgYEAKQFAQAAAABAnwUCAvAFCQACAAAAhwUAAkcFBAAAAACAagMAAqkFAQCCBQIAqQUAAIIFAgD7BQAATQUFUQMAAACHBgECUgcEAJ8FAwIrBQIAqQUAAIIFAgBqAwACagQBAqkFAQCCBQIABAMBBAAAAEADAgMDABMEARgAAAAAAAAAAQAAAQEAAgACAAAAAAAAAQACAQEAGgAAAAAEAwAAAAgFAAAFAwQEAwXGAwAAagMAAsYDAABqAwECggABAAAAKQUBGAAAAQABKgAAAAAGBAAAAAkGAAAFBAQEA4UKxgQAAGoEAALGBAAAagQBAkcDBAAAAAAAUgQDAFIFAgCfBAIBggABAAAALgYBGAAAAQABAAEAAAI0AAAAAAIAAAECABGjAAAA/wADAAAAAADAAQAAMAEAUQEAAADAAQIAEgAAADABAC8DAAAAwAEEADABAPEFAAAAwAEGADABAEgHAAAAggACAAgGAAMDBgEDBAYCAwUGAwMGBAABAgMBAAEYAAIACQAABwAAABYAAAUAAA0BAAAAAATKdJ3ux6aUEFyOmXJXL+raumyKmviw9+8=

-- https://lua.expert/
local t = {
	ShouldWrite = function(p1, p2) --[[ ShouldWrite | Line: 12 ]]
		if typeof(p2) ~= "number" then
			return false
		end

		return (p1 or 0) <= p2
	end
}

function t.Apply(p1, p2, p3, p4, p5) --[[ Apply | Line: 19 | Upvalues: t (copy) ]]
	if typeof(p5) == "number" then
		if t.ShouldWrite(p2[p3], p5) then
			p1[p3] = p4
			p2[p3] = p5

			return true
		end

		return false
	end

	if p1[p3] == nil then
		p1[p3] = p4

		return true
	end

	return false
end
function t.Cleanup(p1, p2, p3) --[[ Cleanup | Line: 41 ]]
	p1[p3] = nil
	p2[p3] = nil
end
function t.CleanupWithTeardown(p1, p2, p3, p4) --[[ CleanupWithTeardown | Line: 46 ]]
	p1[p3] = nil
	p2[p3] = nil

	if p4 == nil then
		return
	end

	p4(p3)
end

return t