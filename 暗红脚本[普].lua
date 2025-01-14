local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "暗红脚本", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
	Name = "人物脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = "Section"
})

--[[
Name = <string> - The name of the section.
]]

OrionLib:MakeNotification({
	Name = "暗红脚本",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]

Tab:AddTextbox({
	Name = "跳跃",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Tab:AddTextbox({
	Name = "速度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

Tab:AddTextbox({
	Name = "重力",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddTextbox({
	Name = "血量设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

Tab:AddToggle({
	Name = "无限跳跳",
	Default = false,
	Callback = function(s)
		getgenv().InfJ = s
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfJ == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
	end
})

Tab:AddButton({
	Name = "飞行V3",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/AjDmq385'))()
  	end    
})

Tab:AddButton({
	Name = "甩飞别人",
	Callback = function()
     local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "暗红脚本",
    Text = "执行成功",
    Duration = 3, 
})
     loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
  	end    
})

Tab:AddButton({
	Name = "透视脚本",
	Callback = function()
     if _G.Reantheajfdfjdgse then
    return
end

_G.Reantheajfdfjdgse = "susan"

local coregui = game:GetService("CoreGui")
local players = game:GetService("Players")
local plr = players.LocalPlayer

 local highlights = {}

function esp(target, color)
    pcall(function()
        if target.Character then
            if not highlights[target] then
                local highlight = Instance.new("Highlight", coregui)
                highlight.Name = target.Name
                highlight.Adornee = target.Character
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor = color
                highlights[target] = highlight
            else
                highlights[target].FillColor = color
            end
        end
    end)
      end

players.PlayerAdded:Connect(function(v)
    v.CharacterAdded:Connect(function()
        esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
    end)
end)

players.PlayerRemoving:Connect(function(v)
    if highlights[v] then
        highlights[v]:Destroy()
        highlights[v] = nil
    end
end)

for i, v in pairs(players:GetPlayers()) do
    if v ~= plr then
        local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
        v.CharacterAdded:Connect(function()
            local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
            esp(v, color)
        end)
        
        esp(v, color)
    end
end

while task.wait() do
    for i, v in pairs(highlights) do
        local color = _G.UseTeamColor and i.TeamColor.Color or ((plr.TeamColor == i.TeamColor) and _G.FriendColor or _G.EnemyColor)
        v.FillColor = color
    end
end
  	end    
})

Tab:AddButton({
	Name = "工具点击传送",
	Callback = function()
     mouse = game.Players.LocalPlayer:GetMouse()
                tool = Instance.new("Tool")
                tool.RequiresHandle = false
                tool.Name = "点击传送"
                tool.Activated:connect(function()
                local pos = mouse.Hit+Vector3.new(0,2.5,0)
                pos = CFrame.new(pos.X,pos.Y,pos.Z)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
                end)
                tool.Parent = game.Players.LocalPlayer.Backpack
  	end    
})

Tab:AddButton({
	Name = "工具包",
	Callback = function()
     loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
  	end    
})

Tab:AddButton({
	Name = "人物无敌",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
	end    
})

Tab:AddButton({
	Name = "键盘脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})



--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Tab = Window:MakeTab({
	Name = "中心脚本其他",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "导管中心",
	Callback = function()
     loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
  	end    
})

Tab:AddButton({
	Name = "龙脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/nahida-cn/Roblox/main/long"))()
  	end    
})

Tab:AddButton({
	Name = "禁漫脚本",
	Callback = function()
     getgenv().LS="禁漫中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ng/main/jmlllllllIIIIlllllII.lua"))()
  	end    
})

Tab:AddButton({
	Name = "岁脚本",
	Callback = function()
     loadstring(game:HelpGet("/104/116/116/112/115/58/47/47/112/97/115/116/101/98/105/110/46/99/111/109/47/114/97/119/47/112/103/76/67/122/87/85/113"))()
  	end    
})

Tab:AddButton({
	Name = "清风脚本",
	Callback = function()
     loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,116,53,87,75,53,72,48,72})end)())))("青风脚本")
  	end    
})

Tab:AddButton({
	Name = "sF脚本",
	Callback = function()
     SF_V7 = "作者_神罚"SheFa = "QQ群637340150"loadstring(game:HttpGet(('https://raw.githubusercontent.com/WDQi/SF/main/%E7%9C%8B%E4%BD%A0M.txt')))()
  	end    
})

Tab:AddButton({
	Name = "皮脚本",
	Callback = function()
     getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
  	end    
})

Tab:AddButton({
	Name = "猫脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))
  	end    
})

Tab:AddButton({
	Name = "落叶脚本",
	Callback = function()
     getgenv().LS="落叶中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
  	end    
})

Tab:AddButton({
	Name = "绿脚本",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/Esw6YQKR"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "超强黑客",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "吸方块",
	Callback = function()
     loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty11.lua"))()
  	end    
})

Tab:AddButton({
	Name = "伪装人玩家",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Copy%20Avatar'))()
  	end    
})

Tab:AddButton({
	Name = "超强黑客",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
  	end    
})

Tab:AddButton({
	Name = "爬楼",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Climb%20Walls'))()
  	end    
})

Tab:AddButton({
	Name = "SPC-096",
	Callback = function()
     loadstring(game:HttpGet("https://pastefy.app/YsJgITXR/raw"))()
  	end    
})

    local Tab = Window:MakeTab({
	Name = "伐木大享",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "伐木大享高级版",
	Callback = function()
     loadstring(Game:HttpGet("https://pastebin.com/raw/ALJyH1LN"))("Butter")
  	end    
})

Tab:AddButton({
	Name = "伐木大享低级版",
	Callback = function()
     loadstring(Game:HttpGet("https://pastebin.com/raw/xHqetsXP"))("Real")
  	end    
})

local Tab = Window:MakeTab({
	Name = "彩虹朋友",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "彩虹朋友1",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/Sempiller/RainbowTool/main/Turkish.lua'))();
  	end    
})

Tab:AddButton({
	Name = "彩虹朋友2",
	Callback = function()
     --彩虹朋友V3
loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "宠物模拟器",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "宠物模拟器1",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/tWGxhNq0"))()
  	end    
})

 Tab:AddButton({
	Name = "宠物模拟器2",
	Callback = function()
     loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/jmesfo0/RobloxScripts/main/psx-jmes.lua"))()
  	end    
})

Tab:AddButton({
	Name = "宠物模拟器3",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
  	end    
})

Tab:AddButton({
	Name = "宠物模拟器4",
	Callback = function()
     loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
  	end    
})

local Tab = Window:MakeTab({
	Name = "DOORS",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

    Tab:AddButton({
	Name = "rooms自动行走",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/DaRealGeo/roblox/master/rooms-autowalk"))()
  	end    
})

Tab:AddButton({
	Name = "十字架",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))();
  	end    
})

Tab:AddButton({
	Name = "夜视仪",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/4Vsv1Xwn"))()
  	end    
})

Tab:AddButton({
	Name = "神圣炸弹",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
  	end    
})

Tab:AddButton({
	Name = "吸铁石",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
  	end    
})

    Tab:AddButton({
	Name = "剪刀",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/v2yEJYmu"))()
  	end    
})
  
