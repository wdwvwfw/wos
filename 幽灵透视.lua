local GhostESPEnabled = false  -- 用来追踪幽灵透视的状态

-- 创建一个开关按钮，允许玩家启用或禁用幽灵透视
local GhostESP = Function:CreateToggle({
    Name = "幽灵透视",
    CurrentValue = false,
    Flag = "ToggleGhostESP",
    Callback = function(Value)
        if Value then
            GhostESPEnabled = true
            EnableGhostESP()  -- 启用幽灵透视
        else
            GhostESPEnabled = false
            DisableGhostESP()  -- 禁用幽灵透视
        end
    end,
})

-- 启用幽灵透视：改变玩家和物体的透明度
function EnableGhostESP()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- 修改玩家自身的透明度，使其变得透明
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
            part.LocalTransparencyModifier = 0  -- 恢复不透明
        end
    end

    -- 恢复游戏世界中所有物体的透明度为不透明
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") then
            obj.LocalTransparencyModifier = 0  -- 恢复物体为不透明
            end
        end
    end
end
})