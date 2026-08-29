-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMeBl9ldmVudAhfamFuaXRvcgNuZXcMc2V0bWV0YXRhYmxlBnR5cGVvZgZzdHJpbmcGSm9pbmVkBXRhYmxlBlVwZGF0ZQVTdGFydAxBbmltRHVyYXRpb24GbnVtYmVyBkNsb3NlZARMZWZ0Bk5vdGlmeQ1PbkNsaWVudEV2ZW50B0Nvbm5lY3QKRGlzY29ubmVjdANBZGQFTW91bnQHQ2xlYW51cAhTaHV0ZG93bgRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdNb2R1bGVzBFpvbmUHSmFuaXRvcgdfX2luZGV4AAUEAQIAAAYDAAAFAQcQ4gICADAAAi0AAAAA+wMAAE0DA+8DAAAAnwMBAjADArsBAAAA+wMBAJ49AgMDAAAApAEFAAAAQECfAQMCggECAAYDAQMCBQIAAQMDAwQEAABAQAASAwEYAAEAAQAAAAAAAQAA/QAAABMAAAAABQIBAAAAX7ssAANSAwAApAIBAAAAAECfAgIC8AICAAIAAACCAAEA8AAPAAMAAIC7LAEDUgMBAKQCAQAAAABAnwICAvACAgAEAAAAggABAPsCAABNAgLxAwAAAFIDAQCfAgIBggABAPAADwAFAACAuywBA1IDAQCkAgEAAAAAQJ8CAgLwAgIABAAAAIIAAQD7AgAATQICJgUAAABSAwEAnwICAYIAAQDwABkABgAAgG8CBwC7LAEDUgQBAKQDAQAAAABAnwMCAvADCwAEAACATQQBBAgAAAC7LAQCpAMBAAAAAECfAwIC8AMDAAkAAIBNAgEECAAAAPsDAABNAwMcBgAAAFIEAgCfAwIBggABAPAABgAKAACA+wIAAE0CAjcKAAAAnwIBAYIAAQDwAAYACwAAgPsCAABNAgLGCwAAAJ8CAQGCAAEA8AANAAwAAIC7LAEDUgMBAKQCAQAAAABAnwICAvACBgACAACA+wIAAE0CAkMMAAAAUgMBAJ8CAgGCAAEADQMFBAAAAEADBgMHAwgDCQMKAgAAAAAAAPg/AwsDDAMNAw4DDwAbAAEYAAAAAAAAAAACAAEAAAAAAAAAAQAAAAAAAQABAAAAAAAAAAEAAAAAAAEAAQEAAAAAAAAAAAAAAAAAAAEAAgAAAAAAAQABAAAAAAEAAQAAAAABAAEAAAAAAAABAAAAAAMcAAAAAAcCAAAABwQAAAUCBAQQTQIAuwAAAABNBAAtAQAAAE0EBIwCAAAA2QYAABIAAQC8BATHAwAAAJ8EAwJvBQQAvAICXwUAAACfAgQBggABAAYDAgMBAxADEQMSAxMBARkUARgAAAEAAAAAAAAAABnmAAAcGgAAAAADAQAAAAAGTQEAuwAAAAC8AQHxAQAAAJ8BAgGCAAEAAgMCAxUAOBYBGAAAAAAAATkAAAAABAAAAQIAIKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAOgGAAAATQICIwcAAABNAgL8CAAAAJ8BAgL/AgMAAAAAADACAm4JAAAAwAMKABIAAQASAAIAMAMC7wsAAADAAwwAMAMCBA0AAADAAw4AMAMCuw8AAACCAgIAEAMXBAAAAEADGAMZAxoEAABAQAMbAxwDHQMeBgADAwYCAxQGAwMWAwACAwEAARgAAQAAAAAAAgAAAAAAAAAAAgABAAsAAAAABwAAHwAABAEAAAAABOzVO/mW9GMphScoUP4qL0qczSyN3hFR+A==

-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Janitor = require(ReplicatedStorage.Modules.Zone.Janitor)
local t = {}

t.__index = t
function t.new(p1) --[[ new | Line: 18 | Upvalues: Janitor (copy), t (copy) ]]
	return setmetatable({
		_event = p1,
		_janitor = Janitor.new()
	}, t)
end
function t.Mount(p1, p2) --[[ Mount | Line: 25 ]]
	p1._janitor:Add(p1._event.OnClientEvent:Connect(function(p1, p22) --[[ Line: 27 | Upvalues: p2 (copy) ]]
		if typeof(p1) ~= "string" then
			return
		end

		if p1 == "Joined" then
			if typeof(p22) == "table" then
				p2.Joined(p22)
			end
		elseif p1 == "Update" then
			if typeof(p22) == "table" then
				p2.Update(p22)
			end
		elseif p1 == "Start" then
			local v1 = 1.5

			if typeof(p22) == "table" and typeof(p22.AnimDuration) == "number" then
				v1 = p22.AnimDuration
			end

			p2.Start(v1)
		else
			if p1 == "Closed" then
				p2.Closed()

				return
			end

			if p1 == "Left" then
				p2.Left()

				return
			end

			if p1 ~= "Notify" or typeof(p22) ~= "string" then
				return
			end

			p2.Notify(p22)
		end
	end), "Disconnect")
end
function t.Shutdown(p1) --[[ Shutdown | Line: 56 ]]
	p1._janitor:Cleanup()
end

return t