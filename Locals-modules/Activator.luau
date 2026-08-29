-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMIBnNjcmlwdAZQYXJlbnQTQW5pbWF0aW9uQ29udHJvbGxlchVGaW5kRmlyc3RDaGlsZE9mQ2xhc3MIQW5pbWF0b3IIV2luZ0lkbGUNTG9hZEFuaW1hdGlvbgRQbGF5AAIGAAAAAAAapAABAAAAAEBNAAAkAgAAAG8DAwC8AQC4BAAAAJ8BAwJSAgEADgIEAG8EBQC8AgG4BAAAAJ8CAwIOAgoApAUBAAAAAEBNBQVnBgAAALwDApQHAAAAnwMDArwDA+4IAAAAnwMCAYIAAQAJAwEEAAAAQAMCAwMDBAMFAwYDBwMIAAEAARgAAAAAAQAAAAEAAAAAAAEBAAAAAAAAAAAAAgIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAAAAAEAAAAAAVqOtbOn8D6IUT1nil7SxGUqlqLHaErfsg==

-- https://lua.expert/
return function() --[[ Line: 1 ]]
	local AnimationController = script.Parent:FindFirstChildOfClass("AnimationController")
	local v1 = if AnimationController then AnimationController:FindFirstChildOfClass("Animator") else AnimationController

	if not v1 then
		return
	end

	v1:LoadAnimation(script.WingIdle):Play()
end