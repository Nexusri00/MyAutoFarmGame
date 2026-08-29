-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMKDVJlcXVlc3RDYW5jZWwFUmVzZXQLSXNDYW5jZWxsZWQTRGV0ZWN0TW9iaWxlU3VzcGVuZAlUaWNrQ2xvY2sQQ3JlYXRlQ29udHJvbGxlcghUcnlFbnRlcgRFeGl0CElzQWN0aXZlEkNyZWF0ZUNvbmZpcm1HdWFyZAALAgEBAAAAA6kBAQDeAQAAggABAAAAHgEBGAAAAR8AAAAAAwICAAAHBAAABQIEAgSpAgAA3gIAAN4BAQCCAAEAAAAiAgEYAAABASMAAAAAAgEBAAAAAvsBAACCAQIAAAAnAwEYAAAoAAAAAAUCAgAABwQAAAUCBAIJ+wMAACYCAQPeAQAA+wQBALcEAgACAAAAqQMAAakDAQCCAwIAAAArBAEYAAABAQAAAAAALAAAAAACAgEAAAcEAAAFAgQCAt4BAACCAAEAAAAxBQEYAAEyAAAAAAYBAAAABgMAAAUBgh2pAQAAjAIAAJADAAD/BAAAAAAAANkFAAASAQH/MAUEHgEAAADZBQEAEgEB/xIBAv8wBQR/AgAAANkFAgASAQH/MAUEjQMAAADZBQMAEgEC/xIAAwAwBQTGBAAAANkFBAASAQL/MAUEgQUAAADBAQAAggQCAAYCAAAAAAAAAEADAQMCAwMDBAMFBQABAgMEGAYBGAABAQEAAgAAAAQAAAAABQAAAAQAAAAABgAAAAQAGQAAAAACAQEAAAAI+wEAAA4BAgCpAQAAggECAKkBAQDeAQAAqQEBAIIBAgAAADwHARgAAAAAAQABAD0AAAAAAgEBAAAAA6kBAADeAQAAggABAAAAQggBGAAAAUMAAAAAAgEBAAAAAvsBAACCAQIAAABGCQEYAABHAAAAAAMAAAAAABGpAAAA/wEAAAAAAADZAgAAEgEA/zACAdkAAAAA2QIBABIBAP8wAgEgAQAAANkCAgASAQD/MAIBdgIAAADBAAAAggECAAMDBwMIAwkDBgcIOAoBGAABAAIAAAAGAAAABAAAAAQAOQAAAAACAAABAgAKowAAAP8AAgAAAAAAwAEAADABAA8BAAAAwAECADABAA0DAAAAggACAAQGBQMGBgkDCgIFCQEAARgABQASAAAgAAAXAQAAAAAKOUmKpjOYfPF9k5iuA02B9ElRndILjeCn

-- https://lua.expert/
return {
	CreateController = function(p1) --[[ CreateController | Line: 24 ]]
		local v1 = false
		local v2 = 0
		local v3 = p1 or 2

		return {
			RequestCancel = function(p1) --[[ RequestCancel | Line: 30 | Upvalues: v1 (ref) ]]
				v1 = true
			end,
			Reset = function(p1, p2) --[[ Reset | Line: 34 | Upvalues: v1 (ref), v2 (ref) ]]
				v1 = false
				v2 = p2
			end,
			IsCancelled = function(p1) --[[ IsCancelled | Line: 39 | Upvalues: v1 (ref) ]]
				return v1
			end,
			DetectMobileSuspend = function(p1, p2) --[[ DetectMobileSuspend | Line: 43 | Upvalues: v2 (ref), v3 (copy) ]]
				local v1 = p2 - v2

				v2 = p2

				return v3 < v1
			end,
			TickClock = function(p1, p2) --[[ TickClock | Line: 49 | Upvalues: v2 (ref) ]]
				v2 = p2
			end
		}
	end,
	CreateConfirmGuard = function() --[[ CreateConfirmGuard | Line: 56 ]]
		local v1 = false

		return {
			TryEnter = function(p1) --[[ TryEnter | Line: 60 | Upvalues: v1 (ref) ]]
				if v1 then
					return false
				end

				v1 = true

				return true
			end,
			Exit = function(p1) --[[ Exit | Line: 66 | Upvalues: v1 (ref) ]]
				v1 = false
			end,
			IsActive = function(p1) --[[ IsActive | Line: 70 | Upvalues: v1 (ref) ]]
				return v1
			end
		}
	end
}