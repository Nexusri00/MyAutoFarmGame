-- MyAutoFarmGame | Quest Auto Farm
-- Uses the game's Contract state plus the real default combat keybinds.
-- No bytecode decoding and no guessed quest UI text as the primary state source.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    return
end

local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
if not Remotes then
    return
end

local RFGetState = Remotes:FindFirstChild("RF_ContractGetState")
local RFAccept = Remotes:FindFirstChild("RF_ContractAccept")
local RFClaim = Remotes:FindFirstChild("RF_ContractClaim")

local Config = {
    Enabled = false,
    AutoAccept = true,
    AutoClaim = true,
    AutoM1 = true,
    AutoSkills = true,
    Teleport = true,
    AttackDistance = 7,
    M1Delay = 0.13,
    SkillDelay = 0.40,
    SearchRadius = 5000,
    RespawnDelay = 1.5,
}

local State = {
    Character = nil,
    Humanoid = nil,
    Root = nil,
    Quest = nil,
    ActiveId = nil,
    TargetId = nil,
    TargetName = nil,
    Required = 0,
    Progress = 0,
    Target = nil,
    QuestNPC = nil,
    Step = "Idle",
    LastM1 = 0,
    LastSkill = 0,
    LastStateRead = 0,
    Gui = nil,
    Status = nil,
    QuestLabel = nil,
    TargetLabel = nil,
    ProgressLabel = nil,
}

-- The game's Keybinds module identifies these as Skill 1-5.
local SkillKeys = {
    Enum.KeyCode.Z,
    Enum.KeyCode.X,
    Enum.KeyCode.C,
    Enum.KeyCode.V,
    Enum.KeyCode.F,
}

local function refreshCharacter()
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if not character or not humanoid or not root or humanoid.Health <= 0 then
        return false
    end

    State.Character = character
    State.Humanoid = humanoid
    State.Root = root
    return true
end

LocalPlayer.CharacterAdded:Connect(function(character)
    State.Target = nil
    State.QuestNPC = nil
    State.Step = "Respawning"

    task.wait(Config.RespawnDelay)
    character:WaitForChild("Humanoid", 10)
    character:WaitForChild("HumanoidRootPart", 10)
    refreshCharacter()
end)

local function getRoot(model)
    if not model or not model:IsA("Model") then
        return nil
    end

    local root = model:FindFirstChild("HumanoidRootPart")
    if root and root:IsA("BasePart") then
        return root
    end

    if model.PrimaryPart then
        return model.PrimaryPart
    end

    return model:FindFirstChildWhichIsA("BasePart")
end

local function getHumanoid(model)
    if not model then
        return nil
    end
    return model:FindFirstChildOfClass("Humanoid")
end

local function alive(model)
    local humanoid = getHumanoid(model)
    local root = getRoot(model)
    return model ~= nil and humanoid ~= nil and humanoid.Health > 0 and root ~= nil
end

local function distanceTo(model)
    if not State.Root then
        return math.huge
    end

    local root = getRoot(model)
    if not root then
        return math.huge
    end

    return (root.Position - State.Root.Position).Magnitude
end

local function teleportTo(model, distance)
    if not Config.Teleport or not State.Root then
        return
    end

    local root = getRoot(model)
    if not root then
        return
    end

    local amount = distance or 5
    local position = root.Position - root.CFrame.LookVector * amount + Vector3.new(0, 2, 0)
    State.Root.CFrame = CFrame.new(position, root.Position)
end

local function safeInvoke(remote, ...)
    if not remote or not remote:IsA("RemoteFunction") then
        return false, nil
    end

    local args = { ... }
    local count = select("#", ...)
    local ok, result = pcall(function()
        return remote:InvokeServer(table.unpack(args, 1, count))
    end)

    return ok, result
end

local function stringValue(value)
    if type(value) == "string" and value ~= "" then
        return value
    end
    return nil
end

