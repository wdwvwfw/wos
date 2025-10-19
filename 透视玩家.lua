local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer


if not localPlayer then
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    localPlayer = Players.LocalPlayer
end


local ESP = {
    Enabled = true,
    Boxes = true,
    Skeletons = true,
    Tracers = true,
    Names = true,
    TeamCheck = false
}


local ESPItems = {}


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ESPGui"
ScreenGui.Parent = localPlayer:WaitForChild("PlayerGui")


local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 350)
MainFrame.Position = UDim2.new(0, 50, 0, 50)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui


local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ESP控制面板"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 16
TitleLabel.Parent = TitleBar


local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -70, 0.5, -15)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Text = "_"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 18
MinimizeBtn.ZIndex = 2
MinimizeBtn.Parent = TitleBar


local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.ZIndex = 2
CloseBtn.Parent = TitleBar


local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -40)
ContentFrame.Position = UDim2.new(0, 0, 0, 40)
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame


local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -10, 1, -10)
ScrollFrame.Position = UDim2.new(0, 5, 0, 5)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.Parent = ContentFrame


local function SetupButtonHover(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = hoverColor
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = normalColor
    end)
end


SetupButtonHover(MinimizeBtn, Color3.fromRGB(60, 60, 60), Color3.fromRGB(80, 80, 80))
SetupButtonHover(CloseBtn, Color3.fromRGB(200, 60, 60), Color3.fromRGB(220, 80, 80))


local function CreateToggle(name, settingKey, yPosition)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, 0, 0, 40)
    toggleFrame.Position = UDim2.new(0, 0, 0, yPosition)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = ScrollFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.Parent = toggleFrame
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.25, 0, 0.6, 0)
    button.Position = UDim2.new(0.72, 0, 0.2, 0)
    button.BackgroundColor3 = ESP[settingKey] and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
    button.BorderSizePixel = 0
    button.Text = ESP[settingKey] and "开启" or "关闭"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 12
    button.Parent = toggleFrame
    
    
    SetupButtonHover(button, button.BackgroundColor3, Color3.fromRGB(100, 100, 100))
    
    button.MouseButton1Click:Connect(function()
        ESP[settingKey] = not ESP[settingKey]
        button.BackgroundColor3 = ESP[settingKey] and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
        button.Text = ESP[settingKey] and "开启" or "关闭"
        
        
        if settingKey == "Enabled" then
            if not ESP.Enabled then
                ClearAllESP()
            else
                UpdateAllPlayers()
            end
        else
            UpdateAllPlayers()
        end
    end)
    
    return 40
end


local yPos = 0
yPos = yPos + CreateToggle("ESP总开关", "Enabled", yPos)
yPos = yPos + CreateToggle("显示方框", "Boxes", yPos)
yPos = yPos + CreateToggle("显示骨骼", "Skeletons", yPos)
yPos = yPos + CreateToggle("显示射线", "Tracers", yPos)
yPos = yPos + CreateToggle("显示名字", "Names", yPos)
yPos = yPos + CreateToggle("队伍检查", "TeamCheck", yPos)


ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)


local isMinimized = false

MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        ContentFrame.Visible = false
        MainFrame.Size = UDim2.new(0, 250, 0, 40)
        MinimizeBtn.Text = "+"
    else
        ContentFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 250, 0, 350)
        MinimizeBtn.Text = "_"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    ClearAllESP()
end)


function CreateESP(player)
    if ESPItems[player] then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local espItem = {
        Player = player,
        Box = nil,
        Tracer = nil,
        NameLabel = nil,
        Skeleton = {}
    }
    
    
    if ESP.Boxes then
        local box = Instance.new("BoxHandleAdornment")
        box.Name = "ESPBox"
        box.Adornee = humanoidRootPart
        box.AlwaysOnTop = true
        box.ZIndex = 5
        box.Size = humanoidRootPart.Size + Vector3.new(0.5, 0.5, 0.5)
        box.Color3 = GetPlayerColor(player)
        box.Transparency = 0.3
        box.Parent = humanoidRootPart
        espItem.Box = box
    end
    
    
    if ESP.Tracers then
        local tracer = Instance.new("Frame")
        tracer.Name = "ESPTracer"
        tracer.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        tracer.BorderSizePixel = 0
        tracer.Size = UDim2.new(0, 2, 0, 500)
        tracer.AnchorPoint = Vector2.new(0.5, 1)
        tracer.Parent = ScreenGui
        espItem.Tracer = tracer
    end
    
    
    if ESP.Names then
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "ESPName"
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextSize = 16
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Size = UDim2.new(0, 200, 0, 20)
        nameLabel.Parent = ScreenGui
        espItem.NameLabel = nameLabel
    end
    
    
    if ESP.Skeletons then
        CreateSkeleton(character, espItem)
    end
    
    ESPItems[player] = espItem
