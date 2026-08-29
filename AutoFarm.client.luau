-- MyAutoFarmGame | Auto Farm
-- Target selector list + vertical farming (Above / Down)
-- Fishing intentionally omitted.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VU = game:GetService("VirtualUser")
local LP = Players.LocalPlayer
if not LP then return end

local C = {
    Enabled = false,
    AutoAttack = true,
    AutoCollect = true,
    AutoEquip = true,
    AntiAFK = true,
    Range = 150,
    AttackDistance = 9,
    AttackDelay = 0.25,
    FarmMode = "Normal",
    VerticalOffset = 12,
    SelectedTarget = "Nearest",
}

local S = {
    Char = nil,
    Hum = nil,
    Root = nil,
    Target = nil,
    LastAttack = 0,
    Gui = nil,
    TargetButton = nil,
    TargetList = nil,
    TargetCount = nil,
    ModeButton = nil,
    OffsetButton = nil,
    FarmButton = nil,
}

local function refresh()
    local c = LP.Character
    local h = c and c:FindFirstChildOfClass("Humanoid")
    local r = c and c:FindFirstChild("HumanoidRootPart")
    if not c or not h or not r or h.Health <= 0 then return false end
    S.Char, S.Hum, S.Root = c, h, r
    return true
end

LP.CharacterAdded:Connect(function(c)
    S.Target = nil
    c:WaitForChild("Humanoid", 10)
    c:WaitForChild("HumanoidRootPart", 10)
    task.wait(0.2)
    refresh()
end)

local function rootOf(m)
    if not m or not m:IsA("Model") then return nil end
    local r = m:FindFirstChild("HumanoidRootPart")
    if r and r:IsA("BasePart") then return r end
    if m.PrimaryPart then return m.PrimaryPart end
    return m:FindFirstChildWhichIsA("BasePart")
end

local function humOf(m)
    return m and m:FindFirstChildOfClass("Humanoid")
end

local function alive(m)
    local h = humOf(m)
    return m and m:IsA("Model") and h and h.Health > 0 and rootOf(m) ~= nil
end

local function enemy(m)
    if not alive(m) or Players:GetPlayerFromCharacter(m) then return false end
    local n = string.lower(m.Name)
    if n == "camera" or n == "dummy" or n == "target" or n == "mannequin" then return false end
    if m:GetAttribute("Enemy") == true or m:GetAttribute("NPC") == true then return true end
    for _, word in ipairs({"enemy", "npc", "mob", "monster", "boss", "bandit", "demon", "pirate", "soldier"}) do
        if string.find(n, word, 1, true) then return true end
    end
    return false
end

local function getTargets()
    local out = {}
    if not S.Root then return out end

    for _, m in ipairs(workspace:GetDescendants()) do
        if m:IsA("Model") and enemy(m) then
            local r = rootOf(m)
            if r and (r.Position - S.Root.Position).Magnitude <= C.Range then
                table.insert(out, m)
            end
        end
    end

    table.sort(out, function(a, b)
        local ar, br = rootOf(a), rootOf(b)
        if not ar then return false end
        if not br then return true end
        return (ar.Position - S.Root.Position).Magnitude < (br.Position - S.Root.Position).Magnitude
    end)

    return out
end

local function findTarget()
    local list = getTargets()
    if #list == 0 then return nil end

    if C.SelectedTarget ~= "Nearest" then
        for _, m in ipairs(list) do
            if m.Name == C.SelectedTarget then
                return m
            end
        end
    end

    return list[1]
end

local function equip()
    if not C.AutoEquip or not S.Hum then return nil end

    local equipped = S.Char and S.Char:FindFirstChildOfClass("Tool")
    if equipped then return equipped end

    local backpack = LP:FindFirstChildOfClass("Backpack")
    if not backpack then return nil end

    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local n = string.lower(tool.Name)
            if not string.find(n, "rod", 1, true) and not string.find(n, "fishing", 1, true) then
                pcall(function() S.Hum:EquipTool(tool) end)
                return tool
            end
        end
    end

    return nil
end

