-- MyAutoFarmGame | Advanced Quest Auto Farm v2
-- Inspired by the supplied farming script: quest cycle, target lock, hover combat,
-- smooth movement, M1/skills, progress tracking, NPC selector and compact UI.
-- Contract remotes are the quest source. Combat uses real user input so the game's
-- own InputController can receive the same Z/X/C/V/F and MouseButton1 actions.

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
    warn("[AutoFarm] ReplicatedStorage.Remotes was not found")
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

    Position = "Above",
    Height = 6,
    HeightMin = 3,
    HeightMax = 35,
    Bob = 0.45,
    Drift = 0.3,

    EngageDistance = 5,
    SearchRadius = 5000,
    SearchInterval = 0.12,
    StateInterval = 0.35,

    M1Min = 0.26,
    M1Max = 0.42,

    SmoothTeleport = true,
    TeleportTime = 1.6,

    QuestRetryDelay = 1.0,
    ClaimDelay = 0.6,

    Quest = nil,
    QuestId = nil,
    TargetId = nil,
    TargetName = nil,
    QuestNPCName = nil,
    Progress = 0,
    Required = 0,
    LastStateRead = 0,
    LastQuestAttempt = 0,
    LastM1 = 0,
    StallStarted = 0,

    Target = nil,
    TargetRoot = nil,
    QuestNPC = nil,
    Step = "Idle",
}

local SkillDefs = {
    {Name = "Z", Key = Enum.KeyCode.Z, Enabled = true, Cooldown = 2.5, Last = 0},
    {Name = "X", Key = Enum.KeyCode.X, Enabled = true, Cooldown = 3.0, Last = 0},
    {Name = "C", Key = Enum.KeyCode.C, Enabled = true, Cooldown = 3.5, Last = 0},
    {Name = "V", Key = Enum.KeyCode.V, Enabled = true, Cooldown = 4.0, Last = 0},
    {Name = "F", Key = Enum.KeyCode.F, Enabled = false, Cooldown = 4.5, Last = 0},
}

local UI = {
    Gui = nil,
    Main = nil,
    Content = nil,
    Status = nil,
    Quest = nil,
    Target = nil,
    Progress = nil,
    Toggle = nil,
    Repeat = nil,
    Position = nil,
    Skills = nil,
    Height = nil,
    NPCDrop = nil,
    NPCList = nil,
    SkillButtons = {},
    Timer = nil,
}

local selectedNPC = nil
local npcButtons = {}
local teleportConnection = nil
local hoverConnection = nil
local isTeleporting = false
local minimized = false
local startedAt = 0

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

local function getModelRoot(model)
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

local function isAliveNPC(model)
    if not model or not model:IsA("Model") then
        return false
    end

    if Players:GetPlayerFromCharacter(model) then
        return false
    end

    local humanoid = model:FindFirstChildOfClass("Humanoid")
    return humanoid ~= nil and humanoid.Health > 0 and getModelRoot(model) ~= nil
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

local function readContractTable(value, found, seen, context)
    if type(value) ~= "table" then
        return
    end

    seen = seen or {}
    if seen[value] then
        return
    end
    seen[value] = true

    for key, child in pairs(value) do
        local name = string.lower(tostring(key))

        if type(child) == "table" then
            local nextContext = context
            if name == "progress" then
                nextContext = "progress"
            elseif name == "definitionsnapshot" or name == "definition" then
                nextContext = "definition"
            end
            readContractTable(child, found, seen, nextContext)
        elseif type(child) == "string" then
            if name == "activeid" or name == "active_id" then
                found.QuestId = child
            elseif name == "targetid" or name == "target_id" then
                found.TargetId = child
            elseif name == "targetnpc" or name == "target_npc" or name == "targetname" or name == "target_name" then
                found.TargetName = child
            elseif name == "fieldnpc" or name == "field_npc" or name == "npcname" or name == "npc_name" then
                found.QuestNPCName = child
            elseif name == "id" and context == "definition" and not found.DefinitionId then
                found.DefinitionId = child
            end
        elseif type(child) == "number" then
            if name == "killsdone" or name == "killdone" or name == "progress" or name == "current" or name == "kills" or name == "clearsdone" then
                if found.Progress == nil or context == "progress" then
                    found.Progress = child
                end
            elseif name == "killgoal" or name == "killgoalmin" or name == "required" or name == "requiredkills" or name == "killcount" or name == "clears" or name == "clearsmin" then
                if child > 0 then
                    found.Required = child
                end
            end
        elseif type(child) == "boolean" then
            if child and (name == "completed" or name == "complete" or name == "finished" or name == "claimable" or name == "readytoclaim" or name == "delivered") then
                found.Completed = true
            end
        end
    end
