-- MyAutoFarmGame | Advanced Quest Auto Farm
-- Inspired by the requested farming layout/flow:
-- quest state -> quest NPC -> target lock -> hover around target -> M1/skills -> progress -> claim/repeat
-- Uses the repository's Contract remotes and the documented Z/X/C/V/F skill bindings.

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
local remotes = ReplicatedStorage:WaitForChild("Remotes", 15)
if not remotes then
    warn("[AutoFarm] Remotes folder not found")
    return
end

local RFGetState = remotes:FindFirstChild("RF_ContractGetState")
local RFAccept = remotes:FindFirstChild("RF_ContractAccept")
local RFClaim = remotes:FindFirstChild("RF_ContractClaim")
local REContractChanged = remotes:FindFirstChild("RE_ContractStateChanged")

local Settings = {
    Running = false,
    AutoQuest = true,
    AutoClaim = true,
    AutoRepeat = true,
    UseSkills = true,
    SkillMode = "ALL",
    Position = "Above",
    Height = 6,
    HeightMin = 3,
    HeightMax = 35,
    Drift = 0.35,
    HoverBob = 0.55,
    EngageDistance = 35,
    TargetRadius = 5000,
    SearchInterval = 0.12,
    StateInterval = 0.35,
    M1IntervalMin = 0.25,
    M1IntervalMax = 0.42,
    SkillDelay = 1.35,
    QuestRetryDelay = 1.0,
    MaxQuestStall = 12,
    SmoothTeleportTime = 1.8,

    Skills = {
        {Name = "Z", Key = Enum.KeyCode.Z, Enabled = true, Last = 0, Cooldown = 2.5},
        {Name = "X", Key = Enum.KeyCode.X, Enabled = true, Last = 0, Cooldown = 3.0},
        {Name = "C", Key = Enum.KeyCode.C, Enabled = true, Last = 0, Cooldown = 3.5},
        {Name = "V", Key = Enum.KeyCode.V, Enabled = true, Last = 0, Cooldown = 4.0},
        {Name = "F", Key = Enum.KeyCode.F, Enabled = false, Last = 0, Cooldown = 4.5},
    },

    Target = nil,
    TargetRoot = nil,
    QuestNPC = nil,
    QuestId = nil,
    TargetId = nil,
    TargetName = nil,
    Progress = 0,
    Required = 0,
    Step = "Idle",
    LastM1 = 0,
    QuestLastProgress = -1,
    QuestStallStarted = 0,
    LastState = 0,
}

local State = {
    Gui = nil,
    Main = nil,
    Content = nil,
    Status = nil,
    QuestText = nil,
    TargetText = nil,
    ProgressText = nil,
    TargetDropdown = nil,
    TargetList = nil,
    SkillButton = nil,
    SkillButtons = {},
    ToggleButton = nil,
    RepeatButton = nil,
    HeightBox = nil,
    Timer = nil,
}

local selectedNPC = nil
local npcList = {}
local npcButtons = {}
local farmingStarted = 0
local hoverConnection = nil
local teleportConnection = nil
local isTeleporting = false
local minimized = false

local function randomFloat(a, b)
    return a + math.random() * (b - a)
end

local function getCharacter()
    local character = player.Character
    if not character then
        return nil, nil, nil
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")

    if not humanoid or not root or humanoid.Health <= 0 then
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

local function getHumanoid(model)
    if not model then
        return nil
    end
    return model:FindFirstChildOfClass("Humanoid")
end

local function isAliveNPC(model)
    if not model or not model:IsA("Model") then
        return false
    end

    local humanoid = getHumanoid(model)
    return humanoid ~= nil and humanoid.Health > 0 and getRoot(model) ~= nil and Players:GetPlayerFromCharacter(model) == nil
end

local function normalize(value)
    return tostring(value or ""):lower():gsub("[^%w]", "")
end

local function safeInvoke(remote, ...)
    if not remote or not remote:IsA("RemoteFunction") then
        return false, nil
    end

    local args = {...}
    local count = select("#", ...)
    local ok, result = pcall(function()
        return remote:InvokeServer(table.unpack(args, 1, count))
    end)

    return ok, result
