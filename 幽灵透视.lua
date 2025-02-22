local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/VeaMSRZK", true))()
 local Window =   OrionLib:MakeWindow({Name = "暗红血缝合王V2", HidePremium = false, SaveConfig = false, ConfigFolder = "rbxassetid://6026568198"}) 

 OrionLib:MakeNotification({ 
 Name = "暗红血缝合王V2", 
 Content = "欢迎使用暗红血缝合王！", 
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
LOL:AddLabel("感谢清风、꒱等人")
LOL:AddLabel("感谢清风、꒱等人")
LOL:AddLabel("当前服务器ID:" .. game.GameId .. ".")
LOL:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
LOL:AddParagraph("您的注入器:"," "..identifyexecutor().."")
LOL:AddLabel("作者：暗红血缝合王")
LOL:AddLabel("QQ：3920675298")
LOL:AddLabel("暗红血群号：942272935")

local Tab = Window:MakeTab({ 
 Name = "通用脚本", 
 Icon = "rbxassetid://10888331510", 
 PremiumOnly = false 
 })

Tab:AddButton({
	Name = "幽灵透视",
	Callback = function()
     for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.LocalTransparencyModifier = 0.5  -- 设置角色部件为半透明
        end
    end

    -- 修改游戏世界中所有物体的透明度，使玩家能看到墙后和隐藏的物体
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") then
            obj.LocalTransparencyModifier = 0.5  -- 使物体半透明
        end
    end
end

-- 禁用幽灵透视：恢复所有物体和玩家的透明度
function DisableGhostESP()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    -- 恢复玩家的透明度为不透明
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.LocalTransparencyModifier = 1  -- 恢复不透明
        end
    end

    -- 恢复游戏世界中所有物体的透明度为不透明
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") then
            obj.LocalTransparencyModifier = 1  -- 恢复物体为不透明
        end
    end
end
  	end    
})

  	