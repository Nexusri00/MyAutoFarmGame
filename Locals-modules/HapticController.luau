-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMJCFNldE1vdG9yFElzVmlicmF0aW9uU3VwcG9ydGVkEElzTW90b3JTdXBwb3J0ZWQEdGFzawVkZWxheQVQdWxzZQRnYW1lDUhhcHRpY1NlcnZpY2UKR2V0U2VydmljZQADBQADAAAACPsAAAD7AgEA+wMCAIwEAAC8AACtAAAAAJ8ABQGCAAEAAQMBABYAARgAAAAAAAAAARcAAAAACQQBAAAJBgAABQQPDwICH/sEAABSBgAAvAQEDwAAAACfBAMCKwQBAIIAAQD7BAAAUgYAAFIHAQC8BATPAQAAAJ8EBAIrBAEAggABAPsEAABSBgAAUgcBAFIIAgC8BAStAgAAAJ8EBQGkBAUAABAwgFIFAwDZBgAAEgIAABIAAAASAAEAnwQDAYIAAQAGAwIDAwMBAwQDBQQAEDCAAQALBgEYAAAAAAAAAAEAAAAAAAAAAgAAAAAAAAIAAAAAAAAAAxEAAAAAAwAAAQIADqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwL/AQEAAAAAAMACBAASAAAAMAIBJgUAAACCAQIABgMHBAAAAEADCAMJBgEDBgEBAQABGAAEAAAAAAACAAQAAAASAQAAAAACFYwjmeEy4owT3jFZkPf7wmWUNO0nSEmY

-- https://lua.expert/
local HapticService = game:GetService("HapticService")

return {
	Pulse = function(p1, p2, p3, p4) --[[ Pulse | Line: 11 | Upvalues: HapticService (copy) ]]
		if not HapticService:IsVibrationSupported(p1) then
			return
		end

		if HapticService:IsMotorSupported(p1, p2) then
			HapticService:SetMotor(p1, p2, p3)
			task.delay(p4, function() --[[ Line: 22 | Upvalues: HapticService (ref), p1 (copy), p2 (copy) ]]
				HapticService:SetMotor(p1, p2, 0)
			end)
		end
	end
}