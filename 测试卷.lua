if not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("LanguageGui") then
    local screenGui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local Label = Instance.new("TextLabel")
    local Button1 = Instance.new("TextButton")
    local Button2 = Instance.new("TextButton")

    screenGui.Name = "LanguageGui"
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    frame.Size = UDim2.new(0, 0, 0, 0) 
    frame.Position = UDim2.new(0.3, 0, 0.35, 0)
    frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    frame:TweenSize(UDim2.new(0.4, 0, 0.3, 0), "In", "Quad", 1, true)

    Label.Text = "暗红脚本好用吗"
    Label.Size = UDim2.new(1, 0, 0.25, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 28
    Label.Font = Enum.Font.GothamBold
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.TextXAlignment = Enum.TextXAlignment.Center
    Label.Parent = frame

    Button1.Text = "好用"
    Button1.Size = UDim2.new(0.8, 0, 0.25, 0)
    Button1.Position = UDim2.new(0.1, 0, 0.35, 0)
    Button1.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button1.TextSize = 22
    Button1.Font = Enum.Font.Gotham
    Button1.TextYAlignment = Enum.TextYAlignment.Center
    Button1.BorderSizePixel = 0
    Button1.Parent = frame
    Button1.MouseButton1Click:Connect(function()
        frame:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.4, true)
        wait(0.4)
        screenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wdwvwfw/wos/refs/heads/main/%E6%9A%97%E7%BA%A2%E8%84%9A%E6%9C%AC%5B%E6%99%AE%5D.lua", true))()
    end)
    Button2.Text = "不好用"
    Button2.Size = UDim2.new(0.8, 0, 0.25, 0)
    Button2.Position = UDim2.new(0.1, 0, 0.65, 0)
    Button2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button2.TextSize = 22
    Button2.Font = Enum.Font.Gotham
    Button2.TextYAlignment = Enum.TextYAlignment.Center
    Button2.BorderSizePixel = 0
    Button2.Parent = frame
    Button2.MouseButton1Click:Connect(function()
        frame:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.4, true)
        wait(0.4)
        screenGui:Destroy()
        loadstring(game:HttpGet("https://github.com/xiaoSB33/M416/raw/main/jdknsn.lua", true))()
    end)
end