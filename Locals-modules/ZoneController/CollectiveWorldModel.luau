-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMVCElzQ2xpZW50EVJlcGxpY2F0ZWRTdG9yYWdlDVNlcnZlclN0b3JhZ2UISW5zdGFuY2UDbmV3CldvcmxkTW9kZWwSWm9uZVBsdXNXb3JsZE1vZGVsBE5hbWUEZ2FtZQpHZXRTZXJ2aWNlBlBhcmVudA9zZXR1cFdvcmxkTW9kZWwJd29ya3NwYWNlBXBhaXJzBXRhYmxlBmluc2VydBNfZ2V0Q29tYmluZWRSZXN1bHRzEkdldFBhcnRCb3VuZHNJbkJveBVHZXRQYXJ0Qm91bmRzSW5SYWRpdXMOR2V0UGFydHNJblBhcnQKUnVuU2VydmljZQAGBgECAAAAIPsBAAAOAQIA+wEAAIIBAgD7AgEAvAICBAAAAACfAgICDgICAG8BAQBlAAEAbwECAKQCBQAAEDCAbwMGAJ8CAgLeAgAA+wIAAG8DBwAwAwK6CAAAAPsCAACkAwoAAACQQFIFAQC8AwMWCwAAAJ8DAwIwAwIkDAAAAPsCAACCAgIADQMBAwIDAwMEAwUEABAwgAMGAwcDCAMJBAAAkEADCgMLAAgMARgAAAEAAgAAAAAAAAABAAAAAAEAAAABAAAAAAAAAAABAAkAAAAADAIBAQAAHqMCAACkAwEAAAAAQIcCAwGkAwEAAAAAQN0EAACfAgAC+wMAAA4DEwD7BAAAhwMEAfsEAADdBQAAnwMAAqQEAwAAACBAUgUDAJ8EAgQXBAcAnjQCBQgAAABSCgIAUgsIAKQJBgAAFECAnwkDAW4E+P8CAAAAggICAAcDDQQAAABAAw4EAAAgQAMPAxAEABRAgAAWEQEYAAEAAAAAAAABAAEAAAAAAQAAAAABAAAAAAAA/wAEFgAAAAAKBAAAAAAIbwYAAFIHAQBSCAIAUgkDALwEAKoBAAAAnwQGAIIEAAACAxIDEQAhEgEYAAAAAAAAAAAiAAAAAAoEAAAAAAhvBgAAUgcBAFIIAgBSCQMAvAQAqgEAAACfBAYAggQAAAIDEwMRACUTARgAAAAAAAAAACYAAAAACAMAAAAAB28FAABSBgEAUgcCALwDAKoBAAAAnwMFAIIDAAACAxQDEQApFAEYAAAAAAAAACoAAAAABQAAAQIAHqMAAAD/AAQAAAAAAMYBAACkAgEAAAAAQG8EAgC8AgIWAwAAAJ8CAwLZAwAAEgEB/xIAAgAwAwDxBAAAANkDAQASAQH/MAMAqgUAAADAAwYAMAMALwcAAADAAwgAMAMATAkAAADAAwoAMAMAtQsAAADBAQAAggACAAwDCQQAAABAAxUDCgMMAxEGAgMSBgMDEwYEAxQFAAECAwQBAAEYAAAAAQEAAAAAAAUAAAAADgAAAAsAAAQAAAQAAAYAAQAAAAAF8MgvhNfFGcdKfOBfpnIlk4DQOPDCDEWF

-- https://lua.expert/
local t = {}
local v1 = nil
local RunService = game:GetService("RunService")

function t.setupWorldModel(p1) --[[ setupWorldModel | Line: 8 | Upvalues: v1 (ref), RunService (copy) ]]
	if v1 then
		return v1
	end

	local v12 = if RunService:IsClient() then "ReplicatedStorage" else "ServerStorage"

	v1 = Instance.new("WorldModel")
	v1.Name = "ZonePlusWorldModel"
	v1.Parent = game:GetService(v12)

	return v1
end
function t._getCombinedResults(p1, p2, ...) --[[ _getCombinedResults | Line: 22 | Upvalues: v1 (ref) ]]
	local v12 = workspace[p2](workspace, ...)

	if v1 then
		for k, v in pairs((v1[p2](v1, ...))) do
			table.insert(v12, v)
		end
	end

	return v12
end
function t.GetPartBoundsInBox(p1, p2, p3, p4) --[[ GetPartBoundsInBox | Line: 33 ]]
	return p1:_getCombinedResults("GetPartBoundsInBox", p2, p3, p4)
end
function t.GetPartBoundsInRadius(p1, p2, p3, p4) --[[ GetPartBoundsInRadius | Line: 37 ]]
	return p1:_getCombinedResults("GetPartBoundsInRadius", p2, p3, p4)
end
function t.GetPartsInPart(p1, p2, p3) --[[ GetPartsInPart | Line: 41 ]]
	return p1:_getCombinedResults("GetPartsInPart", p2, p3)
end

return t