local function attack()
    if not C.AutoAttack or os.clock() - S.LastAttack < C.AttackDelay then return end
    S.LastAttack = os.clock()

    local tool = equip()
    if tool then
        pcall(function() tool:Activate() end)
    end

    local vim = game:GetService("VirtualInputManager")
    if vim then
        pcall(function()
            vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end)
    end
end

local function farmPosition(target)
    local r = rootOf(target)
    if not r or not S.Root then return nil end

    if C.FarmMode == "Above" then
        return r.Position + Vector3.new(0, C.VerticalOffset, 0)
    elseif C.FarmMode == "Down" then
        return r.Position + Vector3.new(0, -C.VerticalOffset, 0)
    end

    local d = S.Root.Position - r.Position
    local horizontal = Vector3.new(d.X, 0, d.Z)
    if horizontal.Magnitude > 0.05 then
        horizontal = horizontal.Unit * C.AttackDistance
    else
        horizontal = Vector3.new(0, 0, C.AttackDistance)
    end
    return r.Position + horizontal
end

local function moveFarm(target)
    if not S.Root or not S.Hum then return end
    local p = farmPosition(target)
    if p then S.Hum:MoveTo(p) end
end

local lastPrompt = 0
local function promptPart(p)
    local x = p.Parent
    if x and x:IsA("BasePart") then return x end
    if x and x:IsA("Attachment") and x.Parent:IsA("BasePart") then return x.Parent end
    if x and x:IsA("Model") then return rootOf(x) end
    return nil
end

local function firePrompt(p)
    if not p.Enabled or os.clock() - lastPrompt < 0.3 then return end
    lastPrompt = os.clock()
    pcall(function()
        if fireproximityprompt then
            fireproximityprompt(p)
        else
            p:InputHoldBegin()
            task.wait(math.max(p.HoldDuration, 0.05))
            p:InputHoldEnd()
        end
    end)
end

local function collect()
    if not C.AutoCollect or not S.Root then return end
    for _, p in ipairs(workspace:GetDescendants()) do
        if p:IsA("ProximityPrompt") then
            local q = promptPart(p)
            local txt = string.lower(p.Name .. " " .. (p.ActionText or "") .. " " .. (p.ObjectText or ""))
            if q and (q.Position - S.Root.Position).Magnitude <= 30 and not string.find(txt, "sell", 1, true) then
                firePrompt(p)
            end
        end
    end
end

local function guiParent()
    local ok, h = pcall(function()
        return gethui and gethui()
    end)
    if ok and h then return h end
    return LP:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui")
end

local function corner(x, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = x
end

local function stroke(x)
    local s = Instance.new("UIStroke")
    s.Thickness = 1
    s.Transparency = 0.65
    s.Parent = x
end

local function makeButton(parent, text, height)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, height or 36)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    b.BorderSizePixel = 0
    b.Font = Enum.Font.GothamMedium
    b.TextSize = 13
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Text = text
    b.AutoButtonColor = true
    b.Parent = parent
    corner(b)
    return b
end

