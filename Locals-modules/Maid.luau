-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMXBnR5cGVvZhNSQlhTY3JpcHRDb25uZWN0aW9uCkRpc2Nvbm5lY3QIZnVuY3Rpb24ISW5zdGFuY2UHRGVzdHJveQV0YWJsZQdkZXN0cm95C2NsZWFudXBUYXNrBl9hbGl2ZQZfdGFza3MMc2V0bWV0YXRhYmxlA25ldwZpbnNlcnQEZ2l2ZQZpcGFpcnMHZ2l2ZUFsbAVjbGVhbgdpc0FsaXZlB19faW5kZXgFQ2xlYW4ER2l2ZQdHaXZlQWxsAAgEAQAAAAAzuywAA1ICAACkAQEAAAAAQJ8BAgLwAQUAAgAAgLwBABoDAAAAnwECAYIAAQC7LAADUgIAAKQBAQAAAABAnwECAvABBAAEAACAUgEAAJ8BAQGCAAEAuywAA1ICAACkAQEAAAAAQJ8BAgLwAQUABQAAgLwBAFAGAAAAnwECAYIAAQC7LAADUgIAAKQBAQAAAABAnwECAvABAgAHAAAAggABAE0BAFAGAAAAKwECAE0BADAIAAAAKwEBAIIAAQBSAgEAUgMAAJ8CAgGCAAEACQMBBAAAAEADAgMDAwQDBQMGAwcDCAAGCQEYAAAAAAAAAAEAAAIDAAAAAAAAAQACAwAAAAAAAAEAAAIDAAAAAAAAAQMAAAAAAgEDAAABBwAAAAADAAEAAAAM4gEDAP8CAAAAAAAAMAIBpwIAAAD7AgAAnj0BAwIAAACkAAUAAABAQJ8AAwKCAAIABgMKAQEDCwgCAAEAAAAC/////wMMBAAAQEAAJg0BGAACAAAAAQAA/QAAACcAAAAABQIBAAAAEE0CACEAAAAADgIJAE0DAKcBAAAAnjQDBAEAAABSBAEApAIEAAAMIICfAgMBggECAPsCAABSAwEAnwICAYIBAgAFAwoDCwMHAw4EAAwggAAsDwEYAAAAAQAAAAAAAAAAAgAAAy0AAAAACgIAAAAADKQCAQAAAABAUgMBAJ8CAgRRAgQAUgkGALwHAH8CAAAAnwcDAW4C+/8CAACAggABAAMDEAQAAABAAw8ANREBGAAAAAAAAQAAAP8AAzYAAAAABwEBAAAAD00BAKcAAAAA/wIAAAAAAAAwAgCnAAAAABwEAQCMAgEAjAP//6gCBAD7BQAAhwYBBJ8FAgGLAvz/ggABAAEDCwA6EgEYAAACAAAAAgAAAAEAAP8DOwAAAAADAQAAAAAHqQEAADABACEAAAAAvAEAbwEAAACfAQIBggABAAIDCgMSAEMIARgAAAABAAABRAAAAAACAQAAAAADTQEAIQAAAACCAQIAAQMKAEcTARgAAABIAAAAAAMAAAECACyjAAAA/wAFAAAAAAAwAABuAAAAAMABAQDAAgIAEgAAADACAO8DAAAAwAIEABIAAQAwAgB/BQAAAMACBgAwAgDaBwAAAMACCAASAAEAMAIAbwkAAADAAgoAMAIAMAsAAADAAgwAMAIAoQ0AAABNAgAwCwAAADACAFAOAAAATQIAbwkAAAAwAgBPDwAAAE0CAH8FAAAAMAIAnxAAAABNAgDaBwAAADACAPoRAAAAggACABIDFAYABgEDDQYCAw8GAwMRBgQDEgYFAwgGBgMTAwYDFQMWAxcHAAECAwQFBgEAARgAAQACAAIgAAAABgAAAAkAAAUAAAAJAAAEAAADAAAAAQAAAAEAAAABAAAAAgEAAAAABwaVBQvDIy8kXp4LPA3XSTh2jRJ/NFFvCg==

-- https://lua.expert/
local t = {}

t.__index = t

local function cleanupTask(p1) --[[ cleanupTask | Line: 6 ]]
	if typeof(p1) == "RBXScriptConnection" then
		p1:Disconnect()

		return
	end

	if typeof(p1) == "function" then
		p1()

		return
	end

	if typeof(p1) == "Instance" then
		p1:Destroy()

		return
	end

	if typeof(p1) ~= "table" then
		return
	end

	local v1 = p1.Destroy or p1.destroy

	if v1 then
		v1(p1)
	end
end

function t.new() --[[ new | Line: 38 | Upvalues: t (copy) ]]
	return setmetatable({
		_alive = true,
		_tasks = {}
	}, t)
end
function t.give(p1, p2) --[[ give | Line: 44 | Upvalues: cleanupTask (copy) ]]
	if p1._alive then
		table.insert(p1._tasks, p2)
	else
		cleanupTask(p2)
	end

	return p2
end
function t.giveAll(p1, p2) --[[ giveAll | Line: 53 ]]
	for i, v in ipairs(p2) do
		p1:give(v)
	end
end
function t.clean(p1) --[[ clean | Line: 58 | Upvalues: cleanupTask (copy) ]]
	local _tasks = p1._tasks

	p1._tasks = {}

	for i = #_tasks, 1, -1 do
		cleanupTask(_tasks[i])
	end
end
function t.destroy(p1) --[[ destroy | Line: 67 ]]
	p1._alive = false
	p1:clean()
end
function t.isAlive(p1) --[[ isAlive | Line: 71 ]]
	return p1._alive
end
t.Destroy = t.destroy
t.Clean = t.clean
t.Give = t.give
t.GiveAll = t.giveAll

return t