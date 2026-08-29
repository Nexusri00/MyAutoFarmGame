-- MyAutoFarmGame | Quest Auto Farm
-- E toggles the farm on/off.
-- Quest pickup uses the NPC ProximityPrompt and E.
-- Live quest state comes from Data.Quests and the game's QuestData definitions.
-- Combat follows the supplied farm's smooth teleport/hover + M1/skill cadence.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
if not player then
    return
end

local playerGui = player:WaitForChild("PlayerGui")
local data = player:WaitForChild("Data", 30)
if not data then
    warn("[AutoFarm] Data folder not found")
    return
end

local quests = data:WaitForChild("Quests", 30)
if not quests then
    warn("[AutoFarm] Data.Quests not found")
    return
end

local mainQuests = quests:WaitForChild("Main", 30)
local dailyQuests = quests:WaitForChild("Daily", 30)
local weeklyQuests = quests:WaitForChild("Weekly", 30)
local monthlyQuests = quests:WaitForChild("Monthly", 30)

local questData
pcall(function()
    questData = require(ReplicatedStorage.Modules.Configurations.QuestData)
end)

local events = ReplicatedStorage:FindFirstChild("Events")
local remote = events and events:FindFirstChild("RemoteEvent")
local inputFunction = _G.InputFunction

local Settings = {
    Running = false,
    AutoClaim = true,
    AutoRepeat = true,
    AutoPin = true,
    UseSkills = true,

    Position = "Above",
    Height = 6,
    HeightMin = 3,
    HeightMax = 40,
    Bob = 0.45,
    Drift = 0.25,

    TeleportTime = 1.6,
    SearchRadius = 5000,
    SearchInterval = 0.08,
    M1Min = 0.24,
    M1Max = 0.40,

    QuestFolder = nil,
    QuestDefinition = nil,
    QuestProgress = 0,
    QuestGoal = 0,
    QuestTarget = nil,
    QuestNPCName = nil,
    Target = nil,
    TargetRoot = nil,

    Step = "Idle",
    LastM1 = 0,
    StartedAt = 0,
}

local Skills = {
    {Key = Enum.KeyCode.Z, Name = "Z", What = "skill1", Enabled = true, Cooldown = 2.5, Last = 0},
    {Key = Enum.KeyCode.X, Name = "X", What = "skill2", Enabled = true, Cooldown = 3.0, Last = 0},
    {Key = Enum.KeyCode.C, Name = "C", What = "skill3", Enabled = true, Cooldown = 3.5, Last = 0},
    {Key = Enum.KeyCode.V, Name = "V", What = "skill4", Enabled = true, Cooldown = 4.0, Last = 0},
    {Key = Enum.KeyCode.F, Name = "F", What = "skill5", Enabled = false, Cooldown = 4.5, Last = 0},
}

local ui = {}
local selectedNPC = nil
local npcButtons = {}
local hoverConnection = nil
local teleportConnection = nil
local busy = false
local minimized = false

local function randomFloat(min, max)
    return min + math.random() * (max - min)
end

local function getCharacter()
    local character = player.Character
    if not character then
        return nil, nil, nil
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")

    if not humanoid or not root or not root:IsA("BasePart") or humanoid.Health <= 0 then
        return nil, nil, nil
    end

    return character, humanoid, root
end

local function getRoot(model)
    if not model or not model:IsA("Model") then
        return nil
    end

    local root = model:FindFirstChild("HumanoidRootPart")
    if root and root:IsA("BasePart") then
        return root
    end

    if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then
        return model.PrimaryPart
    end

    local torso = model:FindFirstChild("UpperTorso") or model:FindFirstChild("Torso")
    if torso and torso:IsA("BasePart") then
        return torso
    end

    return model:FindFirstChildWhichIsA("BasePart")
end

local function aliveNPC(model)
    if not model or not model:IsA("Model") then
        return false
    end

    if Players:GetPlayerFromCharacter(model) then
        return false
    end

    local humanoid = model:FindFirstChildOfClass("Humanoid")
    return humanoid ~= nil and humanoid.Health > 0 and getRoot(model) ~= nil
end

local function normalize(value)
    return tostring(value or ""):lower():gsub("[^%w]", "")
end