end

local function readRecursive(value, found, seen, context)
    if type(value) ~= "table" then
        return
    end

    if seen[value] then
        return
    end

    seen[value] = true

    for key, child in pairs(value) do
        local k = string.lower(tostring(key))

        if type(child) == "table" then
            local nextContext = context
            if k == "progress" then
                nextContext = "progress"
            elseif k == "definitionsnapshot" or k == "definition" then
                nextContext = "definition"
            end
            readRecursive(child, found, seen, nextContext)
        elseif type(child) == "string" then
            if k == "activeid" or k == "active_id" then
                found.ActiveId = child
            elseif k == "targetid" or k == "target_id" then
                found.TargetId = child
            elseif k == "targetnpc" or k == "target_npc" or k == "targetname" or k == "target_name" then
                found.TargetName = child
            elseif k == "fieldnpc" or k == "field_npc" then
                found.FieldNPC = child
            elseif k == "npcname" or k == "npc_name" then
                found.NPCName = child
            elseif k == "id" and context == "definition" and not found.DefinitionId then
                found.DefinitionId = child
            end
        elseif type(child) == "number" then
            if k == "kills" or k == "killsdone" or k == "killdone" or k == "progress" or k == "current" or k == "clearsdone" then
                if found.Progress == nil or context == "progress" then
                    found.Progress = child
                end
            elseif k == "killgoal" or k == "killgoalmin" or k == "required" or k == "requiredkills" or k == "killcount" or k == "clears" or k == "clearsmin" then
                if child > 0 and not found.Required then
                    found.Required = child
                end
            end
        elseif type(child) == "boolean" then
            if k == "completed" or k == "complete" or k == "finished" or k == "claimable" or k == "readytoclaim" or k == "delivered" then
                if child then
                    found.Completed = true
                end
            end
        end
    end
end

local function readContract(force)
    if not RFGetState then
        Settings.Step = "Contract remote missing"
        return nil
    end

    if not force and os.clock() - Settings.LastState < Settings.StateInterval then
        return Settings.Contract
    end

    Settings.LastState = os.clock()

    local ok, result = safeInvoke(RFGetState)
    if not ok then
        Settings.Step = "Reading quest failed"
        return Settings.Contract
    end

    Settings.Contract = result

    local found = {
        Progress = nil,
        Required = nil,
        Completed = false,
    }

    readRecursive(result, found, {})

    if found.ActiveId ~= nil then
        Settings.QuestId = found.ActiveId
    end

    if found.TargetId ~= nil then
        Settings.TargetId = found.TargetId
    end

    if found.TargetName ~= nil and found.TargetName ~= "" then
        Settings.TargetName = found.TargetName
    end

    if found.Required ~= nil then
        Settings.Required = found.Required
    end

    if found.Progress ~= nil then
        Settings.Progress = found.Progress
    end

    if found.Completed and Settings.Required > 0 then
        Settings.Progress = Settings.Required
    end

    if found.FieldNPC then
        Settings.QuestNPCName = found.FieldNPC
    elseif found.NPCName then
        Settings.QuestNPCName = found.NPCName
    end

    return result
end

local function getContractTextTarget()
    local gui = playerGui
    local best = nil

    for _, obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            local text = obj.Text
            if type(text) == "string" and text ~= "" then
                local lower = string.lower(text)
                if string.find(lower, "defeat", 1, true) or string.find(lower, "kill", 1, true) then
                    local target = text:match("[Dd]efeat%s+%d+%s+([%w%s%-]+)")
                    target = target or text:match("[Kk]ill%s+%d+%s+([%w%s%-]+)")
                    if target then
                        best = target
                        break
                    end
                end
            end
        end
    end

    return best
end

local function modelHasId(model, id)
    if id == nil then
        return false
    end

    for _, key in ipairs({"TargetId", "TargetID", "NPCId", "NPCID", "Id", "ID", "GUID"}) do
        local value = model:GetAttribute(key)
        if value ~= nil and tostring(value) == tostring(id) then
            return true
        end
    end

    return false
end

