-- MyAutoFarmGame | Quest Auto Farm
-- Inspired by the supplied farm: smooth TP, hover, target lock, M1, skills,
-- contract tracking, quest interaction, repeat and a usable control panel.

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
local InputRemote = remotes:FindFirstChild("Input")

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
    Drift = 0.25,
    EngageDistance = 5,
    SearchRadius = 5000,
    SearchInterval = 0.10,
    StateInterval = 0.35,
    M1Min = 0.24,
    M1Max = 0.40,
    TeleportTime = 1.2,
    QuestRetryDelay = 0.8,
    ClaimDelay = 0.6,
    LastState = 0,
    LastQuestAttempt = 0,
    LastM1 = 0,
    Quest = nil,
    QuestId = nil,
    DefinitionId = nil,
    TargetId = nil,
    TargetName = nil,
    QuestNPCName = nil,
    Progress = 0,
    Required = 0,
    Target = nil,
    TargetRoot = nil,
    QuestNPC = nil,
    Step = "Idle",
}

local Skills = {
    {Name = "Z", Key = Enum.KeyCode.Z, Enabled = true, Cooldown = 2.5, Last = 0},
    {Name = "X", Key = Enum.KeyCode.X, Enabled = true, Cooldown = 3.0, Last = 0},
    {Name = "C", Key = Enum.KeyCode.C, Enabled = true, Cooldown = 3.5, Last = 0},
    {Name = "V", Key = Enum.KeyCode.V, Enabled = true, Cooldown = 4.0, Last = 0},
    {Name = "F", Key = Enum.KeyCode.F, Enabled = false, Cooldown = 4.5, Last = 0},
}

local UI = {}
local selectedNPC = nil
local npcButtons = {}
local teleportConnection = nil
local hoverConnection = nil
local minimized = false
local isTeleporting = false
local startedAt = 0

local function randomFloat(a, b)
    return a + math.random() * (b - a)
end

local function character()
    local c = player.Character
    if not c then
        return nil, nil, nil
    end
    local h = c:FindFirstChildOfClass("Humanoid")
    local r = c:FindFirstChild("HumanoidRootPart")
    if not h or not r or not r:IsA("BasePart") or h.Health <= 0 then
        return nil, nil, nil
    end
    return c, h, r
end

local function rootOf(model)
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
    local h = model:FindFirstChildOfClass("Humanoid")
    return h ~= nil and h.Health > 0 and rootOf(model) ~= nil
end

local function normalize(value)
    return tostring(value or ""):lower():gsub("[^%w]", "")
end

local function invoke(remote, ...)
    if not remote or not remote:IsA("RemoteFunction") then
        return false, nil
    end
    local args = {...}
    local n = select("#", ...)
    return pcall(function()
        return remote:InvokeServer(table.unpack(args, 1, n))
    end)
end

local function readStateTable(value, found, seen, context)
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
            readStateTable(child, found, seen, nextContext)
        elseif type(child) == "string" then
            if name == "activeid" or name == "active_id" then
                found.QuestId = child
            elseif name == "definitionid" or name == "definition_id" then
                found.DefinitionId = child
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
        Settings.Step = "GetState missing"
        return false
    end
    if not force and os.clock() - Settings.LastState < Settings.StateInterval then
        return true
    end
    Settings.LastState = os.clock()

    local ok, result = invoke(RFGetState)
    if not ok then
        Settings.Step = "GetState failed"
        return false
    end

    Settings.Quest = result
    local found = {Progress = nil, Required = nil, Completed = false}
    readStateTable(result, found, {}, nil)

    if found.QuestId ~= nil then Settings.QuestId = found.QuestId end
    if found.DefinitionId ~= nil then Settings.DefinitionId = found.DefinitionId end
    if found.TargetId ~= nil then Settings.TargetId = found.TargetId end
    if found.TargetName ~= nil and found.TargetName ~= "" then Settings.TargetName = found.TargetName end
    if found.QuestNPCName ~= nil and found.QuestNPCName ~= "" then Settings.QuestNPCName = found.QuestNPCName end
    if found.Progress ~= nil then Settings.Progress = found.Progress end
    if found.Required ~= nil then Settings.Required = found.Required end
    if found.Completed and Settings.Required > 0 then Settings.Progress = Settings.Required end

    return true
