-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMFBXBhaXJzCUNoYXJhY3RlcgtCcmVha0pvaW50cxJLaWxsZWQgJWQgcGxheWVycy4GZm9ybWF0AAIJAgAAAAcAAAEDAhECFaQCAQAAAABAUgMBAJ8CAgQXAggATQcGaQIAAAAOBwUATQcGaQIAAAC8BweTAwAAAJ8HAgFuAvf/AgAAAG8CBAAcBAEAvAICjQUAAACfAgMAggIAAAYDAQQAAABAAwIDAwMEAwUAAQABGAAAAAAAAQAAAQAAAAD+AAYAAAAAAAIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAAAAAEAAAAAAQ==

-- https://lua.expert/
return function(p1, p2) --[[ Line: 1 ]]
	for k, v in pairs(p2) do
		if v.Character then
			v.Character:BreakJoints()
		end
	end

	return ("Killed %d players."):format(#p2)
end