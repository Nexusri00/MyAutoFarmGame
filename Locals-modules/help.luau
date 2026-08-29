-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- https://lua.expert/
return {
	Name = "help",
	Description = "Displays a list of all commands, or inspects one command.",
	Group = "Help",
	Args = {
		{
			Type = "command",
			Name = "Command",
			Description = "The command to view information on",
			Optional = true
		}
	},
	ClientRun = function(p1, p2) --[[ ClientRun | Line: 31 ]]
		if p2 then
			local v1 = p1.Cmdr.Registry:GetCommand(p2)

			p1:Reply(("Command: %*"):format(v1.Name), Color3.fromRGB(230, 126, 34))

			if v1.Aliases and #v1.Aliases > 0 then
				p1:Reply(("Aliases: %*"):format((table.concat(v1.Aliases, ", "))), Color3.fromRGB(230, 230, 230))
			end

			p1:Reply(v1.Description, Color3.fromRGB(230, 230, 230))

			for i, v in ipairs(v1.Args) do
				p1:Reply((("#%* %*%*: %* - %*"):format(i, v.Name, if v.Optional == true then "?" else "", v.Type, v.Description)))
			end
		else
			p1:Reply("Argument Shorthands\n-------------------\n.   Me/Self\n*   All/Everyone\n**  Others\n?   Random\n?N  List of N random values\n")
			p1:Reply("Tips\n----\n\226\128\162 Utilize the Tab key to automatically complete commands\n\226\128\162 Easily select and copy command output\n")

			local v5 = p1.Cmdr.Registry:GetCommands()

			table.sort(v5, function(p1, p2) --[[ Line: 49 ]]
				if not (p1.Group and p2.Group) then
					return p1.Group
				end

				return p1.Group < p2.Group
			end)

			local v6 = nil

			for i, v in ipairs(v5) do
				v.Group = v.Group or "No Group"

				if v6 ~= v.Group then
					p1:Reply((("\n%*\n%*"):format(v.Group, (string.rep("-", #v.Group)))))
					v6 = v.Group
				end

				p1:Reply(if v.Description then ("%* - %*"):format(v.Name, v.Description) else v.Name)
			end
		end

		return ""
	end
}