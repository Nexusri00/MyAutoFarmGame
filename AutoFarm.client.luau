-- MyAutoFarmGame | Contract Quest Auto Farm
-- Clean Luau version. No bytecode decoding.
-- Flow: get quest state -> accept -> find target -> teleport -> M1 -> skills -> claim -> repeat.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
    return
end

local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
if not Remotes then
    return
end

local RF_GetState = Remotes:FindFirstChild("RF_ContractGetState")
local RF_Accept = Remotes:FindFirstChild("RF_ContractAccept")
local RF_Claim = Remotes:FindFirstChild("RF_ContractClaim")
local RF_Abandon = Remotes:FindFirstChild("RF_ContractAbandon")
local InputRemote = Remotes:FindFirstChild("Input")

local Config = {
    Enabled = false,
    AutoAccept = true,
    AutoClaim = true,
    AutoM1 = true,
    AutoSkills = true,
    Teleport = true,
    AttackDistance = 8,
    AttackDelay = 0.12,
    SkillDelay = 0.35,
    SearchRadius = 5000,
    Keybind = Enum.KeyCode.F6,
    UISKeybind = Enum.KeyCode.RightShift,
}

local State = {
    Character = nil,
    Humanoid = nil,
    Root = nil,
    Quest = nil,
    Target = nil,
    NPC = nil,
    LastM1 = 0,
    LastSkill = 0,
    Step = "Idle",
    Status = "OFF",
    Gui = nil,
    StatusLabel = nil,
}