end

local function readContract(force)
    if not RFGetState then
        Settings.Step = "ContractGetState missing"
        return nil
    end

    if not force and os.clock() - Settings.LastStateRead < Settings.StateInterval then
        return Settings.Quest
    end

    Settings.LastStateRead = os.clock()

    local ok, result = safeInvoke(RFGetState)
    if not ok then
        Settings.Step = "Contract read failed"
        return Settings.Quest
    end

    Settings.Quest = result

    local found = {
        Progress = nil,
        Required = nil,
        Completed = false,
    }

    readContractTable(result, found, {}, nil)

    if found.QuestId ~= nil then
        Settings.QuestId = found.QuestId
    end
    if found.TargetId ~= nil then
        Settings.TargetId = found.TargetId
    end
    if found.TargetName ~= nil and found.TargetName ~= "" then
        Settings.TargetName = found.TargetName
    end
    if found.QuestNPCName ~= nil and found.QuestNPCName ~= "" then
        Settings.QuestNPCName = found.QuestNPCName
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

    return result
end

local function scanQuestText()
    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
            local text = object.Text
            if type(text) == "string" and text ~= "" then
                local target = text:match("[Dd]efeat%s+%d+%s+([%w%s%-]+)")
                target = target or text:match("[Kk]ill%s+%d+%s+([%w%s%-]+)")
                if target and target ~= "" then
                    return target:gsub("^%s+", ""):gsub("%s+$", "")
                end
            end
        end
    end
    return nil
end

local function hasTargetId(model, targetId)
    if targetId == nil then
        return false
    end

    for _, key in ipairs({"TargetId", "TargetID", "NPCId", "NPCID", "Id", "ID", "GUID"}) do
        local value = model:GetAttribute(key)
        if value ~= nil and tostring(value) == tostring(targetId) then
            return true
        end
    end

    return false
end

local function targetMatches(model)
    if not isAliveNPC(model) then
        return false
    end

    if hasTargetId(model, Settings.TargetId) then
        return true
    end

    local wanted = Settings.TargetName
    if not wanted then
        wanted = scanQuestText()
        if wanted then
            Settings.TargetName = wanted
        end
    end

    if not wanted then
        return false
    end

    local a = normalize(model.Name):gsub("%d+$", "")
    local b = normalize(wanted)

    return a == b or string.find(a, b, 1, true) ~= nil or string.find(b, a, 1, true) ~= nil
end

local function findTarget()
    local _, _, playerRoot = getCharacter()
    if not playerRoot then
        return nil
    end

    local best = nil
    local bestDistance = math.huge

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Model") and targetMatches(object) then
            local root = getModelRoot(object)
            if root then
                local distance = (root.Position - playerRoot.Position).Magnitude
                if distance <= Settings.SearchRadius and distance < bestDistance then
                    best = object
                    bestDistance = distance
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

    local preferred = normalize(Settings.QuestNPCName)
    local bestModel = nil
    local bestPrompt = nil
    local bestDistance = math.huge

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ProximityPrompt") and object.Enabled then
            local search = normalize(object.Name .. " " .. object.ActionText .. " " .. object.ObjectText)
            local useful = string.find(search, "quest", 1, true) ~= nil
                or string.find(search, "contract", 1, true) ~= nil
                or string.find(search, "mission", 1, true) ~= nil
                or string.find(search, "accept", 1, true) ~= nil
                or string.find(search, "claim", 1, true) ~= nil

            local model = object.Parent and object.Parent:FindFirstAncestorOfClass("Model")
            local root = getModelRoot(model)

            if model and root then
                local preferredMatch = preferred ~= "" and string.find(normalize(model.Name), preferred, 1, true) ~= nil
                if useful or preferredMatch then
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

