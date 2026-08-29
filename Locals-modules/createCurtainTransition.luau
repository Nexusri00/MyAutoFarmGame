-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMeCVNjcmVlbkd1aQNJc0EFZXJyb3Ijc2NyZWVuR3VpIG11c3QgYmUgYSB2YWxpZCBTY3JlZW5HdWkJd29ya3NwYWNlDUN1cnJlbnRDYW1lcmEMVmlld3BvcnRTaXplCEluc3RhbmNlA25ldwVGcmFtZQVVRGltMgRTaXplCFBvc2l0aW9uBkNvbG9yMxBCYWNrZ3JvdW5kQ29sb3IzFkJhY2tncm91bmRUcmFuc3BhcmVuY3kPQm9yZGVyU2l6ZVBpeGVsBlpJbmRleAZQYXJlbnQEZ2FtZQxUd2VlblNlcnZpY2UKR2V0U2VydmljZQlUd2VlbkluZm8ERW51bQtFYXNpbmdTdHlsZQRRdWFkD0Vhc2luZ0RpcmVjdGlvbgNPdXQGQ3JlYXRlBFBsYXkAAhMDAAAAAMQBbwUAALwDAP4BAAAAnwMDAisDBACkAwMAAAAgQG8EBACfAwIBpAMGAAAAUEBNAwNIBwAAAE0DA7AIAAAApAQLAAAokIBvBQwAnwQCAqQFDgAAKNCAjAYBAIwHAABvCA8AjAkAAJ8FBQIwBQQvEAAAAKQFDgAAKNCAjAYAAIwHAAAOAgIAbwgRAGUAAQCMCAAAjAkAAJ8FBQIwBQQ7EgAAAKQFFAAAKDCBjAYAAIwHAACMCAAAnwUEAjAFBJ8VAAAADgICAIwFAQBlAAEAjAUAADAFBDoWAAAAjAUAADAFBI4XAAAAjAWc/zAFBA0YAAAAMAAEJBkAAACkBQsAACiQgG8GDACfBQICpAYOAAAo0ICMBwEAjAgAAG8JDwCMCgAAnwYFAjAGBS8QAAAApAYOAAAo0ICMBwAAjAgAAA4CAgCMCQEAZQABAG8JDwCMCgAAnwYFAjAGBTsSAAAApAYUAAAoMIGMBwAAjAgAAIwJAACfBgQCMAYFnxUAAAAOAgIAjAYBAGUAAQCMBgAAMAYFOhYAAACMBgAAMAYFjhcAAACMBpz/MAYFDRgAAAAwAAUkGQAAAKQGGwAAAKBBbwgcALwGBhYdAAAAnwYDAqQHHwAAKOCBUggBAKQJIwAihADCpAomACWQAMKfBwQCUgoEAFILBwDiDCcApA0OAAAo0ICMDgAAjA8AAA4CAgCMEAAAZQABAG8QEQCMEQAAnw0FAjANDDsSAAAAvAgGligAAACfCAUCUgsFAFIMBwDiDScApA4OAAAo0ICMDwAAjBAAAA4CAgBvEQ8AZQABAIwRAQCMEgAAnw4FAjAODTsSAAAAvAkGligAAACfCQUCUgwEAFINBwDiDikADgICAIwPAABlAAEAjA8BADAPDjoWAAAAvAoGligAAACfCgUCUg0FAFIOBwDiDykADgICAIwQAABlAAEAjBABADAQDzoWAAAAvAsGligAAACfCwUCvAwI7ioAAACfDAIBvAwJ7ioAAACfDAIBvAwK7ioAAACfDAIBvAwL7ioAAACfDAIBggQDACsDAQMCAwMEAAAgQAMEAwUEAABQQAMGAwcDCAMJBAAokIADCgMLBAAo0IACAAAAAAAA4D8DDAIAAAAAAADgvwMNAw4EACgwgQMPAxADEQMSAxMDFAQAAKBBAxUDFgMXBAAo4IEDGAMZAxoEIoQAwgMbAxwEJZAAwgUBEgMdBQEWAx4AAQABGAAAAAAAAQAAAAQAAAAAAAMAAAABAAAAAAAAAAABAAAAAAAAAAAAAAABAAAAAAAAAAEAAAAAAAEAAAEAAAEAAgAAAAEAAAAAAAAAAAEAAAAAAAAAAAAAAAEAAAAAAAAAAQAAAAAAAQAAAQAAAQADAAAAAAABAAAAAAAAAAIAAAEAAAAAAAAAAAAAAP8AAAQAAAEAAAAAAAAAAAAAAP8AAAQAAAEAAAAAAP8AAAQAAAEAAAAAAP8AAAUAAAEAAAEAAAEAAAgDAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgABAAEAARgAAAABAAAAAAHrIClpC++Dg331uFzQZaKDmzg+HdnkQ2g=

-- https://lua.expert/
return function(p1, p2, p3) --[[ Line: 1 ]]
	if not p1:IsA("ScreenGui") then
		error("screenGui must be a valid ScreenGui")
	end

	local ViewportSize = workspace.CurrentCamera.ViewportSize
	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(1, 0, 0.5, 0)
	Frame.Position = UDim2.new(0, 0, if p3 then -0.5 else 0, 0)
	Frame.BackgroundColor3 = Color3.new(0/255, 0/255, 0/255)
	Frame.BackgroundTransparency = if p3 then 1 else 0
	Frame.BorderSizePixel = 0
	Frame.ZIndex = -100
	Frame.Parent = p1

	local Frame2 = Instance.new("Frame")

	Frame2.Size = UDim2.new(1, 0, 0.5, 0)
	Frame2.Position = UDim2.new(0, 0, if p3 then 1 else 0.5, 0)
	Frame2.BackgroundColor3 = Color3.new(0/255, 0/255, 0/255)
	Frame2.BackgroundTransparency = if p3 then 1 else 0
	Frame2.BorderSizePixel = 0
	Frame2.ZIndex = -100
	Frame2.Parent = p1

	local TweenService = game:GetService("TweenService")
	local v11 = TweenInfo.new(p2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local t = {}

	t.Position = UDim2.new(0, 0, if p3 then 0 else -0.5, 0)

	local v16 = TweenService:Create(Frame, v11, t)
	local t2 = {}

	t2.Position = UDim2.new(0, 0, if p3 then 0.5 else 1, 0)

	local v21 = TweenService:Create(Frame2, v11, t2)
	local t3 = {}

	t3.BackgroundTransparency = if p3 then 0 else 1

	local v23 = TweenService:Create(Frame, v11, t3)
	local t4 = {}

	t4.BackgroundTransparency = if p3 then 0 else 1

	local v25 = TweenService:Create(Frame2, v11, t4)

	v16:Play()
	v21:Play()
	v23:Play()
	v25:Play()

	return Frame, Frame2
end