end

local function scanQuestText()
    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
            local text = object.Text
            if type(text) == "string" then
                local target = text:match("[Dd]efeat%s+%d+%s+([%w%s%-]+)")
                target = target or text:match("[Kk]ill%s+%d+%s+([%w%s%-]+)")
                if target then
                    return target:gsub("^%s+", ""):gsub("%s+$", "")
                end
            end
        end
    end
    return nil
end

local function targetMatches(model)
    if not aliveNPC(model) then
        return false
    end

    if Settings.TargetId then
        for _, key in ipairs({"TargetId", "TargetID", "NPCId", "NPCID", "Id", "ID", "GUID"}) do
            local value = model:GetAttribute(key)
            if value ~= nil and tostring(value) == tostring(Settings.TargetId) then
                return true
            end
        end
    end

    local wanted = Settings.TargetName or scanQuestText()
    if not wanted then
        return false
    end
    Settings.TargetName = wanted

    local a = normalize(model.Name):gsub("%d+$", "")
    local b = normalize(wanted)
    return a == b or string.find(a, b, 1, true) ~= nil or string.find(b, a, 1, true) ~= nil
end

local function findTarget()
    local _, _, playerRoot = character()
    if not playerRoot then
        return nil
    end
    local best = nil
    local bestDistance = math.huge

    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and targetMatches(model) then
            local root = rootOf(model)
            local d = root and (root.Position - playerRoot.Position).Magnitude or math.huge
            if d <= Settings.SearchRadius and d < bestDistance then
                best = model
                bestDistance = d
            end
        end
    end
    return best
end

local function findNPC()
    local _, _, playerRoot = character()
    if not playerRoot then return nil, nil end

    local wanted = normalize(Settings.QuestNPCName)
    local bestModel, bestPrompt = nil, nil
    local bestDistance = math.huge

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ProximityPrompt") and object.Enabled then
            local model = object.Parent and object.Parent:FindFirstAncestorOfClass("Model")
            local root = rootOf(model)
            if model and root then
                local text = normalize(object.Name .. " " .. object.ActionText .. " " .. object.ObjectText)
                local useful = string.find(text, "quest", 1, true) ~= nil
                    or string.find(text, "contract", 1, true) ~= nil
                    or string.find(text, "mission", 1, true) ~= nil
                    or string.find(text, "accept", 1, true) ~= nil
                    or string.find(text, "claim", 1, true) ~= nil
                local preferred = wanted ~= "" and string.find(normalize(model.Name), wanted, 1, true) ~= nil
                if useful or preferred then
                    local d = (root.Position - playerRoot.Position).Magnitude
                    if d < bestDistance then
                        bestDistance = d
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
    local _, _, root = character()
    if not root then return false end
    if teleportConnection then teleportConnection:Disconnect() end

    local total = math.max(duration or Settings.TeleportTime, 0.05)
    local start = root.Position
    local started = os.clock()
    isTeleporting = true

    teleportConnection = RunService.RenderStepped:Connect(function()
        local _, _, rt = character()
        if not rt then
            if teleportConnection then teleportConnection:Disconnect() end
            teleportConnection = nil
            isTeleporting = false
            return
        end

        local alpha = math.clamp((os.clock() - started) / total, 0, 1)
        local eased = 1 - (1 - alpha) ^ 3
        rt.CFrame = CFrame.new(start:Lerp(position, eased))
        rt.AssemblyLinearVelocity = Vector3.zero
        rt.AssemblyAngularVelocity = Vector3.zero

        if alpha >= 1 then
            rt.CFrame = CFrame.new(position)
            teleportConnection:Disconnect()
            teleportConnection = nil
            isTeleporting = false
        end
    end)
    return true