local function findTarget()
    local _, _, playerRoot = getCharacter()
    if not playerRoot then
        return nil
    end

    local wanted = Settings.TargetName
    if not wanted then
        wanted = getContractTextTarget()
        if wanted then
            Settings.TargetName = wanted
        end
    end

    local wantedNormalized = normalize(wanted)
    local best = nil
    local bestDistance = math.huge

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and isAliveNPC(obj) then
            local matches = false

            if Settings.TargetId and modelHasId(obj, Settings.TargetId) then
                matches = true
            end

            if not matches and wantedNormalized ~= "" then
                local name = normalize(obj.Name):gsub("%d+$", "")
                matches = name == wantedNormalized or string.find(name, wantedNormalized, 1, true) ~= nil or string.find(wantedNormalized, name, 1, true) ~= nil
            end

            if matches then
                local root = getRoot(obj)
                if root then
                    local distance = (root.Position - playerRoot.Position).Magnitude
                    if distance < bestDistance and distance <= Settings.TargetRadius then
                        best = obj
                        bestDistance = distance
                    end
                end
            end
        end
    end

    return best
end

local function findQuestNPC()
    local _, _, playerRoot = getCharacter()
    if not playerRoot then
        return nil, nil
    end

    local preferredName = normalize(Settings.QuestNPCName)
    local bestModel = nil
    local bestPrompt = nil
    local bestDistance = math.huge

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ProximityPrompt") and object.Enabled then
            local text = normalize(object.Name .. " " .. object.ActionText .. " " .. object.ObjectText)
            local useful = string.find(text, "quest", 1, true) ~= nil
                or string.find(text, "contract", 1, true) ~= nil
                or string.find(text, "mission", 1, true) ~= nil
                or string.find(text, "accept", 1, true) ~= nil
                or string.find(text, "claim", 1, true) ~= nil
                or string.find(text, "complete", 1, true) ~= nil

            local model = object.Parent and object.Parent:FindFirstAncestorOfClass("Model")
            local root = getRoot(model)

            if model and root and (useful or (preferredName ~= "" and string.find(normalize(model.Name), preferredName, 1, true))) then
                local distance = (root.Position - playerRoot.Position).Magnitude
                if distance < bestDistance then
                    bestDistance = distance
                    bestModel = model
                    bestPrompt = object
                end
            end
        end
    end

    return bestModel, bestPrompt
end

local function smoothTeleport(position, duration)
    if isTeleporting then
        return false
    end

    local character, _, root = getCharacter()
    if not character or not root then
        return false
    end

    if teleportConnection then
        teleportConnection:Disconnect()
        teleportConnection = nil
    end

    isTeleporting = true
    local startPosition = root.Position
    local started = os.clock()
    local total = math.max(duration or Settings.SmoothTeleportTime, 0.05)

    teleportConnection = RunService.RenderStepped:Connect(function()
        local char = player.Character
        local rt = char and char:FindFirstChild("HumanoidRootPart")

        if not rt then
            if teleportConnection then teleportConnection:Disconnect() end
            teleportConnection = nil
            isTeleporting = false
            return
        end

        local alpha = math.clamp((os.clock() - started) / total, 0, 1)
        local eased = 1 - (1 - alpha) ^ 3
        rt.CFrame = CFrame.new(startPosition:Lerp(position, eased))
        rt.AssemblyLinearVelocity = Vector3.zero
        rt.AssemblyAngularVelocity = Vector3.zero

        if alpha >= 1 then
            rt.CFrame = CFrame.new(position)
            rt.AssemblyLinearVelocity = Vector3.zero
            rt.AssemblyAngularVelocity = Vector3.zero

            if teleportConnection then
                teleportConnection:Disconnect()
            end
            teleportConnection = nil
            isTeleporting = false
        end
    end)

    return true
end

local function moveToModel(model, distance, smooth)
    local root = getRoot(model)
    if not root then
        return false
    end

    local position = root.Position - root.CFrame.LookVector * (distance or 4) + Vector3.new(0, 2, 0)
    if smooth then
        return smoothTeleport(position, Settings.SmoothTeleportTime)
    end

    local _, _, playerRoot = getCharacter()
    if playerRoot then
        playerRoot.CFrame = CFrame.new(position, root.Position)
        playerRoot.AssemblyLinearVelocity = Vector3.zero
        playerRoot.AssemblyAngularVelocity = Vector3.zero
    end

    return true
