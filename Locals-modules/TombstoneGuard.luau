-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOAm9zBWNsb2NrBXZhbHVlCHRpbWVkT3V0BHRhc2sEd2FpdApQb2xsRm9yS2V5FlBvbGxGb3JLZXlXaXRoRGVhZGxpbmUJdG9tYnN0b25lBnJlYXNvbgNlcnIFcGNhbGwIdG9zdHJpbmcKUnVuR3VhcmRlZAAEBgIAAAAHBAAABQIFAhukAwIAAAQAgJ8DAQJDAgMBUgMAAJ8DAQJHAxAAAAAAgKQEAgAABACAnwQBAn0CAwAEAAAA4gQHAIIEAgCkBAoAACSAgG8FCwCfBAIBUgQAAJ8EAQJSAwQASADv/+IEDQAwAwTMAwAAAIIEAgAOAwEDAgQABACAAwMAAwQBAQgCAwQAAAAFBgAAAAMFAwYEACSAgAKamZmZmZmpPwEACAID/////wUMAAAAABgHARgAAAAAAQABAAEAAAAAAQACAAAAAQAA+wcAAAAZAAAAAAUCAAAABwQAAAUCBQIXUgIAAJ8CAQJHAhAAAAAAgKQDAgAABACAnwMBAn0BAwADAAAA4gMHAIIDAgCkAwoAACSAgG8ECwCfAwIBUgMAAJ8DAQJSAgMASADv/+IDDQAwAgPMAwAAAIIDAgAOAwEDAgQABACAAwMAAwQBAQgCAwQAAAAFBgAAAAMFAwYEACSAgAKamZmZmZmpPwEACAID/////wUMAAAAACUIARgAAAEAAQAAAAABAAIAAAABAAD7BwAAACYAAAAABwIAAAAHBAAABQIFgRgqAQUAAQAAgFICAACfAgEB4gIFAIICAgCkAgcAAABgQFIDAACfAgIDKwILAOIECQC7PwMDUgYDAKQFCwAAAKBAnwUCAjAFBKcCAAAAMAME3QQAAACCBAIA4gQFAIIEAgAMAwkBAAMKAAMLCAMAAQAAAAIDAAAABAMAAAADDAQAAGBAAQEIAwAIAAAAAv////8E/////wMNBAAAoEAAMQ4BGAAAAQABAAIAAAABAQAAAAAAAAAAAAACADIAAAAABAAAAQIADaMAAAD/AAMAAAAAAMABAADAAgEAwAMCADABAAgDAAAAMAIAEwQAAAAwAwCCBQAAAIIAAgAGBgAGAQYCAwcDCAMOAwABAgEAARgAEwAEDQwOAAEAAQACAQAAAAADZiMpTzaWZ6rsKkVPvlTOQhY7PjtU50NO

-- https://lua.expert/
local t = {}

local function PollForKey(p1, p2) --[[ PollForKey | Line: 24 ]]
	local v1 = os.clock() + p2
	local v2 = p1()

	while v2 == nil do
		if v1 <= os.clock() then
			return {
				value = nil,
				timedOut = true
			}
		end

		task.wait(0.05)
		v2 = p1()
	end

	return {
		timedOut = false,
		value = v2
	}
end

local function PollForKeyWithDeadline(p1, p2) --[[ PollForKeyWithDeadline | Line: 37 ]]
	local v1 = p1()

	while v1 == nil do
		if p2 <= os.clock() then
			return {
				value = nil,
				timedOut = true
			}
		end

		task.wait(0.05)
		v1 = p1()
	end

	return {
		timedOut = false,
		value = v1
	}
end

local function RunGuarded(p1, p2) --[[ RunGuarded | Line: 49 ]]
	if p2 == true then
		p1()

		return {
			tombstone = false,
			reason = nil,
			err = nil
		}
	end

	local ok, result = pcall(p1)

	if ok then
		return {
			tombstone = false,
			reason = nil,
			err = nil
		}
	end

	return {
		tombstone = true,
		reason = tostring(result),
		err = result
	}
end

t.PollForKey = PollForKey
t.PollForKeyWithDeadline = PollForKeyWithDeadline
t.RunGuarded = RunGuarded

return t