local SkillKeys = {
    Enum.KeyCode.Z,
    Enum.KeyCode.X,
    Enum.KeyCode.C,
    Enum.KeyCode.V,
    Enum.KeyCode.B,
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
    State.NPC = nil
    task.wait(0.5)
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

local function isAlive(model)
    local humanoid = getHumanoid(model)
    local root = getRoot(model)
    return model and humanoid and humanoid.Health > 0 and root ~= nil
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

local function teleportToModel(model, distance)
    if not Config.Teleport or not State.Root then
        return
    end

    local root = getRoot(model)
    if not root then
        return
    end

    local offset = root.CFrame.LookVector * (distance or 5)
    State.Root.CFrame = CFrame.new(root.Position - offset + Vector3.new(0, 2, 0))
end

local function invoke(remote, ...)
    if not remote or not remote:IsA("RemoteFunction") then
        return false, nil
    end

    local args = table.pack(...)
    local ok, result = pcall(function()
        return remote:InvokeServer(table.unpack(args, 1, args.n))
    end)

    return ok, result
end

local function callEvent(remote, ...)
    if not remote or not remote:IsA("RemoteEvent") then
        return false
    end

    local args = table.pack(...)
    local ok = pcall(function()
        remote:FireServer(table.unpack(args, 1, args.n))
    end)

    return ok
end

local function isNumber(value)
    return type(value) == "number"
end

local function cleanName(value)
    if type(value) ~= "string" then
        return nil
    end

    value = value:gsub("^%s+", ""):gsub("%s+$", "")
    if value == "" then
        return nil
    end

    return value
end

local function collectQuestValues(value, found, seen)
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

        if type(child) == "string" then
            local text = cleanName(child)

            if text then
                if not found.TargetName and (string.find(keyName, "target", 1, true) or string.find(keyName, "enemy", 1, true) or string.find(keyName, "mob", 1, true) or string.find(keyName, "npc", 1, true)) then
                    found.TargetName = text
                elseif not found.ContractId and (string.find(keyName, "id", 1, true) or string.find(keyName, "contract", 1, true) or string.find(keyName, "quest", 1, true)) then
                    found.ContractId = text
                end
            end
        elseif isNumber(child) then
            if string.find(keyName, "required", 1, true) or string.find(keyName, "goal", 1, true) or string.find(keyName, "amount", 1, true) or string.find(keyName, "count", 1, true) or string.find(keyName, "total", 1, true) then
                if child > 0 and not found.Required then
                    found.Required = child
                end
            elseif string.find(keyName, "progress", 1, true) or string.find(keyName, "current", 1, true) or string.find(keyName, "killed", 1, true) or string.find(keyName, "done", 1, true) then
                if child >= 0 and not found.Progress then
                    found.Progress = child
                end
            end
        elseif type(child) == "table" then
            collectQuestValues(child, found, seen)
        end
    end
end

local function readQuestState()
    local found = {}

    if RF_GetState then
        local ok, result = invoke(RF_GetState)
        if ok then
            State.Quest = result
            collectQuestValues(result, found)
        end
    end

    if not found.TargetName and type(State.Quest) == "table" then
        local textPieces = {}
        local function scanText(value, seen)
            if type(value) ~= "table" then
                if type(value) == "string" then
                    table.insert(textPieces, value)
                end
                return
            end
            seen = seen or {}
            if seen[value] then
                return
            end
            seen[value] = true
            for _, child in pairs(value) do
                scanText(child, seen)
            end
        end
        scanText(State.Quest)

        local combined = table.concat(textPieces, " ")
        local target = combined:match("[Dd]efeat%s+%d+%s+([%a][%w%s%-]+)")
        target = target or combined:match("[Kk]ill%s+%d+%s+([%a][%w%s%-]+)")
        State.QuestText = combined
        found.TargetName = cleanName(target)
    end

    return found
end

local function getQuestId(found)
    if found and found.ContractId then
        return found.ContractId
    end

    if type(State.Quest) ~= "table" then
        return nil
    end

    local names = {"Id", "ID", "ContractId", "ContractID", "QuestId", "QuestID", "Key", "Name"}

    for _, name in ipairs(names) do
        local value = State.Quest[name]
        if value ~= nil then
            return value
        end
    end

    return nil
end

local function acceptQuest(found)
    if not Config.AutoAccept or not RF_Accept then
        return false
    end

    local questId = getQuestId(found)

    if questId ~= nil then
        local ok = invoke(RF_Accept, questId)
        if ok then
            return true
        end
    end

    local ok = invoke(RF_Accept)
    return ok
end

local function claimQuest(found)
    if not Config.AutoClaim or not RF_Claim then
        return false
    end

    local questId = getQuestId(found)

    if questId ~= nil then
        local ok = invoke(RF_Claim, questId)
        if ok then
            return true
        end
    end

    local ok = invoke(RF_Claim)
    return ok
end

local function modelNameMatches(model, wanted)
    if not wanted or not isAlive(model) then
        return false
    end

    if Players:GetPlayerFromCharacter(model) then
        return false
    end

    local a = string.lower(model.Name)
    local b = string.lower(wanted)

    return a == b or string.find(a, b, 1, true) ~= nil or string.find(b, a, 1, true) ~= nil
end

local function findQuestTarget(targetName)
    if not targetName then
        return nil
    end

    local best = nil
    local bestDistance = math.huge

    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and modelNameMatches(model, targetName) then
            local d = distanceTo(model)
            if d < bestDistance and d <= Config.SearchRadius then
                best = model
                bestDistance = d
            end
        end
    end

    return best
end

local function findQuestNPC()
    local best = nil
    local bestPrompt = nil
    local bestDistance = math.huge

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ProximityPrompt") and object.Enabled then
            local text = string.lower(object.Name .. " " .. object.ActionText .. " " .. object.ObjectText)
            local useful = string.find(text, "quest", 1, true) ~= nil
                or string.find(text, "mission", 1, true) ~= nil
                or string.find(text, "contract", 1, true) ~= nil
                or string.find(text, "accept", 1, true) ~= nil
                or string.find(text, "talk", 1, true) ~= nil
                or string.find(text, "claim", 1, true) ~= nil
                or string.find(text, "complete", 1, true) ~= nil

            if useful then
                local parent = object.Parent
                local model = parent and parent:FindFirstAncestorOfClass("Model")
                if model then
                    local root = getRoot(model)
                    if root and State.Root then
                        local d = (root.Position - State.Root.Position).Magnitude
                        if d < bestDistance then
                            bestDistance = d
                            best = model
                            bestPrompt = object
                        end
                    end
                end
            end
        end
    end

    return best, bestPrompt
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

local function useTool()
    if not State.Character or not State.Humanoid then
        return false
    end

    local equipped = State.Character:FindFirstChildOfClass("Tool")
    if equipped then
        pcall(function()
            equipped:Activate()
        end)
        return true
    end

    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if not backpack then
        return false
    end

    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local name = string.lower(tool.Name)
            if not string.find(name, "rod", 1, true) and not string.find(name, "fishing", 1, true) then
                pcall(function()
                    State.Humanoid:EquipTool(tool)
                end)
                return true
            end
        end
    end

    return false
end

local function m1()
    if not Config.AutoM1 then
        return
    end

    if os.clock() - State.LastM1 < Config.AttackDelay then
        return
    end

    State.LastM1 = os.clock()
    useTool()

    local VirtualInputManager = game:GetService("VirtualInputManager")
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)
end

local function useSkills()
    if not Config.AutoSkills or os.clock() - State.LastSkill < Config.SkillDelay then
        return
    end

    State.LastSkill = os.clock()

    if InputRemote and InputRemote:IsA("RemoteEvent") then
        for _, key in ipairs(SkillKeys) do
            local keyName = key.Name
            callEvent(InputRemote, keyName, true)
            callEvent(InputRemote, keyName, false)
        end
    end
end

local function attackTarget(target)
    if not target then
        return
    end

    State.Step = "Farming " .. target.Name

    local started = os.clock()
    while Config.Enabled and isAlive(target) and os.clock() - started < 90 do
        if not refreshCharacter() then
            task.wait(0.2)
        else
            local root = getRoot(target)
            if not root then
                break
            end

            local distance = (root.Position - State.Root.Position).Magnitude
            if Config.Teleport and distance > Config.AttackDistance + 3 then
                teleportToModel(target, Config.AttackDistance)
            end

            m1()
            useSkills()
        end

        task.wait(0.03)
    end
end

