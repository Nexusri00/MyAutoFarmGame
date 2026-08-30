-- Tournament Quest Auto-Farm LocalScript v2.2 (Fixed)
-- Place in StarterPlayer > StarterCharacterScripts or as a LocalScript in game

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
if not player then return end

local playerGui = player:WaitForChild("PlayerGui")
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

-- Get player data with timeout
local data
pcall(function()
	data = player:WaitForChild("Data", 30)
end)

if not data then 
	warn("[TournamentFarm] Player data not found")
	return 
end

-- Quest system
local quests
pcall(function()
	quests = data:WaitForChild("Quests", 30)
end)

if not quests then 
	warn("[TournamentFarm] Quests folder not found")
	return 
end

-- Get references to quest folders
local mainQuests = quests:FindFirstChild("Main")
local dailyQuests = quests:FindFirstChild("Daily")
local weeklyQuests = quests:FindFirstChild("Weekly")
local monthlyQuests = quests:FindFirstChild("Monthly")

-- Remote event for attacks
local Events = ReplicatedStorage:FindFirstChild("Events")
local remote = Events and Events:FindFirstChild("RemoteEvent")

-- ============= SETTINGS =============
local Config = {
	Running = false,
	UseSkills = true,
	
	Position = "Above",
	Height = 6,
	HeightMin = 3,
	HeightMax = 40,
	
	TeleportDuration = 1.5,
	SearchRadius = 5000,
	SearchInterval = 0.06,
	M1Interval = {Min = 0.2, Max = 0.35},
	
	LastM1 = 0,
	CurrentQuest = nil,
	CurrentTarget = nil,
	CurrentRoot = nil,
	Status = "Idle",
}

local Skills = {
	{Key = Enum.KeyCode.Z, Name = "Z", Enabled = true, Cooldown = 2.5, Last = 0},
	{Key = Enum.KeyCode.X, Name = "X", Enabled = true, Cooldown = 3.0, Last = 0},
	{Key = Enum.KeyCode.C, Name = "C", Enabled = true, Cooldown = 3.5, Last = 0},
	{Key = Enum.KeyCode.V, Name = "V", Enabled = false, Cooldown = 4.0, Last = 0},
}

-- ============= UTILITY FUNCTIONS =============
local function randomFloat(min, max)
	return min + math.random() * (max - min)
end

local function normalize(str)
	return tostring(str or ""):lower():gsub("[^%w]", "")
end

local function getCharacter()
	local char = player.Character
	if not char then return nil, nil, nil end
	
	local hum = char:FindFirstChildOfClass("Humanoid")
	local rt = char:FindFirstChild("HumanoidRootPart")
	
	if not hum or not rt or hum.Health <= 0 then
		return nil, nil, nil
	end
	
	return char, hum, rt
end

local function getModelRoot(model)
	if not model or not model:IsA("Model") then return nil end
	
	local rt = model:FindFirstChild("HumanoidRootPart")
	if rt and rt:IsA("BasePart") then return rt end
	
	if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then
		return model.PrimaryPart
	end
	
	local torso = model:FindFirstChild("UpperTorso") or model:FindFirstChild("Torso")
	if torso and torso:IsA("BasePart") then return torso end
	
	return nil
end

local function isAliveNPC(model)
	if not model or not model:IsA("Model") then return false end
	if Players:GetPlayerFromCharacter(model) then return false end
	
	local hum = model:FindFirstChildOfClass("Humanoid")
	return hum and hum.Health > 0 and getModelRoot(model) ~= nil
end

-- ============= QUEST FINDING =============
local function findActiveQuest()
	local allFolders = {mainQuests, dailyQuests, weeklyQuests, monthlyQuests}
	
	for _, folder in ipairs(allFolders) do
		if folder then
			for _, questFolder in ipairs(folder:GetChildren()) do
				if questFolder:IsA("Folder") then
					local progress = questFolder:FindFirstChild("Progress")
					local completed = questFolder:FindFirstChild("Completed")
					
					if progress and not (completed and completed.Value) then
						return questFolder, folder.Name
					end
				end
			end
		end
	end
	return nil, nil
