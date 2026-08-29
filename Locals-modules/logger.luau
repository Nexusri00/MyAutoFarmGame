-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOFFtGb3JnZSBFbWl0IEFQSV06ICUqBXRhYmxlBmNvbmNhdAEgBmZvcm1hdANtc2cFZXJyb3IBCgR3YXJuBWRlYnVnCXRyYWNlYmFjawxzdGFjayB0cmFjZToFcHJpbnQEaW5mbwAFBQAAAQAAD6MAAABvAAAApAIDAAAIEID/AwAAAAAAAN0EAADFAwQAAQAAAG8EBACfAgMCvAAAjQUAAACfAAMCggACAAYDAQMCAwMEAAgQgAMEAwUAAQYBGAABAAAAAAAAAAAAAAAAAAEAAAAABAABAQAACaMAAACkAAEAAAAAQPsBAADdAgIAbwMCAJ8BAwCfAAABggABAAMDBwQAAABAAwgABwcBGAABAAAAAAAAAQcAAAAABAABAQAAEaMAAACkAAEAAAAAQPsBAADdAgAAnwEAAJ8AAAGkAAEAAAAAQPsBAACkAgQAAAwggG8DBQCfAgIAnwEAAJ8AAAGCAAEABgMJBAAAAEADCgMLBAAMIIADDAALCQEYAAEAAAAAAAEAAAAAAAAAAAELAAAAAAMAAQEAAAijAAAApAABAAAAAED7AQAA3QIAAJ8BAACfAAABggABAAIDDQQAAABAABAOARgAAQAAAAAAARAAAAAAAwAAAQIAEaMAAADAAAAA/wEDAAAAAADAAgEAEgAAADACAf4CAAAAwAIDABIAAAAwAgGDBAAAAMACBQASAAAAMAIBmgYAAACCAQIABwYABgEDBwYCAwkGAwMOBAABAgMBAAEYAAAEAAIAAAAEAAAABQAAAAQBAAAAAASBHDLOtjBTAEN26kBx3eaP8QQlurPYWM8=

-- https://lua.expert/
local function msg(...) --[[ msg | Line: 1 ]]
	return ("[Forge Emit API]: %*"):format((table.concat({ ... }, " ")))
end

return {
	error = function(...) --[[ error | Line: 7 | Upvalues: msg (copy) ]]
		error(msg(..., "\n"))
	end,
	warn = function(...) --[[ warn | Line: 11 | Upvalues: msg (copy) ]]
		warn(msg(...))
		warn(msg(debug.traceback("stack trace:")))
	end,
	info = function(...) --[[ info | Line: 16 | Upvalues: msg (copy) ]]
		print(msg(...))
	end
}