local function numberValue(value)
    if type(value) == "number" then
        return value
    end
    return nil
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
        local keyName = string.lower(tostring(key))

        if type(child) == "table" then
            local childContext = context
            if keyName == "definitionsnapshot" then
                childContext = "definition"
            elseif keyName == "progress" then
                childContext = "progress"
            end
            readContractTable(child, found, seen, childContext)
        elseif type(child) == "string" then
            local text = stringValue(child)

            if keyName == "activeid" or keyName == "active_id" then
                found.ActiveId = text or child
            elseif keyName == "targetid" or keyName == "target_id" then
                found.TargetId = text or child
            elseif keyName == "targetname" or keyName == "target_name" then
                found.TargetName = text
            elseif keyName == "id" and context == "definition" and not found.TargetId then
                found.DefinitionId = text or child
            end
        elseif type(child) == "number" then
            local n = numberValue(child)

            if keyName == "killsdone" or keyName == "killdone" or keyName == "progress" or keyName == "current" then
                if context == "progress" or found.Progress == nil then
                    found.Progress = n
                end
            elseif keyName == "killgoal" or keyName == "required" or keyName == "requiredkills" or keyName == "killcount" then
                if n > 0 then
                    found.Required = n
                end
            end
        elseif type(child) == "boolean" then
            if keyName == "completed" or keyName == "complete" or keyName == "finished" or keyName == "claimable" or keyName == "readytoclaim" then
                if child then
                    found.Completed = true
                end
            end
        end
    end
end

local function readContractState(force)
    if not RFGetState then
        return nil
    end

    if not force and os.clock() - State.LastStateRead < 0.20 then
        return State.Quest
    end

    State.LastStateRead = os.clock()

    local ok, result = safeInvoke(RFGetState)
    if not ok then
        State.Step = "GetState failed"
        return State.Quest
    end

    State.Quest = result

    local found = {
        Progress = nil,
        Required = nil,
        Completed = false,
    }

    readContractTable(result, found, {}, nil)

    if found.ActiveId ~= nil then
        State.ActiveId = found.ActiveId
    end

    if found.TargetId ~= nil then
        State.TargetId = found.TargetId
    end

    if found.TargetName ~= nil then
        State.TargetName = found.TargetName
    end

    if found.Required ~= nil then
        State.Required = found.Required
    end

    if found.Progress ~= nil then
        State.Progress = found.Progress
    end

    if found.Completed then
        State.Progress = math.max(State.Progress, State.Required)
    end

    return result
end

local function findTextTarget()
    local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not playerGui then
        return nil
    end

    local best = nil

    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
            local text = object.Text
            if type(text) == "string" and text ~= "" then
                local lower = string.lower(text)
                if not best and string.find(lower, "defeat", 1, true) then
                    local target = text:match("[Dd]efeat%s+[%d]+%s+([%w%s%-]+)")
                    if target then
                        best = target
                    end
                elseif not best and string.find(lower, "kill", 1, true) then
                    local target = text:match("[Kk]ill%s+[%d]+%s+([%w%s%-]+)")
                    if target then
                        best = target
                    end
                end
            end
        end
    end

    return best
end

local function modelHasTargetId(model, targetId)
    if not targetId then
        return false
    end

    local attributes = {
        "TargetId",
        "TargetID",
        "NPCId",
        "NPCID",
        "Id",
        "ID",
    }

    for _, attribute in ipairs(attributes) do
        local value = model:GetAttribute(attribute)
        if value ~= nil and tostring(value) == tostring(targetId) then
            return true
        end
    end

    return false
end

local function targetMatches(model)
    if not alive(model) or Players:GetPlayerFromCharacter(model) then
        return false
    end

    if State.TargetId and modelHasTargetId(model, State.TargetId) then
        return true
    end

    local targetName = State.TargetName
    if not targetName then
        targetName = findTextTarget()
        if targetName then
            State.TargetName = targetName:gsub("^%s+", ""):gsub("%s+$", "")
        end
    end

    if not targetName then
        return false
    end

    local a = string.lower(model.Name)
    local b = string.lower(targetName)

    return a == b or string.find(a, b, 1, true) ~= nil or string.find(b, a, 1, true) ~= nil
end

local function findTarget()
    local best = nil
    local bestDistance = math.huge

    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and targetMatches(model) then
            local d = distanceTo(model)
            if d < bestDistance and d <= Config.SearchRadius then
                best = model
                bestDistance = d
            end
        end
    end

    return best
end

local function promptPosition(prompt)
    local parent = prompt.Parent
    if not parent then
        return nil
    end

    if parent:IsA("BasePart") then
        return parent.Position
    end

    if parent:IsA("Attachment") and parent.Parent:IsA("BasePart") then
        return parent.WorldPosition
    end

    local model = parent:FindFirstAncestorOfClass("Model")
    local root = getRoot(model)
    return root and root.Position or nil
end