local function effectiveGoal(definition)
    if not definition or not definition.Goal then
        return 0
    end

    if _G.QuestData and _G.QuestData.EffectiveGoalAmount then
        local ok, result = pcall(function()
            return _G.QuestData.EffectiveGoalAmount(definition)
        end)
        if ok and type(result) == "number" then
            return result
        end
    end

    return tonumber(definition.Goal.Amount) or 0
end

local function getDefinition(folder)
    if not folder or not questData then
        return nil
    end

    local parent = folder.Parent
    local typeName = parent and parent.Name or "Main"
    local list = questData[typeName]
    return list and list[folder.Name] or nil
end

local function getQuestProgress(folder)
    if not folder then
        return 0, false
    end

    local progress = folder:FindFirstChild("Progress")
    local completed = folder:FindFirstChild("Completed")
    local current = progress and tonumber(progress.Value) or 0
    local done = completed and completed:IsA("BoolValue") and completed.Value or false

    return current, done
end

local function multiObjectiveDone(definition, value)
    local objectives = definition.Objectives or {}
    if #objectives == 0 then
        return false
    end

    local complete = 0
    for index, objective in ipairs(objectives) do
        local amount = tonumber(objective.Amount) or 0
        local have = math.floor(value / (1000 ^ (index - 1))) % 1000
        if have >= amount then
            complete = complete + 1
        end
    end

    return complete >= #objectives
end

local function questIsComplete(folder, definition)
    if not folder or not definition then
        return false
    end

    local progress, completed = getQuestProgress(folder)
    if completed then
        return true
    end

    if not definition.Goal then
        return false
    end

    if definition.Goal.Type == "MultiObjective" then
        return multiObjectiveDone(definition, progress)
    end

    if definition.Goal.Type == "CursedChild" then
        local done = 0
        if bit32.band(progress, 1) ~= 0 then
            done = done + 1
        end
        if bit32.band(progress, 2) ~= 0 then
            done = done + 1
        end
        return done >= 2
    end

    local goal = effectiveGoal(definition)
    return goal > 0 and progress >= goal
end

local function findActiveQuest()
    local folders = {
        Main = mainQuests,
        Daily = dailyQuests,
        Weekly = weeklyQuests,
        Monthly = monthlyQuests,
    }

    -- Main quests are the intended progression path, so prefer them.
    for _, folder in ipairs({mainQuests, dailyQuests, weeklyQuests, monthlyQuests}) do
        if folder then
            local bestFolder = nil
            local bestProgress = -1

            for _, questFolder in ipairs(folder:GetChildren()) do
                if questFolder:IsA("Folder") then
                    local definition = getDefinition(questFolder)
                    if definition then
                        local progress, completed = getQuestProgress(questFolder)
                        if not completed and progress >= 0 then
                            local isBetter = false

                            if progress > bestProgress then
                                isBetter = true
                            elseif progress == bestProgress and bestFolder == nil then
                                isBetter = true
                            end

                            if isBetter then
                                bestFolder = questFolder
                                bestProgress = progress
                            end
                        end
                    end
                end
            end

            if bestFolder then
                return bestFolder, getDefinition(bestFolder)
            end
        end
    end

    return nil, nil
end

local function findPromptForNPC(npc, preferredText)
    if not npc then
        return nil
    end

    local preferred = normalize(preferredText)
    local fallback = nil

    for _, object in ipairs(npc:GetDescendants()) do
        if object:IsA("ProximityPrompt") and object.Enabled then
            local text = normalize(object.Name .. " " .. object.ActionText .. " " .. object.ObjectText)
            if preferred ~= "" and string.find(text, preferred, 1, true) then
                return object
            end
            fallback = fallback or object
        end
    end

    return fallback
end

local function findQuestNPC(name)
    if not name then
        return nil, nil
    end

    local wanted = normalize(name)
    local bestModel = nil
    local bestPrompt = nil
    local bestDistance = math.huge
    local _, _, playerRoot = getCharacter()

    if not playerRoot then
        return nil, nil
    end

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Model") and aliveNPC(object) then
            local modelName = normalize(object.Name)
            if modelName == wanted or string.find(modelName, wanted, 1, true) or string.find(wanted, modelName, 1, true) then
                local prompt = findPromptForNPC(object, "quest") or findPromptForNPC(object, "talk") or findPromptForNPC(object, "interact")
                if prompt then
                    local root = getRoot(object)
                    local distance = root and (root.Position - playerRoot.Position).Magnitude or math.huge
                    if distance < bestDistance then
                        bestDistance = distance
                        bestModel = object
                        bestPrompt = prompt
                    end
                end
            end
        end
    end

    return bestModel, bestPrompt