end

local function goToModel(model, distance)
    local root = rootOf(model)
    if not root then return false end
    local pos = root.Position - root.CFrame.LookVector * (distance or 5) + Vector3.new(0, 2, 0)
    return smoothTeleport(pos, Settings.TeleportTime)
end

local function stopHover()
    if hoverConnection then
        hoverConnection:Disconnect()
        hoverConnection = nil
    end
    Settings.Target = nil
    Settings.TargetRoot = nil
    local _, humanoid, root = character()
    if humanoid then humanoid.AutoRotate = true end
    if root then
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end
end

local function startHover()
    if hoverConnection then return end
    local t = 0
    local driftTimer = 0
    local drift = Vector3.zero

    hoverConnection = RunService.RenderStepped:Connect(function(dt)
        if not Settings.Running then return end
        local _, humanoid, root = character()
        local target = Settings.Target
        local targetRoot = Settings.TargetRoot
        if not humanoid or not root or not target or not targetRoot or not targetRoot.Parent or not aliveNPC(target) then return end

        t = t + dt
        driftTimer = driftTimer + dt
        if driftTimer >= 2.5 then
            driftTimer = 0
            drift = Vector3.new(randomFloat(-Settings.Drift, Settings.Drift), 0, randomFloat(-Settings.Drift, Settings.Drift))
        end

        local y = Settings.Position == "Above" and Settings.Height or -Settings.Height
        local bob = math.sin(t * 1.8) * Settings.Bob
        local desired = targetRoot.Position + Vector3.new(drift.X, y + bob, drift.Z)
        root.CFrame = CFrame.lookAt(desired, targetRoot.Position)
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        humanoid.AutoRotate = false
    end)
end

local function pressKey(key)
    pcall(function()
        VirtualInputManager:SendKeyEvent(true, key, false, game)
        task.wait(0.025)
        VirtualInputManager:SendKeyEvent(false, key, false, game)
    end)
end

local function doM1()
    local now = os.clock()
    if now - Settings.LastM1 < randomFloat(Settings.M1Min, Settings.M1Max) then return end
    Settings.LastM1 = now

    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)

    local c = player.Character
    local tool = c and c:FindFirstChildOfClass("Tool")
    if tool then pcall(function() tool:Activate() end) end
end

local function doSkills()
    if not Settings.UseSkills then return end
    local now = os.clock()

    for _, skill in ipairs(Skills) do
        if skill.Enabled and now - skill.Last >= skill.Cooldown then
            skill.Last = now
            pressKey(skill.Key)
            task.wait(0.03)
        end
    end
end

local function interactPrompt(prompt)
    if not prompt or not prompt.Enabled then return false end
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

local function findButton(words)
    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("TextButton") and object.Visible then
            local name = string.lower(object.Name)
            local text = string.lower(object.Text)
            for _, word in ipairs(words) do
                local w = string.lower(word)
                if name == w or text == w or string.find(name, w, 1, true) or string.find(text, w, 1, true) then
                    return object
                end
            end
        end
    end
    return nil
end

local function acceptQuest()
    Settings.Step = "Taking quest"

    -- Most reliable path: use the actual contract UI button.
    local button = findButton({"AcceptButton", "Accept"})
    if button then
        local ok = pcall(function() button:Activate() end)
        if ok then
            task.wait(0.45)
            readContract(true)
            if Settings.QuestId ~= nil or Settings.TargetId ~= nil or Settings.TargetName ~= nil then
                return true
            end
        end
    end

    -- If the server expects the currently exposed contract/definition id, try it.
    if RFAccept then
        local id = Settings.DefinitionId or Settings.QuestId
        if id ~= nil then
            local ok = invoke(RFAccept, id)
            if ok then
                task.wait(0.45)
                readContract(true)
                return Settings.QuestId ~= nil or Settings.TargetId ~= nil or Settings.TargetName ~= nil
            end
        end
    end

    return false