local function findQuestPrompt(claimOnly)
    if not State.Root then
        return nil, nil
    end

    local bestPrompt = nil
    local bestModel = nil
    local bestDistance = math.huge

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ProximityPrompt") and object.Enabled then
            local text = string.lower(object.Name .. " " .. object.ActionText .. " " .. object.ObjectText)
            local useful

            if claimOnly then
                useful = string.find(text, "claim", 1, true) ~= nil
                    or string.find(text, "complete", 1, true) ~= nil
                    or string.find(text, "turn in", 1, true) ~= nil
                    or string.find(text, "reward", 1, true) ~= nil
            else
                useful = string.find(text, "quest", 1, true) ~= nil
                    or string.find(text, "contract", 1, true) ~= nil
                    or string.find(text, "mission", 1, true) ~= nil
                    or string.find(text, "accept", 1, true) ~= nil
                    or string.find(text, "talk", 1, true) ~= nil
            end

            if useful then
                local model = object.Parent and object.Parent:FindFirstAncestorOfClass("Model")
                local root = getRoot(model)
                local position = promptPosition(object)

                if model and root and position then
                    local d = (position - State.Root.Position).Magnitude
                    if d < bestDistance then
                        bestDistance = d
                        bestPrompt = object
                        bestModel = model
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

    local ok = pcall(function()
        if fireproximityprompt then
            fireproximityprompt(prompt)
        else
            prompt:InputHoldBegin()
            task.wait(math.max(prompt.HoldDuration, 0.05))
            prompt:InputHoldEnd()
        end
    end)

    return ok
end

local function clickButton(button)
    if not button then
        return false
    end

    local ok = pcall(function()
        if button.Activate then
            button:Activate()
        else
            local position = button.AbsolutePosition + button.AbsoluteSize / 2
            VirtualInputManager:SendMouseButtonEvent(position.X, position.Y, 0, true, game, 0)
            VirtualInputManager:SendMouseButtonEvent(position.X, position.Y, 0, false, game, 0)
        end
    end)

    return ok
end

local function findContractButton(names)
    local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not playerGui then
        return nil
    end

    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("TextButton") then
            local objectName = string.lower(object.Name)
            local text = string.lower(object.Text)

            for _, wanted in ipairs(names) do
                local w = string.lower(wanted)
                if objectName == w or text == w or string.find(objectName, w, 1, true) or string.find(text, w, 1, true) then
                    if object.Visible and object.AbsoluteSize.X > 0 and object.AbsoluteSize.Y > 0 then
                        return object
                    end
                end
            end
        end
    end

    return nil
end

local function acceptContract()
    State.Step = "Accepting quest"

    -- Prefer the real contract UI. The contract module exposes AcceptButton.
    local button = findContractButton({ "AcceptButton", "Accept" })
    if button and clickButton(button) then
        task.wait(0.5)
        readContractState(true)
        return true
    end

    -- Fallback to the actual Contract remote using an ID obtained from state.
    if RFAccept then
        local candidate = State.ActiveId
        if candidate == nil and type(State.Quest) == "table" then
            candidate = State.Quest.Id or State.Quest.ID or State.Quest.ContractId or State.Quest.ContractID
        end

        if candidate ~= nil then
            local ok = safeInvoke(RFAccept, candidate)
            if ok then
                task.wait(0.5)
                readContractState(true)
                return true
            end
        end
    end

    return false
end

local function claimContract()
    State.Step = "Claiming quest"

    local button = findContractButton({ "ClaimButton", "Claim", "CompleteButton", "Complete" })
    if button and clickButton(button) then
        task.wait(0.5)
        readContractState(true)
        return true
    end

    if RFClaim then
        if State.ActiveId ~= nil then
            local ok = safeInvoke(RFClaim, State.ActiveId)
            if ok then
                task.wait(0.5)
                readContractState(true)
                return true
            end
        end

        local ok = safeInvoke(RFClaim)
        if ok then
            task.wait(0.5)
            readContractState(true)
            return true
        end
    end

    return false
end

local function sendKey(key, down)
    local ok = false

    pcall(function()
        VirtualInputManager:SendKeyEvent(down, key, false, game)
        ok = true
    end)

    if not ok then
        local keyCode = key.Value
        if down and keypress then
            pcall(function()
                keypress(keyCode)
                ok = true
            end)
        elseif not down and keyrelease then
            pcall(function()
                keyrelease(keyCode)
                ok = true
            end)
        end
    end

    return ok
end

local function pressKey(key)
    if not sendKey(key, true) then
        return
    end
    task.wait(0.03)
    sendKey(key, false)
end

