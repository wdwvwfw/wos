local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local gui = Instance.new("ScreenGui")
gui.Name = "MobilePlayerCopy"
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local viewportSize = workspace.CurrentCamera.ViewportSize


local mobileWindow = Instance.new("Frame")
mobileWindow.Size = UDim2.new(0, 300, 0, 400)
mobileWindow.Position = UDim2.new(0, 20, 0, 100)
mobileWindow.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mobileWindow.BorderSizePixel = 0
mobileWindow.ClipsDescendants = true
mobileWindow.Parent = gui


local windowCorner = Instance.new("UICorner")
windowCorner.CornerRadius = UDim.new(0, 15)
windowCorner.Parent = mobileWindow


local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 2
titleBar.Parent = mobileWindow

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleBar


local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -120, 1, 0)
titleText.Position = UDim2.new(0, 15, 0, 0)
titleText.BackgroundTransparency = 1
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Text = "🆔 玩家复制器"
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.ZIndex = 3
titleText.Parent = titleBar


local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
minimizeBtn.Position = UDim2.new(1, -85, 0, 7)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Text = "–"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.ZIndex = 3
minimizeBtn.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 6)
minimizeCorner.Parent = minimizeBtn


local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -45, 0, 7)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "×"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.ZIndex = 3
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn


local searchContainer = Instance.new("Frame")
searchContainer.Size = UDim2.new(1, -20, 0, 50)
searchContainer.Position = UDim2.new(0, 10, 0, 60)
searchContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
searchContainer.BorderSizePixel = 0
searchContainer.ZIndex = 2
searchContainer.Parent = mobileWindow

local searchContainerCorner = Instance.new("UICorner")
searchContainerCorner.CornerRadius = UDim.new(0, 10)
searchContainerCorner.Parent = searchContainer


local searchIcon = Instance.new("TextLabel")
searchIcon.Size = UDim2.new(0, 40, 1, 0)
searchIcon.Position = UDim2.new(0, 5, 0, 0)
searchIcon.BackgroundTransparency = 1
searchIcon.TextColor3 = Color3.fromRGB(180, 180, 180)
searchIcon.Text = "🔍"
searchIcon.Font = Enum.Font.Gotham
searchIcon.TextSize = 18
searchIcon.TextXAlignment = Enum.TextXAlignment.Center
searchIcon.ZIndex = 3
searchIcon.Parent = searchContainer


local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -50, 1, 0)
searchBox.Position = UDim2.new(0, 45, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "搜索玩家..."
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 16
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.ZIndex = 3
searchBox.Parent = searchContainer


local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 0, 260)
scrollFrame.Position = UDim2.new(0, 10, 0, 120)
scrollFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 8
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
scrollFrame.VerticalScrollBarInset = Enum.ScrollBarInset.Always
scrollFrame.Parent = mobileWindow

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 10)
scrollCorner.Parent = scrollFrame


local playerCount = Instance.new("TextLabel")
playerCount.Size = UDim2.new(1, -20, 0, 25)
playerCount.Position = UDim2.new(0, 10, 1, -30)
playerCount.BackgroundTransparency = 1
playerCount.TextColor3 = Color3.fromRGB(150, 150, 150)
playerCount.Text = "在线玩家: 0"
playerCount.Font = Enum.Font.Gotham
playerCount.TextSize = 14
playerCount.TextXAlignment = Enum.TextXAlignment.Left
playerCount.Parent = mobileWindow


local isDragging = false
local dragStart, startPos
local longPressTimer = 0
local isLongPressing = false


local function clampToScreen(position, size)
    local safeInset = GuiService:GetGuiInset()
    local x = math.clamp(position.X.Offset, 10, viewportSize.X - size.X.Offset - 10)
    local y = math.clamp(position.Y.Offset, 10 + safeInset.Y, viewportSize.Y - size.Y.Offset - 10)
    return UDim2.new(0, x, 0, y)
end


titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        longPressTimer = tick()
        isLongPressing = true
        dragStart = input.Position
        startPos = mobileWindow.Position
        
        
        titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        
        
        delay(0.5, function()
            if isLongPressing then
                isDragging = true
                mobileWindow.ZIndex = 20
            end
        end)
    end
end)


titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch and isDragging then
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
        mobileWindow.Position = clampToScreen(newPosition, mobileWindow.Size)
    end
end)


titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        isLongPressing = false
        isDragging = false
        mobileWindow.ZIndex = 1
        titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)