end

local function stopHover()
    Settings.Target = nil
    Settings.TargetRoot = nil

    if hoverConnection then
        hoverConnection:Disconnect()
        hoverConnection = nil
    end

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

    local floatTime = 0
    local driftTime = 0
    local drift = Vector3.zero

    hoverConnection = RunService.RenderStepped:Connect(function(dt)
        if not Settings.Running then
            return
        end

        local _, humanoid, root = getCharacter()
        local target = Settings.Target
        local targetRoot = Settings.TargetRoot

        if not humanoid or not root or not target or not targetRoot or not targetRoot.Parent or not isAliveNPC(target) then
            return
        end

        floatTime = floatTime + dt
        driftTime = driftTime + dt

        if driftTime >= 2.5 then
            driftTime = 0
            drift = Vector3.new(randomFloat(-Settings.Drift, Settings.Drift), 0, randomFloat(-Settings.Drift, Settings.Drift))
        end

        local y = Settings.Position == "Above" and Settings.Height or -Settings.Height
        local bob = math.sin(floatTime * 2.1) * Settings.HoverBob
        local desired = targetRoot.Position + Vector3.new(drift.X, y + bob, drift.Z)
        local look = targetRoot.Position - desired

        root.Anchored = false
        root.CFrame = CFrame.lookAt(desired, desired + (look.Magnitude > 0.01 and look.Unit or Vector3.new(0, 0, -1)))
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        humanoid.AutoRotate = false
    end)
end

local function sendKey(key, down)
    pcall(function()
        VirtualInputManager:SendKeyEvent(down, key, false, game)
    end)
end

local function pressKey(key)
    sendKey(key, true)
    task.wait(0.025)
    sendKey(key, false)
end

local function doM1()
    local now = os.clock()
    local interval = randomFloat(Settings.M1IntervalMin, Settings.M1IntervalMax)

    if now - Settings.LastM1 < interval then
        return false
    end

    Settings.LastM1 = now

    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)

    local character = player.Character
    local tool = character and character:FindFirstChildOfClass("Tool")
    if tool then
        pcall(function()
            tool:Activate()
        end)
    end

    return true
end

local function doSkills()
    if not Settings.UseSkills then
        return
    end

    local now = os.clock()

    for _, skill in ipairs(Settings.Skills) do
        if skill.Enabled and now - skill.Last >= skill.Cooldown then
            skill.Last = now
            pressKey(skill.Key)
            task.wait(0.04)
        end
    end
end

local function interactPrompt(prompt)
    if not prompt or not prompt.Enabled then
        return false
    end

    return pcall(function()
        if fireproximityprompt then
            fireproximityprompt(prompt)
        else
            prompt:InputHoldBegin()
            task.wait(math.max(prompt.HoldDuration, 0.05))
            prompt:InputHoldEnd()
        end
    end)
end

local function interactQuestNPC()
    local npc, prompt = findQuestNPC()
    if not npc then
        return false
    end

    Settings.QuestNPC = npc
    Settings.Step = "Going to quest NPC"

    moveToModel(npc, 4, true)

    while isTeleporting and Settings.Running do
        task.wait(0.05)
    end

    if prompt then
        interactPrompt(prompt)
        task.wait(0.45)
    end

    return true
end

local function acceptQuest()
    Settings.Step = "Accepting quest"

    -- Contract UI is the normal client path; click its visible Accept button first.
    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("TextButton") and object.Visible then
            local name = string.lower(object.Name)
            local text = string.lower(object.Text)
            if string.find(name, "acceptbutton", 1, true) or text == "accept" then
                pcall(function() object:Activate() end)
                task.wait(0.5)
                readContract(true)
                return true
            end
        end
    end

    if RFAccept then
        local id = Settings.QuestId
        if id ~= nil then
            local ok = safeInvoke(RFAccept, id)
            if ok then
                task.wait(0.5)
                readContract(true)
                return true
            end
        end
    end

    return false
end