local function clearTargetList()
    if not S.TargetList then return end
    for _, child in ipairs(S.TargetList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
end

local function selectTarget(name)
    C.SelectedTarget = name
    S.Target = nil
    if S.TargetButton then
        S.TargetButton.Text = "TARGET: " .. string.upper(name)
    end
end

local function rebuildTargetList()
    if not S.TargetList then return end
    clearTargetList()

    local list = getTargets()
    if S.TargetCount then
        S.TargetCount.Text = tostring(#list) .. " target(s) in range"
    end

    local nearest = makeButton(S.TargetList, "★  NEAREST TARGET", 30)
    nearest.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
    nearest.MouseButton1Click:Connect(function()
        selectTarget("Nearest")
        rebuildTargetList()
    end)

    if #list == 0 then
        local empty = Instance.new("TextLabel")
        empty.Size = UDim2.new(1, 0, 0, 32)
        empty.BackgroundTransparency = 1
        empty.Font = Enum.Font.Gotham
        empty.TextSize = 12
        empty.TextColor3 = Color3.fromRGB(155, 155, 165)
        empty.Text = "No targets detected in range"
        empty.Parent = S.TargetList
        return
    end

    local seen = {}
    for _, m in ipairs(list) do
        if not seen[m.Name] then
            seen[m.Name] = true
            local r = rootOf(m)
            local distance = r and math.floor((r.Position - S.Root.Position).Magnitude) or 0
            local b = makeButton(S.TargetList, m.Name .. "  •  " .. distance .. "m", 30)
            if m.Name == C.SelectedTarget then
                b.BackgroundColor3 = Color3.fromRGB(65, 65, 82)
            end
            b.MouseButton1Click:Connect(function()
                selectTarget(m.Name)
                rebuildTargetList()
            end)
        end
    end
end

local function makeGui()
    local old = guiParent():FindFirstChild("MyAutoFarmGUI")
    if old then old:Destroy() end

    local g = Instance.new("ScreenGui")
    g.Name = "MyAutoFarmGUI"
    g.ResetOnSpawn = false
    g.IgnoreGuiInset = true
    g.Parent = guiParent()
    S.Gui = g

    local f = Instance.new("Frame")
    f.Size = UDim2.fromOffset(370, 560)
    f.Position = UDim2.new(0, 20, 0.5, -280)
    f.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
    f.BorderSizePixel = 0
    f.Parent = g
    corner(f, 10)
    stroke(f)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 34)
    title.Position = UDim2.fromOffset(10, 7)
    title.BackgroundTransparency = 1
    title.Text = "MY AUTO FARM"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = f

    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, -20, 0, 38)
    info.Position = UDim2.fromOffset(10, 40)
    info.BackgroundTransparency = 1
    info.Font = Enum.Font.Gotham
    info.TextSize = 11
    info.TextColor3 = Color3.fromRGB(175, 175, 185)
    info.TextWrapped = true
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.Parent = f

    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, -20, 0, 198)
    box.Position = UDim2.fromOffset(10, 80)
    box.BackgroundTransparency = 1
    box.Parent = f

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.Parent = box

    local function toggle(label, key)
        local b = makeButton(box, "", 32)
        local function update()
            b.Text = label .. ": " .. (C[key] and "ON" or "OFF")
        end
        update()
        b.MouseButton1Click:Connect(function()
            C[key] = not C[key]
            update()
        end)
        return b
    end

    S.FarmButton = toggle("AUTO FARM", "Enabled")
    toggle("AUTO ATTACK", "AutoAttack")
    toggle("AUTO COLLECT", "AutoCollect")
    toggle("AUTO EQUIP", "AutoEquip")

    S.TargetButton = makeButton(box, "TARGET: NEAREST", 32)
    S.TargetButton.MouseButton1Click:Connect(function()
        if S.TargetList then
            S.TargetList.Visible = not S.TargetList.Visible
            if S.TargetList.Visible then rebuildTargetList() end
        end
    end)

    local targetHeader = Instance.new("TextLabel")
    targetHeader.Size = UDim2.new(1, 0, 0, 22)
    targetHeader.BackgroundTransparency = 1
    targetHeader.Font = Enum.Font.GothamBold
    targetHeader.TextSize = 11
    targetHeader.TextColor3 = Color3.fromRGB(205, 205, 215)
    targetHeader.Text = "TARGET SELECTOR"
    targetHeader.TextXAlignment = Enum.TextXAlignment.Left
    targetHeader.Parent = f
    targetHeader.Position = UDim2.fromOffset(10, 283)

    S.TargetCount = Instance.new("TextLabel")
    S.TargetCount.Size = UDim2.new(0, 150, 0, 20)
    S.TargetCount.Position = UDim2.new(1, -160, 0, 283)
    S.TargetCount.BackgroundTransparency = 1
    S.TargetCount.Font = Enum.Font.Gotham
    S.TargetCount.TextSize = 10
    S.TargetCount.TextColor3 = Color3.fromRGB(145, 145, 155)
    S.TargetCount.TextXAlignment = Enum.TextXAlignment.Right
    S.TargetCount.Parent = f

    local scroll = Instance.new("ScrollingFrame")
    scroll.Name = "TargetList"
    scroll.Size = UDim2.new(1, -20, 0, 145)
    scroll.Position = UDim2.fromOffset(10, 307)
    scroll.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 5
    scroll.CanvasSize = UDim2.new()
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.Visible = false
    scroll.Parent = f
    corner(scroll, 7)
    S.TargetList = scroll

    local targetLayout = Instance.new("UIListLayout")
    targetLayout.Padding = UDim.new(0, 4)
    targetLayout.Parent = scroll

    local targetPadding = Instance.new("UIPadding")
    targetPadding.PaddingTop = UDim.new(0, 5)
    targetPadding.PaddingBottom = UDim.new(0, 5)
    targetPadding.PaddingLeft = UDim.new(0, 5)
    targetPadding.PaddingRight = UDim.new(0, 5)
    targetPadding.Parent = scroll

    S.ModeButton = makeButton(f, "FARM POSITION: NORMAL", 32)
    S.ModeButton.Position = UDim2.fromOffset(10, 460)
    S.ModeButton.Size = UDim2.new(1, -20, 0, 32)
    S.ModeButton.MouseButton1Click:Connect(function()
        C.FarmMode = C.FarmMode == "Normal" and "Above" or C.FarmMode == "Above" and "Down" or "Normal"
        S.ModeButton.Text = "FARM POSITION: " .. string.upper(C.FarmMode)
    end)

    S.OffsetButton = makeButton(f, "VERTICAL OFFSET: 12", 32)
    S.OffsetButton.Position = UDim2.fromOffset(10, 497)
    S.OffsetButton.Size = UDim2.new(1, -20, 0, 32)
    S.OffsetButton.MouseButton1Click:Connect(function()
        C.VerticalOffset += 4
        if C.VerticalOffset > 40 then C.VerticalOffset = 4 end
        S.OffsetButton.Text = "VERTICAL OFFSET: " .. C.VerticalOffset
    end)

    local reset = makeButton(f, "CLEAR TARGET / USE NEAREST", 28)
    reset.Position = UDim2.fromOffset(10, 534)
    reset.Size = UDim2.new(1, -20, 0, 20)
    reset.TextSize = 10
    reset.MouseButton1Click:Connect(function()
        selectTarget("Nearest")
        if S.TargetList then S.TargetList.Visible = false end
    end)

    task.spawn(function()
        while g.Parent do
            info.Text = string.format(
                "Farm: %s  |  Current: %s\nMode: %s  |  Offset: %d  |  F6 farm / RightShift UI",
                C.Enabled and "ON" or "OFF",
                S.Target and S.Target.Name or "none",
                C.FarmMode,
                C.VerticalOffset
            )
            task.wait(0.15)
        end
    end)

    local dragging = false
    local dragStart, startPos
    title.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = i.Position
            startPos = f.Position
            i.Changed:Connect(function()
                if i.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local d = i.Position - dragStart
            f.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)

    UIS.InputBegan:Connect(function(i, processed)
        if processed then return end
        if i.KeyCode == Enum.KeyCode.RightShift then
            g.Enabled = not g.Enabled
        elseif i.KeyCode == Enum.KeyCode.F6 then
            C.Enabled = not C.Enabled
            if S.FarmButton then
                S.FarmButton.Text = "AUTO FARM: " .. (C.Enabled and "ON" or "OFF")
            end
        end
    end)

    rebuildTargetList()
end

local function antiAfk()
    if not C.AntiAFK then return end
    LP.Idled:Connect(function()
        pcall(function()
            VU:CaptureController()
            VU:ClickButton2(Vector2.new())
        end)
    end)
end

makeGui()
antiAfk()
refresh()

local lastTargetRefresh = 0
RunService.Heartbeat:Connect(function()
    if not refresh() then return end

    if os.clock() - lastTargetRefresh >= 1 then
        lastTargetRefresh = os.clock()
        if S.TargetList and S.TargetList.Visible then
            rebuildTargetList()
        end
    end

    if not C.Enabled then return end

    if not S.Target or not S.Target.Parent or not alive(S.Target) then
        S.Target = findTarget()
    end

    if not S.Target then return end

    local r = rootOf(S.Target)
    if not r then
        S.Target = nil
        return
    end

    if (r.Position - S.Root.Position).Magnitude > C.Range then
        S.Target = findTarget()
        return
    end

    moveFarm(S.Target)

    if (r.Position - S.Root.Position).Magnitude <= C.AttackDistance + 4 then
        attack()
    end

    collect()
end)