end

-- Quest target detection from folder name
local function getQuestTarget(questFolder)
	if not questFolder then return nil end
	
	local questName = questFolder.Name
	
	-- Common quest targets from repo patterns
	local targets = {
		["Mission Satoru Gojo"] = "Satoru Gojo",
		["Mission Ryomen Sukuna"] = "Ryomen Sukuna",
		["Zenitsu Quest 1"] = "Demon Slayer",
		["Akaza Quest 2"] = "Demon Slayer",
		["Garou Quest 1"] = "Flashy Flash",
		["Garou Quest 2"] = "Garou",
		["Blast Quest"] = "Blast",
		["Mission Flashy Flash"] = "Flashy Flash",
		["Mission Ichigo Kurosaki"] = "Ichigo Kurosaki",
		["Mission Sosuke Aizen"] = "Sosuke Aizen",
		["Mission Cid Kagenou"] = "Cid Kagenou",
		["Kill Enemies"] = "Enemies",
		["Deal Damage"] = "Enemies",
	}
	
	return targets[questName] or "Enemies"
end

local function findNPCByName(targetName)
	if not targetName or targetName == "" then return nil end
	
	local wanted = normalize(targetName)
	local _, _, playerRoot = getCharacter()
	if not playerRoot then return nil end
	
	local best, bestDist = nil, math.huge
	
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Model") and isAliveNPC(obj) then
			local modelName = normalize(obj.Name):gsub("%d+$", "")
			if modelName == wanted or string.find(modelName, wanted, 1, true) then
				local rt = getModelRoot(obj)
				if rt then
					local dist = (rt.Position - playerRoot.Position).Magnitude
					if dist < bestDist and dist <= Config.SearchRadius then
						bestDist = dist
						best = obj
					end
				end
			end
		end
	end
	
	return best
end

-- ============= COMBAT & MOVEMENT =============
local hoverConnection = nil

local function stopHover()
	if hoverConnection then 
		pcall(function()
			hoverConnection:Disconnect()
		end)
		hoverConnection = nil
	end
	
	local _, hum, rt = getCharacter()
	if hum then hum.AutoRotate = true end
	if rt then
		rt.AssemblyLinearVelocity = Vector3.zero
		rt.AssemblyAngularVelocity = Vector3.zero
	end
end

local function smoothTeleport(targetPos, duration)
	local _, _, rt = getCharacter()
	if not rt then return false end
	
	duration = math.max(duration or Config.TeleportDuration, 0.05)
	local startPos = rt.Position
	local startTime = os.clock()
	
	stopHover()
	
	hoverConnection = RunService.RenderStepped:Connect(function()
		pcall(function()
			local _, _, currentRoot = getCharacter()
			if not currentRoot then
				stopHover()
				return
			end
			
			local alpha = math.min((os.clock() - startTime) / duration, 1)
			local eased = 1 - (1 - alpha) ^ 2
			currentRoot.CFrame = CFrame.new(startPos:Lerp(targetPos, eased))
			currentRoot.AssemblyLinearVelocity = Vector3.zero
			currentRoot.AssemblyAngularVelocity = Vector3.zero
			
			if alpha >= 1 then
				stopHover()
			end
		end)
	end)
	
	return true
end

local floatTime = 0
local driftOffset = Vector3.zero
local driftTimer = 0

RunService.RenderStepped:Connect(function(dt)
	pcall(function()
		if not Config.Running or not Config.CurrentRoot then return end
		
		local _, hum, rt = getCharacter()
		if not hum or not rt or not Config.CurrentRoot.Parent or not isAliveNPC(Config.CurrentTarget) then
			Config.CurrentTarget = nil
			Config.CurrentRoot = nil
			return
		end
		
		floatTime = floatTime + dt
		driftTimer = driftTimer + dt
		
		if driftTimer > randomFloat(2.5, 4) then
			driftTimer = 0
			driftOffset = Vector3.new(randomFloat(-0.25, 0.25), 0, randomFloat(-0.25, 0.25))
		end
		
		local vertical = Config.Position == "Above" and Config.Height or -Config.Height
		local bob = math.sin(floatTime * 1.5) * 0.4
		local desiredPos = Config.CurrentRoot.Position + Vector3.new(driftOffset.X, vertical + bob, driftOffset.Z)
		
		rt.Anchored = false
		rt.CFrame = CFrame.lookAt(desiredPos, desiredPos + (Config.CurrentRoot.Position - desiredPos).Unit)
		rt.AssemblyLinearVelocity = Vector3.zero
		rt.AssemblyAngularVelocity = Vector3.zero
		hum.AutoRotate = false
	end)
end)

