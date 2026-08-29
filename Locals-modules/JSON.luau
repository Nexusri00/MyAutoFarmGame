-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMJBXBjYWxsCkpTT05EZWNvZGUIVmFsaWRhdGUFUGFyc2UEanNvbgxSZWdpc3RlclR5cGUEZ2FtZQtIdHRwU2VydmljZQpHZXRTZXJ2aWNlAAQFAQEAAAAJpAEBAAAAAED7AgAATQICywIAAAD7AwAAUgQAAJ8BBACCAQAAAwMBBAAAAEADAgAFAwEYAAAAAAAAAAAABgAAAAAEAQEAAAAG+wEAAFIDAAC8AQHLAAAAAJ8BAwCCAQAAAQMCAAkEARgAAAAAAAAKAAAAAAYBAQAAAA5vAwAA4gQDAMAFBAASAgAAMAUEdgEAAADABQUAEgIAADAFBJsCAAAAvAEA3QYAAACfAQQBggABAAcDBQMDAwQFAgECBgAGAQMGAgABAwABGAAAAQAAAAQAAAD7AAAJBAAAAAADAAABAgAKowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAsABBAASAAAAggECAAUDBwQAAABAAwgDCQYCAQIBAAEYAAAAAAAAAAIAAAEAAAAAA5LIGJ9wFcXDs5vwQ/WzvHri0A/roAxyng==

-- https://lua.expert/
local HttpService = game:GetService("HttpService")

return function(p1) --[[ Line: 3 | Upvalues: HttpService (copy) ]]
	p1:RegisterType("json", {
		Validate = function(p1) --[[ Validate | Line: 5 | Upvalues: HttpService (ref) ]]
			return pcall(HttpService.JSONDecode, HttpService, p1)
		end,
		Parse = function(p1) --[[ Parse | Line: 9 | Upvalues: HttpService (ref) ]]
			return HttpService:JSONDecode(p1)
		end
	})
end