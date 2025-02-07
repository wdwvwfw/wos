local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/VeaMSRZK"))()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "Test"
LBL.TextColor3 = Color3.new(155, 155, 155)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("标准时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end

OrionLib:MakeNotification({
                    Name = "正在开启反挂机请稍等...",
                    Content = "正在开启中...",
                    Time = 2
                })
                
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)

local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)      

OrionLib:MakeNotification({
                    Name = "开启成功",
                    Content = "暗红脚本",
                    Time = 1
                })
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local Window = OrionLib:MakeWindow({Name = "喑红脚本", HidePremium = false, SaveConfig =true,IntroText="加载暗红脚本", ConfigFolder = "文件存放名"})
local Tab = Window:MakeTab({
	Name = "主页",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("作者:暗红血")
Tab:AddParagraph("暗红脚本多功能")

Tab:AddButton ({
	Name = "复制群号",
	Callback = function ()
	 setclipboard("942272935")
	 OrionLib:MakeNotification({
                    Name = "信息",
                    Content = "复制群号942272935",
                    Time = 2
                })
	end
})

local Tab = Window:MakeTab({
	Name = "通用",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddSlider({

	Name = "跳跃高度",

	Min = 50,

	Max = 200,

	Default = 50,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end    

})

Tab:AddSlider({

	Name = "速度",

	Min = 16,

	Max = 200,

	Default = 16,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end    

})

Tab:AddTextbox({

	Name = "移动速度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		
		OrionLib:MakeNotification({
                    Name = "成功设置速度:  "..game.Players.LocalPlayer.Character.Humanoid.WalkSpeed.."   |速度",
                    Content = "成功",
                    Time = 3
                })
	end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
		
		OrionLib:MakeNotification({
                    Name = "成功设置重力:  "..game.Workspace.Gravity.."   |重力",
                    Content = "成功",
                    Time = 3
                })
	end
})

Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

local Section = Tab:AddSection({
	Name = "以下为通用功能"
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

Tab:AddButton({
	Name = "隐形人",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/UniversalInvis.lua", true))()
  	end    
})

Tab:AddButton({
	Name = "吸块",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/07GGb4Dk"))()
  	end    
})

Tab:AddButton({
	Name = "管理员",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/MrWitzbold/Elysian-2.0-GUI/refs/heads/main/main.lua"))()
  	end    
})

Tab:AddButton({
	Name = "洞吸",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/wBsi24w3'))()
  	end    
})

Tab:AddButton({
	Name = "打玩家",
	Callback = function()
     loadstring(game:HttpGet("https://pastefy.app/wxVAgZpT/raw"))()
  	end    
})

Tab:AddButton({
	Name = "手动打飞玩家",
	Callback = function()
     loadstring(game:HttpGet("https://gist.githubusercontent.com/dark-modz/dcd8a483a1ba00904cc3261a8299cfa1/raw/9a60d9c7c1f4749e6be2c27e2cdb80dec5cd8f2a/clickfling",true))()
  	end    
})

Tab:AddButton({
	Name = "踢玩家",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/ZXAZyL3q",true))()
  	end    
})

Tab:AddButton({
	Name = "管理员2",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ZhenX21/Admin-Commands-Script/main/source"))()
  	end    
})

Tab:AddButton({
	Name = "炸弹💣",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/rouxhaver/scripts-3/main/Multi%20gear%20activator.lua"))()
  	end    
})

Tab:AddButton({
	Name = "禁止锤子",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/banhammerv3/refs/heads/main/BanHammerv3", true))()
  	end    
})

Tab:AddButton({
	Name = "掉东西",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/k778UByk"))()
  	end    
})

Tab:AddButton({
	Name = "吸玩家",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/wdwvwfw/wos/refs/heads/main/%E5%90%B8%E7%8E%A9%E5%AE%B6.lua"))()
  	end    
})

Tab:AddButton({
	Name = "管理员3",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/IvanTheProtogen/BackdoorLegacy/main/main.lua'))()
  	end    
})

Tab:AddButton({
	Name = "管理员4",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/main.lua"))()
  	end    
})

Tab:AddButton({
	Name = "传送玩家",
	Callback = function()
     loadstring(game:HttpGet("https://gist.githubusercontent.com/DagerFild/b4776075a0d26ef04394133ee6bd2081/raw/0ed51ac94057d2d9a9f00e1b037b9011c76ca54a/tpGUI", true))()
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

local Section = Tab:AddSection({
	Name = "DOORS脚本"
})
	
Tab:AddButton({
	Name = "DOORS1无敌强",
	Callback = function()
     loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
  	end    
})

Tab:AddButton({
	Name = "DOORS2人机脚本",
	Callback = function()
     loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/DF2RW.lua"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "监狱人生",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "监狱人生1",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/SpecialXyt/Prison-Life-/main/OrekiHub"))();
  	end    
})

Tab:AddButton({
	Name = "监狱人生2",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
  	end    
})

Tab:AddButton({
	Name = "监狱人生3",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/Gae7YC84"))();
  	end    
})

Tab:AddButton({
	Name = "监狱人生4多功能",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/IlikeyocutgHAH12/MoonUI-v10-/main/MoonUI%20v10'))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "Slap Battles",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "巴掌强大[英文]",
	Callback = function()
     loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "动感星期五",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "动感星期五1",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/Funky%20Friday/BotPlayer.lua"))();
  	end    
})

Tab:AddButton({
	Name = "动感星期五2",
	Callback = function()
     loadstring(game:HttpGet("https://scriptblox.com/raw/XMAS-Event-or-Funky-Friday-Auto-Player-Mobile-6721"))()
  	end    
})

Tab:AddButton({
	Name = "动感星期五3",
	Callback = function()
     loadstring(game:HttpGet("https://rawscripts.net/raw/Funky-Friday-Autoplay-WORKS-ON-MOBILE-22426"))()
  	end    
})

Tab:AddButton({
	Name = "动感星期五4",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua",true))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "刀刃球",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "刀刃球1无敌",
	Callback = function()
     loadstring(game:HttpGet("https://github.com/Stang001/pulawat/blob/main/BladeBall.lua?raw=true"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "内脏与黑火药",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "内脏与黑火药1[清风]",
	Callback = function()
     loadstring(game:HttpGet(("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\65\81\84\70\69\72\54\84"),true))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "最强战场",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]Tab:AddButton({
	Name = "最强战场",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()
  	end    
})

Tab:AddButton({
	Name = "最强战场虚空秒杀",
	Callback = function()
     loadstring(game:HttpGet("https://pastefy.app/REPoaFWC/raw",true))();
  	end    
})

Tab:AddButton({
	Name = "最强战场多功能",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
  	end    
})