local function buildCastRay(targetRoot, playerRoot)
	local cam = workspace.CurrentCamera
	local eyePos = cam and cam.CFrame.Position or playerRoot.Position
	local aimPos = targetRoot.Position + Vector3.new(randomFloat(-0.3, 0.3), randomFloat(-0.1, 0.4), randomFloat(-0.3, 0.3))
	local dir = (aimPos - eyePos).Unit
	if dir.Magnitude ~= dir.Magnitude then dir = Vector3.new(0, 0, -1) end
	
	return {origin = playerRoot.CFrame, direction = dir, raw = CFrame.lookAt(playerRoot.Position, playerRoot.Position + dir * 50)}
end

local function attack(targetRoot, playerRoot)
	if not remote or not targetRoot or not playerRoot then return end
	
	pcall(function()
		-- Try skills first
		if Config.UseSkills then
			local now = os.clock()
			for _, skill in ipairs(Skills) do
				if skill.Enabled and now - skill.Last >= skill.Cooldown then
					skill.Last = now
					local castRay = buildCastRay(targetRoot, playerRoot)
					remote:FireServer("Attack", {isSkill = true, what = "skill" .. tostring(string.byte(skill.Name) - 88), castRay = castRay})
					return
				end
			end
		end
		
		-- Fall back to M1
		local now = os.clock()
		if now - Config.LastM1 >= randomFloat(Config.M1Interval.Min, Config.M1Interval.Max) then
			Config.LastM1 = now
			local castRay = buildCastRay(targetRoot, playerRoot)
			remote:FireServer("Attack", {castRay = castRay}, "Attack")
		end
	end)
end

-- ============= UI =============
local UIState = {
	Visible = true,
	Minimized = false,
}

local UIElements = {
	gui = nil,
	main = nil,
	content = nil,
	toggleBtn = nil,
	statusLabel = nil,
	npcLabel = nil,
	questLabel = nil,
	heightBox = nil,
	aboveBtn = nil,
	belowBtn = nil,
	skillsBtn = nil,
}

