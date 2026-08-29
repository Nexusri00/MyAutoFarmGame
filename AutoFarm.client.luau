-- MyAutoFarmGame | Auto Farm
-- Target selector + vertical farming (Above / Down)
-- Fishing intentionally omitted.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VU = game:GetService("VirtualUser")
local LP = Players.LocalPlayer
if not LP then return end

local C = {
    Enabled = false, AutoAttack = true, AutoCollect = true, AutoEquip = true, AntiAFK = true,
    Range = 150, AttackDistance = 9, AttackDelay = .25,
    FarmMode = "Normal", -- Normal / Above / Down
    VerticalOffset = 12,
    SelectedTarget = "Nearest",
}
local S = {Char=nil,Hum=nil,Root=nil,Target=nil,LastAttack=0,Gui=nil,TargetLabel=nil,ModeLabel=nil,OffsetLabel=nil}

local function refresh()
    local c=LP.Character
    local h=c and c:FindFirstChildOfClass("Humanoid")
    local r=c and c:FindFirstChild("HumanoidRootPart")
    if not c or not h or not r or h.Health<=0 then return false end
    S.Char,S.Hum,S.Root=c,h,r
    return true
end
LP.CharacterAdded:Connect(function(c)
    S.Target=nil
    c:WaitForChild("Humanoid",10); c:WaitForChild("HumanoidRootPart",10)
    task.wait(.2); refresh()
end)

local function rootOf(m)
    if not m or not m:IsA("Model") then return nil end
    local r=m:FindFirstChild("HumanoidRootPart")
    if r and r:IsA("BasePart") then return r end
    if m.PrimaryPart then return m.PrimaryPart end
    return m:FindFirstChildWhichIsA("BasePart")
end
local function humOf(m) return m and m:FindFirstChildOfClass("Humanoid") end
local function alive(m)
    local h=humOf(m); return m and m:IsA("Model") and h and h.Health>0 and rootOf(m)~=nil
end
local function enemy(m)
    if not alive(m) or Players:GetPlayerFromCharacter(m) then return false end
    local n=string.lower(m.Name)
    if n=="camera" or n=="dummy" or n=="target" or n=="mannequin" then return false end
    if m:GetAttribute("Enemy")==true or m:GetAttribute("NPC")==true then return true end
    for _,w in ipairs({"enemy","npc","mob","monster","boss","bandit","demon","pirate","soldier"}) do
        if string.find(n,w,1,true) then return true end
    end
    return false
end

local function targets()
    local out={}
    if not S.Root then return out end
    for _,m in ipairs(workspace:GetDescendants()) do
        if m:IsA("Model") and enemy(m) and not table.find(out,m) then
            local r=rootOf(m)
            if r and (r.Position-S.Root.Position).Magnitude<=C.Range then table.insert(out,m) end
        end
    end
    table.sort(out,function(a,b)
        return (rootOf(a).Position-S.Root.Position).Magnitude < (rootOf(b).Position-S.Root.Position).Magnitude
    end)
    return out
end
local function findTarget()
    local list=targets()
    if #list==0 then return nil end
    if C.SelectedTarget~="Nearest" then
        local wanted=string.lower(C.SelectedTarget)
        for _,m in ipairs(list) do
            if string.lower(m.Name)==wanted then return m end
        end
    end
    return list[1]
end

local function equip()
    if not C.AutoEquip or not S.Hum then return nil end
    local t=S.Char and S.Char:FindFirstChildOfClass("Tool")
    if t then return t end
    local bp=LP:FindFirstChildOfClass("Backpack")
    if not bp then return nil end
    for _,x in ipairs(bp:GetChildren()) do
        if x:IsA("Tool") then
            local n=string.lower(x.Name)
            if not string.find(n,"rod",1,true) and not string.find(n,"fishing",1,true) then
                pcall(function() S.Hum:EquipTool(x) end); return x
            end
        end
    end
end
local function attack()
    if not C.AutoAttack or os.clock()-S.LastAttack<C.AttackDelay then return end
    S.LastAttack=os.clock()
    local t=equip()
    if t then pcall(function() t:Activate() end) end
    local vim=game:GetService("VirtualInputManager")
    if vim then pcall(function() vim:SendMouseButtonEvent(0,0,0,true,game,0); vim:SendMouseButtonEvent(0,0,0,false,game,0) end) end
