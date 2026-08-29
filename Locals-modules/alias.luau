-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMWBENtZHIIUmVnaXN0cnkEVXRpbBBNYWtlQWxpYXNDb21tYW5kFVJlZ2lzdGVyQ29tbWFuZE9iamVjdBBDcmVhdGVkIGFsaWFzICVxBmZvcm1hdAlDbGllbnRSdW4ETmFtZQVhbGlhcwdBbGlhc2VzC0Rlc2NyaXB0aW9uQ0NyZWF0ZXMgYSBuZXcsIHNpbmdsZSBjb21tYW5kIG91dCBvZiBhIGNvbW1hbmQgYW5kIGdpdmVuIGFyZ3VtZW50cy4FR3JvdXALRGVmYXVsdFV0aWwEQXJncwRUeXBlBnN0cmluZwpBbGlhcyBuYW1lOFRoZSBrZXkgb3IgaW5wdXQgdHlwZSB5b3UnZCBsaWtlIHRvIGJpbmQgdGhlIGNvbW1hbmQgdG8uDkNvbW1hbmQgc3RyaW5nblRoZSBjb21tYW5kIHRleHQgeW91IHdhbnQgdG8gcnVuLiBTZXBhcmF0ZSBtdWx0aXBsZSBjb21tYW5kcyB3aXRoICImJiIuIEFjY2VwdCBhcmd1bWVudHMgd2l0aCAkMSwgJDIsICQzLCBldGMuAAIIAwAAAAcAAAEDAxMCF00DAJ4AAAAATQMDsQEAAABNBQCeAAAAAE0FBZ4CAAAATQUFLQMAAABSBgEAUgcCAJ8FAwKpBgEAvAMDyQQAAACfAwQBbwMFAFIFAQC8AwONBgAAAJ8DAwCCAwAABwMBAwIDAwMEAwUDBgMHABMIARgAAAAAAQAAAAAAAAAAAf4AAAUAAAAAABQAAAAABAAAAQIAEqMAAADiAAkA/wEAAAAAAAAwAQAnAgAAAP8BAAACAAAA4gIOAOIDEQDFAQIDAQAAADABANsHAAAAwAESADABADMIAAAAggACABMDCQMKAwsDDAMNAw4DDwMQAwgIBgABAAAAAv////8DBAAAAAUGAAAAB/////8I/////wMRAxIDEwMUCAMKCwAAAAAMAAAAAw0AAAADFQMWCAMKCwAAAAAPAAAAAxAAAAAGAAEAAQABGAAAAgAAAAMAAQUAAPoADQAAAAEAAAAAAbwN01QcutpHAK12Ftwoc6PMFcQgjsm5VQ==

-- https://lua.expert/
return {
	Name = "alias",
	Description = "Creates a new, single command out of a command and given arguments.",
	Group = "DefaultUtil",
	Aliases = {},
	Args = {
		{
			Type = "string",
			Name = "Alias name",
			Description = "The key or input type you\'d like to bind the command to."
		},
		{
			Type = "string",
			Name = "Command string",
			Description = "The command text you want to run. Separate multiple commands with \"&&\". Accept arguments with $1, $2, $3, etc."
		}
	},
	ClientRun = function(p1, p2, p3) --[[ ClientRun | Line: 19 ]]
		p1.Cmdr.Registry:RegisterCommandObject(p1.Cmdr.Util.MakeAliasCommand(p2, p3), true)

		return ("Created alias %q"):format(p2)
	end
}