local function claimQuest()
    Settings.Step = "Claiming quest"

    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("TextButton") and object.Visible then
            local name = string.lower(object.Name)
            local text = string.lower(object.Text)
            if string.find(name, "claimbutton", 1, true) or text == "claim" or text == "complete" then
                pcall(function() object:Activate() end)
                task.wait(0.55)
                readContract(true)
                return true
            end
        end
    end

    if RFClaim and Settings.QuestId ~= nil then
        local ok = safeInvoke(RFClaim, Settings.QuestId)
        if ok then
            task.wait(0.55)
            readContract(true)
            return true
        end
    end

    return false
end

local function clearTarget()
    Settings.Target = nil
    Settings.TargetRoot = nil
end

local function isQuestComplete()
    if Settings.Required > 0 and Settings.Progress >= Settings.Required then
        return true
    end

    local quest = Settings.Contract
    if type(quest) == "table" then
        for _, key in ipairs({"Completed", "Complete", "Finished", "Claimable", "ReadyToClaim"}) do
            if quest[key] == true then
                return true
            end
        end
    end

    return false
end

local function farmTarget()
    local target = Settings.Target
    if not target or not isAliveNPC(target) then
        clearTarget()
        target = findTarget()
        if not target then
            Settings.Step = "Searching target"
            return
        end

        Settings.Target = target
        Settings.TargetRoot = getRoot(target)
        moveToModel(target, Settings.EngageDistance <= 10 and Settings.EngageDistance or 5, true)
        while isTeleporting and Settings.Running do
            task.wait(0.05)
        end
    end

    local targetRoot = getRoot(target)
    if not targetRoot then
        clearTarget()
        return
    end

    Settings.TargetRoot = targetRoot
    Settings.Step = "Farming " .. target.Name
    startHover()

    local distance = (targetRoot.Position - (getCharacter() and getCharacter())).Magnitude

    doM1()
    doSkills()
end

local function refreshNPCList()
    for _, button in ipairs(npcButtons) do
        button:Destroy()
    end
    table.clear(npcButtons)
    table.clear(npcList)

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and isAliveNPC(obj) then
            table.insert(npcList, obj)
        end
    end

    table.sort(npcList, function(a, b)
        return a.Name:lower() < b.Name:lower()
    end)

    if State.TargetList then
        State.TargetList.CanvasSize = UDim2.new(0, 0, 0, #npcList * 29)
    end

    for i, npc in ipairs(npcList) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -8, 0, 27)
        button.BackgroundColor3 = Color3.fromRGB(43, 43, 53)
        button.BorderSizePixel = 0
        button.Text = npc.Name
        button.TextColor3 = Color3.fromRGB(235, 235, 240)
        button.Font = Enum.Font.Gotham
        button.TextSize = 12
        button.LayoutOrder = i
        button.Parent = State.TargetList

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 5)
        corner.Parent = button

        button.Activated:Connect(function()
            selectedNPC = npc
            State.TargetDropdown.Text = npc.Name
            State.TargetList.Visible = false
        end)

        table.insert(npcButtons, button)
    end
end

