-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMTCXZhcnNfdXNlZAhHZXRTdG9yZQlDbGllbnRSdW4ETmFtZQN2YXIHQWxpYXNlcwtEZXNjcmlwdGlvbhdHZXRzIGEgc3RvcmVkIHZhcmlhYmxlLgVHcm91cAtEZWZhdWx0VXRpbAhBdXRvRXhlYwRBcmdzVmFsaWFzICJpbml0LWVkaXR8RWRpdCB5b3VyIGluaXRpYWxpemF0aW9uIHNjcmlwdCIgZWRpdCAke3ZhciBpbml0fSBcXAogJiYgdmFyPSBpbml0IHx8UmFsaWFzICJpbml0LXJ1bnxSZS1ydW5zIHRoZSBpbml0aWFsaXphdGlvbiBzY3JpcHQgbWFudWFsbHkuIiBydW4tbGluZXMgJHt2YXIgaW5pdH0IaW5pdC1ydW4EVHlwZQlzdG9yZWRLZXkDS2V5rwFUaGUga2V5IHRvIGdldCwgcmV0cmlldmVkIGZyb20geW91ciB1c2VyIGRhdGEgc3RvcmUuIEtleXMgcHJlZml4ZWQgd2l0aCAuIGFyZSBub3Qgc2F2ZWQuIEtleXMgcHJlZml4ZWQgd2l0aCAkIGFyZSBnYW1lLXdpZGUuIEtleXMgcHJlZml4ZWQgd2l0aCAkLiBhcmUgZ2FtZS13aWRlIGFuZCBub24tc2F2ZWQuAAIFAgAAAAAHbwQAALwCAFUBAAAAnwIDAqkDAQBqAwIBggABAAIDAQMCABMDARgAAAAAAAABFAAAAAAFAAABAgAaowAAAOIACgD/AQAAAAAAADABACcCAAAA/wEAAAMAAABvAgsAbwMMAG8EDQDFAQIEAQAAADABAH0HAAAA/wEAAAEAAADiAhIAxQECAgEAAAAwAQDbCAAAAMABEwAwAQAzCQAAAIIAAgAUAwQDBQMGAwcDCAMJAwoDCwMMAwMIBwABAAAAAv////8DBAAAAAUGAAAAB/////8I/////wn/////Aw0DDgMPAxADEQMSAxMIAw4PAAAAABAAAAADEQAAAAYAAQABAAEYAAACAAAAAwABAQEAAP0ABQABAAD/AAgAAAABAAAAAAHNFEd9di5uZoBJh23aoq8gvQxQCf/QLXw=

-- https://lua.expert/
return {
	Name = "var",
	Description = "Gets a stored variable.",
	Group = "DefaultUtil",
	Aliases = {},
	AutoExec = { "alias \"init-edit|Edit your initialization script\" edit ${var init} \\\\\n && var= init ||", "alias \"init-run|Re-runs the initialization script manually.\" run-lines ${var init}", "init-run" },
	Args = {
		{
			Type = "storedKey",
			Name = "Key",
			Description = "The key to get, retrieved from your user data store. Keys prefixed with . are not saved. Keys prefixed with $ are game-wide. Keys prefixed with $. are game-wide and non-saved."
		}
	},
	ClientRun = function(p1, p2) --[[ ClientRun | Line: 19 ]]
		p1:GetStore("vars_used")[p2] = true
	end
}