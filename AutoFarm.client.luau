--!strict
-- MyAutoFarmGame - rebuilt generic client-side farm controller
-- Fishing intentionally omitted.
-- Designed to avoid guessing RemoteEvent/RemoteFunction argument contracts.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer

local Config = {
    Enabled = false,
    AutoAttack = true,
    AutoCollect = true,
    AutoPrompts = true,
    AutoTarget = true,
    Range = 180,
    AttackDistance = 8,
    RepathDistance = 5,
    AttackInterval = 0.18,
    CollectRange = 35,
    PromptRange = 20,
}

local State = {
    Target = nil :: Model?,
    LastAttack = 0,
    LastMove = 0,
    Character = nil :: Model?,
    Humanoid = nil :: Humanoid?,
    Root = nil :: BasePart?,
}

local function characterReady()
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
    characterReady()
end)

local function getRoot(model: Instance): BasePart?
    if not model:IsA("Model") then return nil end
    local root = model:FindFirstChild("HumanoidRootPart")
    if root and root:IsA("BasePart") then return root end
    local primary = model.PrimaryPart
    if primary then return primary end
    local hrp = model:FindFirstChildWhichIsA("BasePart")
    return hrp
end

local function isAliveModel(model: Instance): boolean
    if not model:IsA("Model") then return false end
    local hum = model:FindFirstChildOfClass("Humanoid")
    return hum ~= nil and hum.Health > 0 and getRoot(model) ~= nil
end

local function isPlayerCharacter(model: Model): boolean
    return Players:GetPlayerFromCharacter(model) ~= nil
end

local function looksLikeEnemy(model: Model): boolean
    if isPlayerCharacter(model) then return false end
    if not isAliveModel(model) then return false end

    local lower = string.lower(model.Name)
    local blacklist = {
        dummy = true,
        rig = true,
        test = true,
        target = true,
        mannequin = true,
    }
    if blacklist[lower] then return false end

    local tags = { "npc", "enemy", "mob", "monster", "boss", "bandit", "soldier", "demon", "pirate" }
    for _, word in ipairs(tags) do
        if string.find(lower, word, 1, true) then
            return true
        end
    end

    local hum = model:FindFirstChildOfClass("Humanoid")
    if hum and (model:GetAttribute("Enemy") == true or model:GetAttribute("NPC") == true) then
        return true
    end

    -- Fallback: NPC-like models with a Humanoid and no player owner.
    return model:FindFirstChild("Head") ~= nil
end

local function findTarget(): Model?
    if not State.Root then return nil end
    local best: Model? = nil
    local bestDistance = Config.Range

    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("Model") and looksLikeEnemy(descendant) then
            local root = getRoot(descendant)
            if root then
                local distance = (root.Position - State.Root.Position).Magnitude
                if distance < bestDistance then
                    local hum = descendant:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        best = descendant
                        bestDistance = distance
                    end
                end
            end
        end
    end
    return best
end

local function equipBestTool(): Tool?
    if not State.Character or not State.Humanoid then return nil end
    local equipped = State.Character:FindFirstChildOfClass("Tool")
    if equipped then return equipped end

    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if not backpack then return nil end

    local preferred: Tool? = nil
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            local name = string.lower(item.Name)
            if string.find(name, "rod", 1, true) == nil
                and string.find(name, "fishing", 1, true) == nil
                and string.find(name, "pickaxe", 1, true) == nil then
                preferred = item
                break
            end
        end
    end

    if preferred then
        pcall(function()
            State.Humanoid:EquipTool(preferred)
        end)
    end
    return preferred
end

local function attack()
    if not Config.AutoAttack then return end
    local now = os.clock()
    if now - State.LastAttack < Config.AttackInterval then return end
    State.LastAttack = now

    local tool = equipBestTool()
    if tool then
        pcall(function() tool:Activate() end)
    end

    -- Some games use the default mouse button instead of Tool:Activate().
    -- Only send a normal primary-click input; no remote arguments are fabricated.
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)
end

local function moveToTarget(target: Model)
    if not State.Humanoid or not State.Root then return end
    local root = getRoot(target)
    if not root then return end

    local offset = State.Root.Position - root.Position
    local distance = offset.Magnitude
    if distance <= Config.AttackDistance then return end

    local direction = distance > 0.01 and offset.Unit or Vector3.new(0, 0, 1)
    local destination = root.Position + direction * Config.AttackDistance
    State.Humanoid:MoveTo(destination)
end

