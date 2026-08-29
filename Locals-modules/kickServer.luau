-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMFBXBhaXJzEEtpY2tlZCBieSBhZG1pbi4ES2ljaxJLaWNrZWQgJWQgcGxheWVycy4GZm9ybWF0AAIKAgAAAAcAAAEDAg0CEaQCAQAAAABAUgMBAJ8CAgQXAgQAbwkCALwHBnwDAAAAnwcDAW4C+/8CAAAAbwIEABwEAQC8AgKNBQAAAJ8CAwCCAgAABgMBBAAAAEADAgMDAwQDBQABAAEYAAAAAAABAAAA/wAEAAAAAAACAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgABAAEAARgAAAABAAAAAAE=

-- https://lua.expert/
return function(p1, p2) --[[ Line: 1 ]]
	for k, v in pairs(p2) do
		v:Kick("Kicked by admin.")
	end

	return ("Kicked %d players."):format(#p2)
end