-- 玩家名字复制脚本
local PlayerCopy = {}

-- 创建界面
function PlayerCopy:CreateGUI()
    -- 创建主界面
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "PlayerCopyGUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- 主框架
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 300, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- 标题
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Text = "玩家名字复制器"
    Title.TextScaled = true
    Title.Font = Enum.Font.GothamBold
    Title.Parent = MainFrame
    
    -- 关闭按钮
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 10)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Text = "X"
    CloseButton.TextScaled = true
    CloseButton.Parent = MainFrame
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- 搜索框
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(0.9, 0, 0, 40)
    SearchBox.Position = UDim2.new(0.05, 0, 0, 60)
    SearchBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBox.PlaceholderText = "搜索玩家..."
    SearchBox.Text = ""
    SearchBox.TextScaled = true
    SearchBox.Parent = MainFrame
    
    -- 玩家列表
    local PlayersFrame = Instance.new("ScrollingFrame")
    PlayersFrame.Size = UDim2.new(0.9, 0, 0, 280)
    PlayersFrame.Position = UDim2.new(0.05, 0, 0, 110)
    PlayersFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    PlayersFrame.ScrollBarThickness = 8
    PlayersFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    PlayersFrame.Parent = MainFrame
    
    -- 更新玩家列表
    function PlayerCopy:UpdatePlayerList(searchTerm)
        PlayersFrame:ClearAllChildren()
        
        local playerCount = 0
        local yOffset = 0
        
        for _, player in pairs(game.Players:GetPlayers()) do
            if string.find(string.lower(player.Name), string.lower(searchTerm or "")) then
                local PlayerButton = Instance.new("TextButton")
                PlayerButton.Size = UDim2.new(1, -10, 0, 40)
                PlayerButton.Position = UDim2.new(0, 5, 0, yOffset)
                PlayerButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                PlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                PlayerButton.Text = player.Name
                PlayerButton.TextScaled = true
                PlayerButton.Parent = PlayersFrame
                
                PlayerButton.MouseButton1Click:Connect(function()
                    -- 复制到剪贴板
                    pcall(function()
                        setclipboard(player.Name)
                    end)
                    
                    -- 显示复制成功消息
                    local Notification = Instance.new("TextLabel")
                    Notification.Size = UDim2.new(1, -20, 0, 30)
                    Notification.Position = UDim2.new(0, 10, 1, -40)
                    Notification.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
                    Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Notification.Text = "已复制: " .. player.Name
                    Notification.TextScaled = true
                    Notification.Parent = MainFrame
                    
                    wait(2)
                    Notification:Destroy()
                end)
                
                yOffset = yOffset + 45
                playerCount = playerCount + 1
            end
        end
        
        PlayersFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
    end
    
    -- 搜索功能
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        PlayerCopy:UpdatePlayerList(SearchBox.Text)
    end)
    
    -- 初始更新
    PlayerCopy:UpdatePlayerList("")
    
    -- 使窗口可拖动
    local dragging = false
    local dragInput, dragStart, startPos
    
    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    Title.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- 初始化
function PlayerCopy:Init()
    -- 创建命令来打开GUI
    game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- 延迟创建界面以确保一切加载完成
    wait(1)
    
    self:CreateGUI()
end

-- 启动脚本
PlayerCopy:Init()

return PlayerCopy