end

-- Returns the position used for farming. Above = hover above target; Down = hover below target.
local function farmPosition(tr)
    local r=rootOf(tr)
    if not r then return nil end
    local offset=Vector3.new(0,0,0)
    if C.FarmMode=="Above" then offset=Vector3.new(0,C.VerticalOffset,0)
    elseif C.FarmMode=="Down" then offset=Vector3.new(0,-C.VerticalOffset,0) end
    if C.FarmMode=="Normal" then
        local d=S.Root.Position-r.Position
        local horizontal=Vector3.new(d.X,0,d.Z)
        if horizontal.Magnitude>.05 then horizontal=horizontal.Unit*C.AttackDistance else horizontal=Vector3.new(0,0,C.AttackDistance) end
        return r.Position+horizontal
    end
    return r.Position+offset
end
local function moveFarm(tr)
    if not S.Root or not S.Hum then return end
    local r=rootOf(tr); local p=farmPosition(tr)
    if not r or not p then return end
    S.Hum:MoveTo(p)
end

local function promptPart(p)
    local x=p.Parent
    if x and x:IsA("BasePart") then return x end
    if x and x:IsA("Attachment") and x.Parent:IsA("BasePart") then return x.Parent end
    if x and x:IsA("Model") then return rootOf(x) end
end
local lastPrompt=0
local function firePrompt(p)
    if not p.Enabled or os.clock()-lastPrompt<.3 then return end
    lastPrompt=os.clock()
    pcall(function()
        if fireproximityprompt then fireproximityprompt(p)
        else p:InputHoldBegin(); task.wait(math.max(p.HoldDuration,.05)); p:InputHoldEnd() end
    end)
end
local function collect()
    if not C.AutoCollect or not S.Root then return end
    for _,p in ipairs(workspace:GetDescendants()) do
        if p:IsA("ProximityPrompt") then
            local q=promptPart(p)
            local txt=string.lower(p.Name.." "..(p.ActionText or "").." "..(p.ObjectText or ""))
            if q and (q.Position-S.Root.Position).Magnitude<=30 and not string.find(txt,"sell",1,true) then firePrompt(p) end
        end
    end
end

local function antiAfk()
    if not C.AntiAFK then return end
    LP.Idled:Connect(function() pcall(function() VU:CaptureController(); VU:ClickButton2(Vector2.new()) end) end)
end

local function guiParent()
    local ok,h=pcall(function() return gethui and gethui() end)
    if ok and h then return h end
    return LP:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui")
end
local function corner(x) local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,8); c.Parent=x end
local function button(parent,text)
    local b=Instance.new("TextButton"); b.Size=UDim2.new(1,0,0,38); b.BackgroundColor3=Color3.fromRGB(35,35,44); b.BorderSizePixel=0; b.Font=Enum.Font.GothamMedium; b.TextSize=13; b.TextColor3=Color3.new(1,1,1); b.Text=text; b.Parent=parent; corner(b); return b