local function makeCorner(object, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = object
end

local function makeButton(parent, name, text, y)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1, 0, 0, 34)
    button.Position = UDim2.new(0, 0, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(238, 238, 243)
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 12
    button.Parent = parent
    makeCorner(button, 7)
    return button
end

local function makeGui()
    local existing = playerGui:FindFirstChild("MyAutoFarmUI")
    if existing then
        existing:Destroy()
    end

    local gui = Instance.new("ScreenGui")
    gui.Name = "MyAutoFarmUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = playerGui
    State.Gui = gui

    local main = Instance.new("Frame")
    main.Size = UDim2.fromOffset(370, 520)
    main.Position = UDim2.new(0, 24, 0.5, -260)
    main.BackgroundColor3 = Color3.fromRGB(17, 17, 22)
    main.BorderSizePixel = 0
    main.Parent = gui
    makeCorner(main, 11)
    State.Main = main

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Transparency = 0.55
    stroke.Parent = main

    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 46)
    header.BackgroundColor3 = Color3.fromRGB(27, 27, 35)
    header.BorderSizePixel = 0
    header.Parent = main
    makeCorner(header, 11)

    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromOffset(14, 0)
    title.Size = UDim2.new(1, -60, 1, 0)
    title.Text = "MyAutoFarm • Quest"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 17
    title.TextColor3 = Color3.fromRGB(245, 245, 250)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header

    local minButton = Instance.new("TextButton")
    minButton.Size = UDim2.fromOffset(34, 30)
    minButton.Position = UDim2.new(1, -40, 0, 8)
    minButton.BackgroundTransparency = 1
    minButton.Text = "—"
    minButton.Font = Enum.Font.GothamBold
    minButton.TextSize = 20
    minButton.TextColor3 = Color3.fromRGB(230, 230, 235)
    minButton.Parent = header

    local content = Instance.new("Frame")
    content.BackgroundTransparency = 1
    content.Position = UDim2.fromOffset(12, 56)
    content.Size = UDim2.new(1, -24, 1, -66)
    content.Parent = main
    State.Content = content

    State.Status = Instance.new("TextLabel")
    State.Status.BackgroundTransparency = 1
    State.Status.Size = UDim2.new(1, 0, 0, 28)
    State.Status.Position = UDim2.fromOffset(0, 0)
    State.Status.Font = Enum.Font.GothamSemibold
    State.Status.TextSize = 12
    State.Status.TextColor3 = Color3.fromRGB(205, 205, 212)
    State.Status.TextXAlignment = Enum.TextXAlignment.Left
    State.Status.Parent = content

    State.QuestText = Instance.new("TextLabel")
    State.QuestText.BackgroundTransparency = 1
    State.QuestText.Size = UDim2.new(1, 0, 0, 22)
    State.QuestText.Position = UDim2.fromOffset(0, 28)
    State.QuestText.Font = Enum.Font.Gotham
    State.QuestText.TextSize = 11
    State.QuestText.TextColor3 = Color3.fromRGB(170, 170, 182)
    State.QuestText.TextXAlignment = Enum.TextXAlignment.Left
    State.QuestText.Parent = content

    State.TargetText = State.QuestText:Clone()
    State.TargetText.Position = UDim2.fromOffset(0, 50)
    State.TargetText.Parent = content

    State.ProgressText = State.QuestText:Clone()
    State.ProgressText.Position = UDim2.fromOffset(0, 72)
    State.ProgressText.Parent = content

    State.ToggleButton = makeButton(content, "Toggle", "Farming: OFF", 105)
    State.RepeatButton = makeButton(content, "Repeat", "Auto Repeat: ON", 145)

    local positionButton = makeButton(content, "Position", "Position: ABOVE", 185)
    local skillsButton = makeButton(content, "Skills", "Skills: ON", 225)
    State.SkillButton = skillsButton

    local skillFrame = Instance.new("Frame")
    skillFrame.BackgroundTransparency = 1
    skillFrame.Size = UDim2.new(1, 0, 0, 30)
    skillFrame.Position = UDim2.fromOffset(0, 265)
    skillFrame.Parent = content

    for i, skill in ipairs(Settings.Skills) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.2, -4, 1, 0)
        b.Position = UDim2.new((i - 1) * 0.2, i == 1 and 0 or 2, 0, 0)
        b.BackgroundColor3 = skill.Enabled and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
        b.BorderSizePixel = 0
        b.Text = skill.Name
        b.Font = Enum.Font.GothamBold
        b.TextSize = 13
        b.TextColor3 = Color3.fromRGB(240, 240, 245)
        b.Parent = skillFrame
        makeCorner(b, 6)
        State.SkillButtons[i] = b

        b.Activated:Connect(function()
            skill.Enabled = not skill.Enabled
            b.BackgroundColor3 = skill.Enabled and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
        end)
    end

    local heightBox = Instance.new("TextBox")
    heightBox.Size = UDim2.new(1, 0, 0, 32)
    heightBox.Position = UDim2.fromOffset(0, 303)
    heightBox.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
    heightBox.BorderSizePixel = 0
    heightBox.ClearTextOnFocus = false
    heightBox.Text = "Height: " .. tostring(Settings.Height)
    heightBox.TextColor3 = Color3.fromRGB(238, 238, 243)
    heightBox.Font = Enum.Font.Gotham
    heightBox.TextSize = 12
    heightBox.Parent = content
    makeCorner(heightBox, 7)
    State.HeightBox = heightBox

    local npcRow = Instance.new("Frame")
    npcRow.BackgroundTransparency = 1
    npcRow.Size = UDim2.new(1, 0, 0, 32)
    npcRow.Position = UDim2.fromOffset(0, 343)
    npcRow.Parent = content

    local npcDrop = Instance.new("TextButton")
    npcDrop.Size = UDim2.new(0.68, -4, 1, 0)
    npcDrop.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    npcDrop.BorderSizePixel = 0
    npcDrop.Text = "Select NPC"
    npcDrop.TextColor3 = Color3.fromRGB(235, 235, 240)
    npcDrop.Font = Enum.Font.GothamSemibold
    npcDrop.TextSize = 12
    npcDrop.Parent = npcRow
    makeCorner(npcDrop, 7)
    State.TargetDropdown = npcDrop

    local tp = Instance.new("TextButton")
    tp.Size = UDim2.new(0.30, 0, 1, 0)
    tp.Position = UDim2.new(0.70, 0, 0, 0)
    tp.BackgroundColor3 = Color3.fromRGB(35, 106, 70)
    tp.BorderSizePixel = 0
    tp.Text = "TP to NPC"
    tp.TextColor3 = Color3.fromRGB(240, 240, 245)
    tp.Font = Enum.Font.GothamSemibold
    tp.TextSize = 12
    tp.Parent = npcRow
    makeCorner(tp, 7)

    local list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(1, 0, 0, 100)
    list.Position = UDim2.fromOffset(0, 380)
    list.BackgroundColor3 = Color3.fromRGB(27, 27, 35)
    list.BorderSizePixel = 0
    list.ScrollBarThickness = 4
    list.CanvasSize = UDim2.new(0, 0, 0, 0)
    list.Visible = false
    list.Parent = content
    makeCorner(list, 7)
    State.TargetList = list

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 2)
    layout.Parent = list

    npcDrop.Activated:Connect(function()
        list.Visible = not list.Visible
        if list.Visible then
            refreshNPCList()
        end
    end)

    tp.Activated:Connect(function()
        if selectedNPC and isAliveNPC(selectedNPC) then
            moveToModel(selectedNPC, 3, true)
        end
    end)

    State.ToggleButton.Activated:Connect(function()
        Settings.Running = not Settings.Running
        if Settings.Running then
            farmingStarted = os.clock()
            Settings.Step = "Starting"
            State.ToggleButton.Text = "Farming: ON"
            State.ToggleButton.BackgroundColor3 = Color3.fromRGB(38, 107, 68)
        else
            Settings.Step = "Stopped"
            stopHover()
            State.ToggleButton.Text = "Farming: OFF"
            State.ToggleButton.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
        end
    end)

    State.RepeatButton.Activated:Connect(function()
        Settings.AutoRepeat = not Settings.AutoRepeat
        State.RepeatButton.Text = "Auto Repeat: " .. (Settings.AutoRepeat and "ON" or "OFF")
        State.RepeatButton.BackgroundColor3 = Settings.AutoRepeat and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
    end)

    positionButton.Activated:Connect(function()
        Settings.Position = Settings.Position == "Above" and "Down" or "Above"
        positionButton.Text = "Position: " .. string.upper(Settings.Position)
    end)

    skillsButton.Activated:Connect(function()
        local anyOn = false
        for _, skill in ipairs(Settings.Skills) do
            anyOn = anyOn or skill.Enabled
        end

        local turnOn = not anyOn
        for i, skill in ipairs(Settings.Skills) do
            skill.Enabled = turnOn
            State.SkillButtons[i].BackgroundColor3 = turnOn and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
        end
        skillsButton.Text = "Skills: " .. (turnOn and "ALL ON" or "ALL OFF")
    end)

    heightBox.FocusLost:Connect(function()
        local value = tonumber(heightBox.Text:match("[-%d%.]+"))
        if value then
            Settings.Height = math.clamp(value, Settings.HeightMin, Settings.HeightMax)
        end
        heightBox.Text = "Height: " .. tostring(Settings.Height)
    end)

    minButton.Activated:Connect(function()
        minimized = not minimized
        content.Visible = not minimized
        main.Size = minimized and UDim2.fromOffset(370, 46) or UDim2.fromOffset(370, 520)
        minButton.Text = minimized and "+" or "—"
    end)

    local dragging = false
    local dragStart = nil
    local startPosition = nil

    header.InputBegan:Connect(function(input)
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
        main.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
    end)
