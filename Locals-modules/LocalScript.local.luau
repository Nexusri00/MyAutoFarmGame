-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMLBERhdGEORmluZEZpcnN0Q2hpbGQMV2FpdEZvckNoaWxkCUludmVudG9yeQVwYWlycwtHZXRDaGlsZHJlbghJZGVudGl0eQVWYWx1ZQdHZXRJdGVtAl9HC0RhdGFNYW5hZ2VyAAIOAwAAAAAtbwUAALwDAQMBAAAAnwMDAisDBQBvBQAAjAYUALwDAdMCAAAAnwMEAisDAgDGBAAAggQCAG8GAwC8BAPTAgAAAJ8EAwJSBwIAvAUEAwEAAACfBQMCpAYFAAAAQEC8BwRoBgAAAJ8HAgCfBgAEFwYOAG8NBwC8CwoDAQAAAJ8LAwIOCwkAbw0HALwLCtMCAAAAnwsDAk0LC+wIAAAAmgsCAAIAAABSBQoAbgbx/wIAAACCBQIACQMBAwIDAwMEAwUEAABAQAMGAwcDCAADCQEYAAAAAAAAAAAAAAEAAAEAAAACAAAAAgAAAAAAAAEAAAAAAAAAAAAAAAAB/gAGBwAAAAACAAABAgALowAAAP8AAQAAAAAAwAEAADABAH4BAAAApAEDAAAAIEAwAAFwBAAAAIIAAQAFBgADCQMKBAAAIEADCwEAAQABGAAAAAIAABMAAAAAAQAAAAABx/G0geGZdHUGqtWzNnmaNbfpo/X1Nd6A

-- https://lua.expert/
_G.DataManager = {
	GetItem = function(p1, p2, p3) --[[ GetItem | Line: 3 ]]
		local v1 = p2:FindFirstChild("Data") or p2:WaitForChild("Data", 20)

		if not v1 then
			return nil
		end

		local Inventory = v1:WaitForChild("Inventory")
		local v2 = Inventory:FindFirstChild(p3)

		for k, v in pairs(Inventory:GetChildren()) do
			if v:FindFirstChild("Identity") and v:WaitForChild("Identity").Value == p3 then
				v2 = v
			end
		end

		return v2
	end
}