local function tryPrompt(prompt: ProximityPrompt)
    if not Config.AutoPrompts or not Config.AutoCollect then return end
    if not State.Root or not prompt.Enabled then return end
    local parent = prompt.Parent
    if not parent then return end

    local part: BasePart? = nil
    if parent:IsA("BasePart") then
        part = parent
    elseif parent:IsA("Attachment") and parent.Parent and parent.Parent:IsA("BasePart") then
        part = parent.Parent
    elseif parent:IsA("Model") then
        part = getRoot(parent)
    end
    if not part then return end

    if (part.Position - State.Root.Position).Magnitude <= Config.PromptRange then
        pcall(function()
            fireproximityprompt(prompt)
        end)
    end
end

local function collectNearby()
    if not Config.AutoCollect or not State.Root then return end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            local parent = obj.Parent
            local part: BasePart? = nil
            if parent and parent:IsA("BasePart") then
                part = parent
            elseif parent and parent:IsA("Attachment") and parent.Parent and parent.Parent:IsA("BasePart") then
                part = parent.Parent
            end
            if part and (part.Position - State.Root.Position).Magnitude <= Config.CollectRange then
                tryPrompt(obj)
            end
        end
    end
end

local function makeGui()
    local gui = Instance.new("ScreenGui")
    gui.Name = "MyAutoFarmGUI"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(300, 330)
    frame.Position = UDim2.new(0, 25, 0.5, -165)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 40)
    title.Position = UDim2.fromOffset(10, 5)
    title.BackgroundTransparency = 1
    title.Text = "MY AUTO FARM"
    title.TextSize = 20
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Parent = frame

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, -20, 0, 24)
    status.Position = UDim2.fromOffset(10, 43)
    status.BackgroundTransparency = 1
    status.TextSize = 13
    status.Font = Enum.Font.Gotham
    status.TextColor3 = Color3.fromRGB(180, 180, 180)
    status.Text = "Status: OFF | Target: none"
    status.Parent = frame

    local function button(text: string, y: number, callback: () -> ())
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, -20, 0, 36)
        b.Position = UDim2.fromOffset(10, y)
        b.BackgroundColor3 = Color3.fromRGB(38, 38, 46)
        b.BorderSizePixel = 0
        b.Text = text
        b.TextSize = 14
        b.Font = Enum.Font.GothamMedium
        b.TextColor3 = Color3.new(1, 1, 1)
        b.AutoButtonColor = true
        b.Parent = frame
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 7)
        c.Parent = b
        b.MouseButton1Click:Connect(callback)
        return b
    end

    local farmButton = button("AUTO FARM: OFF", 75, function()
        Config.Enabled = not Config.Enabled
        farmButton.Text = Config.Enabled and "AUTO FARM: ON" or "AUTO FARM: OFF"
    end)

    local attackButton = button("AUTO ATTACK: ON", 117, function()
        Config.AutoAttack = not Config.AutoAttack
        attackButton.Text = Config.AutoAttack and "AUTO ATTACK: ON" or "AUTO ATTACK: OFF"
    end)

    local collectButton = button("AUTO COLLECT: ON", 159, function()
        Config.AutoCollect = not Config.AutoCollect
        collectButton.Text = Config.AutoCollect and "AUTO COLLECT: ON" or "AUTO COLLECT: OFF"
    end)

    button("TARGET RANGE: 180", 201, function()
        Config.Range = Config.Range == 180 and 300 or Config.Range == 300 and 500 or 180
    end)

    button("ATTACK DISTANCE: 8", 243, function()
        Config.AttackDistance = Config.AttackDistance == 8 and 12 or Config.AttackDistance == 12 and 18 or 8
    end)

    button("CLOSE", 285, function()
        gui.Enabled = false
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            gui.Enabled = not gui.Enabled
        elseif input.KeyCode == Enum.KeyCode.F6 then
            Config.Enabled = not Config.Enabled
            farmButton.Text = Config.Enabled and "AUTO FARM: ON" or "AUTO FARM: OFF"
        end
    end)

    task.spawn(function()
        while gui.Parent do
            local targetName = State.Target and State.Target.Name or "none"
            status.Text = string.format("Status: %s | Target: %s", Config.Enabled and "ON" or "OFF", targetName)
            task.wait(0.15)
        end
    end)
end

makeGui()
characterReady()

RunService.Heartbeat:Connect(function()
    if not Config.Enabled then return end
    if not characterReady() then return end

    local target = State.Target
    if not target or not target.Parent or not isAliveModel(target) then
        State.Target = findTarget()
        target = State.Target
    end

    if target and State.Root then
        local root = getRoot(target)
        if root then
            local distance = (root.Position - State.Root.Position).Magnitude
            if distance > Config.Range then
                State.Target = findTarget()
            else
                moveToTarget(target)
                if distance <= Config.AttackDistance + 3 then
                    attack()
                end
            end
        else
            State.Target = nil
        end
    end

    collectNearby()
end)

print("[MyAutoFarm] Loaded. RightShift = show/hide, F6 = toggle farm.")
