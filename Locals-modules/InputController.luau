-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMcA2tleQhjYWxsYmFjawtEb3VibGVQcmVzcwhSZWdpc3RlcgV0YWJsZQVjbGVhcgpVbnJlZ2lzdGVyDlVzZXJJbnB1dFN0YXRlB3BlbmRpbmcFcGFpcnMHS2V5Q29kZQ1Vc2VySW5wdXRUeXBlBEVudW0FQmVnaW4EdGljaw9fZG91YmxlVGFwU3RhdGUEbGFzdAR0YXNrBmNhbmNlbAVkZWxheQdQcm9jZXNzEFByb2Nlc3NWaWFBY3Rpb24EZ2FtZRBVc2VySW5wdXRTZXJ2aWNlCkdldFNlcnZpY2UKSW5wdXRCZWdhbgdDb25uZWN0CklucHV0RW5kZWQABgYEAQAACQYAAAUEAw8FgQr7BAAA4gUDADABBUoAAAAAMAIFpgEAAAAwAwWCAgAAAGoFBACCAAEABAMBAwIDAwUDAAECAAgEARgAAAEAAQABAP0FDgAAAAAEAQEAAAYDAAAFAQMM+wIAAIcBAgAOAQgApAECAAAEAID7AwAAhwIDAJ8BAgH7AQAAxgIAAGoCAQCCAAEAAwMFAwYEAAQAgAAVBwEYAAAAAQAAAAABAAACFgAAAAACAAMAAAAM+wAAAE0AAKYAAAAA+wEBAE0BAf8BAAAAnwACAfsAAgDGAQAAMAEAFQIAAACCAAEAAwMCAwgDCQAzAAEYAAAAAAAAAAEAAAABNAAAAAAMAgEAAAcEAAAFAgcBVQ4BAQCCAAEApAIBAAAAAED7AwAAnwICBBcCSwBNBwZKAgAAAE0IALMDAAAA8QcHAAgAAABNBwZKAgAAAE0IAMIEAAAAmgdAAAgAAABNBwaCBQAAAA4HNwBNBwD/BgAAAKQICQAIGHDAmgcxAAgAAACkBwsAAACgQJ8HAQJNCAZ4DAAAACsIBQDiCREAMAkGeAwAAABNCAZ4DAAAAE0KCAENAAAAJgkHCm8KEgB9CRMACgAAAE0JCBUPAAAADgkIAKQJFQAAUDCBTQoIFQ8AAACfCQIBxgkAADAJCBUPAAAATQkGphYAAABNCgD/BgAAAKkLAQCfCQMBZQAKAKQJGAAAXDCBbwoSANkLAAASAAYAEgAAABIBCP+fCQMCMAkIFQ8AAAAwBwgBDQAAAMEIAACCAAEATQcGphYAAABNCAD/BgAAAJ8HAgFuArT/AgAAAIIAAQAZAwoEAAAAQAMBAwsDDAMDAwgDDQMOBAgYcMADDwQAAKBAAxADEQIAAAAAAAAAAAMJAAgCDQ4AAAAPEAAAAAIAAAAAAADQPwMSAxMEAFAwgQMCAxQEAFwwgQECHBUBGAABAwAAAAABAAAAAAAAAAAAAAABAAABAAAAAAABAAABAAEBAAABAAMAAAAAAAEAAAEAAAAAAQAAAgAAAAAAAAIAAAAAAAAAAAAFAAADAgAAAADkAB8dAAAAAAQCAQAABwQAAAUCAw8P+wMAAIcCAwAOAgsA+wMAAIcCAwBNAgKmAAAAAA4CBgD7AwAAhwIDAE0CAqYAAAAAUgMBAJ8CAgGCAAEAAQMCAEIWARgAAAABAAAAAAEAAAAAAANDAAAAAAYAAAECACqjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMC/wEDAAAAAAD/AgAAAAAAAMADBAASAAIAMAMBgwUAAADAAwYAEgACADADAWIHAAAAwAMIABIAAgAwAwHLCQAAAMADCgASAAIAMAMBdQsAAABNAwCCDAAAAE0FAcsJAAAAvAMDxw0AAACfAwMBTQMArw4AAABNBQHLCQAAALwDA8cNAAAAnwMDAYIBAgAPAxcEAAAAQAMYAxkGAAMEBgEDBwYDAxUGBAMWAxoDGwMcBAABAwQBAAEYAAAAAAAAAAEABAACAAAADQAAAAcAAAAmAAAACAAAAAAAAAEAAAAAAAADAQAAAAAFpmgrcl2pXXw3n7JkyilPhNZwPAaUrEFz

-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local t = {}
local t2 = {}

function t.Register(p1, p2, p3, p4) --[[ Register | Line: 8 | Upvalues: t2 (copy) ]]
	t2[p1] = {
		key = p2,
		callback = p3,
		DoublePress = p4
	}
end
function t.Unregister(p1) --[[ Unregister | Line: 21 | Upvalues: t2 (copy) ]]
	if not t2[p1] then
		return
	end

	table.clear(t2[p1])
	t2[p1] = nil
end
function t.Process(p1, p2) --[[ Process | Line: 28 | Upvalues: t2 (copy) ]]
	if p2 then
		return
	end

	for k, v in pairs(t2) do
		if v.key == p1.KeyCode or v.key == p1.UserInputType then
			if v.DoublePress then
				if p1.UserInputState == Enum.UserInputState.Begin then
					local v1 = tick()
					local _doubleTapState = v._doubleTapState

					if not _doubleTapState then
						v._doubleTapState = {
							last = 0,
							pending = nil
						}
						_doubleTapState = v._doubleTapState
					end

					if v1 - _doubleTapState.last <= 0.25 then
						if _doubleTapState.pending then
							task.cancel(_doubleTapState.pending)
							_doubleTapState.pending = nil
						end

						v.callback(p1.UserInputState, true)
					else
						_doubleTapState.pending = task.delay(0.25, function() --[[ Line: 51 | Upvalues: v (copy), p1 (copy), _doubleTapState (ref) ]]
							v.callback(p1.UserInputState)
							_doubleTapState.pending = nil
						end)
					end

					_doubleTapState.last = v1
				end

				return
			end

			v.callback(p1.UserInputState)
		end
	end
end
function t.ProcessViaAction(p1, p2) --[[ ProcessViaAction | Line: 66 | Upvalues: t2 (copy) ]]
	if not (t2[p1] and t2[p1].callback) then
		return
	end

	t2[p1].callback(p2)
end
UserInputService.InputBegan:Connect(t.Process)
UserInputService.InputEnded:Connect(t.Process)

return t