end
local function makeGui()
    local g=Instance.new("ScreenGui"); g.Name="MyAutoFarmGUI"; g.ResetOnSpawn=false; g.IgnoreGuiInset=true; g.Parent=guiParent(); S.Gui=g
    local f=Instance.new("Frame"); f.Size=UDim2.fromOffset(350,455); f.Position=UDim2.new(0,20,.5,-227); f.BackgroundColor3=Color3.fromRGB(18,18,23); f.BorderSizePixel=0; f.Parent=g; corner(f)
    local title=Instance.new("TextLabel"); title.Size=UDim2.new(1,-20,0,36); title.Position=UDim2.fromOffset(10,8); title.BackgroundTransparency=1; title.Text="MY AUTO FARM"; title.Font=Enum.Font.GothamBold; title.TextSize=20; title.TextColor3=Color3.new(1,1,1); title.TextXAlignment=Enum.TextXAlignment.Left; title.Parent=f
    local info=Instance.new("TextLabel"); info.Size=UDim2.new(1,-20,0,45); info.Position=UDim2.fromOffset(10,43); info.BackgroundTransparency=1; info.Font=Enum.Font.Gotham; info.TextSize=12; info.TextColor3=Color3.fromRGB(185,185,195); info.TextWrapped=true; info.TextXAlignment=Enum.TextXAlignment.Left; info.Parent=f
    local box=Instance.new("Frame"); box.Size=UDim2.new(1,-20,1,-96); box.Position=UDim2.fromOffset(10,92); box.BackgroundTransparency=1; box.Parent=f
    local lay=Instance.new("UIListLayout"); lay.Padding=UDim.new(0,6); lay.Parent=box
    local function tog(label,key)
        local b=button(box,label); local function upd() b.Text=label..": "..(C[key] and "ON" or "OFF") end; upd(); b.MouseButton1Click:Connect(function() C[key]=not C[key]; upd() end); return b
    end
    local farm=tog("AUTO FARM","Enabled")
    tog("AUTO ATTACK","AutoAttack"); tog("AUTO COLLECT","AutoCollect"); tog("AUTO EQUIP","AutoEquip")

    local targetBtn=button(box,"TARGET: NEAREST")
    targetBtn.MouseButton1Click:Connect(function()
        local list=targets()
        if #list==0 then C.SelectedTarget="Nearest"; targetBtn.Text="TARGET: NEAREST"; return end
        local names={"Nearest"}; for _,m in ipairs(list) do table.insert(names,m.Name) end
        local idx=table.find(names,C.SelectedTarget) or 1; idx=idx%#names+1; C.SelectedTarget=names[idx]; S.Target=nil; targetBtn.Text="TARGET: "..string.upper(C.SelectedTarget)
    end)

    local modeBtn=button(box,"FARM POSITION: NORMAL")
    modeBtn.MouseButton1Click:Connect(function()
        C.FarmMode=(C.FarmMode=="Normal" and "Above") or (C.FarmMode=="Above" and "Down") or "Normal"
        modeBtn.Text="FARM POSITION: "..string.upper(C.FarmMode)
    end)
    local off=button(box,"VERTICAL OFFSET: 12")
    off.MouseButton1Click:Connect(function()
        C.VerticalOffset=C.VerticalOffset+4; if C.VerticalOffset>40 then C.VerticalOffset=4 end
        off.Text="VERTICAL OFFSET: "..C.VerticalOffset
    end)
    local reset=button(box,"CLEAR TARGET / NEAREST")
    reset.MouseButton1Click:Connect(function() C.SelectedTarget="Nearest"; S.Target=nil; targetBtn.Text="TARGET: NEAREST" end)
    local hide=button(box,"HIDE UI  •  RightShift")
    hide.MouseButton1Click:Connect(function() g.Enabled=false end)
    S.TargetLabel=targetBtn; S.ModeLabel=modeBtn; S.OffsetLabel=off
    task.spawn(function()
        while g.Parent do
            info.Text=string.format("Farm: %s | Target: %s\nMode: %s | Offset: %d | F6 toggle | RightShift UI",C.Enabled and "ON" or "OFF",S.Target and S.Target.Name or "none",C.FarmMode,C.VerticalOffset)
            task.wait(.15)
        end
    end)
    local dragging=false; local ds,ps
    title.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true; ds=i.Position; ps=f.Position; i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then dragging=false end end) end end)
    UIS.InputChanged:Connect(function(i) if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then local d=i.Position-ds; f.Position=UDim2.new(ps.X.Scale,ps.X.Offset+d.X,ps.Y.Scale,ps.Y.Offset+d.Y) end end)
    UIS.InputBegan:Connect(function(i,p)
        if p then return end
        if i.KeyCode==Enum.KeyCode.RightShift then g.Enabled=not g.Enabled
        elseif i.KeyCode==Enum.KeyCode.F6 then C.Enabled=not C.Enabled; farm.Text="AUTO FARM: "..(C.Enabled and "ON" or "OFF") end
    end)
end

makeGui(); antiAfk(); refresh()
RunService.Heartbeat:Connect(function()
    if not refresh() or not C.Enabled then return end
    if not S.Target or not S.Target.Parent or not alive(S.Target) then S.Target=findTarget() end
    if not S.Target then return end
    local r=rootOf(S.Target)
    if r and (r.Position-S.Root.Position).Magnitude>C.Range then S.Target=findTarget(); return end
    moveFarm(S.Target)
    if r and (r.Position-S.Root.Position).Magnitude<=C.AttackDistance+4 then attack() end
    collect()
end)