end

local function claimQuest()
    Settings.Step = "Claiming quest"

    local button = findButton({"ClaimButton", "Claim", "CompleteButton", "Complete"})
    if button then
        if pcall(function() button:Activate() end) then
            task.wait(Settings.ClaimDelay)
            readContract(true)
            return true
        end
    end

    if RFClaim and Settings.QuestId ~= nil then
        local ok = invoke(RFClaim, Settings.QuestId)
        if ok then
            task.wait(Settings.ClaimDelay)
            readContract(true)
            return true
        end
    end

    return false
end

local function questComplete()
    if Settings.Required > 0 and Settings.Progress >= Settings.Required then
        return true
    end
    if type(Settings.Quest) == "table" then
        for _, key in ipairs({"Completed", "Complete", "Finished", "Claimable", "ReadyToClaim"}) do
            if Settings.Quest[key] == true then return true end
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

    if os.clock() - Settings.LastQuestAttempt < Settings.QuestRetryDelay then
        return false
    end
    Settings.LastQuestAttempt = os.clock()

    -- Try the quest UI first. This avoids hanging forever on a missing prompt.
    if acceptQuest() then
        return true
    end

    -- Then look for a quest NPC and open its prompt, if the game uses one.
    local npc, prompt = findNPC()
    if npc then
        Settings.QuestNPC = npc
        Settings.Step = "Going to quest NPC"
        goToModel(npc, 4)
        while isTeleporting and Settings.Running do task.wait(0.04) end
        if prompt then
            interactPrompt(prompt)
            task.wait(0.45)
        end
        if acceptQuest() then
            return true
        end
    end

    -- Do not leave the UI reporting "Taking quest" forever.
    Settings.Step = "Waiting for quest"
    return false
end

local function farmTarget()
    local target = Settings.Target
    if not target or not aliveNPC(target) then
        Settings.Target = findTarget()
        target = Settings.Target
        if not target then
            Settings.Step = "Searching target"
            return
        end
        Settings.TargetRoot = rootOf(target)
        goToModel(target, Settings.EngageDistance)
        while isTeleporting and Settings.Running do task.wait(0.04) end
    end

    if not aliveNPC(target) then
        Settings.Target = nil
        Settings.TargetRoot = nil
        return
    end

    Settings.TargetRoot = rootOf(target)
    Settings.Step = "Farming " .. target.Name
    startHover()
    doM1()
    doSkills()
end

local function refreshNPCList()
    for _, b in ipairs(npcButtons) do b:Destroy() end
    table.clear(npcButtons)

    local list = {}
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Model") and aliveNPC(object) then
            table.insert(list, object)
        end
    end
    table.sort(list, function(a, b) return a.Name:lower() < b.Name:lower() end)

    UI.NPCList.CanvasSize = UDim2.new(0, 0, 0, #list * 29)
    for index, npc in ipairs(list) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -8, 0, 27)
        button.BackgroundColor3 = Color3.fromRGB(44, 44, 55)
        button.BorderSizePixel = 0
        button.Text = npc.Name
        button.TextColor3 = Color3.fromRGB(235, 235, 240)
        button.Font = Enum.Font.Gotham
        button.TextSize = 12
        button.LayoutOrder = index
        button.Parent = UI.NPCList
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 6)
        c.Parent = button

        button.Activated:Connect(function()
            selectedNPC = npc
            UI.NPCDrop.Text = npc.Name
            UI.NPCList.Visible = false
        end)
        table.insert(npcButtons, button)
    end
end

local function corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
end