local function firePrompt(prompt)
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

local function findVisibleButton(words)
    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("TextButton") and object.Visible then
            local name = string.lower(object.Name)
            local text = string.lower(object.Text)

            for _, word in ipairs(words) do
                local wanted = string.lower(word)
                if name == wanted or text == wanted or string.find(name, wanted, 1, true) or string.find(text, wanted, 1, true) then
                    if object.AbsoluteSize.X > 0 and object.AbsoluteSize.Y > 0 then
                        return object
                    end
                end
            end
        end
    end

    return nil
end

local function acceptQuest()
    Settings.Step = "Accepting quest"

    local button = findVisibleButton({"AcceptButton", "Accept"})
    if button then
        local ok = pcall(function()
            button:Activate()
        end)
        if ok then
            task.wait(0.45)
            readContract(true)
            return true
        end
    end

    if RFAccept and Settings.QuestId ~= nil then
        local ok = safeInvoke(RFAccept, Settings.QuestId)
        if ok then
            task.wait(0.45)
            readContract(true)
            return true
        end
    end

    return false
end

local function claimQuest()
    Settings.Step = "Claiming quest"

    local button = findVisibleButton({"ClaimButton", "Claim", "CompleteButton", "Complete"})
    if button then
        local ok = pcall(function()
            button:Activate()
        end)
        if ok then
            task.wait(Settings.ClaimDelay)
            readContract(true)
            return true
        end
    end

    if RFClaim and Settings.QuestId ~= nil then
        local ok = safeInvoke(RFClaim, Settings.QuestId)
        if ok then
            task.wait(Settings.ClaimDelay)
            readContract(true)
            return true
        end
    end

    return false
end

