-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMSCkNNRFJfQmluZHMIR2V0U3RvcmUKRGlzY29ubmVjdBtVbmJvdW5kIGNvbW1hbmQgZnJvbSBpbnB1dC4YVGhhdCBpbnB1dCB3YXNuJ3QgYm91bmQuCUNsaWVudFJ1bgROYW1lBnVuYmluZAdBbGlhc2VzC0Rlc2NyaXB0aW9uK1VuYmluZHMgYW4gaW5wdXQgcHJldmlvdXNseSBib3VuZCB3aXRoIEJpbmQFR3JvdXALRGVmYXVsdFV0aWwEQXJncwRUeXBlJXVzZXJJbnB1dCAhIGJpbmRhYmxlUmVzb3VyY2UgQCBwbGF5ZXIJSW5wdXQvS2V5K1RoZSBrZXkgb3IgaW5wdXQgdHlwZSB5b3UnZCBsaWtlIHRvIHVuYmluZC4AAgUCAAAAABBvBAAAvAIAVQEAAACfAgMChwMCAQ4DCACHAwIBvAMDGgIAAACfAwIBxgMAAGoDAgFvAwMAggMCAG8DBACCAwIABQMBAwIDAwMEAwUADgYBGAAAAAACAAEAAAABAAEAAgAPAAAAAAMAAAECABGjAAAA4gAJAP8BAAAAAAAAMAEAJwIAAAD/AQAAAQAAAOICDgDFAQICAQAAADABANsHAAAAwAEPADABADMIAAAAggACABADBwMIAwkDCgMLAwwDDQMOAwYIBgABAAAAAv////8DBAAAAAUGAAAAB/////8I/////wMPAxADEQMSCAMKCwAAAAAMAAAAAw0AAAAGAAEAAQABGAAAAgAAAAMAAQAA/wAIAAAAAQAAAAABEVmAFdSw+jLAheAxPFVMyWFBl2EjneoU

-- https://lua.expert/
return {
	Name = "unbind",
	Description = "Unbinds an input previously bound with Bind",
	Group = "DefaultUtil",
	Aliases = {},
	Args = {
		{
			Type = "userInput ! bindableResource @ player",
			Name = "Input/Key",
			Description = "The key or input type you\'d like to unbind."
		}
	},
	ClientRun = function(p1, p2) --[[ ClientRun | Line: 14 ]]
		local v1 = p1:GetStore("CMDR_Binds")

		if v1[p2] then
			v1[p2]:Disconnect()
			v1[p2] = nil

			return "Unbound command from input."
		end

		return "That input wasn\'t bound."
	end
}