-- MyAutoFarmGame - stable client controller
-- Fishing intentionally omitted.
-- Executor/LocalScript compatible. RightShift toggles the UI, F6 toggles the farm.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then return end

local Config = {
    Enabled = false,
    AutoAttack = true,
    AutoCollect = true,
    AutoSell = false,
    AutoEquip = true,
    AntiAFK = true,
    Range = 150,
    AttackDistance = 10,
    AttackDelay = 0.25,
    CollectRange = 30,
    PromptCooldown = 0.35,
    SellInterval = 8,
}

local State = {
    Character = nil,
    Humanoid = nil,
    Root = nil,
    Target = nil,
    LastAttack = 0,
    LastPrompt = 0,
    LastSell = 0,
    Gui = nil,
}

local function refreshCharacter()
    local character = LocalPlayer.Character
    if not character then return false end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root or humanoid.Health <= 0 then return false end
    State.Character = character
    State.Humanoid = humanoid
    State.Root = root
    return true
end

LocalPlayer.CharacterAdded:Connect(function(character)
    State.Target = nil
    character:WaitForChild("Humanoid", 10)
    character:WaitForChild("HumanoidRootPart", 10)
    task.wait(0.25)
    refreshCharacter()
end)

local function rootOf(model)
    if not model or not model:IsA("Model") then return nil end
    local root = model:FindFirstChild("HumanoidRootPart")
    if root and root:IsA("BasePart") then return root end
    if model.PrimaryPart then return model.PrimaryPart end
    return model:FindFirstChildWhichIsA("BasePart")
end

local function humanoidOf(model)
    return model and model:FindFirstChildOfClass("Humanoid")
end

local function alive(model)
    local hum = humanoidOf(model)
    return model and model:IsA("Model") and hum and hum.Health > 0 and rootOf(model) ~= nil
end

local function isOtherPlayer(model)
    return model and model:IsA("Model") and Players:GetPlayerFromCharacter(model) ~= nil
end

local function enemyScore(model)
    if not alive(model) or isOtherPlayer(model) then return -math.huge end

    local hum = humanoidOf(model)
    if not hum then return -math.huge end

    local n = string.lower(model.Name)
    if n == "camera" or n == "dummy" or n == "target" or n == "mannequin" then
        return -math.huge
    end

    local score = 0
    if model:GetAttribute("Enemy") == true then score += 1000 end
    if model:GetAttribute("NPC") == true then score += 500 end
    for _, word in ipairs({"enemy", "npc", "mob", "monster", "boss", "bandit", "demon", "pirate", "soldier"}) do
        if string.find(n, word, 1, true) then score += 100 end end
    if model:FindFirstChild("Head") then score += 10 end
    return score
end

local function findTarget()
    if not State.Root then return nil end
    local best, bestDistance, bestScore = nil, Config.Range, -math.huge

    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") then
            local score = enemyScore(obj)
            if score > -math.huge then
                local root = rootOf(obj)
                if root then
                    local distance = (root.Position - State.Root.Position).Magnitude
                    if distance <= bestDistance and score >= bestScore then
                        best = obj
                        bestDistance = distance
                        bestScore = score
                    end
                end
            end
        end
    end

    if best then return best end

    -- Some games place NPCs inside folders/models instead of directly in Workspace.
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Parent ~= workspace and enemyScore(obj) > -math.huge then
            local root = rootOf(obj)
            if root then
                local distance = (root.Position - State.Root.Position).Magnitude
                if distance <= bestDistance then
                    best = obj
                    bestDistance = distance
                end
            end
        end
    end
    return best
end

local function equipTool()
    if not Config.AutoEquip or not State.Humanoid or not State.Character then return nil end
    local equipped = State.Character:FindFirstChildOfClass("Tool")
    if equipped then return equipped end

    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if not backpack then return nil end

    local chosen = nil
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            local n = string.lower(item.Name)
            if not string.find(n, "rod", 1, true) and not string.find(n, "fishing", 1, true) then
                chosen = item
                break
            end
        end
    end

    if chosen then pcall(function() State.Humanoid:EquipTool(chosen) end) end
    return chosen
end

local function attack()
    if not Config.AutoAttack then return end
    if os.clock() - State.LastAttack < Config.AttackDelay then return end
    State.LastAttack = os.clock()

    local tool = equipTool()
    if tool then
        pcall(function() tool:Activate() end)
    end

    -- Also support games where the normal left mouse input is the attack trigger.
    local vim = game:GetService("VirtualInputManager")
    if vim then
        pcall(function()
            vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end)
    end
end

local function moveToTarget(target)
    if not State.Root or not State.Humanoid then return end
    local targetRoot = rootOf(target)
    if not targetRoot then return end
    local delta = State.Root.Position - targetRoot.Position
    local distance = delta.Magnitude
    if distance <= Config.AttackDistance then return end
    local direction = distance > 0.01 and delta.Unit or Vector3.new(0, 0, 1)
    State.Humanoid:MoveTo(targetRoot.Position + direction * Config.AttackDistance)
end

local function promptPart(prompt)
    local p = prompt.Parent
    if not p then return nil end
    if p:IsA("BasePart") then return p end
    if p:IsA("Attachment") and p.Parent and p.Parent:IsA("BasePart") then return p.Parent end
    if p:IsA("Model") then return rootOf(p) end
    return nil
end

local function firePrompt(prompt)
    if not prompt or not prompt.Enabled then return false end
    if os.clock() - State.LastPrompt < Config.PromptCooldown then return false end
    State.LastPrompt = os.clock()
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