local function createPlayerButton(player, index)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 45)
    button.Position = UDim2.new(0, 5, 0, (index - 1) * 50)
    button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = player.Name
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = scrollFrame
    
    local buttonPadding = Instance.new("UIPadding")
    buttonPadding.PaddingLeft = UDim.new(0, 15)
    buttonPadding.Parent = button
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button
    
    
    button.MouseEnter:Connect(function()
        if button.Text == player.Name then
            button.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
        end
    end)
    
    button.MouseLeave:Connect(function()
        if button.Text == player.Name then
            button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        end
    end)
    
    
    button.MouseButton1Click:Connect(function()
        if setclipboard then
            pcall(setclipboard, player.Name)
            
            
            local originalText = button.Text
            local originalColor = button.BackgroundColor3
            
            button.Text = "✅ 已复制!"
            button.BackgroundColor3 = Color3.fromRGB(60, 160, 80)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            
            
            delay(3, function()
                if button and button.Parent then
                    button.Text = originalText
                    button.BackgroundColor3 = originalColor
                    button.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
            end)
        end
    end)
    
    return button
end


local function updatePlayerList(searchTerm)
    scrollFrame:ClearAllChildren()
    
    local players = Players:GetPlayers()
    local filteredPlayers = {}
    local searchLower = searchTerm and string.lower(searchTerm) or ""
    
    
    for _, player in ipairs(players) do
        if string.lower(player.Name):find(searchLower, 1, true) then
            table.insert(filteredPlayers, player)
        end
    end
    
    
    table.sort(filteredPlayers, function(a, b)
        return a.Name:lower() < b.Name:lower()
    end)
    
    
    for i, player in ipairs(filteredPlayers) do
        createPlayerButton(player, i)
    end
    
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #filteredPlayers * 50)
    playerCount.Text = "在线玩家: " .. #filteredPlayers
    
    
    if #filteredPlayers == 0 and searchTerm ~= "" then
        local noResults = Instance.new("TextLabel")
        noResults.Size = UDim2.new(1, 0, 0, 60)
        noResults.Position = UDim2.new(0, 0, 0, 0)
        noResults.BackgroundTransparency = 1
        noResults.TextColor3 = Color3.fromRGB(150, 150, 150)
        noResults.Text = "没有找到: \"" .. searchTerm .. "\""
        noResults.Font = Enum.Font.Gotham
        noResults.TextSize = 16
        noResults.Parent = scrollFrame
    end
end


searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    updatePlayerList(searchBox.Text)
end)


local isMinimized = false
local originalSize = mobileWindow.Size
local originalPosition = mobileWindow.Position

minimizeBtn.MouseButton1Click:Connect(function()
    if isMinimized then
        
        mobileWindow.Size = originalSize
        scrollFrame.Visible = true
        searchContainer.Visible = true
        playerCount.Visible = true
        minimizeBtn.Text = "–"
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    else
        
        originalSize = mobileWindow.Size
        originalPosition = mobileWindow.Position
        mobileWindow.Size = UDim2.new(0, 300, 0, 50) 
        scrollFrame.Visible = false
        searchContainer.Visible = false
        playerCount.Visible = false
        minimizeBtn.Text = "+"
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 140, 200)
    end
    isMinimized = not isMinimized
end)


minimizeBtn.MouseEnter:Connect(function()
    if isMinimized then
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 220)
    else
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    end
end)

minimizeBtn.MouseLeave:Connect(function()
    if isMinimized then
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 140, 200)
    else
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end
end)


closeBtn.MouseButton1Click:Connect(function()
    mobileWindow.Visible = false
end)

closeBtn.MouseEnter:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(240, 80, 80)
end)

closeBtn.MouseLeave:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
end)


Players.PlayerAdded:Connect(function(player)
    updatePlayerList(searchBox.Text)
end)

Players.PlayerRemoving:Connect(function(player)
    updatePlayerList(searchBox.Text)
end)


workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    viewportSize = workspace.CurrentCamera.ViewportSize
    mobileWindow.Position = clampToScreen(mobileWindow.Position, mobileWindow.Size)
end)


updatePlayerList("")

print("📱 手机版悬浮窗加载完成！")
print("✅ 右上角已添加最小化[-]和关闭[×]按钮")
print("📝 使用方法：")
print("1. 长按标题栏拖动移动")
print("2. 点击[-]最小化/还原窗口")
print("3. 点击[×]关闭窗口")
print("4. 点击玩家名字复制")