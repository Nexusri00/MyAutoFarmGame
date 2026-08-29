-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMYC0dldEFyZ3VtZW50CFZhbGlkYXRlBFR5cGUETmFtZRdBcmd1bWVudCBWYWx1ZSBPcGVyYXRvcgtEZXNjcmlwdGlvbjJUaGUgdmFsdWUgb3BlcmF0b3IgdG8gcmVzb2x2ZS4gT25lIG9mOiAqICoqIC4gPyA/TghPcHRpb25hbAhHZXRWYWx1ZQV0YWJsZQZjb25jYXQLUmF3U2VnbWVudHMBLANSdW4HcmVzb2x2ZQdBbGlhc2VzZlJlc29sdmVzIEFyZ3VtZW50IFZhbHVlIE9wZXJhdG9ycyBpbnRvIGxpc3RzLiBFLmcuLCByZXNvbHZlIHBsYXllcnMgKiBnaXZlcyB5b3UgYSBsaXN0IG9mIGFsbCBwbGF5ZXJzLgVHcm91cAtEZWZhdWx0VXRpbAhBdXRvRXhlYwRBcmdzM2FsaWFzICJtZXxEaXNwbGF5cyB5b3VyIHVzZXJuYW1lIiByZXNvbHZlIHBsYXllcnMgLgR0eXBlHVRoZSB0eXBlIGZvciB3aGljaCB0byByZXNvbHZlAAMFAQAAAAAVjAMBALwBAN4AAAAAnwEDArwBAXYBAAAAnwECAioBAgAAAACAggABAOIBCQCMBAEAvAIA3gAAAACfAgMCvAIC8woAAACfAgICMAIBEQIAAACCAQIACwMBAwIDAwMEAwUDBgMHAwgBAQgEAv////8DBAAAAAUGAAAABwgAAAADCQAPAAEYAAAAAAAAAAAAAQMBAAAAAAAAAAAAEAAAAAAFAQAAAAALpAECAAAEAICMBAIAvAIA3gMAAACfAgMCTQICGwQAAABvAwUAnwEDAIIBAAAGAwoDCwQABACAAwEDDAMNAB0OARgAAAAAAAAAAAAAAB4AAAAABAAAAQIAGaMAAADiAAoA/wEAAAAAAAAwAQAnAgAAAP8BAAABAAAAbwILAMUBAgIBAAAAMAEAfQcAAAD/AQAAAgAAAOICDwDAAxAAxQECAwEAAAAwAQDbCAAAAMABEQAwAQAWCQAAAIIAAgASAwQDDwMQAwYDEQMSAxMDFAMVAw4IBwABAAAAAv////8DBAAAAAUGAAAAB/////8I/////wn/////AxYDAwMXAxgIAwwNAAAAAAwAAAADDgAAAAYABgECAAEBAAEYAAACAAAAAwABAAD/AAMAAQUAAPoAFAAAAAEAAAAAAtimWE8D0Fwj7URXjN1YOUCovk876mIyTg==

-- https://lua.expert/
return {
	Name = "resolve",
	Description = "Resolves Argument Value Operators into lists. E.g., resolve players * gives you a list of all players.",
	Group = "DefaultUtil",
	Aliases = {},
	AutoExec = { "alias \"me|Displays your username\" resolve players ." },
	Args = {
		{
			Type = "type",
			Name = "Type",
			Description = "The type for which to resolve"
		},
		function(p1) --[[ Line: 15 ]]
			if p1:GetArgument(1):Validate() == false then
				return
			end

			return {
				Name = "Argument Value Operator",
				Description = "The value operator to resolve. One of: * ** . ? ?N",
				Optional = true,
				Type = p1:GetArgument(1):GetValue()
			}
		end
	},
	Run = function(p1) --[[ Run | Line: 29 ]]
		return table.concat(p1:GetArgument(2).RawSegments, ",")
	end
}