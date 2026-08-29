-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRCXdvcmtzcGFjZQ1DdXJyZW50Q2FtZXJhBU1vZGVsA0lzQQ5HZXRCb3VuZGluZ0JveAhCYXNlUGFydAZDRnJhbWUEU2l6ZQR3YXJuRE9iamVjdCBpcyBuZWl0aGVyIGEgTW9kZWwgbm9yIGEgQmFzZVBhcnQhIERpc3JlZ2FyZGluZyBDYW1lcmEgY2hlY2shA25ldwFYAVkBWghQb3NpdGlvbhRXb3JsZFRvVmlld3BvcnRQb2ludA5XaXRoaW5WaWV3cG9ydAACEAEAAAAGAwAABQEHUaQBAQAAAABATQEBSAIAAADGAgAAxgMAAG8GAwC8BAD+BAAAAJ8EAwIOBAYAvAQAlQUAAACfBAIDUgIEAFIDBQBlABAAbwYGALwEAP4EAAAAnwQDAg4EBQBNAgCFBwAAAE0DAC8IAAAAZQAGAKQECgAAAJBAbwULAJ8EAgGpBAAAggQCAIwGAQCMBAgAjAUBAKgEKgCkCA0AADBwgE0KA3kOAAAAIQwGDw0MAwAQAACAbwsRAGUAAQBvCxIACQkKC00LA3gTAAAAIQ0GFIwOAQBgDgMADQAAAG8MEQBlAAEAbwwSAAkKCwxNDAN7FQAAACEOBhaMDwMAYA8DAA4AAABvDREAZQABAG8NEgAJCwwNnwgEAgkHAghNCgc7FwAAALwIAfgYAAAAnwgDAg4IAgCpCAEAgggCAIsE1v+pBAAAggQCABkDAQQAAABAAwIDAwMEAwUDBgMHAwgDCQQAAJBAAwoDCwQAMHCAAwwCAAAAAAAAAEACAAAAAAAAAAACAAAAAAAA4D8CAAAAAAAA4L8DDQIAAAAAAAAQQAMOAgAAAAAAACBAAw8DEAADEQEYAAAAAAEAAgAAAAABAAAAAAABAAAAAAEAAAAAAgAAAAEAAwAAAAEAAQAAAAAAAAAAAQAAAAAAAAAAAAEAAAAAAAAAAAD9AAYAAAAAAAEA+AwABAAAAAACAAABAgAHowAAAP8AAQAAAAAAwAEAADABAM8BAAAAggACAAIGAAMRAQABAAEYAAAAAgAAHAEAAAAAAXbbL0uNLkm/Wojb4nkVxzoGwzg/RB9FSg==

-- https://lua.expert/
return {
	WithinViewport = function(p1) --[[ WithinViewport | Line: 3 ]]
		local CurrentCamera = workspace.CurrentCamera
		local v1, v2

		if p1:IsA("Model") then
			local v3, v4 = p1:GetBoundingBox()

			v1 = v4
			v2 = v3
		else
			if not p1:IsA("BasePart") then
				warn("Object is neither a Model nor a BasePart! Disregarding Camera check!")

				return false
			end

			v2 = p1.CFrame
			v1 = p1.Size
		end

		for i = 1, 8 do
			if CurrentCamera:WorldToViewportPoint((v2 * CFrame.new(v1.X * (if i % 2 == 0 then 0.5 else -0.5), v1.Y * (if i % 4 > 1 then 0.5 else -0.5), v1.Z * (if i % 8 > 3 then 0.5 else -0.5))).Position) then
				return true
			end
		end

		return false
	end
}