end

local function findAnyQuestPrompt()
    local _, _, playerRoot = getCharacter()
    if not playerRoot then
        return nil, nil
    end

    local bestModel = nil
    local bestPrompt = nil
    local bestDistance = math.huge

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ProximityPrompt") and object.Enabled then
            local parent = object.Parent
            local model = parent and parent:FindFirstAncestorOfClass("Model")
            local root = getRoot(model)

            if model and root then
                local text = normalize(object.Name .. " " .. object.ActionText .. " " .. object.ObjectText)
                local useful = string.find(text, "quest", 1, true)
                    or string.find(text, "talk", 1, true)
                    or string.find(text, "interact", 1, true)
                    or string.find(text, "mission", 1, true)

                if useful then
                    local distance = (root.Position - playerRoot.Position).Magnitude
                    if distance < bestDistance then
                        bestDistance = distance
                        bestModel = model
                        bestPrompt = object
                    end
                end
            end
        end
    end

    return bestModel, bestPrompt
end

local function smoothTeleport(position, duration)
    local _, _, root = getCharacter()
    if not root then
        return false
    end

    if teleportConnection then
        teleportConnection:Disconnect()
        teleportConnection = nil
    end

    local startPosition = root.Position
    local startTime = os.clock()
    local total = math.max(duration or Settings.TeleportTime, 0.05)

    teleportConnection = RunService.RenderStepped:Connect(function()
        local _, _, currentRoot = getCharacter()
        if not currentRoot then
            teleportConnection:Disconnect()
            teleportConnection = nil
            return
        end

        local alpha = math.clamp((os.clock() - startTime) / total, 0, 1)
        local eased = 1 - (1 - alpha) ^ 3
        currentRoot.CFrame = CFrame.new(startPosition:Lerp(position, eased))
        currentRoot.AssemblyLinearVelocity = Vector3.zero
        currentRoot.AssemblyAngularVelocity = Vector3.zero

        if alpha >= 1 then
            currentRoot.CFrame = CFrame.new(position)
            teleportConnection:Disconnect()
            teleportConnection = nil
        end
    end)

    return true
end

local function moveToNPC(npc)
    local root = getRoot(npc)
    if not root then
        return false
    end

    local targetPosition = root.Position - root.CFrame.LookVector * 3 + Vector3.new(0, 2, 0)
    smoothTeleport(targetPosition, Settings.TeleportTime)

    local deadline = os.clock() + 2.5
    while Settings.Running and os.clock() < deadline do
        local _, _, playerRoot = getCharacter()
        if playerRoot and (playerRoot.Position - root.Position).Magnitude <= 7 then
            return true
        end
        task.wait(0.05)
    end

    return true
end

local function pressE()
    pcall(function()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(0.04)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    end)
end

local function interactQuestNPC(npc, prompt)
    if not npc then
        return false
    end

    Settings.Step = "Going to quest NPC"
    Settings.QuestNPC = npc

    moveToNPC(npc)
    task.wait(0.15)

    for _ = 1, 4 do
        if not Settings.Running then
            return false
        end

        if prompt and prompt.Parent and prompt.Enabled and fireproximityprompt then
            pcall(function()
                fireproximityprompt(prompt)
            end)
        end

        pressE()
        task.wait(0.5)

        local folder = select(1, findActiveQuest())
        if folder then
            Settings.QuestFolder = folder
            Settings.QuestDefinition = getDefinition(folder)
            return true
        end
    end

    return false
end

local function acceptFromQuestUI()
    local questsGui = playerGui:FindFirstChild("Quests")
    if not questsGui then
        return false
    end

    local detail = questsGui:FindFirstChild("DetailPanel", true)
    local accept = detail and detail:FindFirstChild("AcceptButton", true)

    if not accept or not accept:IsA("GuiButton") or not accept.Visible then
        return false
    end

    if accept.Interactable == false then
        return false
    end

    local text = string.lower(tostring(accept.Text))
    if text == "claim" or string.find(text, "cancel", 1, true) then
        return false
    end

    pcall(function()
        accept:Activate()
    end)

    return true
