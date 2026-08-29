-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMHBGdhbWUJV29ya3NwYWNlBUxpdmVzC0dldENoaWxkcmVuBXRhYmxlBGZpbmQGcmVtb3ZlAAIHAQAAAAYDAAAFAQcapAEBAAAAAEBNAQHKAgAAAE0BAQYDAAAAvAEBaAQAAACfAQICDgAPAKQCBwAAGFCAUgMBAFIEAACfAgMCDgIJAKQCCQAAIFCAUgMBAKQEBwAAGFCAUgUBAFIGAACfBAMAnwIAAYIBAgAKAwEEAAAAQAMCAwMDBAMFAwYEABhQgAMHBAAgUIAAAQABGAAAAAAAAAAAAAEAAAAAAAABAAAAAAAAAAACAgAAAAABAAABAgADowAAAMAAAACCAAIAAQYAAQABAAEYAAAAAQAAAAABapC3dPmHoivH14imSrYTEhqIoABYVN11

-- https://lua.expert/
return function(p1) --[[ Line: 1 ]]
	local v1 = game.Workspace.Lives:GetChildren()

	if p1 and table.find(v1, p1) then
		table.remove(v1, table.find(v1, p1))
	end

	return v1
end