local function smoothTeleport(position, duration)
    if isTeleporting then
        return false
    end

    local _, _, root = getCharacter()
    if not root then
        return false
    end

    if teleportConnection then
        teleportConnection:Disconnect()
        teleportConnection = nil
    end

    if not Settings.SmoothTeleport then
        root.CFrame = CFrame.new(position)
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        return true
    end

    isTeleporting = true
    local startPosition = root.Position
    local startTime = os.clock()
    local total = math.max(duration or Settings.TeleportTime, 0.05)

    teleportConnection = RunService.RenderStepped:Connect(function()
        local character = player.Character
        local rt = character and character:FindFirstChild("HumanoidRootPart")

        if not rt then
            if teleportConnection then teleportConnection:Disconnect() end
            teleportConnection = nil
            isTeleporting = false
            return
        end

        local alpha = math.clamp((os.clock() - startTime) / total, 0, 1)
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

local function moveToModel(model, distance)
    local modelRoot = getModelRoot(model)
    if not modelRoot then
        return false
    end

    local amount = distance or Settings.EngageDistance
    local position = modelRoot.Position - modelRoot.CFrame.LookVector * amount + Vector3.new(0, 2, 0)
    return smoothTeleport(position, Settings.TeleportTime)
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

    local time = 0
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

        time = time + dt
        driftTime = driftTime + dt

        if driftTime >= 2.5 then
            driftTime = 0
            drift = Vector3.new(randomFloat(-Settings.Drift, Settings.Drift), 0, randomFloat(-Settings.Drift, Settings.Drift))
        end

        local vertical = Settings.Position == "Above" and Settings.Height or -Settings.Height
        local bob = math.sin(time * 1.8) * Settings.Bob
        local desired = targetRoot.Position + Vector3.new(drift.X, vertical + bob, drift.Z)
        local direction = targetRoot.Position - desired

        root.Anchored = false
        if direction.Magnitude > 0.01 then
            root.CFrame = CFrame.lookAt(desired, targetRoot.Position)
        else
            root.CFrame = CFrame.new(desired)
        end
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

local function m1()
    local now = os.clock()
    if now - Settings.LastM1 < randomFloat(Settings.M1Min, Settings.M1Max) then
        return
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
end

local function useSkills()
    if not Settings.UseSkills then
        return
    end

    local now = os.clock()
    for _, skill in ipairs(SkillDefs) do
        if skill.Enabled and now - skill.Last >= skill.Cooldown then
            skill.Last = now
            pressKey(skill.Key)
            task.wait(0.03)
        end
    end
end

local function questComplete()
    if Settings.Required > 0 and Settings.Progress >= Settings.Required then
        return true
    end

    if type(Settings.Quest) == "table" then
        for _, key in ipairs({"Completed", "Complete", "Finished", "Claimable", "ReadyToClaim"}) do
            if Settings.Quest[key] == true then
                return true
            end
        end
    end

    return false
end

local function ensureQuest()
    readContract(true)

    if Settings.QuestId ~= nil or Settings.TargetId ~= nil or Settings.TargetName ~= nil then
        return true
    end

    if not Settings.AutoQuest then
        return false
    end

    local now = os.clock()
    if now - Settings.LastQuestAttempt < Settings.QuestRetryDelay then
        return false
    end

    Settings.LastQuestAttempt = now
    if not interactQuestNPC() then
        return false
    end

    acceptQuest()
    task.wait(0.25)
    readContract(true)

    return Settings.QuestId ~= nil or Settings.TargetId ~= nil or Settings.TargetName ~= nil
end

function interactQuestNPC()
    local npc, prompt = findQuestNPC()
    if not npc then
        Settings.Step = "Quest NPC not found"
        return false
    end

    Settings.QuestNPC = npc
    Settings.Step = "Going to quest NPC"

    moveToModel(npc, 4)
    while isTeleporting and Settings.Running do
        task.wait(0.05)
    end

    if prompt then
        firePrompt(prompt)
        task.wait(0.45)
    end

    return true
end

local function farmTarget()
    local target = Settings.Target

    if not target or not isAliveNPC(target) then
        Settings.Target = findTarget()
        target = Settings.Target

        if not target then
            stopHover()
            Settings.Step = "Searching target"
            return
        end

        Settings.TargetRoot = getModelRoot(target)
        moveToModel(target, Settings.EngageDistance)
        while isTeleporting and Settings.Running do
            task.wait(0.05)
        end
    end

    if not isAliveNPC(target) then
        stopHover()
        return
    end

    Settings.TargetRoot = getModelRoot(target)
    Settings.Step = "Farming " .. target.Name
    startHover()

    m1()
    useSkills()
end

local function clearNPCButtons()
    for _, button in ipairs(npcButtons) do
        button:Destroy()
    end
    table.clear(npcButtons)
end

local function refreshNPCList()
    clearNPCButtons()

    local list = {}
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Model") and isAliveNPC(object) then
            table.insert(list, object)
        end
    end

    table.sort(list, function(a, b)
        return a.Name:lower() < b.Name:lower()
    end)

    UI.NPCList.CanvasSize = UDim2.new(0, 0, 0, #list * 29)

    for index, npc in ipairs(list) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -8, 0, 27)
        button.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        button.BorderSizePixel = 0
        button.Text = npc.Name
        button.TextColor3 = Color3.fromRGB(235, 235, 240)
        button.Font = Enum.Font.Gotham
        button.TextSize = 12
        button.LayoutOrder = index
        button.Parent = UI.NPCList

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = button

        button.Activated:Connect(function()
            selectedNPC = npc
            UI.NPCDrop.Text = npc.Name
            UI.NPCList.Visible = false
        end)

        table.insert(npcButtons, button)
    end
end

local function corner(object, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = object
end

local function makeButton(parent, name, text, y)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1, 0, 0, 34)
    button.Position = UDim2.fromOffset(0, y)
    button.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(238, 238, 243)
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 12
    button.AutoButtonColor = true
    button.Parent = parent
    corner(button, 7)
    return button
end

local function makeGui()
    local old = playerGui:FindFirstChild("MyAutoFarmUI")
    if old then
        old:Destroy()
    end

    local gui = Instance.new("ScreenGui")
    gui.Name = "MyAutoFarmUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = playerGui
    UI.Gui = gui

    local main = Instance.new("Frame")
    main.Size = UDim2.fromOffset(365, 500)
    main.Position = UDim2.new(0, 22, 0.5, -250)
    main.BackgroundColor3 = Color3.fromRGB(16, 16, 21)
    main.BorderSizePixel = 0
    main.Parent = gui
    corner(main, 11)
    UI.Main = main

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Transparency = 0.55
    stroke.Parent = main

    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 46)
    header.BackgroundColor3 = Color3.fromRGB(27, 27, 35)
    header.BorderSizePixel = 0
    header.Parent = main
    corner(header, 11)

    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromOffset(14, 0)
    title.Size = UDim2.new(1, -58, 1, 0)
    title.Text = "MyAutoFarm • Quest Farm"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 17
    title.TextColor3 = Color3.fromRGB(245, 245, 250)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header

    local min = Instance.new("TextButton")
    min.Size = UDim2.fromOffset(34, 30)
    min.Position = UDim2.new(1, -40, 0, 8)
    min.BackgroundTransparency = 1
    min.Text = "—"
    min.Font = Enum.Font.GothamBold
    min.TextSize = 20
    min.TextColor3 = Color3.fromRGB(230, 230, 235)
    min.Parent = header

    local content = Instance.new("Frame")
    content.BackgroundTransparency = 1
    content.Position = UDim2.fromOffset(12, 56)
    content.Size = UDim2.new(1, -24, 1, -66)
    content.Parent = main
    UI.Content = content

    local function label(y, size)
        local text = Instance.new("TextLabel")
        text.BackgroundTransparency = 1
        text.Size = UDim2.new(1, 0, 0, size or 21)
        text.Position = UDim2.fromOffset(0, y)
        text.Font = Enum.Font.Gotham
        text.TextSize = 11
        text.TextColor3 = Color3.fromRGB(178, 178, 190)
        text.TextXAlignment = Enum.TextXAlignment.Left
        text.Parent = content
        return text
    end

    UI.Status = label(0, 24)
    UI.Quest = label(24, 21)
    UI.Target = label(45, 21)
    UI.Progress = label(66, 21)

    UI.Toggle = makeButton(content, "Toggle", "Farming: OFF", 94)
    UI.Repeat = makeButton(content, "Repeat", "Auto Repeat: ON", 134)
    UI.Position = makeButton(content, "Position", "Position: ABOVE", 174)
    UI.Skills = makeButton(content, "Skills", "Skills: ON", 214)

    local skillFrame = Instance.new("Frame")
    skillFrame.BackgroundTransparency = 1
    skillFrame.Size = UDim2.new(1, 0, 0, 30)
    skillFrame.Position = UDim2.fromOffset(0, 254)
    skillFrame.Parent = content

    for index, skill in ipairs(SkillDefs) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.2, -4, 1, 0)
        button.Position = UDim2.new((index - 1) * 0.2, index == 1 and 0 or 2, 0, 0)
        button.BackgroundColor3 = skill.Enabled and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
        button.BorderSizePixel = 0
        button.Text = skill.Name
        button.TextColor3 = Color3.fromRGB(238, 238, 243)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 12
        button.Parent = skillFrame
        corner(button, 6)
        UI.SkillButtons[index] = button

        button.Activated:Connect(function()
            skill.Enabled = not skill.Enabled
            button.BackgroundColor3 = skill.Enabled and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
        end)
    end

    local height = Instance.new("TextBox")
    height.Size = UDim2.new(1, 0, 0, 32)
    height.Position = UDim2.fromOffset(0, 292)
    height.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
    height.BorderSizePixel = 0
    height.ClearTextOnFocus = false
    height.Text = "Height: " .. tostring(Settings.Height)
    height.TextColor3 = Color3.fromRGB(238, 238, 243)
    height.Font = Enum.Font.Gotham
    height.TextSize = 12
    height.Parent = content
    corner(height, 7)
    UI.Height = height

    local drop = Instance.new("TextButton")
    drop.Size = UDim2.new(0.68, -4, 0, 32)
    drop.Position = UDim2.fromOffset(0, 332)
    drop.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    drop.BorderSizePixel = 0
    drop.Text = "Select NPC"
    drop.TextColor3 = Color3.fromRGB(235, 235, 240)
    drop.Font = Enum.Font.GothamSemibold
    drop.TextSize = 12
    drop.Parent = content
    corner(drop, 7)
    UI.NPCDrop = drop

    local tp = Instance.new("TextButton")
    tp.Size = UDim2.new(0.30, 0, 0, 32)
    tp.Position = UDim2.new(0.70, 0, 0, 332)
    tp.BackgroundColor3 = Color3.fromRGB(35, 106, 70)
    tp.BorderSizePixel = 0
    tp.Text = "TP to NPC"
    tp.TextColor3 = Color3.fromRGB(240, 240, 245)
    tp.Font = Enum.Font.GothamSemibold
    tp.TextSize = 12
    tp.Parent = content
    corner(tp, 7)

    local list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(1, 0, 0, 100)
    list.Position = UDim2.fromOffset(0, 369)
    list.BackgroundColor3 = Color3.fromRGB(27, 27, 35)
    list.BorderSizePixel = 0
    list.ScrollBarThickness = 4
    list.CanvasSize = UDim2.new(0, 0, 0, 0)
    list.Visible = false
    list.Parent = content
    corner(list, 7)
    UI.NPCList = list

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 2)
    layout.Parent = list

    drop.Activated:Connect(function()
        list.Visible = not list.Visible
        if list.Visible then
            refreshNPCList()
        end
    end)

    tp.Activated:Connect(function()
        if selectedNPC and isAliveNPC(selectedNPC) then
            moveToModel(selectedNPC, 3)
        end
    end)

    UI.Toggle.Activated:Connect(function()
        Settings.Running = not Settings.Running
        if Settings.Running then
            startedAt = os.clock()
            UI.Toggle.Text = "Farming: ON"
            UI.Toggle.BackgroundColor3 = Color3.fromRGB(38, 107, 68)
            Settings.Step = "Starting"
        else
            UI.Toggle.Text = "Farming: OFF"
            UI.Toggle.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
            Settings.Step = "Stopped"
            stopHover()
        end
    end)

    UI.Repeat.Activated:Connect(function()
        Settings.AutoRepeat = not Settings.AutoRepeat
        UI.Repeat.Text = "Auto Repeat: " .. (Settings.AutoRepeat and "ON" or "OFF")
        UI.Repeat.BackgroundColor3 = Settings.AutoRepeat and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
    end)

    UI.Position.Activated:Connect(function()
        Settings.Position = Settings.Position == "Above" and "Down" or "Above"
        UI.Position.Text = "Position: " .. string.upper(Settings.Position)
    end)

    UI.Skills.Activated:Connect(function()
        local anyEnabled = false
        for _, skill in ipairs(SkillDefs) do
            anyEnabled = anyEnabled or skill.Enabled
        end

        local enable = not anyEnabled
        for index, skill in ipairs(SkillDefs) do
            skill.Enabled = enable
            UI.SkillButtons[index].BackgroundColor3 = enable and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
        end
        UI.Skills.Text = "Skills: " .. (enable and "ALL ON" or "ALL OFF")
    end)

    height.FocusLost:Connect(function()
        local value = tonumber(height.Text:match("[-%d%.]+"))
        if value then
            Settings.Height = math.clamp(value, Settings.HeightMin, Settings.HeightMax)
        end
        height.Text = "Height: " .. tostring(Settings.Height)
    end)

    min.Activated:Connect(function()
        minimized = not minimized
        content.Visible = not minimized
        main.Size = minimized and UDim2.fromOffset(365, 46) or UDim2.fromOffset(365, 500)
        min.Text = minimized and "+" or "—"
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

    if input.KeyCode == Enum.KeyCode.K and UI.Main then
        UI.Main.Visible = not UI.Main.Visible
    elseif input.KeyCode == Enum.KeyCode.F6 then
        Settings.Running = not Settings.Running
        if Settings.Running then
            startedAt = os.clock()
            Settings.Step = "Starting"
        else
            Settings.Step = "Stopped"
            stopHover()
        end
    elseif input.KeyCode == Enum.KeyCode.Up then
        Settings.Height = math.clamp(Settings.Height + 1, Settings.HeightMin, Settings.HeightMax)
        UI.Height.Text = "Height: " .. tostring(Settings.Height)
    elseif input.KeyCode == Enum.KeyCode.Down then
        Settings.Height = math.clamp(Settings.Height - 1, Settings.HeightMin, Settings.HeightMax)
        UI.Height.Text = "Height: " .. tostring(Settings.Height)
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

local loopTimer = 0
local searchTimer = 0

while UI.Gui and UI.Gui.Parent do
    local now = os.clock()

    if UI.Status then
        local elapsed = Settings.Running and math.max(0, now - startedAt) or 0
        local h = math.floor(elapsed / 3600)
        local m = math.floor((elapsed % 3600) / 60)
        local s = math.floor(elapsed % 60)
        UI.Status.Text = string.format("%s  •  %s  •  %02d:%02d:%02d", Settings.Running and "RUNNING" or "STOPPED", Settings.Step, h, m, s)
        UI.Quest.Text = "Quest: " .. (Settings.QuestId and tostring(Settings.QuestId) or "none")
        UI.Target.Text = "Target: " .. (Settings.Target and Settings.Target.Name or Settings.TargetName or Settings.TargetId or "none")
        UI.Progress.Text = string.format("Progress: %d / %d", Settings.Progress, Settings.Required)
    end

    if Settings.Running and now - loopTimer >= Settings.SearchInterval then
        loopTimer = now

        local ok = pcall(function()
            local character, humanoid, root = getCharacter()
            if not character or not humanoid or not root then
                stopHover()
                return
            end

            readContract(false)

            if not Settings.TargetName then
                Settings.TargetName = scanQuestText()
            end

            if questComplete() then
                stopHover()

                if Settings.AutoClaim then
                    claimQuest()
                end

                task.wait(Settings.ClaimDelay)
                Settings.Target = nil
                Settings.TargetRoot = nil
                Settings.TargetName = nil
                Settings.TargetId = nil
                Settings.Progress = 0
                Settings.Required = 0

                if Settings.AutoRepeat then
                    readContract(true)
                    if Settings.QuestId == nil and Settings.AutoQuest then
                        interactQuestNPC()
                        acceptQuest()
                    end
                else
                    Settings.Running = false
                end
            else
                if not ensureQuest() then
                    Settings.Step = "Waiting for quest"
                else
                    if Settings.Target and not isAliveNPC(Settings.Target) then
                        Settings.Target = nil
                        Settings.TargetRoot = nil
                    end

                    if not Settings.Target and now - searchTimer >= Settings.SearchInterval then
                        searchTimer = now
                        local target = findTarget()
                        if target then
                            Settings.Target = target
                            Settings.TargetRoot = getModelRoot(target)
                            moveToModel(target, Settings.EngageDistance)
                        else
                            Settings.Step = "Searching target"
                        end
                    end

                    if Settings.Target then
                        farmTarget()
                    end
                end
            end
        end)

        if not ok then
            Settings.Step = "Recovered from error"
            stopHover()
        end
    end

    task.wait(0.025)
end