end

local function claimQuest(folder)
    if not folder then
        return false
    end

    Settings.Step = "Claiming quest"
    local questName = folder.Name

    if inputFunction then
        local ok, result = pcall(function()
            return inputFunction:InvokeServer("Quest", "Claim", questName)
        end)
        if ok and result == true then
            return true
        end
    end

    local questsGui = playerGui:FindFirstChild("Quests")
    local detail = questsGui and questsGui:FindFirstChild("DetailPanel", true)
    local accept = detail and detail:FindFirstChild("AcceptButton", true)

    if accept and accept:IsA("GuiButton") and accept.Visible then
        local text = string.lower(tostring(accept.Text))
        if text == "claim" then
            pcall(function()
                accept:Activate()
            end)
            return true
        end
    end

    return false
end

local function pinQuest(folder)
    if not Settings.AutoPin or not inputFunction or not folder then
        return
    end

    local pinned = folder:FindFirstChild("Pinned")
    if pinned and pinned:IsA("BoolValue") and pinned.Value then
        return
    end

    pcall(function()
        inputFunction:InvokeServer("Quest", "TogglePin", folder.Name)
    end)
end

local function repeatQuest()
    if not Settings.AutoRepeat or not remote then
        return
    end

    pcall(function()
        remote:FireServer("RepeatQuestChoice", "repeat")
    end)
end