local function createUI()
	pcall(function()
		local old = playerGui:FindFirstChild("TournamentFarm")
		if old then 
			pcall(function() old:Destroy() end)
		end
		
		local gui = Instance.new("ScreenGui")
		gui.Name = "TournamentFarm"
		gui.ResetOnSpawn = false
		gui.IgnoreGuiInset = true
		gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		gui.Parent = playerGui
		UIElements.gui = gui
		
		local main = Instance.new("Frame")
		main.Size = UDim2.new(0, 320, 0, 420)
		main.Position = UDim2.new(0, 20, 0.5, -210)
		main.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
		main.BorderSizePixel = 0
		main.Parent = gui
		UIElements.main = main
		
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 10)
		corner.Parent = main
		
		local stroke = Instance.new("UIStroke")
		stroke.Color = Color3.fromRGB(70, 70, 82)
		stroke.Thickness = 1
		stroke.Parent = main
		
		-- Title Bar
		local titleBar = Instance.new("Frame")
		titleBar.Size = UDim2.new(1, 0, 0, 44)
		titleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
		titleBar.BorderSizePixel = 0
		titleBar.Parent = main
		
		local titleCorner = Instance.new("UICorner")
		titleCorner.CornerRadius = UDim.new(0, 10)
		titleCorner.Parent = titleBar
		
		local title = Instance.new("TextLabel")
		title.BackgroundTransparency = 1
		title.Position = UDim2.new(0, 14, 0, 0)
		title.Size = UDim2.new(1, -55, 1, 0)
		title.Font = Enum.Font.GothamBold
		title.Text = "Tournament Farm"
		title.TextColor3 = Color3.fromRGB(245, 245, 250)
		title.TextSize = 16
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.Parent = titleBar
		
		local minimize = Instance.new("TextButton")
		minimize.Size = UDim2.new(0, 34, 0, 30)
		minimize.Position = UDim2.new(1, -40, 0, 7)
		minimize.BackgroundTransparency = 1
		minimize.Font = Enum.Font.GothamBold
		minimize.Text = "—"
		minimize.TextColor3 = Color3.fromRGB(230, 230, 235)
		minimize.TextSize = 20
		minimize.Parent = titleBar
		
		minimize.MouseButton1Click:Connect(function()
			pcall(function()
				UIState.Minimized = not UIState.Minimized
				if UIElements.content then
					UIElements.content.Visible = not UIState.Minimized
				end
				if UIElements.main then
					UIElements.main.Size = UIState.Minimized and UDim2.new(0, 320, 0, 44) or UDim2.new(0, 320, 0, 420)
				end
				minimize.Text = UIState.Minimized and "+" or "—"
			end)
		end)
		
		-- Content
		local content = Instance.new("Frame")
		content.BackgroundTransparency = 1
		content.Position = UDim2.new(0, 12, 0, 52)
		content.Size = UDim2.new(1, -24, 1, -60)
		content.Parent = main
		UIElements.content = content
		
		local function makeButton(text, y)
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, 0, 0, 36)
			btn.Position = UDim2.new(0, 0, 0, y)
			btn.BackgroundColor3 = Color3.fromRGB(36, 36, 44)
			btn.BorderSizePixel = 0
			btn.AutoButtonColor = true
			btn.Font = Enum.Font.GothamSemibold
			btn.Text = text
			btn.TextColor3 = Color3.fromRGB(235, 235, 240)
			btn.TextSize = 13
			btn.Parent = content
			
			local c = Instance.new("UICorner")
			c.CornerRadius = UDim.new(0, 7)
			c.Parent = btn
			
			return btn
		end
		
		-- Toggle Button
		local toggleBtn = makeButton("Farming: OFF", 0)
		toggleBtn.BackgroundColor3 = Color3.fromRGB(36, 36, 44)
		UIElements.toggleBtn = toggleBtn
		
		toggleBtn.MouseButton1Click:Connect(function()
			pcall(function()
				Config.Running = not Config.Running
				if UIElements.toggleBtn then
					UIElements.toggleBtn.Text = Config.Running and "Farming: ON" or "Farming: OFF"
					UIElements.toggleBtn.BackgroundColor3 = Config.Running and Color3.fromRGB(35, 100, 62) or Color3.fromRGB(36, 36, 44)
				end
				
				if not Config.Running then
					Config.CurrentTarget = nil
					Config.CurrentRoot = nil
					stopHover()
				end
			end)
		end)
		
		-- Position Toggle
		local aboveBtn = makeButton("Position: ABOVE", 42)
		local belowBtn = makeButton("Position: BELOW", 84)
		UIElements.aboveBtn = aboveBtn
		UIElements.belowBtn = belowBtn
		
		local function updatePositionUI()
			pcall(function()
				if Config.Position == "Above" then
					if UIElements.aboveBtn then UIElements.aboveBtn.BackgroundColor3 = Color3.fromRGB(63, 124, 235) end
					if UIElements.belowBtn then UIElements.belowBtn.BackgroundColor3 = Color3.fromRGB(36, 36, 44) end
				else
					if UIElements.aboveBtn then UIElements.aboveBtn.BackgroundColor3 = Color3.fromRGB(36, 36, 44) end
					if UIElements.belowBtn then UIElements.belowBtn.BackgroundColor3 = Color3.fromRGB(63, 124, 235) end
				end
			end)
		end
		
		aboveBtn.MouseButton1Click:Connect(function()
			pcall(function()
				Config.Position = "Above"
				updatePositionUI()
			end)
		end)
		
		belowBtn.MouseButton1Click:Connect(function()
			pcall(function()
				Config.Position = "Below"
				updatePositionUI()
			end)
		end)
		
		updatePositionUI()
		
		-- Skills Toggle
		local skillsBtn = makeButton("Skills: ALL ON", 126)
		UIElements.skillsBtn = skillsBtn
		
		skillsBtn.MouseButton1Click:Connect(function()
			pcall(function()
				local anyOn = false
				for _, skill in ipairs(Skills) do
					if skill.Enabled then anyOn = true break end
				end
				
				for _, skill in ipairs(Skills) do
					skill.Enabled = not anyOn
				end
				
				local allOn, anyEnabled = true, false
				for _, skill in ipairs(Skills) do
					if skill.Enabled then anyEnabled = true else allOn = false end
				end
				
				if UIElements.skillsBtn then
					UIElements.skillsBtn.Text = "Skills: " .. (allOn and "ALL ON" or (anyEnabled and "SOME" or "ALL OFF"))
				end
			end)
		end)
		
		-- Height Box
		local heightBox = Instance.new("TextBox")
		heightBox.Size = UDim2.new(1, 0, 0, 32)
		heightBox.Position = UDim2.new(0, 0, 0, 168)
		heightBox.BackgroundColor3 = Color3.fromRGB(36, 36, 44)
		heightBox.BorderSizePixel = 0
		heightBox.ClearTextOnFocus = false
		heightBox.Font = Enum.Font.Gotham
		heightBox.TextSize = 13
		heightBox.TextColor3 = Color3.fromRGB(240, 240, 245)
		heightBox.Text = "Height: " .. tostring(Config.Height)
		heightBox.Parent = content
		UIElements.heightBox = heightBox
		
		local hc = Instance.new("UICorner")
		hc.CornerRadius = UDim.new(0, 7)
		hc.Parent = heightBox
		
		heightBox.FocusLost:Connect(function()
			pcall(function()
				local num = tonumber(tostring(heightBox.Text):match("[-%d%.]+"))
				if num then
					Config.Height = math.clamp(num, Config.HeightMin, Config.HeightMax)
					if UIElements.heightBox then
						UIElements.heightBox.Text = "Height: " .. tostring(Config.Height)
					end
				else
					if UIElements.heightBox then
						UIElements.heightBox.Text = "Height: " .. tostring(Config.Height)
					end
				end
			end)
		end)
		
		-- Status Label
		local statusLabel = Instance.new("TextLabel")
		statusLabel.Size = UDim2.new(1, 0, 0, 24)
		statusLabel.Position = UDim2.new(0, 0, 0, 210)
		statusLabel.BackgroundTransparency = 1
		statusLabel.Font = Enum.Font.Gotham
		statusLabel.TextSize = 12
		statusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
		statusLabel.TextWrapped = true
		statusLabel.Text = "Status: Idle"
		statusLabel.Parent = content
		UIElements.statusLabel = statusLabel
		
		-- NPC Info
		local npcLabel = Instance.new("TextLabel")
		npcLabel.Size = UDim2.new(1, 0, 0, 24)
		npcLabel.Position = UDim2.new(0, 0, 0, 240)
		npcLabel.BackgroundTransparency = 1
		npcLabel.Font = Enum.Font.Gotham
		npcLabel.TextSize = 11
		npcLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
		npcLabel.TextWrapped = true
		npcLabel.Text = "Target: None"
		npcLabel.Parent = content
		UIElements.npcLabel = npcLabel
		
		-- Quest Info
		local questLabel = Instance.new("TextLabel")
		questLabel.Size = UDim2.new(1, 0, 0, 50)
		questLabel.Position = UDim2.new(0, 0, 0, 270)
		questLabel.BackgroundTransparency = 1
		questLabel.Font = Enum.Font.Gotham
		questLabel.TextSize = 10
		questLabel.TextColor3 = Color3.fromRGB(120, 120, 140)
		questLabel.TextWrapped = true
		questLabel.TextYAlignment = Enum.TextYAlignment.Top
		questLabel.Text = "Quest: None"
		questLabel.Parent = content
		UIElements.questLabel = questLabel
		
		-- Dragging
		local dragging, dragStart, startPos = false, nil, nil
		
		titleBar.InputBegan:Connect(function(input)
			pcall(function()
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					dragStart = input.Position
					startPos = UIElements.main.Position
				end
			end)
		end)
		
		UserInputService.InputChanged:Connect(function(input)
			pcall(function()
				if not dragging or input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
				if not dragStart or not startPos or not UIElements.main then return end
				
				local delta = input.Position - dragStart
				UIElements.main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end)
		end)
		
		UserInputService.InputEnded:Connect(function(input)
			pcall(function()
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)
		end)
	end)