local function questFinished(found)
    if not found then
        return false
    end

    if found.Required and found.Progress then
        return found.Progress >= found.Required
    end

    local quest = State.Quest
    if type(quest) == "table" then
        local values = {"Completed", "Complete", "Finished", "Claimable", "ReadyToClaim"}
        for _, key in ipairs(values) do
            if quest[key] == true then
                return true
            end
        end
    end

    return false
end

local function doQuestCycle()
    State.Step = "Reading quest"
    local found = readQuestState()

    if not found.TargetName then
        State.Step = "Finding quest NPC"
        local npc, prompt = findQuestNPC()
        State.NPC = npc

        if npc then
            teleportToModel(npc, 4)
            task.wait(0.25)

            if prompt then
                firePrompt(prompt)
            end

            task.wait(0.6)
            found = readQuestState()
        end
    end

    if not found.TargetName then
        State.Step = "No quest detected"
        return
    end

    State.Step = "Accepting quest"
    acceptQuest(found)
    task.wait(0.4)

    found = readQuestState()

    if not found.TargetName then
        State.Step = "Quest target unknown"
        return
    end

    while Config.Enabled do
        found = readQuestState()

        if questFinished(found) then
            break
        end

        local target = findQuestTarget(found.TargetName)
        if not target then
            State.Step = "Waiting for " .. tostring(found.TargetName)
            task.wait(0.5)
        else
            State.Target = target
            teleportToModel(target, Config.AttackDistance)
            attackTarget(target)
            task.wait(0.15)
        end
    end

    if Config.Enabled and Config.AutoClaim then
        State.Step = "Claiming quest"
        local latest = readQuestState()
        local claimed = claimQuest(latest)

        if not claimed then
            local npc, prompt = findQuestNPC()
            if npc then
                State.NPC = npc
                teleportToModel(npc, 4)
                task.wait(0.25)
                if prompt then
                    firePrompt(prompt)
                end
            end
        end

        task.wait(0.5)
    end
end

local function makeButton(parent, text)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 34)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 13
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button

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
    frame.Size = UDim2.fromOffset(330, 275)
    frame.Position = UDim2.new(0, 20, 0.5, -138)
    frame.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 10)
    frameCorner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 32)
    title.Position = UDim2.fromOffset(10, 8)
    title.BackgroundTransparency = 1
    title.Text = "QUEST AUTO FARM"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 19
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    State.StatusLabel = Instance.new("TextLabel")
    State.StatusLabel.Size = UDim2.new(1, -20, 0, 78)
    State.StatusLabel.Position = UDim2.fromOffset(10, 45)
    State.StatusLabel.BackgroundTransparency = 1
    State.StatusLabel.Font = Enum.Font.Gotham
    State.StatusLabel.TextSize = 11
    State.StatusLabel.TextColor3 = Color3.fromRGB(190, 190, 200)
    State.StatusLabel.TextWrapped = true
    State.StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    State.StatusLabel.TextYAlignment = Enum.TextYAlignment.Top
    State.StatusLabel.Parent = frame

    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, -20, 0, 135)
    box.Position = UDim2.fromOffset(10, 125)
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

    local m1Button = makeButton(box, "AUTO M1: ON")
    m1Button.MouseButton1Click:Connect(function()
        Config.AutoM1 = not Config.AutoM1
        m1Button.Text = "AUTO M1: " .. (Config.AutoM1 and "ON" or "OFF")
    end)

    local skillsButton = makeButton(box, "AUTO SKILLS: ON")
    skillsButton.MouseButton1Click:Connect(function()
        Config.AutoSkills = not Config.AutoSkills
        skillsButton.Text = "AUTO SKILLS: " .. (Config.AutoSkills and "ON" or "OFF")
    end)

    local tpButton = makeButton(box, "TELEPORT: ON")
    tpButton.MouseButton1Click:Connect(function()
        Config.Teleport = not Config.Teleport
        tpButton.Text = "TELEPORT: " .. (Config.Teleport and "ON" or "OFF")
    end)

    local hideButton = makeButton(box, "HIDE UI: RIGHT SHIFT")
    hideButton.MouseButton1Click:Connect(function()
        gui.Enabled = false
    end)

    local dragging = false
    local dragStart = nil
    local startPos = nil

    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

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
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then
            return
        end

        if input.KeyCode == Config.UISKeybind then
            gui.Enabled = not gui.Enabled
        elseif input.KeyCode == Config.Keybind then
            Config.Enabled = not Config.Enabled
            farmButton.Text = "AUTO FARM: " .. (Config.Enabled and "ON" or "OFF")
        end
    end)
end

task.spawn(function()
    LocalPlayer.Idled:Connect(function()
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end)
end)

makeGui()
refreshCharacter()

while task.wait(0.15) do
    if State.StatusLabel then
        State.StatusLabel.Text = string.format(
            "Status: %s\nStep: %s\nQuest target: %s\nEnemy: %s",
            Config.Enabled and "RUNNING" or "STOPPED",
            State.Step,
            State.Quest and "active" or "none",
            State.Target and State.Target.Name or "none"
        )
    end

    if Config.Enabled and refreshCharacter() then
        doQuestCycle()
    end
end