local function equipWeapon()
    local character, humanoid = getCharacter()
    if not character or not humanoid then
        return false
    end

    if character:FindFirstChildOfClass("Tool") then
        return true
    end

    local backpack = player:FindFirstChildOfClass("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local name = normalize(tool.Name)
                if not string.find(name, "rod", 1, true) and not string.find(name, "fishing", 1, true) then
                    pcall(function()
                        humanoid:EquipTool(tool)
                    end)
                    return true
                end
            end
        end
    end

    if remote then
        pcall(function()
            remote:FireServer("RequestEquip")
        end)
    end

    return false
end

local function getAim(targetRoot, playerRoot)
    local camera = workspace.CurrentCamera
    local eye = camera and camera.CFrame.Position or playerRoot.Position
    local aimPosition = targetRoot.Position + Vector3.new(randomFloat(-0.3, 0.3), randomFloat(-0.15, 0.45), randomFloat(-0.3, 0.3))
    local direction = aimPosition - eye

    if direction.Magnitude < 0.001 then
        direction = Vector3.new(0, 0, -1)
    else
        direction = direction.Unit
    end

    return {
        origin = playerRoot.CFrame,
        direction = direction,
        raw = CFrame.lookAt(playerRoot.Position, playerRoot.Position + direction * 50),
    }
end

local function doM1(targetRoot, playerRoot)
    local now = os.clock()
    if now - Settings.LastM1 < randomFloat(Settings.M1Min, Settings.M1Max) then
        return
    end

    Settings.LastM1 = now
    local castRay = getAim(targetRoot, playerRoot)

    if remote then
        pcall(function()
            remote:FireServer("Attack", {castRay = castRay}, "Attack")
        end)
    end

    local character = player.Character
    local tool = character and character:FindFirstChildOfClass("Tool")
    if tool then
        pcall(function()
            tool:Activate()
        end)
    end
end

local function doSkills(targetRoot, playerRoot)
    if not Settings.UseSkills or not remote then
        return
    end

    local now = os.clock()
    local castRay = getAim(targetRoot, playerRoot)

    for _, skill in ipairs(Skills) do
        if skill.Enabled and now - skill.Last >= skill.Cooldown then
            skill.Last = now
            pcall(function()
                remote:FireServer("Attack", {
                    isSkill = true,
                    what = skill.What,
                    castRay = castRay,
                })
            end)
            return
        end
    end
end

local function stopHover()
    if hoverConnection then
        hoverConnection:Disconnect()
        hoverConnection = nil
    end

    Settings.Target = nil
    Settings.TargetRoot = nil

    local _, humanoid, root = getCharacter()
    if humanoid then
        humanoid.AutoRotate = true
    end
    if root then
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end
end

local function startHover()
    if hoverConnection then
        return
    end

    local elapsed = 0
    local driftTimer = 0
    local drift = Vector3.zero

    hoverConnection = RunService.RenderStepped:Connect(function(dt)
        if not Settings.Running then
            return
        end

        local _, humanoid, root = getCharacter()
        local target = Settings.Target
        local targetRoot = Settings.TargetRoot

        if not humanoid or not root or not target or not targetRoot or not targetRoot.Parent or not aliveNPC(target) then
            return
        end

        elapsed = elapsed + dt
        driftTimer = driftTimer + dt

        if driftTimer >= 2.5 then
            driftTimer = 0
            drift = Vector3.new(randomFloat(-Settings.Drift, Settings.Drift), 0, randomFloat(-Settings.Drift, Settings.Drift))
        end

        local vertical = Settings.Position == "Above" and Settings.Height or -Settings.Height
        local bob = math.sin(elapsed * 1.8) * Settings.Bob
        local desired = targetRoot.Position + Vector3.new(drift.X, vertical + bob, drift.Z)

        root.CFrame = CFrame.lookAt(desired, targetRoot.Position)
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        humanoid.AutoRotate = false
    end)
end

local function findTarget(definition)
    if not definition or not definition.Goal then
        return nil
    end

    local _, _, playerRoot = getCharacter()
    if not playerRoot then
        return nil
    end

    local goal = definition.Goal
    local wantedNames = {}
    local category = nil

    if goal.Target then
        wantedNames[#wantedNames + 1] = tostring(goal.Target)
        category = normalize(goal.Target)
    end

    if definition.Objectives then
        for _, objective in ipairs(definition.Objectives) do
            if objective.Type == "Kill" or objective.Type == "Kill with Combat" then
                if objective.Target then
                    wantedNames[#wantedNames + 1] = tostring(objective.Target)
                end
            end
        end
    end

    local best = nil
    local bestDistance = math.huge

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Model") and aliveNPC(object) then
            local matches = false

            for _, wanted in ipairs(wantedNames) do
                if modelNameMatches(object, wanted) then
                    matches = true
                    break
                end
            end

            if not matches and category then
                local modelName = normalize(object.Name)
                if category == "enemies" then
                    matches = true
                elseif category == "bosses" then
                    matches = string.find(modelName, "boss", 1, true) ~= nil
                elseif category == "specialbosses" then
                    matches = string.find(modelName, "boss", 1, true) ~= nil
                elseif category == "worldbosses" then
                    matches = string.find(modelName, "boss", 1, true) ~= nil
                end
            end

            if matches then
                local root = getRoot(object)
                if root then
                    local distance = (root.Position - playerRoot.Position).Magnitude
                    if distance < bestDistance and distance <= Settings.SearchRadius then
                        best = object
                        bestDistance = distance
                    end
                end
            end
        end
    end

    return best
end

function modelNameMatches(model, wanted)
    local a = normalize(model.Name):gsub("%d+$", "")
    local b = normalize(wanted)
    return a == b or string.find(a, b, 1, true) ~= nil or string.find(b, a, 1, true) ~= nil
end

local function refreshQuest()
    if Settings.QuestFolder and Settings.QuestFolder.Parent then
        local definition = getDefinition(Settings.QuestFolder)
        if definition then
            Settings.QuestDefinition = definition
            local progress = getQuestProgress(Settings.QuestFolder)
            Settings.QuestProgress = progress
            Settings.QuestGoal = effectiveGoal(definition)
            Settings.QuestTarget = definition.Goal and definition.Goal.Target or nil
            Settings.QuestNPCName = definition.NPC
            return true
        end
    end

    local folder, definition = findActiveQuest()
    if folder and definition then
        Settings.QuestFolder = folder
        Settings.QuestDefinition = definition
        local progress = getQuestProgress(folder)
        Settings.QuestProgress = progress
        Settings.QuestGoal = effectiveGoal(definition)
        Settings.QuestTarget = definition.Goal and definition.Goal.Target or nil
        Settings.QuestNPCName = definition.NPC
        pinQuest(folder)
        return true
    end

    return false
end

local function runQuest()
    if busy then
        return
    end
    busy = true

    while Settings.Running do
        if not refreshQuest() then
            Settings.Step = "Taking quest"

            local npc, prompt = nil, nil
            if Settings.QuestNPCName then
                npc, prompt = findQuestNPC(Settings.QuestNPCName)
            end
            if not npc then
                npc, prompt = findAnyQuestPrompt()
            end

            if npc then
                interactQuestNPC(npc, prompt)
                task.wait(0.35)
                acceptFromQuestUI()
            else
                Settings.Step = "Quest NPC not found"
            end

            task.wait(0.7)
            refreshQuest()
            if not Settings.QuestFolder then
                task.wait(0.5)
            end
        else
            local valid, completed = true, false
            if not Settings.QuestFolder or not Settings.QuestFolder.Parent then
                valid = false
            else
                completed = questIsComplete(Settings.QuestFolder, Settings.QuestDefinition)
            end

            if not valid then
                Settings.QuestFolder = nil
                Settings.QuestDefinition = nil
                Settings.Target = nil
                Settings.TargetRoot = nil
            elseif completed then
                stopHover()

                if Settings.AutoClaim then
                    claimQuest(Settings.QuestFolder)
                end

                task.wait(0.7)
                repeatQuest()

                Settings.QuestFolder = nil
                Settings.QuestDefinition = nil
                Settings.Target = nil
                Settings.TargetRoot = nil

                task.wait(0.7)
            else
                local definition = Settings.QuestDefinition
                local goalType = definition and definition.Goal and definition.Goal.Type or "Unknown"

                if goalType == "Kill" or goalType == "Kill with Combat" or goalType == "DealDamage" or goalType == "UseSkill" or goalType == "TakeDamage" then
                    if not Settings.Target or not aliveNPC(Settings.Target) then
                        Settings.Step = "Finding target"
                        Settings.Target = findTarget(definition)
                        Settings.TargetRoot = Settings.Target and getRoot(Settings.Target) or nil

                        if Settings.Target and Settings.TargetRoot then
                            startHover()
                            local _, _, playerRoot = getCharacter()
                            if playerRoot then
                                local vertical = Settings.Position == "Above" and Settings.Height or -Settings.Height
                                smoothTeleport(Settings.TargetRoot.Position + Vector3.new(0, vertical, 0), Settings.TeleportTime)
                            end
                        else
                            task.wait(Settings.SearchInterval)
                            continue
                        end
                    end

                    if Settings.TargetRoot and Settings.TargetRoot.Parent and aliveNPC(Settings.Target) then
                        Settings.Step = "Farming " .. tostring(Settings.Target.Name)
                        local character, humanoid, playerRoot = getCharacter()
                        if character and humanoid and playerRoot and equipWeapon() then
                            doSkills(Settings.TargetRoot, playerRoot)
                            doM1(Settings.TargetRoot, playerRoot)
                        end
                    else
                        Settings.Target = nil
                        Settings.TargetRoot = nil
                    end
                else
                    stopHover()
                    Settings.Step = "Objective: " .. tostring(goalType)
                    task.wait(0.5)
                end
            end
        end

        task.wait(Settings.SearchInterval)
    end

    stopHover()
    busy = false
end

local function makeCorner(instance, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = instance
end

local function makeButton(parent, name, text)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1, 0, 0, 36)
    button.BackgroundColor3 = Color3.fromRGB(36, 36, 44)
    button.BorderSizePixel = 0
    button.AutoButtonColor = true
    button.Font = Enum.Font.GothamSemibold
    button.Text = text
    button.TextColor3 = Color3.fromRGB(235, 235, 240)
    button.TextSize = 13
    button.Parent = parent
    makeCorner(button, 7)
    return button
end

local function buildGui()
    local old = playerGui:FindFirstChild("QuestAutoFarm")
    if old then
        old:Destroy()
    end

    local gui = Instance.new("ScreenGui")
    gui.Name = "QuestAutoFarm"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = playerGui
    ui.Gui = gui

    local main = Instance.new("Frame")
    main.Size = UDim2.fromOffset(350, 390)
    main.Position = UDim2.new(0, 25, 0.5, -195)
    main.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
    main.BorderSizePixel = 0
    main.Parent = gui
    makeCorner(main, 10)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(70, 70, 82)
    stroke.Thickness = 1
    stroke.Parent = main

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 44)
    titleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = main
    makeCorner(titleBar, 10)

    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromOffset(14, 0)
    title.Size = UDim2.new(1, -55, 1, 0)
    title.Font = Enum.Font.GothamBold
    title.Text = "Quest Auto Farm"
    title.TextColor3 = Color3.fromRGB(245, 245, 250)
    title.TextSize = 17
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar

    local minimize = Instance.new("TextButton")
    minimize.Size = UDim2.fromOffset(34, 30)
    minimize.Position = UDim2.new(1, -40, 0, 7)
    minimize.BackgroundTransparency = 1
    minimize.Font = Enum.Font.GothamBold
    minimize.Text = "—"
    minimize.TextColor3 = Color3.fromRGB(230, 230, 235)
    minimize.TextSize = 20
    minimize.Parent = titleBar

    local content = Instance.new("Frame")
    content.BackgroundTransparency = 1
    content.Position = UDim2.fromOffset(12, 52)
    content.Size = UDim2.new(1, -24, 1, -60)
    content.Parent = main

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 80)
    status.BackgroundTransparency = 1
    status.Font = Enum.Font.Gotham
    status.TextSize = 11
    status.TextColor3 = Color3.fromRGB(190, 190, 200)
    status.TextWrapped = true
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.TextYAlignment = Enum.TextYAlignment.Top
    status.Parent = content
    ui.Status = status

    local farmButton = makeButton(content, "Farm", "FARM: OFF   [E]")
    farmButton.Position = UDim2.fromOffset(0, 84)

    local positionButton = makeButton(content, "Position", "POSITION: ABOVE")
    positionButton.Position = UDim2.fromOffset(0, 126)

    local skillsButton = makeButton(content, "Skills", "SKILLS: ALL ON")
    skillsButton.Position = UDim2.fromOffset(0, 168)

    local claimButton = makeButton(content, "Claim", "AUTO CLAIM: ON")
    claimButton.Position = UDim2.fromOffset(0, 210)

    local pinButton = makeButton(content, "Pin", "AUTO PIN: ON")
    pinButton.Position = UDim2.fromOffset(0, 252)

    local heightBox = Instance.new("TextBox")
    heightBox.Size = UDim2.new(1, 0, 0, 34)
    heightBox.Position = UDim2.fromOffset(0, 294)
    heightBox.BackgroundColor3 = Color3.fromRGB(36, 36, 44)
    heightBox.BorderSizePixel = 0
    heightBox.ClearTextOnFocus = false
    heightBox.Font = Enum.Font.Gotham
    heightBox.TextSize = 13
    heightBox.TextColor3 = Color3.fromRGB(240, 240, 245)
    heightBox.Text = "Height: " .. tostring(Settings.Height)
    heightBox.Parent = content
    makeCorner(heightBox, 7)

    local npcButton = makeButton(content, "NPC", "NPC LIST / TELEPORT")
    npcButton.Position = UDim2.fromOffset(0, 336)

    local npcList = Instance.new("ScrollingFrame")
    npcList.Size = UDim2.fromOffset(326, 130)
    npcList.Position = UDim2.fromOffset(12, 340)
    npcList.BackgroundColor3 = Color3.fromRGB(29, 29, 37)
    npcList.BorderSizePixel = 0
    npcList.ScrollBarThickness = 4
    npcList.Visible = false
    npcList.CanvasSize = UDim2.new(0, 0, 0, 0)
    npcList.Parent = main
    makeCorner(npcList, 7)

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 2)
    layout.Parent = npcList

    local function refreshNPCList()
        for _, button in ipairs(npcButtons) do
            button:Destroy()
        end
        npcButtons = {}

        local count = 0
        for _, object in ipairs(workspace:GetDescendants()) do
            if object:IsA("Model") and aliveNPC(object) then
                count = count + 1
                if count <= 150 then
                    local button = Instance.new("TextButton")
                    button.Size = UDim2.new(1, -10, 0, 28)
                    button.BackgroundColor3 = Color3.fromRGB(45, 45, 56)
                    button.BorderSizePixel = 0
                    button.Font = Enum.Font.Gotham
                    button.TextSize = 12
                    button.TextColor3 = Color3.new(1, 1, 1)
                    button.Text = object.Name
                    button.Parent = npcList
                    makeCorner(button, 5)

                    button.Activated:Connect(function()
                        selectedNPC = object
                        npcList.Visible = false
                        local root = getRoot(object)
                        if root then
                            smoothTeleport(root.Position + Vector3.new(0, 3, 0), Settings.TeleportTime)
                        end
                    end)

                    table.insert(npcButtons, button)
                end
            end
        end

        npcList.CanvasSize = UDim2.new(0, 0, 0, #npcButtons * 30 + 6)
    end

    npcButton.Activated:Connect(function()
        refreshNPCList()
        npcList.Visible = not npcList.Visible
    end)

    farmButton.Activated:Connect(function()
        Settings.Running = not Settings.Running
        if Settings.Running then
            Settings.StartedAt = os.clock()
            farmButton.Text = "FARM: ON   [E]"
            farmButton.BackgroundColor3 = Color3.fromRGB(35, 100, 62)
        else
            farmButton.Text = "FARM: OFF   [E]"
            farmButton.BackgroundColor3 = Color3.fromRGB(36, 36, 44)
            stopHover()
        end
    end)

    positionButton.Activated:Connect(function()
        Settings.Position = Settings.Position == "Above" and "Down" or "Above"
        positionButton.Text = "POSITION: " .. string.upper(Settings.Position)
    end)

    skillsButton.Activated:Connect(function()
        local any = false
        for _, skill in ipairs(Skills) do
            if skill.Enabled then
                any = true
                break
            end
        end

        local newState = not any
        for _, skill in ipairs(Skills) do
            skill.Enabled = newState
        end
        skillsButton.Text = newState and "SKILLS: ALL ON" or "SKILLS: ALL OFF"
    end)

    claimButton.Activated:Connect(function()
        Settings.AutoClaim = not Settings.AutoClaim
        claimButton.Text = "AUTO CLAIM: " .. (Settings.AutoClaim and "ON" or "OFF")
    end)

    pinButton.Activated:Connect(function()
        Settings.AutoPin = not Settings.AutoPin
        pinButton.Text = "AUTO PIN: " .. (Settings.AutoPin and "ON" or "OFF")
    end)

    heightBox.FocusLost:Connect(function()
        local value = tonumber(tostring(heightBox.Text):match("[-%d%.]+"))
        if value then
            Settings.Height = math.clamp(value, Settings.HeightMin, Settings.HeightMax)
        end
        heightBox.Text = "Height: " .. tostring(Settings.Height)
    end)

    local dragging = false
    local dragStart
    local startPosition

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging then
            return
        end
        if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end)

    minimize.Activated:Connect(function()
        minimized = not minimized
        content.Visible = not minimized
        npcList.Visible = false
        main.Size = minimized and UDim2.fromOffset(350, 44) or UDim2.fromOffset(350, 390)
        minimize.Text = minimized and "+" or "—"
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then
            return
        end

        if input.KeyCode == Enum.KeyCode.E then
            Settings.Running = not Settings.Running
            if Settings.Running then
                Settings.StartedAt = os.clock()
                farmButton.Text = "FARM: ON   [E]"
                farmButton.BackgroundColor3 = Color3.fromRGB(35, 100, 62)
            else
                farmButton.Text = "FARM: OFF   [E]"
                farmButton.BackgroundColor3 = Color3.fromRGB(36, 36, 44)
                stopHover()
            end
        elseif input.KeyCode == Enum.KeyCode.RightShift then
            gui.Enabled = not gui.Enabled
        end
    end)

    task.spawn(function()
        while gui.Parent do
            task.wait(0.2)
            local elapsed = Settings.Running and os.clock() - Settings.StartedAt or 0
            local minutes = math.floor(elapsed / 60)
            local seconds = math.floor(elapsed % 60)

            status.Text = string.format(
                "Status: %s  |  %s\nQuest: %s\nTarget: %s\nProgress: %d / %d\nTime: %02d:%02d",
                Settings.Running and "RUNNING" or "STOPPED",
                Settings.Step,
                Settings.QuestFolder and Settings.QuestFolder.Name or "none",
                Settings.Target and Settings.Target.Name or tostring(Settings.QuestTarget or "none"),
                Settings.QuestProgress,
                Settings.QuestGoal,
                minutes,
                seconds
            )
        end
    end)
end

player.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

player.CharacterAdded:Connect(function()
    stopHover()
    task.wait(0.5)
end)

buildGui()

while task.wait(0.05) do
    if Settings.Running then
        local ok, err = pcall(runQuest)
        if not ok then
            warn("[AutoFarm] " .. tostring(err))
            Settings.Step = "Error: " .. tostring(err)
            stopHover()
            busy = false
            task.wait(1)
        end
    end
end