end

-- ============= INPUT HANDLING =============
UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	
	pcall(function()
		if input.KeyCode == Enum.KeyCode.K then
			UIState.Visible = not UIState.Visible
			if UIElements.main then
				UIElements.main.Visible = UIState.Visible
			end
		elseif input.KeyCode == Enum.KeyCode.Up then
			Config.Height = math.clamp(Config.Height + 1, Config.HeightMin, Config.HeightMax)
			if UIElements.heightBox then
				UIElements.heightBox.Text = "Height: " .. Config.Height
			end
		elseif input.KeyCode == Enum.KeyCode.Down then
			Config.Height = math.clamp(Config.Height - 1, Config.HeightMin, Config.HeightMax)
			if UIElements.heightBox then
				UIElements.heightBox.Text = "Height: " .. Config.Height
			end
		end
	end)
end)

-- ============= MAIN FARM LOOP =============
task.spawn(function()
	createUI()
	task.wait(0.5)
	
	while true do
		pcall(function()
			if Config.Running then
				local questFolder = findActiveQuest()
				Config.CurrentQuest = questFolder
				
				if questFolder then
					Config.Status = "Quest: " .. string.sub(questFolder.Name, 1, 20)
					
					-- Get target from quest name
					local targetName = getQuestTarget(questFolder)
					local target = targetName and findNPCByName(targetName)
					
					if target and isAliveNPC(target) then
						Config.CurrentTarget = target
						Config.CurrentRoot = getModelRoot(target)
						
						local _, _, playerRoot = getCharacter()
						if playerRoot and Config.CurrentRoot then
							Config.Status = "Fighting: " .. string.sub(target.Name, 1, 15)
							
							-- Smooth teleport to target
							local vertical = Config.Position == "Above" and Config.Height or -Config.Height
							smoothTeleport(Config.CurrentRoot.Position + Vector3.new(0, vertical, 0), Config.TeleportDuration)
							
							-- Attack
							attack(Config.CurrentRoot, playerRoot)
						end
					else
						Config.Status = "Searching..."
						Config.CurrentTarget = nil
						Config.CurrentRoot = nil
					end
				else
					Config.Status = "No Quest"
					Config.CurrentTarget = nil
					Config.CurrentRoot = nil
				end
			else
				Config.Status = "Idle"
			end
		end)
		
		-- Update UI labels
		pcall(function()
			if UIElements.statusLabel then
				UIElements.statusLabel.Text = "Status: " .. tostring(Config.Status)
			end
			if UIElements.npcLabel then
				UIElements.npcLabel.Text = "Target: " .. (Config.CurrentTarget and string.sub(tostring(Config.CurrentTarget.Name), 1, 20) or "None")
			end
			if UIElements.questLabel then
				UIElements.questLabel.Text = "Quest: " .. (Config.CurrentQuest and string.sub(tostring(Config.CurrentQuest.Name), 1, 25) or "None")
			end
		end)
		
		task.wait(Config.SearchInterval)
	end
end)

-- ============= CLEANUP =============
character.Humanoid.Died:Connect(function()
	pcall(function()
		stopHover()
		Config.Running = false
	end)
end)

print("[TournamentFarm] Loaded successfully! Press K to toggle UI")
