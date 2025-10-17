local gui = Instance.new("ScreenGui")
gui.Name = "SimplePlayerCopy"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = gui


local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = frame


local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(1, -25, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.ZIndex = 2
closeBtn.Parent = frame

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "暗红玩家复制器"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.ZIndex = 2
title.Parent = frame

local search = Instance.new("TextBox")
search.Size = UDim2.new(0.9, 0, 0, 25)
search.Position = UDim2.new(0.05, 0, 0, 35)
search.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
search.TextColor3 = Color3.fromRGB(255, 255, 255)
search.PlaceholderText = "搜索玩家名字..."
search.TextScaled = true
search.ZIndex = 2
search.Parent = frame

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(0.9, 0, 0, 235)
scroll.Position = UDim2.new(0.05, 0, 0, 65)
scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scroll.ScrollBarThickness = 5
scroll.ZIndex = 2
scroll.Parent = frame


local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = title

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 6)
searchCorner.Parent = search

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 6)
scrollCorner.Parent = scroll

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeBtn

local function updateList(searchText)
    scroll:ClearAllChildren()
    local y = 0
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if string.lower(player.Name):find(string.lower(searchText or "")) then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 30)
            btn.Position = UDim2.new(0, 5, 0, y)
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Text = player.Name
            btn.TextScaled = true
            btn.ZIndex = 2
            btn.Parent = scroll
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = btn
            
            btn.MouseButton1Click:Connect(function()
                pcall(setclipboard, player.Name)
                btn.Text = "✓ 已复制!"
                btn.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
                wait(1)
                btn.Text = player.Name
                btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end)
            
            y = y + 35
        end
    end
    
    scroll.CanvasSize = UDim2.new(0, 0, 0, y)
end

search.Changed:Connect(function()
    updateList(search.Text)
end)

updateList("")


local dragging = false
local dragStart, startPos

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
    end
end)


closeBtn.MouseEnter:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
end)

closeBtn.MouseLeave:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
end)