local function button(parent, name, text, y)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(1, 0, 0, 34)
    b.Position = UDim2.fromOffset(0, y)
    b.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
    b.BorderSizePixel = 0
    b.AutoButtonColor = true
    b.Text = text
    b.TextColor3 = Color3.fromRGB(238, 238, 243)
    b.Font = Enum.Font.GothamSemibold
    b.TextSize = 12
    b.Parent = parent
    corner(b, 7)
    return b
end

local function makeUI()
    local old = playerGui:FindFirstChild("MyAutoFarmUI")
    if old then old:Destroy() end

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
    title.Size = UDim2.new(1, -58, 1, 0)
    title.Position = UDim2.fromOffset(14, 0)
    title.BackgroundTransparency = 1
    title.Text = "MyAutoFarm • Quest Farm"
    title.TextColor3 = Color3.fromRGB(245, 245, 250)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 17
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header

    local minimize = Instance.new("TextButton")
    minimize.Size = UDim2.fromOffset(34, 30)
    minimize.Position = UDim2.new(1, -40, 0, 8)
    minimize.BackgroundTransparency = 1
    minimize.Text = "—"
    minimize.Font = Enum.Font.GothamBold
    minimize.TextSize = 20
    minimize.TextColor3 = Color3.fromRGB(230, 230, 235)
    minimize.Parent = header

    local content = Instance.new("Frame")
    content.BackgroundTransparency = 1
    content.Position = UDim2.fromOffset(12, 56)
    content.Size = UDim2.new(1, -24, 1, -66)
    content.Parent = main

    local function label(y, size)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, 0, 0, size)
        l.Position = UDim2.fromOffset(0, y)
        l.BackgroundTransparency = 1
        l.Font = Enum.Font.Gotham
        l.TextSize = 11
        l.TextColor3 = Color3.fromRGB(178, 178, 190)
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = content
        return l
    end

    UI.Status = label(0, 24)
    UI.Quest = label(24, 21)
    UI.Target = label(45, 21)
    UI.Progress = label(66, 21)

    UI.Toggle = button(content, "Toggle", "Farming: OFF [E]", 94)
    UI.Repeat = button(content, "Repeat", "Auto Repeat: ON", 134)
    UI.Position = button(content, "Position", "Position: ABOVE", 174)
    UI.Skills = button(content, "Skills", "Skills: ON", 214)

    local skillFrame = Instance.new("Frame")
    skillFrame.BackgroundTransparency = 1
    skillFrame.Size = UDim2.new(1, 0, 0, 30)
    skillFrame.Position = UDim2.fromOffset(0, 254)
    skillFrame.Parent = content

    for index, skill in ipairs(Skills) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.2, -4, 1, 0)
        b.Position = UDim2.new((index - 1) * 0.2, 2, 0, 0)
        b.BackgroundColor3 = skill.Enabled and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
        b.BorderSizePixel = 0
        b.Text = skill.Name
        b.TextColor3 = Color3.fromRGB(238, 238, 243)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 12
        b.Parent = skillFrame
        corner(b, 6)
        b.Activated:Connect(function()
            skill.Enabled = not skill.Enabled
            b.BackgroundColor3 = skill.Enabled and Color3.fromRGB(61, 118, 222) or Color3.fromRGB(36, 36, 45)
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
        if list.Visible then refreshNPCList() end
    end)

    tp.Activated:Connect(function()
        if selectedNPC and aliveNPC(selectedNPC) then
            goToModel(selectedNPC, 3)
        end
    end)

    UI.Toggle.Activated:Connect(function()
        Settings.Running = not Settings.Running
        if Settings.Running then
            startedAt = os.clock()
            Settings.Step = "Starting"
            UI.Toggle.Text = "Farming: ON [E]"
            UI.Toggle.BackgroundColor3 = Color3.fromRGB(38, 107, 68)
        else
            Settings.Step = "Stopped"
            stopHover()
            UI.Toggle.Text = "Farming: OFF [E]"
            UI.Toggle.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
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
        local any = false
        for _, skill in ipairs(Skills) do any = any or skill.Enabled end
        local enabled = not any
        for _, skill in ipairs(Skills) do skill.Enabled = enabled end
        UI.Skills.Text = "Skills: " .. (enabled and "ALL ON" or "ALL OFF")
    end)

    height.FocusLost:Connect(function()
        local value = tonumber(height.Text:match("[-%d%.]+"))
        if value then Settings.Height = math.clamp(value, Settings.HeightMin, Settings.HeightMax) end
        height.Text = "Height: " .. tostring(Settings.Height)
    end)

    minimize.Activated:Connect(function()
        minimized = not minimized
        content.Visible = not minimized
        main.Size = minimized and UDim2.fromOffset(365, 46) or UDim2.fromOffset(365, 500)
        minimize.Text = minimized and "+" or "—"
    end)

    local dragging = false
    local dragStart = nil
    local startPosition = nil
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPosition = main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
        end
    end)
