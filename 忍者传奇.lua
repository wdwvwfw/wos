local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/VeaMSRZK", true))()
 local Window =   OrionLib:MakeWindow({Name = "暗红血缝合王V2", HidePremium = false, SaveConfig = false, ConfigFolder = "rbxassetid://6026568198"}) 

 OrionLib:MakeNotification({ 
 Name = "暗红忍者传奇", 
 Content = "欢迎使用暗红忍者传奇", 
 Image = "rbxassetid://4483345998", 
 Time = 5 
 })

local Players = game:GetService("Players")
local XA = Players.LocalPlayer

 local LOL = Window:MakeTab({ 
 Name = "关于", 
 Icon = "rbxassetid://6026568198", 
 PremiumOnly = false 
 })

LOL:AddLabel("感谢清风、꒱等人")
LOL:AddLabel("当前服务器ID:" .. game.GameId .. ".")
LOL:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
LOL:AddParagraph("您的注入器:"," "..identifyexecutor().."")
LOL:AddLabel("作者：暗红血缝合王")
LOL:AddLabel("QQ：3920675298")
LOL:AddLabel("暗红脚本群号：942272935")
LOL:AddLabel("更新忍者传奇功能")

local Tab = Window:MakeTab({ 
 Name = "通用脚本", 
 Icon = "rbxassetid://10888331510", 
 PremiumOnly = false 
 })

Tab:AddButton({
        Name = "自动挥舞",
        Callback = function()
     if v or not ATHW then getgenv().autoswing = ATHW while true do if not getgenv().autoswing then return end for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:FindFirstChild("ninjitsuGain") then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v) break end end local A_1 = "swingKatana" local Event = game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(A_1) wait() end end
end)
          end    
})

Tab:AddButton({
        Name = "自动售卖",
        Callback = function()
     getgenv().autosell = ATSELL while true do if not getgenv().autosell then return end game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame wait(0.1) game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0) wait(0.1) end
end)
          end    
})

Tab:AddButton({
        Name = "自动购买排名",
        Callback = function()
     getgenv().autobuyranks = ATBP while true do if not getgenv().autobuyranks then return end local deku1 = "buyRank" for i = 1, #ranks do game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(deku1, ranks[i]) end wait(0.1) end
end)
          end    
})

Tab:AddButton({
        Name = "自动购买腰带",
        Callback = function()
     getgenv().autobuybelts = ATBYD while true do if not getgenv().autobuybelts then return end local A_1 = "buyAllBelts" local A_2 = "Inner Peace Island" local Event = game:GetService("Players").LocalPlayer.ninjaEvent Event:FireServer(A_1, A_2) wait(0.5) end
end)
          end    
})

Tab:AddButton({
        Name = "自动购买技能",
        Callback = function()
     getgenv().autobuyskills = ATB while true do if not getgenv().autobuyskills then return end local A_1 = "buyAllSkills" local A_2 = "Inner Peace Island" local Event = game:GetService("Players").LocalPlayer.ninjaEvent Event:FireServer(A_1, A_2) wait(0.5) end
end)
          end    
})

Tab:AddButton({
        Name = "自动购买剑",
        Callback = function()
     getgenv().autobuy = ATBS while true do if not getgenv().autobuy then return end local A_1 = "buyAllSwords" local A_2 = "Inner Peace Island" local Event = game:GetService("Players").LocalPlayer.ninjaEvent Event:FireServer(A_1, A_2) wait(0.5) end
end)
          end    
})

Tab:AddButton({
        Name = "解锁所有岛",
        Callback = function()
     for _, v in next, game.workspace.islandUnlockParts:GetChildren() do if v then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame wait(.5) end end
end)
          end    
})

local Section = Tab:AddSection({
        Name = "传送位置"
})

Tab:AddButton({
        Name = "传送到出生点",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665502548217773, 3.4228405952453613, 29.919952392578125)
end)
          end    
})

Tab:AddButton({
        Name = "传送到附魔岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.17238235473633, 766.1807861328125, -138.44842529296875)
end)
          end    
})

Tab:AddButton({
        Name = "传送到神秘岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)
end)
          end    
})

Tab:AddButton({
        Name = "传送到太空岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)
end)
          end    
})

Tab:AddButton({
        Name = "传送到冻土岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)
end)
          end    
})

Tab:AddButton({
        Name = "传送到永恒岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)
end)
          end    
})

Tab:AddButton({
        Name = "传送到沙暴岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)
end)
          end    
})

Tab:AddButton({
        Name = "传送到雷暴岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)
end)
          end    
})

Tab:AddButton({
        Name = "传送到远古炼狱岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)
end)
          end    
})

Tab:AddButton({
        Name = "传送到午夜暗影岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)
end)
          end    
})

Tab:AddButton({
        Name = "传送到神秘灵魂岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)
end)
          end    
})

Tab:AddButton({
        Name = "传送到冬季奇迹岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)
end)
          end    
})

Tab:AddButton({
        Name = "传送到黄金大师岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)
end)
          end    
})

Tab:AddButton({
        Name = "传送到龙传奇岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)
end)
          end    
})

Tab:AddButton({
        Name = "传送到赛博传奇岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)
end)
          end    
})

Tab:AddButton({
        Name = "传送到天岚超能岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)
end)
          end    
})

Tab:AddButton({
        Name = "传送到混沌传奇岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
end)
          end    
})

Tab:AddButton({
        Name = "传送到灵魂融合岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)
end)
          end    
})

Tab:AddButton({
        Name = "传送到黑暗元素岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)
end)
          end    
})

Tab:AddButton({
        Name = "传送到内心和平岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)
end)
          end    
})

Tab:AddButton({
        Name = "传送到炽烈漩涡岛",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)
end)
          end    
})

Tab:AddButton({
        Name = "传送到35倍金币区域",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.2938232421875, 91245.765625, 120.54232788085938)
end)
          end    
})

Tab:AddButton({
        Name = "传送到死亡宠物",
        Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4593.21337890625, 130.87181091308594, 1430.2239990234375)
end)
          end    
})