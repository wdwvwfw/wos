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
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
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
    FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "恐鬼症V3"; Text ="启动中"; Duration = 2; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "正在加载"; Text ="启动完毕"; Duration = 4; })

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/whenheer/hhi/refs/heads/main/%E5%A4%A7%E5%8F%B8%E9%A9%AC%E8%84%9A%E6%9C%AC%E4%B8%AD%E5%BF%83ui%E6%9C%80%E6%96%B0%E7%89%88.lua"))();        
local win = ui:new("恐鬼症V3")
--
local UITab1 = win:Tab("『信息』",'无')

local about = UITab1:section("『作者信息』",false)

about:Label("恐鬼症V3")
about:Label("作者：暗红血")
about:Label("感谢使用")

local about = UITab1:section("『玩家信息』",false)

about:Label("你现在的服务器id:"..game.GameId)

local UITab2 = win:Tab("『公告』",'7734068321')

local about = UITab2:section("『公告』",true)

about:Label("感谢支持大司马脚本中心的人")
about:Label("已修复完bug")

local UITab3 = win:Tab("『』",'7734068321')

local about = UITab3:section("『通用』",true)