local function m1()
    if not Config.AutoM1 then
        return
    end

    if os.clock() - State.LastM1 < Config.M1Delay then
        return
    end

    State.LastM1 = os.clock()

    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)

    local tool = State.Character and State.Character:FindFirstChildOfClass("Tool")
    if tool then
        pcall(function()
            tool:Activate()
        end)
    end
end

local function skills()
    if not Config.AutoSkills then
        return
    end

    if os.clock() - State.LastSkill < Config.SkillDelay then
        return
    end

    State.LastSkill = os.clock()

    for _, key in ipairs(SkillKeys) do
        pressKey(key)
        if not Config.Enabled then
            break
        end
        task.wait(0.05)
    end
end

local function farmTarget(target)
    if not target then
        return
    end

    State.Target = target
    State.Step = "Farming " .. target.Name

    local started = os.clock()
    while Config.Enabled and alive(target) and os.clock() - started < 120 do
        if not refreshCharacter() then
            task.wait(0.2)
        else
            local root = getRoot(target)
            if not root then
                break
            end

            local distance = (root.Position - State.Root.Position).Magnitude
            if distance > Config.AttackDistance + 2 then
                teleportTo(target, Config.AttackDistance)
            end

            m1()
            skills()
            task.wait(0.03)

            if os.clock() - State.LastStateRead > 0.40 then
                readContractState(false)
                if State.Progress >= State.Required and State.Required > 0 then
                    break
                end
            end
        end
    end
end

local function questComplete()
    readContractState(false)

    if State.Required > 0 and State.Progress >= State.Required then
        return true
    end

    return false
end

local function ensureQuest()
    readContractState(true)

    if State.ActiveId ~= nil or State.TargetId ~= nil or State.TargetName ~= nil then
        return true
    end

    if not Config.AutoAccept then
        return false
    end

    local npc, prompt = findQuestPrompt(false)
    if npc then
        State.QuestNPC = npc
        State.Step = "Going to quest NPC"
        teleportTo(npc, 4)
        task.wait(0.30)

        if prompt then
            firePrompt(prompt)
            task.wait(0.50)
        end

        acceptContract()
        task.wait(0.30)
        readContractState(true)
    end

    return State.ActiveId ~= nil or State.TargetId ~= nil or State.TargetName ~= nil
end

local function runCycle()
    State.Target = nil
    State.TargetName = nil
    State.TargetId = nil
    State.Required = 0
    State.Progress = 0

    if not ensureQuest() then
        State.Step = "Quest not found"
        return
    end

    local textTarget = findTextTarget()
    if textTarget and not State.TargetName then
        State.TargetName = textTarget:gsub("^%s+", ""):gsub("%s+$", "")
    end

    while Config.Enabled do
        readContractState(false)

        if questComplete() then
            break
        end

        local target = findTarget()
        if target then
            farmTarget(target)
        else
            State.Step = "Waiting for target"
            task.wait(0.50)
        end
    end

    if Config.Enabled and Config.AutoClaim then
        claimContract()
        task.wait(0.50)
    end
end

local function makeCorner(instance, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = instance
end

local function makeButton(parent, text)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 36)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 12
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.AutoButtonColor = true
    button.Parent = parent
    makeCorner(button, 7)
    return button
end

