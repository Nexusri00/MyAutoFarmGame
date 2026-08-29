-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMUC1RyYW5zZm9ybWVkDEdldEF0dHJpYnV0ZQhDaGFpbkN0eAlFbWl0SW5kZXgJRW1pdENvdW50Cl9wbGF5VG9rZW4MX3BhcmVudEFsaXZlD19wYXJlbnRDbG9uZU1hcApFbmFibGVFbWl0C0dldENoaWxkcmVuBXZpc2l0Cl9jbG9uZU1hcHMEd2Fsaw9fcGFyZW50U2NhbGVNYXANX3NjYWxlTWFwS2V5cw13YWxrV2l0aFNjYWxlB3JlcXVpcmUGc2NyaXB0BlBhcmVudARQb29sAAUIAQcAAAA6bwMAALwBABIBAAAAnwEDAg4BKwD7AQAADgEDAPsBAABSAgAAnwECAf8BBAAAAAAA+wIBAA4CFAD7AgEATQICHwIAAAAwAgEfAgAAAPsCAQBNAgK+AwAAADACAb4DAAAA+wIBAE0CAj0EAAAAMAIBPQQAAAD7AgEATQICxAUAAAAwAgHEBQAAAPsCAgAwAgF0BgAAAPsCAwAwAgGzBwAAAPsCBABSBAAA+wUFAFIGAQC8AgLACAAAAJ8CBQGCAAEAvAEAaAkAAACfAQIEZAEDAPsGBgBSBwUAnwYCAW4B/P8CAAAAggABAAoDAQMCAwMDBAMFAwYDBwMIAwkDCgATCwEYAAAAAAABAAAAAAEAAQABAAAAAAEAAAAAAQAAAAADAAAAAAIAAAEAAAEAAAAAAAABAgAAAAAAAAAAARQAAAAACgYBAAAAFPsGAABNBgZ5AAAAAA4GBAD7BwAATQcHeQAAAACHBgcC2QcAABIABQASAAQAEgADABIABgASAAAAEgACABIABwBSCAcAUgkBAJ8IAgGCAAEAAQMMAQARDQEYAAAAAAAAAAABAAAAAAAAABMAAAESAAAAAAUBAwAAAAv7AQAATQEBhQAAAAD7AgEAagIBAPsBAgD7BAIAHAMEAJUCAwFqAAECggABAAIDDgIAAAAAAADwPwA1AAEYAAAAAAABAAAAAAE2AAAAAA8HAQAAACQrBQoA+wcAAE0HB/8AAAAAUggAAFIJAQBSCgIAUgsDAFIMBACfBwYBggABAE0HAIUBAAAAKwcCAP8HAAAAAAAAMAcAhQEAAAD/BwAAAAAAAPsIAABNCAj/AAAAAFIJAABSCgEAUgsCAFIMAwBSDQQA2Q4AABIAAAASAAUAEgAHAJ8IBwEwBwZvAgAAAIIAAQADAw0DDgMPAQIuEAEYAAEAAAAAAAAAAAECAAAAAAAAAQABAAAAAAAAAAAAAAAABAABLwAAAAADAAABAgAVowAAAKQAAQAAAABApAEDAAAAIEBNAQEkBAAAAE0BAUIFAAAAnwACAv8BAgAAAAAAwAIGABIAAAAwAgH/BwAAAMACCAASAAEAMAIBBwkAAACCAQIACgMRBAAAAEADEgQAACBAAxMDFAYBAw0GAwMQAgEDAQABGAAJAAAAAAAAAAACAAUAAAAdAAAADgEAAAAABOH64EbsDU7JXdxCv+61u0aR4vcy0z6KRw==

-- https://lua.expert/
local Pool = require(script.Parent.Pool)
local t = {
	walk = function(p1, p2, p3, p4, p5, p6) --[[ walk | Line: 17 | Upvalues: Pool (copy) ]]
		local v1 = Pool._cloneMaps and Pool._cloneMaps[p3]

		local function v2(p12) --[[ visit | Line: 19 | Upvalues: p6 (copy), p5 (copy), p4 (copy), v1 (copy), p1 (copy), p3 (copy), v2 (copy) ]]
			if p12:GetAttribute("Transformed") then
				if p6 then
					p6(p12)
				end

				local t = {}

				if p5 then
					t.ChainCtx = p5.ChainCtx
					t.EmitIndex = p5.EmitIndex
					t.EmitCount = p5.EmitCount
					t._playToken = p5._playToken
				end

				t._parentAlive = p4
				t._parentCloneMap = v1
				p1:EnableEmit(p12, p3, t)
			else
				for v12, v22 in p12:GetChildren() do
					v2(v22)
				end
			end
		end

		v2(p2)
	end
}

function t.walkWithScale(p1, p2, p3, p4, p5, p6, p7) --[[ walkWithScale | Line: 46 | Upvalues: t (copy) ]]
	if not p6 then
		t.walk(p1, p2, p3, p4, p5)

		return
	end

	p1._parentScaleMap = p1._parentScaleMap or {}

	local t2 = {}

	t.walk(p1, p2, p3, p4, p5, function(p12) --[[ Line: 53 | Upvalues: p1 (copy), p6 (copy), t2 (copy) ]]
		p1._parentScaleMap[p12] = p6
		t2[#t2 + 1] = p12
	end)
	p7._scaleMapKeys = t2
end

return t