end

makeGui()

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then
        return
    end

    if input.KeyCode == Enum.KeyCode.K and State.Main then
        State.Main.Visible = not State.Main.Visible
    elseif input.KeyCode == Enum.KeyCode.F6 then
        Settings.Running = not Settings.Running
        if Settings.Running then
            farmingStarted = os.clock()
        else
            stopHover()
        end
    elseif input.KeyCode == Enum.KeyCode.Up then
        Settings.Height = math.clamp(Settings.Height + 1, Settings.HeightMin, Settings.HeightMax)
        State.HeightBox.Text = "Height: " .. tostring(Settings.Height)
    elseif input.KeyCode == Enum.KeyCode.Down then
        Settings.Height = math.clamp(Settings.Height - 1, Settings.HeightMin, Settings.HeightMax)
        State.HeightBox.Text = "Height: " .. tostring(Settings.Height)
    end
end)

player.CharacterAdded:Connect(function()
    stopHover()
    task.wait(0.7)
    readContract(true)
end)

if REContractChanged and REContractChanged:IsA("RemoteEvent") then
    REContractChanged.OnClientEvent:Connect(function()
        readContract(true)
    end)
end

player.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

local lastLoop = 0
local lastTargetSearch = 0

while State.Gui and State.Gui.Parent do
    local now = os.clock()

    if State.Status then
        State.Status.Text = string.format("%s  •  %s", Settings.Running and "RUNNING" or "STOPPED", Settings.Step)
        State.QuestText.Text = "Quest: " .. (Settings.QuestId and tostring(Settings.QuestId) or "none")
        State.TargetText.Text = "Target: " .. (Settings.Target and Settings.Target.Name or Settings.TargetName or Settings.TargetId or "none")
        State.ProgressText.Text = string.format("Progress: %d / %d", Settings.Progress, Settings.Required)
    end

    if Settings.Running and now - lastLoop >= Settings.SearchInterval then
        lastLoop = now

        local ok = pcall(function()
            local character, humanoid, root = getCharacter()
            if not character or not humanoid or not root then
                stopHover()
                return
            end

            readContract(false)

            if not Settings.TargetName then
                Settings.TargetName = getContractTextTarget()
            end

            if Settings.Required > 0 and Settings.Progress >= Settings.Required then
                stopHover()

                if Settings.AutoClaim then
                    claimQuest()
                end

                if Settings.AutoRepeat then
                    task.wait(0.45)
                    readContract(true)
                    if not Settings.QuestId and Settings.AutoQuest then
                        interactQuestNPC()
                        acceptQuest()
                    end
                else
                    Settings.Running = false
                end
            else
                if Settings.AutoQuest and not Settings.QuestId and now - lastTargetSearch > Settings.QuestRetryDelay then
                    lastTargetSearch = now
                    interactQuestNPC()
                    acceptQuest()
                    readContract(true)
                end

                if Settings.QuestId or Settings.TargetId or Settings.TargetName then
                    if not Settings.Target or not isAliveNPC(Settings.Target) then
                        if now - lastTargetSearch >= Settings.SearchInterval then
                            lastTargetSearch = now
                            local target = findTarget()
                            if target then
                                Settings.Target = target
                                Settings.TargetRoot = getRoot(target)
                                moveToModel(target, 5, true)
                            end
                        end
                    end

                    if Settings.Target then
                        farmTarget()
                    else
                        Settings.Step = "Searching target"
                    end
                else
                    Settings.Step = "Waiting for quest"
                end
            end
        end)

        if not ok then
            Settings.Step = "Loop recovered"
            stopHover()
            task.wait(0.15)
        end
    end

    task.wait(0.025)
end