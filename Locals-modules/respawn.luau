-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMNBE5hbWUHcmVzcGF3bgtEZXNjcmlwdGlvbihSZXNwYXducyBhIHBsYXllciBvciBhIGdyb3VwIG9mIHBsYXllcnMuBUdyb3VwDERlZmF1bHRBZG1pbghBdXRvRXhlYwRBcmdzrgFhbGlhcyAicmVmcmVzaHxSZXNwYXducyB0aGUgcGxheWVyIGFuZCByZXR1cm5zIHRoZW0gdG8gdGhlaXIgcHJldmlvdXMgbG9jYXRpb24uIiB2YXI9IC5yZWZyZXNoX3BvcyAke3Bvc2l0aW9uICQxe3BsYXllcnxQbGF5ZXJ9fSAmJiByZXNwYXduICQxICYmIHRwICQxIEAke3t2YXIgLnJlZnJlc2hfcG9zfX0EVHlwZQdwbGF5ZXJzB3RhcmdldHMXVGhlIHBsYXllcnMgdG8gcmVzcGF3bi4AAQMAAAECABGjAAAA4gAIAP8BAAABAAAAbwIJAMUBAgIBAAAAMAEAfQYAAAD/AQAAAQAAAOICDgDFAQICAQAAADABANsHAAAAggACAA8DAQMCAwMDBAMFAwYDBwMICAUAAQAAAAIDAAAABAUAAAAG/////wf/////AwkDCgMLAwwDDQgDCgsAAAAADAAAAAINAAAAAAEAARgAAAQAAQAA/wADAAEAAP8AAAEAAAAAAFYo0cOH8NFluheqjA1s070mMMa3ZOy7wg==

-- https://lua.expert/
return {
	Name = "respawn",
	Description = "Respawns a player or a group of players.",
	Group = "DefaultAdmin",
	AutoExec = { "alias \"refresh|Respawns the player and returns them to their previous location.\" var= .refresh_pos ${position $1{player|Player}} && respawn $1 && tp $1 @${{var .refresh_pos}}" },
	Args = {
		{
			Type = "players",
			Name = "targets",
			Description = "The players to respawn."
		}
	}
}