end

makeUI()

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end

    if input.KeyCode == Enum.KeyCode.E then
        Settings.Running = not Settings.Running
        if Settings.Running then
            startedAt = os.clock()
            Settings.Step = "Starting"
            UI.Toggle.Text = "Farming: ON [E]"
            UI.Toggle.BackgroundColor3 = Color3.fromRGB(38, 107, 68)
        else
            Settings.Step = "Stopped"
            UI.Toggle.Text = "Farming: OFF [E]"
            UI.Toggle.BackgroundColor3 = Color3.fromRGB(36, 36, 45)
            stopHover()
        end
    elseif input.KeyCode == Enum.KeyCode.K and UI.Main then
        UI.Main.Visible = not UI.Main.Visible
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
    task.wait(0.6)
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

task.spawn(function()
    while UI.Gui and UI.Gui.Parent do
        task.wait(0.03)

        if UI.Status then
            local elapsed = Settings.Running and math.max(0, os.clock() - startedAt) or 0
            local h = math.floor(elapsed / 3600)
            local m = math.floor((elapsed % 3600) / 60)
            local s = math.floor(elapsed % 60)
            UI.Status.Text = string.format("%s  •  %s  •  %02d:%02d:%02d", Settings.Running and "RUNNING" or "STOPPED", Settings.Step, h, m, s)
            UI.Quest.Text = "Quest: " .. (Settings.QuestId and tostring(Settings.QuestId) or "none")
            UI.Target.Text = "Target: " .. (Settings.Target and Settings.Target.Name or Settings.TargetName or Settings.TargetId or "none")
            UI.Progress.Text = string.format("Progress: %d / %d", Settings.Progress, Settings.Required)
        end
    end
end)

while UI.Gui and UI.Gui.Parent do
    if Settings.Running then
        local ok, err = pcall(function()
            local c, h, r = character()
            if not c or not h or not r then
                stopHover()
                Settings.Step = "Waiting for character"
                return
            end

            readContract(false)

            if not Settings.TargetName then
                Settings.TargetName = scanQuestText()
            end

            if questComplete() then
                stopHover()
                if Settings.AutoClaim then claimQuest() end
                task.wait(Settings.ClaimDelay)

                Settings.Quest = nil
                Settings.QuestId = nil
                Settings.DefinitionId = nil
                Settings.TargetId = nil
                Settings.TargetName = nil
                Settings.Progress = 0
                Settings.Required = 0

                if Settings.AutoRepeat then
                    Settings.Step = "Starting next quest"
                else
                    Settings.Running = false
                    Settings.Step = "Finished"
                end
            else
                if ensureQuest() then
                    if Settings.Target and not aliveNPC(Settings.Target) then
                        Settings.Target = nil
                        Settings.TargetRoot = nil
                    end
                    farmTarget()
                end
            end
        end)

        if not ok then
            Settings.Step = "Recovered: " .. tostring(err)
            stopHover()
        end
    end

    task.wait(Settings.SearchInterval)
end