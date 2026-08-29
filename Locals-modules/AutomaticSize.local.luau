-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMaBHRhc2sEd2FpdBNBYnNvbHV0ZUNvbnRlbnRTaXplAVkFVURpbTIDbmV3CkNhbnZhc1NpemUKdXBkYXRlU2l6ZQxVSUxpc3RMYXlvdXQVRmluZEZpcnN0Q2hpbGRPZkNsYXNzDFVJR3JpZExheW91dAR3YXJuEEF1dG9tYXRpY1NpemU6ICcETmFtZUsnIGRvZXMgbm90IGhhdmUgYSBVSSBMaXN0IExheW91dCBvciBVSSBHcmlkIExheW91dCBpbnN0YW5jZS4gU2tpcHBpbmcgZnJhbWUYR2V0UHJvcGVydHlDaGFuZ2VkU2lnbmFsB0Nvbm5lY3QKQ2hpbGRBZGRlZAxDaGlsZFJlbW92ZWQPU2V0dXBBdXRvU2Nyb2xsBGdhbWURQ29sbGVjdGlvblNlcnZpY2UKR2V0U2VydmljZQpBdXRvU2Nyb2xsCUdldFRhZ2dlZBZHZXRJbnN0YW5jZUFkZGVkU2lnbmFsAAMIAAMAAAAb+wAAAA4AAQCCAAEAqQABAN4AAACkAAIAAAQAgJ8AAQH7AAEATQAAxgMAAABNAAB4BAAAAFsBAAX7AgIApAMIAAAcYICMBAAAjAUAAIwGAABDBwABnwMFAjADAs8JAAAAqQIAAN4CAACCAAEACgMBAwIEAAQAgAMDAwQCexSuR+F6hD8DBQMGBAAcYIADBwAPCAEYAAAAAgABAAACAAAAAAECAAAAAAAAAAAAAQABEAAAAAALAQAAAABDbwMAALwBALgBAAAAnwEDAisBBABvAwIAvAEAuAEAAACfAQMCKwEJAKQCBAAAADBAbwQFAE0FALoGAAAAbwYHAHMDBAafAgIBggABAKkCAADZAwAAEgEC/xIAAQASAAAAbwYIALwEAZQJAAAAnwQDAlIGAwC8BATHCgAAAJ8EAwFNBABrCwAAAFIGAwC8BATHCgAAAJ8EAwFNBAC9DAAAAFIGAwC8BATHCgAAAJ8EAwEOAgEAZQATAKkCAQCkBA8AADjQgJ8EAQFNBAHGCAAAAE0EBHgQAAAAWwUEEaQGFAAATCCBjAcAAIwIAACMCQAAQwoEBZ8GBQIwBgDPFQAAAKkCAADBAgAAggABABYDCQMKAwsDDAQAADBAAw0DDgMPAwMDEAMRAxIDEwMBAwIEADjQgAMEAnsUrkfheoQ/AwUDBgQATCCBAwcBAAcUARgAAAAAAAAAAAABAQAAAAAAAAABAwEAAAANAAAAAAAAAAEAAAAAAAEAAAAAAPIAAgEAAAIAAAABAgAAAAAAAAAAAQcACAAAAAAJAAABAAAbowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAsABBABvBAUAvAIABQYAAACfAgMEZAIDAFIHAQBSCAYAnwcCAW4C/P8CAAAAbwQFALwCAF4HAAAAnwIDAlIEAQC8AgLHCAAAAJ8CAwGCAAEACQMVBAAAAEADFgMXBgEDGAMZAxoDEQEBAQABGAACAAAAAAAEGwAAAAABAAD/AAMAAAAAAAAAAAEAAAAAAiRsAG94AlZxT3edYPIHoOxUdBcbFqhqbg==

-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")

local function SetupAutoScroll(p1) --[[ SetupAutoScroll | Line: 7 ]]
	local v1 = p1:FindFirstChildOfClass("UIListLayout") or p1:FindFirstChildOfClass("UIGridLayout")

	if not v1 then
		warn("AutomaticSize: \'" .. p1.Name .. "\' does not have a UI List Layout or UI Grid Layout instance. Skipping frame")

		return
	end

	local v2 = false

	local function updateSize() --[[ updateSize | Line: 15 | Upvalues: v2 (ref), v1 (copy), p1 (copy) ]]
		if not v2 then
			v2 = true
			task.wait()

			local Y = v1.AbsoluteContentSize.Y

			p1.CanvasSize = UDim2.new(0, 0, 0, Y + Y * 0.01)
			v2 = false
		end
	end

	v1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSize)
	p1.ChildAdded:Connect(updateSize)
	p1.ChildRemoved:Connect(updateSize)

	if not v2 then
		v2 = true
		task.wait()

		local Y = v1.AbsoluteContentSize.Y

		p1.CanvasSize = UDim2.new(0, 0, 0, Y + Y * 0.01)
		v2 = false
	end
end

for v1, v2 in CollectionService:GetTagged("AutoScroll") do
	SetupAutoScroll(v2)
end

CollectionService:GetInstanceAddedSignal("AutoScroll"):Connect(SetupAutoScroll)