local function makeGui()
    local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not playerGui then
        return
    end

    local old = playerGui:FindFirstChild("MyAutoFarmQuestGUI")
    if old then
        old:Destroy()
    end

    local gui = Instance.new("ScreenGui")
    gui.Name = "MyAutoFarmQuestGUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = playerGui
    State.Gui = gui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(340, 255)
    frame.Position = UDim2.new(0, 20, 0.5, -128)
    frame.BackgroundColor3 = Color3.fromRGB(16, 16, 21)
    frame.BorderSizePixel = 0
    frame.Parent = gui
    makeCorner(frame, 10)

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Transparency = 0.65
    stroke.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 34)
    title.Position = UDim2.fromOffset(10, 8)
    title.BackgroundTransparency = 1
    title.Text = "QUEST AUTO FARM"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 19
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    State.Status = Instance.new("TextLabel")
    State.Status.Size = UDim2.new(1, -20, 0, 42)
    State.Status.Position = UDim2.fromOffset(10, 44)
    State.Status.BackgroundTransparency = 1
    State.Status.Font = Enum.Font.Gotham
    State.Status.TextSize = 11
    State.Status.TextColor3 = Color3.fromRGB(175, 175, 185)
    State.Status.TextWrapped = true
    State.Status.TextXAlignment = Enum.TextXAlignment.Left
    State.Status.Parent = frame

    State.QuestLabel = Instance.new("TextLabel")
    State.QuestLabel.Size = UDim2.new(1, -20, 0, 24)
    State.QuestLabel.Position = UDim2.fromOffset(10, 84)
    State.QuestLabel.BackgroundTransparency = 1
    State.QuestLabel.Font = Enum.Font.GothamMedium
    State.QuestLabel.TextSize = 11
    State.QuestLabel.TextColor3 = Color3.fromRGB(205, 205, 215)
    State.QuestLabel.TextXAlignment = Enum.TextXAlignment.Left
    State.QuestLabel.Parent = frame

    State.TargetLabel = Instance.new("TextLabel")
    State.TargetLabel.Size = UDim2.new(1, -20, 0, 24)
    State.TargetLabel.Position = UDim2.fromOffset(10, 108)
    State.TargetLabel.BackgroundTransparency = 1
    State.TargetLabel.Font = Enum.Font.GothamMedium
    State.TargetLabel.TextSize = 11
    State.TargetLabel.TextColor3 = Color3.fromRGB(205, 205, 215)
    State.TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
    State.TargetLabel.Parent = frame

    State.ProgressLabel = Instance.new("TextLabel")
    State.ProgressLabel.Size = UDim2.new(1, -20, 0, 24)
    State.ProgressLabel.Position = UDim2.fromOffset(10, 132)
    State.ProgressLabel.BackgroundTransparency = 1
    State.ProgressLabel.Font = Enum.Font.GothamMedium
    State.ProgressLabel.TextSize = 11
    State.ProgressLabel.TextColor3 = Color3.fromRGB(205, 205, 215)
    State.ProgressLabel.TextXAlignment = Enum.TextXAlignment.Left
    State.ProgressLabel.Parent = frame

    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, -20, 0, 96)
    box.Position = UDim2.fromOffset(10, 158)
    box.BackgroundTransparency = 1
    box.Parent = frame

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.Parent = box

    local farmButton = makeButton(box, "AUTO FARM: OFF")
    farmButton.MouseButton1Click:Connect(function()
        Config.Enabled = not Config.Enabled
        farmButton.Text = "AUTO FARM: " .. (Config.Enabled and "ON" or "OFF")
    end)

    local acceptButton = makeButton(box, "AUTO ACCEPT: ON")
    acceptButton.MouseButton1Click:Connect(function()
        Config.AutoAccept = not Config.AutoAccept
        acceptButton.Text = "AUTO ACCEPT: " .. (Config.AutoAccept and "ON" or "OFF")
    end)

    local skillsButton = makeButton(box, "SKILLS: ON | Z X C V F")
    skillsButton.MouseButton1Click:Connect(function()
        Config.AutoSkills = not Config.AutoSkills
        skillsButton.Text = "SKILLS: " .. (Config.AutoSkills and "ON" or "OFF") .. " | Z X C V F"
    end)

    local claimButton = makeButton(box, "AUTO CLAIM: ON")
    claimButton.MouseButton1Click:Connect(function()
        Config.AutoClaim = not Config.AutoClaim
        claimButton.Text = "AUTO CLAIM: " .. (Config.AutoClaim and "ON" or "OFF")
    end)

    local dragging = false
    local dragStart = nil
    local startPosition = nil

    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPosition = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then
            return
        end

        if input.KeyCode == Enum.KeyCode.F6 then
            Config.Enabled = not Config.Enabled
            farmButton.Text = "AUTO FARM: " .. (Config.Enabled and "ON" or "OFF")
        elseif input.KeyCode == Enum.KeyCode.RightShift then
            gui.Enabled = not gui.Enabled
        end
    end)
end

LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

makeGui()
refreshCharacter()

while task.wait(0.15) do
    if State.Status then
        State.Status.Text = string.format(
            "Status: %s | Step: %s",
            Config.Enabled and "RUNNING" or "STOPPED",
            State.Step
        )

        State.QuestLabel.Text = "Contract: " .. (State.ActiveId and tostring(State.ActiveId) or "none")
        State.TargetLabel.Text = "Target: " .. (State.Target and State.Target.Name or State.TargetName or State.TargetId or "none")
        State.ProgressLabel.Text = string.format("Progress: %d / %d", State.Progress, State.Required)
    end

    if Config.Enabled and refreshCharacter() then
        runCycle()
    end
end