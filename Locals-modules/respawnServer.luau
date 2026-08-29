-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMFBXBhaXJzCUNoYXJhY3Rlcg1Mb2FkQ2hhcmFjdGVyFVJlc3Bhd25lZCAlZCBwbGF5ZXJzLgZmb3JtYXQAAgkCAAAABwAAAQMCDwITpAIBAAAAAEBSAwEAnwICBBcCBgBNBwZpAgAAAA4HAwC8BwblAwAAAJ8HAgFuAvn/AgAAAG8CBAAcBAEAvAICjQUAAACfAgMAggIAAAYDAQQAAABAAwIDAwMEAwUAAQABGAAAAAAAAQAAAQAA/gAFAAAAAAACAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgABAAEAARgAAAABAAAAAAE=

-- https://lua.expert/
return function(p1, p2) --[[ Line: 1 ]]
	for k, v in pairs(p2) do
		if v.Character then
			v:LoadCharacter()
		end
	end

	return ("Respawned %d players."):format(#p2)
end