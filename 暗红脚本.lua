--[[
你好呀(✪▽✪)
]]


local Player = Window:CreateTab("防巡查(玩家加入记录)", "triangle-alert")
--初始化防巡查
local function onPlayerJoin(player)
    local playerName = "Name:" .. player.Name
	local playerId = "ID:" .. player.UserId
    local PlayersTitie = Player:CreateParagraph({Title = playerName, Content = playerId})
	Rayfield:Notify({
        Title = "玩家加入记录",
        Content = "有新玩家加入了本局，疑似巡查请注意演戏",
        Duration = 5,
        Image = "triangle-alert",
    })
end
Players.PlayerAdded:Connect(onPlayerJoin)
--初始化防巡查