local function collect()
    if not Config.AutoCollect or not State.Root then return end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            local part = promptPart(obj)
            if part and (part.Position - State.Root.Position).Magnitude <= Config.CollectRange then
                local n = string.lower(obj.Name .. " " .. (obj.ActionText or ""))
                if string.find(n, "sell", 1, true) == nil then
                    firePrompt(obj)
                end
            end
        end
    end
end

local function sell()
    if not Config.AutoSell or not State.Root then return end
    if os.clock() - State.LastSell < Config.SellInterval then return end
    State.LastSell = os.clock()

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            local part = promptPart(obj)
            local text = string.lower(obj.Name .. " " .. (obj.ActionText or "") .. " " .. (obj.ObjectText or ""))
            if part and (part.Position - State.Root.Position).Magnitude <= Config.CollectRange + 10 and string.find(text, "sell", 1, true) then
                firePrompt(obj)
            end
        end
    end
end

local function antiAfk()
    if not Config.AntiAFK then return end
    pcall(function()
        LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end)
end

local function destroyOldGui()
    local names = {"MyAutoFarmGUI", "MyAutoFarm", "AutoFarmGUI"}
    for _, name in ipairs(names) do
        for _, parent in ipairs({LocalPlayer:FindFirstChildOfClass("PlayerGui"), game:GetService("CoreGui")}) do
            if parent then
                local old = parent:FindFirstChild(name)
                if old then pcall(function() old:Destroy() end) end
            end
        end
    end
end

destroyOldGui()

local function guiParent()
    local ok, hui = pcall(function() return gethui and gethui() end)
    if ok and hui then return hui end
    local pg = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if pg then return pg end
    return game:GetService("CoreGui")
end

local function makeGui()
    local parent = guiParent()
    local gui = Instance.new("ScreenGui")
    gui.Name = "MyAutoFarmGUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = parent
    State.Gui = gui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(330, 390)
    frame.Position = UDim2.new(0, 20, 0.5, -195)
    frame.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
    frame.BorderSizePixel = 0
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Transparency = 0.55
    stroke.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -24, 0, 36)
    title.Position = UDim2.fromOffset(12, 8)
    title.BackgroundTransparency = 1
    title.Text = "MY AUTO FARM"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Parent = frame

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, -24, 0, 45)
    status.Position = UDim2.fromOffset(12, 43)
    status.BackgroundTransparency = 1
    status.Font = Enum.Font.Gotham
    status.TextSize = 12
    status.TextWrapped = true
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.TextColor3 = Color3.fromRGB(185, 185, 195)
    status.Parent = frame

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -24, 1, -98)
    content.Position = UDim2.fromOffset(12, 94)
    content.BackgroundTransparency = 1
    content.Parent = frame

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 7)
    layout.Parent = content

    local buttons = {}
    local function addToggle(label, key)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, 0, 0, 42)
        b.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
        b.BorderSizePixel = 0
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 13
        b.TextColor3 = Color3.new(1, 1, 1)
        b.AutoButtonColor = true
        b.Parent = content
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
        buttons[key] = b
        local function refresh()
            b.Text = label .. ": " .. (Config[key] and "ON" or "OFF")
        end
        refresh()
        b.MouseButton1Click:Connect(function()
            Config[key] = not Config[key]
            refresh()
        end)
    end

    addToggle("AUTO FARM", "Enabled")
    addToggle("AUTO ATTACK", "AutoAttack")
    addToggle("AUTO COLLECT", "AutoCollect")
    addToggle("AUTO SELL", "AutoSell")
    addToggle("AUTO EQUIP", "AutoEquip")
    addToggle("ANTI AFK", "AntiAFK")

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(1, 0, 0, 38)
    close.BackgroundColor3 = Color3.fromRGB(50, 50, 62)
    close.BorderSizePixel = 0
    close.Text = "HIDE UI  •  RightShift to show"
    close.Font = Enum.Font.GothamMedium
    close.TextSize = 12
    close.TextColor3 = Color3.new(1, 1, 1)
    close.Parent = content
    Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)
    close.MouseButton1Click:Connect(function() gui.Enabled = false end)

    local dragging = false
    local dragStart, startPos
    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    task.spawn(function()
        while gui.Parent do
            local target = State.Target
            local targetText = target and target.Name or "none"
            local hp = State.Humanoid and math.floor(State.Humanoid.Health) or 0
            status.Text = string.format("Farm: %s   |   Target: %s\nHP: %d   |   Range: %d   |   F6 toggle", Config.Enabled and "ON" or "OFF", targetText, hp, Config.Range)
            task.wait(0.15)
        end
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            gui.Enabled = not gui.Enabled
        elseif input.KeyCode == Enum.KeyCode.F6 then
            Config.Enabled = not Config.Enabled
            if buttons.Enabled then buttons.Enabled.Text = "AUTO FARM: " .. (Config.Enabled and "ON" or "OFF") end
        end
    end)
end

makeGui()
antiAfk()
refreshCharacter()

RunService.Heartbeat:Connect(function()
    if not refreshCharacter() then
        State.Target = nil
        return
    end
    if not Config.Enabled then return end

    local target = State.Target
    if not target or not target.Parent or not alive(target) then
        target = findTarget()
        State.Target = target
    end

    if target and State.Root then
        local targetRoot = rootOf(target)
        if targetRoot then
            local distance = (targetRoot.Position - State.Root.Position).Magnitude
            if distance > Config.Range then
                State.Target = findTarget()
            else
                moveToTarget(target)
                if distance <= Config.AttackDistance + 4 then attack() end
            end
        else
            State.Target = nil
        end
    end

    collect()
    sell()
end)

print("[MyAutoFarm] Loaded successfully. RightShift = UI, F6 = farm toggle.")