end

function CreateSkeleton(character, espItem)
    local bones = {
        {"Head", "UpperTorso"},
        {"UpperTorso", "LowerTorso"},
        {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"},
        {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"},
        {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"},
        {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"}
    }
    
    for _, bonePair in pairs(bones) do
        local part1 = character:FindFirstChild(bonePair[1])
        local part2 = character:FindFirstChild(bonePair[2])
        
        if part1 and part2 then
            local line = Instance.new("Frame")
            line.Name = "ESPSkeleton"
            line.BackgroundColor3 = Color3.fromRGB(0, 191, 255)
            line.BorderSizePixel = 0
            line.Size = UDim2.new(0, 2, 0, 2)
            line.Parent = ScreenGui
            table.insert(espItem.Skeleton, line)
        end
    end
end

function GetPlayerColor(player)
    if ESP.TeamCheck and player.Team and localPlayer.Team then
        if player.Team == localPlayer.Team then
            return Color3.fromRGB(0, 255, 0) 
        else
            return Color3.fromRGB(255, 0, 0) 
        end
    end
    return Color3.fromRGB(0, 255, 0) 
end

function UpdateESP()
    for player, espItem in pairs(ESPItems) do
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local rootPart = character.HumanoidRootPart
            local position, onScreen = workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)
            
            if onScreen then
                local color = GetPlayerColor(player)
                
                
                if espItem.Box then
                    espItem.Box.Color3 = color
                end
                
                -
                if espItem.Tracer then
                    espItem.Tracer.Visible = true
                    espItem.Tracer.Position = UDim2.new(0, position.X, 1, 0)
                    espItem.Tracer.BackgroundColor3 = color
                    local distance = (workspace.CurrentCamera.CFrame.Position - rootPart.Position).Magnitude
                    espItem.Tracer.Size = UDim2.new(0, 2, 0, math.min(500, distance * 2))
                end
                
               
                if espItem.NameLabel then
                    espItem.NameLabel.Visible = true
                    espItem.NameLabel.Position = UDim2.new(0, position.X, 0, position.Y - 40)
                    espItem.NameLabel.TextColor3 = color
                    espItem.NameLabel.Text = player.Name .. " (" .. math.floor((workspace.CurrentCamera.CFrame.Position - rootPart.Position).Magnitude) .. ")"
                end
                
            else
                
                if espItem.Tracer then espItem.Tracer.Visible = false end
                if espItem.NameLabel then espItem.NameLabel.Visible = false end
            end
        end
    end
end

function ClearAllESP()
    for player, espItem in pairs(ESPItems) do
        if espItem.Box then espItem.Box:Destroy() end
        if espItem.Tracer then espItem.Tracer:Destroy() end
        if espItem.NameLabel then espItem.NameLabel:Destroy() end
        for _, bone in pairs(espItem.Skeleton) do
            bone:Destroy()
        end
    end
    ESPItems = {}
end

function UpdateAllPlayers()
    ClearAllESP()
    if not ESP.Enabled then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            if player.Character then
                CreateESP(player)
            end
          
            player.CharacterAdded:Connect(function()
                wait(1)
                if ESP.Enabled then
                    CreateESP(player)
                end
            end)
        end
    end
end


Players.PlayerAdded:Connect(function(player)
    wait(2)
    if ESP.Enabled then
        CreateESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPItems[player] then
        local espItem = ESPItems[player]
        if espItem.Box then espItem.Box:Destroy() end
        if espItem.Tracer then espItem.Tracer:Destroy() end
        if espItem.NameLabel then espItem.NameLabel:Destroy() end
        for _, bone in pairs(espItem.Skeleton) do
            bone:Destroy()
        end
        ESPItems[player] = nil
    end
end)


RunService.RenderStepped:Connect(UpdateESP)


wait(3)
UpdateAllPlayers()

print("✅ ESP脚本完全加载！")
print("🎯 功能：悬浮球 + 最小化 + 关闭 + 所有ESP功能")
print("📍 移动：拖动标题栏")
print("🔧 控制：点击按钮开关功能")